package com.libremobileos.freeform.server

import android.app.ActivityThread
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Slog

/**
 * Called once from SystemServer.startOtherServices() (smali hook, right after
 * ActivityManagerService.systemReady()). Never throws.
 */
object LMOFreeformBoot {
    private const val TAG = "LMOFreeform/Boot"
    private var started = false

    @JvmStatic
    fun start(systemContext: Context) {
        if (started) return
        started = true
        try {
            // UI-capable context: needed for windowManager.addView() and Context.getDisplay()
            val ctx = systemUiContext() ?: systemContext
            val handler = Handler(Looper.getMainLooper())

            SystemServiceHolder.init()
            LMOFreeformServiceHolder.init(LMOFreeformService(ctx, handler))
            LMOFreeformController(ctx, handler).register()
            Slog.i(TAG, "LMOFreeform (A13 port) started")
        } catch (t: Throwable) {
            Slog.e(TAG, "LMOFreeform failed to start", t)
        }
    }

    // ActivityThread.getSystemUiContext() returns the package-private ContextImpl;
    // call it via reflection so our dex never references that class directly.
    private fun systemUiContext(): Context? = runCatching {
        val at = ActivityThread.currentActivityThread()
        ActivityThread::class.java.getMethod("getSystemUiContext").invoke(at) as? Context
    }.getOrNull()
}
