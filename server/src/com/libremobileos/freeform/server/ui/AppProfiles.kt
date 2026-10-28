package com.libremobileos.freeform.server.ui

import android.content.ComponentName
import android.content.Context
import android.content.pm.ActivityInfo
import android.content.pm.PackageManager
import android.provider.Settings

/**
 * Per-app window profile, stored in Settings.System "lmo_freeform_profiles":
 *     pkg|orientation|widthPct|heightPct|dpi;pkg2|...
 * orientation: 0 = auto, 1 = portrait window, 2 = landscape window
 * widthPct / heightPct / dpi: 0 = auto (use global setting / smart default)
 */
data class AppProfile(
    val orientation: Int = AppProfiles.AUTO,
    val widthPct: Int = 0,
    val heightPct: Int = 0,
    val dpi: Int = 0
)

object AppProfiles {
    const val KEY = "lmo_freeform_profiles"
    const val AUTO = 0
    const val PORTRAIT = 1
    const val LANDSCAPE = 2

    fun get(context: Context, pkg: String): AppProfile {
        val raw = runCatching { Settings.System.getString(context.contentResolver, KEY) }.getOrNull()
            ?: return AppProfile()
        for (entry in raw.split(';')) {
            val f = entry.split('|')
            if (f.size >= 5 && f[0] == pkg) {
                return AppProfile(
                    orientation = f[1].toIntOrNull() ?: AUTO,
                    widthPct = f[2].toIntOrNull() ?: 0,
                    heightPct = f[3].toIntOrNull() ?: 0,
                    dpi = f[4].toIntOrNull() ?: 0
                )
            }
        }
        return AppProfile()
    }

    /**
     * Orientation the activity itself asks for in its manifest:
     * true = landscape, false = portrait, null = no preference (follow the device).
     * Landscape games such as PUBG declare sensorLandscape, so they get a 16:9 window.
     */
    fun declaredLandscape(context: Context, pkg: String, activity: String): Boolean? {
        val info = try {
            context.packageManager.getActivityInfo(ComponentName(pkg, activity), 0)
        } catch (e: PackageManager.NameNotFoundException) {
            return null
        } catch (e: Exception) {
            return null
        }
        return landscapeFromOrientation(info.screenOrientation)
    }

    /** Maps ActivityInfo.SCREEN_ORIENTATION_* to landscape(true) / portrait(false) / null. */
    fun landscapeFromOrientation(o: Int): Boolean? = when (o) {
        ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE,
        ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE,
        ActivityInfo.SCREEN_ORIENTATION_REVERSE_LANDSCAPE,
        ActivityInfo.SCREEN_ORIENTATION_USER_LANDSCAPE -> true
        ActivityInfo.SCREEN_ORIENTATION_PORTRAIT,
        ActivityInfo.SCREEN_ORIENTATION_SENSOR_PORTRAIT,
        ActivityInfo.SCREEN_ORIENTATION_REVERSE_PORTRAIT,
        ActivityInfo.SCREEN_ORIENTATION_USER_PORTRAIT -> false
        else -> null
    }
}
