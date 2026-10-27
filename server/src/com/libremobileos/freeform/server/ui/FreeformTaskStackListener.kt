package com.libremobileos.freeform.server.ui

import android.app.ActivityManager
import android.app.TaskStackListener
import android.view.Display
import com.libremobileos.freeform.server.Debug.dlog
import kotlin.math.max
import kotlin.math.min

/**
 * Extends the framework's no-op TaskStackListener adapter so we only override
 * what we need. This keeps the class independent of the exact ITaskStackListener
 * method set (it differs between Android versions / OEM builds).
 */
class FreeformTaskStackListener(
    private val displayId: Int,
    private val window: FreeformWindow
) : TaskStackListener() {

    var taskId = -1

    companion object {
        private const val TAG = "LMOFreeform/FreeformTaskStackListener"

        const val PORTRAIT = 1
        const val LANDSCAPE_1 = 0
        const val LANDSCAPE_2 = 6
    }

    override fun onTaskRemoved(taskId: Int) {
        if (this.taskId == taskId) {
            dlog(TAG, "onTaskRemoved $taskId")
            window.handler.post { window.destroy("onTaskRemoved", true) }
        }
    }

    override fun onTaskMovedToFront(taskInfo: ActivityManager.RunningTaskInfo?) {
        val info = taskInfo ?: return
        if (info.displayId == displayId) {
            taskId = info.taskId
            dlog(TAG, "onTaskMovedToFront $taskId")
        }
    }

    override fun onTaskDescriptionChanged(taskInfo: ActivityManager.RunningTaskInfo?) {
        val info = taskInfo ?: return
        if (info.displayId == displayId) {
            taskId = info.taskId
            dlog(TAG, "onTaskDescriptionChanged $info")
        }
    }

    override fun onActivityRequestedOrientationChanged(taskId: Int, requestedOrientation: Int) {
        if (taskId != this.taskId) return
        dlog(TAG, "onActivityRequestedOrientationChanged: $requestedOrientation")
        val cfg = window.freeformConfig
        val maxSide = max(cfg.width, cfg.height)
        val minSide = min(cfg.width, cfg.height)
        val maxHangUp = max(cfg.hangUpWidth, cfg.hangUpHeight)
        val minHangUp = min(cfg.hangUpWidth, cfg.hangUpHeight)
        when (requestedOrientation) {
            PORTRAIT -> {
                cfg.width = minSide
                cfg.height = maxSide
                cfg.hangUpWidth = minHangUp
                cfg.hangUpHeight = maxHangUp
            }
            LANDSCAPE_1, LANDSCAPE_2 -> {
                cfg.width = maxSide
                cfg.height = minSide
                cfg.hangUpWidth = maxHangUp
                cfg.hangUpHeight = minHangUp
            }
        }
        window.handler.post { window.changeOrientation() }
    }

    override fun onTaskRemovalStarted(taskInfo: ActivityManager.RunningTaskInfo?) {
        val info = taskInfo ?: return
        if (info.displayId == displayId) {
            taskId = info.taskId
            dlog(TAG, "onTaskRemovalStarted $taskId")
        }
    }

    override fun onTaskDisplayChanged(taskId: Int, newDisplayId: Int) {
        if (taskId == this.taskId && newDisplayId == Display.DEFAULT_DISPLAY) {
            window.handler.post { window.destroy("onTaskDisplayChanged: $taskId to main display", false) }
        } else if (newDisplayId == displayId) {
            this.taskId = taskId
            dlog(TAG, "onTaskDisplayChanged: $taskId to freeform display")
        }
    }
}
