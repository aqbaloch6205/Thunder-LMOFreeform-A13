package com.libremobileos.freeform.launcher;

import android.animation.ValueAnimator;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.ComponentName;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Process;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.GridLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * Edge handle ("sideline") + slide-out panel of pinned apps.
 * Tap a pinned app -> floating window (broadcast to the freeform server in system_server).
 * Handle: tap or swipe inward = open panel, long-press then drag = move up/down.
 */
public class SidebarService extends Service implements SharedPreferences.OnSharedPreferenceChangeListener {
    static final String ACTION_START = "com.libremobileos.freeform.START_FREEFORM";
    private static final String CHANNEL = "sidebar";

    private WindowManager wm;
    private SharedPreferences prefs;
    private final Handler ui = new Handler(Looper.getMainLooper());

    private View handle;
    private WindowManager.LayoutParams handleLp;
    private View panel;
    private boolean panelShown;

    @Override
    public IBinder onBind(Intent intent) { return null; }

    @Override
    public void onCreate() {
        super.onCreate();
        wm = (WindowManager) getSystemService(WINDOW_SERVICE);
        prefs = Prefs.get(this);
        prefs.registerOnSharedPreferenceChangeListener(this);
        startAsForeground();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (!prefs.getBoolean(Prefs.ENABLED, false) || !android.provider.Settings.canDrawOverlays(this)) {
            stopSelf();
            return START_NOT_STICKY;
        }
        rebuild();
        return START_STICKY;
    }

    @Override
    public void onDestroy() {
        prefs.unregisterOnSharedPreferenceChangeListener(this);
        removePanel();
        removeHandle();
        super.onDestroy();
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (prefs.getBoolean(Prefs.ENABLED, false)) rebuild();
    }

    @Override
    public void onSharedPreferenceChanged(SharedPreferences sp, String key) {
        if (Prefs.HANDLE_Y.equals(key) || Prefs.PINNED.equals(key)) return; // no rebuild needed
        if (Prefs.ENABLED.equals(key) && !sp.getBoolean(Prefs.ENABLED, false)) {
            stopSelf();
            return;
        }
        rebuild();
    }

    private void startAsForeground() {
        NotificationManager nm = getSystemService(NotificationManager.class);
        nm.createNotificationChannel(new NotificationChannel(
                CHANNEL, "Freeform sidebar", NotificationManager.IMPORTANCE_MIN));
        PendingIntent pi = PendingIntent.getActivity(this, 0,
                new Intent(this, MainActivity.class), PendingIntent.FLAG_IMMUTABLE);
        Notification n = new Notification.Builder(this, CHANNEL)
                .setSmallIcon(R.drawable.ic_launcher)
                .setContentTitle("Freeform sidebar")
                .setContentIntent(pi)
                .setOngoing(true)
                .build();
        startForeground(1, n);
    }

    private int dp(float v) {
        return Math.round(v * getResources().getDisplayMetrics().density);
    }

    private boolean right() { return prefs.getInt(Prefs.SIDE, 1) == 1; }

    private int screenH() { return getResources().getDisplayMetrics().heightPixels; }
    private int screenW() { return getResources().getDisplayMetrics().widthPixels; }

    // ------------------------------------------------------------------ handle

    private void rebuild() {
        ui.post(() -> {
            removePanel();
            removeHandle();
            addHandle();
        });
    }

    private void removeHandle() {
        if (handle != null) {
            try { wm.removeViewImmediate(handle); } catch (Exception ignored) {}
            handle = null;
        }
    }

    private void addHandle() {
        final boolean right = right();
        int barW = dp(prefs.getInt(Prefs.HANDLE_WIDTH, 6));
        int barH = dp(prefs.getInt(Prefs.HANDLE_LEN, 100));
        int touchW = dp(24);

        FrameLayout box = new FrameLayout(this);
        View bar = new View(this);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Prefs.isNight(this) ? 0xFFE0E0E0 : 0xFF424242);
        bg.setCornerRadius(barW);
        bar.setBackground(bg);
        bar.setAlpha(prefs.getInt(Prefs.HANDLE_ALPHA, 70) / 100f);
        box.addView(bar, new FrameLayout.LayoutParams(barW, barH, right ? Gravity.END : Gravity.START));

        int y = prefs.getInt(Prefs.HANDLE_Y, -1);
        if (y < 0) y = screenH() / 3;
        y = Math.max(0, Math.min(y, screenH() - barH));

        handleLp = new WindowManager.LayoutParams(touchW, barH,
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                        | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
                        | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                        | WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
                PixelFormat.TRANSLUCENT);
        handleLp.gravity = Gravity.TOP | (right ? Gravity.END : Gravity.START);
        handleLp.x = 0;
        handleLp.y = y;
        handleLp.setTitle("FreeformSidebarHandle");

        final int slop = ViewConfiguration.get(this).getScaledTouchSlop();
        final int longPress = ViewConfiguration.getLongPressTimeout();
        box.setOnTouchListener(new View.OnTouchListener() {
            float downX, downY;
            int startY;
            boolean dragging, moved;
            final Runnable lp = () -> {
                dragging = true;
                box.performHapticFeedback(android.view.HapticFeedbackConstants.LONG_PRESS);
            };

            @Override
            public boolean onTouch(View v, MotionEvent e) {
                switch (e.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        downX = e.getRawX();
                        downY = e.getRawY();
                        startY = handleLp.y;
                        dragging = false;
                        moved = false;
                        ui.postDelayed(lp, longPress);
                        return true;
                    case MotionEvent.ACTION_MOVE: {
                        float dx = e.getRawX() - downX;
                        float dy = e.getRawY() - downY;
                        if (dragging) {
                            handleLp.y = Math.max(0, Math.min(startY + Math.round(dy), screenH() - barH));
                            try { wm.updateViewLayout(box, handleLp); } catch (Exception ignored) {}
                        } else if (Math.abs(dx) > slop || Math.abs(dy) > slop) {
                            moved = true;
                            ui.removeCallbacks(lp);
                            boolean inward = right ? dx < -slop : dx > slop;
                            if (inward && Math.abs(dx) > Math.abs(dy)) {
                                openPanel();
                                return true;
                            }
                        }
                        return true;
                    }
                    case MotionEvent.ACTION_UP:
                        ui.removeCallbacks(lp);
                        if (dragging) {
                            prefs.edit().putInt(Prefs.HANDLE_Y, handleLp.y).apply();
                        } else if (!moved) {
                            openPanel();
                        }
                        dragging = false;
                        return true;
                    case MotionEvent.ACTION_CANCEL:
                        ui.removeCallbacks(lp);
                        dragging = false;
                        return true;
                }
                return false;
            }
        });

        handle = box;
        try {
            wm.addView(handle, handleLp);
        } catch (Exception e) {
            handle = null;
        }
    }

    // ------------------------------------------------------------------- panel

    private void removePanel() {
        if (panel != null) {
            try { wm.removeViewImmediate(panel); } catch (Exception ignored) {}
            panel = null;
        }
        panelShown = false;
    }

    private static class Entry {
        String label;
        Drawable icon;
        boolean tintIcon;
        Runnable action;
    }

    private List<Entry> buildEntries() {
        List<Entry> list = new ArrayList<>();
        PackageManager pm = getPackageManager();

        Entry all = new Entry();
        all.label = "All apps";
        all.icon = getDrawable(R.drawable.ic_apps);
        all.tintIcon = true;
        all.action = () -> startActivity(new Intent(this, AppPickerActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        list.add(all);

        for (String s : Prefs.pinned(this)) {
            int slash = s.indexOf('/');
            if (slash < 0) continue;
            String pkg = s.substring(0, slash), act = s.substring(slash + 1);
            try {
                ActivityInfo ai = pm.getActivityInfo(new ComponentName(pkg, act), 0);
                Entry e = new Entry();
                e.label = String.valueOf(ai.loadLabel(pm));
                e.icon = ai.loadIcon(pm);
                e.action = () -> startFreeform(pkg, act);
                list.add(e);
            } catch (PackageManager.NameNotFoundException ignored) {
                // app was uninstalled
            }
        }

        Entry set = new Entry();
        set.label = "Settings";
        set.icon = getDrawable(R.drawable.ic_settings);
        set.tintIcon = true;
        set.action = () -> startActivity(new Intent(this, MainActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        list.add(set);
        return list;
    }

    private void startFreeform(String pkg, String act) {
        Intent i = new Intent(ACTION_START);
        i.putExtra("packageName", pkg);
        i.putExtra("activityName", act);
        i.putExtra("userId", Process.myUid() / 100000);
        sendBroadcast(i);
    }

    private void openPanel() {
        if (panelShown) return;
        final boolean right = right();
        final boolean night = Prefs.isNight(this);
        final int iconPx = dp(prefs.getInt(Prefs.ICON_SIZE, 40));
        final int cols = Math.max(1, prefs.getInt(Prefs.COLUMNS, 1));
        final int textColor = night ? Color.WHITE : 0xFF212121;

        List<Entry> entries = buildEntries();
        int cell = iconPx + dp(14);

        GridLayout grid = new GridLayout(this);
        grid.setColumnCount(cols);
        grid.setPadding(dp(6), dp(8), dp(6), dp(8));
        for (Entry e : entries) {
            ImageView iv = new ImageView(this);
            iv.setImageDrawable(e.icon);
            if (e.tintIcon) iv.setColorFilter(textColor);
            iv.setPadding(dp(7), dp(7), dp(7), dp(7));
            iv.setContentDescription(e.label);
            iv.setOnClickListener(v -> {
                removePanel();
                e.action.run();
            });
            GridLayout.LayoutParams lp = new GridLayout.LayoutParams();
            lp.width = cell;
            lp.height = cell;
            grid.addView(iv, lp);
        }

        ScrollView scroll = new ScrollView(this);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.addView(grid);

        GradientDrawable bg = new GradientDrawable();
        int alpha = Math.round(255 * prefs.getInt(Prefs.PANEL_ALPHA, 85) / 100f);
        bg.setColor((night ? 0x00202124 : 0x00F5F5F5) | (alpha << 24));
        bg.setCornerRadius(dp(24));
        FrameLayout box = new FrameLayout(this);
        box.setBackground(bg);
        box.setElevation(dp(8));
        box.setClipToOutline(true);
        box.addView(scroll, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        box.setOnTouchListener((v, ev) -> {
            if (ev.getAction() == MotionEvent.ACTION_OUTSIDE) {
                removePanel();
                return true;
            }
            return false;
        });

        int rows = (entries.size() + cols - 1) / cols;
        int w = cols * cell + dp(12);
        int h = Math.min(rows * cell + dp(16), Math.round(screenH() * 0.8f));
        int handleY = handleLp != null ? handleLp.y : screenH() / 3;
        int y = Math.max(dp(24), Math.min(handleY - h / 2 + dp(50), screenH() - h - dp(24)));

        WindowManager.LayoutParams lp = new WindowManager.LayoutParams(w, h,
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                        | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
                        | WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH
                        | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
                PixelFormat.TRANSLUCENT);
        lp.gravity = Gravity.TOP | (right ? Gravity.END : Gravity.START);
        lp.x = dp(10);
        lp.y = y;
        lp.setTitle("FreeformSidebarPanel");

        try {
            wm.addView(box, lp);
        } catch (Exception e) {
            return;
        }
        panel = box;
        panelShown = true;

        // slide in from the edge
        final float from = (right ? 1 : -1) * (w + dp(10));
        box.setTranslationX(from);
        ValueAnimator a = ValueAnimator.ofFloat(from, 0f);
        a.setDuration(220);
        a.addUpdateListener(an -> box.setTranslationX((float) an.getAnimatedValue()));
        a.start();
    }
}
