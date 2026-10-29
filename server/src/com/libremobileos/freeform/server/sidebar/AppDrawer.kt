package com.libremobileos.freeform.server.sidebar

import android.content.Context
import android.content.Intent
import android.graphics.PixelFormat
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.os.HandlerThread
import android.util.Slog
import android.view.Gravity
import android.view.HapticFeedbackConstants
import android.view.MotionEvent
import android.view.View
import android.view.ViewGroup
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.GridLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import kotlin.math.max
import kotlin.math.roundToInt

/**
 * "All apps" picker as a system overlay (no activity start, so it opens instantly).
 * App list + the whole view tree are cached; they are rebuilt only when packages / config change.
 * Tap = open in floating window, long-press = pin / unpin in the sidebar.
 */
class AppDrawer(
    private val context: Context,
    private val handler: Handler,
    private val cfg: SidebarConfig,
    private val launch: (pkg: String, activity: String) -> Unit,
    private val onPinnedChanged: () -> Unit,
    private val onLoaded: () -> Unit
) {
    private class App(val label: String, val icon: Drawable, val pkg: String, val activity: String) {
        val key get() = "$pkg/$activity"
    }

    private val wm = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
    private val worker = HandlerThread("lmo-appdrawer", android.os.Process.THREAD_PRIORITY_BACKGROUND).apply { start() }
    private val bg = Handler(worker.looper)

    @Volatile private var apps: List<App>? = null
    private var content: View? = null
    private val cells = HashMap<String, View>()
    private var shown: View? = null
    private var loading = false

    /** Load the app list in the background and pre-build the view. */
    fun invalidate() {
        content = null
        cells.clear()
        apps = null
        prepare()
    }

    fun prepare() {
        if (loading || apps != null) { if (apps != null && content == null) handler.post { buildView() }; return }
        loading = true
        bg.post {
            val pm = context.packageManager
            val q = Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
            val list = ArrayList<App>()
            runCatching {
                for (ri in pm.queryIntentActivities(q, 0)) {
                    val ai = ri.activityInfo
                    if (ai.packageName == LAUNCHER_PKG) continue
                    list += App(ri.loadLabel(pm).toString(), ri.loadIcon(pm), ai.packageName, ai.name)
                }
            }.onFailure { Slog.e(TAG, "load apps", it) }
            list.sortBy { it.label.lowercase() }
            apps = list
            loading = false
            handler.post { buildView(); onLoaded() }
        }
    }

    /** label + icon from the background-loaded cache (null until loaded) */
    fun lookup(key: String): Pair<String, Drawable>? {
        val a = apps?.firstOrNull { it.key == key } ?: return null
        return a.label to (a.icon.constantState?.newDrawable()?.mutate() ?: a.icon)
    }

    private fun dp(v: Int) = (v * context.resources.displayMetrics.density).roundToInt()
    private fun screenW() = context.resources.displayMetrics.widthPixels
    private fun screenH() = context.resources.displayMetrics.heightPixels

    private fun buildView() {
        val list = apps ?: return
        val night = cfg.night
        val textColor = if (night) 0xFFFFFFFF.toInt() else 0xFF212121.toInt()
        val cols = if (screenW() > screenH()) 8 else 5
        val pinned = cfg.pinned.toHashSet()
        cells.clear()

        val grid = GridLayout(context).apply {
            columnCount = cols
            setPadding(dp(8), dp(4), dp(8), dp(12))
        }
        val cellW = ((screenW() * 0.92f - dp(16)) / cols).toInt()
        for (a in list) {
            val cell = LinearLayout(context).apply {
                orientation = LinearLayout.VERTICAL
                gravity = Gravity.CENTER_HORIZONTAL
                setPadding(dp(2), dp(6), dp(2), dp(6))
                background = pinBg(pinned.contains(a.key))
                val iv = ImageView(context).apply { setImageDrawable(a.icon) }
                addView(iv, LinearLayout.LayoutParams(dp(46), dp(46)))
                addView(TextView(context).apply {
                    this.text = a.label
                    setTextColor(textColor)
                    textSize = 11f
                    gravity = Gravity.CENTER
                    maxLines = 1
                    ellipsize = android.text.TextUtils.TruncateAt.END
                }, LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT))
                setOnClickListener { hide(); launch(a.pkg, a.activity) }
                setOnLongClickListener {
                    performHapticFeedback(HapticFeedbackConstants.LONG_PRESS)
                    val cur = cfg.pinned.toMutableList()
                    val nowPinned = if (cur.remove(a.key)) false else { cur.add(a.key); true }
                    cfg.setPinned(cur)
                    background = pinBg(nowPinned)
                    onPinnedChanged()
                    true
                }
            }
            cells[a.key] = cell
            grid.addView(cell, GridLayout.LayoutParams().apply { width = cellW; height = ViewGroup.LayoutParams.WRAP_CONTENT })
        }
        val title = TextView(context).apply {
            this.text = "All apps  •  tap = floating window, long-press = pin to sidebar"
            setTextColor(textColor)
            textSize = 12f
            setPadding(dp(16), dp(12), dp(16), dp(4))
        }
        val col = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            addView(title)
            addView(ScrollView(context).apply {
                isVerticalScrollBarEnabled = false
                addView(grid)
            }, LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f))
        }
        content = FrameLayout(context).apply {
            background = GradientDrawable().apply {
                setColor(if (night) 0xF2202124.toInt() else 0xF2F5F5F5.toInt())
                cornerRadius = dp(24).toFloat()
            }
            elevation = dp(10).toFloat()
            clipToOutline = true
            addView(col, FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT))
            setOnTouchListener { _, ev ->
                if (ev.action == MotionEvent.ACTION_OUTSIDE) { hide(); true } else false
            }
        }
    }

    private fun pinBg(pinned: Boolean): Drawable = GradientDrawable().apply {
        setColor(if (pinned) 0x553F8CFF else 0)
        cornerRadius = dp(12).toFloat()
    }

    fun toggle() = handler.post { if (shown == null) show() else hide() }
    fun hide() { shown?.let { runCatching { wm.removeViewImmediate(it) } }; shown = null }

    fun show() {
        if (shown != null) return
        if (content == null) { prepare(); buildView() }       // first-use fallback
        val v = content ?: return
        val w = (screenW() * 0.92f).roundToInt()
        val h = max(dp(240), (screenH() * 0.72f).roundToInt())
        val lp = WindowManager.LayoutParams(
            w, h, WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
                    WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH or
                    WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.CENTER
            title = "LMOAppDrawer"
        }
        (v.parent as? ViewGroup)?.removeView(v)
        if (runCatching { wm.addView(v, lp) }.isSuccess) {
            shown = v
            v.alpha = 0f
            v.scaleX = 0.96f; v.scaleY = 0.96f
            v.animate().alpha(1f).scaleX(1f).scaleY(1f).setDuration(140).start()
        }
    }

    companion object {
        private const val TAG = "LMOFreeform/AppDrawer"
        const val LAUNCHER_PKG = SidebarController.LAUNCHER_PKG
    }
}
