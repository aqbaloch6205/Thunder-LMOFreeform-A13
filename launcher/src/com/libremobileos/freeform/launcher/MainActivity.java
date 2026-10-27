package com.libremobileos.freeform.launcher;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Process;
import android.provider.Settings;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/** Picks an app and asks the freeform server (inside system_server) to open it in a floating window. */
public class MainActivity extends Activity {
    private static final String ACTION_START = "com.libremobileos.freeform.START_FREEFORM";
    private static final String ACTION_SET_CONFIG = "com.libremobileos.freeform.SET_CONFIG";
    private static final String KEY_WIDTH = "lmo_freeform_width_pct";
    private static final String KEY_HEIGHT = "lmo_freeform_height_pct";
    private static final String KEY_DPI = "lmo_freeform_dpi";

    private static class Item {
        String label, pkg, activity;
        Drawable icon;
    }

    private final List<Item> all = new ArrayList<>();
    private final List<Item> shown = new ArrayList<>();
    private BaseAdapter adapter;

    private int dp(int v) {
        return Math.round(v * getResources().getDisplayMetrics().density);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(12), dp(24), dp(12), 0);

        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);
        EditText search = new EditText(this);
        search.setHint("Search apps");
        search.setSingleLine(true);
        top.addView(search, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        Button settings = new Button(this);
        settings.setText("Size");
        settings.setOnClickListener(v -> showSizeDialog());
        top.addView(settings, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(top);

        GridView grid = new GridView(this);
        grid.setNumColumns(4);
        grid.setVerticalSpacing(dp(8));
        grid.setClipToPadding(false);
        adapter = new AppAdapter();
        grid.setAdapter(adapter);
        grid.setOnItemClickListener((AdapterView<?> parent, View view, int position, long id) -> {
            Item it = shown.get(position);
            start(it);
        });
        root.addView(grid, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
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

    private void start(Item it) {
        Intent i = new Intent(ACTION_START);
        i.putExtra("packageName", it.pkg);
        i.putExtra("activityName", it.activity);
        i.putExtra("userId", Process.myUid() / 100000);
        sendBroadcast(i);
        finish();
    }

    private int getSetting(String key, int def) {
        return Settings.System.getInt(getContentResolver(), key, def);
    }

    private SeekBar addSlider(LinearLayout box, String title, int min, int max, int value) {
        TextView label = new TextView(this);
        label.setText(title + ": " + value);
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
        SeekBar w = addSlider(box, "Width % (portrait)", 30, 100, getSetting(KEY_WIDTH, 90));
        SeekBar h = addSlider(box, "Height % (portrait)", 30, 100, getSetting(KEY_HEIGHT, 62));
        int curDpi = getSetting(KEY_DPI, 0);
        SeekBar d = addSlider(box, "DPI (0 = auto, 120-800)", 0, 800, curDpi);
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

    private class AppAdapter extends BaseAdapter {
        @Override public int getCount() { return shown.size(); }
        @Override public Object getItem(int p) { return shown.get(p); }
        @Override public long getItemId(int p) { return p; }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            LinearLayout cell;
            ImageView icon;
            TextView name;
            if (convertView == null) {
                cell = new LinearLayout(MainActivity.this);
                cell.setOrientation(LinearLayout.VERTICAL);
                cell.setGravity(Gravity.CENTER_HORIZONTAL);
                cell.setPadding(dp(2), dp(4), dp(2), dp(4));
                icon = new ImageView(MainActivity.this);
                cell.addView(icon, new LinearLayout.LayoutParams(dp(48), dp(48)));
                name = new TextView(MainActivity.this);
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
            return cell;
        }
    }
}
