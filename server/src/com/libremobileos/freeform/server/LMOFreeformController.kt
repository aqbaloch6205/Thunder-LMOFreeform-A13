package com.libremobileos.freeform.server

import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Handler
import android.os.UserHandle
import android.provider.Settings
import android.util.Slog
import com.libremobileos.freeform.server.ui.FreeformSettings
import com.libremobileos.freeform.server.ui.FreeformWindowManager

/**
 * Entry point replacing the old Binder service ("lmo_freeform").
 * A dynamic receiver living in system_server listens for START/STOP broadcasts.
 *
 * START extras: packageName (required), activityName (optional, launcher activity
 * is resolved when missing), userId (default 0), taskId (default -1 = start fresh),
 * pendingIntent (optional, instead of packageName).
 * STOP extras: freeformId = "packageName,activityName,userId"
 */
class LMOFreeformController(private val context: Context, private val handler: Handler) {

    private val receiver = object : BroadcastReceiver() {
        override fun onReceive(c: Context, intent: Intent) {
            try {
                when (intent.action) {
                    ACTION_START -> handleStart(intent)
                    ACTION_STOP -> intent.getStringExtra("freeformId")
                        ?.let { FreeformWindowManager.removeWindow(it, true) }
                    ACTION_SET_CONFIG -> handleSetConfig(intent)
                }
            } catch (t: Throwable) {
                Slog.e(TAG, "handling ${intent.action} failed", t)
            }
        }
    }

    fun register() {
        val filter = IntentFilter().apply {
            addAction(ACTION_START)
            addAction(ACTION_STOP)
            addAction(ACTION_SET_CONFIG)
        }
        context.registerReceiverForAllUsers(receiver, filter, PERMISSION_START, handler)
        Slog.i(TAG, "listening for $ACTION_START (permission $PERMISSION_START)")
    }

    private fun handleStart(intent: Intent) {
        val userId = intent.getIntExtra("userId", UserHandle.USER_SYSTEM)
        val taskId = intent.getIntExtra("taskId", -1)
        val dpi = FreeformSettings.dpi(context, context.resources.displayMetrics.densityDpi)
        val pending = intent.getParcelableExtra<PendingIntent>("pendingIntent")

        if (pending != null) {
            FreeformWindowManager.addWindow(
                handler, context, pending.creatorPackage ?: "pendingIntent",
                "unknownActivity-${System.currentTimeMillis()}", -100, -1, pending, 0, 0, dpi)
            return
        }

        val pkg = intent.getStringExtra("packageName") ?: return
        val activity = intent.getStringExtra("activityName") ?: resolveLauncherActivity(pkg, userId)
        if (activity == null) {
            Slog.e(TAG, "no launcher activity for $pkg")
            return
        }
        // width/height are computed by FreeformWindow.measureSize(); only dpi matters here
        FreeformWindowManager.addWindow(handler, context, pkg, activity, userId, taskId, null, 0, 0, dpi)
    }

    /** Writes size/dpi tunables to Settings.System (we run as uid 1000, so this is allowed). */
    private fun handleSetConfig(intent: Intent) {
        for (key in listOf(FreeformSettings.KEY_WIDTH_PCT, FreeformSettings.KEY_HEIGHT_PCT,
                FreeformSettings.KEY_LANDSCAPE_HEIGHT_PCT, FreeformSettings.KEY_DPI)) {
            if (intent.hasExtra(key)) {
                Settings.System.putInt(context.contentResolver, key, intent.getIntExtra(key, 0))
            }
        }
        Slog.i(TAG, "config updated: ${intent.extras}")
    }

    private fun resolveLauncherActivity(pkg: String, userId: Int): String? {
        val query = Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(pkg)
        return context.packageManager.queryIntentActivitiesAsUser(query, 0, userId)
            .firstOrNull()?.activityInfo?.name
    }

    companion object {
        private const val TAG = "LMOFreeform/Controller"
        const val ACTION_START = "com.libremobileos.freeform.START_FREEFORM"
        const val ACTION_STOP = "com.libremobileos.freeform.STOP_FREEFORM"
        const val ACTION_SET_CONFIG = "com.libremobileos.freeform.SET_CONFIG"
        const val PERMISSION_START = "com.libremobileos.permission.START_FREEFORM"
    }
}
