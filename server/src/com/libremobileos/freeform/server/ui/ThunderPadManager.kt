package com.libremobileos.freeform.server.ui

import android.content.Context
import android.os.Handler

/** One ThunderPad (fullscreen tablet-resolution app) at a time. */
object ThunderPadManager {
    private var current: ThunderPadWindow? = null

    fun start(handler: Handler, context: Context, pkg: String, activity: String, userId: Int, profile: PadProfile) {
        closeAll()
        val w = ThunderPadWindow(handler, context, AppConfig(pkg, activity, null, userId, -1), pkg, profile)
        current = w
        w.show()
    }

    fun closeAll() {
        current?.let { it.handler.post { it.close() } }
        current = null
    }

    fun onDestroyed(w: ThunderPadWindow) {
        if (current === w) current = null
    }
}
