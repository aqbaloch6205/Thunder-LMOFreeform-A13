package com.libremobileos.freeform.launcher;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Bundle;
import android.provider.Settings;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;

/** Settings: modern card layout. Sidebar, windows, ThunderPad. */
public class MainActivity extends Activity {
    private static final String ACTION_SET_CONFIG = "com.libremobileos.freeform.SET_CONFIG";
    private static final String KEY_WIDTH = "lmo_freeform_width_pct";
    private static final String KEY_HEIGHT = "lmo_freeform_height_pct";
    private static final String KEY_DPI = "lmo_freeform_dpi";

    private int bg, surface, text1, text2, accent, onAccent;

    private int dp(int v) {
        return Math.round(v * getResources().getDisplayMetrics().density);
    }

    private int attr(int attr, int def) {
        TypedValue tv = new TypedValue();
        if (getTheme().resolveAttribute(attr, tv, true)) {
            if (tv.type >= TypedValue.TYPE_FIRST_COLOR_INT && tv.type <= TypedValue.TYPE_LAST_COLOR_INT) return tv.data;
            try { return getColor(tv.resourceId); } catch (Exception ignored) {}
        }
        return def;
    }

    private static int mix(int a, int b, float t) {
        return Color.rgb(
                Math.round(Color.red(a) * (1 - t) + Color.red(b) * t),
                Math.round(Color.green(a) * (1 - t) + Color.green(b) * t),
                Math.round(Color.blue(a) * (1 - t) + Color.blue(b) * t));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        bg = attr(android.R.attr.colorBackground, Color.WHITE);
        text1 = attr(android.R.attr.textColorPrimary, Color.BLACK);
        text2 = attr(android.R.attr.textColorSecondary, 0xFF707070);
        accent = attr(android.R.attr.colorAccent, 0xFF3F8CFF);
        boolean light = Color.luminance(bg) > 0.5f;
        surface = mix(bg, accent, light ? 0.07f : 0.14f);
        onAccent = Color.luminance(accent) > 0.55f ? Color.BLACK : Color.WHITE;
        Window w = getWindow();
        w.setStatusBarColor(bg);
        w.setNavigationBarColor(bg);

        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(dp(16), dp(28), dp(16), dp(32));

        TextView title = new TextView(this);
        title.setText("Thunder Freeform");
        title.setTextSize(28);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        title.setTextColor(text1);
        page.addView(title);
        TextView sub = new TextView(this);
        sub.setText("Floating windows · Sidebar · ThunderPad");
        sub.setTextColor(text2);
        sub.setPadding(0, dp(2), 0, dp(18));
        page.addView(sub);

        // ---- Sidebar
        LinearLayout c1 = card(page, "SIDEBAR");
        switchRow(c1, "Enable sidebar", "Swipe in from the screen edge to open",
                Prefs.getInt(this, Prefs.ENABLED, 1) == 1, on -> Prefs.putInt(this, Prefs.ENABLED, on ? 1 : 0));
        label(c1, "Side");
        segmented(c1, new String[] { "Left", "Right" }, Prefs.getInt(this, Prefs.SIDE, 1),
                i -> Prefs.putInt(this, Prefs.SIDE, i));
        slider(c1, "Handle length", Prefs.HANDLE_LEN, 40, 300, 100, " dp");
        slider(c1, "Handle width", Prefs.HANDLE_WIDTH, 3, 16, 6, " dp");
        slider(c1, "Handle opacity", Prefs.HANDLE_ALPHA, 20, 100, 70, "%");
        slider(c1, "Columns", Prefs.COLUMNS, 1, 5, 1, "");
        slider(c1, "Icon size", Prefs.ICON_SIZE, 32, 72, 40, " dp");
        slider(c1, "Panel opacity", Prefs.PANEL_ALPHA, 40, 100, 85, "%");
        actionRow(c1, "Sidebar apps", "Choose the apps shown in the panel", () ->
                startActivity(new Intent(this, AppPickerActivity.class)
                        .putExtra(AppPickerActivity.EXTRA_PIN, true)));

        // ---- Windows
        LinearLayout c2 = card(page, "FLOATING WINDOWS");
        label(c2, "Controls");
        String cur = Settings.System.getString(getContentResolver(), "freeform_control_mode");
        segmented(c2, new String[] { "Buttons", "Gesture pill" },
                ("Gesture".equalsIgnoreCase(cur) || "1".equals(cur)) ? 1 : 0,
                i -> sendBroadcast(new Intent(ACTION_SET_CONFIG)
                        .putExtra("freeform_control_mode", i == 1 ? "Gesture" : "Button")));
        actionRow(c2, "Default window size", "Width, height and dpi of new windows", this::showSizeDialog);
        actionRow(c2, "Open an app", "Long-press an app for its own window settings", () ->
                startActivity(new Intent(this, AppPickerActivity.class)));

        // ---- ThunderPad
        LinearLayout c3 = card(page, "THUNDERPAD");
        actionRow(c3, "iPad view, fullscreen", "Run an app with a tablet resolution (iPad mini 5 & more)", () ->
                startActivity(new Intent(this, AppPickerActivity.class)
                        .putExtra(AppPickerActivity.EXTRA_PAD, true)));

        ScrollView sv = new ScrollView(this);
        sv.setBackgroundColor(bg);
        sv.setVerticalScrollBarEnabled(false);
        sv.addView(page);
        setContentView(sv);
    }

    // ------------------------------------------------------------- widgets

    private LinearLayout card(LinearLayout parent, String header) {
        TextView h = new TextView(this);
        h.setText(header);
        h.setTextSize(12);
        h.setLetterSpacing(0.1f);
        h.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        h.setTextColor(accent);
        h.setPadding(dp(8), dp(8), 0, dp(8));
        parent.addView(h);
        LinearLayout c = new LinearLayout(this);
        c.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable g = new GradientDrawable();
        g.setColor(surface);
        g.setCornerRadius(dp(26));
        c.setBackground(g);
        c.setPadding(dp(18), dp(10), dp(18), dp(10));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = dp(10);
        parent.addView(c, lp);
        return c;
    }

    private void label(LinearLayout c, String s) {
        TextView t = new TextView(this);
        t.setText(s);
        t.setTextSize(13);
        t.setTextColor(text2);
        t.setPadding(0, dp(10), 0, dp(6));
        c.addView(t);
    }

    private void switchRow(LinearLayout c, String title, String subtitle, boolean on, java.util.function.Consumer<Boolean> cb) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(8), 0, dp(8));
        row.addView(texts(title, subtitle), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        Switch sw = new Switch(this);
        sw.setChecked(on);
        sw.setOnCheckedChangeListener((b, v) -> cb.accept(v));
        row.addView(sw);
        c.addView(row);
    }

    private LinearLayout texts(String title, String subtitle) {
        LinearLayout t = new LinearLayout(this);
        t.setOrientation(LinearLayout.VERTICAL);
        TextView a = new TextView(this);
        a.setText(title);
        a.setTextSize(16);
        a.setTextColor(text1);
        t.addView(a);
        if (subtitle != null) {
            TextView b = new TextView(this);
            b.setText(subtitle);
            b.setTextSize(12.5f);
            b.setTextColor(text2);
            t.addView(b);
        }
        return t;
    }

    private void actionRow(LinearLayout c, String title, String subtitle, Runnable r) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(4), dp(14), dp(4), dp(14));
        row.setBackground(new RippleDrawable(ColorStateList.valueOf(mix(bg, accent, 0.25f)), null, rect(dp(14))));
        row.addView(texts(title, subtitle), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView chev = new TextView(this);
        chev.setText("›");
        chev.setTextSize(24);
        chev.setTextColor(text2);
        row.addView(chev);
        row.setOnClickListener(v -> r.run());
        c.addView(row);
    }

    private GradientDrawable rect(int radius) {
        GradientDrawable g = new GradientDrawable();
        g.setColor(Color.WHITE);
        g.setCornerRadius(radius);
        return g;
    }

    /** pill-shaped segmented control */
    private void segmented(LinearLayout c, String[] opts, int selected, java.util.function.IntConsumer cb) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        GradientDrawable track = new GradientDrawable();
        track.setColor(mix(surface, text1, 0.07f));
        track.setCornerRadius(dp(22));
        row.setBackground(track);
        row.setPadding(dp(4), dp(4), dp(4), dp(4));
        final TextView[] tv = new TextView[opts.length];
        for (int i = 0; i < opts.length; i++) {
            final int idx = i;
            TextView t = new TextView(this);
            t.setText(opts[i]);
            t.setGravity(Gravity.CENTER);
            t.setTextSize(14);
            t.setPadding(dp(8), dp(10), dp(8), dp(10));
            tv[i] = t;
            t.setOnClickListener(v -> {
                paintSeg(tv, idx);
                cb.accept(idx);
            });
            row.addView(t, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        }
        paintSeg(tv, selected);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = dp(6);
        c.addView(row, lp);
    }

    private void paintSeg(TextView[] tv, int sel) {
        for (int i = 0; i < tv.length; i++) {
            if (i == sel) {
                GradientDrawable g = new GradientDrawable();
                g.setColor(accent);
                g.setCornerRadius(dp(18));
                tv[i].setBackground(g);
                tv[i].setTextColor(onAccent);
            } else {
                tv[i].setBackground(null);
                tv[i].setTextColor(text1);
            }
        }
    }

    /** slider row with live value, saved when released */
    private void slider(LinearLayout c, String title, String key, int min, int max, int def, String unit) {
        int value = Math.max(min, Math.min(max, Prefs.getInt(this, key, def)));
        LinearLayout head = new LinearLayout(this);
        head.setOrientation(LinearLayout.HORIZONTAL);
        head.setPadding(0, dp(10), 0, 0);
        TextView name = new TextView(this);
        name.setText(title);
        name.setTextSize(14.5f);
        name.setTextColor(text1);
        head.addView(name, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView val = new TextView(this);
        val.setText(value + unit);
        val.setTextColor(accent);
        val.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        head.addView(val);
        c.addView(head);
        SeekBar bar = new SeekBar(this);
        bar.setMax(max - min);
        bar.setProgress(value - min);
        bar.setProgressTintList(ColorStateList.valueOf(accent));
        bar.setThumbTintList(ColorStateList.valueOf(accent));
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar s, int p, boolean u) { val.setText((p + min) + unit); }
            @Override public void onStartTrackingTouch(SeekBar s) {}
            @Override public void onStopTrackingTouch(SeekBar s) {
                Prefs.putInt(MainActivity.this, key, s.getProgress() + min);
            }
        });
        c.addView(bar);
    }

    // ------------------------------------------------------------- dialogs

    private SeekBar addSlider(LinearLayout box, String title, int min, int max, int value) {
        TextView label = new TextView(this);
        label.setText(title + ": " + value);
        label.setPadding(0, dp(12), 0, 0);
        box.addView(label);
        SeekBar bar = new SeekBar(this);
        bar.setMax(max - min);
        bar.setProgress(Math.max(0, Math.min(max, value) - min));
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar s, int p, boolean u) {
                label.setText(title + ": " + (p + min));
            }
            @Override public void onStartTrackingTouch(SeekBar s) {}
            @Override public void onStopTrackingTouch(SeekBar s) {}
        });
        box.addView(bar);
        return bar;
    }

    private void showSizeDialog() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(20), dp(12), dp(20), 0);
        SeekBar w = addSlider(box, "Width % (portrait)", 30, 100, Prefs.getInt(this, KEY_WIDTH, 90));
        SeekBar h = addSlider(box, "Height % (portrait)", 30, 100, Prefs.getInt(this, KEY_HEIGHT, 62));
        SeekBar d = addSlider(box, "DPI (0 = auto, 120-800)", 0, 800, Prefs.getInt(this, KEY_DPI, 0));
        new AlertDialog.Builder(this)
                .setTitle("Default window size")
                .setView(box)
                .setPositiveButton("Save", (dialog, which) -> {
                    int dpi = d.getProgress();
                    if (dpi != 0 && dpi < 120) dpi = 120;
                    Intent i = new Intent(ACTION_SET_CONFIG);
                    i.putExtra(KEY_WIDTH, w.getProgress() + 30);
                    i.putExtra(KEY_HEIGHT, h.getProgress() + 30);
                    i.putExtra(KEY_DPI, dpi);
                    sendBroadcast(i);
                })
                .setNegativeButton("Cancel", null)
                .show();
    }
}
