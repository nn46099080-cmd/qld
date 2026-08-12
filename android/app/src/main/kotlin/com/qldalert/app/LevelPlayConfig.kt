package com.qldalert.app

/**
 * Values issued by Unity LevelPlay. Direct Unity Ads Game/Placement IDs are not
 * valid here. Replace all three placeholders before publishing the app.
 */
object LevelPlayConfig {
    const val APP_KEY = "278f656bd"
    const val BANNER_AD_UNIT_ID = "f34aojqfif1im50h"
    const val EXIT_MREC_AD_UNIT_ID = "5h742lazyxxkhbgw"
    const val INTERSTITIAL_AD_UNIT_ID = "m6iijnj9gkxs2ehj"

    private const val PLACEHOLDER_PREFIX = "REPLACE_WITH_"

    fun missingValues(): List<String> = buildList {
        if (APP_KEY.startsWith(PLACEHOLDER_PREFIX)) add("APP_KEY")
        if (BANNER_AD_UNIT_ID.startsWith(PLACEHOLDER_PREFIX)) add("BANNER_AD_UNIT_ID")
        if (EXIT_MREC_AD_UNIT_ID.startsWith(PLACEHOLDER_PREFIX)) {
            add("EXIT_MREC_AD_UNIT_ID")
        }
        if (INTERSTITIAL_AD_UNIT_ID.startsWith(PLACEHOLDER_PREFIX)) {
            add("INTERSTITIAL_AD_UNIT_ID")
        }
    }

    fun hasAppKey(): Boolean = !APP_KEY.startsWith(PLACEHOLDER_PREFIX)
    fun hasBannerAdUnit(): Boolean = !BANNER_AD_UNIT_ID.startsWith(PLACEHOLDER_PREFIX)
    fun hasExitMrecAdUnit(): Boolean = !EXIT_MREC_AD_UNIT_ID.startsWith(PLACEHOLDER_PREFIX)
    fun hasInterstitialAdUnit(): Boolean =
        !INTERSTITIAL_AD_UNIT_ID.startsWith(PLACEHOLDER_PREFIX)
}
