# QLD Alert Release Checklist

## Required before production

- [ ] Grant the Worker service account access to the Google Play Console app.
- [ ] Enable the Google Play Android Developer API for that service account.
- [ ] Confirm the `core_alert` one-time product is active.
- [ ] Complete an internal-track purchase and restore test on a physical device.
- [ ] Confirm `/paid-entitlement/register` returns `{"entitled":true}`.
- [ ] Confirm a paid-only `/test-fcm` send reaches only the verified device.
- [ ] Set the Google Play privacy policy URL to:
  `https://billowing-band-06cd.nn46099080.workers.dev/privacy`
- [ ] Add the financial disclaimer URL to the store listing or in-app disclosure:
  `https://billowing-band-06cd.nn46099080.workers.dev/financial-disclaimer`
- [ ] Complete Google Play Data safety and Financial features declarations.
- [ ] Publish the required AdMob Privacy & messaging consent messages.
- [ ] Confirm Cloudflare Workers billing, usage alerts, and error monitoring.
- [ ] Back up the upload keystore and credentials in a secure password manager.

## Automated verification

Run before each upload:

```powershell
flutter analyze
flutter test
flutter build appbundle --release --no-pub
cd cloudflare-worker
npm run check
```

The `release_version_test.dart` test must pass before upload. It verifies that
`pubspec.yaml`, Android `versionCode`, the in-app update checker, and the
Worker `/app-config` default `latestVersionCode` all use the same build number.

## Paid alert architecture

The client never subscribes to a paid FCM topic. Google Play purchase tokens are
verified by the Worker, and only the verified device FCM token is stored in KV.
One purchase maps to one current device registration; registering a replacement
device removes the previous registration.
