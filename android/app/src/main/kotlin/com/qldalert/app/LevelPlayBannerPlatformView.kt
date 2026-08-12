package com.qldalert.app

import android.app.Activity
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.Gravity
import android.view.View
import android.widget.FrameLayout
import com.unity3d.mediation.LevelPlayAdError
import com.unity3d.mediation.LevelPlayAdInfo
import com.unity3d.mediation.LevelPlayAdSize
import com.unity3d.mediation.banner.LevelPlayBannerAdView
import com.unity3d.mediation.banner.LevelPlayBannerAdViewListener
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

private const val BANNER_TAG = "LevelPlay"
private const val BANNER_DEFAULT_RETRY_DELAY_MS = 60_000L
private val BANNER_NO_FILL_RETRY_DELAYS_MS = longArrayOf(15_000L, 30_000L, 60_000L)

class LevelPlayBannerPlatformView(
    private val activity: Activity,
    messenger: BinaryMessenger,
    viewId: Int,
    creationParams: Any?,
) : PlatformView, LevelPlayBannerAdViewListener {
    private val isMrec = (creationParams as? Map<*, *>)?.get("format") == "mrec"
    private val formatName = if (isMrec) "MREC" else "Banner"
    private val adUnitId = if (isMrec) {
        LevelPlayConfig.EXIT_MREC_AD_UNIT_ID
    } else {
        LevelPlayConfig.BANNER_AD_UNIT_ID
    }
    private val adSize = if (isMrec) {
        LevelPlayAdSize.MEDIUM_RECTANGLE
    } else {
        LevelPlayAdSize.BANNER
    }
    private val widthDp = if (isMrec) 300 else 320
    private val heightDp = if (isMrec) 250 else 50
    private val container = FrameLayout(activity)
    private val channel = MethodChannel(messenger, "qld_alert/levelplay_banner_$viewId")
    private val retryHandler = Handler(Looper.getMainLooper())
    private var bannerView: LevelPlayBannerAdView? = null
    private var disposed = false
    private var loading = false
    private var flutterReady = false
    private var bannerState = "idle"
    private var consecutiveNoFillFailures = 0

    init {
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "ready" -> {
                    flutterReady = true
                    Log.d(BANNER_TAG, "$formatName Flutter channel ready viewId=$viewId")
                    result.success(mapOf("state" to bannerState))
                    awaitInitializationAndLoad()
                }
                else -> result.notImplemented()
            }
        }
    }

    override fun getView(): View = container

    private fun awaitInitializationAndLoad() {
        if (disposed) return
        val hasAdUnit = if (isMrec) {
            LevelPlayConfig.hasExitMrecAdUnit()
        } else {
            LevelPlayConfig.hasBannerAdUnit()
        }
        if (!hasAdUnit) {
            bannerState = "failed"
            Log.e(BANNER_TAG, "$formatName request blocked: missing ad unit ID")
            notifyFailure("CONFIG_MISSING", "LevelPlay $formatName ad unit ID is missing")
            return
        }
        if (isMrec) {
            bannerState = LevelPlayExitMrecManager.attach(activity, container) { state, error ->
                bannerState = state
                when (state) {
                    "loaded" -> notifyFlutter("loadSuccess")
                    "visible" -> notifyFlutter("visible")
                    "failed" -> notifyFailure(
                        error?.errorCode?.toString() ?: "LOAD_FAILED",
                        error?.errorMessage ?: "Exit MREC preload failed",
                    )
                }
            }
            return
        }
        LevelPlayAdsManager.whenInitialized { success ->
            if (success) {
                loadBanner()
            } else {
                bannerState = "failed"
                notifyFailure("INIT_FAILED", "LevelPlay SDK initialization failed")
                retryHandler.postDelayed(
                    ::awaitInitializationAndLoad,
                    BANNER_DEFAULT_RETRY_DELAY_MS,
                )
            }
        }
    }

    private fun loadBanner() {
        if (disposed || loading || bannerView != null) return
        loading = true
        bannerState = "loading"
        val config = LevelPlayBannerAdView.Config.Builder()
            .setAdSize(adSize)
            .build()
        val banner = LevelPlayBannerAdView(
            activity,
            adUnitId,
            config,
        )
        banner.setBannerListener(this)
        bannerView = banner
        container.removeAllViews()
        val density = activity.resources.displayMetrics.density
        val bannerWidthPx = (widthDp * density).toInt()
        val bannerHeightPx = (heightDp * density).toInt()
        container.addView(
            banner,
            FrameLayout.LayoutParams(bannerWidthPx, bannerHeightPx, Gravity.CENTER),
        )
        Log.d(
            BANNER_TAG,
            "$formatName load request adUnit=${masked(adUnitId)} " +
                "size=${widthDp}x${heightDp}dp pixels=${bannerWidthPx}x${bannerHeightPx}",
        )
        banner.loadAd()
    }

    override fun onAdLoaded(adInfo: LevelPlayAdInfo) {
        if (disposed) return
        loading = false
        bannerState = "loaded"
        consecutiveNoFillFailures = 0
        Log.d(BANNER_TAG, "$formatName load success adInfo=$adInfo")
        notifyFlutter("loadSuccess")
    }

    override fun onAdLoadFailed(error: LevelPlayAdError) {
        if (disposed) return
        loading = false
        bannerState = "failed"
        val isNoFill = isNoFill(error)
        Log.e(
            BANNER_TAG,
            "$formatName load failed noFill=$isNoFill code=${error.errorCode} " +
                "message=${error.errorMessage} adUnit=${error.adUnitId} adId=${error.adId}",
        )
        notifyFailure(error.errorCode.toString(), error.errorMessage)
        destroyBanner()
        scheduleRetry(isNoFill)
    }

    override fun onAdDisplayed(adInfo: LevelPlayAdInfo) {
        if (disposed) return
        bannerState = "visible"
        Log.d(BANNER_TAG, "$formatName visible on screen adInfo=$adInfo")
        notifyFlutter("visible")
    }

    override fun onAdDisplayFailed(adInfo: LevelPlayAdInfo, error: LevelPlayAdError) {
        if (disposed) return
        bannerState = "failed"
        val noFill = isNoFill(error)
        Log.e(
            BANNER_TAG,
            "$formatName display failed noFill=$noFill code=${error.errorCode} " +
                "message=${error.errorMessage} adInfo=$adInfo",
        )
        notifyFailure(error.errorCode.toString(), error.errorMessage)
        destroyBanner()
        scheduleRetry(noFill)
    }

    override fun onAdClicked(adInfo: LevelPlayAdInfo) {
        Log.d(BANNER_TAG, "Banner clicked adInfo=$adInfo")
    }

    override fun onAdExpanded(adInfo: LevelPlayAdInfo) {
        Log.d(BANNER_TAG, "Banner expanded adInfo=$adInfo")
    }

    override fun onAdCollapsed(adInfo: LevelPlayAdInfo) {
        Log.d(BANNER_TAG, "Banner collapsed adInfo=$adInfo")
    }

    override fun onAdLeftApplication(adInfo: LevelPlayAdInfo) {
        Log.d(BANNER_TAG, "Banner left application adInfo=$adInfo")
    }

    private fun scheduleRetry(noFill: Boolean) {
        if (disposed) return
        val delayMs = if (noFill) {
            val index = consecutiveNoFillFailures.coerceAtMost(
                BANNER_NO_FILL_RETRY_DELAYS_MS.lastIndex,
            )
            consecutiveNoFillFailures += 1
            BANNER_NO_FILL_RETRY_DELAYS_MS[index]
        } else {
            consecutiveNoFillFailures = 0
            BANNER_DEFAULT_RETRY_DELAY_MS
        }
        Log.d(
            BANNER_TAG,
            "$formatName retry scheduled reason=${if (noFill) "NO_FILL" else "LOAD_ERROR"} " +
                "attempt=$consecutiveNoFillFailures delaySeconds=${delayMs / 1000}",
        )
        retryHandler.removeCallbacksAndMessages(null)
        retryHandler.postDelayed(::loadBanner, delayMs)
    }

    private fun isNoFill(error: LevelPlayAdError): Boolean =
        error.errorCode == 509 ||
            error.errorMessage.contains("no fill", ignoreCase = true) ||
            error.errorMessage.contains("no ad", ignoreCase = true)

    private fun notifyFailure(code: String, message: String) {
        if (flutterReady) {
            channel.invokeMethod("loadFailed", mapOf("code" to code, "message" to message))
        }
    }

    private fun notifyFlutter(method: String) {
        if (flutterReady) channel.invokeMethod(method, null)
    }

    private fun destroyBanner() {
        bannerView?.setBannerListener(null)
        bannerView?.destroy()
        bannerView = null
        container.removeAllViews()
    }

    override fun dispose() {
        disposed = true
        channel.setMethodCallHandler(null)
        retryHandler.removeCallbacksAndMessages(null)
        if (isMrec) {
            LevelPlayExitMrecManager.detach(container)
        } else {
            destroyBanner()
        }
        Log.d(BANNER_TAG, "$formatName disposed")
    }

    private fun masked(value: String): String = when {
        value.length <= 4 -> "****"
        else -> "${value.take(2)}***${value.takeLast(2)}"
    }
}
