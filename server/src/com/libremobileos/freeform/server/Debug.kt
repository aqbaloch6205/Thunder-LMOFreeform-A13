package com.libremobileos.freeform.server

import android.util.Log

object Debug {
    private const val MAIN_TAG = "LMOFreeform"

    // enable with: setprop log.tag.LMOFreeform DEBUG
    @JvmStatic
    fun dlog(tag: String, msg: String) {
        if (Log.isLoggable(MAIN_TAG, Log.DEBUG)) {
            Log.d(tag, msg)
        }
    }
}
