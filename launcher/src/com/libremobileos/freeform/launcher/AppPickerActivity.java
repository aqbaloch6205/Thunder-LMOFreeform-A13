package com.libremobileos.freeform.launcher;

import android.app.Activity;
import android.app.AlertDialog;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.ArrayAdapter;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Process;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * App grid. Two modes:
 *  - launch (default): tap = open in a floating window
 *  - pin (extra "pin" = true): tap toggles, "Done" saves the sidebar app list
 */
public class AppPickerActivity extends Activity {
    static final String EXTRA_PIN = "pin";
    static final String EXTRA_PAD = "pad";
    private static final String ACTION_START_PAD = "com.libremobileos.freeform.START_THUNDERPAD";
    private static final String[] PAD_NAMES = {
            "iPad mini 5 (2048x1536)", "iPad 10.2\" (2160x1620)", "iPad Air 11\" (2360x1640)",
            "iPad Pro 11\" (2388x1668)", "iPad Pro 12.9\" (2732x2048)", "Custom" };
    private static final int[][] PAD_VALUES = {
            {2048, 1536, 326}, {2160, 1620, 264}, {2360, 1640, 264}, {2388, 1668, 264}, {2732, 2048, 264} };
    private static final String ACTION_START = "com.libremobileos.freeform.START_FREEFORM";

    private static class Item {
        String label, pkg, activity, key;
        Drawable icon;
    }

    private final List<Item> all = new ArrayList<>();
    private final List<Item> shown = new ArrayList<>();
    private final List<String> selected = new ArrayList<>(); // ordered "pkg/activity"
    private BaseAdapter adapter;
    private boolean pinMode;
    private boolean padMode;
    private Ui ui;

    private int dp(int v) {
        return Math.round(v * getResources().getDisplayMetrics().density);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        pinMode = getIntent().getBooleanExtra(EXTRA_PIN, false);
        padMode = getIntent().getBooleanExtra(EXTRA_PAD, false);
        if (pinMode) selected.addAll(Prefs.pinned(this));

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(12), dp(24), dp(12), 0);
        ui = Ui.of(this);
        root.setBackgroundColor(ui.bg);
        ui.applyBars(this);

        TextView title = new TextView(this);
        title.setTextSize(20);
        title.setTextColor(ui.text1);
        title.setPadding(dp(4), 0, 0, dp(8));
        title.setText(padMode ? "ThunderPad · choose an app"
                : pinMode ? "Choose sidebar apps" : "Open in floating window");
        root.addView(title);

        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);
        EditText search = new EditText(this);
        search.setHint("Search apps");
        search.setSingleLine(true);
        search.setTextColor(ui.text1);
        search.setHintTextColor(ui.text2);
        search.setPadding(dp(18), dp(12), dp(18), dp(12));
        search.setBackground(Ui.round(ui.surface, dp(26)));
        top.addView(search, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        if (pinMode) {
            Button done = new Button(this);
            done.setText("Done");
            done.setOnClickListener(v -> {
                Prefs.setPinned(this, selected);
                finish();
            });
            top.addView(done);
        }
        root.addView(top);

        GridView grid = new GridView(this);
        grid.setNumColumns(5);
        grid.setVerticalSpacing(dp(8));
        adapter = new AppAdapter();
        grid.setAdapter(adapter);
        grid.setOnItemClickListener((parent, view, position, id) -> {
            Item it = shown.get(position);
            if (pinMode) {
                if (!selected.remove(it.key)) selected.add(it.key);
                adapter.notifyDataSetChanged();
            } else if (padMode) {
                showPad(it);
            } else {
                start(it);
            }
        });
        grid.setOnItemLongClickListener((parent, view, position, id) -> {
            if (pinMode || padMode) return false;
            showProfile(shown.get(position));
            return true;
        });
        root.addView(grid, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        setContentView(root);

        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int a, int b, int c) {}
            @Override public void onTextChanged(CharSequence s, int a, int b, int c) {}
            @Override public void afterTextChanged(Editable s) { filter(s.toString()); }
        });

        new Thread(this::loadApps).start();
    }

    private void loadApps() {
        PackageManager pm = getPackageManager();
        Intent q = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER);
        List<Item> list = new ArrayList<>();
        for (ResolveInfo ri : pm.queryIntentActivities(q, 0)) {
            if (getPackageName().equals(ri.activityInfo.packageName)) continue;
            Item it = new Item();
            it.label = String.valueOf(ri.loadLabel(pm));
            it.pkg = ri.activityInfo.packageName;
            it.activity = ri.activityInfo.name;
            it.key = it.pkg + "/" + it.activity;
            it.icon = ri.loadIcon(pm);
            list.add(it);
        }
        Collections.sort(list, (a, b) -> a.label.compareToIgnoreCase(b.label));
        runOnUiThread(() -> {
            all.clear();
            all.addAll(list);
            filter("");
        });
    }

    private void filter(String text) {
        String t = text.trim().toLowerCase(Locale.ROOT);
        shown.clear();
        for (Item it : all) {
            if (t.isEmpty() || it.label.toLowerCase(Locale.ROOT).contains(t)) shown.add(it);
        }
        adapter.notifyDataSetChanged();
    }

    /** Per-app window profile: orientation, width %, height %, dpi (0 = auto). */
    private void showProfile(Item it) {
        int[] p = Prefs.profile(this, it.pkg);
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(20), dp(12), dp(20), 0);
        TextView t = new TextView(this);
        t.setText("Window shape");
        box.addView(t);
        Spinner orient = new Spinner(this);
        orient.setAdapter(new ArrayAdapter<>(this, android.R.layout.simple_spinner_dropdown_item,
                new String[] { "Auto (follow the app)", "Always portrait", "Always landscape 16:9" }));
        orient.setSelection(Math.max(0, Math.min(2, p[0])));
        box.addView(orient);
        SeekBar w = bar(box, "Width % (0 = auto)", 0, 100, p[1]);
        SeekBar h = bar(box, "Height % (0 = auto)", 0, 100, p[2]);
        SeekBar d = bar(box, "DPI (0 = auto)", 0, 800, p[3]);
        new AlertDialog.Builder(this)
                .setTitle(it.label)
                .setView(box)
                .setPositiveButton("Save", (dlg, which) -> {
                    int dpi = d.getProgress();
                    if (dpi != 0 && dpi < 120) dpi = 120;
                    int wp = w.getProgress(), hp = h.getProgress();
                    Prefs.setProfile(this, it.pkg, new int[] {
                            orient.getSelectedItemPosition(),
                            wp == 0 ? 0 : Math.max(30, wp), hp == 0 ? 0 : Math.max(30, hp), dpi });
                })
                .setNeutralButton("Reset", (dlg, which) -> Prefs.setProfile(this, it.pkg, new int[4]))
                .setNegativeButton("Cancel", null)
                .show();
    }

    /** ThunderPad: tablet resolution + fit mode for one app (opens fullscreen from the sidebar). */
    private void showPad(Item it) {
        int[] cur = Prefs.pad(this, it.pkg);
        int[] def = cur != null ? cur : new int[] { 2048, 1536, 326, 0 };   // fit 0 = fill
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(20), dp(12), dp(20), 0);

        TextView t1 = new TextView(this);
        t1.setText("Resolution preset");
        box.addView(t1);
        Spinner preset = new Spinner(this);
        preset.setAdapter(new ArrayAdapter<>(this, android.R.layout.simple_spinner_dropdown_item, PAD_NAMES));
        int sel = PAD_NAMES.length - 1;
        for (int i = 0; i < PAD_VALUES.length; i++) {
            if (PAD_VALUES[i][0] == def[0] && PAD_VALUES[i][1] == def[1]) sel = i;
        }
        preset.setSelection(sel);
        box.addView(preset);

        EditText ew = num("Width", def[0]);
        EditText eh = num("Height", def[1]);
        EditText ed = num("DPI", def[2]);
        box.addView(ew);
        box.addView(eh);
        box.addView(ed);
        preset.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener() {
            @Override public void onItemSelected(android.widget.AdapterView<?> p, View v, int pos, long id) {
                if (pos < PAD_VALUES.length) {
                    ew.setText(String.valueOf(PAD_VALUES[pos][0]));
                    eh.setText(String.valueOf(PAD_VALUES[pos][1]));
                    ed.setText(String.valueOf(PAD_VALUES[pos][2]));
                }
            }
            @Override public void onNothingSelected(android.widget.AdapterView<?> p) {}
        });

        TextView t2 = new TextView(this);
        t2.setText("Fit to screen");
        t2.setPadding(0, dp(10), 0, 0);
        box.addView(t2);
        Spinner fit = new Spinner(this);
        fit.setAdapter(new ArrayAdapter<>(this, android.R.layout.simple_spinner_dropdown_item,
                new String[] { "Fill screen (recommended, like a normal app)",
                        "Original (tablet ratio, black bars)", "Stretch to fit (exact resolution)" }));
        fit.setSelection(Math.max(0, Math.min(2, def[3])));
        box.addView(fit);

        TextView hint = new TextView(this);
        hint.setText("Open this app from the sidebar / All apps to get it fullscreen. Home or another app hides it (it keeps running); open it again from the sidebar to continue.");
        hint.setTextSize(12);
        hint.setPadding(0, dp(10), 0, 0);
        box.addView(hint);

        android.content.DialogInterface.OnClickListener save = (d, which) -> {
            int w = parse(ew, 2048), h = parse(eh, 1536), dpi = parse(ed, 326);
            w = Math.max(480, Math.min(w, 4096));
            h = Math.max(480, Math.min(h, 4096));
            dpi = Math.max(120, Math.min(dpi, 800));
            Prefs.setPad(this, it.pkg, new int[] { w, h, dpi, fit.getSelectedItemPosition() });
            if (which == android.content.DialogInterface.BUTTON_POSITIVE) {
                sendBroadcast(new Intent(ACTION_START_PAD)
                        .putExtra("packageName", it.pkg).putExtra("activityName", it.activity)
                        .putExtra("userId", Process.myUid() / 100000));
                finish();
            } else {
                adapter.notifyDataSetChanged();
            }
        };
        new AlertDialog.Builder(this)
                .setTitle("ThunderPad: " + it.label)
                .setView(box)
                .setPositiveButton("Save & open", save)
                .setNeutralButton("Save", save)
                .setNegativeButton("Remove", (d, which) -> {
                    Prefs.setPad(this, it.pkg, null);
                    adapter.notifyDataSetChanged();
                })
                .show();
    }

    private EditText num(String hint, int value) {
        EditText e = new EditText(this);
        e.setHint(hint);
        e.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);
        e.setText(String.valueOf(value));
        return e;
    }

    private int parse(EditText e, int def) {
        try { return Integer.parseInt(e.getText().toString().trim()); } catch (Exception x) { return def; }
    }

    private SeekBar bar(LinearLayout box, String title, int min, int max, int value) {
        TextView label = new TextView(this);
        label.setText(title + ": " + value);
        label.setPadding(0, dp(10), 0, 0);
        box.addView(label);
        SeekBar bar = new SeekBar(this);
        bar.setMax(max - min);
        bar.setProgress(value - min);
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

    private void start(Item it) {
        Intent i = new Intent(ACTION_START);
        i.putExtra("packageName", it.pkg);
        i.putExtra("activityName", it.activity);
        i.putExtra("userId", Process.myUid() / 100000);
        sendBroadcast(i);
        finish();
    }

    private class AppAdapter extends BaseAdapter {
        @Override public int getCount() { return shown.size(); }
        @Override public Object getItem(int p) { return shown.get(p); }
        @Override public long getItemId(int p) { return p; }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            LinearLayout cell;
            if (convertView == null) {
                cell = new LinearLayout(AppPickerActivity.this);
                cell.setOrientation(LinearLayout.VERTICAL);
                cell.setGravity(Gravity.CENTER_HORIZONTAL);
                cell.setPadding(dp(2), dp(4), dp(2), dp(4));
                ImageView icon = new ImageView(AppPickerActivity.this);
                cell.addView(icon, new LinearLayout.LayoutParams(dp(48), dp(48)));
                TextView name = new TextView(AppPickerActivity.this);
                name.setTextSize(11);
                name.setGravity(Gravity.CENTER);
                name.setMaxLines(2);
                name.setEllipsize(android.text.TextUtils.TruncateAt.END);
                cell.addView(name, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
                cell.setTag(new Object[] { icon, name });
            } else {
                cell = (LinearLayout) convertView;
            }
            Object[] holder = (Object[]) cell.getTag();
            Item it = shown.get(position);
            ((ImageView) holder[0]).setImageDrawable(it.icon);
            ((TextView) holder[1]).setText(it.label);
            boolean mark = (pinMode && selected.contains(it.key)) || (padMode && Prefs.pad(AppPickerActivity.this, it.pkg) != null);
            cell.setBackground(mark ? Ui.round((ui.accent & 0x00FFFFFF) | 0x55000000, dp(16)) : null);
            ((TextView) holder[1]).setTextColor(ui.text1);
            return cell;
        }
    }
}
