package com.libremobileos.freeform.server

import android.app.ActivityOptions
import android.app.PendingIntent
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.SystemClock
import android.os.UserHandle
import android.util.Slog
import android.view.InputDevice
import android.view.InputEvent
import android.view.KeyEvent
import android.view.MotionEvent
import android.view.Surface
import com.libremobileos.freeform.server.Debug.dlog
import com.libremobileos.freeform.server.ui.AppConfig
import com.libremobileos.freeform.server.ui.FreeformConfig
import com.libremobileos.freeform.server.ui.FreeformDisplayCallback

object LMOFreeformServiceHolder {
    private const val TAG = "LMOFreeform/ServiceHolder"

    private var service: LMOFreeformService? = null

    fun init(freeformService: LMOFreeformService) {
        service = freeformService
    }

    fun ping(): Boolean = service != null && SystemServiceHolder.ready

    fun createDisplay(
        freeformConfig: FreeformConfig, appConfig: AppConfig,
        surface: Surface, callback: FreeformDisplayCallback
    ) {
        val name = appConfig.packageName + "," + appConfig.activityName + "," + appConfig.userId
        service?.createFreeform(
            name, callback,
            freeformConfig.freeformWidth, freeformConfig.freeformHeight, freeformConfig.densityDpi,
            freeformConfig.secure, freeformConfig.ownContentOnly,
            freeformConfig.shouldShowSystemDecorations, surface
        )
    }

    fun startApp(context: Context, appConfig: AppConfig, displayId: Int): Boolean {
        dlog(TAG, "startApp $appConfig displayId=$displayId")
        return try {
            val intent = Intent().apply {
                component = ComponentName(appConfig.packageName, appConfig.activityName)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                action = Intent.ACTION_MAIN
                addCategory(Intent.CATEGORY_LAUNCHER)
            }
            val options = ActivityOptions.makeBasic().apply { launchDisplayId = displayId }
            context.startActivityAsUser(intent, options.toBundle(), UserHandle(appConfig.userId))
            true
        } catch (e: Exception) {
            Slog.e(TAG, "startApp failed", e)
            false
        }
    }

    fun startPendingIntent(context: Context, pendingIntent: PendingIntent, displayId: Int) {
        val options = ActivityOptions.makeBasic().apply { launchDisplayId = displayId }
        try {
            pendingIntent.send(context, 0, null, null, null, null, options.toBundle())
        } catch (e: Exception) {
            Slog.e(TAG, "startPendingIntent failed", e)
        }
    }

    fun touch(event: MotionEvent, displayId: Int) {
        service?.injectInputEvent(event, displayId)
    }

    fun back(displayId: Int) {
        val now = SystemClock.uptimeMillis()
        fun key(action: Int) = KeyEvent(now, now, action, KeyEvent.KEYCODE_BACK, 0).also {
            it.source = InputDevice.SOURCE_KEYBOARD
        }
        runCatching {
            service?.injectInputEvent(key(KeyEvent.ACTION_DOWN) as InputEvent, displayId)
            service?.injectInputEvent(key(KeyEvent.ACTION_UP) as InputEvent, displayId)
        }
    }

    fun resizeFreeform(token: Any, width: Int, height: Int, densityDpi: Int) {
        service?.resizeFreeform(token, width, height, densityDpi)
    }

    fun setSurface(token: Any, surface: Surface?) {
        service?.setSurface(token, surface)
    }

    fun releaseFreeform(token: Any) {
        service?.releaseFreeform(token)
    }
}
