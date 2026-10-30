package com.libremobileos.freeform.launcher;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;

/** ThunderFreeform theme: light / dark / auto + accent colour, shared by every screen. */
final class Ui {
    static final String KEY_THEME = "lmo_ui_theme";    // 0 auto, 1 light, 2 dark
    static final String KEY_ACCENT = "lmo_ui_accent";
    static final int[] ACCENTS = {
            0xFFFFC107, 0xFF4C8DFF, 0xFF8E6CFF, 0xFF2EC4A6, 0xFFFF6B6B, 0xFFFF5FA2 };
    static final String[] ACCENT_NAMES = { "Amber", "Blue", "Violet", "Mint", "Coral", "Pink" };

    int bg, surface, text1, text2, accent, onAccent;
    boolean dark;

    static Ui of(Context c) {
        Ui u = new Ui();
        int theme = theme(c);
        boolean sysDark = (c.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        u.dark = theme == 2 || (theme == 0 && sysDark);
        u.accent = accent(c);
        u.bg = u.dark ? 0xFF0F1115 : 0xFFF4F5F8;
        u.surface = u.dark ? 0xFF1A1D24 : 0xFFFFFFFF;
        u.text1 = u.dark ? 0xFFF1F2F5 : 0xFF15171C;
        u.text2 = u.dark ? 0xFF9AA0AC : 0xFF667085;
        u.onAccent = Color.luminance(u.accent) > 0.5f ? Color.BLACK : Color.WHITE;
        return u;
    }

    private static SharedPreferences sp(Context c) {
        return c.getSharedPreferences("ui", Context.MODE_PRIVATE);
    }

    static int theme(Context c) {
        return sp(c).getInt(KEY_THEME, Prefs.getInt(c, KEY_THEME, 0));
    }

    static int accent(Context c) {
        return sp(c).getInt(KEY_ACCENT, Prefs.getInt(c, KEY_ACCENT, ACCENTS[0]));
    }

    /** saved locally (instant) and in Settings.System via the server (sidebar, pad controls read it) */
    static void set(Context c, String key, int v) {
        sp(c).edit().putInt(key, v).apply();
        Prefs.putInt(c, key, v);
    }

    static int mix(int a, int b, float t) {
        return Color.rgb(
                Math.round(Color.red(a) * (1 - t) + Color.red(b) * t),
                Math.round(Color.green(a) * (1 - t) + Color.green(b) * t),
                Math.round(Color.blue(a) * (1 - t) + Color.blue(b) * t));
    }

    static GradientDrawable round(int color, int radiusPx) {
        GradientDrawable g = new GradientDrawable();
        g.setColor(color);
        g.setCornerRadius(radiusPx);
        return g;
    }

    void applyBars(Activity a) {
        a.getWindow().setStatusBarColor(bg);
        a.getWindow().setNavigationBarColor(bg);
        int f = a.getWindow().getDecorView().getSystemUiVisibility();
        f = dark ? (f & ~android.view.View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR & ~android.view.View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR)
                : (f | android.view.View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | android.view.View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
        a.getWindow().getDecorView().setSystemUiVisibility(f);
    }
}
