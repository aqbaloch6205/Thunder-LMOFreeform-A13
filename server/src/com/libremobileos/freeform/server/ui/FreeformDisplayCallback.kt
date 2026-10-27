package com.libremobileos.freeform.server.ui

/** Replaces the old AIDL ILMOFreeformDisplayCallback: we are in-process now. */
interface FreeformDisplayCallback {
    fun onDisplayPaused() {}
    fun onDisplayResumed() {}
    fun onDisplayStopped() {}
    fun onDisplayAdd(displayId: Int)
}
