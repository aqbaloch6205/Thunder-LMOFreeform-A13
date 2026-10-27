# classes.dex

.class public final Lcom/android/server/SystemServer;
.super Ljava/lang/Object;
.source "SystemServer.java"

# interfaces
.implements Landroid/util/Dumpable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/SystemServer$SystemServerDumper;
    }
.end annotation


# static fields
.field private static final ACCESSIBILITY_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.accessibility.AccessibilityManagerService$Lifecycle"

.field private static final ACCOUNT_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.accounts.AccountManagerService$Lifecycle"

.field private static final ADB_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.adb.AdbService$Lifecycle"

.field private static final AD_SERVICES_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.adservices.AdServicesManagerService$Lifecycle"

.field private static final ALARM_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.alarm.AlarmManagerService"

.field private static final APPSEARCH_MODULE_LIFECYCLE_CLASS:Ljava/lang/String; = "com.android.server.appsearch.AppSearchModule$Lifecycle"

.field private static final APPWIDGET_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.appwidget.AppWidgetService"

.field private static final APP_COMPAT_OVERRIDES_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.compat.overrides.AppCompatOverridesService$Lifecycle"

.field private static final APP_HIBERNATION_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.apphibernation.AppHibernationService"

.field private static final APP_PREDICTION_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.appprediction.AppPredictionManagerService"

.field private static final AUTO_FILL_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.autofill.AutofillManagerService"

.field private static final BACKUP_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.backup.BackupManagerService$Lifecycle"

.field private static final BLOB_STORE_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.blob.BlobStoreManagerService"

.field private static final BLOCK_MAP_FILE:Ljava/lang/String; = "/cache/recovery/block.map"

.field private static final BLUETOOTH_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.bluetooth.BluetoothService"

.field private static final CAR_SERVICE_HELPER_SERVICE_CLASS:Ljava/lang/String; = "com.android.internal.car.CarServiceHelperService"

.field private static final CLOUDSEARCH_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.cloudsearch.CloudSearchManagerService"

.field private static final COMPANION_DEVICE_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.companion.CompanionDeviceManagerService"

.field private static final CONNECTIVITY_SERVICE_APEX_PATH:Ljava/lang/String; = "/apex/com.android.tethering/javalib/service-connectivity.jar"

.field private static final CONNECTIVITY_SERVICE_INITIALIZER_CLASS:Ljava/lang/String; = "com.android.server.ConnectivityServiceInitializer"

.field private static final CONTENT_CAPTURE_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.contentcapture.ContentCaptureManagerService"

.field private static final CONTENT_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.content.ContentService$Lifecycle"

.field private static final CONTENT_SUGGESTIONS_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.contentsuggestions.ContentSuggestionsManagerService"

.field private static final DEFAULT_SYSTEM_THEME:I = 0x103040c

.field private static final DEVICE_IDLE_CONTROLLER_CLASS:Ljava/lang/String; = "com.android.server.DeviceIdleController"

.field private static final ENCRYPTED_STATE:Ljava/lang/String; = "1"

.field private static final ENCRYPTING_STATE:Ljava/lang/String; = "trigger_restart_min_framework"

.field private static final GAME_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.app.GameManagerService$Lifecycle"

.field private static final GNSS_TIME_UPDATE_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.timedetector.GnssTimeUpdateService$Lifecycle"

.field private static final HEALTH_SERVICE_CLASS:Ljava/lang/String; = "com.google.android.clockwork.healthservices.HealthService"

.field private static final HEAP_DUMP_PATH:Ljava/io/File;

.field private static final IOT_SERVICE_CLASS:Ljava/lang/String; = "com.android.things.server.IoTSystemService"

.field private static final IP_CONNECTIVITY_METRICS_CLASS:Ljava/lang/String; = "com.android.server.connectivity.IpConnectivityMetrics"

.field private static final ISOLATED_COMPILATION_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.compos.IsolatedCompilationService"

.field private static final JOB_SCHEDULER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.job.JobSchedulerService"

.field private static final LOCATION_TIME_ZONE_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.timezonedetector.location.LocationTimeZoneManagerService$Lifecycle"

.field private static final LOCK_SETTINGS_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.locksettings.LockSettingsService$Lifecycle"

.field private static final LOWPAN_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.lowpan.LowpanService"

.field private static final MAX_HEAP_DUMPS:I = 0x2

.field private static final MEDIA_COMMUNICATION_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.media.MediaCommunicationService"

.field private static final MEDIA_RESOURCE_MONITOR_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.media.MediaResourceMonitorService"

.field private static final MEDIA_SESSION_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.media.MediaSessionService"

.field private static final MIDI_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.midi.MidiService$Lifecycle"

.field private static final MUSIC_RECOGNITION_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.musicrecognition.MusicRecognitionManagerService"

.field private static final NETWORK_STATS_SERVICE_INITIALIZER_CLASS:Ljava/lang/String; = "com.android.server.NetworkStatsServiceInitializer"

.field private static final PERSISTENT_DATA_BLOCK_PROP:Ljava/lang/String; = "ro.frp.pst"

.field private static final PRINT_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.print.PrintManagerService"

.field private static final REBOOT_READINESS_LIFECYCLE_CLASS:Ljava/lang/String; = "com.android.server.scheduling.RebootReadinessManagerService$Lifecycle"

.field private static final RESOURCE_ECONOMY_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.tare.InternalResourceService"

.field private static final ROLE_SERVICE_CLASS:Ljava/lang/String; = "com.android.role.RoleService"

.field private static final ROLLBACK_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.rollback.RollbackManagerService"

.field private static final SAFETY_CENTER_SERVICE_CLASS:Ljava/lang/String; = "com.android.safetycenter.SafetyCenterService"

.field private static final SCHEDULING_APEX_PATH:Ljava/lang/String; = "/apex/com.android.scheduling/javalib/service-scheduling.jar"

.field private static final SDK_SANDBOX_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.sdksandbox.SdkSandboxManagerService$Lifecycle"

.field private static final SEARCH_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.search.SearchManagerService$Lifecycle"

.field private static final SEARCH_UI_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.searchui.SearchUiManagerService"

.field private static final SLICE_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.slice.SliceManagerService$Lifecycle"

.field private static final SLOW_DELIVERY_THRESHOLD_MS:J = 0xc8L

.field private static final SLOW_DISPATCH_THRESHOLD_MS:J = 0x64L

.field private static final SMARTSPACE_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.smartspace.SmartspaceManagerService"

.field private static final SPEECH_RECOGNITION_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.speech.SpeechRecognitionManagerService"

.field private static final START_BLOB_STORE_SERVICE:Ljava/lang/String; = "startBlobStoreManagerService"

.field private static final START_HIDL_SERVICES:Ljava/lang/String; = "StartHidlServices"

.field private static final STATS_BOOTSTRAP_ATOM_SERVICE_LIFECYCLE_CLASS:Ljava/lang/String; = "com.android.server.stats.bootstrap.StatsBootstrapAtomService$Lifecycle"

.field private static final STATS_COMPANION_APEX_PATH:Ljava/lang/String; = "/apex/com.android.os.statsd/javalib/service-statsd.jar"

.field private static final STATS_COMPANION_LIFECYCLE_CLASS:Ljava/lang/String; = "com.android.server.stats.StatsCompanion$Lifecycle"

.field private static final STATS_PULL_ATOM_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.stats.pull.StatsPullAtomService"

.field private static final STORAGE_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.StorageManagerService$Lifecycle"

.field private static final STORAGE_STATS_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.usage.StorageStatsService$Lifecycle"

.field private static final SYSPROP_FDTRACK_ABORT_THRESHOLD:Ljava/lang/String; = "persist.sys.debug.fdtrack_abort_threshold"

.field private static final SYSPROP_FDTRACK_ENABLE_THRESHOLD:Ljava/lang/String; = "persist.sys.debug.fdtrack_enable_threshold"

.field private static final SYSPROP_FDTRACK_INTERVAL:Ljava/lang/String; = "persist.sys.debug.fdtrack_interval"

.field private static final SYSPROP_START_COUNT:Ljava/lang/String; = "sys.system_server.start_count"

.field private static final SYSPROP_START_ELAPSED:Ljava/lang/String; = "sys.system_server.start_elapsed"

.field private static final SYSPROP_START_UPTIME:Ljava/lang/String; = "sys.system_server.start_uptime"

.field private static final SYSTEM_CAPTIONS_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.systemcaptions.SystemCaptionsManagerService"

.field private static final TAG:Ljava/lang/String; = "SystemServer"

.field private static final TARGET_CARRIER:Ljava/lang/String;

.field private static final TARGET_COUNTRY:Ljava/lang/String;

.field private static final TETHERING_CONNECTOR_CLASS:Ljava/lang/String; = "android.net.ITetheringConnector"

.field private static final TEXT_TO_SPEECH_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.texttospeech.TextToSpeechManagerService"

.field private static final THERMAL_OBSERVER_CLASS:Ljava/lang/String; = "com.google.android.clockwork.ThermalObserver"

.field private static final TIME_DETECTOR_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.timedetector.TimeDetectorService$Lifecycle"

.field private static final TIME_ZONE_DETECTOR_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.timezonedetector.TimeZoneDetectorService$Lifecycle"

.field private static final TIME_ZONE_RULES_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.timezone.RulesManagerService$Lifecycle"

.field private static final TRANSLATION_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.translation.TranslationManagerService"

.field private static final UNCRYPT_PACKAGE_FILE:Ljava/lang/String; = "/cache/recovery/uncrypt_file"

.field private static final USB_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.usb.UsbService$Lifecycle"

.field private static final UWB_APEX_SERVICE_JAR_PATH:Ljava/lang/String; = "/apex/com.android.uwb/javalib/service-uwb.jar"

.field private static final UWB_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.uwb.UwbService"

.field private static final VIRTUAL_DEVICE_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.companion.virtual.VirtualDeviceManagerService"

.field private static final VOICE_RECOGNITION_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.voiceinteraction.VoiceInteractionManagerService"

.field private static final WALLPAPER_EFFECTS_GENERATION_MANAGER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.wallpapereffectsgeneration.WallpaperEffectsGenerationManagerService"

.field private static final WALLPAPER_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.wallpaper.WallpaperManagerService$Lifecycle"

.field private static final WEAR_CONNECTIVITY_SERVICE_CLASS:Ljava/lang/String; = "com.android.clockwork.connectivity.WearConnectivityService"

.field private static final WEAR_DISPLAYOFFLOAD_SERVICE_CLASS:Ljava/lang/String; = "com.google.android.clockwork.displayoffload.DisplayOffloadService"

.field private static final WEAR_DISPLAY_SERVICE_CLASS:Ljava/lang/String; = "com.google.android.clockwork.display.WearDisplayService"

.field private static final WEAR_GLOBAL_ACTIONS_SERVICE_CLASS:Ljava/lang/String; = "com.android.clockwork.globalactions.GlobalActionsService"

.field private static final WEAR_LEFTY_SERVICE_CLASS:Ljava/lang/String; = "com.google.android.clockwork.lefty.WearLeftyService"

.field private static final WEAR_POWER_SERVICE_CLASS:Ljava/lang/String; = "com.android.clockwork.power.WearPowerService"

.field private static final WEAR_SIDEKICK_SERVICE_CLASS:Ljava/lang/String; = "com.google.android.clockwork.sidekick.SidekickService"

.field private static final WEAR_TIME_SERVICE_CLASS:Ljava/lang/String; = "com.google.android.clockwork.time.WearTimeService"

.field private static final WIFI_APEX_SERVICE_JAR_PATH:Ljava/lang/String; = "/apex/com.android.wifi/javalib/service-wifi.jar"

.field private static final WIFI_AWARE_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.wifi.aware.WifiAwareService"

.field private static final WIFI_P2P_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.wifi.p2p.WifiP2pService"

.field private static final WIFI_RTT_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.wifi.rtt.RttService"

.field private static final WIFI_SCANNING_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.wifi.scanner.WifiScanningService"

.field private static final WIFI_SERVICE_CLASS:Ljava/lang/String; = "com.android.server.wifi.WifiService"

.field private static final sMaxBinderThreads:I = 0x1f

.field private static sPendingWtfs:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Landroid/app/ApplicationErrorReport$CrashInfo;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

.field private mContentResolver:Landroid/content/ContentResolver;

.field private mDataLoaderManagerService:Lcom/android/server/pm/DataLoaderManagerService;

.field private mDisplayManagerService:Lcom/android/server/display/DisplayManagerService;

.field private final mDumper:Lcom/android/server/SystemServer$SystemServerDumper;

.field private mEntropyMixer:Lcom/android/server/EntropyMixer;

.field private final mFactoryTestMode:I

.field private mFirstBoot:Z

.field private mIncrementalServiceHandle:J

.field private mOnlyCore:Z

.field private mPackageManager:Landroid/content/pm/PackageManager;

.field private mPackageManagerService:Lcom/android/server/pm/PackageManagerService;

.field private mPowerManagerService:Lcom/android/server/power/PowerManagerService;

.field private mProfilerSnapshotTimer:Ljava/util/Timer;

.field private final mRuntimeRestart:Z

.field private final mRuntimeStartElapsedTime:J

.field private final mRuntimeStartUptime:J

.field private final mStartCount:I

.field private mSystemContext:Landroid/content/Context;

.field private mSystemServiceManager:Lcom/android/server/SystemServiceManager;

.field private mWebViewUpdateService:Lcom/android/server/webkit/WebViewUpdateService;

.field private mWindowManagerGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

.field private mZygotePreload:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$8zxOYx-QEMffbYJtoGp6Ub2KG-8(Landroid/os/IBinder;Ljava/lang/String;ZLandroid/app/ApplicationErrorReport$ParcelableCrashInfo;I)Z
    .registers 5

    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/server/SystemServer;->handleEarlySystemWtf(Landroid/os/IBinder;Ljava/lang/String;ZLandroid/app/ApplicationErrorReport$ParcelableCrashInfo;I)Z

    move-result p0

    return p0
.end method

.method static constructor <clinit>()V
    .registers 2

    .line 465
    sget-object v0, Lcom/lge/os/Build$CA_TARGET;->OPERATOR:Ljava/lang/String;

    sput-object v0, Lcom/android/server/SystemServer;->TARGET_CARRIER:Ljava/lang/String;

    .line 466
    sget-object v0, Lcom/lge/os/Build$CA_TARGET;->COUNTRY:Ljava/lang/String;

    sput-object v0, Lcom/android/server/SystemServer;->TARGET_COUNTRY:Ljava/lang/String;

    .line 570
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/system/heapdump/"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/server/SystemServer;->HEAP_DUMP_PATH:Ljava/io/File;

    return-void
.end method

.method public constructor <init>()V
    .registers 10

    .line 688
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 497
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/server/SystemServer;->mIncrementalServiceHandle:J

    .line 515
    new-instance v0, Lcom/android/server/SystemServer$SystemServerDumper;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/server/SystemServer$SystemServerDumper;-><init>(Lcom/android/server/SystemServer;Lcom/android/server/SystemServer$SystemServerDumper-IA;)V

    iput-object v0, p0, Lcom/android/server/SystemServer;->mDumper:Lcom/android/server/SystemServer$SystemServerDumper;

    .line 690
    invoke-static {}, Landroid/os/FactoryTest;->getMode()I

    move-result v0

    iput v0, p0, Lcom/android/server/SystemServer;->mFactoryTestMode:I

    .line 695
    const-string/jumbo v0, "sys.system_server.start_count"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/server/SystemServer;->mStartCount:I

    .line 696
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/android/server/SystemServer;->mRuntimeStartElapsedTime:J

    .line 697
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    iput-wide v7, p0, Lcom/android/server/SystemServer;->mRuntimeStartUptime:J

    .line 698
    move-wide v1, v5

    move-wide v3, v7

    invoke-static/range {v1 .. v8}, Landroid/os/Process;->setStartTimes(JJJJ)V

    .line 705
    const-string/jumbo v0, "sys.boot_completed"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/SystemServer;->mRuntimeRestart:Z

    .line 706
    return-void
.end method

.method private createSystemContext()V
    .registers 4

    .line 1074
    invoke-static {}, Landroid/app/ActivityThread;->systemMain()Landroid/app/ActivityThread;

    move-result-object v0

    .line 1075
    .local v0, "activityThread":Landroid/app/ActivityThread;
    invoke-virtual {v0}, Landroid/app/ActivityThread;->getSystemContext()Landroid/app/ContextImpl;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    .line 1076
    const v2, 0x103040c

    invoke-virtual {v1, v2}, Landroid/content/Context;->setTheme(I)V

    .line 1078
    invoke-virtual {v0}, Landroid/app/ActivityThread;->getSystemUiContext()Landroid/app/ContextImpl;

    move-result-object v1

    .line 1079
    .local v1, "systemUiContext":Landroid/content/Context;
    invoke-virtual {v1, v2}, Landroid/content/Context;->setTheme(I)V

    .line 1080
    return-void
.end method

.method private deviceHasConfigString(Landroid/content/Context;I)Z
    .registers 5
    .param p1, "context"  # Landroid/content/Context;
    .param p2, "resId"  # I

    .line 3347
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 3348
    .local v0, "serviceName":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    return v1
.end method

.method private static dumpHprof()V
    .registers 7

    .line 582
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    .line 583
    .local v0, "existingTombstones":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/io/File;>;"
    sget-object v1, Lcom/android/server/SystemServer;->HEAP_DUMP_PATH:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_d
    if-ge v3, v2, :cond_2b

    aget-object v4, v1, v3

    .line 584
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v5

    if-nez v5, :cond_18

    .line 585
    goto :goto_28

    .line 587
    :cond_18
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "fdtrack-"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_25

    .line 588
    goto :goto_28

    .line 590
    :cond_25
    invoke-virtual {v0, v4}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 583
    .end local v4  # "file":Ljava/io/File;
    :goto_28
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 592
    :cond_2b
    invoke-virtual {v0}, Ljava/util/TreeSet;->size()I

    move-result v1

    const/4 v2, 0x2

    const-string v3, "System"

    if-lt v1, v2, :cond_6b

    .line 593
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_35
    const/4 v2, 0x1

    if-ge v1, v2, :cond_3e

    .line 595
    invoke-virtual {v0}, Ljava/util/TreeSet;->pollLast()Ljava/lang/Object;

    .line 593
    add-int/lit8 v1, v1, 0x1

    goto :goto_35

    .line 597
    .end local v1  # "i":I
    :cond_3e
    invoke-virtual {v0}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_42
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 598
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v4

    if-nez v4, :cond_6a

    .line 599
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to clean up hprof "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 601
    .end local v2  # "file":Ljava/io/File;
    :cond_6a
    goto :goto_42

    .line 605
    :cond_6b
    :try_start_6b
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyy-MM-dd-HH-mm-ss"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 606
    .local v1, "date":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/data/system/heapdump/fdtrack-"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ".hprof"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 607
    .local v2, "filename":Ljava/lang/String;
    invoke-static {v2}, Landroid/os/Debug;->dumpHprofData(Ljava/lang/String;)V
    :try_end_98
    .catch Ljava/io/IOException; {:try_start_6b .. :try_end_98} :catch_99

    .line 610
    .end local v1  # "date":Ljava/lang/String;
    .end local v2  # "filename":Ljava/lang/String;
    goto :goto_9f

    .line 608
    :catch_99
    move-exception v1

    .line 609
    .local v1, "ex":Ljava/io/IOException;
    const-string v2, "Failed to dump fdtrack hprof"

    invoke-static {v3, v2, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 611
    .end local v1  # "ex":Ljava/io/IOException;
    :goto_9f
    return-void
.end method

.method private static native fdtrackAbort()V
.end method

.method private static getMaxFd()I
    .registers 5

    .line 548
    const/4 v0, 0x0

    .line 550
    .local v0, "fd":Ljava/io/FileDescriptor;
    :try_start_1
    const-string v1, "/dev/null"

    sget v2, Landroid/system/OsConstants;->O_RDONLY:I

    sget v3, Landroid/system/OsConstants;->O_CLOEXEC:I

    or-int/2addr v2, v3

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/system/Os;->open(Ljava/lang/String;II)Ljava/io/FileDescriptor;

    move-result-object v1

    move-object v0, v1

    .line 551
    invoke-virtual {v0}, Ljava/io/FileDescriptor;->getInt$()I

    move-result v1
    :try_end_12
    .catch Landroid/system/ErrnoException; {:try_start_1 .. :try_end_12} :catch_22
    .catchall {:try_start_1 .. :try_end_12} :catchall_20

    .line 555
    if-eqz v0, :cond_1f

    .line 557
    :try_start_14
    invoke-static {v0}, Landroid/system/Os;->close(Ljava/io/FileDescriptor;)V
    :try_end_17
    .catch Landroid/system/ErrnoException; {:try_start_14 .. :try_end_17} :catch_18

    .line 561
    goto :goto_1f

    .line 558
    :catch_18
    move-exception v1

    .line 560
    .local v1, "ex":Landroid/system/ErrnoException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 551
    .end local v1  # "ex":Landroid/system/ErrnoException;
    :cond_1f
    :goto_1f
    return v1

    .line 555
    :catchall_20
    move-exception v1

    goto :goto_4d

    .line 552
    :catch_22
    move-exception v1

    .line 553
    .restart local v1  # "ex":Landroid/system/ErrnoException;
    :try_start_23
    const-string v2, "System"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to get maximum fd: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3b
    .catchall {:try_start_23 .. :try_end_3b} :catchall_20

    .line 555
    nop

    .end local v1  # "ex":Landroid/system/ErrnoException;
    if-eqz v0, :cond_49

    .line 557
    :try_start_3e
    invoke-static {v0}, Landroid/system/Os;->close(Ljava/io/FileDescriptor;)V
    :try_end_41
    .catch Landroid/system/ErrnoException; {:try_start_3e .. :try_end_41} :catch_42

    .line 561
    goto :goto_49

    .line 558
    :catch_42
    move-exception v1

    .line 560
    .restart local v1  # "ex":Landroid/system/ErrnoException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 565
    .end local v1  # "ex":Landroid/system/ErrnoException;
    :cond_49
    :goto_49
    const v1, 0x7fffffff

    return v1

    .line 555
    :goto_4d
    if-eqz v0, :cond_5a

    .line 557
    :try_start_4f
    invoke-static {v0}, Landroid/system/Os;->close(Ljava/io/FileDescriptor;)V
    :try_end_52
    .catch Landroid/system/ErrnoException; {:try_start_4f .. :try_end_52} :catch_53

    .line 561
    goto :goto_5a

    .line 558
    :catch_53
    move-exception v1

    .line 560
    .restart local v1  # "ex":Landroid/system/ErrnoException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 563
    .end local v1  # "ex":Landroid/system/ErrnoException;
    :cond_5a
    :goto_5a
    throw v1
.end method

.method private static handleEarlySystemWtf(Landroid/os/IBinder;Ljava/lang/String;ZLandroid/app/ApplicationErrorReport$ParcelableCrashInfo;I)Z
    .registers 13
    .param p0, "app"  # Landroid/os/IBinder;
    .param p1, "tag"  # Ljava/lang/String;
    .param p2, "system"  # Z
    .param p3, "crashInfo"  # Landroid/app/ApplicationErrorReport$ParcelableCrashInfo;
    .param p4, "immediateCallerPid"  # I

    .line 3464
    const-string/jumbo v0, "system_server"

    .line 3465
    .local v0, "processName":Ljava/lang/String;
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v7

    .line 3467
    .local v7, "myPid":I
    const/16 v1, 0x3e8

    invoke-static {v1}, Landroid/os/UserHandle;->getUserId(I)I

    move-result v1

    const-string/jumbo v3, "system_server"

    iget-object v6, p3, Landroid/app/ApplicationErrorReport$ParcelableCrashInfo;->exceptionMessage:Ljava/lang/String;

    const/4 v4, -0x1

    move v2, v7

    move-object v5, p1

    invoke-static/range {v1 .. v6}, Lcom/android/server/am/EventLogTags;->writeAmWtf(IILjava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 3470
    const-string/jumbo v4, "system_server"

    const/16 v1, 0x50

    const/16 v2, 0x3e8

    const/4 v6, 0x3

    move-object v3, p1

    move v5, v7

    invoke-static/range {v1 .. v6}, Lcom/android/internal/util/FrameworkStatsLog;->write(IILjava/lang/String;Ljava/lang/String;II)V

    .line 3473
    const-class v1, Lcom/android/server/SystemServer;

    monitor-enter v1

    .line 3474
    :try_start_28
    sget-object v2, Lcom/android/server/SystemServer;->sPendingWtfs:Ljava/util/LinkedList;

    if-nez v2, :cond_33

    .line 3475
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    sput-object v2, Lcom/android/server/SystemServer;->sPendingWtfs:Ljava/util/LinkedList;

    .line 3477
    :cond_33
    sget-object v2, Lcom/android/server/SystemServer;->sPendingWtfs:Ljava/util/LinkedList;

    new-instance v3, Landroid/util/Pair;

    invoke-direct {v3, p1, p3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 3478
    monitor-exit v1

    .line 3479
    const/4 v1, 0x0

    return v1

    .line 3478
    :catchall_40
    move-exception v2

    monitor-exit v1
    :try_end_42
    .catchall {:try_start_28 .. :try_end_42} :catchall_40

    throw v2
.end method

.method private static native initZygoteChildHeapProfiling()V
.end method

.method private isFirstBootOrUpgrade()Z
    .registers 2

    .line 1011
    iget-object v0, p0, Lcom/android/server/SystemServer;->mPackageManagerService:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v0}, Lcom/android/server/pm/PackageManagerService;->isFirstBoot()Z

    move-result v0

    if-nez v0, :cond_13

    iget-object v0, p0, Lcom/android/server/SystemServer;->mPackageManagerService:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v0}, Lcom/android/server/pm/PackageManagerService;->isDeviceUpgrading()Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_13

    :cond_11
    const/4 v0, 0x0

    goto :goto_14

    :cond_13
    :goto_13
    const/4 v0, 0x1

    :goto_14
    return v0
.end method

.method private static isValidTimeZoneId(Ljava/lang/String;)Z
    .registers 2
    .param p0, "timezoneProperty"  # Ljava/lang/String;

    .line 1005
    if-eqz p0, :cond_14

    .line 1006
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_14

    .line 1007
    invoke-static {}, Lcom/android/i18n/timezone/ZoneInfoDb;->getInstance()Lcom/android/i18n/timezone/ZoneInfoDb;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/i18n/timezone/ZoneInfoDb;->hasTimeZone(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    .line 1005
    :goto_15
    return v0
.end method

.method static synthetic lambda$spawnFdLeakCheckThread$0(III)V
    .registers 14
    .param p0, "enableThreshold"  # I
    .param p1, "abortThreshold"  # I
    .param p2, "checkInterval"  # I

    .line 622
    const/4 v0, 0x0

    .line 623
    .local v0, "enabled":Z
    const-wide/16 v1, 0x0

    .line 626
    .local v1, "nextWrite":J
    :goto_3
    invoke-static {}, Lcom/android/server/SystemServer;->getMaxFd()I

    move-result v3

    .line 627
    .local v3, "maxFd":I
    if-le v3, p0, :cond_13

    .line 629
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 630
    invoke-static {}, Ljava/lang/System;->runFinalization()V

    .line 631
    invoke-static {}, Lcom/android/server/SystemServer;->getMaxFd()I

    move-result v3

    .line 634
    :cond_13
    const/4 v4, 0x2

    const-string v5, "System"

    const/16 v6, 0x16c

    if-le v3, p0, :cond_2b

    if-nez v0, :cond_2b

    .line 635
    const-string v7, "fdtrack enable threshold reached, enabling"

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 636
    invoke-static {v6, v4, v3}, Lcom/android/internal/util/FrameworkStatsLog;->write(III)V

    .line 640
    const-string v4, "fdtrack"

    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 641
    const/4 v0, 0x1

    goto :goto_52

    .line 642
    :cond_2b
    if-le v3, p1, :cond_3d

    .line 643
    const-string v4, "fdtrack abort threshold reached, dumping and aborting"

    invoke-static {v5, v4}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 644
    const/4 v4, 0x3

    invoke-static {v6, v4, v3}, Lcom/android/internal/util/FrameworkStatsLog;->write(III)V

    .line 648
    invoke-static {}, Lcom/android/server/SystemServer;->dumpHprof()V

    .line 649
    invoke-static {}, Lcom/android/server/SystemServer;->fdtrackAbort()V

    goto :goto_52

    .line 652
    :cond_3d
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    .line 653
    .local v7, "now":J
    cmp-long v5, v7, v1

    if-lez v5, :cond_52

    .line 654
    const-wide/32 v9, 0x36ee80

    add-long/2addr v9, v7

    .line 655
    .end local v1  # "nextWrite":J
    .local v9, "nextWrite":J
    nop

    .line 656
    if-eqz v0, :cond_4d

    goto :goto_4e

    .line 657
    :cond_4d
    const/4 v4, 0x1

    .line 655
    :goto_4e
    invoke-static {v6, v4, v3}, Lcom/android/internal/util/FrameworkStatsLog;->write(III)V

    move-wide v1, v9

    .line 663
    .end local v7  # "now":J
    .end local v9  # "nextWrite":J
    .restart local v1  # "nextWrite":J
    :cond_52
    :goto_52
    mul-int/lit16 v4, p2, 0x3e8

    int-to-long v4, v4

    :try_start_55
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_58
    .catch Ljava/lang/InterruptedException; {:try_start_55 .. :try_end_58} :catch_5a

    .line 666
    nop

    .line 667
    .end local v3  # "maxFd":I
    goto :goto_3

    .line 664
    .restart local v3  # "maxFd":I
    :catch_5a
    move-exception v4

    .line 665
    .local v4, "ex":Ljava/lang/InterruptedException;
    goto :goto_3
.end method

.method static synthetic lambda$startOtherServices$1()V
    .registers 5

    .line 1533
    const-string v0, "SecondaryZygotePreload"

    const-string v1, "SystemServer"

    :try_start_4
    invoke-static {v1, v0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1534
    invoke-static {}, Lcom/android/server/utils/TimingsTraceAndSlog;->newAsyncLog()Lcom/android/server/utils/TimingsTraceAndSlog;

    move-result-object v2

    .line 1535
    .local v2, "traceLog":Lcom/android/server/utils/TimingsTraceAndSlog;
    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1536
    sget-object v0, Landroid/os/Build;->SUPPORTED_32_BIT_ABIS:[Ljava/lang/String;

    .line 1537
    .local v0, "abis32":[Ljava/lang/String;
    array-length v3, v0

    if-lez v3, :cond_23

    sget-object v3, Landroid/os/Process;->ZYGOTE_PROCESS:Landroid/os/ZygoteProcess;

    const/4 v4, 0x0

    aget-object v4, v0, v4

    invoke-virtual {v3, v4}, Landroid/os/ZygoteProcess;->preloadDefault(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_23

    .line 1538
    const-string v3, "Unable to preload default resources for secondary"

    invoke-static {v1, v3}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1540
    :cond_23
    invoke-virtual {v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_26} :catch_27

    .line 1543
    .end local v0  # "abis32":[Ljava/lang/String;
    .end local v2  # "traceLog":Lcom/android/server/utils/TimingsTraceAndSlog;
    goto :goto_2d

    .line 1541
    :catch_27
    move-exception v0

    .line 1542
    .local v0, "ex":Ljava/lang/Exception;
    const-string v2, "Exception preloading default resources"

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1544
    .end local v0  # "ex":Ljava/lang/Exception;
    :goto_2d
    return-void
.end method

.method static synthetic lambda$startOtherServices$2()V
    .registers 2

    .line 1704
    invoke-static {}, Lcom/android/server/utils/TimingsTraceAndSlog;->newAsyncLog()Lcom/android/server/utils/TimingsTraceAndSlog;

    move-result-object v0

    .line 1705
    .local v0, "traceLog":Lcom/android/server/utils/TimingsTraceAndSlog;
    const-string v1, "StartHidlServices"

    invoke-virtual {v0, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1706
    invoke-static {}, Lcom/android/server/SystemServer;->startHidlServices()V

    .line 1707
    invoke-virtual {v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1708
    return-void
.end method

.method static synthetic lambda$startOtherServices$4(Landroid/os/IBinder;)V
    .registers 4
    .param p0, "service"  # Landroid/os/IBinder;

    .line 3210
    const-string/jumbo v0, "tethering"

    const/4 v1, 0x0

    const/4 v2, 0x6

    invoke-static {v0, p0, v1, v2}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;ZI)V

    .line 3213
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 2
    .param p0, "args"  # [Ljava/lang/String;

    .line 685
    new-instance v0, Lcom/android/server/SystemServer;

    invoke-direct {v0}, Lcom/android/server/SystemServer;-><init>()V

    invoke-direct {v0}, Lcom/android/server/SystemServer;->run()V

    .line 686
    return-void
.end method

.method private performPendingShutdown()V
    .registers 10

    .line 1020
    const-string v0, "SystemServer"

    const-string/jumbo v1, "sys.shutdown.requested"

    const-string v2, ""

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1022
    .local v1, "shutdownAction":Ljava/lang/String;
    if-eqz v1, :cond_8a

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_8a

    .line 1023
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x31

    const/4 v5, 0x1

    if-ne v3, v4, :cond_1f

    move v3, v5

    goto :goto_20

    :cond_1f
    move v3, v2

    .line 1026
    .local v3, "reboot":Z
    :goto_20
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v5, :cond_2f

    .line 1027
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .local v4, "reason":Ljava/lang/String;
    goto :goto_30

    .line 1029
    .end local v4  # "reason":Ljava/lang/String;
    :cond_2f
    const/4 v4, 0x0

    .line 1037
    .restart local v4  # "reason":Ljava/lang/String;
    :goto_30
    if-eqz v4, :cond_73

    const-string/jumbo v6, "recovery-update"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_73

    .line 1038
    new-instance v6, Ljava/io/File;

    const-string v7, "/cache/recovery/uncrypt_file"

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1039
    .local v6, "packageFile":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_73

    .line 1040
    const/4 v7, 0x0

    .line 1042
    .local v7, "filename":Ljava/lang/String;
    const/4 v8, 0x0

    :try_start_4a
    invoke-static {v6, v2, v8}, Landroid/os/FileUtils;->readTextFile(Ljava/io/File;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_4e
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_4e} :catch_50

    move-object v7, v2

    .line 1045
    goto :goto_56

    .line 1043
    :catch_50
    move-exception v2

    .line 1044
    .local v2, "e":Ljava/io/IOException;
    const-string v8, "Error reading uncrypt package file"

    invoke-static {v0, v8, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1047
    .end local v2  # "e":Ljava/io/IOException;
    :goto_56
    if-eqz v7, :cond_73

    const-string v2, "/data"

    invoke-virtual {v7, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_73

    .line 1048
    new-instance v2, Ljava/io/File;

    const-string v8, "/cache/recovery/block.map"

    invoke-direct {v2, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_73

    .line 1049
    const-string v2, "Can\'t find block map file, uncrypt failed or unexpected runtime restart?"

    invoke-static {v0, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1051
    return-void

    .line 1056
    .end local v6  # "packageFile":Ljava/io/File;
    .end local v7  # "filename":Ljava/lang/String;
    :cond_73
    new-instance v0, Lcom/android/server/SystemServer$1;

    invoke-direct {v0, p0, v3, v4}, Lcom/android/server/SystemServer$1;-><init>(Lcom/android/server/SystemServer;ZLjava/lang/String;)V

    .line 1066
    .local v0, "runnable":Ljava/lang/Runnable;
    invoke-static {}, Lcom/android/server/UiThread;->getHandler()Landroid/os/Handler;

    move-result-object v2

    invoke-static {v2, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;Ljava/lang/Runnable;)Landroid/os/Message;

    move-result-object v2

    .line 1067
    .local v2, "msg":Landroid/os/Message;
    invoke-virtual {v2, v5}, Landroid/os/Message;->setAsynchronous(Z)V

    .line 1068
    invoke-static {}, Lcom/android/server/UiThread;->getHandler()Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1071
    .end local v0  # "runnable":Ljava/lang/Runnable;
    .end local v2  # "msg":Landroid/os/Message;
    .end local v3  # "reboot":Z
    .end local v4  # "reason":Ljava/lang/String;
    :cond_8a
    return-void
.end method

.method private reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 6
    .param p1, "msg"  # Ljava/lang/String;
    .param p2, "e"  # Ljava/lang/Throwable;

    .line 1015
    const-string v0, "SystemServer"

    const-string v1, "***********************************************"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1016
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BOOT FAILURE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1017
    return-void
.end method

.method private run()V
    .registers 16

    .line 798
    const-string/jumbo v0, "persist.sys.language"

    const-string/jumbo v1, "persist.sys.timezone"

    const-string v2, ""

    new-instance v3, Lcom/android/server/utils/TimingsTraceAndSlog;

    invoke-direct {v3}, Lcom/android/server/utils/TimingsTraceAndSlog;-><init>()V

    .line 800
    .local v3, "t":Lcom/android/server/utils/TimingsTraceAndSlog;
    :try_start_d
    const-string v4, "InitBeforeStartServices"

    invoke-virtual {v3, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 803
    const-string/jumbo v4, "sys.system_server.start_count"

    iget v5, p0, Lcom/android/server/SystemServer;->mStartCount:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 804
    const-string/jumbo v4, "sys.system_server.start_elapsed"

    iget-wide v5, p0, Lcom/android/server/SystemServer;->mRuntimeStartElapsedTime:J

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 805
    const-string/jumbo v4, "sys.system_server.start_uptime"

    iget-wide v5, p0, Lcom/android/server/SystemServer;->mRuntimeStartUptime:J

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 807
    const/16 v4, 0xbc3

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    iget v6, p0, Lcom/android/server/SystemServer;->mStartCount:I

    .line 808
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    iget-wide v8, p0, Lcom/android/server/SystemServer;->mRuntimeStartUptime:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const/4 v8, 0x1

    aput-object v6, v5, v8

    const/4 v6, 0x2

    iget-wide v9, p0, Lcom/android/server/SystemServer;->mRuntimeStartElapsedTime:J

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v5, v6

    .line 807
    invoke-static {v4, v5}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 813
    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 814
    .local v4, "timezoneProperty":Ljava/lang/String;
    invoke-static {v4}, Lcom/android/server/SystemServer;->isValidTimeZoneId(Ljava/lang/String;)Z

    move-result v5
    :try_end_61
    .catchall {:try_start_d .. :try_end_61} :catchall_223

    const-string v6, "SystemServer"

    if-nez v5, :cond_87

    .line 815
    :try_start_65
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "persist.sys.timezone is not valid ("

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "); setting to GMT."

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 817
    const-string v5, "GMT"

    invoke-static {v1, v5}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 828
    :cond_87
    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_ae

    .line 829
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->toLanguageTag()Ljava/lang/String;

    move-result-object v1

    .line 831
    .local v1, "languageTag":Ljava/lang/String;
    const-string/jumbo v5, "persist.sys.locale"

    invoke-static {v5, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 832
    invoke-static {v0, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 833
    const-string/jumbo v0, "persist.sys.country"

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 834
    const-string/jumbo v0, "persist.sys.localevar"

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 838
    .end local v1  # "languageTag":Ljava/lang/String;
    :cond_ae
    invoke-static {v8}, Landroid/os/Binder;->setWarnOnBlocking(Z)V

    .line 840
    invoke-static {}, Landroid/content/pm/PackageItemInfo;->forceSafeLabels()V

    .line 843
    const-string v0, "FULL"

    sput-object v0, Landroid/database/sqlite/SQLiteGlobal;->sDefaultSyncMode:Ljava/lang/String;

    .line 846
    const/4 v0, 0x0

    invoke-static {v0}, Landroid/database/sqlite/SQLiteCompatibilityWalFlags;->init(Ljava/lang/String;)V

    .line 849
    const-string v1, "Entered the Android system server!"

    invoke-static {v6, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 850
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 851
    .local v1, "uptimeMillis":J
    const/16 v5, 0xbc2

    invoke-static {v5, v1, v2}, Landroid/util/EventLog;->writeEvent(IJ)I

    .line 852
    iget-boolean v5, p0, Lcom/android/server/SystemServer;->mRuntimeRestart:Z

    const/16 v6, 0xf0

    if-nez v5, :cond_d5

    .line 853
    const/16 v5, 0x13

    invoke-static {v6, v5, v1, v2}, Lcom/android/internal/util/FrameworkStatsLog;->write(IIJ)V

    .line 866
    :cond_d5
    const-string/jumbo v5, "persist.sys.dalvik.vm.lib.2"

    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v9

    invoke-virtual {v9}, Ldalvik/system/VMRuntime;->vmLibrary()Ljava/lang/String;

    move-result-object v9

    invoke-static {v5, v9}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 869
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v5

    invoke-virtual {v5}, Ldalvik/system/VMRuntime;->clearGrowthLimit()V

    .line 873
    invoke-static {}, Landroid/os/Build;->ensureFingerprintProperty()V

    .line 877
    invoke-static {v8}, Landroid/os/Environment;->setUserRequired(Z)V

    .line 881
    invoke-static {v8}, Landroid/os/BaseBundle;->setShouldDefuse(Z)V

    .line 884
    invoke-static {v8}, Landroid/os/Parcel;->setStackTraceParceling(Z)V

    .line 887
    invoke-static {v8}, Lcom/android/internal/os/BinderInternal;->disableBackgroundScheduling(Z)V

    .line 890
    const/16 v5, 0x1f

    invoke-static {v5}, Lcom/android/internal/os/BinderInternal;->setMaxThreads(I)V

    .line 893
    const/4 v5, -0x2

    invoke-static {v5}, Landroid/os/Process;->setThreadPriority(I)V

    .line 895
    invoke-static {v7}, Landroid/os/Process;->setCanSelfBackground(Z)V

    .line 896
    invoke-static {}, Landroid/os/Looper;->prepareMainLooper()V

    .line 897
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    const-wide/16 v9, 0x64

    const-wide/16 v11, 0xc8

    invoke-virtual {v5, v9, v10, v11, v12}, Landroid/os/Looper;->setSlowLogThresholdMs(JJ)V

    .line 900
    sput-boolean v8, Landroid/app/SystemServiceRegistry;->sEnableServiceNotFoundWtf:Z

    .line 903
    const-string v5, "android_servers"

    invoke-static {v5}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 906
    invoke-static {}, Lcom/android/server/SystemServer;->initZygoteChildHeapProfiling()V

    .line 909
    sget-boolean v5, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v5, :cond_124

    .line 910
    invoke-static {}, Lcom/android/server/SystemServer;->spawnFdLeakCheckThread()V

    .line 915
    :cond_124
    invoke-direct {p0}, Lcom/android/server/SystemServer;->performPendingShutdown()V

    .line 918
    invoke-direct {p0}, Lcom/android/server/SystemServer;->createSystemContext()V

    .line 921
    invoke-static {}, Landroid/app/ActivityThread;->initializeMainlineModules()V

    .line 924
    const-string/jumbo v5, "system_server_dumper"

    iget-object v8, p0, Lcom/android/server/SystemServer;->mDumper:Lcom/android/server/SystemServer$SystemServerDumper;

    invoke-static {v5, v8}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 925
    iget-object v5, p0, Lcom/android/server/SystemServer;->mDumper:Lcom/android/server/SystemServer$SystemServerDumper;

    invoke-static {v5, p0}, Lcom/android/server/SystemServer$SystemServerDumper;->-$$Nest$maddDumpable(Lcom/android/server/SystemServer$SystemServerDumper;Landroid/util/Dumpable;)V

    .line 928
    new-instance v8, Lcom/android/server/SystemServiceManager;

    iget-object v5, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-direct {v8, v5}, Lcom/android/server/SystemServiceManager;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    .line 929
    iget-boolean v9, p0, Lcom/android/server/SystemServer;->mRuntimeRestart:Z

    iget-wide v10, p0, Lcom/android/server/SystemServer;->mRuntimeStartElapsedTime:J

    iget-wide v12, p0, Lcom/android/server/SystemServer;->mRuntimeStartUptime:J

    invoke-virtual/range {v8 .. v13}, Lcom/android/server/SystemServiceManager;->setStartInfo(ZJJ)V

    .line 931
    iget-object v5, p0, Lcom/android/server/SystemServer;->mDumper:Lcom/android/server/SystemServer$SystemServerDumper;

    iget-object v8, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    invoke-static {v5, v8}, Lcom/android/server/SystemServer$SystemServerDumper;->-$$Nest$maddDumpable(Lcom/android/server/SystemServer$SystemServerDumper;Landroid/util/Dumpable;)V

    .line 933
    const-class v5, Lcom/android/server/SystemServiceManager;

    iget-object v8, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    invoke-static {v5, v8}, Lcom/android/server/LocalServices;->addService(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 935
    invoke-static {}, Lcom/android/server/SystemServerInitThreadPool;->start()Lcom/android/server/SystemServerInitThreadPool;

    move-result-object v5

    .line 936
    .local v5, "tp":Lcom/android/server/SystemServerInitThreadPool;
    iget-object v8, p0, Lcom/android/server/SystemServer;->mDumper:Lcom/android/server/SystemServer$SystemServerDumper;

    invoke-static {v8, v5}, Lcom/android/server/SystemServer$SystemServerDumper;->-$$Nest$maddDumpable(Lcom/android/server/SystemServer$SystemServerDumper;Landroid/util/Dumpable;)V

    .line 942
    invoke-static {}, Landroid/graphics/Typeface;->loadPreinstalledSystemFontMap()V

    .line 946
    sget-boolean v8, Landroid/os/Build;->IS_DEBUGGABLE:Z
    :try_end_168
    .catchall {:try_start_65 .. :try_end_168} :catchall_223

    const-string v9, "System"

    if-eqz v8, :cond_1ad

    .line 948
    :try_start_16c
    const-string/jumbo v8, "persist.sys.dalvik.jvmtiagent"

    invoke-static {v8}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 949
    .local v8, "jvmtiAgent":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_1ad

    .line 950
    const/16 v10, 0x3d

    invoke-virtual {v8, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    .line 951
    .local v10, "equalIndex":I
    invoke-virtual {v8, v7, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 952
    .local v7, "libraryPath":Ljava/lang/String;
    add-int/lit8 v11, v10, 0x1

    .line 953
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v12

    invoke-virtual {v8, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11
    :try_end_18d
    .catchall {:try_start_16c .. :try_end_18d} :catchall_223

    .line 956
    .local v11, "parameterList":Ljava/lang/String;
    :try_start_18d
    invoke-static {v7, v11, v0}, Landroid/os/Debug;->attachJvmtiAgent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V
    :try_end_190
    .catch Ljava/lang/Exception; {:try_start_18d .. :try_end_190} :catch_191
    .catchall {:try_start_18d .. :try_end_190} :catchall_223

    .line 960
    goto :goto_1ad

    .line 957
    :catch_191
    move-exception v12

    .line 958
    .local v12, "e":Ljava/lang/Exception;
    :try_start_192
    const-string v13, "*************************************************"

    invoke-static {v9, v13}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 959
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "********** Failed to load jvmti plugin: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v9, v13}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1ad
    .catchall {:try_start_192 .. :try_end_1ad} :catchall_223

    .line 964
    .end local v1  # "uptimeMillis":J
    .end local v4  # "timezoneProperty":Ljava/lang/String;
    .end local v5  # "tp":Lcom/android/server/SystemServerInitThreadPool;
    .end local v7  # "libraryPath":Ljava/lang/String;
    .end local v8  # "jvmtiAgent":Ljava/lang/String;
    .end local v10  # "equalIndex":I
    .end local v11  # "parameterList":Ljava/lang/String;
    .end local v12  # "e":Ljava/lang/Exception;
    :cond_1ad
    :goto_1ad
    invoke-virtual {v3}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 965
    nop

    .line 968
    new-instance v1, Lcom/android/server/SystemServer$$ExternalSyntheticLambda4;

    invoke-direct {v1}, Lcom/android/server/SystemServer$$ExternalSyntheticLambda4;-><init>()V

    invoke-static {v1}, Lcom/android/internal/os/RuntimeInit;->setDefaultApplicationWtfHandler(Lcom/android/internal/os/RuntimeInit$ApplicationWtfHandler;)V

    .line 972
    :try_start_1b9
    const-string v1, "StartServices"

    invoke-virtual {v3, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 973
    invoke-direct {p0, v3}, Lcom/android/server/SystemServer;->startBootstrapServices(Lcom/android/server/utils/TimingsTraceAndSlog;)V

    .line 974
    invoke-direct {p0, v3}, Lcom/android/server/SystemServer;->startCoreServices(Lcom/android/server/utils/TimingsTraceAndSlog;)V

    .line 975
    invoke-direct {p0, v3}, Lcom/android/server/SystemServer;->startOtherServices(Lcom/android/server/utils/TimingsTraceAndSlog;)V

    .line 976
    invoke-direct {p0, v3}, Lcom/android/server/SystemServer;->startApexServices(Lcom/android/server/utils/TimingsTraceAndSlog;)V
    :try_end_1ca
    .catchall {:try_start_1b9 .. :try_end_1ca} :catchall_211

    .line 982
    invoke-virtual {v3}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 983
    nop

    .line 985
    invoke-static {v0}, Landroid/os/StrictMode;->initVmDefaults(Landroid/content/pm/ApplicationInfo;)V

    .line 987
    iget-boolean v0, p0, Lcom/android/server/SystemServer;->mRuntimeRestart:Z

    if-nez v0, :cond_206

    invoke-direct {p0}, Lcom/android/server/SystemServer;->isFirstBootOrUpgrade()Z

    move-result v0

    if-nez v0, :cond_206

    .line 988
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 989
    .local v0, "uptimeMillis":J
    const/16 v2, 0x14

    invoke-static {v6, v2, v0, v1}, Lcom/android/internal/util/FrameworkStatsLog;->write(IIJ)V

    .line 992
    const-wide/32 v4, 0xea60

    .line 993
    .local v4, "maxUptimeMillis":J
    const-wide/32 v6, 0xea60

    cmp-long v2, v0, v6

    if-lez v2, :cond_206

    .line 994
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SystemServer init took too long. uptimeMillis="

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v6, "SystemServerTiming"

    invoke-static {v6, v2}, Landroid/util/Slog;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 1000
    .end local v0  # "uptimeMillis":J
    .end local v4  # "maxUptimeMillis":J
    :cond_206
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 1001
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Main thread loop unexpectedly exited"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 977
    :catchall_211
    move-exception v0

    .line 978
    .local v0, "ex":Ljava/lang/Throwable;
    :try_start_212
    const-string v1, "******************************************"

    invoke-static {v9, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 979
    const-string v1, "************ Failure starting system services"

    invoke-static {v9, v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 980
    nop

    .end local v3  # "t":Lcom/android/server/utils/TimingsTraceAndSlog;
    .end local p0  # "this":Lcom/android/server/SystemServer;
    throw v0
    :try_end_21e
    .catchall {:try_start_212 .. :try_end_21e} :catchall_21e

    .line 982
    .end local v0  # "ex":Ljava/lang/Throwable;
    .restart local v3  # "t":Lcom/android/server/utils/TimingsTraceAndSlog;
    .restart local p0  # "this":Lcom/android/server/SystemServer;
    :catchall_21e
    move-exception v0

    invoke-virtual {v3}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 983
    throw v0

    .line 964
    :catchall_223
    move-exception v0

    invoke-virtual {v3}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 965
    throw v0
.end method

.method private static native setIncrementalServiceSystemReady(J)V
.end method

.method private static spawnFdLeakCheckThread()V
    .registers 5

    .line 617
    const-string/jumbo v0, "persist.sys.debug.fdtrack_enable_threshold"

    const/16 v1, 0x400

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 618
    .local v0, "enableThreshold":I
    const-string/jumbo v1, "persist.sys.debug.fdtrack_abort_threshold"

    const/16 v2, 0x800

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 619
    .local v1, "abortThreshold":I
    const-string/jumbo v2, "persist.sys.debug.fdtrack_interval"

    const/16 v3, 0x78

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 621
    .local v2, "checkInterval":I
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/android/server/SystemServer$$ExternalSyntheticLambda0;

    invoke-direct {v4, v0, v1, v2}, Lcom/android/server/SystemServer$$ExternalSyntheticLambda0;-><init>(III)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 668
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 669
    return-void
.end method

.method private startAmbientContextService(Lcom/android/server/utils/TimingsTraceAndSlog;)V
    .registers 4
    .param p1, "t"  # Lcom/android/server/utils/TimingsTraceAndSlog;

    .line 3431
    const-string v0, "StartAmbientContextService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3432
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v1, Lcom/android/server/ambientcontext/AmbientContextManagerService;

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 3433
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3434
    return-void
.end method

.method private startApexServices(Lcom/android/server/utils/TimingsTraceAndSlog;)V
    .registers 9
    .param p1, "t"  # Lcom/android/server/utils/TimingsTraceAndSlog;

    .line 3324
    const-string/jumbo v0, "startApexServices"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3327
    invoke-static {}, Lcom/android/server/pm/ApexManager;->getInstance()Lcom/android/server/pm/ApexManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/server/pm/ApexManager;->getApexSystemServices()Ljava/util/List;

    move-result-object v0

    .line 3328
    .local v0, "services":Ljava/util/List;, "Ljava/util/List<Lcom/android/server/pm/ApexSystemServiceInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_52

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/pm/ApexSystemServiceInfo;

    .line 3329
    .local v2, "info":Lcom/android/server/pm/ApexSystemServiceInfo;
    invoke-virtual {v2}, Lcom/android/server/pm/ApexSystemServiceInfo;->getName()Ljava/lang/String;

    move-result-object v3

    .line 3330
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/android/server/pm/ApexSystemServiceInfo;->getJarPath()Ljava/lang/String;

    move-result-object v4

    .line 3331
    .local v4, "jarPath":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "starting "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3332
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_49

    .line 3333
    iget-object v5, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    invoke-virtual {v5, v3}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    goto :goto_4e

    .line 3335
    :cond_49
    iget-object v5, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    invoke-virtual {v5, v3, v4}, Lcom/android/server/SystemServiceManager;->startServiceFromJar(Ljava/lang/String;Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 3337
    :goto_4e
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3338
    .end local v2  # "info":Lcom/android/server/pm/ApexSystemServiceInfo;
    .end local v3  # "name":Ljava/lang/String;
    .end local v4  # "jarPath":Ljava/lang/String;
    goto :goto_12

    .line 3341
    :cond_52
    iget-object v1, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    invoke-virtual {v1}, Lcom/android/server/SystemServiceManager;->sealStartedServices()V

    .line 3343
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3344
    return-void
.end method

.method private startAttentionService(Landroid/content/Context;Lcom/android/server/utils/TimingsTraceAndSlog;)V
    .registers 5
    .param p1, "context"  # Landroid/content/Context;
    .param p2, "t"  # Lcom/android/server/utils/TimingsTraceAndSlog;

    .line 3407
    invoke-static {p1}, Lcom/android/server/attention/AttentionManagerService;->isServiceConfigured(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 3408
    const-string v0, "SystemServer"

    const-string v1, "AttentionService is not configured on this device"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3409
    return-void

    .line 3412
    :cond_e
    const-string v0, "StartAttentionManagerService"

    invoke-virtual {p2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3413
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v1, Lcom/android/server/attention/AttentionManagerService;

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 3414
    invoke-virtual {p2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3415
    return-void
.end method

.method private startBootstrapServices(Lcom/android/server/utils/TimingsTraceAndSlog;)V
    .registers 16
    .param p1, "t"  # Lcom/android/server/utils/TimingsTraceAndSlog;

    .line 1089
    const-string/jumbo v0, "packagemanagermain"

    const-string/jumbo v1, "moveab"

    const-string/jumbo v2, "startBootstrapServices"

    invoke-virtual {p1, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1093
    const-string v2, "StartWatchdog"

    invoke-virtual {p1, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1094
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v2

    .line 1095
    .local v2, "watchdog":Lcom/android/server/Watchdog;
    invoke-virtual {v2}, Lcom/android/server/Watchdog;->start()V

    .line 1096
    iget-object v3, p0, Lcom/android/server/SystemServer;->mDumper:Lcom/android/server/SystemServer$SystemServerDumper;

    invoke-static {v3, v2}, Lcom/android/server/SystemServer$SystemServerDumper;->-$$Nest$maddDumpable(Lcom/android/server/SystemServer$SystemServerDumper;Landroid/util/Dumpable;)V

    .line 1097
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1099
    const-string v3, "SystemServer"

    const-string v4, "Reading configuration..."

    invoke-static {v3, v4}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1100
    const-string v4, "ReadingSystemConfig"

    .line 1101
    .local v4, "TAG_SYSTEM_CONFIG":Ljava/lang/String;
    const-string v5, "ReadingSystemConfig"

    invoke-virtual {p1, v5}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1102
    new-instance v6, Lcom/android/server/SystemServer$$ExternalSyntheticLambda1;

    invoke-direct {v6}, Lcom/android/server/SystemServer$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v6, v5}, Lcom/android/server/SystemServerInitThreadPool;->submit(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/util/concurrent/Future;

    .line 1103
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1107
    const-string v5, "PlatformCompat"

    invoke-virtual {p1, v5}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1108
    new-instance v5, Lcom/android/server/compat/PlatformCompat;

    iget-object v6, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-direct {v5, v6}, Lcom/android/server/compat/PlatformCompat;-><init>(Landroid/content/Context;)V

    .line 1109
    .local v5, "platformCompat":Lcom/android/server/compat/PlatformCompat;
    const-string/jumbo v6, "platform_compat"

    invoke-static {v6, v5}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 1110
    new-instance v6, Lcom/android/server/compat/PlatformCompatNative;

    invoke-direct {v6, v5}, Lcom/android/server/compat/PlatformCompatNative;-><init>(Lcom/android/server/compat/PlatformCompat;)V

    const-string/jumbo v7, "platform_compat_native"

    invoke-static {v7, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 1112
    const/4 v6, 0x0

    new-array v7, v6, [J

    invoke-static {v7}, Landroid/app/AppCompatCallbacks;->install([J)V

    .line 1113
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1118
    const-string v7, "StartFileIntegrityService"

    invoke-virtual {p1, v7}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1119
    iget-object v7, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v8, Lcom/android/server/security/FileIntegrityService;

    invoke-virtual {v7, v8}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1120
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1124
    invoke-static {}, Lcom/lge/config/Features2;->use_property_hal()Ljava/util/Optional;

    move-result-object v7

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_95

    .line 1125
    const-string v7, "StartLgePropertyService"

    invoke-virtual {p1, v7}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1126
    new-instance v7, Lcom/lge/server/os/PropertyService;

    invoke-direct {v7}, Lcom/lge/server/os/PropertyService;-><init>()V

    const-string/jumbo v8, "lge_property"

    invoke-static {v8, v7}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 1127
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1133
    :cond_95
    const-string v7, "StartInstaller"

    invoke-virtual {p1, v7}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1134
    iget-object v7, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v8, Lcom/android/server/pm/Installer;

    invoke-virtual {v7, v8}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    move-result-object v7

    check-cast v7, Lcom/android/server/pm/Installer;

    .line 1135
    .local v7, "installer":Lcom/android/server/pm/Installer;
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1139
    const-string v8, "DeviceIdentifiersPolicyService"

    invoke-virtual {p1, v8}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1140
    iget-object v8, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v9, Lcom/android/server/os/DeviceIdentifiersPolicyService;

    invoke-virtual {v8, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1141
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1144
    const-string v8, "UriGrantsManagerService"

    invoke-virtual {p1, v8}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1145
    iget-object v8, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v9, Lcom/android/server/uri/UriGrantsManagerService$Lifecycle;

    invoke-virtual {v8, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1146
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1148
    const-string v8, "StartPowerStatsService"

    invoke-virtual {p1, v8}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1150
    iget-object v8, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v9, Lcom/android/server/powerstats/PowerStatsService;

    invoke-virtual {v8, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1151
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1153
    const-string v8, "StartIStatsService"

    invoke-virtual {p1, v8}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1154
    invoke-static {}, Lcom/android/server/SystemServer;->startIStatsService()V

    .line 1155
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1159
    const-string v8, "MemtrackProxyService"

    invoke-virtual {p1, v8}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1160
    invoke-static {}, Lcom/android/server/SystemServer;->startMemtrackProxyService()V

    .line 1161
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1164
    const-string v8, "StartActivityManager"

    invoke-virtual {p1, v8}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1166
    iget-object v8, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v9, Lcom/android/server/wm/ActivityTaskManagerService$Lifecycle;

    invoke-virtual {v8, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    move-result-object v8

    check-cast v8, Lcom/android/server/wm/ActivityTaskManagerService$Lifecycle;

    .line 1167
    invoke-virtual {v8}, Lcom/android/server/wm/ActivityTaskManagerService$Lifecycle;->getService()Lcom/android/server/wm/ActivityTaskManagerService;

    move-result-object v8

    .line 1168
    .local v8, "atm":Lcom/android/server/wm/ActivityTaskManagerService;
    iget-object v9, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    invoke-static {v9, v8}, Lcom/android/server/am/ActivityManagerService$Lifecycle;->startService(Lcom/android/server/SystemServiceManager;Lcom/android/server/wm/ActivityTaskManagerService;)Lcom/android/server/am/ActivityManagerService;

    move-result-object v9

    iput-object v9, p0, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    .line 1170
    iget-object v10, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    invoke-virtual {v9, v10}, Lcom/android/server/am/ActivityManagerService;->setSystemServiceManager(Lcom/android/server/SystemServiceManager;)V

    .line 1171
    iget-object v9, p0, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v9, v7}, Lcom/android/server/am/ActivityManagerService;->setInstaller(Lcom/android/server/pm/Installer;)V

    .line 1172
    invoke-virtual {v8}, Lcom/android/server/wm/ActivityTaskManagerService;->getGlobalLock()Lcom/android/server/wm/WindowManagerGlobalLock;

    move-result-object v9

    iput-object v9, p0, Lcom/android/server/SystemServer;->mWindowManagerGlobalLock:Lcom/android/server/wm/WindowManagerGlobalLock;

    .line 1173
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1176
    const-string v9, "StartDataLoaderManagerService"

    invoke-virtual {p1, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1177
    iget-object v9, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/pm/DataLoaderManagerService;

    invoke-virtual {v9, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    move-result-object v9

    check-cast v9, Lcom/android/server/pm/DataLoaderManagerService;

    iput-object v9, p0, Lcom/android/server/SystemServer;->mDataLoaderManagerService:Lcom/android/server/pm/DataLoaderManagerService;

    .line 1179
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1182
    const-string v9, "StartIncrementalService"

    invoke-virtual {p1, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1183
    invoke-static {}, Lcom/android/server/SystemServer;->startIncrementalService()J

    move-result-wide v9

    iput-wide v9, p0, Lcom/android/server/SystemServer;->mIncrementalServiceHandle:J

    .line 1184
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1190
    const-string v9, "StartPowerManager"

    invoke-virtual {p1, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1192
    :try_start_13f
    iget-object v9, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.power.PowerManagerServiceEx"

    invoke-virtual {v9, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    move-result-object v9

    check-cast v9, Lcom/android/server/power/PowerManagerService;

    iput-object v9, p0, Lcom/android/server/SystemServer;->mPowerManagerService:Lcom/android/server/power/PowerManagerService;
    :try_end_14b
    .catch Ljava/lang/RuntimeException; {:try_start_13f .. :try_end_14b} :catch_14c

    .line 1196
    goto :goto_15e

    .line 1193
    :catch_14c
    move-exception v9

    .line 1194
    .local v9, "e":Ljava/lang/RuntimeException;
    const-string v10, "PowerManagerServiceEx not started "

    invoke-static {v3, v10, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1195
    iget-object v10, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/power/PowerManagerService;

    invoke-virtual {v10, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    move-result-object v10

    check-cast v10, Lcom/android/server/power/PowerManagerService;

    iput-object v10, p0, Lcom/android/server/SystemServer;->mPowerManagerService:Lcom/android/server/power/PowerManagerService;

    .line 1197
    .end local v9  # "e":Ljava/lang/RuntimeException;
    :goto_15e
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1199
    const-string v9, "StartThermalManager"

    invoke-virtual {p1, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1200
    iget-object v9, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/power/ThermalManagerService;

    invoke-virtual {v9, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1201
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1203
    const-string v9, "StartHintManager"

    invoke-virtual {p1, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1204
    iget-object v9, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/power/hint/HintManagerService;

    invoke-virtual {v9, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1205
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1209
    const-string v9, "InitPowerManagement"

    invoke-virtual {p1, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1210
    iget-object v9, p0, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v9}, Lcom/android/server/am/ActivityManagerService;->initPowerManagement()V

    .line 1211
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1214
    const-string v9, "StartRecoverySystemService"

    invoke-virtual {p1, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1215
    iget-object v9, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/recoverysystem/RecoverySystemService$Lifecycle;

    invoke-virtual {v9, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1216
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1221
    iget-object v9, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/android/server/RescueParty;->registerHealthObserver(Landroid/content/Context;)V

    .line 1222
    iget-object v9, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/android/server/PackageWatchdog;->getInstance(Landroid/content/Context;)Lcom/android/server/PackageWatchdog;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/server/PackageWatchdog;->noteBoot()V

    .line 1225
    const-string v9, "StartLightsService"

    invoke-virtual {p1, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1226
    iget-object v9, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/lights/LightsService;

    invoke-virtual {v9, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1227
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1229
    const-string v9, "StartDisplayOffloadService"

    invoke-virtual {p1, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1231
    const-string v9, "config.enable_display_offload"

    invoke-static {v9, v6}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    if-eqz v9, :cond_1cc

    .line 1232
    iget-object v9, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.google.android.clockwork.displayoffload.DisplayOffloadService"

    invoke-virtual {v9, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1234
    :cond_1cc
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1236
    const-string v9, "StartSidekickService"

    invoke-virtual {p1, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1238
    const-string v9, "config.enable_sidekick_graphics"

    invoke-static {v9, v6}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    if-eqz v9, :cond_1e3

    .line 1239
    iget-object v9, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.google.android.clockwork.sidekick.SidekickService"

    invoke-virtual {v9, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1241
    :cond_1e3
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1245
    const-string v9, "StartDisplayManager"

    invoke-virtual {p1, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1247
    :try_start_1eb
    iget-object v9, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.display.DisplayManagerServiceEx"

    invoke-virtual {v9, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    move-result-object v9

    check-cast v9, Lcom/android/server/display/DisplayManagerService;

    iput-object v9, p0, Lcom/android/server/SystemServer;->mDisplayManagerService:Lcom/android/server/display/DisplayManagerService;
    :try_end_1f7
    .catch Ljava/lang/RuntimeException; {:try_start_1eb .. :try_end_1f7} :catch_1f8

    .line 1251
    goto :goto_20a

    .line 1248
    :catch_1f8
    move-exception v9

    .line 1249
    .restart local v9  # "e":Ljava/lang/RuntimeException;
    const-string v10, "DisplayManagerServiceEx not started "

    invoke-static {v3, v10, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1250
    iget-object v10, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/display/DisplayManagerService;

    invoke-virtual {v10, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    move-result-object v10

    check-cast v10, Lcom/android/server/display/DisplayManagerService;

    iput-object v10, p0, Lcom/android/server/SystemServer;->mDisplayManagerService:Lcom/android/server/display/DisplayManagerService;

    .line 1252
    .end local v9  # "e":Ljava/lang/RuntimeException;
    :goto_20a
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1255
    const-string v9, "WaitForDisplay"

    invoke-virtual {p1, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1256
    iget-object v9, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const/16 v10, 0x64

    invoke-virtual {v9, p1, v10}, Lcom/android/server/SystemServiceManager;->startBootPhase(Lcom/android/server/utils/TimingsTraceAndSlog;I)V

    .line 1257
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1260
    invoke-static {}, Landroid/sysprop/VoldProperties;->decrypt()Ljava/util/Optional;

    move-result-object v9

    const-string v10, ""

    invoke-virtual {v9, v10}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 1261
    .local v9, "cryptState":Ljava/lang/String;
    const-string/jumbo v10, "trigger_restart_min_framework"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    const/4 v11, 0x1

    if-eqz v10, :cond_23a

    .line 1262
    const-string v10, "Detected encryption in progress - only parsing core apps"

    invoke-static {v3, v10}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1263
    iput-boolean v11, p0, Lcom/android/server/SystemServer;->mOnlyCore:Z

    goto :goto_249

    .line 1264
    :cond_23a
    const-string v10, "1"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_249

    .line 1265
    const-string v10, "Device encrypted - only parsing core apps"

    invoke-static {v3, v10}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1266
    iput-boolean v11, p0, Lcom/android/server/SystemServer;->mOnlyCore:Z

    .line 1270
    :cond_249
    :goto_249
    iget-boolean v3, p0, Lcom/android/server/SystemServer;->mRuntimeRestart:Z

    const/16 v10, 0xf0

    if-nez v3, :cond_258

    .line 1271
    const/16 v3, 0xe

    .line 1274
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v12

    .line 1271
    invoke-static {v10, v3, v12, v13}, Lcom/android/internal/util/FrameworkStatsLog;->write(IIJ)V

    .line 1277
    :cond_258
    const-string v3, "StartDomainVerificationService"

    invoke-virtual {p1, v3}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1278
    new-instance v3, Lcom/android/server/pm/verify/domain/DomainVerificationService;

    iget-object v12, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    .line 1279
    invoke-static {}, Lcom/android/server/SystemConfig;->getInstance()Lcom/android/server/SystemConfig;

    move-result-object v13

    invoke-direct {v3, v12, v13, v5}, Lcom/android/server/pm/verify/domain/DomainVerificationService;-><init>(Landroid/content/Context;Lcom/android/server/SystemConfig;Lcom/android/server/compat/PlatformCompat;)V

    .line 1280
    .local v3, "domainVerificationService":Lcom/android/server/pm/verify/domain/DomainVerificationService;
    iget-object v12, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    invoke-virtual {v12, v3}, Lcom/android/server/SystemServiceManager;->startService(Lcom/android/server/SystemService;)V

    .line 1281
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1284
    const-string v12, "StartPackageManagerService"

    invoke-virtual {p1, v12}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1286
    :try_start_275
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v12

    invoke-virtual {v12, v0}, Lcom/android/server/Watchdog;->pauseWatchingCurrentThread(Ljava/lang/String;)V

    .line 1287
    iget-object v12, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    iget v13, p0, Lcom/android/server/SystemServer;->mFactoryTestMode:I

    if-eqz v13, :cond_283

    goto :goto_284

    :cond_283
    move v11, v6

    :goto_284
    iget-boolean v13, p0, Lcom/android/server/SystemServer;->mOnlyCore:Z

    invoke-static {v12, v7, v3, v11, v13}, Lcom/android/server/pm/PackageManagerService;->main(Landroid/content/Context;Lcom/android/server/pm/Installer;Lcom/android/server/pm/verify/domain/DomainVerificationService;ZZ)Landroid/util/Pair;

    move-result-object v11

    .line 1290
    .local v11, "pmsPair":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/android/server/pm/PackageManagerService;Landroid/content/pm/IPackageManager;>;"
    iget-object v12, v11, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v12, Lcom/android/server/pm/PackageManagerService;

    iput-object v12, p0, Lcom/android/server/SystemServer;->mPackageManagerService:Lcom/android/server/pm/PackageManagerService;

    .line 1291
    iget-object v12, v11, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v12, Landroid/content/pm/IPackageManager;
    :try_end_294
    .catchall {:try_start_275 .. :try_end_294} :catchall_3b3

    move-object v11, v12

    .line 1293
    .local v11, "iPackageManager":Landroid/content/pm/IPackageManager;
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v12

    invoke-virtual {v12, v0}, Lcom/android/server/Watchdog;->resumeWatchingCurrentThread(Ljava/lang/String;)V

    .line 1294
    nop

    .line 1299
    invoke-static {v11}, Lcom/android/server/pm/dex/SystemServerDexLoadReporter;->configureSystemServerDexReporter(Landroid/content/pm/IPackageManager;)V

    .line 1301
    iget-object v0, p0, Lcom/android/server/SystemServer;->mPackageManagerService:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v0}, Lcom/android/server/pm/PackageManagerService;->isFirstBoot()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/SystemServer;->mFirstBoot:Z

    .line 1302
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 1303
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1304
    iget-boolean v0, p0, Lcom/android/server/SystemServer;->mRuntimeRestart:Z

    if-nez v0, :cond_2c6

    invoke-direct {p0}, Lcom/android/server/SystemServer;->isFirstBootOrUpgrade()Z

    move-result v0

    if-nez v0, :cond_2c6

    .line 1305
    const/16 v0, 0xf

    .line 1308
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v12

    .line 1305
    invoke-static {v10, v0, v12, v13}, Lcom/android/internal/util/FrameworkStatsLog;->write(IIJ)V

    .line 1313
    :cond_2c6
    iget-boolean v0, p0, Lcom/android/server/SystemServer;->mOnlyCore:Z

    if-nez v0, :cond_304

    .line 1314
    const-string v0, "config.disable_otadexopt"

    invoke-static {v0, v6}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 1316
    .local v0, "disableOtaDexopt":Z
    if-nez v0, :cond_304

    .line 1317
    const-string v10, "StartOtaDexOptService"

    invoke-virtual {p1, v10}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1319
    :try_start_2d7
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v10

    invoke-virtual {v10, v1}, Lcom/android/server/Watchdog;->pauseWatchingCurrentThread(Ljava/lang/String;)V

    .line 1320
    iget-object v10, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    iget-object v12, p0, Lcom/android/server/SystemServer;->mPackageManagerService:Lcom/android/server/pm/PackageManagerService;

    invoke-static {v10, v12}, Lcom/android/server/pm/OtaDexoptService;->main(Landroid/content/Context;Lcom/android/server/pm/PackageManagerService;)Lcom/android/server/pm/OtaDexoptService;
    :try_end_2e5
    .catchall {:try_start_2d7 .. :try_end_2e5} :catchall_2e6

    goto :goto_2ed

    .line 1321
    :catchall_2e6
    move-exception v10

    .line 1322
    .local v10, "e":Ljava/lang/Throwable;
    :try_start_2e7
    const-string/jumbo v12, "starting OtaDexOptService"

    invoke-direct {p0, v12, v10}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2ed
    .catchall {:try_start_2e7 .. :try_end_2ed} :catchall_2f8

    .line 1324
    .end local v10  # "e":Ljava/lang/Throwable;
    :goto_2ed
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v10

    invoke-virtual {v10, v1}, Lcom/android/server/Watchdog;->resumeWatchingCurrentThread(Ljava/lang/String;)V

    .line 1325
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1326
    goto :goto_304

    .line 1324
    :catchall_2f8
    move-exception v6

    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v10

    invoke-virtual {v10, v1}, Lcom/android/server/Watchdog;->resumeWatchingCurrentThread(Ljava/lang/String;)V

    .line 1325
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1326
    throw v6

    .line 1330
    .end local v0  # "disableOtaDexopt":Z
    :cond_304
    :goto_304
    const-string v0, "StartUserManagerService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1331
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v1, Lcom/android/server/pm/UserManagerService$LifeCycle;

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1332
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1335
    const-string v0, "InitAttributerCache"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1336
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/internal/policy/AttributeCache;->init(Landroid/content/Context;)V

    .line 1337
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1340
    const-string v0, "SetSystemProcess"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1341
    iget-object v0, p0, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v0}, Lcom/android/server/am/ActivityManagerService;->setSystemProcess()V

    .line 1342
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1345
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-virtual {v5, v0}, Lcom/android/server/compat/PlatformCompat;->registerPackageReceiver(Landroid/content/Context;)V

    .line 1349
    const-string v0, "InitWatchdog"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1350
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v2, v0, v1}, Lcom/android/server/Watchdog;->init(Landroid/content/Context;Lcom/android/server/am/ActivityManagerService;)V

    .line 1351
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1355
    iget-object v0, p0, Lcom/android/server/SystemServer;->mDisplayManagerService:Lcom/android/server/display/DisplayManagerService;

    invoke-virtual {v0}, Lcom/android/server/display/DisplayManagerService;->setupSchedulerPolicies()V

    .line 1358
    const-string v0, "StartOverlayManagerService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1359
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    new-instance v1, Lcom/android/server/om/OverlayManagerService;

    iget-object v10, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-direct {v1, v10}, Lcom/android/server/om/OverlayManagerService;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Lcom/android/server/SystemService;)V

    .line 1360
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1363
    const-string v0, "StartResourcesManagerService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1364
    new-instance v0, Lcom/android/server/resources/ResourcesManagerService;

    iget-object v1, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/android/server/resources/ResourcesManagerService;-><init>(Landroid/content/Context;)V

    .line 1365
    .local v0, "resourcesService":Lcom/android/server/resources/ResourcesManagerService;
    iget-object v1, p0, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v0, v1}, Lcom/android/server/resources/ResourcesManagerService;->setActivityManagerService(Lcom/android/server/am/ActivityManagerService;)V

    .line 1366
    iget-object v1, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    invoke-virtual {v1, v0}, Lcom/android/server/SystemServiceManager;->startService(Lcom/android/server/SystemService;)V

    .line 1367
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1369
    const-string v1, "StartSensorPrivacyService"

    invoke-virtual {p1, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1370
    iget-object v1, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    new-instance v10, Lcom/android/server/sensorprivacy/SensorPrivacyService;

    iget-object v12, p0, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-direct {v10, v12}, Lcom/android/server/sensorprivacy/SensorPrivacyService;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v10}, Lcom/android/server/SystemServiceManager;->startService(Lcom/android/server/SystemService;)V

    .line 1371
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1373
    const-string/jumbo v1, "persist.sys.displayinset.top"

    invoke-static {v1, v6}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-lez v1, :cond_3a0

    .line 1375
    iget-object v1, p0, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v1}, Lcom/android/server/am/ActivityManagerService;->updateSystemUiContext()V

    .line 1376
    const-class v1, Landroid/hardware/display/DisplayManagerInternal;

    invoke-static {v1}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/display/DisplayManagerInternal;

    invoke-virtual {v1}, Landroid/hardware/display/DisplayManagerInternal;->onOverlayChanged()V

    .line 1381
    :cond_3a0
    const-string v1, "StartSensorService"

    invoke-virtual {p1, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1382
    iget-object v1, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v6, Lcom/android/server/sensors/SensorService;

    invoke-virtual {v1, v6}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1383
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1384
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1385
    return-void

    .line 1293
    .end local v0  # "resourcesService":Lcom/android/server/resources/ResourcesManagerService;
    .end local v11  # "iPackageManager":Landroid/content/pm/IPackageManager;
    :catchall_3b3
    move-exception v1

    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v6

    invoke-virtual {v6, v0}, Lcom/android/server/Watchdog;->resumeWatchingCurrentThread(Ljava/lang/String;)V

    .line 1294
    throw v1
.end method

.method private startContentCaptureService(Landroid/content/Context;Lcom/android/server/utils/TimingsTraceAndSlog;)V
    .registers 7
    .param p1, "context"  # Landroid/content/Context;
    .param p2, "t"  # Lcom/android/server/utils/TimingsTraceAndSlog;

    .line 3373
    const/4 v0, 0x0

    .line 3374
    .local v0, "explicitlyEnabled":Z
    const-string v1, "content_capture"

    const-string/jumbo v2, "service_explicitly_enabled"

    invoke-static {v1, v2}, Landroid/provider/DeviceConfig;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3376
    .local v1, "settings":Ljava/lang/String;
    const-string v2, "SystemServer"

    if-eqz v1, :cond_28

    const-string v3, "default"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_28

    .line 3377
    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 3378
    if-eqz v0, :cond_22

    .line 3379
    const-string v3, "ContentCaptureService explicitly enabled by DeviceConfig"

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_28

    .line 3381
    :cond_22
    const-string v3, "ContentCaptureService explicitly disabled by DeviceConfig"

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3382
    return-void

    .line 3387
    :cond_28
    :goto_28
    if-nez v0, :cond_39

    .line 3388
    const v3, 0x1040236

    invoke-direct {p0, p1, v3}, Lcom/android/server/SystemServer;->deviceHasConfigString(Landroid/content/Context;I)Z

    move-result v3

    if-nez v3, :cond_39

    .line 3389
    const-string v3, "ContentCaptureService disabled because resource is not overlaid"

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3390
    return-void

    .line 3394
    :cond_39
    const-string v2, "StartContentCaptureService"

    invoke-virtual {p2, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3395
    iget-object v2, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v3, "com.android.server.contentcapture.ContentCaptureManagerService"

    invoke-virtual {v2, v3}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 3397
    const-class v2, Lcom/android/server/contentcapture/ContentCaptureManagerInternal;

    .line 3398
    invoke-static {v2}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/contentcapture/ContentCaptureManagerInternal;

    .line 3399
    .local v2, "ccmi":Lcom/android/server/contentcapture/ContentCaptureManagerInternal;
    if-eqz v2, :cond_56

    iget-object v3, p0, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    if-eqz v3, :cond_56

    .line 3400
    invoke-virtual {v3, v2}, Lcom/android/server/am/ActivityManagerService;->setContentCaptureManager(Lcom/android/server/contentcapture/ContentCaptureManagerInternal;)V

    .line 3403
    :cond_56
    invoke-virtual {p2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3404
    return-void
.end method

.method private startCoreServices(Lcom/android/server/utils/TimingsTraceAndSlog;)V
    .registers 5
    .param p1, "t"  # Lcom/android/server/utils/TimingsTraceAndSlog;

    .line 1391
    const-string/jumbo v0, "startCoreServices"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1394
    const-string v0, "StartSystemConfigService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1395
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v1, Lcom/android/server/SystemConfigService;

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1396
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1398
    const-string v0, "StartBatteryService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1401
    :try_start_1a
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v1, "com.android.server.BatteryServiceEx"

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;
    :try_end_21
    .catch Ljava/lang/RuntimeException; {:try_start_1a .. :try_end_21} :catch_22

    .line 1405
    goto :goto_31

    .line 1402
    :catch_22
    move-exception v0

    .line 1403
    .local v0, "e":Ljava/lang/RuntimeException;
    const-string v1, "SystemServer"

    const-string v2, "BatteryManagerServiceEx not started "

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1404
    iget-object v1, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/BatteryService;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1406
    .end local v0  # "e":Ljava/lang/RuntimeException;
    :goto_31
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1409
    const-string v0, "StartUsageService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1410
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v1, Lcom/android/server/usage/UsageStatsService;

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1411
    iget-object v0, p0, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    const-class v1, Landroid/app/usage/UsageStatsManagerInternal;

    .line 1412
    invoke-static {v1}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/usage/UsageStatsManagerInternal;

    .line 1411
    invoke-virtual {v0, v1}, Lcom/android/server/am/ActivityManagerService;->setUsageStatsManager(Landroid/app/usage/UsageStatsManagerInternal;)V

    .line 1413
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1416
    iget-object v0, p0, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v1, "android.software.webview"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6e

    .line 1417
    const-string v0, "StartWebViewUpdateService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1418
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v1, Lcom/android/server/webkit/WebViewUpdateService;

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    move-result-object v0

    check-cast v0, Lcom/android/server/webkit/WebViewUpdateService;

    iput-object v0, p0, Lcom/android/server/SystemServer;->mWebViewUpdateService:Lcom/android/server/webkit/WebViewUpdateService;

    .line 1419
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1423
    :cond_6e
    const-string v0, "StartCachedDeviceStateService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1424
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v1, Lcom/android/server/CachedDeviceStateService;

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1425
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1428
    const-string v0, "StartBinderCallsStatsService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1429
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v1, Lcom/android/server/BinderCallsStatsService$LifeCycle;

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1430
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1433
    const-string v0, "StartLooperStatsService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1434
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v1, Lcom/android/server/LooperStatsService$Lifecycle;

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1435
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1438
    const-string v0, "StartRollbackManagerService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1439
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v1, "com.android.server.rollback.RollbackManagerService"

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1440
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1443
    const-string v0, "StartNativeTombstoneManagerService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1444
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v1, Lcom/android/server/os/NativeTombstoneManagerService;

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1445
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1448
    const-string v0, "StartBugreportManagerService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1449
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v1, Lcom/android/server/os/BugreportManagerService;

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1450
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1453
    const-string v0, "GpuService"

    invoke-virtual {p1, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1454
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v1, Lcom/android/server/gpu/GpuService;

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1455
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1457
    invoke-virtual {p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1458
    return-void
.end method

.method private static native startHidlServices()V
.end method

.method private static native startIStatsService()V
.end method

.method private static native startIncrementalService()J
.end method

.method private static native startMemtrackProxyService()V
.end method

.method private startOtherServices(Lcom/android/server/utils/TimingsTraceAndSlog;)V
    .registers 68
    .param p1, "t"  # Lcom/android/server/utils/TimingsTraceAndSlog;

    .line 1464
    move-object/from16 v7, p0

    move-object/from16 v6, p1

    const-string/jumbo v1, "startOtherServices"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1465
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    invoke-virtual {v1}, Lcom/android/server/SystemServiceManager;->updateOtherServicesStartIndex()V

    .line 1467
    iget-object v5, v7, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    .line 1468
    .local v5, "context":Landroid/content/Context;
    const/4 v1, 0x0

    .line 1469
    .local v1, "dynamicSystem":Lcom/android/server/DynamicSystemService;
    const/4 v2, 0x0

    .line 1470
    .local v2, "storageManager":Landroid/os/storage/IStorageManager;
    const/4 v3, 0x0

    .line 1471
    .local v3, "networkManagement":Lcom/android/server/NetworkManagementService;
    const/4 v4, 0x0

    .line 1472
    .local v4, "vpnManager":Lcom/android/server/VpnManagerService;
    const/4 v14, 0x0

    .line 1473
    .local v14, "vcnManagement":Lcom/android/server/VcnManagementService;
    const/4 v15, 0x0

    .line 1474
    .local v15, "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    const/16 v16, 0x0

    .line 1475
    .local v16, "wm":Lcom/android/server/wm/WindowManagerService;
    const/16 v17, 0x0

    .line 1476
    .local v17, "serial":Lcom/android/server/SerialService;
    const/16 v18, 0x0

    .line 1477
    .local v18, "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    const/4 v8, 0x0

    .line 1478
    .local v8, "inputManager":Lcom/android/server/input/InputManagerService;
    const/4 v9, 0x0

    .line 1479
    .local v9, "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    const/4 v10, 0x0

    .line 1480
    .local v10, "consumerIr":Lcom/android/server/ConsumerIrService;
    const/16 v19, 0x0

    .line 1481
    .local v19, "mmsService":Lcom/android/server/MmsServiceBroker;
    const/16 v20, 0x0

    .line 1482
    .local v20, "hardwarePropertiesService":Lcom/android/server/HardwarePropertiesManagerService;
    const/16 v21, 0x0

    .line 1483
    .local v21, "pacProxyService":Lcom/android/server/connectivity/PacProxyService;
    const/16 v22, 0x0

    .line 1484
    .local v22, "wigigP2pService":Ljava/lang/Object;
    const/16 v23, 0x0

    .line 1486
    .local v23, "wigigService":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 1489
    .local v11, "dataRuntimeFeature":Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;
    const/16 v24, 0x0

    .line 1492
    .local v24, "wifisapservice":Lcom/lge/wifi/impl/wifiSap/WifiSapService;
    const-string v12, "config.disable_systemtextclassifier"

    const/4 v13, 0x0

    invoke-static {v12, v13}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v25

    .line 1495
    .local v25, "disableSystemTextClassifier":Z
    const-string v12, "config.disable_networktime"

    invoke-static {v12, v13}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v26

    .line 1497
    .local v26, "disableNetworkTime":Z
    const-string v12, "config.disable_cameraservice"

    invoke-static {v12, v13}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v27

    .line 1499
    .local v27, "disableCameraService":Z
    const-string v12, "config.enable_lefty"

    invoke-static {v12, v13}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v28

    .line 1501
    .local v28, "enableLeftyService":Z
    const-string/jumbo v12, "ro.boot.qemu"

    invoke-static {v12}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v13, "1"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v30

    .line 1502
    .local v30, "isEmulator":Z
    const-string/jumbo v12, "persist.vendor.wigig.enable"

    const/4 v13, 0x0

    invoke-static {v12, v13}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v31

    .line 1504
    .local v31, "enableWigig":Z
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v12

    const-string v13, "android.hardware.type.watch"

    invoke-virtual {v12, v13}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v32

    .line 1507
    .local v32, "isWatch":Z
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v12

    const-string/jumbo v13, "org.chromium.arc"

    invoke-virtual {v12, v13}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v33

    .line 1510
    .local v33, "isArc":Z
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v12

    const-string v13, "android.hardware.vr.high_performance"

    invoke-virtual {v12, v13}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v12

    .line 1513
    .local v12, "enableVrService":Z
    if-nez v12, :cond_a6

    const-string/jumbo v13, "ro.product.lge.vr"

    .line 1514
    move-object/from16 v35, v1

    const/4 v1, 0x0

    .end local v1  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .local v35, "dynamicSystem":Lcom/android/server/DynamicSystemService;
    invoke-static {v13, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    if-nez v13, :cond_a8

    const-string/jumbo v13, "ro.product.lge.vr_hybrid_hmd"

    .line 1515
    invoke-static {v13, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    if-nez v13, :cond_a8

    const-string/jumbo v13, "ro.product.lge.ar_glasses"

    .line 1516
    invoke-static {v13, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    if-nez v13, :cond_a8

    const-string/jumbo v13, "ro.product.lge.ar_glasses_eu"

    .line 1517
    invoke-static {v13, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_a4

    goto :goto_a8

    :cond_a4
    const/4 v13, 0x0

    goto :goto_a9

    .line 1513
    .end local v35  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .restart local v1  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    :cond_a6
    move-object/from16 v35, v1

    .line 1517
    .end local v1  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .restart local v35  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    :cond_a8
    :goto_a8
    const/4 v13, 0x1

    :goto_a9
    move/from16 v36, v13

    .line 1521
    .end local v12  # "enableVrService":Z
    .local v36, "enableVrService":Z
    sget-boolean v1, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v1, :cond_bf

    const-string v1, "debug.crash_system"

    const/4 v13, 0x0

    invoke-static {v1, v13}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_b9

    goto :goto_c0

    .line 1522
    :cond_b9
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1}, Ljava/lang/RuntimeException;-><init>()V

    throw v1

    .line 1521
    :cond_bf
    const/4 v13, 0x0

    .line 1526
    :goto_c0
    :try_start_c0
    const-string v1, "SecondaryZygotePreload"

    .line 1531
    .local v1, "SECONDARY_ZYGOTE_PRELOAD":Ljava/lang/String;
    new-instance v12, Lcom/android/server/SystemServer$$ExternalSyntheticLambda5;

    invoke-direct {v12}, Lcom/android/server/SystemServer$$ExternalSyntheticLambda5;-><init>()V

    const-string v13, "SecondaryZygotePreload"

    invoke-static {v12, v13}, Lcom/android/server/SystemServerInitThreadPool;->submit(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v12

    iput-object v12, v7, Lcom/android/server/SystemServer;->mZygotePreload:Ljava/util/concurrent/Future;

    .line 1546
    const-string v12, "StartKeyAttestationApplicationIdProviderService"

    invoke-virtual {v6, v12}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1547
    const-string/jumbo v12, "sec_key_att_app_id_provider"

    new-instance v13, Lcom/android/server/security/KeyAttestationApplicationIdProviderService;

    invoke-direct {v13, v5}, Lcom/android/server/security/KeyAttestationApplicationIdProviderService;-><init>(Landroid/content/Context;)V

    invoke-static {v12, v13}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 1549
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1551
    const-string v12, "StartKeyChainSystemService"

    invoke-virtual {v6, v12}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1552
    iget-object v12, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v13, Lcom/android/server/security/KeyChainSystemService;

    invoke-virtual {v12, v13}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1553
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1556
    const-string v12, "LPCP-2490@n@c@services@SystemServer.java@1"

    invoke-static {v12}, Lcom/lge/lgdata/LGDataRuntimeFeature;->patchCodeId(Ljava/lang/String;)V

    .line 1557
    const-string v12, "Start LGDataRuntimeFeatureService"

    invoke-virtual {v6, v12}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V
    :try_end_fb
    .catchall {:try_start_c0 .. :try_end_fb} :catchall_1651

    .line 1559
    :try_start_fb
    const-string v12, "SystemServer"

    const-string v13, "adding LGDataRuntimeFeatureService"

    invoke-static {v12, v13}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1560
    new-instance v12, Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;

    invoke-direct {v12, v5}, Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;-><init>(Landroid/content/Context;)V

    move-object v11, v12

    .line 1561
    const-string/jumbo v12, "lgdataruntimefeature"

    invoke-static {v12, v11}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_10e
    .catchall {:try_start_fb .. :try_end_10e} :catchall_111

    .line 1564
    move-object/from16 v37, v11

    goto :goto_11b

    .line 1562
    :catchall_111
    move-exception v0

    move-object v12, v0

    .line 1563
    .local v12, "e":Ljava/lang/Throwable;
    :try_start_113
    const-string/jumbo v13, "starting LGDataRuntimeFeatureService"

    invoke-direct {v7, v13, v12}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_119
    .catchall {:try_start_113 .. :try_end_119} :catchall_1651

    move-object/from16 v37, v11

    .line 1565
    .end local v11  # "dataRuntimeFeature":Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;
    .end local v12  # "e":Ljava/lang/Throwable;
    .local v37, "dataRuntimeFeature":Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;
    :goto_11b
    :try_start_11b
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1567
    const-string v11, "StartBinaryTransparencyService"

    invoke-virtual {v6, v11}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1568
    iget-object v11, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v12, Lcom/android/server/BinaryTransparencyService;

    invoke-virtual {v11, v12}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1569
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1571
    const-string v11, "Start LGWiFiFeatureService"

    invoke-virtual {v6, v11}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V
    :try_end_132
    .catchall {:try_start_11b .. :try_end_132} :catchall_1644

    .line 1573
    :try_start_132
    const-string v11, "SystemServer"

    const-string v12, "adding LGWiFiFeatureService"

    invoke-static {v11, v12}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1574
    const-string/jumbo v11, "lgwifi_feature"

    new-instance v12, Lcom/lge/server/wififeature/LGWiFiFeatureService;

    invoke-direct {v12, v5}, Lcom/lge/server/wififeature/LGWiFiFeatureService;-><init>(Landroid/content/Context;)V

    invoke-static {v11, v12}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_144
    .catchall {:try_start_132 .. :try_end_144} :catchall_145

    .line 1578
    goto :goto_14d

    .line 1576
    :catchall_145
    move-exception v0

    move-object v11, v0

    .line 1577
    .local v11, "e":Ljava/lang/Throwable;
    :try_start_147
    const-string/jumbo v12, "starting LGWiFiFeatureService"

    invoke-direct {v7, v12, v11}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1579
    .end local v11  # "e":Ljava/lang/Throwable;
    :goto_14d
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1582
    const-string v11, "StartSchedulingPolicyService"

    invoke-virtual {v6, v11}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1583
    const-string/jumbo v11, "scheduling_policy"

    new-instance v12, Lcom/android/server/os/SchedulingPolicyService;

    invoke-direct {v12}, Lcom/android/server/os/SchedulingPolicyService;-><init>()V

    invoke-static {v11, v12}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 1584
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1588
    iget-object v11, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v12, "android.hardware.microphone"

    invoke-virtual {v11, v12}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v11
    :try_end_16b
    .catchall {:try_start_147 .. :try_end_16b} :catchall_1644

    if-nez v11, :cond_190

    :try_start_16d
    iget-object v11, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v12, "android.software.telecom"

    .line 1589
    invoke-virtual {v11, v12}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_190

    iget-object v11, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v12, "android.hardware.telephony"

    .line 1590
    invoke-virtual {v11, v12}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v11
    :try_end_17f
    .catchall {:try_start_16d .. :try_end_17f} :catchall_182

    if-eqz v11, :cond_19f

    goto :goto_190

    .line 1769
    .end local v1  # "SECONDARY_ZYGOTE_PRELOAD":Ljava/lang/String;
    :catchall_182
    move-exception v0

    move-object/from16 v41, v3

    move-object/from16 v45, v4

    move-object v3, v5

    move-object v1, v6

    move-object/from16 v40, v35

    move-object/from16 v11, v37

    move-object v4, v0

    goto/16 :goto_165b

    .line 1591
    .restart local v1  # "SECONDARY_ZYGOTE_PRELOAD":Ljava/lang/String;
    :cond_190
    :goto_190
    :try_start_190
    const-string v11, "StartTelecomLoaderService"

    invoke-virtual {v6, v11}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1592
    iget-object v11, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v12, Lcom/android/server/telecom/TelecomLoaderService;

    invoke-virtual {v11, v12}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1593
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1596
    :cond_19f
    const-string v11, "StartTelephonyRegistry"

    invoke-virtual {v6, v11}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1597
    new-instance v11, Lcom/android/server/TelephonyRegistry;

    new-instance v12, Lcom/android/server/TelephonyRegistry$ConfigurationProvider;

    invoke-direct {v12}, Lcom/android/server/TelephonyRegistry$ConfigurationProvider;-><init>()V

    invoke-direct {v11, v5, v12}, Lcom/android/server/TelephonyRegistry;-><init>(Landroid/content/Context;Lcom/android/server/TelephonyRegistry$ConfigurationProvider;)V
    :try_end_1ae
    .catchall {:try_start_190 .. :try_end_1ae} :catchall_1644

    move-object v13, v11

    .line 1599
    .end local v9  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .local v13, "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :try_start_1af
    const-string/jumbo v9, "telephony.registry"

    invoke-static {v9, v13}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 1600
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1602
    const-string v9, "StartEntropyMixer"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1603
    new-instance v9, Lcom/android/server/EntropyMixer;

    invoke-direct {v9, v5}, Lcom/android/server/EntropyMixer;-><init>(Landroid/content/Context;)V

    iput-object v9, v7, Lcom/android/server/SystemServer;->mEntropyMixer:Lcom/android/server/EntropyMixer;

    .line 1604
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1606
    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    iput-object v9, v7, Lcom/android/server/SystemServer;->mContentResolver:Landroid/content/ContentResolver;

    .line 1609
    const-string v9, "StartAccountManagerService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1610
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v11, "com.android.server.accounts.AccountManagerService$Lifecycle"

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1611
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1613
    const-string v9, "StartContentService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1614
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v11, "com.android.server.content.ContentService$Lifecycle"

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1615
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1617
    const-string v9, "InstallSystemProviders"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1618
    iget-object v9, v7, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v9}, Lcom/android/server/am/ActivityManagerService;->getContentProviderHelper()Lcom/android/server/am/ContentProviderHelper;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/server/am/ContentProviderHelper;->installSystemProviders()V

    .line 1620
    invoke-static {}, Landroid/database/sqlite/SQLiteCompatibilityWalFlags;->reset()V

    .line 1621
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1623
    const-string v9, "UpdateWatchdogTimeout"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1624
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v9

    invoke-virtual {v9, v5}, Lcom/android/server/Watchdog;->registerSettingsObserver(Landroid/content/Context;)V

    .line 1625
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1630
    const-string v9, "StartDropBoxManager"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1631
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/DropBoxManagerService;

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1632
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1635
    const-string v9, "StartRoleManagerService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1636
    const-class v9, Lcom/android/server/role/RoleServicePlatformHelper;

    new-instance v11, Lcom/android/server/policy/role/RoleServicePlatformHelperImpl;

    iget-object v12, v7, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-direct {v11, v12}, Lcom/android/server/policy/role/RoleServicePlatformHelperImpl;-><init>(Landroid/content/Context;)V

    invoke-static {v9, v11}, Lcom/android/server/LocalManagerRegistry;->addManager(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 1638
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v11, "com.android.role.RoleService"

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1639
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1641
    const-string v9, "StartVibratorManagerService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1642
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/vibrator/VibratorManagerService$Lifecycle;

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1643
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1645
    const-string v9, "StartDynamicSystemService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1646
    new-instance v9, Lcom/android/server/DynamicSystemService;

    invoke-direct {v9, v5}, Lcom/android/server/DynamicSystemService;-><init>(Landroid/content/Context;)V
    :try_end_251
    .catchall {:try_start_1af .. :try_end_251} :catchall_1633

    move-object v12, v9

    .line 1647
    .end local v35  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .local v12, "dynamicSystem":Lcom/android/server/DynamicSystemService;
    :try_start_252
    const-string v9, "dynamic_system"

    invoke-static {v9, v12}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 1648
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V
    :try_end_25a
    .catchall {:try_start_252 .. :try_end_25a} :catchall_1622

    .line 1650
    if-nez v32, :cond_281

    .line 1651
    :try_start_25c
    const-string v9, "StartConsumerIrService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1652
    new-instance v9, Lcom/android/server/ConsumerIrService;

    invoke-direct {v9, v5}, Lcom/android/server/ConsumerIrService;-><init>(Landroid/content/Context;)V

    move-object v10, v9

    .line 1653
    const-string v9, "consumer_ir"

    invoke-static {v9, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 1654
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V
    :try_end_26f
    .catchall {:try_start_25c .. :try_end_26f} :catchall_272

    move-object/from16 v35, v10

    goto :goto_283

    .line 1769
    .end local v1  # "SECONDARY_ZYGOTE_PRELOAD":Ljava/lang/String;
    :catchall_272
    move-exception v0

    move-object/from16 v41, v3

    move-object/from16 v45, v4

    move-object v3, v5

    move-object v1, v6

    move-object/from16 v40, v12

    move-object v9, v13

    move-object/from16 v11, v37

    move-object v4, v0

    goto/16 :goto_165b

    .line 1650
    .restart local v1  # "SECONDARY_ZYGOTE_PRELOAD":Ljava/lang/String;
    :cond_281
    move-object/from16 v35, v10

    .line 1658
    .end local v10  # "consumerIr":Lcom/android/server/ConsumerIrService;
    .local v35, "consumerIr":Lcom/android/server/ConsumerIrService;
    :goto_283
    :try_start_283
    const-string v9, "StartResourceEconomy"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1659
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.tare.InternalResourceService"

    invoke-virtual {v9, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1660
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1663
    const-string v9, "StartAlarmManagerService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1664
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.alarm.AlarmManagerService"

    invoke-virtual {v9, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1665
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1667
    const-string v9, "StartInputManagerService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1668
    new-instance v9, Lcom/android/server/input/InputManagerService;

    invoke-direct {v9, v5}, Lcom/android/server/input/InputManagerService;-><init>(Landroid/content/Context;)V
    :try_end_2ab
    .catchall {:try_start_283 .. :try_end_2ab} :catchall_160f

    move-object v11, v9

    .line 1669
    .end local v8  # "inputManager":Lcom/android/server/input/InputManagerService;
    .local v11, "inputManager":Lcom/android/server/input/InputManagerService;
    :try_start_2ac
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1671
    const-string v8, "DeviceStateManagerService"

    invoke-virtual {v6, v8}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1672
    iget-object v8, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v9, Lcom/android/server/devicestate/DeviceStateManagerService;

    invoke-virtual {v8, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1673
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V
    :try_end_2be
    .catchall {:try_start_2ac .. :try_end_2be} :catchall_15f7

    .line 1675
    if-nez v27, :cond_2e2

    .line 1676
    :try_start_2c0
    const-string v8, "StartCameraServiceProxy"

    invoke-virtual {v6, v8}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1677
    iget-object v8, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v9, Lcom/android/server/camera/CameraServiceProxy;

    invoke-virtual {v8, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1678
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V
    :try_end_2cf
    .catchall {:try_start_2c0 .. :try_end_2cf} :catchall_2d0

    goto :goto_2e2

    .line 1769
    .end local v1  # "SECONDARY_ZYGOTE_PRELOAD":Ljava/lang/String;
    :catchall_2d0
    move-exception v0

    move-object/from16 v41, v3

    move-object/from16 v45, v4

    move-object v3, v5

    move-object v1, v6

    move-object v8, v11

    move-object/from16 v40, v12

    move-object v9, v13

    move-object/from16 v10, v35

    move-object/from16 v11, v37

    move-object v4, v0

    goto/16 :goto_165b

    .line 1681
    .restart local v1  # "SECONDARY_ZYGOTE_PRELOAD":Ljava/lang/String;
    :cond_2e2
    :goto_2e2
    :try_start_2e2
    const-string v8, "StartWindowManagerService"

    invoke-virtual {v6, v8}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1683
    iget-object v8, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const/16 v9, 0xc8

    invoke-virtual {v8, v6, v9}, Lcom/android/server/SystemServiceManager;->startBootPhase(Lcom/android/server/utils/TimingsTraceAndSlog;I)V

    .line 1684
    iget-boolean v8, v7, Lcom/android/server/SystemServer;->mFirstBoot:Z

    if-nez v8, :cond_2f4

    const/4 v10, 0x1

    goto :goto_2f5

    :cond_2f4
    const/4 v10, 0x0

    :goto_2f5
    iget-boolean v9, v7, Lcom/android/server/SystemServer;->mOnlyCore:Z

    new-instance v38, Lcom/android/server/policy/PhoneWindowManager;

    invoke-direct/range {v38 .. v38}, Lcom/android/server/policy/PhoneWindowManager;-><init>()V

    iget-object v8, v7, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    iget-object v8, v8, Lcom/android/server/am/ActivityManagerService;->mActivityTaskManager:Lcom/android/server/wm/ActivityTaskManagerService;
    :try_end_300
    .catchall {:try_start_2e2 .. :try_end_300} :catchall_15f7

    move-object/from16 v39, v8

    move-object v8, v5

    move/from16 v40, v9

    move-object v9, v11

    move-object/from16 v41, v3

    move-object v3, v11

    .end local v11  # "inputManager":Lcom/android/server/input/InputManagerService;
    .local v3, "inputManager":Lcom/android/server/input/InputManagerService;
    .local v41, "networkManagement":Lcom/android/server/NetworkManagementService;
    move/from16 v11, v40

    move-object/from16 v40, v12

    .end local v12  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .local v40, "dynamicSystem":Lcom/android/server/DynamicSystemService;
    move-object/from16 v12, v38

    move-object/from16 v38, v1

    move-object/from16 v29, v13

    const/4 v1, 0x0

    .end local v1  # "SECONDARY_ZYGOTE_PRELOAD":Ljava/lang/String;
    .end local v13  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .local v29, "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .local v38, "SECONDARY_ZYGOTE_PRELOAD":Ljava/lang/String;
    move-object/from16 v13, v39

    :try_start_316
    invoke-static/range {v8 .. v13}, Lcom/android/server/wm/WindowManagerService;->main(Landroid/content/Context;Lcom/android/server/input/InputManagerService;ZZLcom/android/server/policy/WindowManagerPolicy;Lcom/android/server/wm/ActivityTaskManagerService;)Lcom/android/server/wm/WindowManagerService;

    move-result-object v8
    :try_end_31a
    .catchall {:try_start_316 .. :try_end_31a} :catchall_15e5

    .line 1686
    .end local v16  # "wm":Lcom/android/server/wm/WindowManagerService;
    .local v8, "wm":Lcom/android/server/wm/WindowManagerService;
    :try_start_31a
    const-string/jumbo v9, "window"

    const/16 v10, 0x11

    invoke-static {v9, v8, v1, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;ZI)V

    .line 1688
    const-string/jumbo v9, "input"

    const/4 v10, 0x1

    invoke-static {v9, v3, v1, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;ZI)V

    .line 1690
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1692
    const-string v9, "SetWindowManagerService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1693
    iget-object v9, v7, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v9, v8}, Lcom/android/server/am/ActivityManagerService;->setWindowManager(Lcom/android/server/wm/WindowManagerService;)V

    .line 1694
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1696
    const-string v9, "WindowManagerServiceOnInitReady"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1697
    invoke-virtual {v8}, Lcom/android/server/wm/WindowManagerService;->onInitReady()V

    .line 1698
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1703
    new-instance v9, Lcom/android/server/SystemServer$$ExternalSyntheticLambda6;

    invoke-direct {v9}, Lcom/android/server/SystemServer$$ExternalSyntheticLambda6;-><init>()V

    const-string v11, "StartHidlServices"

    invoke-static {v9, v11}, Lcom/android/server/SystemServerInitThreadPool;->submit(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/util/concurrent/Future;
    :try_end_34e
    .catchall {:try_start_31a .. :try_end_34e} :catchall_15cf

    .line 1710
    if-nez v32, :cond_373

    if-eqz v36, :cond_373

    .line 1711
    :try_start_352
    const-string v9, "StartVrManagerService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1712
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/vr/VrManagerService;

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1713
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V
    :try_end_361
    .catchall {:try_start_352 .. :try_end_361} :catchall_362

    goto :goto_373

    .line 1769
    .end local v38  # "SECONDARY_ZYGOTE_PRELOAD":Ljava/lang/String;
    :catchall_362
    move-exception v0

    move-object/from16 v45, v4

    move-object v1, v6

    move-object/from16 v16, v8

    move-object/from16 v9, v29

    move-object/from16 v10, v35

    move-object/from16 v11, v37

    move-object v4, v0

    move-object v8, v3

    move-object v3, v5

    goto/16 :goto_165b

    .line 1716
    .restart local v38  # "SECONDARY_ZYGOTE_PRELOAD":Ljava/lang/String;
    :cond_373
    :goto_373
    :try_start_373
    const-string v9, "StartInputManager"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1717
    invoke-virtual {v8}, Lcom/android/server/wm/WindowManagerService;->getInputManagerCallback()Lcom/android/server/wm/InputManagerCallback;

    move-result-object v9

    invoke-virtual {v3, v9}, Lcom/android/server/input/InputManagerService;->setWindowManagerCallbacks(Lcom/android/server/input/InputManagerService$WindowManagerCallbacks;)V

    .line 1718
    invoke-virtual {v3}, Lcom/android/server/input/InputManagerService;->start()V

    .line 1719
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1722
    const-string v9, "DisplayManagerWindowManagerAndInputReady"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1723
    iget-object v9, v7, Lcom/android/server/SystemServer;->mDisplayManagerService:Lcom/android/server/display/DisplayManagerService;

    invoke-virtual {v9}, Lcom/android/server/display/DisplayManagerService;->windowManagerAndInputReady()V

    .line 1724
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1726
    iget v9, v7, Lcom/android/server/SystemServer;->mFactoryTestMode:I
    :try_end_394
    .catchall {:try_start_373 .. :try_end_394} :catchall_15cf

    if-ne v9, v10, :cond_39e

    .line 1727
    :try_start_396
    const-string v9, "SystemServer"

    const-string v11, "No Bluetooth Service (factory test)"

    invoke-static {v9, v11}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_39d
    .catchall {:try_start_396 .. :try_end_39d} :catchall_362

    goto :goto_3c1

    .line 1728
    :cond_39e
    :try_start_39e
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    const-string v11, "android.hardware.bluetooth"

    .line 1729
    invoke-virtual {v9, v11}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v9
    :try_end_3a8
    .catchall {:try_start_39e .. :try_end_3a8} :catchall_15cf

    if-nez v9, :cond_3b2

    .line 1730
    :try_start_3aa
    const-string v9, "SystemServer"

    const-string v11, "No Bluetooth Service (Bluetooth Hardware Not Present)"

    invoke-static {v9, v11}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3b1
    .catchall {:try_start_3aa .. :try_end_3b1} :catchall_362

    goto :goto_3c1

    .line 1732
    :cond_3b2
    :try_start_3b2
    const-string v9, "StartBluetoothService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1733
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v11, "com.android.server.bluetooth.BluetoothService"

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1734
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1737
    :goto_3c1
    const-string v9, "IpConnectivityMetrics"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1738
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v11, "com.android.server.connectivity.IpConnectivityMetrics"

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1739
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1741
    const-string v9, "NetworkWatchlistService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1742
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/net/watchlist/NetworkWatchlistService$Lifecycle;

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1743
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1745
    const-string v9, "PinnerService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1746
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/PinnerService;

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1747
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1749
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/ActivityTriggerService;

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1751
    sget-boolean v9, Landroid/os/Build;->IS_DEBUGGABLE:Z
    :try_end_3f7
    .catchall {:try_start_3b2 .. :try_end_3f7} :catchall_15cf

    if-eqz v9, :cond_40e

    :try_start_3f9
    invoke-static {}, Lcom/android/server/profcollect/ProfcollectForwardingService;->enabled()Z

    move-result v9

    if-eqz v9, :cond_40e

    .line 1752
    const-string v9, "ProfcollectForwardingService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1753
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/profcollect/ProfcollectForwardingService;

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1754
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V
    :try_end_40e
    .catchall {:try_start_3f9 .. :try_end_40e} :catchall_362

    .line 1757
    :cond_40e
    :try_start_40e
    const-string v9, "SignedConfigService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1758
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/android/server/signedconfig/SignedConfigService;->registerUpdateReceiver(Landroid/content/Context;)V

    .line 1759
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1761
    const-string v9, "AppIntegrityService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1762
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/integrity/AppIntegrityManagerService;

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1763
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1765
    const-string v9, "StartLogcatManager"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1766
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/logcat/LogcatManagerService;

    invoke-virtual {v9, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1767
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V
    :try_end_439
    .catchall {:try_start_40e .. :try_end_439} :catchall_15cf

    .line 1773
    .end local v38  # "SECONDARY_ZYGOTE_PRELOAD":Ljava/lang/String;
    nop

    .line 1777
    invoke-virtual {v8}, Lcom/android/server/wm/WindowManagerService;->detectSafeMode()Z

    move-result v12

    .line 1778
    .local v12, "safeMode":Z
    if-eqz v12, :cond_44a

    .line 1783
    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string v11, "airplane_mode_on"

    invoke-static {v9, v11, v10}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_460

    .line 1785
    :cond_44a
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v11, 0x1110031

    invoke-virtual {v9, v11}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v9

    if-eqz v9, :cond_460

    .line 1786
    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string v11, "airplane_mode_on"

    invoke-static {v9, v11, v1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1790
    :cond_460
    :goto_460
    const/4 v9, 0x0

    .line 1791
    .local v9, "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    const/4 v11, 0x0

    .line 1792
    .local v11, "notification":Landroid/app/INotificationManager;
    const/4 v13, 0x0

    .line 1793
    .local v13, "countryDetector":Lcom/android/server/CountryDetectorService;
    const/16 v16, 0x0

    .line 1794
    .local v16, "lockSettings":Lcom/android/internal/widget/ILockSettings;
    const/16 v34, 0x0

    .line 1797
    .local v34, "mediaRouter":Lcom/android/server/media/MediaRouterService;
    iget v1, v7, Lcom/android/server/SystemServer;->mFactoryTestMode:I

    if-eq v1, v10, :cond_492

    .line 1798
    const-string v1, "StartInputMethodManagerLifecycle"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1799
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/inputmethod/InputMethodManagerService$Lifecycle;

    invoke-virtual {v1, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1800
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1802
    const-string v1, "StartAccessibilityManagerService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1804
    :try_start_47f
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.accessibility.AccessibilityManagerService$Lifecycle"

    invoke-virtual {v1, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;
    :try_end_486
    .catchall {:try_start_47f .. :try_end_486} :catchall_487

    .line 1807
    goto :goto_48f

    .line 1805
    :catchall_487
    move-exception v0

    move-object v1, v0

    .line 1806
    .local v1, "e":Ljava/lang/Throwable;
    const-string/jumbo v10, "starting Accessibility Manager"

    invoke-direct {v7, v10, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1808
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_48f
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1811
    :cond_492
    const-string v1, "MakeDisplayReady"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1813
    :try_start_497
    invoke-virtual {v8}, Lcom/android/server/wm/WindowManagerService;->displayReady()V
    :try_end_49a
    .catchall {:try_start_497 .. :try_end_49a} :catchall_49b

    .line 1816
    goto :goto_4a3

    .line 1814
    :catchall_49b
    move-exception v0

    move-object v1, v0

    .line 1815
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v10, "making display ready"

    invoke-direct {v7, v10, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1817
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_4a3
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1819
    iget v1, v7, Lcom/android/server/SystemServer;->mFactoryTestMode:I

    const/4 v10, 0x1

    if-eq v1, v10, :cond_4f9

    .line 1820
    const-string v1, "0"

    const-string/jumbo v10, "system_init.startmountservice"

    invoke-static {v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4f9

    .line 1821
    const-string v1, "StartStorageManagerService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1827
    :try_start_4bf
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.StorageManagerService$Lifecycle"

    invoke-virtual {v1, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1828
    const-string/jumbo v1, "mount"

    .line 1829
    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    .line 1828
    invoke-static {v1}, Landroid/os/storage/IStorageManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/storage/IStorageManager;

    move-result-object v1
    :try_end_4d1
    .catchall {:try_start_4bf .. :try_end_4d1} :catchall_4d3

    move-object v2, v1

    .line 1832
    goto :goto_4db

    .line 1830
    :catchall_4d3
    move-exception v0

    move-object v1, v0

    .line 1831
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v10, "starting StorageManagerService"

    invoke-direct {v7, v10, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1833
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_4db
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1835
    const-string v1, "StartStorageStatsService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1837
    :try_start_4e3
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.usage.StorageStatsService$Lifecycle"

    invoke-virtual {v1, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;
    :try_end_4ea
    .catchall {:try_start_4e3 .. :try_end_4ea} :catchall_4eb

    .line 1840
    goto :goto_4f3

    .line 1838
    :catchall_4eb
    move-exception v0

    move-object v1, v0

    .line 1839
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v10, "starting StorageStatsService"

    invoke-direct {v7, v10, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1841
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_4f3
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    move-object/from16 v39, v2

    goto :goto_4fb

    .line 1847
    :cond_4f9
    move-object/from16 v39, v2

    .end local v2  # "storageManager":Landroid/os/storage/IStorageManager;
    .local v39, "storageManager":Landroid/os/storage/IStorageManager;
    :goto_4fb
    const-string v1, "StartUiModeManager"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1848
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/UiModeManagerService;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1849
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1851
    const-string v1, "StartLocaleManagerService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1853
    :try_start_50f
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/locales/LocaleManagerService;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;
    :try_end_516
    .catchall {:try_start_50f .. :try_end_516} :catchall_517

    .line 1856
    goto :goto_51f

    .line 1854
    :catchall_517
    move-exception v0

    move-object v1, v0

    .line 1855
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting LocaleManagerService service"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1857
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_51f
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1860
    iget-boolean v1, v7, Lcom/android/server/SystemServer;->mOnlyCore:Z

    if-nez v1, :cond_55c

    .line 1861
    const-string v1, "UpdatePackagesIfNeeded"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1863
    :try_start_52b
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v1

    const-string v2, "dexopt"

    invoke-virtual {v1, v2}, Lcom/android/server/Watchdog;->pauseWatchingCurrentThread(Ljava/lang/String;)V

    .line 1864
    iget-object v1, v7, Lcom/android/server/SystemServer;->mPackageManagerService:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v1}, Lcom/android/server/pm/PackageManagerService;->updatePackagesIfNeeded()V
    :try_end_539
    .catchall {:try_start_52b .. :try_end_539} :catchall_53a

    goto :goto_542

    .line 1865
    :catchall_53a
    move-exception v0

    move-object v1, v0

    .line 1866
    .restart local v1  # "e":Ljava/lang/Throwable;
    :try_start_53c
    const-string/jumbo v2, "update packages"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_542
    .catchall {:try_start_53c .. :try_end_542} :catchall_550

    .line 1868
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_542
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v1

    const-string v2, "dexopt"

    invoke-virtual {v1, v2}, Lcom/android/server/Watchdog;->resumeWatchingCurrentThread(Ljava/lang/String;)V

    .line 1869
    nop

    .line 1870
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    goto :goto_55c

    .line 1868
    :catchall_550
    move-exception v0

    move-object v1, v0

    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v2

    const-string v10, "dexopt"

    invoke-virtual {v2, v10}, Lcom/android/server/Watchdog;->resumeWatchingCurrentThread(Ljava/lang/String;)V

    .line 1869
    throw v1

    .line 1873
    :cond_55c
    :goto_55c
    const-string v1, "PerformFstrimIfNeeded"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1875
    :try_start_561
    iget-object v1, v7, Lcom/android/server/SystemServer;->mPackageManagerService:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v1}, Lcom/android/server/pm/PackageManagerService;->performFstrimIfNeeded()V
    :try_end_566
    .catchall {:try_start_561 .. :try_end_566} :catchall_567

    .line 1878
    goto :goto_56f

    .line 1876
    :catchall_567
    move-exception v0

    move-object v1, v0

    .line 1877
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "performing fstrim"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1879
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_56f
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1882
    iget v1, v7, Lcom/android/server/SystemServer;->mFactoryTestMode:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_59c

    .line 1883
    const/4 v1, 0x0

    move-object/from16 v44, v1

    move-object/from16 v47, v9

    move-object/from16 v48, v11

    move-object/from16 v43, v13

    move-object/from16 v49, v14

    move-object/from16 v50, v15

    move-object/from16 v51, v16

    move-object/from16 v52, v17

    move-object/from16 v53, v18

    move-object/from16 v54, v20

    move-object/from16 v55, v21

    move-object/from16 v2, v22

    move-object/from16 v1, v23

    move-object/from16 v56, v24

    move-object/from16 v57, v34

    move-object/from16 v46, v41

    move-object/from16 v34, v4

    .local v1, "dpms":Lcom/android/server/devicepolicy/DevicePolicyManagerService$Lifecycle;
    goto/16 :goto_1114

    .line 1885
    .end local v1  # "dpms":Lcom/android/server/devicepolicy/DevicePolicyManagerService$Lifecycle;
    :cond_59c
    const-string v1, "StartLockSettingsService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1887
    :try_start_5a1
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.locksettings.LockSettingsService$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1888
    const-string/jumbo v1, "lock_settings"

    .line 1889
    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    .line 1888
    invoke-static {v1}, Lcom/android/internal/widget/ILockSettings$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/widget/ILockSettings;

    move-result-object v1
    :try_end_5b3
    .catchall {:try_start_5a1 .. :try_end_5b3} :catchall_5b6

    .line 1892
    .end local v16  # "lockSettings":Lcom/android/internal/widget/ILockSettings;
    .local v1, "lockSettings":Lcom/android/internal/widget/ILockSettings;
    move-object/from16 v16, v1

    goto :goto_5be

    .line 1890
    .end local v1  # "lockSettings":Lcom/android/internal/widget/ILockSettings;
    .restart local v16  # "lockSettings":Lcom/android/internal/widget/ILockSettings;
    :catchall_5b6
    move-exception v0

    move-object v1, v0

    .line 1891
    .local v1, "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting LockSettingsService service"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1893
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_5be
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1895
    const-string/jumbo v1, "ro.frp.pst"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    .line 1896
    .local v1, "hasPdb":Z
    if-eqz v1, :cond_5e1

    .line 1897
    const-string v2, "StartPersistentDataBlock"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1898
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/PersistentDataBlockService;

    invoke-virtual {v2, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1899
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1902
    :cond_5e1
    const-string v2, "StartTestHarnessMode"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1903
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/testharness/TestHarnessModeService;

    invoke-virtual {v2, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1904
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1906
    if-nez v1, :cond_5f8

    invoke-static {}, Lcom/android/server/oemlock/OemLockService;->isHalPresent()Z

    move-result v2

    if-eqz v2, :cond_607

    .line 1908
    :cond_5f8
    const-string v2, "StartOemLockService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1909
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/oemlock/OemLockService;

    invoke-virtual {v2, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 1910
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1913
    :cond_607
    const-string v2, "StartDeviceIdleController"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1914
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.DeviceIdleController"

    invoke-virtual {v2, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1915
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1919
    const-string v2, "StartDevicePolicyManager"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1920
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/devicepolicy/DevicePolicyManagerService$Lifecycle;

    invoke-virtual {v2, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    move-result-object v2

    check-cast v2, Lcom/android/server/devicepolicy/DevicePolicyManagerService$Lifecycle;

    .line 1921
    .local v2, "dpms":Lcom/android/server/devicepolicy/DevicePolicyManagerService$Lifecycle;
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1923
    if-nez v32, :cond_64c

    .line 1924
    const-string v10, "StartStatusBarManagerService"

    invoke-virtual {v6, v10}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1927
    :try_start_62f
    new-instance v10, Lcom/lge/server/statusbar/StatusBarManagerServiceEx;

    invoke-direct {v10, v5}, Lcom/lge/server/statusbar/StatusBarManagerServiceEx;-><init>(Landroid/content/Context;)V

    move-object v9, v10

    .line 1928
    const-string/jumbo v10, "statusbar"

    invoke-static {v10, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_63b
    .catchall {:try_start_62f .. :try_end_63b} :catchall_63e

    .line 1931
    move/from16 v43, v1

    goto :goto_648

    .line 1929
    :catchall_63e
    move-exception v0

    move-object v10, v0

    .line 1930
    .local v10, "e":Ljava/lang/Throwable;
    move/from16 v43, v1

    .end local v1  # "hasPdb":Z
    .local v43, "hasPdb":Z
    const-string/jumbo v1, "starting StatusBarManagerService"

    invoke-direct {v7, v1, v10}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1932
    .end local v10  # "e":Ljava/lang/Throwable;
    :goto_648
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    goto :goto_64e

    .line 1923
    .end local v43  # "hasPdb":Z
    .restart local v1  # "hasPdb":Z
    :cond_64c
    move/from16 v43, v1

    .line 1935
    .end local v1  # "hasPdb":Z
    .restart local v43  # "hasPdb":Z
    :goto_64e
    const v1, 0x104023b

    invoke-direct {v7, v5, v1}, Lcom/android/server/SystemServer;->deviceHasConfigString(Landroid/content/Context;I)Z

    move-result v1

    if-eqz v1, :cond_667

    .line 1937
    const-string v1, "StartMusicRecognitionManagerService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1938
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.musicrecognition.MusicRecognitionManagerService"

    invoke-virtual {v1, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1939
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    goto :goto_66e

    .line 1941
    :cond_667
    const-string v1, "SystemServer"

    const-string v10, "MusicRecognitionManagerService not defined by OEM or disabled by flag"

    invoke-static {v1, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1945
    :goto_66e
    invoke-direct {v7, v5, v6}, Lcom/android/server/SystemServer;->startContentCaptureService(Landroid/content/Context;Lcom/android/server/utils/TimingsTraceAndSlog;)V

    .line 1946
    invoke-direct {v7, v5, v6}, Lcom/android/server/SystemServer;->startAttentionService(Landroid/content/Context;Lcom/android/server/utils/TimingsTraceAndSlog;)V

    .line 1947
    invoke-direct {v7, v5, v6}, Lcom/android/server/SystemServer;->startRotationResolverService(Landroid/content/Context;Lcom/android/server/utils/TimingsTraceAndSlog;)V

    .line 1948
    invoke-direct {v7, v5, v6}, Lcom/android/server/SystemServer;->startSystemCaptionsManagerService(Landroid/content/Context;Lcom/android/server/utils/TimingsTraceAndSlog;)V

    .line 1949
    invoke-direct {v7, v5, v6}, Lcom/android/server/SystemServer;->startTextToSpeechManagerService(Landroid/content/Context;Lcom/android/server/utils/TimingsTraceAndSlog;)V

    .line 1950
    invoke-direct/range {p0 .. p1}, Lcom/android/server/SystemServer;->startAmbientContextService(Lcom/android/server/utils/TimingsTraceAndSlog;)V

    .line 1953
    const-string v1, "StartSpeechRecognitionManagerService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1954
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.speech.SpeechRecognitionManagerService"

    invoke-virtual {v1, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1955
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1958
    const v1, 0x104022f

    invoke-direct {v7, v5, v1}, Lcom/android/server/SystemServer;->deviceHasConfigString(Landroid/content/Context;I)Z

    move-result v1

    if-eqz v1, :cond_6a8

    .line 1959
    const-string v1, "StartAppPredictionService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1960
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.appprediction.AppPredictionManagerService"

    invoke-virtual {v1, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1961
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    goto :goto_6af

    .line 1963
    :cond_6a8
    const-string v1, "SystemServer"

    const-string v10, "AppPredictionService not defined by OEM"

    invoke-static {v1, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1967
    :goto_6af
    const v1, 0x1040237

    invoke-direct {v7, v5, v1}, Lcom/android/server/SystemServer;->deviceHasConfigString(Landroid/content/Context;I)Z

    move-result v1

    if-eqz v1, :cond_6c8

    .line 1968
    const-string v1, "StartContentSuggestionsService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1969
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.contentsuggestions.ContentSuggestionsManagerService"

    invoke-virtual {v1, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1970
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    goto :goto_6cf

    .line 1972
    :cond_6c8
    const-string v1, "SystemServer"

    const-string v10, "ContentSuggestionsService not defined by OEM"

    invoke-static {v1, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1977
    :goto_6cf
    const-string v1, "StartSearchUiService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1978
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.searchui.SearchUiManagerService"

    invoke-virtual {v1, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1979
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1983
    const-string v1, "StartSmartspaceService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1984
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.smartspace.SmartspaceManagerService"

    invoke-virtual {v1, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1985
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1989
    const-string v1, "StartCloudSearchService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1990
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.cloudsearch.CloudSearchManagerService"

    invoke-virtual {v1, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 1991
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 1993
    const-string v1, "InitConnectivityModuleConnector"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 1995
    :try_start_701
    invoke-static {}, Landroid/net/ConnectivityModuleConnector;->getInstance()Landroid/net/ConnectivityModuleConnector;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/net/ConnectivityModuleConnector;->init(Landroid/content/Context;)V
    :try_end_708
    .catchall {:try_start_701 .. :try_end_708} :catchall_709

    .line 1998
    goto :goto_711

    .line 1996
    :catchall_709
    move-exception v0

    move-object v1, v0

    .line 1997
    .local v1, "e":Ljava/lang/Throwable;
    const-string/jumbo v10, "initializing ConnectivityModuleConnector"

    invoke-direct {v7, v10, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1999
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_711
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2001
    const-string v1, "InitNetworkStackClient"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2003
    :try_start_719
    invoke-static {}, Landroid/net/NetworkStackClient;->getInstance()Landroid/net/NetworkStackClient;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/NetworkStackClient;->init()V
    :try_end_720
    .catchall {:try_start_719 .. :try_end_720} :catchall_721

    .line 2006
    goto :goto_729

    .line 2004
    :catchall_721
    move-exception v0

    move-object v1, v0

    .line 2005
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v10, "initializing NetworkStackClient"

    invoke-direct {v7, v10, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2007
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_729
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2009
    const-string v1, "StartNetworkManagementService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2011
    :try_start_731
    invoke-static {v5}, Lcom/android/server/NetworkManagementService;->create(Landroid/content/Context;)Lcom/android/server/NetworkManagementService;

    move-result-object v1
    :try_end_735
    .catchall {:try_start_731 .. :try_end_735} :catchall_73f

    .line 2012
    .end local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .local v1, "networkManagement":Lcom/android/server/NetworkManagementService;
    :try_start_735
    const-string/jumbo v10, "network_management"

    invoke-static {v10, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_73b
    .catchall {:try_start_735 .. :try_end_73b} :catchall_73c

    .line 2015
    goto :goto_74d

    .line 2013
    :catchall_73c
    move-exception v0

    move-object v10, v0

    goto :goto_743

    .end local v1  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    :catchall_73f
    move-exception v0

    move-object v10, v0

    move-object/from16 v1, v41

    .line 2014
    .end local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v1  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v10  # "e":Ljava/lang/Throwable;
    :goto_743
    move-object/from16 v41, v1

    .end local v1  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    const-string/jumbo v1, "starting NetworkManagement Service"

    invoke-direct {v7, v1, v10}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object/from16 v1, v41

    .line 2016
    .end local v10  # "e":Ljava/lang/Throwable;
    .end local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v1  # "networkManagement":Lcom/android/server/NetworkManagementService;
    :goto_74d
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2018
    const-string v10, "StartFontManagerService"

    invoke-virtual {v6, v10}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2019
    iget-object v10, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    move-object/from16 v44, v2

    .end local v2  # "dpms":Lcom/android/server/devicepolicy/DevicePolicyManagerService$Lifecycle;
    .local v44, "dpms":Lcom/android/server/devicepolicy/DevicePolicyManagerService$Lifecycle;
    new-instance v2, Lcom/android/server/graphics/fonts/FontManagerService$Lifecycle;

    invoke-direct {v2, v5, v12}, Lcom/android/server/graphics/fonts/FontManagerService$Lifecycle;-><init>(Landroid/content/Context;Z)V

    invoke-virtual {v10, v2}, Lcom/android/server/SystemServiceManager;->startService(Lcom/android/server/SystemService;)V

    .line 2020
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2022
    const-string v2, "StartTextServicesManager"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2023
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/textservices/TextServicesManagerService$Lifecycle;

    invoke-virtual {v2, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2024
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2026
    if-nez v25, :cond_784

    .line 2027
    const-string v2, "StartTextClassificationManagerService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2028
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/textclassifier/TextClassificationManagerService$Lifecycle;

    .line 2029
    invoke-virtual {v2, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2030
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2033
    :cond_784
    const-string v2, "StartNetworkScoreService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2034
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/NetworkScoreService$Lifecycle;

    invoke-virtual {v2, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2035
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2037
    const-string v2, "StartNetworkStatsService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2040
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v10, "com.android.server.NetworkStatsServiceInitializer"

    move-object/from16 v45, v4

    .end local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .local v45, "vpnManager":Lcom/android/server/VpnManagerService;
    const-string v4, "/apex/com.android.tethering/javalib/service-connectivity.jar"

    invoke-virtual {v2, v10, v4}, Lcom/android/server/SystemServiceManager;->startServiceFromJar(Ljava/lang/String;Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2042
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2044
    const-string v2, "StartNetworkPolicyManagerService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2046
    :try_start_7ab
    new-instance v2, Lcom/android/server/net/NetworkPolicyManagerService;

    iget-object v4, v7, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    invoke-direct {v2, v5, v4, v1}, Lcom/android/server/net/NetworkPolicyManagerService;-><init>(Landroid/content/Context;Landroid/app/IActivityManager;Landroid/os/INetworkManagementService;)V

    move-object v15, v2

    .line 2048
    const-string/jumbo v2, "netpolicy"

    invoke-static {v2, v15}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_7b9
    .catchall {:try_start_7ab .. :try_end_7b9} :catchall_7ba

    .line 2051
    goto :goto_7c2

    .line 2049
    :catchall_7ba
    move-exception v0

    move-object v2, v0

    .line 2050
    .local v2, "e":Ljava/lang/Throwable;
    const-string/jumbo v4, "starting NetworkPolicy Service"

    invoke-direct {v7, v4, v2}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2052
    .end local v2  # "e":Ljava/lang/Throwable;
    :goto_7c2
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2054
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const-string v4, "android.hardware.wifi"

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7f3

    .line 2057
    const-string v2, "StartWifi"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2058
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.wifi.WifiService"

    const-string v10, "/apex/com.android.wifi/javalib/service-wifi.jar"

    invoke-virtual {v2, v4, v10}, Lcom/android/server/SystemServiceManager;->startServiceFromJar(Ljava/lang/String;Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2060
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2061
    const-string v2, "StartWifiScanning"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2062
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.wifi.scanner.WifiScanningService"

    const-string v10, "/apex/com.android.wifi/javalib/service-wifi.jar"

    invoke-virtual {v2, v4, v10}, Lcom/android/server/SystemServiceManager;->startServiceFromJar(Ljava/lang/String;Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2064
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2067
    :cond_7f3
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const-string v4, "android.hardware.wifi.rtt"

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_810

    .line 2069
    const-string v2, "StartRttService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2070
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.wifi.rtt.RttService"

    const-string v10, "/apex/com.android.wifi/javalib/service-wifi.jar"

    invoke-virtual {v2, v4, v10}, Lcom/android/server/SystemServiceManager;->startServiceFromJar(Ljava/lang/String;Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2072
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2075
    :cond_810
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const-string v4, "android.hardware.wifi.aware"

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_82d

    .line 2077
    const-string v2, "StartWifiAware"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2078
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.wifi.aware.WifiAwareService"

    const-string v10, "/apex/com.android.wifi/javalib/service-wifi.jar"

    invoke-virtual {v2, v4, v10}, Lcom/android/server/SystemServiceManager;->startServiceFromJar(Ljava/lang/String;Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2080
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2083
    :cond_82d
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const-string v4, "android.hardware.wifi.direct"

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_84a

    .line 2085
    const-string v2, "StartWifiP2P"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2086
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.wifi.p2p.WifiP2pService"

    const-string v10, "/apex/com.android.wifi/javalib/service-wifi.jar"

    invoke-virtual {v2, v4, v10}, Lcom/android/server/SystemServiceManager;->startServiceFromJar(Ljava/lang/String;Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2088
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2091
    :cond_84a
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const-string v4, "android.hardware.lowpan"

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_865

    .line 2093
    const-string v2, "StartLowpan"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2094
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.lowpan.LowpanService"

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2095
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2098
    :cond_865
    const-string v2, "StartPacProxyService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2100
    :try_start_86a
    new-instance v2, Lcom/android/server/connectivity/PacProxyService;

    invoke-direct {v2, v5}, Lcom/android/server/connectivity/PacProxyService;-><init>(Landroid/content/Context;)V
    :try_end_86f
    .catchall {:try_start_86a .. :try_end_86f} :catchall_87d

    .line 2101
    .end local v21  # "pacProxyService":Lcom/android/server/connectivity/PacProxyService;
    .local v2, "pacProxyService":Lcom/android/server/connectivity/PacProxyService;
    :try_start_86f
    const-string/jumbo v4, "pac_proxy"

    invoke-static {v4, v2}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_875
    .catchall {:try_start_86f .. :try_end_875} :catchall_878

    .line 2104
    move-object/from16 v21, v2

    goto :goto_885

    .line 2102
    :catchall_878
    move-exception v0

    move-object/from16 v21, v2

    move-object v2, v0

    goto :goto_87f

    .end local v2  # "pacProxyService":Lcom/android/server/connectivity/PacProxyService;
    .restart local v21  # "pacProxyService":Lcom/android/server/connectivity/PacProxyService;
    :catchall_87d
    move-exception v0

    move-object v2, v0

    .line 2103
    .local v2, "e":Ljava/lang/Throwable;
    :goto_87f
    const-string/jumbo v4, "starting PacProxyService"

    invoke-direct {v7, v4, v2}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2105
    .end local v2  # "e":Ljava/lang/Throwable;
    :goto_885
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2107
    const-string v2, "StartConnectivityService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2111
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.ConnectivityServiceInitializer"

    const-string v10, "/apex/com.android.tethering/javalib/service-connectivity.jar"

    invoke-virtual {v2, v4, v10}, Lcom/android/server/SystemServiceManager;->startServiceFromJar(Ljava/lang/String;Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2113
    invoke-virtual {v15}, Lcom/android/server/net/NetworkPolicyManagerService;->bindConnectivityManager()V

    .line 2114
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2116
    const-string v2, "StartVpnManagerService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2118
    :try_start_8a1
    invoke-static {v5}, Lcom/android/server/VpnManagerService;->create(Landroid/content/Context;)Lcom/android/server/VpnManagerService;

    move-result-object v2
    :try_end_8a5
    .catchall {:try_start_8a1 .. :try_end_8a5} :catchall_8b0

    move-object v4, v2

    .line 2119
    .end local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    :try_start_8a6
    const-string/jumbo v2, "vpn_management"

    invoke-static {v2, v4}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_8ac
    .catchall {:try_start_8a6 .. :try_end_8ac} :catchall_8ad

    .line 2122
    goto :goto_8ba

    .line 2120
    :catchall_8ad
    move-exception v0

    move-object v2, v0

    goto :goto_8b4

    .end local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    :catchall_8b0
    move-exception v0

    move-object v2, v0

    move-object/from16 v4, v45

    .line 2121
    .end local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v2  # "e":Ljava/lang/Throwable;
    .restart local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    :goto_8b4
    const-string/jumbo v10, "starting VPN Manager Service"

    invoke-direct {v7, v10, v2}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2123
    .end local v2  # "e":Ljava/lang/Throwable;
    :goto_8ba
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2125
    const-string v2, "StartVcnManagementService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2127
    :try_start_8c2
    invoke-static {v5}, Lcom/android/server/VcnManagementService;->create(Landroid/content/Context;)Lcom/android/server/VcnManagementService;

    move-result-object v2

    move-object v14, v2

    .line 2128
    const-string/jumbo v2, "vcn_management"

    invoke-static {v2, v14}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_8cd
    .catchall {:try_start_8c2 .. :try_end_8cd} :catchall_8ce

    .line 2131
    goto :goto_8d6

    .line 2129
    :catchall_8ce
    move-exception v0

    move-object v2, v0

    .line 2130
    .restart local v2  # "e":Ljava/lang/Throwable;
    const-string/jumbo v10, "starting VCN Management Service"

    invoke-direct {v7, v10, v2}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2132
    .end local v2  # "e":Ljava/lang/Throwable;
    :goto_8d6
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2134
    if-eqz v31, :cond_979

    .line 2136
    :try_start_8db
    const-string v2, "SystemServer"

    const-string v10, "Wigig Service"

    invoke-static {v2, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2137
    const-string v2, "/system/system_ext/framework/wigig-service.jar:/system/system_ext/framework/vendor.qti.hardware.wigig.supptunnel-V1.0-java.jar:/system/system_ext/framework/vendor.qti.hardware.wigig.netperftuner-V1.0-java.jar:/system/system_ext/framework/vendor.qti.hardware.capabilityconfigstore-V1.0-java.jar"

    .line 2142
    .local v2, "wigigClassPath":Ljava/lang/String;
    new-instance v10, Ldalvik/system/PathClassLoader;

    .line 2143
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v41
    :try_end_8ea
    .catchall {:try_start_8db .. :try_end_8ea} :catchall_96a

    move-object/from16 v46, v1

    .end local v1  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .local v46, "networkManagement":Lcom/android/server/NetworkManagementService;
    :try_start_8ec
    invoke-virtual/range {v41 .. v41}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-direct {v10, v2, v1}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    move-object v1, v10

    .line 2144
    .local v1, "wigigClassLoader":Ldalvik/system/PathClassLoader;
    const-string v10, "com.qualcomm.qti.server.wigig.p2p.WigigP2pServiceImpl"

    invoke-virtual {v1, v10}, Ldalvik/system/PathClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10
    :try_end_8fa
    .catchall {:try_start_8ec .. :try_end_8fa} :catchall_963

    .line 2146
    .local v10, "wigigP2pClass":Ljava/lang/Class;
    move-object/from16 v41, v2

    move-object/from16 v45, v4

    const/4 v2, 0x1

    .end local v2  # "wigigClassPath":Ljava/lang/String;
    .end local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .local v41, "wigigClassPath":Ljava/lang/String;
    .restart local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    :try_start_8ff
    new-array v4, v2, [Ljava/lang/Class;

    const-class v2, Landroid/content/Context;

    const/16 v38, 0x0

    aput-object v2, v4, v38

    invoke-virtual {v10, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2
    :try_end_90b
    .catchall {:try_start_8ff .. :try_end_90b} :catchall_95e

    .line 2147
    .local v2, "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<Ljava/lang/Class;>;"
    move-object/from16 v47, v9

    const/4 v4, 0x1

    .end local v9  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    .local v47, "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    :try_start_90e
    new-array v9, v4, [Ljava/lang/Object;

    aput-object v5, v9, v38

    invoke-virtual {v2, v9}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v22, v4

    .line 2148
    const-string v4, "SystemServer"

    const-string v9, "Successfully loaded WigigP2pServiceImpl class"

    invoke-static {v4, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2149
    const-string/jumbo v4, "wigigp2p"

    move-object/from16 v9, v22

    check-cast v9, Landroid/os/IBinder;

    invoke-static {v4, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 2151
    const-string v4, "com.qualcomm.qti.server.wigig.WigigService"

    invoke-virtual {v1, v4}, Ldalvik/system/PathClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 2153
    .local v4, "wigigClass":Ljava/lang/Class;
    move-object/from16 v48, v1

    const/4 v9, 0x1

    .end local v1  # "wigigClassLoader":Ldalvik/system/PathClassLoader;
    .local v48, "wigigClassLoader":Ldalvik/system/PathClassLoader;
    new-array v1, v9, [Ljava/lang/Class;

    const-class v9, Landroid/content/Context;

    const/16 v38, 0x0

    aput-object v9, v1, v38

    invoke-virtual {v4, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 2154
    .end local v2  # "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<Ljava/lang/Class;>;"
    .local v1, "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<Ljava/lang/Class;>;"
    const/4 v2, 0x1

    new-array v9, v2, [Ljava/lang/Object;

    aput-object v5, v9, v38

    invoke-virtual {v1, v9}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v23, v2

    .line 2155
    const-string v2, "SystemServer"

    const-string v9, "Successfully loaded WigigService class"

    invoke-static {v2, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2156
    const-string/jumbo v2, "wigig"

    move-object/from16 v9, v23

    check-cast v9, Landroid/os/IBinder;

    invoke-static {v2, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_95a
    .catchall {:try_start_90e .. :try_end_95a} :catchall_95b

    .line 2159
    .end local v1  # "ctor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<Ljava/lang/Class;>;"
    .end local v4  # "wigigClass":Ljava/lang/Class;
    .end local v10  # "wigigP2pClass":Ljava/lang/Class;
    .end local v41  # "wigigClassPath":Ljava/lang/String;
    .end local v48  # "wigigClassLoader":Ldalvik/system/PathClassLoader;
    goto :goto_97f

    .line 2157
    :catchall_95b
    move-exception v0

    move-object v1, v0

    goto :goto_972

    .end local v47  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    .restart local v9  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    :catchall_95e
    move-exception v0

    move-object/from16 v47, v9

    move-object v1, v0

    .end local v9  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    .restart local v47  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    goto :goto_972

    .end local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v47  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    .local v4, "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v9  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    :catchall_963
    move-exception v0

    move-object/from16 v45, v4

    move-object/from16 v47, v9

    move-object v1, v0

    .end local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v9  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    .restart local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v47  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    goto :goto_972

    .end local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v46  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .end local v47  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    .local v1, "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v9  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    :catchall_96a
    move-exception v0

    move-object/from16 v46, v1

    move-object/from16 v45, v4

    move-object/from16 v47, v9

    move-object v1, v0

    .line 2158
    .end local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v9  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    .local v1, "e":Ljava/lang/Throwable;
    .restart local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v46  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v47  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    :goto_972
    const-string/jumbo v2, "starting WigigService"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_97f

    .line 2134
    .end local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v46  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .end local v47  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    .local v1, "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v9  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    :cond_979
    move-object/from16 v46, v1

    move-object/from16 v45, v4

    move-object/from16 v47, v9

    .line 2163
    .end local v1  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .end local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v9  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    .restart local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v46  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v47  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    :goto_97f
    const-string v1, "Start WifiSapService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2165
    :try_start_984
    const-string v1, "SystemServer"

    const-string v2, "adding WifiSapService"

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2166
    new-instance v1, Lcom/lge/wifi/impl/wifiSap/WifiSapService;

    invoke-direct {v1, v5}, Lcom/lge/wifi/impl/wifiSap/WifiSapService;-><init>(Landroid/content/Context;)V
    :try_end_990
    .catchall {:try_start_984 .. :try_end_990} :catchall_99e

    .line 2167
    .end local v24  # "wifisapservice":Lcom/lge/wifi/impl/wifiSap/WifiSapService;
    .local v1, "wifisapservice":Lcom/lge/wifi/impl/wifiSap/WifiSapService;
    :try_start_990
    const-string/jumbo v2, "wifiSapService"

    invoke-static {v2, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_996
    .catchall {:try_start_990 .. :try_end_996} :catchall_999

    .line 2170
    move-object/from16 v24, v1

    goto :goto_9a6

    .line 2168
    :catchall_999
    move-exception v0

    move-object/from16 v24, v1

    move-object v1, v0

    goto :goto_9a0

    .end local v1  # "wifisapservice":Lcom/lge/wifi/impl/wifiSap/WifiSapService;
    .restart local v24  # "wifisapservice":Lcom/lge/wifi/impl/wifiSap/WifiSapService;
    :catchall_99e
    move-exception v0

    move-object v1, v0

    .line 2169
    .local v1, "e":Ljava/lang/Throwable;
    :goto_9a0
    const-string/jumbo v2, "starting WifiSapService"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2171
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_9a6
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2174
    const-string v1, "StartSystemUpdateManagerService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2176
    :try_start_9ae
    const-string/jumbo v1, "system_update"

    new-instance v2, Lcom/android/server/SystemUpdateManagerService;

    invoke-direct {v2, v5}, Lcom/android/server/SystemUpdateManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_9b9
    .catchall {:try_start_9ae .. :try_end_9b9} :catchall_9ba

    .line 2180
    goto :goto_9c2

    .line 2178
    :catchall_9ba
    move-exception v0

    move-object v1, v0

    .line 2179
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting SystemUpdateManagerService"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2181
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_9c2
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2183
    const-string v1, "StartUpdateLockService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2185
    :try_start_9ca
    const-string/jumbo v1, "updatelock"

    new-instance v2, Lcom/android/server/UpdateLockService;

    invoke-direct {v2, v5}, Lcom/android/server/UpdateLockService;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_9d5
    .catchall {:try_start_9ca .. :try_end_9d5} :catchall_9d6

    .line 2189
    goto :goto_9de

    .line 2187
    :catchall_9d6
    move-exception v0

    move-object v1, v0

    .line 2188
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting UpdateLockService"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2190
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_9de
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2192
    const-string v1, "StartLGEncryptionService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2194
    :try_start_9e6
    const-string v1, "SystemServer"

    const-string v2, "LG Encryption Service"

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2195
    const-string v1, "encryption"

    new-instance v2, Lcom/android/server/LGEncryptionService;

    invoke-direct {v2, v5}, Lcom/android/server/LGEncryptionService;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_9f7
    .catchall {:try_start_9e6 .. :try_end_9f7} :catchall_9f8

    .line 2198
    goto :goto_a00

    .line 2196
    :catchall_9f8
    move-exception v0

    move-object v1, v0

    .line 2197
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting LGEncryptionService"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2199
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_a00
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2201
    const-string v1, "StartNotificationManager"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2203
    :try_start_a08
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/notification/NotificationManagerServiceEx;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;
    :try_end_a0f
    .catch Ljava/lang/RuntimeException; {:try_start_a08 .. :try_end_a0f} :catch_a10

    .line 2207
    goto :goto_a20

    .line 2204
    :catch_a10
    move-exception v0

    move-object v1, v0

    .line 2205
    .local v1, "e":Ljava/lang/RuntimeException;
    const-string v2, "SystemServer"

    const-string v4, "Failed to create NotificationManagerServiceEx"

    invoke-static {v2, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2206
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v4, Lcom/android/server/notification/NotificationManagerService;

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2208
    .end local v1  # "e":Ljava/lang/RuntimeException;
    :goto_a20
    invoke-static {v5}, Lcom/android/internal/notification/SystemNotificationChannels;->removeDeprecated(Landroid/content/Context;)V

    .line 2209
    invoke-static {v5}, Lcom/android/internal/notification/SystemNotificationChannels;->createAll(Landroid/content/Context;)V

    .line 2210
    const-string/jumbo v1, "notification"

    .line 2211
    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    .line 2210
    invoke-static {v1}, Landroid/app/INotificationManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/app/INotificationManager;

    move-result-object v11

    .line 2212
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2214
    const-string v1, "StartDeviceMonitor"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2215
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/storage/DeviceStorageMonitorService;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2216
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2218
    const-string v1, "StartLocationManagerService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2219
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/location/LocationManagerService$Lifecycle;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2220
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2222
    const-string v1, "StartCountryDetectorService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2224
    :try_start_a57
    new-instance v1, Lcom/android/server/CountryDetectorService;

    invoke-direct {v1, v5}, Lcom/android/server/CountryDetectorService;-><init>(Landroid/content/Context;)V

    move-object v13, v1

    .line 2225
    const-string v1, "country_detector"

    invoke-static {v1, v13}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_a62
    .catchall {:try_start_a57 .. :try_end_a62} :catchall_a63

    .line 2228
    goto :goto_a6b

    .line 2226
    :catchall_a63
    move-exception v0

    move-object v1, v0

    .line 2227
    .local v1, "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting Country Detector"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2229
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_a6b
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2231
    const-string v1, "StartTimeDetectorService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2233
    :try_start_a73
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.timedetector.TimeDetectorService$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;
    :try_end_a7a
    .catchall {:try_start_a73 .. :try_end_a7a} :catchall_a7b

    .line 2236
    goto :goto_a83

    .line 2234
    :catchall_a7b
    move-exception v0

    move-object v1, v0

    .line 2235
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting TimeDetectorService service"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2237
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_a83
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2239
    const-string v1, "StartTimeZoneDetectorService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2241
    :try_start_a8b
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.timezonedetector.TimeZoneDetectorService$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;
    :try_end_a92
    .catchall {:try_start_a8b .. :try_end_a92} :catchall_a93

    .line 2244
    goto :goto_a9b

    .line 2242
    :catchall_a93
    move-exception v0

    move-object v1, v0

    .line 2243
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting TimeZoneDetectorService service"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2245
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_a9b
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2247
    const-string v1, "StartLocationTimeZoneManagerService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2249
    :try_start_aa3
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.timezonedetector.location.LocationTimeZoneManagerService$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;
    :try_end_aaa
    .catchall {:try_start_aa3 .. :try_end_aaa} :catchall_aab

    .line 2252
    goto :goto_ab3

    .line 2250
    :catchall_aab
    move-exception v0

    move-object v1, v0

    .line 2251
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting LocationTimeZoneManagerService service"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2253
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_ab3
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2255
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1110134

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    if-eqz v1, :cond_adb

    .line 2256
    const-string v1, "StartGnssTimeUpdateService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2258
    :try_start_ac8
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.timedetector.GnssTimeUpdateService$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;
    :try_end_acf
    .catchall {:try_start_ac8 .. :try_end_acf} :catchall_ad0

    .line 2261
    goto :goto_ad8

    .line 2259
    :catchall_ad0
    move-exception v0

    move-object v1, v0

    .line 2260
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting GnssTimeUpdateService service"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2262
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_ad8
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2265
    :cond_adb
    if-nez v32, :cond_af5

    .line 2266
    const-string v1, "StartSearchManagerService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2268
    :try_start_ae2
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.search.SearchManagerService$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;
    :try_end_ae9
    .catchall {:try_start_ae2 .. :try_end_ae9} :catchall_aea

    .line 2271
    goto :goto_af2

    .line 2269
    :catchall_aea
    move-exception v0

    move-object v1, v0

    .line 2270
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting Search Service"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2272
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_af2
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2275
    :cond_af5
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1110144

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    if-eqz v1, :cond_b12

    .line 2276
    const-string v1, "StartWallpaperManagerService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2277
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.wallpaper.WallpaperManagerService$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2278
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    goto :goto_b19

    .line 2280
    :cond_b12
    const-string v1, "SystemServer"

    const-string v2, "Wallpaper service disabled by config"

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2286
    :goto_b19
    const-string v1, "StartWallpaperEffectsGenerationService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2287
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.wallpapereffectsgeneration.WallpaperEffectsGenerationManagerService"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2289
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2291
    const-string v1, "StartAudioService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2292
    if-nez v33, :cond_b37

    .line 2293
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/audio/AudioService$Lifecycle;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    goto :goto_b74

    .line 2295
    :cond_b37
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1040254

    .line 2296
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 2298
    .local v1, "className":Ljava/lang/String;
    :try_start_b42
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v9, "$Lifecycle"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;
    :try_end_b5a
    .catchall {:try_start_b42 .. :try_end_b5a} :catchall_b5b

    .line 2301
    goto :goto_b74

    .line 2299
    :catchall_b5b
    move-exception v0

    move-object v2, v0

    .line 2300
    .local v2, "e":Ljava/lang/Throwable;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "starting "

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v7, v4, v2}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2303
    .end local v1  # "className":Ljava/lang/String;
    .end local v2  # "e":Ljava/lang/Throwable;
    :goto_b74
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2305
    const-string v1, "StartSoundTriggerMiddlewareService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2306
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/soundtrigger_middleware/SoundTriggerMiddlewareService$Lifecycle;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2307
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2309
    iget-object v1, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v2, "android.hardware.broadcastradio"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b9f

    .line 2310
    const-string v1, "StartBroadcastRadioService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2311
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/broadcastradio/BroadcastRadioService;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2312
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2315
    :cond_b9f
    const-string v1, "StartDockObserver"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2316
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/DockObserver;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2317
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2319
    if-eqz v32, :cond_bbf

    .line 2320
    const-string v1, "StartThermalObserver"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2321
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.google.android.clockwork.ThermalObserver"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2322
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2325
    :cond_bbf
    if-nez v32, :cond_bda

    .line 2326
    const-string v1, "StartWiredAccessoryManager"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2329
    :try_start_bc6
    new-instance v1, Lcom/android/server/WiredAccessoryManager;

    invoke-direct {v1, v5, v3}, Lcom/android/server/WiredAccessoryManager;-><init>(Landroid/content/Context;Lcom/android/server/input/InputManagerService;)V

    invoke-virtual {v3, v1}, Lcom/android/server/input/InputManagerService;->setWiredAccessoryCallbacks(Lcom/android/server/input/InputManagerService$WiredAccessoryCallbacks;)V
    :try_end_bce
    .catchall {:try_start_bc6 .. :try_end_bce} :catchall_bcf

    .line 2333
    goto :goto_bd7

    .line 2331
    :catchall_bcf
    move-exception v0

    move-object v1, v0

    .line 2332
    .local v1, "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting WiredAccessoryManager"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2334
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_bd7
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2337
    :cond_bda
    iget-object v1, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v2, "android.software.midi"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_bf3

    .line 2339
    const-string v1, "StartMidiManager"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2340
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.midi.MidiService$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2341
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2345
    :cond_bf3
    const-string v1, "StartAdbService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2347
    :try_start_bf8
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.adb.AdbService$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;
    :try_end_bff
    .catchall {:try_start_bf8 .. :try_end_bff} :catchall_c00

    .line 2350
    goto :goto_c09

    .line 2348
    :catchall_c00
    move-exception v0

    move-object v1, v0

    .line 2349
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string v2, "SystemServer"

    const-string v4, "Failure starting AdbService"

    invoke-static {v2, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2351
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_c09
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2353
    iget-object v1, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v2, "android.hardware.usb.host"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_c22

    iget-object v1, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v2, "android.hardware.usb.accessory"

    .line 2354
    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_c22

    if-eqz v30, :cond_c31

    .line 2358
    :cond_c22
    const-string v1, "StartUsbService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2359
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.usb.UsbService$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2360
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2363
    :cond_c31
    if-nez v32, :cond_c59

    .line 2364
    const-string v1, "StartSerialService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2367
    :try_start_c38
    new-instance v1, Lcom/android/server/SerialService;

    invoke-direct {v1, v5}, Lcom/android/server/SerialService;-><init>(Landroid/content/Context;)V
    :try_end_c3d
    .catchall {:try_start_c38 .. :try_end_c3d} :catchall_c49

    .line 2368
    .end local v17  # "serial":Lcom/android/server/SerialService;
    .local v1, "serial":Lcom/android/server/SerialService;
    :try_start_c3d
    const-string/jumbo v2, "serial"

    invoke-static {v2, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_c43
    .catchall {:try_start_c3d .. :try_end_c43} :catchall_c44

    .line 2371
    goto :goto_c54

    .line 2369
    :catchall_c44
    move-exception v0

    move-object/from16 v17, v1

    move-object v1, v0

    goto :goto_c4b

    .end local v1  # "serial":Lcom/android/server/SerialService;
    .restart local v17  # "serial":Lcom/android/server/SerialService;
    :catchall_c49
    move-exception v0

    move-object v1, v0

    .line 2370
    .local v1, "e":Ljava/lang/Throwable;
    :goto_c4b
    const-string v2, "SystemServer"

    const-string v4, "Failure starting SerialService"

    invoke-static {v2, v4, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object/from16 v1, v17

    .line 2372
    .end local v17  # "serial":Lcom/android/server/SerialService;
    .local v1, "serial":Lcom/android/server/SerialService;
    :goto_c54
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    move-object/from16 v17, v1

    .line 2375
    .end local v1  # "serial":Lcom/android/server/SerialService;
    .restart local v17  # "serial":Lcom/android/server/SerialService;
    :cond_c59
    const-string v1, "StartHardwarePropertiesManagerService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2377
    :try_start_c5e
    new-instance v1, Lcom/android/server/HardwarePropertiesManagerService;

    invoke-direct {v1, v5}, Lcom/android/server/HardwarePropertiesManagerService;-><init>(Landroid/content/Context;)V
    :try_end_c63
    .catchall {:try_start_c5e .. :try_end_c63} :catchall_c71

    .line 2378
    .end local v20  # "hardwarePropertiesService":Lcom/android/server/HardwarePropertiesManagerService;
    .local v1, "hardwarePropertiesService":Lcom/android/server/HardwarePropertiesManagerService;
    :try_start_c63
    const-string/jumbo v2, "hardware_properties"

    invoke-static {v2, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_c69
    .catchall {:try_start_c63 .. :try_end_c69} :catchall_c6c

    .line 2382
    move-object/from16 v20, v1

    goto :goto_c7a

    .line 2380
    :catchall_c6c
    move-exception v0

    move-object/from16 v20, v1

    move-object v1, v0

    goto :goto_c73

    .end local v1  # "hardwarePropertiesService":Lcom/android/server/HardwarePropertiesManagerService;
    .restart local v20  # "hardwarePropertiesService":Lcom/android/server/HardwarePropertiesManagerService;
    :catchall_c71
    move-exception v0

    move-object v1, v0

    .line 2381
    .local v1, "e":Ljava/lang/Throwable;
    :goto_c73
    const-string v2, "SystemServer"

    const-string v4, "Failure starting HardwarePropertiesManagerService"

    invoke-static {v2, v4, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2383
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_c7a
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2385
    if-nez v32, :cond_c8e

    .line 2386
    const-string v1, "StartTwilightService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2387
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/twilight/TwilightService;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2388
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2391
    :cond_c8e
    const-string v1, "StartColorDisplay"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2392
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/display/color/ColorDisplayService;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2393
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2396
    const-string v1, "StartJobScheduler"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2397
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.job.JobSchedulerService"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2398
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2400
    const-string v1, "StartSoundTrigger"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2401
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/soundtrigger/SoundTriggerService;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2402
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2404
    const-string v1, "StartTrustManager"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2405
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/trust/TrustManagerService;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2406
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2408
    iget-object v1, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v2, "android.software.backup"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ce3

    .line 2409
    const-string v1, "StartBackupManager"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2410
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.backup.BackupManagerService$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2411
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2414
    :cond_ce3
    iget-object v1, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v2, "android.software.app_widgets"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_cfa

    .line 2415
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x111012a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    if-eqz v1, :cond_d09

    .line 2416
    :cond_cfa
    const-string v1, "StartAppWidgetService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2417
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.appwidget.AppWidgetService"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2418
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2425
    :cond_d09
    const-string v1, "StartVoiceRecognitionManager"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2426
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.voiceinteraction.VoiceInteractionManagerService"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2427
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2429
    const-string v1, "StartAppHibernationService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2430
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.apphibernation.AppHibernationService"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2431
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2433
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1}, Lcom/android/server/GestureLauncherService;->isGestureLauncherEnabled(Landroid/content/res/Resources;)Z

    move-result v1

    if-eqz v1, :cond_d40

    .line 2434
    const-string v1, "StartGestureLauncher"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2435
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/GestureLauncherService;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2436
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2438
    :cond_d40
    const-string v1, "StartSensorNotification"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2439
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/SensorNotificationService;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2440
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2442
    iget-object v1, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v2, "android.hardware.context_hub"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d68

    .line 2443
    const-string v1, "StartContextHubSystemService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2444
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v2, Lcom/android/server/ContextHubSystemService;

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2445
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2448
    :cond_d68
    const-string v1, "StartDiskStatsService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2450
    :try_start_d6d
    const-string v1, "diskstats"

    new-instance v2, Lcom/android/server/DiskStatsService;

    invoke-direct {v2, v5}, Lcom/android/server/DiskStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_d77
    .catchall {:try_start_d6d .. :try_end_d77} :catchall_d78

    .line 2453
    goto :goto_d80

    .line 2451
    :catchall_d78
    move-exception v0

    move-object v1, v0

    .line 2452
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting DiskStats Service"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2454
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_d80
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2456
    const-string v1, "RuntimeService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2458
    :try_start_d88
    const-string/jumbo v1, "runtime"

    new-instance v2, Lcom/android/server/RuntimeService;

    invoke-direct {v2, v5}, Lcom/android/server/RuntimeService;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_d93
    .catchall {:try_start_d88 .. :try_end_d93} :catchall_d94

    .line 2461
    goto :goto_d9c

    .line 2459
    :catchall_d94
    move-exception v0

    move-object v1, v0

    .line 2460
    .restart local v1  # "e":Ljava/lang/Throwable;
    const-string/jumbo v2, "starting RuntimeService"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2462
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_d9c
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2468
    iget-boolean v1, v7, Lcom/android/server/SystemServer;->mOnlyCore:Z

    if-nez v1, :cond_db2

    .line 2469
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1110143

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    if-eqz v1, :cond_db2

    const/4 v1, 0x1

    goto :goto_db3

    :cond_db2
    const/4 v1, 0x0

    .line 2471
    .local v1, "startRulesManagerService":Z
    :goto_db3
    if-eqz v1, :cond_dc4

    .line 2472
    const-string v2, "StartTimeZoneRulesManagerService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2473
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.timezone.RulesManagerService$Lifecycle"

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2474
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2477
    :cond_dc4
    if-nez v32, :cond_ded

    if-nez v26, :cond_ded

    .line 2478
    const-string v2, "StartNetworkTimeUpdateService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2480
    :try_start_dcd
    new-instance v2, Lcom/android/server/NetworkTimeUpdateService;

    invoke-direct {v2, v5}, Lcom/android/server/NetworkTimeUpdateService;-><init>(Landroid/content/Context;)V
    :try_end_dd2
    .catchall {:try_start_dcd .. :try_end_dd2} :catchall_dde

    .line 2481
    .end local v18  # "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    .local v2, "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    :try_start_dd2
    const-string/jumbo v4, "network_time_update_service"

    invoke-static {v4, v2}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_dd8
    .catchall {:try_start_dd2 .. :try_end_dd8} :catchall_dd9

    .line 2484
    goto :goto_de8

    .line 2482
    :catchall_dd9
    move-exception v0

    move-object/from16 v18, v2

    move-object v2, v0

    goto :goto_de0

    .end local v2  # "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    .restart local v18  # "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    :catchall_dde
    move-exception v0

    move-object v2, v0

    .line 2483
    .local v2, "e":Ljava/lang/Throwable;
    :goto_de0
    const-string/jumbo v4, "starting NetworkTimeUpdate service"

    invoke-direct {v7, v4, v2}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object/from16 v2, v18

    .line 2485
    .end local v18  # "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    .local v2, "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    :goto_de8
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    move-object/from16 v18, v2

    .line 2488
    .end local v2  # "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    .restart local v18  # "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    :cond_ded
    const-string v2, "CertBlacklister"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2490
    :try_start_df2
    new-instance v2, Lcom/android/server/CertBlacklister;

    invoke-direct {v2, v5}, Lcom/android/server/CertBlacklister;-><init>(Landroid/content/Context;)V
    :try_end_df7
    .catchall {:try_start_df2 .. :try_end_df7} :catchall_df8

    .line 2493
    goto :goto_e00

    .line 2491
    :catchall_df8
    move-exception v0

    move-object v2, v0

    .line 2492
    .local v2, "e":Ljava/lang/Throwable;
    const-string/jumbo v4, "starting CertBlacklister"

    invoke-direct {v7, v4, v2}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2494
    .end local v2  # "e":Ljava/lang/Throwable;
    :goto_e00
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2498
    const-string v2, "StartEmergencyAffordanceService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2499
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v4, Lcom/android/server/emergency/EmergencyAffordanceService;

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2500
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2503
    const-string/jumbo v2, "startBlobStoreManagerService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2504
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.blob.BlobStoreManagerService"

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2505
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2508
    const-string v2, "StartDreamManager"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2509
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v4, Lcom/android/server/dreams/DreamManagerService;

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2510
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2512
    const-string v2, "AddGraphicsStatsService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2513
    const-string/jumbo v2, "graphicsstats"

    new-instance v4, Landroid/graphics/GraphicsStatsService;

    invoke-direct {v4, v5}, Landroid/graphics/GraphicsStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v2, v4}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 2515
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2517
    sget-boolean v2, Lcom/android/server/coverage/CoverageService;->ENABLED:Z

    if-eqz v2, :cond_e5a

    .line 2518
    const-string v2, "AddCoverageService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2519
    const-string v2, "coverage"

    new-instance v4, Lcom/android/server/coverage/CoverageService;

    invoke-direct {v4}, Lcom/android/server/coverage/CoverageService;-><init>()V

    invoke-static {v2, v4}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 2520
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2523
    :cond_e5a
    iget-object v2, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v4, "android.software.print"

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e73

    .line 2524
    const-string v2, "StartPrintManager"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2525
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.print.PrintManagerService"

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2526
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2529
    :cond_e73
    const-string v2, "StartAttestationVerificationService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2530
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v4, Lcom/android/server/security/AttestationVerificationManagerService;

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2531
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2533
    iget-object v2, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v4, "android.software.companion_device_setup"

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_eaa

    .line 2534
    const-string v2, "StartCompanionDeviceManager"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2535
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.companion.CompanionDeviceManagerService"

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2536
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2539
    const-string v2, "StartVirtualDeviceManager"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2540
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.companion.virtual.VirtualDeviceManagerService"

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2541
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2544
    :cond_eaa
    const-string v2, "StartRestrictionManager"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2545
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v4, Lcom/android/server/restrictions/RestrictionsManagerService;

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2546
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2548
    const-string v2, "StartMediaSessionService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2549
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.media.MediaSessionService"

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2550
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2552
    iget-object v2, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v4, "android.hardware.hdmi.cec"

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_ee1

    .line 2553
    const-string v2, "StartHdmiControlService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2554
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v4, Lcom/android/server/hdmi/HdmiControlService;

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2555
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2558
    :cond_ee1
    iget-object v2, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v4, "android.software.live_tv"

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_ef5

    iget-object v2, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v4, "android.software.leanback"

    .line 2559
    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f04

    .line 2560
    :cond_ef5
    const-string v2, "StartTvInteractiveAppManager"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2561
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v4, Lcom/android/server/tv/interactive/TvInteractiveAppManagerService;

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2562
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2565
    :cond_f04
    iget-object v2, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v4, "android.software.live_tv"

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_f18

    iget-object v2, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v4, "android.software.leanback"

    .line 2566
    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f27

    .line 2567
    :cond_f18
    const-string v2, "StartTvInputManager"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2568
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v4, Lcom/android/server/tv/TvInputManagerService;

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2569
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2572
    :cond_f27
    iget-object v2, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v4, "android.hardware.tv.tuner"

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f40

    .line 2573
    const-string v2, "StartTunerResourceManager"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2574
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v4, Lcom/android/server/tv/tunerresourcemanager/TunerResourceManagerService;

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2575
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2578
    :cond_f40
    iget-object v2, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v4, "android.software.picture_in_picture"

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f59

    .line 2579
    const-string v2, "StartMediaResourceMonitor"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2580
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v4, "com.android.server.media.MediaResourceMonitorService"

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2581
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2584
    :cond_f59
    sget-object v2, Lcom/android/server/SystemServer;->TARGET_COUNTRY:Ljava/lang/String;

    const-string v4, "KR"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f81

    .line 2586
    :try_start_f63
    const-string v2, "KT UCA"

    const-string v4, "KT UCA Service"

    invoke-static {v2, v4}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2587
    const-string/jumbo v2, "ktuca"

    new-instance v4, Landroid/ktuca/KtUcaService;

    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-direct {v4, v9}, Landroid/ktuca/KtUcaService;-><init>(Landroid/content/Context;)V

    invoke-static {v2, v4}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_f77
    .catchall {:try_start_f63 .. :try_end_f77} :catchall_f78

    .line 2590
    goto :goto_f81

    .line 2588
    :catchall_f78
    move-exception v0

    move-object v2, v0

    .line 2589
    .restart local v2  # "e":Ljava/lang/Throwable;
    const-string v4, "KT UCA"

    const-string v9, "Failure starting KT UCA Service"

    invoke-static {v4, v9, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2594
    .end local v2  # "e":Ljava/lang/Throwable;
    :cond_f81
    :goto_f81
    iget-object v2, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v4, "android.software.leanback"

    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f9a

    .line 2595
    const-string v2, "StartTvRemoteService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2596
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v4, Lcom/android/server/tv/TvRemoteService;

    invoke-virtual {v2, v4}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2597
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2600
    :cond_f9a
    const-string v2, "StartMediaRouterService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2602
    :try_start_f9f
    new-instance v2, Lcom/android/server/media/MediaRouterService;

    invoke-direct {v2, v5}, Lcom/android/server/media/MediaRouterService;-><init>(Landroid/content/Context;)V
    :try_end_fa4
    .catchall {:try_start_f9f .. :try_end_fa4} :catchall_fb2

    .line 2603
    .end local v34  # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    .local v2, "mediaRouter":Lcom/android/server/media/MediaRouterService;
    :try_start_fa4
    const-string/jumbo v4, "media_router"

    invoke-static {v4, v2}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_faa
    .catchall {:try_start_fa4 .. :try_end_faa} :catchall_fad

    .line 2606
    move-object/from16 v34, v2

    goto :goto_fba

    .line 2604
    :catchall_fad
    move-exception v0

    move-object/from16 v34, v2

    move-object v2, v0

    goto :goto_fb4

    .end local v2  # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    .restart local v34  # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    :catchall_fb2
    move-exception v0

    move-object v2, v0

    .line 2605
    .local v2, "e":Ljava/lang/Throwable;
    :goto_fb4
    const-string/jumbo v4, "starting MediaRouterService"

    invoke-direct {v7, v4, v2}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2607
    .end local v2  # "e":Ljava/lang/Throwable;
    :goto_fba
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2609
    iget-object v2, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v4, "android.hardware.biometrics.face"

    .line 2610
    invoke-virtual {v2, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    .line 2611
    .local v2, "hasFeatureFace":Z
    iget-object v4, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v9, "android.hardware.biometrics.iris"

    .line 2612
    invoke-virtual {v4, v9}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    .line 2613
    .local v4, "hasFeatureIris":Z
    iget-object v9, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v10, "android.hardware.fingerprint"

    .line 2614
    invoke-virtual {v9, v10}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v9

    .line 2615
    .local v9, "hasFeatureFingerprint":Z
    iget-object v10, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    move/from16 v41, v1

    .end local v1  # "startRulesManagerService":Z
    .local v41, "startRulesManagerService":Z
    const-string v1, "com.lge.hardware.facerecognition"

    .line 2616
    invoke-virtual {v10, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    .line 2617
    .local v1, "hasFeatureFaceUsingPOS":Z
    iget-object v10, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    move-object/from16 v48, v11

    .end local v11  # "notification":Landroid/app/INotificationManager;
    .local v48, "notification":Landroid/app/INotificationManager;
    const-string v11, "com.lge.hardware.vein"

    .line 2618
    invoke-virtual {v10, v11}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v10

    .line 2620
    .local v10, "hasFeatureVeinUsingPOS":Z
    if-eqz v2, :cond_1000

    .line 2621
    const-string v11, "StartFaceSensor"

    invoke-virtual {v6, v11}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2622
    iget-object v11, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    move/from16 v49, v2

    .end local v2  # "hasFeatureFace":Z
    .local v49, "hasFeatureFace":Z
    const-class v2, Lcom/android/server/biometrics/sensors/face/FaceService;

    .line 2623
    invoke-virtual {v11, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    move-result-object v2

    check-cast v2, Lcom/android/server/biometrics/sensors/face/FaceService;

    .line 2624
    .local v2, "faceService":Lcom/android/server/biometrics/sensors/face/FaceService;
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    goto :goto_1002

    .line 2620
    .end local v49  # "hasFeatureFace":Z
    .local v2, "hasFeatureFace":Z
    :cond_1000
    move/from16 v49, v2

    .line 2627
    .end local v2  # "hasFeatureFace":Z
    .restart local v49  # "hasFeatureFace":Z
    :goto_1002
    if-eqz v4, :cond_1013

    .line 2628
    const-string v2, "StartIrisSensor"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2629
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/biometrics/sensors/iris/IrisService;

    invoke-virtual {v2, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2630
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2633
    :cond_1013
    if-eqz v9, :cond_1044

    .line 2634
    const-string v2, "StartFingerprintSensor"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2635
    iget-object v2, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v11, "com.lge.fido.fingerex"

    invoke-virtual {v2, v11}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_103a

    iget-object v2, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v11, "com.lge.software.payment.global"

    .line 2636
    invoke-virtual {v2, v11}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_102f

    goto :goto_103a

    .line 2639
    :cond_102f
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/biometrics/sensors/fingerprint/FingerprintService;

    .line 2640
    invoke-virtual {v2, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    move-result-object v2

    check-cast v2, Lcom/android/server/biometrics/sensors/fingerprint/FingerprintService;

    goto :goto_1041

    .line 2637
    :cond_103a
    :goto_103a
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/biometrics/sensors/fingerprint/FingerprintServiceEx;

    invoke-virtual {v2, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2642
    :goto_1041
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2646
    :cond_1044
    if-eqz v1, :cond_1055

    .line 2647
    const-string v2, "StartFacerecognitionSensor"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2648
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/facerecognition/FacerecognitionService;

    invoke-virtual {v2, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2649
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2652
    :cond_1055
    if-eqz v10, :cond_1066

    .line 2653
    const-string v2, "StartVeinSensor"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2654
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/vein/VeinService;

    invoke-virtual {v2, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2655
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2659
    :cond_1066
    const-string v2, "StartBiometricService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2660
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/biometrics/BiometricService;

    invoke-virtual {v2, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2661
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2663
    const-string v2, "StartAuthService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2664
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/biometrics/AuthService;

    invoke-virtual {v2, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2665
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2667
    if-nez v32, :cond_109a

    .line 2670
    const-string v2, "StartDynamicCodeLoggingService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2672
    :try_start_108b
    invoke-static {v5}, Lcom/android/server/pm/DynamicCodeLoggingService;->schedule(Landroid/content/Context;)V
    :try_end_108e
    .catchall {:try_start_108b .. :try_end_108e} :catchall_108f

    .line 2675
    goto :goto_1097

    .line 2673
    :catchall_108f
    move-exception v0

    move-object v2, v0

    .line 2674
    .local v2, "e":Ljava/lang/Throwable;
    const-string/jumbo v11, "starting DynamicCodeLoggingService"

    invoke-direct {v7, v11, v2}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2676
    .end local v2  # "e":Ljava/lang/Throwable;
    :goto_1097
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2679
    :cond_109a
    if-nez v32, :cond_10af

    .line 2680
    const-string v2, "StartPruneInstantAppsJobService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2682
    :try_start_10a1
    invoke-static {v5}, Lcom/android/server/PruneInstantAppsJobService;->schedule(Landroid/content/Context;)V
    :try_end_10a4
    .catchall {:try_start_10a1 .. :try_end_10a4} :catchall_10a5

    .line 2685
    goto :goto_10ac

    .line 2683
    :catchall_10a5
    move-exception v0

    move-object v2, v0

    .line 2684
    .restart local v2  # "e":Ljava/lang/Throwable;
    const-string v11, "StartPruneInstantAppsJobService"

    invoke-direct {v7, v11, v2}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2686
    .end local v2  # "e":Ljava/lang/Throwable;
    :goto_10ac
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2690
    :cond_10af
    const-string v2, "StartShortcutServiceLifecycle"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2691
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/pm/ShortcutService$Lifecycle;

    invoke-virtual {v2, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2692
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2694
    const-string v2, "StartLauncherAppsService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2695
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/pm/LauncherAppsService;

    invoke-virtual {v2, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2696
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2698
    const-string v2, "StartCrossProfileAppsService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2699
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/pm/CrossProfileAppsService;

    invoke-virtual {v2, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2700
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2702
    const-string v2, "StartPeopleService"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2703
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/people/PeopleService;

    invoke-virtual {v2, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2704
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2706
    const-string v2, "StartMediaMetricsManager"

    invoke-virtual {v6, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2707
    iget-object v2, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v11, Lcom/android/server/media/metrics/MediaMetricsManagerService;

    invoke-virtual {v2, v11}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2708
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    move-object/from16 v43, v13

    move-object/from16 v49, v14

    move-object/from16 v50, v15

    move-object/from16 v51, v16

    move-object/from16 v52, v17

    move-object/from16 v53, v18

    move-object/from16 v54, v20

    move-object/from16 v55, v21

    move-object/from16 v2, v22

    move-object/from16 v1, v23

    move-object/from16 v56, v24

    move-object/from16 v57, v34

    move-object/from16 v34, v45

    .line 2711
    .end local v4  # "hasFeatureIris":Z
    .end local v9  # "hasFeatureFingerprint":Z
    .end local v10  # "hasFeatureVeinUsingPOS":Z
    .end local v13  # "countryDetector":Lcom/android/server/CountryDetectorService;
    .end local v14  # "vcnManagement":Lcom/android/server/VcnManagementService;
    .end local v15  # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v16  # "lockSettings":Lcom/android/internal/widget/ILockSettings;
    .end local v17  # "serial":Lcom/android/server/SerialService;
    .end local v18  # "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    .end local v20  # "hardwarePropertiesService":Lcom/android/server/HardwarePropertiesManagerService;
    .end local v21  # "pacProxyService":Lcom/android/server/connectivity/PacProxyService;
    .end local v22  # "wigigP2pService":Ljava/lang/Object;
    .end local v23  # "wigigService":Ljava/lang/Object;
    .end local v24  # "wifisapservice":Lcom/lge/wifi/impl/wifiSap/WifiSapService;
    .end local v41  # "startRulesManagerService":Z
    .end local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .local v1, "wigigService":Ljava/lang/Object;
    .local v2, "wigigP2pService":Ljava/lang/Object;
    .local v34, "vpnManager":Lcom/android/server/VpnManagerService;
    .local v43, "countryDetector":Lcom/android/server/CountryDetectorService;
    .local v49, "vcnManagement":Lcom/android/server/VcnManagementService;
    .local v50, "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .local v51, "lockSettings":Lcom/android/internal/widget/ILockSettings;
    .local v52, "serial":Lcom/android/server/SerialService;
    .local v53, "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    .local v54, "hardwarePropertiesService":Lcom/android/server/HardwarePropertiesManagerService;
    .local v55, "pacProxyService":Lcom/android/server/connectivity/PacProxyService;
    .local v56, "wifisapservice":Lcom/lge/wifi/impl/wifiSap/WifiSapService;
    .local v57, "mediaRouter":Lcom/android/server/media/MediaRouterService;
    :goto_1114
    const-string v4, "StartMediaProjectionManager"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2712
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v9, Lcom/android/server/media/projection/MediaProjectionManagerService;

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2713
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2715
    if-eqz v32, :cond_1190

    .line 2717
    const-string v4, "StartWearPowerService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2718
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.android.clockwork.power.WearPowerService"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2719
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2721
    const-string v4, "StartHealthService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2722
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.google.android.clockwork.healthservices.HealthService"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2723
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2725
    const-string v4, "StartWearConnectivityService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2726
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.android.clockwork.connectivity.WearConnectivityService"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2727
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2729
    const-string v4, "StartWearDisplayService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2730
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.google.android.clockwork.display.WearDisplayService"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2731
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2733
    const-string v4, "StartWearTimeService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2734
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.google.android.clockwork.time.WearTimeService"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2735
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2737
    if-eqz v28, :cond_1181

    .line 2738
    const-string v4, "StartWearLeftyService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2739
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.google.android.clockwork.lefty.WearLeftyService"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2740
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2743
    :cond_1181
    const-string v4, "StartWearGlobalActionsService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2744
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.android.clockwork.globalactions.GlobalActionsService"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2745
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2748
    :cond_1190
    iget-object v4, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v9, "android.software.slices_disabled"

    invoke-virtual {v4, v9}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_11a9

    .line 2749
    const-string v4, "StartSliceManagerService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2750
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.android.server.slice.SliceManagerService$Lifecycle"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2751
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2754
    :cond_11a9
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const-string v9, "android.hardware.type.embedded"

    invoke-virtual {v4, v9}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_11c4

    .line 2755
    const-string v4, "StartIoTSystemService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2756
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.android.things.server.IoTSystemService"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2757
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2761
    :cond_11c4
    const-string v4, "StartStatsCompanion"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2762
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.android.server.stats.StatsCompanion$Lifecycle"

    const-string v10, "/apex/com.android.os.statsd/javalib/service-statsd.jar"

    invoke-virtual {v4, v9, v10}, Lcom/android/server/SystemServiceManager;->startServiceFromJar(Ljava/lang/String;Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2764
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2767
    const-string v4, "StartRebootReadinessManagerService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2768
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.android.server.scheduling.RebootReadinessManagerService$Lifecycle"

    const-string v10, "/apex/com.android.scheduling/javalib/service-scheduling.jar"

    invoke-virtual {v4, v9, v10}, Lcom/android/server/SystemServiceManager;->startServiceFromJar(Ljava/lang/String;Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2770
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2773
    const-string v4, "StartStatsPullAtomService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2774
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.android.server.stats.pull.StatsPullAtomService"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2775
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2778
    const-string v4, "StatsBootstrapAtomService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2779
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.android.server.stats.bootstrap.StatsBootstrapAtomService$Lifecycle"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2780
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2783
    const-string v4, "StartIncidentCompanionService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2784
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v9, Lcom/android/server/incident/IncidentCompanionService;

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2785
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2788
    const-string v4, "StarSdkSandboxManagerService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2789
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.android.server.sdksandbox.SdkSandboxManagerService$Lifecycle"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2790
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2793
    const-string v4, "StartAdServicesManagerService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2794
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.android.server.adservices.AdServicesManagerService$Lifecycle"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2795
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2797
    if-eqz v12, :cond_1238

    .line 2798
    iget-object v4, v7, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v4}, Lcom/android/server/am/ActivityManagerService;->enterSafeMode()V

    .line 2801
    :cond_1238
    iget-object v4, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v9, "android.hardware.telephony"

    invoke-virtual {v4, v9}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1259

    .line 2803
    const-string v4, "StartMmsService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2804
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v9, Lcom/android/server/MmsServiceBroker;

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    move-result-object v4

    move-object/from16 v19, v4

    check-cast v19, Lcom/android/server/MmsServiceBroker;

    .line 2805
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    move-object/from16 v58, v19

    goto :goto_125b

    .line 2801
    :cond_1259
    move-object/from16 v58, v19

    .line 2808
    .end local v19  # "mmsService":Lcom/android/server/MmsServiceBroker;
    .local v58, "mmsService":Lcom/android/server/MmsServiceBroker;
    :goto_125b
    iget-object v4, v7, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v9, "android.software.autofill"

    invoke-virtual {v4, v9}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1274

    .line 2809
    const-string v4, "StartAutoFillService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2810
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.android.server.autofill.AutofillManagerService"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2811
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2815
    :cond_1274
    const v4, 0x104024c

    invoke-direct {v7, v5, v4}, Lcom/android/server/SystemServer;->deviceHasConfigString(Landroid/content/Context;I)Z

    move-result v4

    if-eqz v4, :cond_128d

    .line 2816
    const-string v4, "StartTranslationManagerService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2817
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v9, "com.android.server.translation.TranslationManagerService"

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2818
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    goto :goto_1294

    .line 2820
    :cond_128d
    const-string v4, "SystemServer"

    const-string v9, "TranslationService not defined by OEM"

    invoke-static {v4, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2824
    :goto_1294
    const-string v4, "StartClipboardService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2825
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v9, Lcom/android/server/clipboard/ClipboardService;

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2826
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2828
    const-string v4, "AppServiceManager"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2829
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v9, Lcom/android/server/appbinding/AppBindingService$Lifecycle;

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2830
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2833
    const-string/jumbo v4, "startTracingServiceProxy"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2834
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v9, Lcom/android/server/tracing/TracingServiceProxy;

    invoke-virtual {v4, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2835
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2839
    const-string v4, "MakeLockSettingsServiceReady"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2840
    if-eqz v51, :cond_12d5

    .line 2842
    :try_start_12c9
    invoke-interface/range {v51 .. v51}, Lcom/android/internal/widget/ILockSettings;->systemReady()V
    :try_end_12cc
    .catchall {:try_start_12c9 .. :try_end_12cc} :catchall_12cd

    .line 2845
    goto :goto_12d5

    .line 2843
    :catchall_12cd
    move-exception v0

    move-object v4, v0

    .line 2844
    .local v4, "e":Ljava/lang/Throwable;
    const-string/jumbo v9, "making Lock Settings Service ready"

    invoke-direct {v7, v9, v4}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2847
    .end local v4  # "e":Ljava/lang/Throwable;
    :cond_12d5
    :goto_12d5
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2849
    const-string v4, "StartSmartCoverService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2851
    :try_start_12dd
    const-string/jumbo v4, "smartcover"

    new-instance v9, Lcom/lge/systemservice/service/SmartCoverService;

    invoke-direct {v9, v5}, Lcom/lge/systemservice/service/SmartCoverService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_12e8
    .catch Ljava/lang/Exception; {:try_start_12dd .. :try_end_12e8} :catch_12e9

    .line 2854
    goto :goto_12f1

    .line 2852
    :catch_12e9
    move-exception v0

    move-object v4, v0

    .line 2853
    .local v4, "e":Ljava/lang/Exception;
    const-string/jumbo v9, "start SmartCoverService"

    invoke-direct {v7, v9, v4}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2855
    .end local v4  # "e":Ljava/lang/Exception;
    :goto_12f1
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2857
    invoke-static {}, Lcom/lge/display/DisplayManagerHelper;->getMultiDisplayType()I

    move-result v4

    const/4 v9, 0x1

    if-ne v9, v4, :cond_1317

    .line 2858
    const-string v4, "StartPostureManagerService"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2860
    :try_start_1300
    const-string/jumbo v4, "postureservice"

    new-instance v9, Lcom/lge/systemservice/service/PostureManagerService;

    invoke-direct {v9, v5}, Lcom/lge/systemservice/service/PostureManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_130b
    .catch Ljava/lang/Exception; {:try_start_1300 .. :try_end_130b} :catch_130c

    .line 2863
    goto :goto_1314

    .line 2861
    :catch_130c
    move-exception v0

    move-object v4, v0

    .line 2862
    .restart local v4  # "e":Ljava/lang/Exception;
    const-string/jumbo v9, "start PostureManagerService"

    invoke-direct {v7, v9, v4}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2864
    .end local v4  # "e":Ljava/lang/Exception;
    :goto_1314
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2868
    :cond_1317
    const-string v4, "StartBootPhaseLockSettingsReady"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2869
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const/16 v9, 0x1e0

    invoke-virtual {v4, v6, v9}, Lcom/android/server/SystemServiceManager;->startBootPhase(Lcom/android/server/utils/TimingsTraceAndSlog;I)V

    .line 2870
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2872
    const-string v4, "StartBootPhaseSystemServicesReady"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2873
    iget-object v4, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const/16 v9, 0x1f4

    invoke-virtual {v4, v6, v9}, Lcom/android/server/SystemServiceManager;->startBootPhase(Lcom/android/server/utils/TimingsTraceAndSlog;I)V

    .line 2874
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2878
    if-eqz v31, :cond_138b

    .line 2880
    :try_start_1337
    const-string v4, "SystemServer"

    const-string v10, "calling onBootPhase for Wigig Services"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2881
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    .line 2882
    .local v4, "wigigP2pClass":Ljava/lang/Class;
    const-string/jumbo v10, "onBootPhase"

    const/4 v11, 0x1

    new-array v13, v11, [Ljava/lang/Class;

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v14, 0x0

    aput-object v11, v13, v14

    invoke-virtual {v4, v10, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    .line 2883
    .local v10, "m":Ljava/lang/reflect/Method;
    const/4 v11, 0x1

    new-array v13, v11, [Ljava/lang/Object;

    new-instance v11, Ljava/lang/Integer;

    invoke-direct {v11, v9}, Ljava/lang/Integer;-><init>(I)V

    const/4 v14, 0x0

    aput-object v11, v13, v14

    invoke-virtual {v10, v2, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 2886
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    .line 2887
    .local v11, "wigigClass":Ljava/lang/Class;
    const-string/jumbo v13, "onBootPhase"

    const/4 v14, 0x1

    new-array v15, v14, [Ljava/lang/Class;

    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/16 v16, 0x0

    aput-object v14, v15, v16

    invoke-virtual {v11, v13, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v13

    move-object v10, v13

    .line 2888
    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    new-instance v14, Ljava/lang/Integer;

    invoke-direct {v14, v9}, Ljava/lang/Integer;-><init>(I)V

    const/4 v9, 0x0

    aput-object v14, v13, v9

    invoke-virtual {v10, v1, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1382
    .catchall {:try_start_1337 .. :try_end_1382} :catchall_1384

    .line 2892
    nop

    .end local v4  # "wigigP2pClass":Ljava/lang/Class;
    .end local v10  # "m":Ljava/lang/reflect/Method;
    .end local v11  # "wigigClass":Ljava/lang/Class;
    goto :goto_138b

    .line 2890
    :catchall_1384
    move-exception v0

    move-object v4, v0

    .line 2891
    .local v4, "e":Ljava/lang/Throwable;
    const-string v9, "Wigig services ready"

    invoke-direct {v7, v9, v4}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2895
    .end local v4  # "e":Ljava/lang/Throwable;
    :cond_138b
    :goto_138b
    const-string v4, "MakeWindowManagerServiceReady"

    invoke-virtual {v6, v4}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2897
    :try_start_1390
    invoke-virtual {v8}, Lcom/android/server/wm/WindowManagerService;->systemReady()V
    :try_end_1393
    .catchall {:try_start_1390 .. :try_end_1393} :catchall_1394

    .line 2900
    goto :goto_139c

    .line 2898
    :catchall_1394
    move-exception v0

    move-object v4, v0

    .line 2899
    .restart local v4  # "e":Ljava/lang/Throwable;
    const-string/jumbo v9, "making Window Manager Service ready"

    invoke-direct {v7, v9, v4}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2901
    .end local v4  # "e":Ljava/lang/Throwable;
    :goto_139c
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2904
    const-class v4, Lcom/android/server/SystemService;

    monitor-enter v4

    .line 2905
    :try_start_13a2
    sget-object v9, Lcom/android/server/SystemServer;->sPendingWtfs:Ljava/util/LinkedList;
    :try_end_13a4
    .catchall {:try_start_13a2 .. :try_end_13a4} :catchall_15bc

    if-eqz v9, :cond_13bf

    .line 2906
    :try_start_13a6
    iget-object v10, v7, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v10, v9}, Lcom/android/server/am/ActivityManagerService;->schedulePendingSystemServerWtfs(Ljava/util/LinkedList;)V

    .line 2907
    const/4 v9, 0x0

    sput-object v9, Lcom/android/server/SystemServer;->sPendingWtfs:Ljava/util/LinkedList;
    :try_end_13ae
    .catchall {:try_start_13a6 .. :try_end_13ae} :catchall_13af

    goto :goto_13bf

    .line 2909
    :catchall_13af
    move-exception v0

    move-object/from16 v59, v1

    move-object/from16 v61, v2

    move-object/from16 v63, v3

    move-object v3, v5

    move-object v1, v6

    move-object/from16 v42, v8

    move/from16 v38, v12

    move-object v2, v0

    goto/16 :goto_15ca

    :cond_13bf
    :goto_13bf
    :try_start_13bf
    monitor-exit v4
    :try_end_13c0
    .catchall {:try_start_13bf .. :try_end_13c0} :catchall_15bc

    .line 2911
    if-eqz v12, :cond_13c7

    .line 2912
    iget-object v4, v7, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v4}, Lcom/android/server/am/ActivityManagerService;->showSafeModeOverlay()V

    .line 2918
    :cond_13c7
    const/4 v4, 0x0

    invoke-virtual {v8, v4}, Lcom/android/server/wm/WindowManagerService;->computeNewConfiguration(I)Landroid/content/res/Configuration;

    move-result-object v11

    .line 2919
    .local v11, "config":Landroid/content/res/Configuration;
    new-instance v4, Landroid/util/DisplayMetrics;

    invoke-direct {v4}, Landroid/util/DisplayMetrics;-><init>()V

    .line 2920
    .local v4, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {v5}, Landroid/content/Context;->getDisplay()Landroid/view/Display;

    move-result-object v9

    invoke-virtual {v9, v4}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 2921
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9, v11, v4}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 2924
    invoke-virtual {v5}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v19

    .line 2925
    .local v19, "systemTheme":Landroid/content/res/Resources$Theme;
    invoke-virtual/range {v19 .. v19}, Landroid/content/res/Resources$Theme;->getChangingConfigurations()I

    move-result v9

    if-eqz v9, :cond_13ec

    .line 2926
    invoke-virtual/range {v19 .. v19}, Landroid/content/res/Resources$Theme;->rebase()V

    .line 2930
    :cond_13ec
    const-string v9, "StartPermissionPolicyService"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2931
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v10, Lcom/android/server/policy/PermissionPolicyService;

    invoke-virtual {v9, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 2932
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2934
    const-string v9, "MakePackageManagerServiceReady"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2935
    iget-object v9, v7, Lcom/android/server/SystemServer;->mPackageManagerService:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v9}, Lcom/android/server/pm/PackageManagerService;->systemReady()V

    .line 2936
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2938
    const-string v9, "MakeDisplayManagerServiceReady"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2941
    :try_start_140d
    iget-object v9, v7, Lcom/android/server/SystemServer;->mDisplayManagerService:Lcom/android/server/display/DisplayManagerService;

    iget-boolean v10, v7, Lcom/android/server/SystemServer;->mOnlyCore:Z

    invoke-virtual {v9, v12, v10}, Lcom/android/server/display/DisplayManagerService;->systemReady(ZZ)V
    :try_end_1414
    .catchall {:try_start_140d .. :try_end_1414} :catchall_1415

    .line 2944
    goto :goto_141d

    .line 2942
    :catchall_1415
    move-exception v0

    move-object v9, v0

    .line 2943
    .local v9, "e":Ljava/lang/Throwable;
    const-string/jumbo v10, "making Display Manager Service ready"

    invoke-direct {v7, v10, v9}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2945
    .end local v9  # "e":Ljava/lang/Throwable;
    :goto_141d
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2947
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    invoke-virtual {v9, v12}, Lcom/android/server/SystemServiceManager;->setSafeMode(Z)V

    .line 2950
    const-string v9, "StartDeviceSpecificServices"

    invoke-virtual {v6, v9}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2951
    iget-object v9, v7, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x1070039

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v15

    .line 2953
    .local v15, "classes":[Ljava/lang/String;
    array-length v9, v15

    const/4 v13, 0x0

    :goto_1439
    if-ge v13, v9, :cond_1482

    aget-object v10, v15, v13

    .line 2954
    .local v10, "className":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v20, v1

    .end local v1  # "wigigService":Ljava/lang/Object;
    .local v20, "wigigService":Ljava/lang/Object;
    const-string v1, "StartDeviceSpecificServices "

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2956
    :try_start_1455
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    invoke-virtual {v1, v10}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;
    :try_end_145a
    .catchall {:try_start_1455 .. :try_end_145a} :catchall_145d

    .line 2959
    move-object/from16 v21, v2

    goto :goto_1478

    .line 2957
    :catchall_145d
    move-exception v0

    move-object v1, v0

    .line 2958
    .local v1, "e":Ljava/lang/Throwable;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v21, v2

    .end local v2  # "wigigP2pService":Ljava/lang/Object;
    .local v21, "wigigP2pService":Ljava/lang/Object;
    const-string/jumbo v2, "starting "

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2960
    .end local v1  # "e":Ljava/lang/Throwable;
    :goto_1478
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2953
    .end local v10  # "className":Ljava/lang/String;
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    goto :goto_1439

    .line 2962
    .end local v20  # "wigigService":Ljava/lang/Object;
    .end local v21  # "wigigP2pService":Ljava/lang/Object;
    .local v1, "wigigService":Ljava/lang/Object;
    .restart local v2  # "wigigP2pService":Ljava/lang/Object;
    :cond_1482
    move-object/from16 v20, v1

    move-object/from16 v21, v2

    .end local v1  # "wigigService":Ljava/lang/Object;
    .end local v2  # "wigigP2pService":Ljava/lang/Object;
    .restart local v20  # "wigigService":Ljava/lang/Object;
    .restart local v21  # "wigigP2pService":Ljava/lang/Object;
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2964
    const-string v1, "GameManagerService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2965
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.app.GameManagerService$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2966
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2968
    const-string v1, "ArtManagerLocal"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2969
    const-class v1, Lcom/android/server/art/ArtManagerLocal;

    new-instance v2, Lcom/android/server/art/ArtManagerLocal;

    invoke-direct {v2}, Lcom/android/server/art/ArtManagerLocal;-><init>()V

    invoke-static {v1, v2}, Lcom/android/server/LocalManagerRegistry;->addManager(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 2970
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2972
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v2, "android.hardware.uwb"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14c7

    .line 2973
    const-string v1, "UwbService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2974
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.uwb.UwbService"

    const-string v9, "/apex/com.android.uwb/javalib/service-uwb.jar"

    invoke-virtual {v1, v2, v9}, Lcom/android/server/SystemServiceManager;->startServiceFromJar(Ljava/lang/String;Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2975
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2978
    :cond_14c7
    const-string v1, "StartSystemEventHubService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2980
    :try_start_14cc
    const-string v1, "eventhub"

    new-instance v2, Lcom/lge/server/eventhub/SystemEventHubService;

    invoke-direct {v2, v5}, Lcom/lge/server/eventhub/SystemEventHubService;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_14d6
    .catch Ljava/lang/Exception; {:try_start_14cc .. :try_end_14d6} :catch_14d7

    .line 2983
    goto :goto_14df

    .line 2981
    :catch_14d7
    move-exception v0

    move-object v1, v0

    .line 2982
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "start SystemEventHubService"

    invoke-direct {v7, v2, v1}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2984
    .end local v1  # "e":Ljava/lang/Exception;
    :goto_14df
    const-string v1, "StartBootPhaseDeviceSpecificServicesReady"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2985
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const/16 v2, 0x208

    invoke-virtual {v1, v6, v2}, Lcom/android/server/SystemServiceManager;->startBootPhase(Lcom/android/server/utils/TimingsTraceAndSlog;I)V

    .line 2986
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2988
    const-string v1, "StartSafetyCenterService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2989
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.safetycenter.SafetyCenterService"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2990
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2992
    const-string v1, "AppSearchModule"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2993
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.appsearch.AppSearchModule$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2994
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 2996
    const-string/jumbo v1, "ro.config.isolated_compilation_enabled"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1525

    .line 2997
    const-string v1, "IsolatedCompilationService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 2998
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.compos.IsolatedCompilationService"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 2999
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3002
    :cond_1525
    const-string v1, "StartMediaCommunicationService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3003
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.media.MediaCommunicationService"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 3004
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3006
    const-string v1, "AppCompatOverridesService"

    invoke-virtual {v6, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3007
    iget-object v1, v7, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v2, "com.android.server.compat.overrides.AppCompatOverridesService$Lifecycle"

    invoke-virtual {v1, v2}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 3008
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3011
    move-object/from16 v9, v46

    .line 3012
    .local v9, "networkManagementF":Lcom/android/server/NetworkManagementService;
    move-object/from16 v10, v50

    .line 3013
    .local v10, "networkPolicyF":Lcom/android/server/net/NetworkPolicyManagerService;
    move-object/from16 v13, v43

    .line 3014
    .local v13, "countryDetectorF":Lcom/android/server/CountryDetectorService;
    move-object/from16 v14, v53

    .line 3015
    .local v14, "networkTimeUpdaterF":Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v22, v15

    .end local v15  # "classes":[Ljava/lang/String;
    .local v22, "classes":[Ljava/lang/String;
    move-object v15, v3

    .line 3016
    .local v15, "inputManagerF":Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v29

    .line 3017
    .local v16, "telephonyRegistryF":Lcom/android/server/TelephonyRegistry;
    move-object/from16 v17, v57

    .line 3018
    .local v17, "mediaRouterF":Lcom/android/server/media/MediaRouterService;
    move-object/from16 v18, v58

    .line 3019
    .local v18, "mmsServiceF":Lcom/android/server/MmsServiceBroker;
    move-object/from16 v23, v11

    .end local v11  # "config":Landroid/content/res/Configuration;
    .local v23, "config":Landroid/content/res/Configuration;
    move-object/from16 v11, v34

    .line 3020
    .local v11, "vpnManagerF":Lcom/android/server/VpnManagerService;
    move/from16 v38, v12

    .end local v12  # "safeMode":Z
    .local v38, "safeMode":Z
    move-object/from16 v12, v49

    .line 3021
    .local v12, "vcnManagementF":Lcom/android/server/VcnManagementService;
    move-object v2, v8

    .line 3022
    .local v2, "windowManagerF":Lcom/android/server/wm/WindowManagerService;
    const-string v1, "connectivity"

    .line 3023
    invoke-virtual {v5, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v24, v1

    check-cast v24, Landroid/net/ConnectivityManager;

    move-object/from16 v42, v8

    .end local v8  # "wm":Lcom/android/server/wm/WindowManagerService;
    .local v24, "connectivityF":Landroid/net/ConnectivityManager;
    .local v42, "wm":Lcom/android/server/wm/WindowManagerService;
    move-object/from16 v8, v24

    .line 3026
    move-object/from16 v41, v4

    .end local v4  # "metrics":Landroid/util/DisplayMetrics;
    .local v41, "metrics":Landroid/util/DisplayMetrics;
    move-object/from16 v4, v37

    .line 3033
    .local v4, "dataRuntimeFeatureF":Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;
    iget-object v1, v7, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    move-object/from16 v45, v4

    .end local v4  # "dataRuntimeFeatureF":Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;
    .local v45, "dataRuntimeFeatureF":Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;
    new-instance v4, Lcom/android/server/SystemServer$$ExternalSyntheticLambda7;

    move-object/from16 v60, v1

    move-object/from16 v59, v20

    .end local v20  # "wigigService":Ljava/lang/Object;
    .local v59, "wigigService":Ljava/lang/Object;
    move-object v1, v4

    move-object/from16 v62, v2

    move-object/from16 v61, v21

    .end local v2  # "windowManagerF":Lcom/android/server/wm/WindowManagerService;
    .end local v21  # "wigigP2pService":Ljava/lang/Object;
    .local v61, "wigigP2pService":Ljava/lang/Object;
    .local v62, "windowManagerF":Lcom/android/server/wm/WindowManagerService;
    move-object/from16 v2, p0

    move-object/from16 v63, v3

    .end local v3  # "inputManager":Lcom/android/server/input/InputManagerService;
    .local v63, "inputManager":Lcom/android/server/input/InputManagerService;
    move-object/from16 v3, p1

    move-object/from16 v64, v5

    .end local v5  # "context":Landroid/content/Context;
    .local v64, "context":Landroid/content/Context;
    move-object/from16 v5, v44

    move-object/from16 v6, v64

    move/from16 v7, v38

    move-object/from16 v65, v4

    move-object/from16 v4, v45

    .end local v45  # "dataRuntimeFeatureF":Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;
    .restart local v4  # "dataRuntimeFeatureF":Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;
    invoke-direct/range {v1 .. v18}, Lcom/android/server/SystemServer$$ExternalSyntheticLambda7;-><init>(Lcom/android/server/SystemServer;Lcom/android/server/utils/TimingsTraceAndSlog;Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;Lcom/android/server/devicepolicy/DevicePolicyManagerService$Lifecycle;Landroid/content/Context;ZLandroid/net/ConnectivityManager;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/VpnManagerService;Lcom/android/server/VcnManagementService;Lcom/android/server/CountryDetectorService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/input/InputManagerService;Lcom/android/server/TelephonyRegistry;Lcom/android/server/media/MediaRouterService;Lcom/android/server/MmsServiceBroker;)V

    move-object/from16 v1, p1

    move-object/from16 v2, v60

    move-object/from16 v3, v65

    invoke-virtual {v2, v3, v1}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;Lcom/android/server/utils/TimingsTraceAndSlog;)V

    # ---- LMOFreeform hook begin (v2 is overwritten right after, v64 = context) ----
    move-object/from16 v2, v64

    :lmo_try_start
    invoke-static {v2}, Lcom/libremobileos/freeform/server/LMOFreeformBoot;->start(Landroid/content/Context;)V
    :lmo_try_end
    .catchall {:lmo_try_start .. :lmo_try_end} :lmo_catch

    goto :lmo_done

    :lmo_catch
    move-exception v2

    :lmo_done
    # ---- LMOFreeform hook end ----

    .line 3305
    const-string v2, "StartSystemUI"

    invoke-virtual {v1, v2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3307
    move-object/from16 v2, v62

    move-object/from16 v3, v64

    .end local v62  # "windowManagerF":Lcom/android/server/wm/WindowManagerService;
    .end local v64  # "context":Landroid/content/Context;
    .restart local v2  # "windowManagerF":Lcom/android/server/wm/WindowManagerService;
    .local v3, "context":Landroid/content/Context;
    :try_start_15a5
    invoke-static {v3, v2}, Lcom/android/server/SystemServer;->startSystemUi(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_15a8
    .catchall {:try_start_15a5 .. :try_end_15a8} :catchall_15ab

    .line 3310
    move-object/from16 v7, p0

    goto :goto_15b5

    .line 3308
    :catchall_15ab
    move-exception v0

    move-object v5, v0

    .line 3309
    .local v5, "e":Ljava/lang/Throwable;
    const-string/jumbo v6, "starting System UI"

    move-object/from16 v7, p0

    invoke-direct {v7, v6, v5}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3311
    .end local v5  # "e":Ljava/lang/Throwable;
    :goto_15b5
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3313
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3314
    return-void

    .line 2909
    .end local v4  # "dataRuntimeFeatureF":Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;
    .end local v9  # "networkManagementF":Lcom/android/server/NetworkManagementService;
    .end local v10  # "networkPolicyF":Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v11  # "vpnManagerF":Lcom/android/server/VpnManagerService;
    .end local v13  # "countryDetectorF":Lcom/android/server/CountryDetectorService;
    .end local v14  # "networkTimeUpdaterF":Lcom/android/server/NetworkTimeUpdateService;
    .end local v15  # "inputManagerF":Lcom/android/server/input/InputManagerService;
    .end local v16  # "telephonyRegistryF":Lcom/android/server/TelephonyRegistry;
    .end local v17  # "mediaRouterF":Lcom/android/server/media/MediaRouterService;
    .end local v18  # "mmsServiceF":Lcom/android/server/MmsServiceBroker;
    .end local v19  # "systemTheme":Landroid/content/res/Resources$Theme;
    .end local v22  # "classes":[Ljava/lang/String;
    .end local v23  # "config":Landroid/content/res/Configuration;
    .end local v24  # "connectivityF":Landroid/net/ConnectivityManager;
    .end local v38  # "safeMode":Z
    .end local v41  # "metrics":Landroid/util/DisplayMetrics;
    .end local v42  # "wm":Lcom/android/server/wm/WindowManagerService;
    .end local v59  # "wigigService":Ljava/lang/Object;
    .end local v61  # "wigigP2pService":Ljava/lang/Object;
    .end local v63  # "inputManager":Lcom/android/server/input/InputManagerService;
    .local v1, "wigigService":Ljava/lang/Object;
    .local v2, "wigigP2pService":Ljava/lang/Object;
    .local v3, "inputManager":Lcom/android/server/input/InputManagerService;
    .local v5, "context":Landroid/content/Context;
    .restart local v8  # "wm":Lcom/android/server/wm/WindowManagerService;
    .local v12, "safeMode":Z
    :catchall_15bc
    move-exception v0

    move-object/from16 v59, v1

    move-object/from16 v61, v2

    move-object/from16 v63, v3

    move-object v3, v5

    move-object v1, v6

    move-object/from16 v42, v8

    move/from16 v38, v12

    move-object v2, v0

    .end local v1  # "wigigService":Ljava/lang/Object;
    .end local v2  # "wigigP2pService":Ljava/lang/Object;
    .end local v5  # "context":Landroid/content/Context;
    .end local v8  # "wm":Lcom/android/server/wm/WindowManagerService;
    .end local v12  # "safeMode":Z
    .local v3, "context":Landroid/content/Context;
    .restart local v38  # "safeMode":Z
    .restart local v42  # "wm":Lcom/android/server/wm/WindowManagerService;
    .restart local v59  # "wigigService":Ljava/lang/Object;
    .restart local v61  # "wigigP2pService":Ljava/lang/Object;
    .restart local v63  # "inputManager":Lcom/android/server/input/InputManagerService;
    :goto_15ca
    :try_start_15ca
    monitor-exit v4
    :try_end_15cb
    .catchall {:try_start_15ca .. :try_end_15cb} :catchall_15cc

    throw v2

    :catchall_15cc
    move-exception v0

    move-object v2, v0

    goto :goto_15ca

    .line 1769
    .end local v34  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v38  # "safeMode":Z
    .end local v39  # "storageManager":Landroid/os/storage/IStorageManager;
    .end local v42  # "wm":Lcom/android/server/wm/WindowManagerService;
    .end local v43  # "countryDetector":Lcom/android/server/CountryDetectorService;
    .end local v44  # "dpms":Lcom/android/server/devicepolicy/DevicePolicyManagerService$Lifecycle;
    .end local v46  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .end local v47  # "statusBar":Lcom/android/server/statusbar/StatusBarManagerService;
    .end local v48  # "notification":Landroid/app/INotificationManager;
    .end local v49  # "vcnManagement":Lcom/android/server/VcnManagementService;
    .end local v50  # "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v51  # "lockSettings":Lcom/android/internal/widget/ILockSettings;
    .end local v52  # "serial":Lcom/android/server/SerialService;
    .end local v53  # "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    .end local v54  # "hardwarePropertiesService":Lcom/android/server/HardwarePropertiesManagerService;
    .end local v55  # "pacProxyService":Lcom/android/server/connectivity/PacProxyService;
    .end local v56  # "wifisapservice":Lcom/lge/wifi/impl/wifiSap/WifiSapService;
    .end local v57  # "mediaRouter":Lcom/android/server/media/MediaRouterService;
    .end local v58  # "mmsService":Lcom/android/server/MmsServiceBroker;
    .end local v59  # "wigigService":Ljava/lang/Object;
    .end local v61  # "wigigP2pService":Ljava/lang/Object;
    .end local v63  # "inputManager":Lcom/android/server/input/InputManagerService;
    .local v2, "storageManager":Landroid/os/storage/IStorageManager;
    .local v3, "inputManager":Lcom/android/server/input/InputManagerService;
    .local v4, "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v5  # "context":Landroid/content/Context;
    .restart local v8  # "wm":Lcom/android/server/wm/WindowManagerService;
    .local v14, "vcnManagement":Lcom/android/server/VcnManagementService;
    .local v15, "networkPolicy":Lcom/android/server/net/NetworkPolicyManagerService;
    .local v17, "serial":Lcom/android/server/SerialService;
    .local v18, "networkTimeUpdater":Lcom/android/server/NetworkTimeUpdateService;
    .local v19, "mmsService":Lcom/android/server/MmsServiceBroker;
    .local v20, "hardwarePropertiesService":Lcom/android/server/HardwarePropertiesManagerService;
    .local v21, "pacProxyService":Lcom/android/server/connectivity/PacProxyService;
    .local v22, "wigigP2pService":Ljava/lang/Object;
    .local v23, "wigigService":Ljava/lang/Object;
    .local v24, "wifisapservice":Lcom/lge/wifi/impl/wifiSap/WifiSapService;
    .local v41, "networkManagement":Lcom/android/server/NetworkManagementService;
    :catchall_15cf
    move-exception v0

    move-object/from16 v63, v3

    move-object/from16 v45, v4

    move-object v3, v5

    move-object v1, v6

    move-object/from16 v42, v8

    move-object v4, v0

    move-object/from16 v9, v29

    move-object/from16 v10, v35

    move-object/from16 v11, v37

    move-object/from16 v16, v42

    move-object/from16 v8, v63

    .end local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v5  # "context":Landroid/content/Context;
    .end local v8  # "wm":Lcom/android/server/wm/WindowManagerService;
    .local v3, "context":Landroid/content/Context;
    .restart local v42  # "wm":Lcom/android/server/wm/WindowManagerService;
    .local v45, "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v63  # "inputManager":Lcom/android/server/input/InputManagerService;
    goto/16 :goto_165b

    .end local v42  # "wm":Lcom/android/server/wm/WindowManagerService;
    .end local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v63  # "inputManager":Lcom/android/server/input/InputManagerService;
    .local v3, "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v5  # "context":Landroid/content/Context;
    .local v16, "wm":Lcom/android/server/wm/WindowManagerService;
    :catchall_15e5
    move-exception v0

    move-object/from16 v63, v3

    move-object/from16 v45, v4

    move-object v3, v5

    move-object v1, v6

    move-object v4, v0

    move-object/from16 v9, v29

    move-object/from16 v10, v35

    move-object/from16 v11, v37

    move-object/from16 v8, v63

    .end local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v5  # "context":Landroid/content/Context;
    .local v3, "context":Landroid/content/Context;
    .restart local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v63  # "inputManager":Lcom/android/server/input/InputManagerService;
    goto/16 :goto_165b

    .end local v29  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .end local v40  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .end local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .end local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v63  # "inputManager":Lcom/android/server/input/InputManagerService;
    .local v3, "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v5  # "context":Landroid/content/Context;
    .local v11, "inputManager":Lcom/android/server/input/InputManagerService;
    .local v12, "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .local v13, "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :catchall_15f7
    move-exception v0

    move-object/from16 v41, v3

    move-object/from16 v45, v4

    move-object v3, v5

    move-object v1, v6

    move-object/from16 v63, v11

    move-object/from16 v40, v12

    move-object/from16 v29, v13

    move-object v4, v0

    move-object/from16 v9, v29

    move-object/from16 v10, v35

    move-object/from16 v11, v37

    move-object/from16 v8, v63

    .end local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v5  # "context":Landroid/content/Context;
    .end local v11  # "inputManager":Lcom/android/server/input/InputManagerService;
    .end local v12  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .end local v13  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .local v3, "context":Landroid/content/Context;
    .restart local v29  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v40  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .restart local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v63  # "inputManager":Lcom/android/server/input/InputManagerService;
    goto/16 :goto_165b

    .end local v29  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .end local v40  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .end local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .end local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v63  # "inputManager":Lcom/android/server/input/InputManagerService;
    .local v3, "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v5  # "context":Landroid/content/Context;
    .local v8, "inputManager":Lcom/android/server/input/InputManagerService;
    .restart local v12  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .restart local v13  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :catchall_160f
    move-exception v0

    move-object/from16 v41, v3

    move-object/from16 v45, v4

    move-object v3, v5

    move-object v1, v6

    move-object/from16 v40, v12

    move-object/from16 v29, v13

    move-object v4, v0

    move-object/from16 v9, v29

    move-object/from16 v10, v35

    move-object/from16 v11, v37

    .end local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v5  # "context":Landroid/content/Context;
    .end local v12  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .end local v13  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .local v3, "context":Landroid/content/Context;
    .restart local v29  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v40  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .restart local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    goto :goto_165b

    .end local v29  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .end local v35  # "consumerIr":Lcom/android/server/ConsumerIrService;
    .end local v40  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .end local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .end local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .local v3, "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v5  # "context":Landroid/content/Context;
    .local v10, "consumerIr":Lcom/android/server/ConsumerIrService;
    .restart local v12  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .restart local v13  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :catchall_1622
    move-exception v0

    move-object/from16 v41, v3

    move-object/from16 v45, v4

    move-object v3, v5

    move-object v1, v6

    move-object/from16 v40, v12

    move-object/from16 v29, v13

    move-object v4, v0

    move-object/from16 v9, v29

    move-object/from16 v11, v37

    .end local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v5  # "context":Landroid/content/Context;
    .end local v12  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .end local v13  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .local v3, "context":Landroid/content/Context;
    .restart local v29  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v40  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .restart local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    goto :goto_165b

    .end local v29  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .end local v40  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .end local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .end local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .local v3, "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v5  # "context":Landroid/content/Context;
    .restart local v13  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .local v35, "dynamicSystem":Lcom/android/server/DynamicSystemService;
    :catchall_1633
    move-exception v0

    move-object/from16 v41, v3

    move-object/from16 v45, v4

    move-object v3, v5

    move-object v1, v6

    move-object/from16 v29, v13

    move-object v4, v0

    move-object/from16 v9, v29

    move-object/from16 v40, v35

    move-object/from16 v11, v37

    .end local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v5  # "context":Landroid/content/Context;
    .end local v13  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .local v3, "context":Landroid/content/Context;
    .restart local v29  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .restart local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    goto :goto_165b

    .end local v29  # "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    .end local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .end local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .local v3, "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v5  # "context":Landroid/content/Context;
    .local v9, "telephonyRegistry":Lcom/android/server/TelephonyRegistry;
    :catchall_1644
    move-exception v0

    move-object/from16 v41, v3

    move-object/from16 v45, v4

    move-object v3, v5

    move-object v1, v6

    move-object v4, v0

    move-object/from16 v40, v35

    move-object/from16 v11, v37

    .end local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .end local v5  # "context":Landroid/content/Context;
    .local v3, "context":Landroid/content/Context;
    .restart local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    goto :goto_165b

    .end local v37  # "dataRuntimeFeature":Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;
    .end local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .end local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    .local v3, "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v4  # "vpnManager":Lcom/android/server/VpnManagerService;
    .restart local v5  # "context":Landroid/content/Context;
    .local v11, "dataRuntimeFeature":Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;
    :catchall_1651
    move-exception v0

    move-object/from16 v41, v3

    move-object/from16 v45, v4

    move-object v3, v5

    move-object v1, v6

    move-object v4, v0

    move-object/from16 v40, v35

    .line 1770
    .end local v5  # "context":Landroid/content/Context;
    .end local v35  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .local v3, "context":Landroid/content/Context;
    .local v4, "e":Ljava/lang/Throwable;
    .restart local v40  # "dynamicSystem":Lcom/android/server/DynamicSystemService;
    .restart local v41  # "networkManagement":Lcom/android/server/NetworkManagementService;
    .restart local v45  # "vpnManager":Lcom/android/server/VpnManagerService;
    :goto_165b
    const-string v5, "System"

    const-string v6, "******************************************"

    invoke-static {v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1771
    const-string v5, "System"

    const-string v6, "************ Failure starting core service"

    invoke-static {v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1772
    throw v4
.end method

.method private startRotationResolverService(Landroid/content/Context;Lcom/android/server/utils/TimingsTraceAndSlog;)V
    .registers 5
    .param p1, "context"  # Landroid/content/Context;
    .param p2, "t"  # Lcom/android/server/utils/TimingsTraceAndSlog;

    .line 3419
    invoke-static {p1}, Lcom/android/server/rotationresolver/RotationResolverManagerService;->isServiceConfigured(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 3420
    const-string v0, "SystemServer"

    const-string v1, "RotationResolverService is not configured on this device"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3421
    return-void

    .line 3424
    :cond_e
    const-string v0, "StartRotationResolverService"

    invoke-virtual {p2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3425
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-class v1, Lcom/android/server/rotationresolver/RotationResolverManagerService;

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;

    .line 3426
    invoke-virtual {p2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3428
    return-void
.end method

.method private static startSecondarySystemUi(Landroid/content/Context;)V
    .registers 5
    .param p0, "context"  # Landroid/content/Context;

    .line 3448
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 3449
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.android.secondary.systemui"

    const-string v3, "com.android.secondary.systemui.SystemUIService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3451
    const-string v1, "displayId"

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 3452
    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 3454
    sget-object v1, Landroid/os/UserHandle;->SYSTEM:Landroid/os/UserHandle;

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->startServiceAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/ComponentName;

    .line 3455
    return-void
.end method

.method private startSystemCaptionsManagerService(Landroid/content/Context;Lcom/android/server/utils/TimingsTraceAndSlog;)V
    .registers 5
    .param p1, "context"  # Landroid/content/Context;
    .param p2, "t"  # Lcom/android/server/utils/TimingsTraceAndSlog;

    .line 3353
    const v0, 0x104024a

    invoke-direct {p0, p1, v0}, Lcom/android/server/SystemServer;->deviceHasConfigString(Landroid/content/Context;I)Z

    move-result v0

    if-nez v0, :cond_11

    .line 3354
    const-string v0, "SystemServer"

    const-string v1, "SystemCaptionsManagerService disabled because resource is not overlaid"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3355
    return-void

    .line 3358
    :cond_11
    const-string v0, "StartSystemCaptionsManagerService"

    invoke-virtual {p2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3359
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v1, "com.android.server.systemcaptions.SystemCaptionsManagerService"

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 3360
    invoke-virtual {p2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3361
    return-void
.end method

.method private static startSystemUi(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    .registers 5
    .param p0, "context"  # Landroid/content/Context;
    .param p1, "windowManager"  # Lcom/android/server/wm/WindowManagerService;

    .line 3437
    const-class v0, Landroid/content/pm/PackageManagerInternal;

    invoke-static {v0}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageManagerInternal;

    .line 3438
    .local v0, "pm":Landroid/content/pm/PackageManagerInternal;
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 3439
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {v0}, Landroid/content/pm/PackageManagerInternal;->getSystemUiServiceComponent()Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3440
    const/16 v2, 0x100

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 3442
    sget-object v2, Landroid/os/UserHandle;->SYSTEM:Landroid/os/UserHandle;

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->startServiceAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/ComponentName;

    .line 3443
    invoke-virtual {p1}, Lcom/android/server/wm/WindowManagerService;->onSystemUiStarted()V

    .line 3444
    return-void
.end method

.method private startTextToSpeechManagerService(Landroid/content/Context;Lcom/android/server/utils/TimingsTraceAndSlog;)V
    .registers 5
    .param p1, "context"  # Landroid/content/Context;
    .param p2, "t"  # Lcom/android/server/utils/TimingsTraceAndSlog;

    .line 3365
    const-string v0, "StartTextToSpeechManagerService"

    invoke-virtual {p2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3366
    iget-object v0, p0, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const-string v1, "com.android.server.texttospeech.TextToSpeechManagerService"

    invoke-virtual {v0, v1}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    .line 3367
    invoke-virtual {p2}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3368
    return-void
.end method


# virtual methods
.method public dump(Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 7
    .param p1, "pw"  # Ljava/io/PrintWriter;
    .param p2, "args"  # [Ljava/lang/String;

    .line 715
    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    iget-boolean v2, p0, Lcom/android/server/SystemServer;->mRuntimeRestart:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "Runtime restart: %b\n"

    invoke-virtual {p1, v2, v1}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 716
    new-array v0, v0, [Ljava/lang/Object;

    iget v1, p0, Lcom/android/server/SystemServer;->mStartCount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    const-string v1, "Start count: %d\n"

    invoke-virtual {p1, v1, v0}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 717
    const-string v0, "Runtime start-up time: "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 718
    iget-wide v0, p0, Lcom/android/server/SystemServer;->mRuntimeStartUptime:J

    invoke-static {v0, v1, p1}, Landroid/util/TimeUtils;->formatDuration(JLjava/io/PrintWriter;)V

    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 719
    const-string v0, "Runtime start-elapsed time: "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 720
    iget-wide v0, p0, Lcom/android/server/SystemServer;->mRuntimeStartElapsedTime:J

    invoke-static {v0, v1, p1}, Landroid/util/TimeUtils;->formatDuration(JLjava/io/PrintWriter;)V

    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 721
    return-void
.end method

.method public getDumpableName()Ljava/lang/String;
    .registers 2

    .line 710
    const-class v0, Lcom/android/server/SystemServer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$startOtherServices$3$com-android-server-SystemServer()V
    .registers 4

    .line 3060
    const-string v0, "SystemServer"

    const-string v1, "WebViewFactoryPreparation"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3061
    invoke-static {}, Lcom/android/server/utils/TimingsTraceAndSlog;->newAsyncLog()Lcom/android/server/utils/TimingsTraceAndSlog;

    move-result-object v0

    .line 3062
    .local v0, "traceLog":Lcom/android/server/utils/TimingsTraceAndSlog;
    invoke-virtual {v0, v1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3063
    iget-object v1, p0, Lcom/android/server/SystemServer;->mZygotePreload:Ljava/util/concurrent/Future;

    const-string v2, "Zygote preload"

    invoke-static {v1, v2}, Lcom/android/internal/util/ConcurrentUtils;->waitForFutureNoInterrupt(Ljava/util/concurrent/Future;Ljava/lang/String;)Ljava/lang/Object;

    .line 3064
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/server/SystemServer;->mZygotePreload:Ljava/util/concurrent/Future;

    .line 3065
    iget-object v1, p0, Lcom/android/server/SystemServer;->mWebViewUpdateService:Lcom/android/server/webkit/WebViewUpdateService;

    invoke-virtual {v1}, Lcom/android/server/webkit/WebViewUpdateService;->prepareWebViewInSystemServer()V

    .line 3066
    invoke-virtual {v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3067
    return-void
.end method

.method synthetic lambda$startOtherServices$5$com-android-server-SystemServer(Lcom/android/server/utils/TimingsTraceAndSlog;Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;Lcom/android/server/devicepolicy/DevicePolicyManagerService$Lifecycle;Landroid/content/Context;ZLandroid/net/ConnectivityManager;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/VpnManagerService;Lcom/android/server/VcnManagementService;Lcom/android/server/CountryDetectorService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/input/InputManagerService;Lcom/android/server/TelephonyRegistry;Lcom/android/server/media/MediaRouterService;Lcom/android/server/MmsServiceBroker;)V
    .registers 32
    .param p1, "t"  # Lcom/android/server/utils/TimingsTraceAndSlog;
    .param p2, "dataRuntimeFeatureF"  # Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;
    .param p3, "dpms"  # Lcom/android/server/devicepolicy/DevicePolicyManagerService$Lifecycle;
    .param p4, "context"  # Landroid/content/Context;
    .param p5, "safeMode"  # Z
    .param p6, "connectivityF"  # Landroid/net/ConnectivityManager;
    .param p7, "networkManagementF"  # Lcom/android/server/NetworkManagementService;
    .param p8, "networkPolicyF"  # Lcom/android/server/net/NetworkPolicyManagerService;
    .param p9, "vpnManagerF"  # Lcom/android/server/VpnManagerService;
    .param p10, "vcnManagementF"  # Lcom/android/server/VcnManagementService;
    .param p11, "countryDetectorF"  # Lcom/android/server/CountryDetectorService;
    .param p12, "networkTimeUpdaterF"  # Lcom/android/server/NetworkTimeUpdateService;
    .param p13, "inputManagerF"  # Lcom/android/server/input/InputManagerService;
    .param p14, "telephonyRegistryF"  # Lcom/android/server/TelephonyRegistry;
    .param p15, "mediaRouterF"  # Lcom/android/server/media/MediaRouterService;
    .param p16, "mmsServiceF"  # Lcom/android/server/MmsServiceBroker;

    .line 3034
    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p6

    move-object/from16 v4, p8

    const-string v0, "SystemServer"

    const-string v5, "Making services ready"

    invoke-static {v0, v5}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3035
    const-string v0, "StartActivityManagerReadyPhase"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3036
    iget-object v0, v1, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const/16 v5, 0x226

    invoke-virtual {v0, v2, v5}, Lcom/android/server/SystemServiceManager;->startBootPhase(Lcom/android/server/utils/TimingsTraceAndSlog;I)V

    .line 3037
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3038
    const-string v0, "StartObservingNativeCrashes"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3040
    :try_start_22
    iget-object v0, v1, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v0}, Lcom/android/server/am/ActivityManagerService;->startObservingNativeCrashes()V
    :try_end_27
    .catchall {:try_start_22 .. :try_end_27} :catchall_28

    .line 3043
    goto :goto_2f

    .line 3041
    :catchall_28
    move-exception v0

    .line 3042
    .local v0, "e":Ljava/lang/Throwable;
    const-string/jumbo v5, "observing native crashes"

    invoke-direct {p0, v5, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3044
    .end local v0  # "e":Ljava/lang/Throwable;
    :goto_2f
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3046
    const-string v0, "RegisterAppOpsPolicy"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3048
    :try_start_37
    iget-object v0, v1, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    new-instance v5, Lcom/android/server/policy/AppOpsPolicy;

    iget-object v6, v1, Lcom/android/server/SystemServer;->mSystemContext:Landroid/content/Context;

    invoke-direct {v5, v6}, Lcom/android/server/policy/AppOpsPolicy;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v5}, Lcom/android/server/am/ActivityManagerService;->setAppOpsPolicy(Landroid/app/AppOpsManagerInternal$CheckOpsDelegate;)V
    :try_end_43
    .catchall {:try_start_37 .. :try_end_43} :catchall_44

    .line 3051
    goto :goto_4b

    .line 3049
    :catchall_44
    move-exception v0

    .line 3050
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string/jumbo v5, "registering app ops policy"

    invoke-direct {p0, v5, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3052
    .end local v0  # "e":Ljava/lang/Throwable;
    :goto_4b
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3056
    const-string v5, "WebViewFactoryPreparation"

    .line 3057
    .local v5, "WEBVIEW_PREPARATION":Ljava/lang/String;
    const/4 v0, 0x0

    .line 3058
    .local v0, "webviewPrep":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    iget-boolean v6, v1, Lcom/android/server/SystemServer;->mOnlyCore:Z

    const-string v7, "WebViewFactoryPreparation"

    if-nez v6, :cond_66

    iget-object v6, v1, Lcom/android/server/SystemServer;->mWebViewUpdateService:Lcom/android/server/webkit/WebViewUpdateService;

    if-eqz v6, :cond_66

    .line 3059
    new-instance v6, Lcom/android/server/SystemServer$$ExternalSyntheticLambda2;

    invoke-direct {v6, p0}, Lcom/android/server/SystemServer$$ExternalSyntheticLambda2;-><init>(Lcom/android/server/SystemServer;)V

    invoke-static {v6, v7}, Lcom/android/server/SystemServerInitThreadPool;->submit(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v0

    move-object v6, v0

    goto :goto_67

    .line 3071
    :cond_66
    move-object v6, v0

    .end local v0  # "webviewPrep":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    .local v6, "webviewPrep":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :goto_67
    const-string v0, "LPCP-2490@n@c@services@SystemServer.java@2"

    invoke-static {v0}, Lcom/lge/lgdata/LGDataRuntimeFeature;->patchCodeId(Ljava/lang/String;)V

    .line 3072
    const-string v0, "MakeLgDataRuntimeFeatureServiceReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3074
    if-eqz p2, :cond_81

    :try_start_73
    invoke-virtual/range {p2 .. p2}, Lcom/lge/server/datafeaturemanager/LGDataRuntimeFeatureService;->systemReady()V
    :try_end_76
    .catchall {:try_start_73 .. :try_end_76} :catchall_77

    goto :goto_81

    .line 3075
    :catchall_77
    move-exception v0

    move-object v8, v0

    move-object v0, v8

    .line 3076
    .local v0, "e":Ljava/lang/Throwable;
    const-string/jumbo v8, "making LgDataRuntimeFeature Service ready"

    invoke-direct {p0, v8, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_82

    .line 3077
    .end local v0  # "e":Ljava/lang/Throwable;
    :cond_81
    :goto_81
    nop

    .line 3078
    :goto_82
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3080
    iget-object v0, v1, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 3081
    const-string v8, "android.hardware.type.automotive"

    invoke-virtual {v0, v8}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v8

    .line 3082
    .local v8, "isAutomotive":Z
    if-eqz v8, :cond_bb

    .line 3083
    const-string v0, "StartCarServiceHelperService"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3084
    iget-object v0, v1, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    .line 3085
    const-string v9, "com.android.internal.car.CarServiceHelperService"

    invoke-virtual {v0, v9}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/String;)Lcom/android/server/SystemService;

    move-result-object v0

    .line 3086
    .local v0, "cshs":Lcom/android/server/SystemService;
    instance-of v9, v0, Landroid/util/Dumpable;

    if-eqz v9, :cond_a8

    .line 3087
    iget-object v9, v1, Lcom/android/server/SystemServer;->mDumper:Lcom/android/server/SystemServer$SystemServerDumper;

    move-object v10, v0

    check-cast v10, Landroid/util/Dumpable;

    invoke-static {v9, v10}, Lcom/android/server/SystemServer$SystemServerDumper;->-$$Nest$maddDumpable(Lcom/android/server/SystemServer$SystemServerDumper;Landroid/util/Dumpable;)V

    .line 3089
    :cond_a8
    instance-of v9, v0, Landroid/app/admin/DevicePolicySafetyChecker;

    if-eqz v9, :cond_b5

    .line 3090
    move-object v9, v0

    check-cast v9, Landroid/app/admin/DevicePolicySafetyChecker;

    move-object/from16 v10, p3

    invoke-virtual {v10, v9}, Lcom/android/server/devicepolicy/DevicePolicyManagerService$Lifecycle;->setDevicePolicySafetyChecker(Landroid/app/admin/DevicePolicySafetyChecker;)V

    goto :goto_b7

    .line 3089
    :cond_b5
    move-object/from16 v10, p3

    .line 3092
    :goto_b7
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    goto :goto_bd

    .line 3082
    .end local v0  # "cshs":Lcom/android/server/SystemService;
    :cond_bb
    move-object/from16 v10, p3

    .line 3096
    :goto_bd
    const-string v0, "StartSecondarySystemUI"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3098
    :try_start_c2
    invoke-static/range {p4 .. p4}, Lcom/android/server/SystemServer;->startSecondarySystemUi(Landroid/content/Context;)V
    :try_end_c5
    .catchall {:try_start_c2 .. :try_end_c5} :catchall_c6

    .line 3101
    goto :goto_cf

    .line 3099
    :catchall_c6
    move-exception v0

    move-object v9, v0

    move-object v0, v9

    .line 3100
    .local v0, "e":Ljava/lang/Throwable;
    const-string/jumbo v9, "starting Secondary System UI"

    invoke-direct {p0, v9, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3102
    .end local v0  # "e":Ljava/lang/Throwable;
    :goto_cf
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3110
    if-eqz p5, :cond_e9

    .line 3111
    const-string v0, "EnableAirplaneModeInSafeMode"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3113
    const/4 v0, 0x1

    :try_start_da
    invoke-virtual {v3, v0}, Landroid/net/ConnectivityManager;->setAirplaneMode(Z)V
    :try_end_dd
    .catchall {:try_start_da .. :try_end_dd} :catchall_de

    .line 3116
    goto :goto_e6

    .line 3114
    :catchall_de
    move-exception v0

    move-object v9, v0

    move-object v0, v9

    .line 3115
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string v9, "enabling Airplane Mode during Safe Mode bootup"

    invoke-direct {p0, v9, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3117
    .end local v0  # "e":Ljava/lang/Throwable;
    :goto_e6
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3119
    :cond_e9
    const-string v0, "MakeNetworkManagementServiceReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3121
    if-eqz p7, :cond_fe

    .line 3122
    :try_start_f0
    invoke-virtual/range {p7 .. p7}, Lcom/android/server/NetworkManagementService;->systemReady()V
    :try_end_f3
    .catchall {:try_start_f0 .. :try_end_f3} :catchall_f4

    goto :goto_fe

    .line 3124
    :catchall_f4
    move-exception v0

    move-object v9, v0

    move-object v0, v9

    .line 3125
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string/jumbo v9, "making Network Managment Service ready"

    invoke-direct {p0, v9, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_ff

    .line 3126
    .end local v0  # "e":Ljava/lang/Throwable;
    :cond_fe
    :goto_fe
    nop

    .line 3127
    :goto_ff
    const/4 v0, 0x0

    .line 3128
    .local v0, "networkPolicyInitReadySignal":Ljava/util/concurrent/CountDownLatch;
    if-eqz v4, :cond_109

    .line 3129
    nop

    .line 3130
    invoke-virtual/range {p8 .. p8}, Lcom/android/server/net/NetworkPolicyManagerService;->networkScoreAndNetworkManagementServiceReady()Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    move-object v9, v0

    goto :goto_10a

    .line 3128
    :cond_109
    move-object v9, v0

    .line 3132
    .end local v0  # "networkPolicyInitReadySignal":Ljava/util/concurrent/CountDownLatch;
    .local v9, "networkPolicyInitReadySignal":Ljava/util/concurrent/CountDownLatch;
    :goto_10a
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3133
    const-string v0, "MakeConnectivityServiceReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3135
    if-eqz v3, :cond_122

    .line 3136
    :try_start_114
    invoke-virtual/range {p6 .. p6}, Landroid/net/ConnectivityManager;->systemReady()V
    :try_end_117
    .catchall {:try_start_114 .. :try_end_117} :catchall_118

    goto :goto_122

    .line 3138
    :catchall_118
    move-exception v0

    move-object v11, v0

    move-object v0, v11

    .line 3139
    .local v0, "e":Ljava/lang/Throwable;
    const-string/jumbo v11, "making Connectivity Service ready"

    invoke-direct {p0, v11, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_123

    .line 3140
    .end local v0  # "e":Ljava/lang/Throwable;
    :cond_122
    :goto_122
    nop

    .line 3141
    :goto_123
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3142
    const-string v0, "MakeVpnManagerServiceReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3144
    if-eqz p9, :cond_13b

    .line 3145
    :try_start_12d
    invoke-virtual/range {p9 .. p9}, Lcom/android/server/VpnManagerService;->systemReady()V
    :try_end_130
    .catchall {:try_start_12d .. :try_end_130} :catchall_131

    goto :goto_13b

    .line 3147
    :catchall_131
    move-exception v0

    move-object v11, v0

    move-object v0, v11

    .line 3148
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string/jumbo v11, "making VpnManagerService ready"

    invoke-direct {p0, v11, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_13c

    .line 3149
    .end local v0  # "e":Ljava/lang/Throwable;
    :cond_13b
    :goto_13b
    nop

    .line 3150
    :goto_13c
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3151
    const-string v0, "MakeVcnManagementServiceReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3153
    if-eqz p10, :cond_154

    .line 3154
    :try_start_146
    invoke-virtual/range {p10 .. p10}, Lcom/android/server/VcnManagementService;->systemReady()V
    :try_end_149
    .catchall {:try_start_146 .. :try_end_149} :catchall_14a

    goto :goto_154

    .line 3156
    :catchall_14a
    move-exception v0

    move-object v11, v0

    move-object v0, v11

    .line 3157
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string/jumbo v11, "making VcnManagementService ready"

    invoke-direct {p0, v11, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_155

    .line 3158
    .end local v0  # "e":Ljava/lang/Throwable;
    :cond_154
    :goto_154
    nop

    .line 3159
    :goto_155
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3160
    const-string v0, "MakeNetworkPolicyServiceReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3162
    if-eqz v4, :cond_16d

    .line 3163
    :try_start_15f
    invoke-virtual {v4, v9}, Lcom/android/server/net/NetworkPolicyManagerService;->systemReady(Ljava/util/concurrent/CountDownLatch;)V
    :try_end_162
    .catchall {:try_start_15f .. :try_end_162} :catchall_163

    goto :goto_16d

    .line 3165
    :catchall_163
    move-exception v0

    move-object v11, v0

    move-object v0, v11

    .line 3166
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string/jumbo v11, "making Network Policy Service ready"

    invoke-direct {p0, v11, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16e

    .line 3167
    .end local v0  # "e":Ljava/lang/Throwable;
    :cond_16d
    :goto_16d
    nop

    .line 3168
    :goto_16e
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3171
    iget-object v0, v1, Lcom/android/server/SystemServer;->mPackageManagerService:Lcom/android/server/pm/PackageManagerService;

    invoke-virtual {v0}, Lcom/android/server/pm/PackageManagerService;->waitForAppDataPrepared()V

    .line 3175
    const-string v0, "PhaseThirdPartyAppsCanStart"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3177
    if-eqz v6, :cond_180

    .line 3178
    invoke-static {v6, v7}, Lcom/android/internal/util/ConcurrentUtils;->waitForFutureNoInterrupt(Ljava/util/concurrent/Future;Ljava/lang/String;)Ljava/lang/Object;

    .line 3180
    :cond_180
    iget-object v0, v1, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;

    const/16 v7, 0x258

    invoke-virtual {v0, v2, v7}, Lcom/android/server/SystemServiceManager;->startBootPhase(Lcom/android/server/utils/TimingsTraceAndSlog;I)V

    .line 3181
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3183
    invoke-static {}, Landroid/os/UserManager;->isHeadlessSystemUserMode()Z

    move-result v0

    if-eqz v0, :cond_1a6

    if-nez v8, :cond_1a6

    .line 3185
    const-string v0, "BootUserInitializer"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3186
    new-instance v0, Lcom/android/server/BootUserInitializer;

    iget-object v7, v1, Lcom/android/server/SystemServer;->mActivityManagerService:Lcom/android/server/am/ActivityManagerService;

    iget-object v11, v1, Lcom/android/server/SystemServer;->mContentResolver:Landroid/content/ContentResolver;

    invoke-direct {v0, v7, v11}, Lcom/android/server/BootUserInitializer;-><init>(Lcom/android/server/am/ActivityManagerService;Landroid/content/ContentResolver;)V

    invoke-virtual {v0, v2}, Lcom/android/server/BootUserInitializer;->init(Lcom/android/server/utils/TimingsTraceAndSlog;)V

    .line 3187
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3190
    :cond_1a6
    const-string v0, "StartNetworkStack"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3197
    :try_start_1ab
    invoke-static {}, Landroid/net/NetworkStackClient;->getInstance()Landroid/net/NetworkStackClient;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/NetworkStackClient;->start()V
    :try_end_1b2
    .catchall {:try_start_1ab .. :try_end_1b2} :catchall_1b3

    .line 3200
    goto :goto_1ba

    .line 3198
    :catchall_1b3
    move-exception v0

    .line 3199
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string/jumbo v7, "starting Network Stack"

    invoke-direct {p0, v7, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3201
    .end local v0  # "e":Ljava/lang/Throwable;
    :goto_1ba
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3203
    const-string v0, "StartTethering"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3204
    iget-boolean v0, v1, Lcom/android/server/SystemServer;->mOnlyCore:Z

    if-nez v0, :cond_1de

    .line 3207
    :try_start_1c6
    invoke-static {}, Landroid/net/ConnectivityModuleConnector;->getInstance()Landroid/net/ConnectivityModuleConnector;

    move-result-object v0

    const-string v7, "android.net.ITetheringConnector"

    const-string v11, "android.permission.MAINLINE_NETWORK_STACK"

    new-instance v12, Lcom/android/server/SystemServer$$ExternalSyntheticLambda3;

    invoke-direct {v12}, Lcom/android/server/SystemServer$$ExternalSyntheticLambda3;-><init>()V

    invoke-virtual {v0, v7, v11, v12}, Landroid/net/ConnectivityModuleConnector;->startModuleService(Ljava/lang/String;Ljava/lang/String;Landroid/net/ConnectivityModuleConnector$ModuleServiceCallback;)V
    :try_end_1d6
    .catchall {:try_start_1c6 .. :try_end_1d6} :catchall_1d7

    .line 3216
    goto :goto_1de

    .line 3214
    :catchall_1d7
    move-exception v0

    .line 3215
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string/jumbo v7, "starting Tethering"

    invoke-direct {p0, v7, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3218
    .end local v0  # "e":Ljava/lang/Throwable;
    :cond_1de
    :goto_1de
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3220
    const-string v0, "MakeCountryDetectionServiceReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3222
    if-eqz p11, :cond_1f5

    .line 3223
    :try_start_1e8
    invoke-virtual/range {p11 .. p11}, Lcom/android/server/CountryDetectorService;->systemRunning()V
    :try_end_1eb
    .catchall {:try_start_1e8 .. :try_end_1eb} :catchall_1ec

    goto :goto_1f5

    .line 3225
    :catchall_1ec
    move-exception v0

    move-object v7, v0

    move-object v0, v7

    .line 3226
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string v7, "Notifying CountryDetectorService running"

    invoke-direct {p0, v7, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1f6

    .line 3227
    .end local v0  # "e":Ljava/lang/Throwable;
    :cond_1f5
    :goto_1f5
    nop

    .line 3228
    :goto_1f6
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3229
    const-string v0, "MakeNetworkTimeUpdateReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3231
    if-eqz p12, :cond_20d

    .line 3232
    :try_start_200
    invoke-virtual/range {p12 .. p12}, Lcom/android/server/NetworkTimeUpdateService;->systemRunning()V
    :try_end_203
    .catchall {:try_start_200 .. :try_end_203} :catchall_204

    goto :goto_20d

    .line 3234
    :catchall_204
    move-exception v0

    move-object v7, v0

    move-object v0, v7

    .line 3235
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string v7, "Notifying NetworkTimeService running"

    invoke-direct {p0, v7, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_20e

    .line 3236
    .end local v0  # "e":Ljava/lang/Throwable;
    :cond_20d
    :goto_20d
    nop

    .line 3237
    :goto_20e
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3238
    const-string v0, "MakeInputManagerServiceReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3241
    if-eqz p13, :cond_225

    .line 3242
    :try_start_218
    invoke-virtual/range {p13 .. p13}, Lcom/android/server/input/InputManagerService;->systemRunning()V
    :try_end_21b
    .catchall {:try_start_218 .. :try_end_21b} :catchall_21c

    goto :goto_225

    .line 3244
    :catchall_21c
    move-exception v0

    move-object v7, v0

    move-object v0, v7

    .line 3245
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string v7, "Notifying InputManagerService running"

    invoke-direct {p0, v7, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_226

    .line 3246
    .end local v0  # "e":Ljava/lang/Throwable;
    :cond_225
    :goto_225
    nop

    .line 3247
    :goto_226
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3248
    const-string v0, "MakeTelephonyRegistryReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3250
    if-eqz p14, :cond_23d

    .line 3251
    :try_start_230
    invoke-virtual/range {p14 .. p14}, Lcom/android/server/TelephonyRegistry;->systemRunning()V
    :try_end_233
    .catchall {:try_start_230 .. :try_end_233} :catchall_234

    goto :goto_23d

    .line 3253
    :catchall_234
    move-exception v0

    move-object v7, v0

    move-object v0, v7

    .line 3254
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string v7, "Notifying TelephonyRegistry running"

    invoke-direct {p0, v7, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_23e

    .line 3255
    .end local v0  # "e":Ljava/lang/Throwable;
    :cond_23d
    :goto_23d
    nop

    .line 3256
    :goto_23e
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3257
    const-string v0, "MakeMediaRouterServiceReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3259
    if-eqz p15, :cond_255

    .line 3260
    :try_start_248
    invoke-virtual/range {p15 .. p15}, Lcom/android/server/media/MediaRouterService;->systemRunning()V
    :try_end_24b
    .catchall {:try_start_248 .. :try_end_24b} :catchall_24c

    goto :goto_255

    .line 3262
    :catchall_24c
    move-exception v0

    move-object v7, v0

    move-object v0, v7

    .line 3263
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string v7, "Notifying MediaRouterService running"

    invoke-direct {p0, v7, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_256

    .line 3264
    .end local v0  # "e":Ljava/lang/Throwable;
    :cond_255
    :goto_255
    nop

    .line 3265
    :goto_256
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3266
    iget-object v0, v1, Lcom/android/server/SystemServer;->mPackageManager:Landroid/content/pm/PackageManager;

    const-string v7, "android.hardware.telephony"

    invoke-virtual {v0, v7}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_27b

    .line 3267
    const-string v0, "MakeMmsServiceReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3269
    if-eqz p16, :cond_277

    :try_start_26a
    invoke-virtual/range {p16 .. p16}, Lcom/android/server/MmsServiceBroker;->systemRunning()V
    :try_end_26d
    .catchall {:try_start_26a .. :try_end_26d} :catchall_26e

    goto :goto_277

    .line 3270
    :catchall_26e
    move-exception v0

    move-object v7, v0

    move-object v0, v7

    .line 3271
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string v7, "Notifying MmsService running"

    invoke-direct {p0, v7, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_278

    .line 3272
    .end local v0  # "e":Ljava/lang/Throwable;
    :cond_277
    :goto_277
    nop

    .line 3273
    :goto_278
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3276
    :cond_27b
    const-string v0, "IncidentDaemonReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3280
    :try_start_280
    const-string/jumbo v0, "incident"

    .line 3281
    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 3280
    invoke-static {v0}, Landroid/os/IIncidentManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IIncidentManager;

    move-result-object v0

    .line 3282
    .local v0, "incident":Landroid/os/IIncidentManager;
    if-eqz v0, :cond_290

    .line 3283
    invoke-interface {v0}, Landroid/os/IIncidentManager;->systemRunning()V
    :try_end_290
    .catchall {:try_start_280 .. :try_end_290} :catchall_291

    .line 3287
    .end local v0  # "incident":Landroid/os/IIncidentManager;
    :cond_290
    goto :goto_297

    .line 3285
    :catchall_291
    move-exception v0

    .line 3286
    .local v0, "e":Ljava/lang/Throwable;
    const-string v7, "Notifying incident daemon running"

    invoke-direct {p0, v7, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3288
    .end local v0  # "e":Ljava/lang/Throwable;
    :goto_297
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3290
    iget-wide v11, v1, Lcom/android/server/SystemServer;->mIncrementalServiceHandle:J

    const-wide/16 v13, 0x0

    cmp-long v0, v11, v13

    if-eqz v0, :cond_2af

    .line 3291
    const-string v0, "MakeIncrementalServiceReady"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3292
    iget-wide v11, v1, Lcom/android/server/SystemServer;->mIncrementalServiceHandle:J

    invoke-static {v11, v12}, Lcom/android/server/SystemServer;->setIncrementalServiceSystemReady(J)V

    .line 3293
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3296
    :cond_2af
    const-string v0, "OdsignStatsLogger"

    invoke-virtual {v2, v0}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V

    .line 3298
    :try_start_2b4
    invoke-static {}, Lcom/android/server/pm/dex/OdsignStatsLogger;->triggerStatsWrite()V
    :try_end_2b7
    .catchall {:try_start_2b4 .. :try_end_2b7} :catchall_2b8

    .line 3301
    goto :goto_2c0

    .line 3299
    :catchall_2b8
    move-exception v0

    move-object v7, v0

    move-object v0, v7

    .line 3300
    .restart local v0  # "e":Ljava/lang/Throwable;
    const-string v7, "Triggering OdsignStatsLogger"

    invoke-direct {p0, v7, v0}, Lcom/android/server/SystemServer;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3302
    .end local v0  # "e":Ljava/lang/Throwable;
    :goto_2c0
    invoke-virtual/range {p1 .. p1}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceEnd()V

    .line 3303
    return-void
.end method
