package com.libremobileos.freeform.server.sidebar

import android.content.Context
import android.content.res.Configuration
import android.provider.Settings

/** Sidebar settings, all in Settings.System (lmo_sb_*), editable with `settings put system` too. */
class SidebarConfig(private val context: Context) {
    private fun int(key: String, def: Int) =
        runCatching { Settings.System.getInt(context.contentResolver, key, def) }.getOrDefault(def)

    val enabled get() = int(ENABLED, 1) == 1
    val right get() = int(SIDE, 1) == 1
    val handleY get() = int(HANDLE_Y, -1)
    val handleLenDp get() = int(HANDLE_LEN, 100)
    val handleWidthDp get() = int(HANDLE_WIDTH, 6)
    val handleAlpha get() = int(HANDLE_ALPHA, 70)
    val columns get() = int(COLUMNS, 1).coerceAtLeast(1)
    val iconDp get() = int(ICON_SIZE, 40)
    val panelAlpha get() = int(PANEL_ALPHA, 85)

    val pinned: List<String>
        get() = (runCatching { Settings.System.getString(context.contentResolver, PINNED) }.getOrNull() ?: "")
            .split('\n').map { it.trim() }.filter { it.isNotEmpty() }

    fun setHandleY(y: Int) {
        runCatching { Settings.System.putInt(context.contentResolver, HANDLE_Y, y) }
    }

    val night: Boolean
        get() = (context.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) ==
                Configuration.UI_MODE_NIGHT_YES

    companion object {
        const val ENABLED = "lmo_sb_enabled"
        const val SIDE = "lmo_sb_side"             // 0 left, 1 right
        const val HANDLE_Y = "lmo_sb_handle_y"
        const val HANDLE_LEN = "lmo_sb_handle_len_dp"
        const val HANDLE_WIDTH = "lmo_sb_handle_width_dp"
        const val HANDLE_ALPHA = "lmo_sb_handle_alpha"
        const val COLUMNS = "lmo_sb_columns"
        const val ICON_SIZE = "lmo_sb_icon_size_dp"
        const val PANEL_ALPHA = "lmo_sb_panel_alpha"
        const val PINNED = "lmo_sb_pinned"         // "pkg/activity" joined by \n
    }
}
