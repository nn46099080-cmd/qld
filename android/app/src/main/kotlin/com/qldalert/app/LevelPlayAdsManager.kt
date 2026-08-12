package com.qldalert.app

import android.app.Activity
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import com.unity3d.mediation.LevelPlay
import com.unity3d.mediation.LevelPlayAdError
import com.unity3d.mediation.LevelPlayAdInfo
import com.unity3d.mediation.LevelPlayConfiguration
import com.unity3d.mediation.LevelPlayInitError
import com.unity3d.mediation.LevelPlayInitListener
import com.unity3d.mediation.LevelPlayInitRequest
import com.unity3d.mediation.interstitial.LevelPlayInterstitialAd
import com.unity3d.mediation.interstitial.LevelPlayInterstitialAdListener
import io.flutter.plugin.common.MethodChannel
import java.lang.ref.WeakReference

private const val LEVELPLAY_TAG = "LevelPlay"
private const val LEVELPLAY_RETRY_DELAY_MS = 60_000L

object LevelPlayAdsManager : LevelPlayInitListener, LevelPlayInterstitialAdListener {
    private val mainHandler = Handler(Looper.getMainLooper())
    private val initializationCallbacks = mutableListOf<(Boolean) -> Unit>()
    private var applicationContext: Context? = null
    private var initialized = false
    private var initializationStarted = false
    private var interstitialAd: LevelPlayInterstitialAd? = null
    private var interstitialLoading = false
    private var interstitialShowing = false
    private var pendingInterstitialResult: MethodChannel.Result? = null
    private var pendingActivity = WeakReference<Activity>(null)

    fun initialize(context: Context) {
        applicationContext = context.applicationContext
        if (initialized || initializationStarted) return
        if (!LevelPlayConfig.hasAppKey()) {
            Log.e(
                LEVELPLAY_TAG,
                "SDK init blocked: missing LevelPlay ${LevelPlayConfig.missingValues().joinToString()}",
            )
            finishInitialization(false)
            return
        }

        initializationStarted = true
        Log.d(LEVELPLAY_TAG, "SDK init start appKey=${masked(LevelPlayConfig.APP_KEY)}")
        LevelPlay.setAdaptersDebug(true)
        val request = LevelPlayInitRequest.Builder(LevelPlayConfig.APP_KEY).build()
        LevelPlay.init(context.applicationContext, request, this)
    }

    fun whenInitialized(callback: (Boolean) -> Unit) {
        if (initialized) {
            callback(true)
            return
        }
        initializationCallbacks.add(callback)
        applicationContext?.let(::initialize)
    }

    override fun onInitSuccess(configuration: LevelPlayConfiguration) {
        initialized = true
        initializationStarted = false
        Log.d(LEVELPLAY_TAG, "SDK init success version=${LevelPlay.getSdkVersion()}")
        createAndLoadInterstitial()
        finishInitialization(true)
    }

    override fun onInitFailed(error: LevelPlayInitError) {
        initialized = false
        initializationStarted = false
        Log.e(
            LEVELPLAY_TAG,
            "SDK init failed: code=${error.errorCode} message=${error.errorMessage}",
        )
        finishInitialization(false)
        finishPendingInterstitial(false)
        mainHandler.postDelayed(
            { applicationContext?.let(::initialize) },
            LEVELPLAY_RETRY_DELAY_MS,
        )
    }

    fun requestInterstitial(activity: Activity, result: MethodChannel.Result) {
        if (pendingInterstitialResult != null || interstitialShowing) {
            Log.d(LEVELPLAY_TAG, "Interstitial request skipped: request already active")
            result.success(false)
            return
        }
        if (!LevelPlayConfig.hasInterstitialAdUnit()) {
            Log.e(LEVELPLAY_TAG, "Interstitial request blocked: missing INTERSTITIAL_AD_UNIT_ID")
            result.success(false)
            return
        }

        pendingInterstitialResult = result
        pendingActivity = WeakReference(activity)
        Log.d(
            LEVELPLAY_TAG,
            "Interstitial show request adUnit=${masked(LevelPlayConfig.INTERSTITIAL_AD_UNIT_ID)}",
        )
        when {
            interstitialAd?.isAdReady == true -> showInterstitial()
            initialized -> createAndLoadInterstitial()
            else -> whenInitialized { success ->
                if (success) createAndLoadInterstitial() else finishPendingInterstitial(false)
            }
        }
    }

    private fun createAndLoadInterstitial() {
        if (!initialized || !LevelPlayConfig.hasInterstitialAdUnit()) return
        if (interstitialAd == null) {
            interstitialAd = LevelPlayInterstitialAd(LevelPlayConfig.INTERSTITIAL_AD_UNIT_ID).also {
                it.setListener(this)
            }
        }
        loadInterstitial()
    }

    private fun loadInterstitial() {
        val ad = interstitialAd ?: return
        if (!initialized || interstitialLoading || interstitialShowing || ad.isAdReady) return
        interstitialLoading = true
        Log.d(
            LEVELPLAY_TAG,
            "Interstitial load request adUnit=${masked(LevelPlayConfig.INTERSTITIAL_AD_UNIT_ID)}",
        )
        ad.loadAd()
    }

    private fun showInterstitial() {
        val activity = pendingActivity.get()
        val ad = interstitialAd
        if (ad == null || !ad.isAdReady || activity == null || activity.isFinishing) {
            Log.e(LEVELPLAY_TAG, "Interstitial show failed: ad or Activity unavailable")
            finishPendingInterstitial(false)
            return
        }
        interstitialShowing = true
        Log.d(LEVELPLAY_TAG, "Interstitial show called")
        ad.showAd(activity)
    }

    override fun onAdLoaded(adInfo: LevelPlayAdInfo) {
        interstitialLoading = false
        Log.d(LEVELPLAY_TAG, "Interstitial load success adInfo=$adInfo")
        if (pendingInterstitialResult != null) showInterstitial()
    }

    override fun onAdLoadFailed(error: LevelPlayAdError) {
        interstitialLoading = false
        logAdError("Interstitial load failed", error)
        finishPendingInterstitial(false)
        mainHandler.postDelayed(::loadInterstitial, LEVELPLAY_RETRY_DELAY_MS)
    }

    override fun onAdDisplayed(adInfo: LevelPlayAdInfo) {
        Log.d(LEVELPLAY_TAG, "Interstitial visible on screen adInfo=$adInfo")
        finishPendingInterstitial(true)
    }

    override fun onAdDisplayFailed(error: LevelPlayAdError, adInfo: LevelPlayAdInfo) {
        interstitialShowing = false
        logAdError("Interstitial display failed", error)
        finishPendingInterstitial(false)
        loadInterstitial()
    }

    override fun onAdClicked(adInfo: LevelPlayAdInfo) {
        Log.d(LEVELPLAY_TAG, "Interstitial clicked adInfo=$adInfo")
    }

    override fun onAdClosed(adInfo: LevelPlayAdInfo) {
        Log.d(LEVELPLAY_TAG, "Interstitial closed adInfo=$adInfo")
        interstitialShowing = false
        loadInterstitial()
    }

    override fun onAdInfoChanged(adInfo: LevelPlayAdInfo) {
        Log.d(LEVELPLAY_TAG, "Interstitial ad info changed adInfo=$adInfo")
    }

    private fun finishInitialization(success: Boolean) {
        initializationCallbacks.toList().forEach { it(success) }
        initializationCallbacks.clear()
    }

    private fun finishPendingInterstitial(shown: Boolean) {
        pendingInterstitialResult?.success(shown)
        pendingInterstitialResult = null
        pendingActivity.clear()
    }

    private fun logAdError(prefix: String, error: LevelPlayAdError) {
        val noFill = error.errorCode == 509 ||
            error.errorMessage.contains("no fill", ignoreCase = true) ||
            error.errorMessage.contains("no ad", ignoreCase = true)
        Log.e(
            LEVELPLAY_TAG,
            "$prefix noFill=$noFill code=${error.errorCode} message=${error.errorMessage} " +
                "adUnit=${error.adUnitId} adId=${error.adId}",
        )
    }

    private fun masked(value: String): String = when {
        value.length <= 4 -> "****"
        else -> "${value.take(2)}***${value.takeLast(2)}"
    }
}
