package com.libremobileos.freeform.launcher;

import android.content.Context;
import android.content.Intent;
import android.provider.Settings;

import java.util.ArrayList;
import java.util.List;

/**
 * Sidebar + window settings live in Settings.System (lmo_*), read directly and written by
 * broadcasting SET_CONFIG to the freeform server inside system_server.
 */
final class Prefs {
    static final String ACTION_SET_CONFIG = "com.libremobileos.freeform.SET_CONFIG";
    static final String ENABLED = "lmo_sb_enabled";
    static final String SIDE = "lmo_sb_side";                 // 0 = left, 1 = right
    static final String HANDLE_LEN = "lmo_sb_handle_len_dp";
    static final String HANDLE_WIDTH = "lmo_sb_handle_width_dp";
    static final String HANDLE_ALPHA = "lmo_sb_handle_alpha";
    static final String COLUMNS = "lmo_sb_columns";
    static final String ICON_SIZE = "lmo_sb_icon_size_dp";
    static final String PANEL_ALPHA = "lmo_sb_panel_alpha";
    static final String HANDLE_Y = "lmo_sb_handle_y";
    static final String PINNED = "lmo_sb_pinned";             // "pkg/activity" joined by '\n'
    static final String PADS = "lmo_thunderpad_apps";         // pkg|w|h|dpi|fit;...
    static final String PROFILES = "lmo_freeform_profiles";   // pkg|orient|w%|h%|dpi;...

    private Prefs() {}

    static int getInt(Context c, String key, int def) {
        return Settings.System.getInt(c.getContentResolver(), key, def);
    }

    static String getString(Context c, String key) {
        String s = Settings.System.getString(c.getContentResolver(), key);
        return s == null ? "" : s;
    }

    static void putInt(Context c, String key, int v) {
        c.sendBroadcast(new Intent(ACTION_SET_CONFIG).putExtra(key, v));
    }

    static void putString(Context c, String key, String v) {
        c.sendBroadcast(new Intent(ACTION_SET_CONFIG).putExtra(key, v));
    }

    static List<String> pinned(Context c) {
        List<String> out = new ArrayList<>();
        for (String s : getString(c, PINNED).split("\n")) {
            if (!s.trim().isEmpty()) out.add(s.trim());
        }
        return out;
    }

    static void setPinned(Context c, List<String> list) {
        putString(c, PINNED, String.join("\n", list));
    }

    /** ThunderPad profile {w, h, dpi, fit(0 original / 1 stretch)} or null */
    static int[] pad(Context c, String pkg) {
        for (String e : getString(c, PADS).split(";")) {
            String[] f = e.split("\\|");
            if (f.length >= 5 && f[0].equals(pkg)) {
                try {
                    return new int[] { Integer.parseInt(f[1]), Integer.parseInt(f[2]),
                            Integer.parseInt(f[3]), Integer.parseInt(f[4]) };
                } catch (NumberFormatException ignored) {}
            }
        }
        return null;
    }

    /** p == null removes the profile */
    static void setPad(Context c, String pkg, int[] p) {
        StringBuilder sb = new StringBuilder();
        for (String e : getString(c, PADS).split(";")) {
            if (e.isEmpty() || e.startsWith(pkg + "|")) continue;
            sb.append(e).append(';');
        }
        if (p != null) sb.append(pkg).append('|').append(p[0]).append('|').append(p[1])
                .append('|').append(p[2]).append('|').append(p[3]).append(';');
        String out = sb.toString();
        if (out.endsWith(";")) out = out.substring(0, out.length() - 1);
        putString(c, PADS, out);
    }

    /** returns {orientation, widthPct, heightPct, dpi}; zeros = auto */
    static int[] profile(Context c, String pkg) {
        for (String e : getString(c, PROFILES).split(";")) {
            String[] f = e.split("\\|");
            if (f.length >= 5 && f[0].equals(pkg)) {
                try {
                    return new int[] { Integer.parseInt(f[1]), Integer.parseInt(f[2]),
                            Integer.parseInt(f[3]), Integer.parseInt(f[4]) };
                } catch (NumberFormatException ignored) {}
            }
        }
        return new int[4];
    }

    static void setProfile(Context c, String pkg, int[] p) {
        StringBuilder sb = new StringBuilder();
        for (String e : getString(c, PROFILES).split(";")) {
            if (e.isEmpty() || e.startsWith(pkg + "|")) continue;
            sb.append(e).append(';');
        }
        boolean auto = p[0] == 0 && p[1] == 0 && p[2] == 0 && p[3] == 0;
        if (!auto) sb.append(pkg).append('|').append(p[0]).append('|').append(p[1])
                .append('|').append(p[2]).append('|').append(p[3]).append(';');
        String out = sb.toString();
        if (out.endsWith(";")) out = out.substring(0, out.length() - 1);
        putString(c, PROFILES, out);
    }
}
