package com.libremobileos.freeform.server.ui

import android.annotation.SuppressLint
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.graphics.Color
import android.graphics.Matrix
import android.graphics.PixelFormat
import android.graphics.SurfaceTexture
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.util.Slog
import android.view.Display
import android.view.Gravity
import android.view.IRotationWatcher
import android.view.InputDevice
import android.view.KeyEvent
import android.view.MotionEvent
import android.view.Surface
import android.view.TextureView
import android.view.View
import android.view.ViewConfiguration
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.TextView
import com.libremobileos.freeform.server.LMOFreeformServiceHolder
import com.libremobileos.freeform.server.SystemServiceHolder
import kotlin.math.abs
import kotlin.math.max
import kotlin.math.min
import kotlin.math.roundToInt

/**
 * ThunderPad: the app runs on a VirtualDisplay with a tablet look (resolution / dpi) and is shown
 * fullscreen, behaving like a normal app:
 *  - FILL (default): fills the whole screen without bars or distortion (resolution adapts to the phone's aspect)
 *  - ORIGINAL: exact tablet aspect ratio, black bars;  STRETCH: exact tablet resolution stretched to the screen
 *  - the app's own orientation is followed (manifest / runtime request, else the phone rotation); if the app
 *    wants landscape while the phone is held portrait the picture is rotated, so turning the phone makes it upright
 *  - Home / Recents / opening another app hides the pad (the app keeps running, like a background app);
 *    open it again from the sidebar to continue. Close (x) really closes it.
 */
class ThunderPadWindow(
    override val handler: Handler,
    private val context: Context,
    private val appConfig: AppConfig,
    val pkg: String,
    private var spec: PadProfile
) : TextureView.SurfaceTextureListener, FreeformDisplayCallback, TaskHost {

    private val wm = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
    private val cfg = FreeformConfig(spec.w, spec.h, spec.dpi)
    private var root: FrameLayout? = null
    private var rootLp: WindowManager.LayoutParams? = null
    private var tex: TextureView? = null
    private var controls: View? = null
    private var extra: List<View> = emptyList()
    private var displayId = Display.INVALID_DISPLAY
    private var listener: FreeformTaskStackListener? = null
    private var requestedLandscape: Boolean? = null
    private var rotationDeg = 90f
    private var hidden = false
    private var downNearBottom = false
    @Volatile var isDestroyed = false
        private set
    private val declaredLandscape = AppProfiles.declaredLandscape(context, pkg, appConfig.activityName)

    private fun dm() = context.resources.displayMetrics
    private fun dp(v: Int) = (v * dm().density).roundToInt()

    private class Layout(val rotated: Boolean, val ew: Int, val eh: Int, val pw: Int, val ph: Int, val dpi: Int)

    private fun even(v: Int) = max(2, v and 1.inv())

    private fun computeLayout(): Layout {
        val sw = dm().widthPixels
        val sh = dm().heightPixels
        val screenLand = sw > sh
        val wantLand = requestedLandscape ?: declaredLandscape ?: screenLand
        val rotated = wantLand != screenLand
        val ew = if (rotated) sh else sw
        val eh = if (rotated) sw else sh
        val hi = max(spec.w, spec.h)
        val lo = min(spec.w, spec.h)
        var pw: Int
        var ph: Int
        var dpi = spec.dpi
        if (spec.fit == PadProfiles.FILL) {
            if (ew >= eh) { pw = hi; ph = (hi.toFloat() * eh / ew).roundToInt() }
            else { ph = hi; pw = (hi.toFloat() * ew / eh).roundToInt() }
            // keep a tablet-sized layout (>= ~600dp smallest width)
            dpi = min(spec.dpi, (min(pw, ph) * 160f / 600f).roundToInt()).coerceAtLeast(120)
        } else {
            if (wantLand) { pw = hi; ph = lo } else { pw = lo; ph = hi }
        }
        return Layout(rotated, ew, eh, even(pw), even(ph), dpi)
    }

    private var lay: Layout = computeLayout()

    private val rotationWatcher = object : IRotationWatcher.Stub() {
        override fun onRotationChanged(rotation: Int) {
            handler.post { relayout() }
        }
    }

    private val homeReceiver = object : BroadcastReceiver() {
        override fun onReceive(c: Context, i: Intent) {
            val reason = i.getStringExtra("reason")
            if (reason == "homekey" || reason == "recentapps") handler.post { hide() }
        }
    }

    // ---------------------------------------------------------------- show

    @SuppressLint("ClickableViewAccessibility")
    fun show() {
        handler.post {
            lay = computeLayout()
            apply(lay)
            val r = FrameLayout(context).apply {
                setBackgroundColor(Color.BLACK)
                isFocusable = true
                isFocusableInTouchMode = true
                setOnKeyListener { _, code, ev ->
                    if (code == KeyEvent.KEYCODE_BACK) {
                        if (ev.action == KeyEvent.ACTION_UP) LMOFreeformServiceHolder.back(displayId)
                        true
                    } else false
                }
            }
            val t = TextureView(context).apply {
                surfaceTextureListener = this@ThunderPadWindow
                setOnTouchListener { v, ev -> forwardTouch(v, ev) }
            }
            r.addView(t, FrameLayout.LayoutParams(dm().widthPixels, dm().heightPixels, Gravity.CENTER))
            root = r
            tex = t
            applyFit()

            val lp = WindowManager.LayoutParams(
                dm().widthPixels, dm().heightPixels,
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
                WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS or
                        WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN or
                        WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED,
                PixelFormat.OPAQUE
            ).apply {
                gravity = Gravity.TOP or Gravity.START
                layoutInDisplayCutoutMode =
                    WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS
                title = "LMOThunderPad"
            }
            rootLp = lp
            val ok = runCatching { wm.addView(r, lp) }.onFailure { Slog.e(TAG, "addView failed", it) }.isSuccess
            if (!ok) { destroy("addView failed", false); return@post }
            r.alpha = 0f
            r.animate().alpha(1f).setDuration(160).start()
            r.requestFocus()
            runCatching { SystemServiceHolder.windowManager.watchRotation(rotationWatcher, Display.DEFAULT_DISPLAY) }
            runCatching {
                context.registerReceiverForAllUsers(homeReceiver,
                    IntentFilter(Intent.ACTION_CLOSE_SYSTEM_DIALOGS), null, handler)
            }
        }
    }

    private fun apply(l: Layout) {
        cfg.freeformWidth = l.pw
        cfg.freeformHeight = l.ph
        cfg.densityDpi = l.dpi
    }

    /** texture size / rotation for the current layout + fit mode */
    private fun applyFit() {
        val t = tex ?: return
        val l = lay
        var w = l.ew
        var h = l.eh
        if (spec.fit == PadProfiles.ORIGINAL) {
            val s = min(l.ew.toFloat() / l.pw, l.eh.toFloat() / l.ph)
            w = (l.pw * s).roundToInt()
            h = (l.ph * s).roundToInt()
        }
        t.layoutParams = FrameLayout.LayoutParams(w, h, Gravity.CENTER)
        t.rotation = if (l.rotated) rotationDeg else 0f
    }

    /** screen rotated or the app asked for another orientation */
    private fun relayout() {
        if (isDestroyed) return
        val r = root ?: return
        lay = computeLayout()
        apply(lay)
        runCatching {
            val lp = rootLp ?: return@runCatching
            lp.width = dm().widthPixels
            lp.height = dm().heightPixels
            wm.updateViewLayout(r, lp)
        }
        applyFit()
        LMOFreeformServiceHolder.resizeFreeform(this, lay.pw, lay.ph, lay.dpi)
        tex?.surfaceTexture?.setDefaultBufferSize(lay.pw, lay.ph)
    }

    override fun onAppRequestedOrientation(landscape: Boolean) {
        handler.post {
            if (requestedLandscape == landscape) return@post
            requestedLandscape = landscape
            relayout()
        }
    }

    private fun forwardTouch(v: View, ev: MotionEvent): Boolean {
        // swipe up from the bottom edge (gesture navigation: home / recents) -> hide like a normal app would go away
        when (ev.actionMasked) {
            MotionEvent.ACTION_DOWN -> downNearBottom = ev.rawY > dm().heightPixels - dp(40)
            MotionEvent.ACTION_CANCEL -> if (downNearBottom) { downNearBottom = false; handler.post { hide() } }
            MotionEvent.ACTION_UP -> downNearBottom = false
        }
        if (displayId < 0 || v.width == 0 || v.height == 0) return true
        val e = MotionEvent.obtain(ev)
        e.transform(Matrix().apply {
            setScale(cfg.freeformWidth.toFloat() / v.width, cfg.freeformHeight.toFloat() / v.height)
        })
        e.source = InputDevice.SOURCE_TOUCHSCREEN
        LMOFreeformServiceHolder.touch(e, displayId)
        e.recycle()
        return true
    }

    // ------------------------------------------------------- display / task

    override fun onSurfaceTextureAvailable(st: SurfaceTexture, width: Int, height: Int) {
        st.setDefaultBufferSize(cfg.freeformWidth, cfg.freeformHeight)
        if (displayId < 0) {
            LMOFreeformServiceHolder.createDisplay(cfg, appConfig, Surface(st), this)
        }
    }

    override fun onSurfaceTextureSizeChanged(st: SurfaceTexture, width: Int, height: Int) {
        st.setDefaultBufferSize(cfg.freeformWidth, cfg.freeformHeight)
    }

    override fun onSurfaceTextureDestroyed(st: SurfaceTexture): Boolean = true
    override fun onSurfaceTextureUpdated(st: SurfaceTexture) {}

    override fun onDisplayStopped() {
        handler.post { destroy("display stopped", false) }
    }

    override fun onDisplayAdd(displayId: Int) {
        handler.post {
            if (isDestroyed) return@post
            this.displayId = displayId
            listener = FreeformTaskStackListener(displayId, this)
            SystemServiceHolder.activityTaskManager.registerTaskStackListener(listener)
            if (!LMOFreeformServiceHolder.startApp(context, appConfig, displayId)) {
                destroy("startApp failed", false)
                return@post
            }
            addControls()
        }
    }

    override fun onTaskGone(reason: String, removeTask: Boolean) = destroy(reason, removeTask)

    override fun onDefaultDisplayFront() {
        hide()
    }

    // ------------------------------------------------------ hide / resume

    /** back to home / another app: hide the pad, keep the app running in the background */
    fun hide() {
        if (hidden || isDestroyed) return
        val r = root ?: return
        hidden = true
        controls?.visibility = View.GONE
        rootLp?.let { lp ->
            lp.alpha = 0f
            lp.flags = lp.flags or WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
            runCatching { wm.updateViewLayout(r, lp) }
        }
    }

    fun resume() {
        if (!hidden || isDestroyed) return
        val r = root ?: return
        hidden = false
        rootLp?.let { lp ->
            lp.alpha = 1f
            lp.flags = lp.flags and (WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE).inv()
            runCatching { wm.updateViewLayout(r, lp) }
        }
        controls?.visibility = View.VISIBLE
        relayout()
        r.requestFocus()
    }

    // ------------------------------------------------------------- controls

    private fun fitGlyph() = when (spec.fit) {
        PadProfiles.ORIGINAL -> "▭"     // ▭
        PadProfiles.STRETCH -> "↔"      // ↔
        else -> "⛶"                     // ⛶
    }

    @SuppressLint("ClickableViewAccessibility")
    private fun addControls() {
        fun circle(glyph: String, onClick: () -> Unit) = TextView(context).apply {
            text = glyph
            setTextColor(Color.WHITE)
            textSize = 18f
            gravity = Gravity.CENTER
            background = GradientDrawable().apply { shape = GradientDrawable.OVAL; setColor(0xAA202124.toInt()) }
            setOnClickListener { onClick() }
        }
        val col = LinearLayout(context).apply { orientation = LinearLayout.VERTICAL }
        val size = dp(40)
        val gap = dp(4)
        fun add(v: View) = col.addView(v, LinearLayout.LayoutParams(size, size).apply { topMargin = gap })

        val handleBtn = circle("⋮") { toggleExtra() }
        val back = circle("←") { LMOFreeformServiceHolder.back(displayId) }
        val fit = circle(fitGlyph()) {}
        fit.setOnClickListener {
            // cycle: fill -> original -> stretch
            spec = spec.copy(fit = (spec.fit + 1) % 3)
            PadProfiles.put(context, pkg, spec)
            fit.text = fitGlyph()
            relayout()
        }
        val flip = circle("⟳") {
            rotationDeg = if (rotationDeg == 90f) 270f else 90f
            applyFit()
        }
        val close = circle("✕") { close() }
        add(handleBtn); add(back); add(fit); add(flip); add(close)
        extra = listOf(back, fit, flip, close)
        extra.forEach { it.visibility = View.GONE }
        col.alpha = 0.5f

        val lp = WindowManager.LayoutParams(
            size, WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
                    WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.TOP or Gravity.END
            x = dp(2)
            y = dm().heightPixels / 3
            title = "LMOThunderPadControls"
        }

        // drag the handle up/down
        val slop = ViewConfiguration.get(context).scaledTouchSlop
        var downY = 0f
        var startY = 0
        var moved = false
        handleBtn.setOnTouchListener { _, e ->
            when (e.actionMasked) {
                MotionEvent.ACTION_DOWN -> { downY = e.rawY; startY = lp.y; moved = false; false }
                MotionEvent.ACTION_MOVE -> {
                    val dy = e.rawY - downY
                    if (moved || abs(dy) > slop) {
                        moved = true
                        lp.y = (startY + dy).roundToInt().coerceIn(0, max(0, dm().heightPixels - col.height))
                        runCatching { wm.updateViewLayout(col, lp) }
                    }
                    moved
                }
                MotionEvent.ACTION_UP -> moved   // consume only when it was a drag
                else -> false
            }
        }
        controls = col
        runCatching { wm.addView(col, lp) }
    }

    private fun toggleExtra() {
        val show = extra.firstOrNull()?.visibility != View.VISIBLE
        extra.forEach { it.visibility = if (show) View.VISIBLE else View.GONE }
        controls?.alpha = if (show) 1f else 0.5f
    }

    // -------------------------------------------------------------- closing

    fun close() {
        listener?.taskId?.takeIf { it != -1 }?.let {
            runCatching { SystemServiceHolder.activityTaskManager.removeTask(it) }
        }
        destroy("close", false)
    }

    fun destroy(reason: String, removeTask: Boolean) {
        if (isDestroyed) return
        isDestroyed = true
        Slog.i(TAG, "destroy ThunderPad $pkg ($reason)")
        runCatching { SystemServiceHolder.windowManager.removeRotationWatcher(rotationWatcher) }
        runCatching { context.unregisterReceiver(homeReceiver) }
        listener?.let {
            if (removeTask && it.taskId != -1) {
                runCatching { SystemServiceHolder.activityTaskManager.removeTask(it.taskId) }
            }
            runCatching { SystemServiceHolder.activityTaskManager.unregisterTaskStackListener(it) }
        }
        controls?.let { c -> runCatching { wm.removeViewImmediate(c) } }
        root?.let { r -> runCatching { wm.removeViewImmediate(r) } }
        controls = null
        root = null
        tex = null
        LMOFreeformServiceHolder.releaseFreeform(this)
        ThunderPadManager.onDestroyed(this)
    }

    companion object {
        private const val TAG = "LMOFreeform/ThunderPad"
    }
}
