package com.libremobileos.freeform.server.ui

import android.annotation.SuppressLint
import android.content.Context
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
 * ThunderPad: the app runs on a VirtualDisplay with a tablet resolution (e.g. iPad mini 5, 2048x1536)
 * and is shown fullscreen. ORIGINAL keeps the aspect ratio (black bars), STRETCH fills the screen.
 * A small edge handle offers Back / Original-Stretch / Close. The hardware/gesture Back key also works.
 */
class ThunderPadWindow(
    override val handler: Handler,
    private val context: Context,
    private val appConfig: AppConfig,
    private val pkg: String,
    private var spec: PadProfile
) : TextureView.SurfaceTextureListener, FreeformDisplayCallback, TaskHost {

    private val wm = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
    private val cfg = FreeformConfig(spec.w, spec.h, spec.dpi)
    private var root: FrameLayout? = null
    private var tex: TextureView? = null
    private var controls: View? = null
    private var controlsLp: WindowManager.LayoutParams? = null
    private var extra: List<View> = emptyList()
    private var displayId = Display.INVALID_DISPLAY
    private var listener: FreeformTaskStackListener? = null
    private var requestedLandscape: Boolean? = null
    private var destroyed = false
    private val declaredLandscape = AppProfiles.declaredLandscape(context, pkg, appConfig.activityName)

    private fun dm() = context.resources.displayMetrics
    private fun dp(v: Int) = (v * dm().density).roundToInt()

    private fun wantLandscape(): Boolean =
        requestedLandscape ?: declaredLandscape ?: (dm().widthPixels > dm().heightPixels)

    private fun padDims(): Pair<Int, Int> {
        val hi = max(spec.w, spec.h)
        val lo = min(spec.w, spec.h)
        return if (wantLandscape()) hi to lo else lo to hi
    }

    private val rotationWatcher = object : IRotationWatcher.Stub() {
        override fun onRotationChanged(rotation: Int) {
            handler.post { relayout() }
        }
    }

    // ---------------------------------------------------------------- show

    @SuppressLint("ClickableViewAccessibility")
    fun show() {
        handler.post {
            val (pw, ph) = padDims()
            cfg.freeformWidth = pw
            cfg.freeformHeight = ph

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
            val ok = runCatching { wm.addView(r, lp) }.onFailure { Slog.e(TAG, "addView failed", it) }.isSuccess
            if (!ok) { destroy("addView failed", false); return@post }
            r.requestFocus()
            runCatching { SystemServiceHolder.windowManager.watchRotation(rotationWatcher, Display.DEFAULT_DISPLAY) }
        }
    }

    /** texture size / position for ORIGINAL (contain) or STRETCH (fill) */
    private fun applyFit() {
        val t = tex ?: return
        val sw = dm().widthPixels
        val sh = dm().heightPixels
        val (pw, ph) = padDims()
        val lp = FrameLayout.LayoutParams(sw, sh, Gravity.CENTER)
        if (spec.fit != PadProfiles.STRETCH) {
            val s = min(sw.toFloat() / pw, sh.toFloat() / ph)
            lp.width = (pw * s).roundToInt()
            lp.height = (ph * s).roundToInt()
        }
        t.layoutParams = lp
    }

    /** screen rotated or the app asked for another orientation */
    private fun relayout() {
        if (destroyed) return
        val r = root ?: return
        val (pw, ph) = padDims()
        cfg.freeformWidth = pw
        cfg.freeformHeight = ph
        runCatching {
            val lp = r.layoutParams as WindowManager.LayoutParams
            lp.width = dm().widthPixels
            lp.height = dm().heightPixels
            wm.updateViewLayout(r, lp)
        }
        applyFit()
        LMOFreeformServiceHolder.resizeFreeform(this, pw, ph, cfg.densityDpi)
        tex?.surfaceTexture?.setDefaultBufferSize(pw, ph)
    }

    override fun onAppRequestedOrientation(landscape: Boolean) {
        handler.post {
            if (requestedLandscape == landscape) return@post
            requestedLandscape = landscape
            relayout()
        }
    }

    private fun forwardTouch(v: View, ev: MotionEvent): Boolean {
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
            if (destroyed) return@post
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

    // ------------------------------------------------------------- controls

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
        val fit = circle(if (spec.fit == PadProfiles.STRETCH) "▣" else "□") {}
        fit.setOnClickListener {
            spec = spec.copy(fit = if (spec.fit == PadProfiles.STRETCH) PadProfiles.ORIGINAL else PadProfiles.STRETCH)
            PadProfiles.put(context, pkg, spec)
            fit.text = if (spec.fit == PadProfiles.STRETCH) "▣" else "□"
            applyFit()
        }
        val close = circle("✕") { close() }
        add(handleBtn); add(back); add(fit); add(close)
        extra = listOf(back, fit, close)
        extra.forEach { it.visibility = View.GONE }
        col.alpha = 0.55f

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
        controlsLp = lp

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
                        lp.y = (startY + dy).roundToInt().coerceIn(0, dm().heightPixels - col.height)
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
        controls?.alpha = if (show) 1f else 0.55f
    }

    // -------------------------------------------------------------- closing

    fun close() {
        listener?.taskId?.takeIf { it != -1 }?.let {
            runCatching { SystemServiceHolder.activityTaskManager.removeTask(it) }
        }
        destroy("close", false)
    }

    fun destroy(reason: String, removeTask: Boolean) {
        if (destroyed) return
        destroyed = true
        Slog.i(TAG, "destroy ThunderPad $pkg ($reason)")
        runCatching { SystemServiceHolder.windowManager.removeRotationWatcher(rotationWatcher) }
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
