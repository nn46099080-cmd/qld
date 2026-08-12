package com.qldalert.app

import android.content.Intent
import android.content.pm.ShortcutInfo
import android.content.pm.ShortcutManager
import android.graphics.drawable.Icon
import android.net.Uri
import android.os.Build
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformViewFactory

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        flutterEngine.platformViewsController.registry.registerViewFactory(
            "qld_alert/levelplay_banner",
            object : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
                override fun create(
                    context: android.content.Context,
                    viewId: Int,
                    args: Any?
                ): io.flutter.plugin.platform.PlatformView {
                    return LevelPlayBannerPlatformView(
                        this@MainActivity,
                        flutterEngine.dartExecutor.binaryMessenger,
                        viewId,
                        args,
                    )
                }
            }
        )

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "qld_alert/app_settings"
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "openNotificationSettings" -> {
                    openNotificationSettings()
                    result.success(null)
                }
                "openAppSettings" -> {
                    openAppSettings()
                    result.success(null)
                }
                "requestPinShortcut" -> {
                    result.success(requestPinShortcut())
                }
                "showInterstitial" -> {
                    LevelPlayAdsManager.requestInterstitial(this, result)
                }
                "preloadExitMrec" -> {
                    LevelPlayExitMrecManager.preload(this)
                    result.success(null)
                }
                "destroyExitMrec" -> {
                    LevelPlayExitMrecManager.destroy()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
        LevelPlayAdsManager.initialize(applicationContext)
    }

    override fun onDestroy() {
        LevelPlayExitMrecManager.destroy()
        super.onDestroy()
    }

    private fun openNotificationSettings() {
        val intent = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS).apply {
                putExtra(Settings.EXTRA_APP_PACKAGE, packageName)
            }
        } else {
            Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS).apply {
                data = Uri.parse("package:$packageName")
            }
        }
        startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
    }

    private fun openAppSettings() {
        val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS).apply {
            data = Uri.parse("package:$packageName")
        }
        startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
    }

    private fun requestPinShortcut(): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return false

        val shortcutManager = getSystemService(ShortcutManager::class.java)
            ?: return false
        if (!shortcutManager.isRequestPinShortcutSupported) return false

        val launchIntent = Intent(this, MainActivity::class.java).apply {
            action = Intent.ACTION_MAIN
            addCategory(Intent.CATEGORY_LAUNCHER)
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        val shortcut = ShortcutInfo.Builder(this, "qld_alert_home")
            .setShortLabel("QLD Alert")
            .setLongLabel("QLD Dip Alert")
            .setIcon(Icon.createWithResource(this, R.mipmap.ic_launcher))
            .setIntent(launchIntent)
            .build()

        return shortcutManager.requestPinShortcut(shortcut, null)
    }
}
