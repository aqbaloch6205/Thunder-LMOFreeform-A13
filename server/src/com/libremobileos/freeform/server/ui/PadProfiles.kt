package com.libremobileos.freeform.server.ui

import android.content.Context
import android.provider.Settings

/**
 * ThunderPad profile: run an app fullscreen on a virtual display with a tablet resolution.
 * fit: 0 = FILL (default: like a normal fullscreen app, resolution adapts to the phone's aspect),
 *      1 = ORIGINAL (exact tablet aspect, black bars), 2 = STRETCH (exact tablet resolution stretched to the screen)
 * Stored in Settings.System "lmo_thunderpad_apps":  pkg|w|h|dpi|fit;pkg2|...
 * w/h are the natural (landscape) size; the app's orientation decides if they are swapped.
 */
data class PadProfile(val w: Int, val h: Int, val dpi: Int, val fit: Int) {
    companion object {
        /** iPad mini 5 */
        val DEFAULT = PadProfile(2048, 1536, 326, PadProfiles.FILL)
    }
}

object PadProfiles {
    const val KEY = "lmo_thunderpad_apps"
    const val FILL = 0
    const val ORIGINAL = 1
    const val STRETCH = 2

    private fun raw(context: Context): String =
        runCatching { Settings.System.getString(context.contentResolver, KEY) }.getOrNull() ?: ""

    fun get(context: Context, pkg: String): PadProfile? {
        for (e in raw(context).split(';')) {
            val f = e.split('|')
            if (f.size >= 5 && f[0] == pkg) {
                val w = f[1].toIntOrNull() ?: continue
                val h = f[2].toIntOrNull() ?: continue
                if (w < 320 || h < 320) continue
                return PadProfile(w, h, (f[3].toIntOrNull() ?: 320).coerceIn(120, 800), (f[4].toIntOrNull() ?: FILL).coerceIn(0, 2))
            }
        }
        return null
    }

    /** profile == null removes the entry */
    fun put(context: Context, pkg: String, profile: PadProfile?) {
        val sb = StringBuilder()
        for (e in raw(context).split(';')) {
            if (e.isEmpty() || e.startsWith("$pkg|")) continue
            sb.append(e).append(';')
        }
        if (profile != null) sb.append("$pkg|${profile.w}|${profile.h}|${profile.dpi}|${profile.fit};")
        runCatching {
            Settings.System.putString(context.contentResolver, KEY, sb.toString().trimEnd(';'))
        }
    }
}
