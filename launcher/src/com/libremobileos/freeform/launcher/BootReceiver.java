package com.libremobileos.freeform.launcher;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.provider.Settings;

/** Restarts the sidebar after boot when it was enabled. */
public class BootReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        if (!Prefs.get(context).getBoolean(Prefs.ENABLED, false)) return;
        if (!Settings.canDrawOverlays(context)) return;
        context.startForegroundService(new Intent(context, SidebarService.class));
    }
}
