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
import com.libremobileos.freeform.server.ui.PadProfile
import com.libremobileos.freeform.server.ui.PadProfiles
import com.libremobileos.freeform.server.ui.ThunderPadManager
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
                    ACTION_START_PAD -> handleStartPad(intent)
                    ACTION_STOP_PAD -> ThunderPadManager.closeAll()
                    ACTION_TOGGLE_SIDEBAR -> LMOFreeformApi.toggleSidebar()
                    ACTION_OPEN_SIDEBAR -> LMOFreeformApi.openSidebar()
                    ACTION_CLOSE_SIDEBAR -> LMOFreeformApi.closeSidebar()
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
            addAction(ACTION_START_PAD)
            addAction(ACTION_STOP_PAD)
            addAction(ACTION_TOGGLE_SIDEBAR)
            addAction(ACTION_OPEN_SIDEBAR)
            addAction(ACTION_CLOSE_SIDEBAR)
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
        start(pkg, intent.getStringExtra("activityName"), userId, taskId)
    }

    /** Sidebar / drawer entry point: ThunderPad when the app has a pad profile, else a floating window. */
    fun launchApp(pkg: String, activityName: String?) {
        val p = PadProfiles.get(context, pkg)
        if (p != null) startPad(pkg, activityName, UserHandle.USER_SYSTEM, p) else start(pkg, activityName)
    }

    fun startPad(pkg: String, activityName: String?, userId: Int, profile: PadProfile) {
        val activity = activityName ?: resolveLauncherActivity(pkg, userId)
        if (activity == null) {
            Slog.e(TAG, "no launcher activity for $pkg")
            return
        }
        ThunderPadManager.start(handler, context, pkg, activity, userId, profile)
    }

    private fun handleStartPad(intent: Intent) {
        val pkg = intent.getStringExtra("packageName") ?: return
        val base = PadProfiles.get(context, pkg) ?: PadProfile.DEFAULT
        val p = PadProfile(
            intent.getIntExtra("padW", base.w), intent.getIntExtra("padH", base.h),
            intent.getIntExtra("padDpi", base.dpi), intent.getIntExtra("padFit", base.fit))
        startPad(pkg, intent.getStringExtra("activityName"),
            intent.getIntExtra("userId", UserHandle.USER_SYSTEM), p)
    }

    /** Open [pkg] in a floating window (activityName = null -> launcher activity). */
    fun start(pkg: String, activityName: String?, userId: Int = UserHandle.USER_SYSTEM, taskId: Int = -1) {
        val dpi = FreeformSettings.dpi(context, context.resources.displayMetrics.densityDpi)
        val activity = activityName ?: resolveLauncherActivity(pkg, userId)
        if (activity == null) {
            Slog.e(TAG, "no launcher activity for $pkg")
            return
        }
        FreeformWindowManager.addWindow(handler, context, pkg, activity, userId, taskId, null, 0, 0, dpi)
    }

    /** Writes every lmo_* extra (Int / Boolean / String) to Settings.System (we are uid 1000). */
    private fun handleSetConfig(intent: Intent) {
        val extras = intent.extras ?: return
        for (key in extras.keySet()) {
            if (!key.startsWith("lmo_") && key != "freeform_control_mode") continue
            when (val v = extras.get(key)) {
                is Int -> Settings.System.putInt(context.contentResolver, key, v)
                is Boolean -> Settings.System.putInt(context.contentResolver, key, if (v) 1 else 0)
                is String -> Settings.System.putString(context.contentResolver, key, v)
            }
        }
        Slog.i(TAG, "config updated: $extras")
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
        const val ACTION_START_PAD = "com.libremobileos.freeform.START_THUNDERPAD"
        const val ACTION_STOP_PAD = "com.libremobileos.freeform.STOP_THUNDERPAD"
        const val ACTION_TOGGLE_SIDEBAR = "com.libremobileos.freeform.TOGGLE_SIDEBAR"
        const val ACTION_OPEN_SIDEBAR = "com.libremobileos.freeform.OPEN_SIDEBAR"
        const val ACTION_CLOSE_SIDEBAR = "com.libremobileos.freeform.CLOSE_SIDEBAR"
        const val PERMISSION_START = "com.libremobileos.permission.START_FREEFORM"
    }
}
