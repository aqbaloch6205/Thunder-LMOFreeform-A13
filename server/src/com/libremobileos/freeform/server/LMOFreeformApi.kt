package com.libremobileos.freeform.server

import com.libremobileos.freeform.server.sidebar.SidebarController

/**
 * Static entry points for smali hooks (hardware key, gesture, etc.) inside system_server:
 *   invoke-static {}, Lcom/libremobileos/freeform/server/LMOFreeformApi;->toggleSidebar()V
 * All calls are safe from any thread and never throw.
 */
object LMOFreeformApi {
    @Volatile internal var sidebar: SidebarController? = null

    @JvmStatic fun toggleSidebar() { runCatching { sidebar?.toggle() } }
    @JvmStatic fun openSidebar() { runCatching { sidebar?.open() } }
    @JvmStatic fun closeSidebar() { runCatching { sidebar?.close() } }
}
