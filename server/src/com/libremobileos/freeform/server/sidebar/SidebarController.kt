package com.libremobileos.freeform.server.sidebar

import android.animation.ValueAnimator
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.database.ContentObserver
import android.graphics.Color
import android.graphics.PixelFormat
import android.graphics.Typeface
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
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

    private val observer = object : ContentObserver(handler) {
        override fun onChange(selfChange: Boolean, uri: Uri?) {
            val key = uri?.lastPathSegment ?: ""
            if (!key.startsWith("lmo_sb_")) return
            if (key == SidebarConfig.HANDLE_Y || key == SidebarConfig.PINNED) return
            rebuild()
        }
    }

    fun start() {
        runCatching {
            context.contentResolver.registerContentObserver(Settings.System.CONTENT_URI, true, observer)
        }.onFailure { Slog.e(TAG, "observer", it) }
        rebuild()
    }

    fun rebuild() = handler.post {
        closePanelNow()
        removeHandle()
        if (cfg.enabled) addHandle()
    }

    fun open() = handler.post { if (panel == null) openPanel() }
    fun close() = handler.post { closePanelNow() }
    fun toggle() = handler.post { if (panel == null) openPanel() else closePanelNow() }

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
            setColor(if (cfg.night) 0xFFE0E0E0.toInt() else 0xFF424242.toInt())
            cornerRadius = barW.toFloat()
        }
        bar.alpha = cfg.handleAlpha / 100f
        box.addView(bar, FrameLayout.LayoutParams(barW, barH, if (right) Gravity.END else Gravity.START))

        var y = cfg.handleY
        if (y < 0) y = screenH() / 3
        y = y.coerceIn(0, max(0, screenH() - barH))

        val lp = WindowManager.LayoutParams(
            dp(24), barH, WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
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
                            lp.y = (startY + dy.roundToInt()).coerceIn(0, max(0, screenH() - barH))
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
                        if (dragging) cfg.setHandleY(lp.y) else if (!moved) openPanel()
                        dragging = false
                    }
                    MotionEvent.ACTION_CANCEL -> {
                        handler.removeCallbacks(lpRun); dragging = false
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

    private fun closePanelNow() {
        panel?.let { runCatching { wm.removeViewImmediate(it) } }
        panel = null
    }

    private fun entries(): List<Entry> {
        val pm = context.packageManager
        val list = ArrayList<Entry>()
        list += Entry("All apps", null, "▦") { launch(LAUNCHER_PKG, "$LAUNCHER_PKG.AppPickerActivity") }
        for (s in cfg.pinned) {
            val slash = s.indexOf('/')
            if (slash < 0) continue
            val pkg = s.substring(0, slash)
            val act = s.substring(slash + 1)
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

    private fun openPanel() {
        if (panel != null) return
        val right = cfg.right
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
            v.setOnClickListener { closePanelNow(); e.action() }
            grid.addView(v, GridLayout.LayoutParams().apply { width = cell; height = cell })
        }
        val scroll = ScrollView(context).apply {
            isVerticalScrollBarEnabled = false
            addView(grid)
        }
        val alpha = (255 * cfg.panelAlpha / 100f).roundToInt()
        val box = FrameLayout(context).apply {
            background = GradientDrawable().apply {
                setColor((if (night) 0x00202124 else 0x00F5F5F5) or (alpha shl 24))
                cornerRadius = dp(24).toFloat()
            }
            elevation = dp(8).toFloat()
            clipToOutline = true
            addView(scroll, FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT))
            setOnTouchListener { _, ev ->
                if (ev.action == MotionEvent.ACTION_OUTSIDE) { closePanelNow(); true } else false
            }
        }

        val rows = (list.size + cols - 1) / cols
        val w = cols * cell + dp(12)
        val h = min(rows * cell + dp(16), (screenH() * 0.8f).roundToInt())
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
        if (runCatching { wm.addView(box, lp) }.isFailure) return
        panel = box

        val from = (if (right) 1 else -1) * (w + dp(10)).toFloat()
        box.translationX = from
        ValueAnimator.ofFloat(from, 0f).apply {
            duration = 220
            addUpdateListener { box.translationX = it.animatedValue as Float }
            start()
        }
    }

    companion object {
        private const val TAG = "LMOFreeform/Sidebar"
        const val LAUNCHER_PKG = "com.libremobileos.freeform.launcher"
    }
}
