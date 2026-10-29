package com.libremobileos.freeform.server.ui

import android.content.Context
import android.graphics.PixelFormat
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.os.Looper
import android.view.Gravity
import android.view.HapticFeedbackConstants
import android.view.MotionEvent
import android.view.View
import android.view.ViewConfiguration
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import com.libremobileos.freeform.server.sidebar.SidebarConfig
import kotlin.math.abs
import kotlin.math.max
import kotlin.math.roundToInt

/**
 * All minimized floating apps live in ONE floating bubble docked at a screen edge (opposite to the
 * sidebar). Tap: 1 app -> restore it, several -> expand a list; tap an icon to restore, long-press
 * an icon to close that app. Drag the bubble up/down to move it.
 */
object FreeformStack {
    private val ui = Handler(Looper.getMainLooper())
    private val items = ArrayList<FreeformWindow>()

    private var ctx: Context? = null
    private var wm: WindowManager? = null
    private var bubble: FrameLayout? = null
    private var bubbleLp: WindowManager.LayoutParams? = null
    private var icon: ImageView? = null
    private var badge: TextView? = null
    private var list: View? = null
    private var bubbleY = -1

    fun add(w: FreeformWindow) = ui.post {
        if (!items.contains(w)) items.add(w)
        ensureBubble(w.context)
        refresh()
    }

    fun remove(w: FreeformWindow) = ui.post {
        items.remove(w)
        if (items.isEmpty()) {
            collapse()
            removeBubble()
        } else {
            refresh()
            if (list != null) { collapse(); expand() }
        }
    }

    private fun dp(v: Int): Int {
        val c = ctx ?: return v
        return (v * c.resources.displayMetrics.density).roundToInt()
    }
    private fun screenH() = ctx?.resources?.displayMetrics?.heightPixels ?: 2000

    private fun ensureBubble(c: Context) {
        if (bubble != null) return
        ctx = c
        val w = c.getSystemService(Context.WINDOW_SERVICE) as WindowManager
        wm = w
        val size = dp(52)
        val right = !SidebarConfig(c).right      // opposite edge of the sidebar
        val box = FrameLayout(c).apply {
            background = GradientDrawable().apply {
                shape = GradientDrawable.OVAL
                setColor(0xE6303134.toInt())
            }
            elevation = dp(6).toFloat()
        }
        val iv = ImageView(c).apply { setPadding(dp(9), dp(9), dp(9), dp(9)) }
        box.addView(iv, FrameLayout.LayoutParams(size, size))
        val bd = TextView(c).apply {
            setTextColor(0xFFFFFFFF.toInt())
            textSize = 10f
            gravity = Gravity.CENTER
            background = GradientDrawable().apply {
                shape = GradientDrawable.OVAL
                setColor(0xFFE53935.toInt())
            }
            visibility = View.GONE
        }
        box.addView(bd, FrameLayout.LayoutParams(dp(18), dp(18), Gravity.TOP or Gravity.END))
        icon = iv
        badge = bd

        if (bubbleY < 0) bubbleY = screenH() * 2 / 5
        val lp = WindowManager.LayoutParams(
            size, size, WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
                    WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN or
                    WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.TOP or (if (right) Gravity.END else Gravity.START)
            x = dp(4)
            y = bubbleY
            title = "LMOStackBubble"
        }
        bubbleLp = lp

        val slop = ViewConfiguration.get(c).scaledTouchSlop
        box.setOnTouchListener(object : View.OnTouchListener {
            var downY = 0f
            var startY = 0
            var moved = false
            override fun onTouch(v: View, e: MotionEvent): Boolean {
                when (e.actionMasked) {
                    MotionEvent.ACTION_DOWN -> { downY = e.rawY; startY = lp.y; moved = false }
                    MotionEvent.ACTION_MOVE -> {
                        val dy = e.rawY - downY
                        if (moved || abs(dy) > slop) {
                            moved = true
                            lp.y = (startY + dy).roundToInt().coerceIn(0, max(0, screenH() - size))
                            bubbleY = lp.y
                            runCatching { w.updateViewLayout(box, lp) }
                            if (list != null) collapse()
                        }
                    }
                    MotionEvent.ACTION_UP -> if (!moved) onBubbleTap()
                }
                return true
            }
        })
        bubble = box
        runCatching { w.addView(box, lp) }.onFailure { bubble = null }
    }

    private fun removeBubble() {
        bubble?.let { b -> runCatching { wm?.removeViewImmediate(b) } }
        bubble = null
    }

    private fun refresh() {
        val last = items.lastOrNull() ?: return
        icon?.setImageDrawable(last.appIcon)
        badge?.apply {
            visibility = if (items.size > 1) View.VISIBLE else View.GONE
            text = items.size.toString()
        }
    }

    private fun onBubbleTap() {
        if (list != null) { collapse(); return }
        if (items.size == 1) {
            val w = items[0]
            w.handler.post { w.restoreFromStack() }
        } else expand()
    }

    private fun collapse() {
        list?.let { l -> runCatching { wm?.removeViewImmediate(l) } }
        list = null
    }

    private fun expand() {
        val c = ctx ?: return
        val w = wm ?: return
        val blp = bubbleLp ?: return
        val right = (blp.gravity and Gravity.END) == Gravity.END
        val cell = dp(52)
        val col = LinearLayout(c).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(dp(4), dp(6), dp(4), dp(6))
            background = GradientDrawable().apply {
                setColor(0xE6303134.toInt())
                cornerRadius = dp(26).toFloat()
            }
            elevation = dp(8).toFloat()
            setOnTouchListener { _, ev ->
                if (ev.action == MotionEvent.ACTION_OUTSIDE) { collapse(); true } else false
            }
        }
        for (win in items.reversed()) {
            val iv = ImageView(c).apply {
                setImageDrawable(win.appIcon)
                setPadding(dp(7), dp(7), dp(7), dp(7))
                contentDescription = win.appLabel
                setOnClickListener {
                    collapse()
                    win.handler.post { win.restoreFromStack() }
                }
                setOnLongClickListener {
                    performHapticFeedback(HapticFeedbackConstants.LONG_PRESS)
                    collapse()
                    win.handler.post { win.close() }
                    true
                }
            }
            col.addView(iv, LinearLayout.LayoutParams(cell, cell))
        }
        val h = items.size * cell + dp(12)
        val lp = WindowManager.LayoutParams(
            cell + dp(8), h, WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
                    WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH or
                    WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.TOP or (if (right) Gravity.END else Gravity.START)
            x = dp(4) + dp(52) + dp(6)
            y = (blp.y - h / 2 + dp(26)).coerceIn(dp(24), max(dp(24), screenH() - h - dp(24)))
            title = "LMOStackList"
        }
        if (runCatching { w.addView(col, lp) }.isSuccess) list = col
    }
}
