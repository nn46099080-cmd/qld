package com.qldalert.app

import android.app.Activity
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.Gravity
import android.view.ViewGroup
import android.widget.FrameLayout
import com.unity3d.mediation.LevelPlayAdError
import com.unity3d.mediation.LevelPlayAdInfo
import com.unity3d.mediation.LevelPlayAdSize
import com.unity3d.mediation.banner.LevelPlayBannerAdView
import com.unity3d.mediation.banner.LevelPlayBannerAdViewListener

object LevelPlayExitMrecManager : LevelPlayBannerAdViewListener {
    private const val TAG = "LevelPlay"
    private const val RETRY_DELAY_MS = 60_000L
    private val handler = Handler(Looper.getMainLooper())
    private var activity: Activity? = null
    private var adView: LevelPlayBannerAdView? = null
    private var attachedContainer: FrameLayout? = null
    private var state = "idle"
    private var loading = false
    private var stateListener: ((String, LevelPlayAdError?) -> Unit)? = null

    fun preload(activity: Activity) {
        this.activity = activity
        if (!LevelPlayConfig.hasExitMrecAdUnit()) return
        LevelPlayAdsManager.whenInitialized { success ->
            if (success) loadIfNeeded() else scheduleRetry()
        }
    }

    fun attach(
        activity: Activity,
        container: FrameLayout,
        listener: (String, LevelPlayAdError?) -> Unit,
    ): String {
        this.activity = activity
        stateListener = listener
        attachedContainer = container
        attachAdViewToContainer()
        preload(activity)
        return state
    }

    fun detach(container: FrameLayout) {
        if (attachedContainer !== container) return
        (adView?.parent as? ViewGroup)?.removeView(adView)
        attachedContainer = null
        stateListener = null
        Log.d(TAG, "Exit MREC detached and kept preloaded")
    }

    fun destroy() {
        handler.removeCallbacksAndMessages(null)
        (adView?.parent as? ViewGroup)?.removeView(adView)
        adView?.setBannerListener(null)
        adView?.destroy()
        adView = null
        attachedContainer = null
        stateListener = null
        loading = false
        state = "idle"
        Log.d(TAG, "Exit MREC preload destroyed")
    }

    private fun loadIfNeeded() {
        val currentActivity = activity ?: return
        if (loading || adView != null) return
        loading = true
        state = "loading"
        val config = LevelPlayBannerAdView.Config.Builder()
            .setAdSize(LevelPlayAdSize.MEDIUM_RECTANGLE)
            .build()
        adView = LevelPlayBannerAdView(
            currentActivity,
            LevelPlayConfig.EXIT_MREC_AD_UNIT_ID,
            config,
        ).also {
            it.setBannerListener(this)
            attachAdViewToContainer()
            Log.d(TAG, "Exit MREC preload request size=300x250")
            it.loadAd()
        }
    }

    private fun attachAdViewToContainer() {
        val target = attachedContainer ?: return
        val view = adView ?: return
        (view.parent as? ViewGroup)?.removeView(view)
        target.removeAllViews()
        val density = target.resources.displayMetrics.density
        target.addView(
            view,
            FrameLayout.LayoutParams(
                (300 * density).toInt(),
                (250 * density).toInt(),
                Gravity.CENTER,
            ),
        )
        if (state == "loaded" || state == "visible") {
            stateListener?.invoke(state, null)
        }
    }

    private fun scheduleRetry() {
        handler.removeCallbacksAndMessages(null)
        handler.postDelayed(::loadIfNeeded, RETRY_DELAY_MS)
    }

    override fun onAdLoaded(adInfo: LevelPlayAdInfo) {
        loading = false
        state = "loaded"
        Log.d(TAG, "Exit MREC preload success adInfo=$adInfo")
        stateListener?.invoke(state, null)
    }

    override fun onAdLoadFailed(error: LevelPlayAdError) {
        loading = false
        state = "failed"
        Log.e(TAG, "Exit MREC preload failed code=${error.errorCode} message=${error.errorMessage}")
        stateListener?.invoke(state, error)
        adView?.setBannerListener(null)
        adView?.destroy()
        adView = null
        scheduleRetry()
    }

    override fun onAdDisplayed(adInfo: LevelPlayAdInfo) {
        state = "visible"
        Log.d(TAG, "Exit MREC visible on screen adInfo=$adInfo")
        stateListener?.invoke(state, null)
    }

    override fun onAdDisplayFailed(adInfo: LevelPlayAdInfo, error: LevelPlayAdError) {
        state = "failed"
        Log.e(TAG, "Exit MREC display failed code=${error.errorCode} message=${error.errorMessage}")
        stateListener?.invoke(state, error)
    }

    override fun onAdClicked(adInfo: LevelPlayAdInfo) = Unit
    override fun onAdExpanded(adInfo: LevelPlayAdInfo) = Unit
    override fun onAdCollapsed(adInfo: LevelPlayAdInfo) = Unit
    override fun onAdLeftApplication(adInfo: LevelPlayAdInfo) = Unit
}
