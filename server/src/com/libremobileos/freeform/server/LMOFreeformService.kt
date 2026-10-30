package com.libremobileos.freeform.server

import android.content.Context
import android.hardware.display.DisplayManager
import android.hardware.display.VirtualDisplay
import android.os.Handler
import android.util.Slog
import android.view.InputEvent
import android.view.Surface
import com.libremobileos.freeform.server.Debug.dlog
import com.libremobileos.freeform.server.ui.FreeformDisplayCallback

/**
 * Android 13 version: instead of a custom DisplayAdapter inside DisplayManagerService
 * we use the stock VirtualDisplay API. system_server (uid 1000) is allowed to create
 * TRUSTED / SECURE virtual displays, so no framework patch is needed.
 */
class LMOFreeformService(context: Context, private val handler: Handler) {

    private val displayManager: DisplayManager =
        context.getSystemService(DisplayManager::class.java)
    private val displays = HashMap<Any, VirtualDisplay>()

    fun createFreeform(
        name: String, callback: FreeformDisplayCallback,
        width: Int, height: Int, densityDpi: Int,
        secure: Boolean, ownContentOnly: Boolean, showSystemDecorations: Boolean,
        surface: Surface
    ) {
        var flags = FLAG_PUBLIC or FLAG_SUPPORTS_TOUCH or FLAG_DESTROY_CONTENT_ON_REMOVAL or FLAG_TRUSTED
        if (ownContentOnly) flags = flags or FLAG_OWN_CONTENT_ONLY
        if (secure) flags = flags or FLAG_SECURE
        if (showSystemDecorations) flags = flags or FLAG_SHOULD_SHOW_SYSTEM_DECORATIONS

        val vd = try {
            displayManager.createVirtualDisplay(
                UNIQUE_ID_PREFIX + name, width, height, densityDpi, surface, flags, null, null)
        } catch (e: Exception) {
            Slog.e(TAG, "createVirtualDisplay failed", e)
            null
        }
        if (vd == null) {
            Slog.e(TAG, "createVirtualDisplay returned null")
            handler.post { callback.onDisplayStopped() }
            return
        }
        synchronized(displays) { displays[callback] = vd }
        val id = vd.display.displayId
        Slog.i(TAG, "created freeform display id=$id ${width}x$height@$densityDpi flags=0x${flags.toString(16)}")
        handler.post { callback.onDisplayAdd(id) }
    }

    fun resizeFreeform(token: Any, width: Int, height: Int, densityDpi: Int) {
        val vd = synchronized(displays) { displays[token] } ?: return
        runCatching { vd.resize(width, height, densityDpi) }
            .onFailure { Slog.e(TAG, "resize failed", it) }
        dlog(TAG, "resize ${width}x$height@$densityDpi")
    }

    /** swap the output surface (SurfaceView <-> TextureView, surface re-created, ...) */
    fun setSurface(token: Any, surface: Surface?) {
        val vd = synchronized(displays) { displays[token] } ?: return
        runCatching { vd.surface = surface }.onFailure { Slog.e(TAG, "setSurface failed", it) }
    }

    fun releaseFreeform(token: Any) {
        val vd = synchronized(displays) { displays.remove(token) } ?: return
        runCatching { vd.release() }.onFailure { Slog.e(TAG, "release failed", it) }
        dlog(TAG, "released")
    }

    fun injectInputEvent(event: InputEvent, displayId: Int) {
        event.displayId = displayId
        SystemServiceHolder.inputManagerService.injectInputEvent(event, INJECT_MODE_ASYNC)
    }

    companion object {
        private const val TAG = "LMOFreeform/Service"
        const val UNIQUE_ID_PREFIX = "lmo-freeform:"
        private const val INJECT_MODE_ASYNC = 0

        // DisplayManager.VIRTUAL_DISPLAY_FLAG_* (several are hidden, so use literals)
        private const val FLAG_PUBLIC = 1 shl 0
        private const val FLAG_SECURE = 1 shl 2
        private const val FLAG_OWN_CONTENT_ONLY = 1 shl 3
        private const val FLAG_SUPPORTS_TOUCH = 1 shl 6
        private const val FLAG_DESTROY_CONTENT_ON_REMOVAL = 1 shl 8
        private const val FLAG_SHOULD_SHOW_SYSTEM_DECORATIONS = 1 shl 9
        private const val FLAG_TRUSTED = 1 shl 10
    }
}
