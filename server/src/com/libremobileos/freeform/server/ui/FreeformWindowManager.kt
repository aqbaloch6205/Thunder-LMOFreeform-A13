package com.libremobileos.freeform.server.ui

import android.app.PendingIntent
import android.content.Context
import android.os.Handler
import com.libremobileos.freeform.server.Debug.dlog

object FreeformWindowManager {
    private const val TAG = "FreeformWindowManager"
    private val freeformWindows = HashMap<String, FreeformWindow>(1)

    fun addWindow(
        handler: Handler, context: Context,
        packageName: String, activityName: String, userId: Int, taskId: Int,
        pendingIntent: PendingIntent?, width: Int, height: Int, densityDpi: Int
    ) {
        val appConfig = AppConfig(packageName, activityName, pendingIntent, userId, taskId)
        val freeformConfig = FreeformConfig(width, height, densityDpi)
        val window = FreeformWindow(handler, context, appConfig, freeformConfig)
        dlog(TAG, "addWindow: $packageName/$activityName id=${window.getFreeformId()}")
        freeformWindows[window.getFreeformId()]?.let {
            it.close()
            it.destroy("addWindow", false)
        }
        freeformWindows[window.getFreeformId()] = window
    }

    fun removeWindow(freeformId: String, close: Boolean = false) {
        val removed = freeformWindows.remove(freeformId)
        if (close) removed?.close()
    }
}
