package com.libremobileos.freeform.server.ui

import android.app.ActivityManager
import android.app.TaskStackListener
import android.view.Display
import com.libremobileos.freeform.server.Debug.dlog

/**
 * Extends the framework's no-op TaskStackListener adapter so we only override
 * what we need. This keeps the class independent of the exact ITaskStackListener
 * method set (it differs between Android versions / OEM builds).
 */
/** What a window (floating or ThunderPad) must offer to be driven by task-stack events. */
interface TaskHost {
    val handler: android.os.Handler
    fun onTaskGone(reason: String, removeTask: Boolean)
    fun onAppRequestedOrientation(landscape: Boolean)
    /** a task of the phone's own display came to front (user went home / opened another app) */
    fun onDefaultDisplayFront() {}
    /** any task stack change (used to re-check the foreground activity's orientation) */
    fun onStackChanged() {}
}

class FreeformTaskStackListener(
    private val displayId: Int,
    private val window: TaskHost
) : TaskStackListener() {

    var taskId = -1

    companion object {
        private const val TAG = "LMOFreeform/FreeformTaskStackListener"

    }

    override fun onTaskRemoved(taskId: Int) {
        if (this.taskId == taskId) {
            dlog(TAG, "onTaskRemoved $taskId")
            window.handler.post { window.onTaskGone("onTaskRemoved", true) }
        }
    }

    override fun onTaskMovedToFront(taskInfo: ActivityManager.RunningTaskInfo?) {
        val info = taskInfo ?: return
        if (info.displayId == displayId) {
            taskId = info.taskId
            dlog(TAG, "onTaskMovedToFront $taskId")
            reportOrientation(info)
        } else if (info.displayId == Display.DEFAULT_DISPLAY) {
            window.handler.post { window.onDefaultDisplayFront() }
        }
    }

    override fun onTaskDescriptionChanged(taskInfo: ActivityManager.RunningTaskInfo?) {
        val info = taskInfo ?: return
        if (info.displayId == displayId) {
            taskId = info.taskId
            dlog(TAG, "onTaskDescriptionChanged $info")
            reportOrientation(info)
        }
    }

    private fun reportOrientation(info: ActivityManager.RunningTaskInfo) {
        val o = info.topActivityInfo?.screenOrientation ?: return
        AppProfiles.landscapeFromOrientation(o)?.let { window.onAppRequestedOrientation(it) }
    }

    override fun onTaskStackChanged() {
        window.handler.post { window.onStackChanged() }
    }

    override fun onActivityRequestedOrientationChanged(taskId: Int, requestedOrientation: Int) {
        if (taskId != this.taskId) return
        dlog(TAG, "onActivityRequestedOrientationChanged: $requestedOrientation")
        AppProfiles.landscapeFromOrientation(requestedOrientation)
            ?.let { window.onAppRequestedOrientation(it) }
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
            window.handler.post { window.onTaskGone("onTaskDisplayChanged: $taskId to main display", false) }
        } else if (newDisplayId == displayId) {
            this.taskId = taskId
            dlog(TAG, "onTaskDisplayChanged: $taskId to freeform display")
        }
    }
}
