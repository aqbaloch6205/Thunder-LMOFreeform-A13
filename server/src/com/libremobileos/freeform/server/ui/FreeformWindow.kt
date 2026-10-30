package com.libremobileos.freeform.server.ui

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.drawable.Drawable
import android.graphics.PixelFormat
import android.graphics.SurfaceTexture
import android.os.Build
import android.os.Handler
import android.provider.Settings
import android.util.Slog
import android.view.Display
import android.view.DisplayInfo
import android.graphics.Matrix
import android.view.InputDevice
import android.view.GestureDetector
import android.view.Gravity
import android.view.IRotationWatcher
import android.view.MotionEvent
import android.view.Surface
import android.view.TextureView
import android.view.View
import android.view.ViewGroup
import android.view.WindowManager
import android.view.animation.PathInterpolator
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.TextView
import com.libremobileos.freeform.server.Debug.dlog
import com.libremobileos.freeform.server.LMOFreeformServiceHolder
import com.libremobileos.freeform.server.SystemServiceHolder
import kotlin.math.max
import kotlin.math.min
import kotlin.math.roundToInt
import kotlin.math.sign

class FreeformWindow(
    override val handler: Handler,
    val context: Context,
    private val appConfig: AppConfig,
    val freeformConfig: FreeformConfig
): TextureView.SurfaceTextureListener, FreeformDisplayCallback, View.OnTouchListener, TaskHost {

    override fun onTaskGone(reason: String, removeTask: Boolean) = destroy(reason, removeTask)


    var freeformTaskStackListener: FreeformTaskStackListener? = null
    val windowManager = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
    val windowParams = WindowManager.LayoutParams()
    private val resourceHolder = RemoteResourceHolder(context, FREEFORM_PACKAGE)
    var freeformLayout: ViewGroup? = null
    var freeformWindowView: ViewGroup? = null
    var freeformRootView: ViewGroup? = null
    var freeformView: TextureView? = null
    private var topBarView: View? = null
    private var bottomBarView: View? = null
    private var appIconView: ImageView? = null
    private var packageNameView: TextView? = null
    var veilView: ViewGroup? = null
    private var displayId = Display.INVALID_DISPLAY
    var defaultDisplayWidth = context.resources.displayMetrics.widthPixels
    var defaultDisplayHeight = context.resources.displayMetrics.heightPixels
    var defaultDisplayRotation = context.display.rotation
    private val hangUpGestureListener = HangUpGestureListener(this)
    private val defaultDisplayInfo = DisplayInfo()
    private val destroyRunnable = Runnable { destroy("destroyRunnable", true) }
    
    private val profile = AppProfiles.get(context, appConfig.packageName)
    private val declaredLandscape: Boolean? =
        if (appConfig.userId == -100) null
        else AppProfiles.declaredLandscape(context, appConfig.packageName, appConfig.activityName)
    /** set when the running app asks for an orientation (see FreeformTaskStackListener) */
    private var requestedLandscape: Boolean? = null

    private var appPackageName: String = ""
    var appIcon: Drawable? = null
        private set
    val appLabel: String get() = appPackageName
    @Volatile var isMinimized = false
        private set
    /** locked: the window cannot be moved, resized, minimized or closed by accident */
    @Volatile var isLocked = false
        private set
    private var lockView: ImageView? = null
    private var isInitialized = false

    private val rotationWatcher = object : IRotationWatcher.Stub() {
        override fun onRotationChanged(rotation: Int) {
            dlog(TAG, "onRotationChanged($rotation)")
            handler.post {
                defaultDisplayWidth = context.resources.displayMetrics.widthPixels
                defaultDisplayHeight = context.resources.displayMetrics.heightPixels
                defaultDisplayRotation = context.display.rotation
                reflow()
            }
        }
    }

    /** Re-measure window + virtual display after rotation / orientation change. Handler thread. */
    private fun reflow() {
        measureSize()
        measureScale()
        changeOrientation()
        if (freeformConfig.isHangUp) toHangUp() else makeSureFreeformInScreen()
        LMOFreeformServiceHolder.resizeFreeform(
            this,
            freeformConfig.freeformWidth,
            freeformConfig.freeformHeight,
            freeformConfig.densityDpi
        )
        freeformView?.surfaceTexture?.setDefaultBufferSize(
            freeformConfig.freeformWidth,
            freeformConfig.freeformHeight
        )
    }

    /** The running app asked for landscape/portrait: reshape the window (unless the user forced one). */
    override fun onAppRequestedOrientation(landscape: Boolean) {
        if (profile.orientation != AppProfiles.AUTO) return
        handler.post {
            if (requestedLandscape == landscape) return@post
            requestedLandscape = landscape
            dlog(TAG, "app requested landscape=$landscape")
            reflow()
        }
    }

    private val deviceLandscape: Boolean
        get() = defaultDisplayRotation == Surface.ROTATION_90 ||
                defaultDisplayRotation == Surface.ROTATION_270

    /** Should the floating window be landscape-shaped? profile > running app > manifest > device. */
    private fun isLandscapeWindow(): Boolean = when (profile.orientation) {
        AppProfiles.LANDSCAPE -> true
        AppProfiles.PORTRAIT -> false
        else -> requestedLandscape ?: declaredLandscape ?: deviceLandscape
    }

    companion object {
        private const val TAG = "LMOFreeform/FreeformWindow"
        private const val FREEFORM_PACKAGE = "com.libremobileos.freeform"
        private const val FREEFORM_LAYOUT = "view_freeform"
        private const val WINDOW_DESTROY_WAIT_MS = 10000L
        private const val DRAWABLE_CLOSE = "ic_minimize"
        private const val DRAWABLE_OPEN_FULL_SCREEN = "ic_maximize"
        private const val DRAWABLE_PIN = "ic_pin"
        private const val DRAWABLE_LOCK = "ic_lock"
        private const val DRAWABLE_LOCK_OPEN = "ic_lock_open"
        const val TITLE_CLOSE = "Close"
        const val TITLE_OPEN_FULL_SCREEN = "Open full screen"
        const val TITLE_PIN = "Pin app"
        private val M3_DECELERATE = PathInterpolator(0.05f, 0.7f, 0.1f, 1.0f)
        private val M3_ACCELERATE = PathInterpolator(0.3f, 0.0f, 0.8f, 0.15f)
        private const val M3_DURATION_EXIT = 60L
        private const val M3_DURATION_ENTER = 110L
        private const val SHIFT_DP = 4f
        private const val CONTROL_MODE_SETTING = "freeform_control_mode"
        private const val CONTROL_MODE_BUTTON = "Button"
        private const val CONTROL_MODE_GESTURE = "Gesture"
        private const val LEGACY_BUTTON_MODE = "0"
        private const val LEGACY_GESTURE_MODE = "1"
    }

    init {
        if (LMOFreeformServiceHolder.ping()) {
            Slog.i(TAG, "FreeformWindow init")
            extractPackageInfo()
            populateFreeformConfig()
            handler.post {
                if (addFreeformView()) {
                    isInitialized = true
                } else {
                    destroy("init:addFreeform failed")
                }
            }
        } else {
            Slog.e(TAG, "FreeformWindow init failed: service not running")
            destroy("init:service not running")
        }
    }

    override fun onDisplayPaused() {
        //NOT USED
    }

    override fun onDisplayResumed() {
        //NOT USED
    }

    override fun onDisplayStopped() {
        //NOT USED
    }

    override fun onSurfaceTextureAvailable(surfaceTexture: SurfaceTexture, width: Int, height: Int) {
        dlog(TAG, "onSurfaceTextureAvailable width:$width height:$height")
        if (displayId < 0) {
            LMOFreeformServiceHolder.createDisplay(freeformConfig, appConfig, Surface(surfaceTexture), this)
        }
        surfaceTexture.setDefaultBufferSize(freeformConfig.freeformWidth, freeformConfig.freeformHeight)
    }

    override fun onSurfaceTextureSizeChanged(surfaceTexture: SurfaceTexture, width: Int, height: Int) {
        surfaceTexture.setDefaultBufferSize(freeformConfig.freeformWidth, freeformConfig.freeformHeight)
    }

    override fun onSurfaceTextureDestroyed(surfaceTexture: SurfaceTexture): Boolean {
        return true
    }

    override fun onSurfaceTextureUpdated(surfaceTexture: SurfaceTexture) {
        //NOT USED
    }

    override fun onDisplayAdd(displayId: Int) {
        Slog.i(TAG, "onDisplayAdd displayId=$displayId, $appConfig")
        handler.post {
            this.displayId = displayId
            freeformTaskStackListener = FreeformTaskStackListener(displayId, this)
            SystemServiceHolder.activityTaskManager.registerTaskStackListener(freeformTaskStackListener)
            if (appConfig.taskId != -1) {
                dlog(TAG, "moving taskId=${appConfig.taskId} to freeform display")
                freeformTaskStackListener!!.taskId = appConfig.taskId
                runCatching {
                    // TODO: find a new way for this since getTaskDescription was removed in fwb commit a7cae90a991e
                    // if (SystemServiceHolder.activityTaskManager.getTaskDescription(appConfig.taskId) == null) {
                    //     throw Exception("stale task")
                    // }
                    SystemServiceHolder.activityTaskManager.moveRootTaskToDisplay(appConfig.taskId, displayId)
                }
                .onFailure { e ->
                    Slog.e(TAG, "failed to move task ${appConfig.taskId}: $e, fallback to startApp")
                    startApp()
                }
            } else if (appConfig.userId == -100) {
                if (appConfig.pendingIntent == null) destroy("onDisplayAdd:userId=-100, but pendingIntent is null")
                else {
                    LMOFreeformServiceHolder.startPendingIntent(context, appConfig.pendingIntent, displayId)
                }
            } else {
                startApp()
            }

            val layout = freeformLayout
            if (layout == null) {
                Slog.e(TAG, "freeformLayout is null")
                destroy("onDisplayAdd:freeformLayout is null")
                return@post
            }
            if (!isGestureMode) {
                resourceHolder.getLayoutChildViewByTag<View>(layout, "arrowBack")
                    ?.setOnClickListener(RightViewClickListener(displayId))
            }
        }
    }

    private fun startApp() {
        if (displayId == Display.INVALID_DISPLAY) {
            Slog.e(TAG, "cannot startApp: displayId not yet set!")
            return
        }
        if (LMOFreeformServiceHolder.startApp(context, appConfig, displayId).not())
            destroy("startApp failed")
    }

    @SuppressLint("ClickableViewAccessibility")
    override fun onTouch(view: View, event: MotionEvent): Boolean {
        val newEvent = MotionEvent.obtain(event)
        val scaleMatrix = Matrix().apply {
            setScale(freeformConfig.scale, freeformConfig.scale)
        }
        newEvent.transform(scaleMatrix)
        newEvent.setSource(InputDevice.SOURCE_TOUCHSCREEN)
        LMOFreeformServiceHolder.touch(newEvent, displayId)
        newEvent.recycle()
        return true
    }

    /**
     * get freeform screen dimen / freeform view dimen
     */
    private fun populateFreeformConfig() {
        measureSize()
        measureScale()
        context.display.getDisplayInfo(defaultDisplayInfo)
        val maxRefreshRate = context.display.supportedModes
            .maxOfOrNull { it.refreshRate } ?: defaultDisplayInfo.refreshRate
        freeformConfig.apply {
            refreshRate = maxRefreshRate
            presentationDeadlineNanos = if (maxRefreshRate > 0f) {
                (1_000_000_000L / maxRefreshRate).toLong()
            } else {
                defaultDisplayInfo.presentationDeadlineNanos
            }
            if (profile.dpi in 120..800) densityDpi = profile.dpi
            dlog(TAG, "populateFreeformConfig: $this")
        }
    }

    /**
     * Smart window size. S = short screen side, L = long side.
     *  - portrait-shaped window: width/height are fractions of the screen (global or per-app %)
     *  - landscape-shaped window (landscape games, videos): fixed 16:9, as wide as fits
     */
    fun measureSize() {
        val s = min(defaultDisplayWidth, defaultDisplayHeight).toFloat()
        val l = max(defaultDisplayWidth, defaultDisplayHeight).toFloat()
        val devLand = deviceLandscape
        val landscape = isLandscapeWindow()
        val wFrac = if (profile.widthPct > 0) profile.widthPct.coerceIn(30, 100) / 100f
            else FreeformSettings.fraction(context, FreeformSettings.KEY_WIDTH_PCT, FreeformSettings.DEF_WIDTH_PCT)
        val hFrac = if (profile.heightPct > 0) profile.heightPct.coerceIn(30, 100) / 100f
            else FreeformSettings.fraction(context, FreeformSettings.KEY_HEIGHT_PCT, FreeformSettings.DEF_HEIGHT_PCT)
        val lhFrac = if (profile.heightPct > 0) profile.heightPct.coerceIn(30, 100) / 100f
            else FreeformSettings.fraction(context, FreeformSettings.KEY_LANDSCAPE_HEIGHT_PCT, FreeformSettings.DEF_LANDSCAPE_HEIGHT_PCT)
        freeformConfig.apply {
            if (landscape) {
                // 16:9 window; on a portrait device it uses the full width, on a landscape device 60% of it
                val w = if (devLand) l * (if (profile.widthPct > 0) wFrac else 0.6f)
                        else s * (if (profile.widthPct > 0) wFrac else 0.96f)
                var h = w * 9f / 16f
                if (h > s * 0.9f) h = s * 0.9f
                width = w.roundToInt()
                height = h.roundToInt()
            } else if (!devLand) {
                width = (s * wFrac).roundToInt()
                height = (l * hFrac).roundToInt()
            } else {
                // portrait-shaped window on a landscape device: tall, phone-like proportions
                height = (s * lhFrac).roundToInt()
                width = (height * 0.62f).roundToInt()
            }
            dlog(TAG, "measureSize: landscapeWindow=$landscape devLand=$devLand width=$width height=$height")
        }
    }

    fun measureScale() {
        freeformConfig.apply {
            val widthScale = min(defaultDisplayWidth, defaultDisplayHeight) * 1.0f / min(width, height)
            val heightScale = max(defaultDisplayWidth, defaultDisplayHeight) * 1.0f / max(width, height)
            scale = min(widthScale, heightScale)
            freeformWidth = (width * scale).roundToInt()
            freeformHeight = (height * scale).roundToInt()
            dlog(TAG, "measureScale: $scale freeformWidth=$freeformWidth freeformHeight=$freeformHeight")
        }
    }

    /**
     * Called in system handler
     */
    @SuppressLint("WrongConstant")
    private fun addFreeformView(): Boolean {
        dlog(TAG, "addFreeformView")
        val tmpFreeformLayout = resourceHolder.getLayout(FREEFORM_LAYOUT)!! ?: return false
        freeformLayout = tmpFreeformLayout
        freeformWindowView = FrameLayout(context).apply {
            clipChildren = false
            clipToPadding = false
            addView(
                tmpFreeformLayout,
                FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.CENTER_HORIZONTAL or Gravity.BOTTOM
                )
            )
        }
        freeformRootView = resourceHolder.getLayoutChildViewByTag<FrameLayout>(tmpFreeformLayout, "freeform_root") ?: return false
        veilView = resourceHolder.getLayoutChildViewByTag<FrameLayout>(tmpFreeformLayout, "veilView") ?: return false
        topBarView = resourceHolder.getLayoutChildViewByTag(tmpFreeformLayout, "topBarView") ?: return false
        bottomBarView = resourceHolder.getLayoutChildViewByTag(tmpFreeformLayout, "bottomBarView") ?: return false
        val moveTouchListener = MoveTouchListener(this)
        topBarView?.setOnTouchListener(moveTouchListener)
        bottomBarView?.setOnTouchListener(moveTouchListener)
        val appIconView = resourceHolder.getLayoutChildViewByTag<ImageView>(tmpFreeformLayout, "appIcon")
        val packageNameView = resourceHolder.getLayoutChildViewByTag<TextView>(tmpFreeformLayout, "packageName")
        val pinView = resourceHolder.getLayoutChildViewByTag<View>(tmpFreeformLayout, "pinView")
        val maximizeView = resourceHolder.getLayoutChildViewByTag<View>(tmpFreeformLayout, "maximizeView")
        val minimizeView = resourceHolder.getLayoutChildViewByTag<View>(tmpFreeformLayout, "minimizeView")
        val leftScaleView = resourceHolder.getLayoutChildViewByTag<View>(tmpFreeformLayout, "leftScaleView")
        val rightScaleView = resourceHolder.getLayoutChildViewByTag<View>(tmpFreeformLayout, "rightScaleView")
        val gesturePillTouchView = resourceHolder.getLayoutChildViewByTag<View>(tmpFreeformLayout, "gesturePillTouchView")
        val gesturePillView = resourceHolder.getLayoutChildViewByTag<View>(tmpFreeformLayout, "gesturePill")
        val gesturePillPlateView = resourceHolder.getLayoutChildViewByTag<View>(tmpFreeformLayout, "gesturePillPlate")
        val arrowBackView = resourceHolder.getLayoutChildViewByTag<View>(tmpFreeformLayout, "arrowBack")
        lockView = resourceHolder.getLayoutChildViewByTag<ImageView>(tmpFreeformLayout, "lockView")
        lockView?.apply {
            setImageDrawable(resourceHolder.getDrawable(DRAWABLE_LOCK_OPEN))
            setOnClickListener { toggleLock(it) }
        }
        val veilAppIconView = resourceHolder.getLayoutChildViewByTag<ImageView>(tmpFreeformLayout, "veilAppIcon")
        if (null == leftScaleView || null == rightScaleView || null == pinView
                || null == appIconView || null == packageNameView || null == veilAppIconView
                || null == maximizeView || null == minimizeView
                || null == gesturePillTouchView || null == gesturePillView || null == gesturePillPlateView
                || null == arrowBackView) {
            Slog.e(TAG, "freeform chrome view is null")
            destroy("addFreeformView:freeform chrome view is null")
            return false
        }
        this.appIconView = appIconView
        this.packageNameView = packageNameView
        veilAppIconView.setImageDrawable(appIcon)
        appIconView.setImageDrawable(appIcon)
        packageNameView.text = appPackageName
        if (isGestureMode) {
            pinView.visibility = View.GONE
            maximizeView.visibility = View.GONE
            minimizeView.visibility = View.GONE
            gesturePillTouchView.visibility = View.VISIBLE
            arrowBackView.visibility = View.GONE
            gesturePillTouchView.setOnTouchListener(
                PillGestureController(this, gesturePillView, gesturePillPlateView)
            )
        } else {
            pinView.visibility = View.VISIBLE
            maximizeView.visibility = View.VISIBLE
            minimizeView.visibility = View.VISIBLE
            gesturePillTouchView.visibility = View.GONE
            arrowBackView.visibility = View.VISIBLE
            minimizeView.setOnClickListener(LeftViewClickListener(this))
            maximizeView.setOnClickListener(MaximizeClickListener(this))
            pinView.setOnClickListener(PinClickListener(this))
        }
        leftScaleView.setOnTouchListener(ScaleTouchListener(this, false))
        rightScaleView.setOnTouchListener(ScaleTouchListener(this))

        freeformView = FreeformTextureView(context).apply {
            setOnTouchListener(this@FreeformWindow)
            surfaceTextureListener = this@FreeformWindow
        }
        val rootView = freeformRootView ?: return false
        val view = freeformView ?: return false
        rootView.layoutParams = rootView.layoutParams.apply {
            width = freeformConfig.width
            height = freeformConfig.height
        }
        rootView.addView(view, ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
        windowParams.apply {
            type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
            width = WindowManager.LayoutParams.WRAP_CONTENT
            height = WindowManager.LayoutParams.WRAP_CONTENT
            flags = WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS or
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
                    WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED or
                    WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM
            format = PixelFormat.RGBA_8888
            windowAnimations = android.R.style.Animation_Dialog
        }
        // Set initial positioning based on sidebar position
        setSidebarAwarePosition()
        
        val windowView = freeformWindowView ?: freeformLayout ?: return false
        runCatching {
            windowManager.addView(windowView, windowParams)
            SystemServiceHolder.windowManager.watchRotation(rotationWatcher, Display.DEFAULT_DISPLAY)
        }.onFailure {
            Slog.e(TAG, "addView failed: $it")
            return false
        }
        return true
    }

    /**
     * Pin / shrink-to-minimize: the window is hidden (the app keeps running) and a floating
     * stack bubble ([FreeformStack]) lets the user bring any minimized app back.
     * Called in system handler
     */
    fun handleHangUp() {
        if (isMinimized) restoreFromStack() else minimize()
    }

    private fun toggleLock(v: View) {
        isLocked = !isLocked
        lockView?.apply {
            setImageDrawable(resourceHolder.getDrawable(if (isLocked) DRAWABLE_LOCK else DRAWABLE_LOCK_OPEN))
            if (isLocked) setColorFilter(0xFFFFB300.toInt()) else clearColorFilter()
        }
        v.performHapticFeedback(
            if (isLocked) android.view.HapticFeedbackConstants.CONFIRM else android.view.HapticFeedbackConstants.REJECT)
    }

    fun minimize() {
        val layout = freeformWindowView ?: freeformLayout ?: return
        if (isMinimized) return
        isMinimized = true
        // make sure the size we come back with is the real one (drag may have left a smaller root)
        freeformRootView?.let { root ->
            root.layoutParams = root.layoutParams.apply {
                width = freeformConfig.width
                height = freeformConfig.height
            }
        }
        windowParams.apply {
            alpha = 0f
            flags = flags or WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
        }
        runCatching { windowManager.updateViewLayout(layout, windowParams) }
            .onFailure { Slog.e(TAG, "minimize: $it") }
        FreeformStack.add(this)
    }

    fun restoreFromStack() {
        val layout = freeformWindowView ?: freeformLayout ?: return
        if (!isMinimized) return
        isMinimized = false
        windowParams.apply {
            alpha = 1f
            flags = flags and WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE.inv()
        }
        // (do not remove/re-add the view: that would destroy the TextureView surface)
        runCatching { windowManager.updateViewLayout(layout, windowParams) }
            .onFailure { Slog.e(TAG, "restore: $it") }
        FreeformStack.remove(this)
    }

    /** Apply a new window size: re-measure and resize the virtual display so the app re-lays out. */
    fun applyWindowSize(w: Int, h: Int) {
        handler.post {
            freeformConfig.width = w
            freeformConfig.height = h
            measureScale()
            LMOFreeformServiceHolder.resizeFreeform(
                this, freeformConfig.freeformWidth, freeformConfig.freeformHeight, freeformConfig.densityDpi)
            freeformView?.surfaceTexture?.setDefaultBufferSize(
                freeformConfig.freeformWidth, freeformConfig.freeformHeight)
        }
    }

    /**
     * Called in system handler
     */
    fun toHangUp() {
        val rootView = freeformRootView ?: return
        val layout = freeformWindowView ?: freeformLayout ?: return
        
        windowParams.apply {
            x = (defaultDisplayWidth / 2 - freeformConfig.hangUpWidth / 2)
            y = -(defaultDisplayHeight / 2 - freeformConfig.hangUpHeight / 2)
            flags = flags xor WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM
        }
        rootView.layoutParams = rootView.layoutParams.apply {
            width = freeformConfig.hangUpWidth
            height = freeformConfig.hangUpHeight
        }
        runCatching { windowManager.updateViewLayout(layout, windowParams) }.onFailure { Slog.e(TAG, "$it") }
    }

    /**
     * Called in uiHandler
     */
    fun makeSureFreeformInScreen() {
        val rootView = freeformRootView ?: return
        
        if (!freeformConfig.isHangUp) {
            val maxWidth = defaultDisplayWidth
            val maxHeight = (defaultDisplayHeight * 0.9).roundToInt()
            if (rootView.layoutParams.width > maxWidth || rootView.layoutParams.height > maxHeight) {
                rootView.layoutParams = rootView.layoutParams.apply {
                    width = min(rootView.width, maxWidth)
                    height = min(rootView.height, maxHeight)
                }
            }
        }
        if (windowParams.x < -(defaultDisplayWidth / 2)) FreeformAnimation.moveInScreenAnimator(windowParams.x, -(defaultDisplayWidth / 2), 300, true, this)
        else if (windowParams.x > (defaultDisplayWidth / 2)) FreeformAnimation.moveInScreenAnimator(windowParams.x, (defaultDisplayWidth / 2), 300, true, this)
        if (windowParams.y < -(defaultDisplayHeight / 2)) FreeformAnimation.moveInScreenAnimator(windowParams.y, -(defaultDisplayHeight / 2), 300, false, this)
        else if (windowParams.y > (defaultDisplayHeight / 2)) FreeformAnimation.moveInScreenAnimator(windowParams.y, (defaultDisplayHeight / 2), 300, false, this)
    }

    /**
     * Change freeform orientation
     * Called in system handler
     */
    fun changeOrientation() {
        val rootView = freeformRootView ?: return
        
        rootView.layoutParams = rootView.layoutParams.apply {
            width = if (freeformConfig.isHangUp) freeformConfig.hangUpWidth else freeformConfig.width
            height = if (freeformConfig.isHangUp) freeformConfig.hangUpHeight else freeformConfig.height
        }
    }

    fun getFreeformId(): String {
        return "${appConfig.packageName},${appConfig.activityName},${appConfig.userId}"
    }

    fun goBack() {
        if (displayId == Display.INVALID_DISPLAY) return
        LMOFreeformServiceHolder.back(displayId)
    }

    val closeIcon: Drawable?
        get() = resourceHolder.getDrawable(DRAWABLE_CLOSE)

    val openFullScreenIcon: Drawable?
        get() = resourceHolder.getDrawable(DRAWABLE_OPEN_FULL_SCREEN)

    val pinIcon: Drawable?
        get() = resourceHolder.getDrawable(DRAWABLE_PIN)

    fun updateTitle(
        title: CharSequence?,
        icon: Drawable? = null,
        directionY: Float = 0f,
        animated: Boolean = true
    ) {
        val text = title ?: return
        if (!handler.looper.isCurrentThread) {
            handler.post { updateTitle(text, icon, directionY, animated) }
            return
        }

        val nameView = packageNameView ?: return
        val iconView = appIconView

        if (nameView.text == text) {
            if (nameView.alpha == 1f && nameView.translationY == 0f) return
            nameView.animate().cancel()
            iconView?.animate()?.cancel()
            nameView.animate()
                .alpha(1f)
                .translationY(0f)
                .setDuration(M3_DURATION_ENTER)
                .setInterpolator(M3_DECELERATE)
                .start()
            iconView?.animate()
                ?.alpha(1f)
                ?.translationY(0f)
                ?.setDuration(M3_DURATION_ENTER)
                ?.setInterpolator(M3_DECELERATE)
                ?.start()
            return
        }

        if (!animated) {
            nameView.animate().cancel()
            iconView?.animate()?.cancel()
            nameView.text = text
            nameView.alpha = 1f
            nameView.translationY = 0f
            icon?.let { iconView?.setImageDrawable(it) }
            iconView?.alpha = 1f
            iconView?.translationY = 0f
            return
        }

        val shiftPx = SHIFT_DP * context.resources.displayMetrics.density * (if (directionY != 0f) sign(directionY) else -1f)

        nameView.animate().cancel()
        iconView?.animate()?.cancel()

        iconView?.animate()
            ?.alpha(0f)
            ?.translationY(shiftPx)
            ?.setDuration(M3_DURATION_EXIT)
            ?.setInterpolator(M3_ACCELERATE)
            ?.start()

        nameView.animate()
            .alpha(0f)
            .translationY(shiftPx)
            .setDuration(M3_DURATION_EXIT)
            .setInterpolator(M3_ACCELERATE)
            .withEndAction {
                nameView.text = text
                nameView.translationY = -shiftPx
                nameView.animate()
                    .alpha(1f)
                    .translationY(0f)
                    .setDuration(M3_DURATION_ENTER)
                    .setInterpolator(M3_DECELERATE)
                    .start()

                iconView?.let { iv ->
                    icon?.let { iv.setImageDrawable(it) }
                    iv.translationY = -shiftPx
                    iv.animate()
                        .alpha(1f)
                        .translationY(0f)
                        .setDuration(M3_DURATION_ENTER)
                        .setInterpolator(M3_DECELERATE)
                        .start()
                }
            }
            .start()
    }

    fun resetTitle(directionY: Float = 0f, animated: Boolean = true) {
        updateTitle(appPackageName, appIcon, directionY, animated)
    }

    fun enterFullscreen() {
        updateTitle(TITLE_OPEN_FULL_SCREEN, openFullScreenIcon, directionY = 1f)
        val listener = freeformTaskStackListener
        if (listener == null || listener.taskId == -1) {
            Slog.e(TAG, "taskId is -1, can`t move")
            return
        }
        runCatching {
            SystemServiceHolder.activityTaskManager.moveRootTaskToDisplay(listener.taskId, Display.DEFAULT_DISPLAY)
        }.onFailure {
            Slog.e(TAG, "enterFullscreen failed", it)
        }
    }

    fun close() {
        dlog(TAG, "close()")
        updateTitle(TITLE_CLOSE, closeIcon, directionY = -1f)
        runCatching {
            SystemServiceHolder.activityTaskManager.removeTask(freeformTaskStackListener!!.taskId)
            removeView()
        }.onFailure { exception ->
            Slog.e(TAG, "removeTask failed: ", exception)
            destroy("window.close() fallback")
        }
    }

    fun removeView(runDestroy: Boolean = true) {
        dlog(TAG, "removeView($runDestroy)")
        handler.removeCallbacks(destroyRunnable)
        
        (freeformWindowView ?: freeformLayout)?.let { layout ->
            handler.post {
                runCatching {
                    windowManager.removeViewImmediate(layout)
                    dlog(TAG, "removeView success")
                }.onFailure { exception ->
                    Slog.e(TAG, "removeView failed $exception")
                }
            }
        }
        
        // wait for onTaskRemoved(), but take it into our own hands in case its never triggered.
        if (runDestroy)
            handler.postDelayed(destroyRunnable, WINDOW_DESTROY_WAIT_MS)
    }

    fun destroy(callReason: String, shouldRemoveTask: Boolean = false) {
        Slog.i(TAG, "destroy ${getFreeformId()}, displayId=$displayId callReason: $callReason")
        
        if (!isInitialized) {
            Slog.w(TAG, "destroy called on uninitialized window")
            return
        }
        
        FreeformStack.remove(this)
        removeView(false)
        handler.removeCallbacks(destroyRunnable)
        
        freeformTaskStackListener?.let {
            SystemServiceHolder.activityTaskManager.unregisterTaskStackListener(it)
        }
        
        runCatching {
            SystemServiceHolder.windowManager.removeRotationWatcher(rotationWatcher)
        }.onFailure {
            Slog.e(TAG, "Failed to remove rotation watcher", it)
        }
        
        LMOFreeformServiceHolder.releaseFreeform(this)
        FreeformWindowManager.removeWindow(getFreeformId())
        
        freeformTaskStackListener?.taskId?.let {
            if (it != -1 && shouldRemoveTask) {
                Slog.i(TAG, "destroy: remove taskId $it again")
                runCatching { SystemServiceHolder.activityTaskManager.removeTask(it) }
            }
        }
        
        packageNameView?.animate()?.cancel()
        packageNameView?.alpha = 1f
        packageNameView?.translationY = 0f
        appIconView?.animate()?.cancel()
        appIconView?.alpha = 1f
        appIconView?.translationY = 0f
        packageNameView = null
        appIconView = null
        isInitialized = false
    }
    
    private fun extractPackageInfo() {
        try {
            val pm = context.packageManager
            val ai = pm.getApplicationInfo(appConfig.packageName, 0)
            appPackageName = pm.getApplicationLabel(ai).toString()
            appIcon = pm.getApplicationIcon(ai)
        } catch (e: Exception) {
            Slog.e(TAG, "Failed to retrieve app info: ${e.message}")
            appPackageName = ""
            appIcon = null
        }
    }
    
    private fun setSidebarAwarePosition() {
        val isLandscape = defaultDisplayWidth > defaultDisplayHeight
        val windowWidth = freeformConfig.width
        val margin = 80 // pixels from edge
        
        windowParams.apply {
            if (isLandscape) {
                // Landscape: position on left side of screen
                x = -(defaultDisplayWidth / 2) + (windowWidth / 2) + margin
                y = 0 // center vertically
            } else {
                // Portrait: center on screen
                x = 0 // center horizontally
                y = -(defaultDisplayHeight / 8) // slightly above center
            }
        }
        
        val mode = if (isLandscape) "landscape (left side)" else "portrait (center)"
        dlog(TAG, "Orientation-aware positioning: $mode, windowX=${windowParams.x}, windowY=${windowParams.y}, screenSize=${defaultDisplayWidth}x${defaultDisplayHeight}")
    }
    
    private fun setDefaultPosition() {
        // Use the same left side positioning as default
        setSidebarAwarePosition()
    }

    private val isGestureMode: Boolean
        get() {
            val mode = Settings.System.getString(context.contentResolver, CONTROL_MODE_SETTING)
            return when {
                mode == null -> false // default: Button mode (pin / maximize / close in title bar)
                mode.equals(CONTROL_MODE_BUTTON, ignoreCase = true) ||
                        mode == LEGACY_BUTTON_MODE -> false
                mode.equals(CONTROL_MODE_GESTURE, ignoreCase = true) ||
                        mode == LEGACY_GESTURE_MODE -> true
                else -> true
            }
        }
}
