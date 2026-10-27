package com.libremobileos.freeform.server.ui

import android.content.Context
import android.provider.Settings

/**
 * Tunables, changeable at runtime without rebuilding:
 *   settings put system lmo_freeform_width_pct 90
 *   settings put system lmo_freeform_height_pct 60
 *   settings put system lmo_freeform_dpi 420
 * (percent of screen width/height used by the floating window in portrait)
 */
object FreeformSettings {
    const val KEY_WIDTH_PCT = "lmo_freeform_width_pct"
    const val KEY_HEIGHT_PCT = "lmo_freeform_height_pct"
    const val KEY_LANDSCAPE_HEIGHT_PCT = "lmo_freeform_land_height_pct"
    const val KEY_DPI = "lmo_freeform_dpi"

    const val DEF_WIDTH_PCT = 90
    const val DEF_HEIGHT_PCT = 62
    const val DEF_LANDSCAPE_HEIGHT_PCT = 85

    fun fraction(context: Context, key: String, def: Int): Float {
        val v = runCatching { Settings.System.getInt(context.contentResolver, key, def) }
            .getOrDefault(def)
        return v.coerceIn(30, 100) / 100f
    }

    fun dpi(context: Context, def: Int): Int {
        val v = runCatching { Settings.System.getInt(context.contentResolver, KEY_DPI, 0) }
            .getOrDefault(0)
        return if (v in 120..800) v else def
    }
}
