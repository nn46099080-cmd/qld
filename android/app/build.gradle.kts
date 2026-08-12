import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
    
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")

if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.qldalert.app"
    compileSdk = 36
    compileOptions {
    sourceCompatibility = JavaVersion.VERSION_1_8
    targetCompatibility = JavaVersion.VERSION_1_8
    isCoreLibraryDesugaringEnabled = true
    }
    ndkVersion = "28.2.13676358"

    defaultConfig {
        applicationId = "com.qldalert.app"
        minSdk = flutter.minSdkVersion
        targetSdk = 36
        versionCode = 79
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            if (keystorePropertiesFile.exists()) {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = file("upload-keystore.jks")
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}

flutter {
    source = "../.."
}
dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")
    implementation("com.unity3d.ads-mediation:mediation-sdk:9.5.0")
    implementation("com.unity3d.ads-mediation:unityads-adapter:5.11.0")
    implementation("com.unity3d.ads:unity-ads:4.19.0")

    // LevelPlay mediation networks. A network serves only after its account
    // and banner/interstitial instances are activated in the dashboard.
    implementation("com.unity3d.ads-mediation:admob-adapter:5.13.0")
    implementation("com.google.android.libraries.ads.mobile.sdk:ads-mobile-sdk:1.3.1")
    implementation("com.unity3d.ads-mediation:applovin-adapter:5.9.0")
    implementation("com.applovin:applovin-sdk:13.6.4")
    implementation("com.unity3d.ads-mediation:facebook-adapter:5.4.0")
    implementation("com.facebook.android:audience-network-sdk:6.22.0")
    implementation("com.unity3d.ads-mediation:mintegral-adapter:5.18.0")
    implementation("com.mbridge.msdk.oversea:mbridge_android_sdk:16.9.91")
    implementation("com.unity3d.ads-mediation:pangle-adapter:5.22.0")
    implementation("com.pangle.global:pag-sdk:8.2.0.4")
    implementation("com.unity3d.ads-mediation:vungle-adapter:5.13.0")
    implementation("com.vungle:vungle-ads:7.7.7")
    implementation("com.unity3d.ads-mediation:inmobi-adapter:5.8.0")
    implementation("com.inmobi.monetization:inmobi-ads-kotlin:11.4.0")
    implementation("com.unity3d.ads-mediation:moloco-adapter:5.15.0")
    implementation("com.moloco.sdk:moloco-sdk:4.11.0")
    implementation("com.unity3d.ads-mediation:fyber-adapter:5.10.0")
    implementation("com.fyber:marketplace-sdk:8.4.7")

    implementation("com.google.android.gms:play-services-appset:16.0.0")
    implementation("com.google.android.gms:play-services-ads-identifier:18.1.0")
    implementation("com.google.android.gms:play-services-basement:18.1.0")
}
