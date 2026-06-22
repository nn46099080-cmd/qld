# QLD Alert App

A Flutter portfolio alert app for cryptocurrency market monitoring.

## Features

- Real-time market alerts (Fear & Greed Index, price levels)
- Paid push notifications via Firebase Cloud Messaging
- In-app purchase entitlement verified through Cloudflare Workers
- Multi-language support (EN, KO, JA, ZH, DE, FR, ES, PT, RU)
- AdMob integration with consent messaging

## Getting Started

### Prerequisites

- Flutter SDK `>=3.3.0 <4.0.0`
- Firebase project configured (`google-services.json` / `GoogleService-Info.plist`)
- Cloudflare Worker deployed (see [`cloudflare-worker/`](cloudflare-worker/))
- `upload-keystore.jks` placed at project root (for release builds)

### Build

```bash
flutter clean
flutter pub get
flutter build appbundle --release
```

Output: `build/app/outputs/bundle/release/app-release.aab`

### Test & Analyze

```bash
flutter analyze
flutter test
```

## Architecture

- **Client**: Flutter app with Firebase Auth + FCM
- **Backend**: Cloudflare Worker handles purchase verification and FCM dispatch
- **Entitlement**: Google Play purchase tokens verified server-side; only the registered device receives paid alerts

## Release

See [RELEASE_CHECKLIST.md](RELEASE_CHECKLIST.md) for pre-production steps.

## Privacy

See [PRIVACY_POLICY.md](PRIVACY_POLICY.md).
