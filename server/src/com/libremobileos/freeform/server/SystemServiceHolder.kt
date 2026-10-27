package com.libremobileos.freeform.server

import android.app.IActivityManager
import android.app.IActivityTaskManager
import android.content.Context
import android.hardware.input.IInputManager
import android.os.ServiceManager
import android.view.IWindowManager

/**
 * Binder proxies to the system services we talk to. We live inside system_server,
 * so ServiceManager.getService() hands us the local Stubs (calls run as uid 1000).
 */
object SystemServiceHolder {
    lateinit var activityManager: IActivityManager
    lateinit var activityTaskManager: IActivityTaskManager
    lateinit var windowManager: IWindowManager
    lateinit var inputManagerService: IInputManager

    @Volatile
    var ready = false
        private set

    fun init() {
        activityTaskManager = IActivityTaskManager.Stub.asInterface(
            ServiceManager.getService(Context.ACTIVITY_TASK_SERVICE))
        activityManager = IActivityManager.Stub.asInterface(
            ServiceManager.getService(Context.ACTIVITY_SERVICE))
        inputManagerService = IInputManager.Stub.asInterface(
            ServiceManager.getService(Context.INPUT_SERVICE))
        windowManager = IWindowManager.Stub.asInterface(
            ServiceManager.getService(Context.WINDOW_SERVICE))
        ready = true
    }
}
