package com.libremobileos.freeform.server.sidebar

import android.animation.ValueAnimator
import android.content.BroadcastReceiver
import android.content.ComponentName
import android.content.IntentFilter
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.database.ContentObserver
import android.graphics.Color
import android.graphics.PixelFormat
import android.graphics.Typeface
import android.graphics.drawable.Drawable
import android.content.res.ColorStateList
import android.graphics.drawable.GradientDrawable
import android.graphics.drawable.RippleDrawable
import android.view.animation.DecelerateInterpolator
import android.net.Uri
import android.os.Handler
import android.os.UserHandle
import android.provider.Settings
import android.util.Slog
import android.view.Gravity
import android.view.HapticFeedbackConstants
import android.view.MotionEvent
import android.view.View
import android.view.ViewConfiguration
import android.view.ViewGroup
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.GridLayout
import android.widget.ImageView
import android.widget.ScrollView
import android.widget.TextView
import kotlin.math.abs
import kotlin.math.max
import kotlin.math.min
import kotlin.math.roundToInt

/**
 * Edge handle + slide-out panel, living inside system_server (no separate app, no permissions).
 * Everything runs on [handler] (main looper). Open/close/toggle can be driven from anywhere
 * via LMOFreeformApi (e.g. a smali key hook) or the TOGGLE/OPEN/CLOSE_SIDEBAR broadcasts.
 */
class SidebarController(
    private val context: Context,
    private val handler: Handler,
    private val launch: (pkg: String, activity: String) -> Unit
) {
    private val wm = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
    private val cfg = SidebarConfig(context)

    private var handle: View? = null
    private var handleLp: WindowManager.LayoutParams? = null
    private var panel: View? = null

    /** cached panel (view tree + size), rebuilt only when config / pinned apps / packages change */
    private var panelView: View? = null
    private var panelW = 0
    private var panelH = 0

    private val drawer = AppDrawer(context, handler, cfg, launch,
        onPinnedChanged = { panelView = null; preparePanel() },
        onLoaded = { panelView = null; preparePanel() })

    private val observer = object : ContentObserver(handler) {
        override fun onChange(selfChange: Boolean, uri: Uri?) {
            val key = uri?.lastPathSegment ?: ""
            if (!key.startsWith("lmo_sb_")) return
            if (key == SidebarConfig.HANDLE_Y) return
            if (key == SidebarConfig.PINNED) { panelView = null; preparePanel(); return }
            drawer.hide()
            rebuild()
        }
    }

    private val systemReceiver = object : BroadcastReceiver() {
        private val refresh = Runnable { panelView = null; drawer.invalidate(); preparePanel() }
        override fun onReceive(c: Context, i: Intent) {
            if (i.action == Intent.ACTION_CONFIGURATION_CHANGED) {
                drawer.hide(); drawer.invalidate(); rebuild()
            } else {
                // package added / removed / changed: debounce bursts
                handler.removeCallbacks(refresh)
                handler.postDelayed(refresh, 1500)
            }
        }
    }

    fun start() {
        runCatching {
            context.contentResolver.registerContentObserver(Settings.System.CONTENT_URI, true, observer)
        }.onFailure { Slog.e(TAG, "observer", it) }
        runCatching {
            val pk = IntentFilter().apply {
                addAction(Intent.ACTION_PACKAGE_ADDED)
                addAction(Intent.ACTION_PACKAGE_REMOVED)
                addAction(Intent.ACTION_PACKAGE_CHANGED)
                addDataScheme("package")
            }
            context.registerReceiverForAllUsers(systemReceiver, pk, null, handler)
            context.registerReceiverForAllUsers(systemReceiver,
                IntentFilter(Intent.ACTION_CONFIGURATION_CHANGED), null, handler)
        }.onFailure { Slog.e(TAG, "receiver", it) }
        rebuild()
        // icon / app-list cache is loaded once on a background thread (not on the UI thread),
        // so the first panel open is already instant
        drawer.prepare()
    }

    fun rebuild() = handler.post {
        closePanelNow()
        removeHandle()
        panelView = null
        if (cfg.enabled) {
            addHandle()
            preparePanel()
        }
    }

    fun open() = handler.post { if (panel == null) openPanel() }
    fun close() = handler.post { closePanelNow(); drawer.hide() }
    fun toggle() = handler.post {
        if (panel == null) { drawer.hide(); openPanel() } else closePanelAnimated()
    }

    private fun dp(v: Float) = (v * context.resources.displayMetrics.density).roundToInt()
    private fun dp(v: Int) = dp(v.toFloat())
    private fun screenH() = context.resources.displayMetrics.heightPixels

    // ----------------------------------------------------------------- handle

    private fun removeHandle() {
        handle?.let { runCatching { wm.removeViewImmediate(it) } }
        handle = null
    }

    private fun addHandle() {
        val right = cfg.right
        val barW = dp(cfg.handleWidthDp)
        val barH = dp(cfg.handleLenDp)
        val box = FrameLayout(context)
        val bar = View(context)
        bar.background = GradientDrawable().apply {
            setColor(cfg.accent)
            cornerRadius = barW.toFloat()
        }
        bar.alpha = cfg.handleAlpha / 100f
        box.addView(bar, FrameLayout.LayoutParams(barW, barH, if (right) Gravity.END else Gravity.START))

        var y = cfg.handleY
        if (y < 0) y = screenH() / 3
        y = y.coerceIn(0, max(0, screenH() - barH))

        val lp = WindowManager.LayoutParams(
            dp(32), barH, WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
                    WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN or
                    WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.TOP or (if (right) Gravity.END else Gravity.START)
            this.y = y
            title = "LMOSidebarHandle"
        }
        handleLp = lp

        // tell the system not to start the back gesture on our handle (it would steal the swipe)
        box.addOnLayoutChangeListener { v, l, t, r, b, _, _, _, _ ->
            v.systemGestureExclusionRects = listOf(android.graphics.Rect(0, 0, r - l, b - t))
        }
        val slop = ViewConfiguration.get(context).scaledTouchSlop
        val longPress = ViewConfiguration.getLongPressTimeout().toLong()
        box.setOnTouchListener(object : View.OnTouchListener {
            var downX = 0f
            var downY = 0f
            var startY = 0
            var dragging = false
            var moved = false
            val lpRun = Runnable {
                dragging = true
                box.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS)
            }

            override fun onTouch(v: View, e: MotionEvent): Boolean {
                when (e.actionMasked) {
                    MotionEvent.ACTION_DOWN -> {
                        downX = e.rawX; downY = e.rawY; startY = lp.y
                        dragging = false; moved = false
                        handler.postDelayed(lpRun, longPress)
                    }
                    MotionEvent.ACTION_MOVE -> {
                        val dx = e.rawX - downX
                        val dy = e.rawY - downY
                        if (dragging) {
                            // free placement: follow the finger on both axes, snap to the nearest edge on release
                            val sw = context.resources.displayMetrics.widthPixels
                            lp.gravity = Gravity.TOP or Gravity.START
                            lp.x = (e.rawX - lp.width / 2f).roundToInt().coerceIn(0, max(0, sw - lp.width))
                            lp.y = (e.rawY - barH / 2f).roundToInt().coerceIn(0, max(0, screenH() - barH))
                            runCatching { wm.updateViewLayout(box, lp) }
                        } else if (abs(dx) > slop || abs(dy) > slop) {
                            moved = true
                            handler.removeCallbacks(lpRun)
                            val inward = if (right) dx < -slop else dx > slop
                            if (inward && abs(dx) > abs(dy)) openPanel()
                        }
                    }
                    MotionEvent.ACTION_UP -> {
                        handler.removeCallbacks(lpRun)
                        if (dragging) {
                            val sw = context.resources.displayMetrics.widthPixels
                            val toRight = lp.x + lp.width / 2 > sw / 2
                            cfg.setHandleY(lp.y)
                            if (toRight != cfg.right) cfg.setSide(toRight)   // observer rebuilds on the new side
                            else {
                                lp.gravity = Gravity.TOP or (if (toRight) Gravity.END else Gravity.START)
                                lp.x = 0
                                runCatching { wm.updateViewLayout(box, lp) }
                            }
                        }
                        dragging = false
                    }
                    MotionEvent.ACTION_CANCEL -> {
                        // the system took the gesture (back / home): if we already moved inward, still open
                        handler.removeCallbacks(lpRun)
                        val dx = e.rawX - downX
                        val inward = if (right) dx < -slop * 2 else dx > slop * 2
                        if (!dragging && inward) openPanel()
                        dragging = false
                    }
                }
                return true
            }
        })
        handle = box
        runCatching { wm.addView(box, lp) }.onFailure { handle = null; Slog.e(TAG, "add handle", it) }
    }

    // ------------------------------------------------------------------ panel

    private class Entry(val label: String, val icon: Drawable?, val glyph: String?, val action: () -> Unit)

    private var closing: View? = null
    private var panelTop = 0

    private fun closePanelNow() {
        panel?.let { runCatching { wm.removeViewImmediate(it) } }
        panel = null
        finishClosing()
    }

    private fun finishClosing() {
        closing?.let { c -> c.animate().cancel(); runCatching { wm.removeViewImmediate(c) } }
        closing = null
    }

    /** slide out smoothly, then remove */
    private fun closePanelAnimated() {
        val v = panel ?: return
        panel = null
        closing = v
        val right = cfg.right
        // shrink back into the edge like a pill
        v.pivotX = if (right) v.width.toFloat() else 0f
        v.pivotY = (handleLp?.y ?: 0).toFloat() + dp(cfg.handleLenDp) / 2f - panelTop
        v.animate().scaleX(0.15f).scaleY(0.06f).translationX((if (right) 1 else -1) * dp(24).toFloat()).alpha(0f)
            .setDuration(170).setInterpolator(DecelerateInterpolator())
            .withEndAction { if (closing === v) { runCatching { wm.removeViewImmediate(v) }; closing = null } }
            .start()
    }

    private fun entries(): List<Entry> {
        val pm = context.packageManager
        val list = ArrayList<Entry>()
        list += Entry("All apps", null, "▦") { drawer.toggle() }
        for (s in cfg.pinned) {
            val slash = s.indexOf('/')
            if (slash < 0) continue
            val pkg = s.substring(0, slash)
            val act = s.substring(slash + 1)
            val cached = drawer.lookup(s)
            if (cached != null) {
                list += Entry(cached.first, cached.second, null) { launch(pkg, act) }
                continue
            }
            try {
                val ai = pm.getActivityInfo(ComponentName(pkg, act), 0)
                list += Entry(ai.loadLabel(pm).toString(), ai.loadIcon(pm), null) { launch(pkg, act) }
            } catch (_: PackageManager.NameNotFoundException) {
            }
        }
        list += Entry("Settings", null, "⚙") { startLauncherActivity(".MainActivity", false) }
        return list
    }

    private fun startLauncherActivity(cls: String, pin: Boolean) {
        runCatching {
            val i = Intent().setComponent(ComponentName(LAUNCHER_PKG, LAUNCHER_PKG + cls))
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                .putExtra("pin", pin)
            context.startActivityAsUser(i, UserHandle.CURRENT)
        }.onFailure { Slog.e(TAG, "start $cls (is FreeformLauncher.apk installed?)", it) }
    }

    /** Build (once) the panel view tree; cheap to re-show afterwards. */
    private fun preparePanel() {
        if (panelView != null) return
        val night = cfg.night
        val iconPx = dp(cfg.iconDp)
        val cols = cfg.columns
        val textColor = if (night) Color.WHITE else 0xFF212121.toInt()
        val list = entries()
        val cell = iconPx + dp(14)

        val grid = GridLayout(context).apply {
            columnCount = cols
            setPadding(dp(6), dp(8), dp(6), dp(8))
        }
        for (e in list) {
            val v: View = if (e.glyph != null) {
                TextView(context).apply {
                    text = e.glyph
                    setTextColor(textColor)
                    gravity = Gravity.CENTER
                    typeface = Typeface.DEFAULT_BOLD
                    setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, iconPx * 0.7f)
                }
            } else {
                ImageView(context).apply {
                    setImageDrawable(e.icon)
                    setPadding(dp(7), dp(7), dp(7), dp(7))
                }
            }
            v.contentDescription = e.label
            v.background = RippleDrawable(
                ColorStateList.valueOf((cfg.accent and 0x00FFFFFF) or 0x44000000), null,
                GradientDrawable().apply { shape = GradientDrawable.OVAL; setColor(Color.WHITE) })
            v.setOnClickListener { closePanelNow(); e.action() }
            grid.addView(v, GridLayout.LayoutParams().apply { width = cell; height = cell })
        }
        val scroll = ScrollView(context).apply {
            isVerticalScrollBarEnabled = false
            addView(grid)
        }
        val alpha = (255 * cfg.panelAlpha / 100f).roundToInt()
        panelView = FrameLayout(context).apply {
            background = GradientDrawable().apply {
                setColor((if (night) 0x00181A20 else 0x00F6F7FA) or (alpha shl 24))
                cornerRadius = dp(28).toFloat()
                setStroke(dp(1), (cfg.accent and 0x00FFFFFF) or 0x33000000)
            }
            elevation = dp(8).toFloat()
            clipToOutline = true
            addView(scroll, FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT))
            setOnTouchListener { _, ev ->
                if (ev.action == MotionEvent.ACTION_OUTSIDE) { closePanelAnimated(); true } else false
            }
        }
        val rows = (list.size + cols - 1) / cols
        panelW = cols * cell + dp(12)
        panelH = min(rows * cell + dp(16), (screenH() * 0.8f).roundToInt())
    }

    private fun openPanel() {
        if (panel != null) return
        finishClosing()
        preparePanel()
        val box = panelView ?: return
        val right = cfg.right
        val w = panelW
        val h = panelH
        val hy = handleLp?.y ?: (screenH() / 3)
        val y = (hy - h / 2 + dp(50)).coerceIn(dp(24), max(dp(24), screenH() - h - dp(24)))
        val lp = WindowManager.LayoutParams(
            w, h, WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
                    WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH or
                    WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.TOP or (if (right) Gravity.END else Gravity.START)
            x = dp(10)
            this.y = y
            title = "LMOSidebarPanel"
        }
        (box.parent as? ViewGroup)?.removeView(box)
        if (runCatching { wm.addView(box, lp) }.isFailure) return
        panel = box

        panelTop = y
        box.scaleX = 0.15f; box.scaleY = 0.06f; box.alpha = 0f
        box.translationX = (if (right) 1 else -1) * dp(24).toFloat()
        box.pivotX = if (right) w.toFloat() else 0f
        box.pivotY = (hy + dp(cfg.handleLenDp) / 2f - y).coerceIn(0f, h.toFloat())
        box.animate().scaleX(1f).scaleY(1f).translationX(0f).alpha(1f).setDuration(230)
            .setInterpolator(android.view.animation.OvershootInterpolator(0.8f)).start()
    }

    companion object {
        private const val TAG = "LMOFreeform/Sidebar"
        const val LAUNCHER_PKG = "com.libremobileos.freeform.launcher"
    }
}
