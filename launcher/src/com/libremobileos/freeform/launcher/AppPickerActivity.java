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

    private int dp(int v) {
        return Math.round(v * getResources().getDisplayMetrics().density);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        pinMode = getIntent().getBooleanExtra(EXTRA_PIN, false);
        if (pinMode) selected.addAll(Prefs.pinned(this));

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(12), dp(24), dp(12), 0);

        TextView title = new TextView(this);
        title.setTextSize(18);
        title.setText(pinMode ? "Choose sidebar apps" : "Open in floating window");
        root.addView(title);

        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);
        EditText search = new EditText(this);
        search.setHint("Search apps");
        search.setSingleLine(true);
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
            } else {
                start(it);
            }
        });
        grid.setOnItemLongClickListener((parent, view, position, id) -> {
            if (pinMode) return false;
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
            cell.setBackgroundColor(pinMode && selected.contains(it.key) ? 0x553F8CFF : 0);
            return cell;
        }
    }
}
