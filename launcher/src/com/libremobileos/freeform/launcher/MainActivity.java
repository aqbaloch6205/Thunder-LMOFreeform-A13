package com.libremobileos.freeform.launcher;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.os.Bundle;
import android.provider.Settings;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

/** Settings: sidebar on/off, look & feel, pinned apps, floating window size. */
public class MainActivity extends Activity {
    private static final String ACTION_SET_CONFIG = "com.libremobileos.freeform.SET_CONFIG";
    private static final String KEY_WIDTH = "lmo_freeform_width_pct";
    private static final String KEY_HEIGHT = "lmo_freeform_height_pct";
    private static final String KEY_DPI = "lmo_freeform_dpi";

    private int dp(int v) {
        return Math.round(v * getResources().getDisplayMetrics().density);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(20), dp(32), dp(20), dp(24));

        TextView title = new TextView(this);
        title.setTextSize(22);
        title.setText("Freeform settings");
        box.addView(title);

        TextView hint = new TextView(this);
        hint.setText("Sidebar runs inside the system. Open/close it with the edge handle, "
                + "or bind a key to LMOFreeformApi.toggleSidebar().");
        hint.setPadding(0, dp(8), 0, 0);
        box.addView(hint);

        Switch enable = new Switch(this);
        enable.setText("Enable sidebar");
        enable.setPadding(0, dp(16), 0, dp(8));
        enable.setChecked(Prefs.getInt(this, Prefs.ENABLED, 1) == 1);
        enable.setOnCheckedChangeListener((b, on) -> Prefs.putInt(this, Prefs.ENABLED, on ? 1 : 0));
        box.addView(enable);

        RadioGroup side = new RadioGroup(this);
        side.setOrientation(RadioGroup.HORIZONTAL);
        RadioButton l = new RadioButton(this); l.setText("Left"); l.setId(100);
        RadioButton r = new RadioButton(this); r.setText("Right"); r.setId(101);
        side.addView(l);
        side.addView(r);
        side.check(Prefs.getInt(this, Prefs.SIDE, 1) == 1 ? 101 : 100);
        side.setOnCheckedChangeListener((g, id) -> Prefs.putInt(this, Prefs.SIDE, id == 101 ? 1 : 0));
        box.addView(side);

        TextView ctl = new TextView(this);
        ctl.setText("Floating window controls");
        ctl.setPadding(0, dp(12), 0, 0);
        box.addView(ctl);
        RadioGroup mode = new RadioGroup(this);
        mode.setOrientation(RadioGroup.HORIZONTAL);
        RadioButton mb = new RadioButton(this); mb.setText("Buttons"); mb.setId(200);
        RadioButton mg = new RadioButton(this); mg.setText("Gesture pill"); mg.setId(201);
        mode.addView(mb);
        mode.addView(mg);
        String cur = Settings.System.getString(getContentResolver(), "freeform_control_mode");
        mode.check("Gesture".equalsIgnoreCase(cur) || "1".equals(cur) ? 201 : 200);
        mode.setOnCheckedChangeListener((g, id) -> sendBroadcast(
                new Intent(Prefs.ACTION_SET_CONFIG).putExtra("freeform_control_mode",
                        id == 201 ? "Gesture" : "Button")));
        box.addView(mode);

        slider(box, "Handle length (dp)", Prefs.HANDLE_LEN, 40, 300, 100);
        slider(box, "Handle width (dp)", Prefs.HANDLE_WIDTH, 3, 16, 6);
        slider(box, "Handle opacity (%)", Prefs.HANDLE_ALPHA, 20, 100, 70);
        slider(box, "Columns", Prefs.COLUMNS, 1, 5, 1);
        slider(box, "Icon size (dp)", Prefs.ICON_SIZE, 32, 72, 40);
        slider(box, "Panel opacity (%)", Prefs.PANEL_ALPHA, 40, 100, 85);

        box.addView(button("Choose sidebar apps", () ->
                startActivity(new Intent(this, AppPickerActivity.class)
                        .putExtra(AppPickerActivity.EXTRA_PIN, true))));
        box.addView(button("ThunderPad (iPad view, fullscreen)", () ->
                startActivity(new Intent(this, AppPickerActivity.class)
                        .putExtra(AppPickerActivity.EXTRA_PAD, true))));
        box.addView(button("Default window size", this::showSizeDialog));
        box.addView(button("Open an app (long-press = per-app window settings)", () ->
                startActivity(new Intent(this, AppPickerActivity.class))));

        ScrollView sv = new ScrollView(this);
        sv.addView(box);
        setContentView(sv);
    }

    private Button button(String text, Runnable r) {
        Button b = new Button(this);
        b.setText(text);
        b.setAllCaps(false);
        b.setOnClickListener(v -> r.run());
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(12);
        b.setLayoutParams(lp);
        return b;
    }

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

    private void slider(LinearLayout box, String title, String key, int min, int max, int def) {
        SeekBar bar = addSlider(box, title, min, max, Prefs.getInt(this, key, def));
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar s, int p, boolean u) {
                ((TextView) box.getChildAt(box.indexOfChild(s) - 1)).setText(title + ": " + (p + min));
            }
            @Override public void onStartTrackingTouch(SeekBar s) {}
            @Override public void onStopTrackingTouch(SeekBar s) {
                Prefs.putInt(MainActivity.this, key, s.getProgress() + min);
            }
        });
    }

    private int getSetting(String key, int def) {
        return Prefs.getInt(this, key, def);
    }

    private void showSizeDialog() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(20), dp(12), dp(20), 0);
        SeekBar w = addSlider(box, "Width % (portrait)", 30, 100, getSetting(KEY_WIDTH, 90));
        SeekBar h = addSlider(box, "Height % (portrait)", 30, 100, getSetting(KEY_HEIGHT, 62));
        SeekBar d = addSlider(box, "DPI (0 = auto, 120-800)", 0, 800, getSetting(KEY_DPI, 0));
        new AlertDialog.Builder(this)
                .setTitle("Floating window size")
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
