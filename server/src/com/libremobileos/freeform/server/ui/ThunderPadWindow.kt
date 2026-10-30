package com.libremobileos.freeform.server.ui

import android.annotation.SuppressLint
import android.app.ActivityManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.graphics.Color
import android.graphics.Matrix
import android.graphics.PixelFormat
import android.graphics.Point
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
import android.view.SurfaceHolder
import android.view.SurfaceView
import android.view.TextureView
import android.view.View
import android.view.ViewConfiguration
import android.view.WindowInsets
import android.view.WindowInsetsController
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.ImageView
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
 * truly fullscreen (status + navigation bars hidden, swipe from the edge shows them), behaving like a normal app:
 *  - FILL (default): fills the whole screen without bars or distortion (resolution adapts to the phone's aspect)
 *  - ORIGINAL: exact tablet aspect ratio, black bars;  STRETCH: exact tablet resolution stretched to the screen
 *  - the app's own orientation is followed; if it wants landscape while the phone is held portrait the picture is
 *    rotated, so turning the phone makes it upright
 *  - Home / Recents / another app hides the pad (the app keeps running); a small bubble or the sidebar brings it
 *    back exactly as it was. Close (x) really closes it.
 * Rendering uses a SurfaceView (composed directly by SurfaceFlinger = best performance); only the rotated case
 * needs a TextureView.
 */
class ThunderPadWindow(
    override val handler: Handler,
    private val context: Context,
    private val appConfig: AppConfig,
    val pkg: String,
    private var spec: PadProfile
) : FreeformDisplayCallback, TaskHost {

    private val wm = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
    private val cfg = FreeformConfig(spec.w, spec.h, spec.dpi)
    private var root: FrameLayout? = null
    private var rootLp: WindowManager.LayoutParams? = null
    private var content: View? = null
    private var controls: View? = null
    private var bubble: View? = null
    private var extra: List<View> = emptyList()
    private var displayId = Display.INVALID_DISPLAY
    private var vdRequested = false
    private var listener: FreeformTaskStackListener? = null
    private var requestedLandscape: Boolean? = null
    private var rotationDeg = 90f
    private var hidden = false
    private var downNearBottom = false
    private var touchMoved = false
    private val rehide = Runnable { root?.let { hideSystemBars(it) } }
    private var lastW = 0
    private var lastH = 0
    @Volatile var isDestroyed = false
        private set
    private val declaredLandscape = AppProfiles.declaredLandscape(context, pkg, appConfig.activityName)

    // real (physical) screen size, not reduced by bars / cutout
    private fun real(): Point {
        val p = Point()
        runCatching { context.display.getRealSize(p) }
        if (p.x <= 0 || p.y <= 0) {
            val d = context.resources.displayMetrics
            p.set(d.widthPixels, d.heightPixels)
        }
        return p
    }
    private fun dens() = context.resources.displayMetrics.density
    private fun dp(v: Int) = (v * dens()).roundToInt()

    private class Layout(val rotated: Boolean, val ew: Int, val eh: Int, val pw: Int, val ph: Int, val dpi: Int)

    private fun even(v: Int) = max(2, v and 1.inv())

    private fun computeLayout(): Layout {
        val s = real()
        val sw = s.x
        val sh = s.y
        val screenLand = sw > sh
        val wantLand = requestedLandscape ?: declaredLandscape ?: screenLand
        val rotated = wantLand != screenLand
        val ew = if (rotated) sh else sw
        val eh = if (rotated) sw else sh
        val hi = max(spec.w, spec.h)
        val lo = min(spec.w, spec.h)
        val pw: Int
        val ph: Int
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
            val s = real()
            lastW = s.x; lastH = s.y
            val r = FrameLayout(context).apply {
                setBackgroundColor(Color.BLACK)
                isFocusable = true
                isFocusableInTouchMode = true
                @Suppress("DEPRECATION")
                systemUiVisibility = View.SYSTEM_UI_FLAG_LAYOUT_STABLE or
                        View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION or
                        View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or
                        View.SYSTEM_UI_FLAG_HIDE_NAVIGATION or
                        View.SYSTEM_UI_FLAG_FULLSCREEN or
                        View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                setOnKeyListener { _, code, ev ->
                    if (code == KeyEvent.KEYCODE_BACK) {
                        if (ev.action == KeyEvent.ACTION_UP) LMOFreeformServiceHolder.back(displayId)
                        true
                    } else false
                }
            }
            root = r
            // system bars must only appear on a deliberate edge swipe, not after a tap / game touch
            r.setOnApplyWindowInsetsListener { v, insets ->
                if (insets.isVisible(WindowInsets.Type.systemBars()) && !hidden) {
                    handler.removeCallbacks(rehide)
                    handler.postDelayed(rehide, if (touchMoved) 2200L else 150L)
                }
                v.onApplyWindowInsets(insets)
            }
            attachContent()

            val lp = WindowManager.LayoutParams(
                s.x, s.y,
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
                WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS or
                        WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN or
                        WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED,
                PixelFormat.OPAQUE
            ).apply {
                gravity = Gravity.TOP or Gravity.START
                x = 0
                y = 0
                // truly fullscreen: do not shrink for system bars / display cutout / rounded corners
                fitInsetsTypes = 0
                fitInsetsSides = 0
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
            r.post { hideSystemBars(r) }
            runCatching { SystemServiceHolder.windowManager.watchRotation(rotationWatcher, Display.DEFAULT_DISPLAY) }
            runCatching {
                context.registerReceiverForAllUsers(homeReceiver,
                    IntentFilter(Intent.ACTION_CLOSE_SYSTEM_DIALOGS), null, handler)
            }
        }
    }

    private fun hideSystemBars(r: View) {
        runCatching {
            r.windowInsetsController?.let {
                it.systemBarsBehavior = WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
                it.hide(WindowInsets.Type.systemBars())
            }
        }
    }

    private fun apply(l: Layout) {
        cfg.freeformWidth = l.pw
        cfg.freeformHeight = l.ph
        cfg.densityDpi = l.dpi
    }

    // ------------------------------------------------------ content (view)

    /** SurfaceView normally (fast path); TextureView only when the picture has to be rotated */
    @SuppressLint("ClickableViewAccessibility")
    private fun attachContent() {
        val r = root ?: return
        content?.let { old -> r.removeView(old) }
        val l = lay
        val v: View = if (l.rotated) {
            TextureView(context).apply {
                surfaceTextureListener = object : TextureView.SurfaceTextureListener {
                    override fun onSurfaceTextureAvailable(st: SurfaceTexture, w: Int, h: Int) {
                        st.setDefaultBufferSize(cfg.freeformWidth, cfg.freeformHeight)
                        onSurface(Surface(st))
                    }
                    override fun onSurfaceTextureSizeChanged(st: SurfaceTexture, w: Int, h: Int) {
                        st.setDefaultBufferSize(cfg.freeformWidth, cfg.freeformHeight)
                    }
                    override fun onSurfaceTextureDestroyed(st: SurfaceTexture): Boolean {
                        if (!isDestroyed) LMOFreeformServiceHolder.setSurface(this@ThunderPadWindow, null)
                        return true
                    }
                    override fun onSurfaceTextureUpdated(st: SurfaceTexture) {}
                }
                setOnTouchListener { view, ev -> forwardTouch(view, ev) }
            }
        } else {
            SurfaceView(context).apply {
                holder.setFixedSize(cfg.freeformWidth, cfg.freeformHeight)
                holder.addCallback(object : SurfaceHolder.Callback {
                    override fun surfaceCreated(h: SurfaceHolder) { onSurface(h.surface) }
                    override fun surfaceChanged(h: SurfaceHolder, f: Int, w: Int, hh: Int) {}
                    override fun surfaceDestroyed(h: SurfaceHolder) {
                        if (!isDestroyed) LMOFreeformServiceHolder.setSurface(this@ThunderPadWindow, null)
                    }
                })
                setOnTouchListener { view, ev -> forwardTouch(view, ev) }
            }
        }
        content = v
        r.addView(v, 0, FrameLayout.LayoutParams(l.ew, l.eh, Gravity.CENTER))
        applyFit()
    }

    private fun onSurface(surface: Surface) {
        if (isDestroyed) return
        if (!vdRequested) {
            vdRequested = true
            LMOFreeformServiceHolder.createDisplay(cfg, appConfig, surface, this)
        } else {
            LMOFreeformServiceHolder.setSurface(this, surface)
        }
    }

    /** size / rotation for the current layout + fit mode */
    private fun applyFit() {
        val v = content ?: return
        val l = lay
        var w = l.ew
        var h = l.eh
        if (spec.fit == PadProfiles.ORIGINAL) {
            val s = min(l.ew.toFloat() / l.pw, l.eh.toFloat() / l.ph)
            w = (l.pw * s).roundToInt()
            h = (l.ph * s).roundToInt()
        }
        v.layoutParams = FrameLayout.LayoutParams(w, h, Gravity.CENTER)
        v.rotation = if (l.rotated) rotationDeg else 0f
    }

    /** screen rotated, app asked for another orientation, or fit mode changed */
    private fun relayout() {
        if (isDestroyed) return
        val r = root ?: return
        val old = lay
        lay = computeLayout()
        apply(lay)
        val s = real()
        lastW = s.x; lastH = s.y
        runCatching {
            val lp = rootLp ?: return@runCatching
            lp.width = s.x
            lp.height = s.y
            wm.updateViewLayout(r, lp)
        }
        if (old.rotated != lay.rotated) {
            attachContent()          // view type changes (SurfaceView <-> TextureView)
        } else {
            val v = content
            if (v is SurfaceView) v.holder.setFixedSize(lay.pw, lay.ph)
            if (v is TextureView) v.surfaceTexture?.setDefaultBufferSize(lay.pw, lay.ph)
            applyFit()
        }
        if (old.pw != lay.pw || old.ph != lay.ph || old.dpi != lay.dpi) {
            LMOFreeformServiceHolder.resizeFreeform(this, lay.pw, lay.ph, lay.dpi)
        }
    }

    override fun onAppRequestedOrientation(landscape: Boolean) {
        handler.post {
            if (requestedLandscape == landscape) return@post
            requestedLandscape = landscape
            relayout()
        }
    }

    // the foreground activity of our display: orientation from its manifest / request
    private var checking = false
    override fun onStackChanged() {
        if (checking || displayId < 0 || isDestroyed) return
        checking = true
        handler.postDelayed({ checking = false; checkTopOrientation() }, 300)
    }

    @Suppress("UNCHECKED_CAST")
    private fun checkTopOrientation() {
        runCatching {
            val atm = SystemServiceHolder.activityTaskManager
            val m = atm.javaClass.methods.filter { it.name == "getTasks" }.minByOrNull { it.parameterCount } ?: return
            val args: Array<Any> = when (m.parameterCount) {
                1 -> arrayOf(30)
                3 -> arrayOf(30, false, false)
                else -> return
            }
            val list = m.invoke(atm, *args) as? List<ActivityManager.RunningTaskInfo> ?: return
            val t = list.firstOrNull { it.displayId == displayId } ?: return
            val o = t.topActivityInfo?.screenOrientation ?: return
            AppProfiles.landscapeFromOrientation(o)?.let { onAppRequestedOrientation(it) }
        }
    }

    private fun forwardTouch(v: View, ev: MotionEvent): Boolean {
        // swipe up from the bottom edge (gesture navigation: home / recents) -> hide like a normal app goes away
        when (ev.actionMasked) {
            MotionEvent.ACTION_DOWN -> { downNearBottom = ev.rawY > real().y - dp(40); touchMoved = false }
            MotionEvent.ACTION_MOVE -> touchMoved = true
            MotionEvent.ACTION_CANCEL -> if (downNearBottom) { downNearBottom = false; handler.post { hide() } }
            MotionEvent.ACTION_UP -> {
                downNearBottom = false
                if (!touchMoved) handler.post { root?.let { hideSystemBars(it) } }   // a tap never keeps the bars
            }
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

    // ------------------------------------------------------------ display

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
            // activities that only pick their orientation after start
            handler.postDelayed({ checkTopOrientation() }, 1200)
            handler.postDelayed({ checkTopOrientation() }, 3500)
        }
    }

    override fun onTaskGone(reason: String, removeTask: Boolean) = destroy(reason, removeTask)

    override fun onDefaultDisplayFront() {
        hide()
    }

    // ------------------------------------------------------ hide / resume

    /** back to home / another app: hide the pad, keep the app running, leave a small bubble to return */
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
        showBubble()
    }

    fun resume() {
        if (!hidden || isDestroyed) return
        val r = root ?: return
        hidden = false
        removeBubble()
        rootLp?.let { lp ->
            lp.alpha = 1f
            lp.flags = lp.flags and (WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE).inv()
            runCatching { wm.updateViewLayout(r, lp) }
        }
        controls?.visibility = View.VISIBLE
        val s = real()
        if (s.x != lastW || s.y != lastH) relayout()      // only when the screen really changed (no needless resize)
        r.requestFocus()
        r.post { hideSystemBars(r) }
    }

    @SuppressLint("ClickableViewAccessibility")
    private fun showBubble() {
        if (bubble != null) return
        val size = dp(52)
        val icon = runCatching { context.packageManager.getApplicationIcon(pkg) }.getOrNull()
        val b = FrameLayout(context).apply {
            background = GradientDrawable().apply { shape = GradientDrawable.OVAL; setColor(0xE6303134.toInt()) }
            elevation = dp(6).toFloat()
            addView(ImageView(context).apply {
                setImageDrawable(icon)
                setPadding(dp(9), dp(9), dp(9), dp(9))
            }, FrameLayout.LayoutParams(size, size))
            setOnClickListener { handler.post { resume() } }
            contentDescription = "Resume"
        }
        val lp = WindowManager.LayoutParams(
            size, size, WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
                    WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.TOP or Gravity.START
            x = dp(4)
            y = real().y / 3
            title = "LMOThunderPadBubble"
        }
        if (runCatching { wm.addView(b, lp) }.isSuccess) {
            bubble = b
            b.scaleX = 0.3f; b.scaleY = 0.3f; b.alpha = 0f
            b.animate().scaleX(1f).scaleY(1f).alpha(1f).setDuration(220)
                .setInterpolator(android.view.animation.OvershootInterpolator(1.4f)).start()
        }
    }

    private fun removeBubble() {
        bubble?.let { b -> runCatching { wm.removeViewImmediate(b) } }
        bubble = null
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
            background = GradientDrawable().apply { shape = GradientDrawable.OVAL; setColor(0xB3202124.toInt()) }
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
        col.alpha = 0.45f

        val lp = WindowManager.LayoutParams(
            size, WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
                    WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN or
                    WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.TOP or Gravity.END
            x = dp(2)
            y = real().y / 3
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
                        lp.y = (startY + dy).roundToInt().coerceIn(0, max(0, real().y - col.height))
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
        controls?.alpha = if (show) 1f else 0.45f
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
        removeBubble()
        controls?.let { c -> runCatching { wm.removeViewImmediate(c) } }
        root?.let { r -> runCatching { wm.removeViewImmediate(r) } }
        controls = null
        root = null
        content = null
        LMOFreeformServiceHolder.releaseFreeform(this)
        ThunderPadManager.onDestroyed(this)
    }

    companion object {
        private const val TAG = "LMOFreeform/ThunderPad"
    }
}
