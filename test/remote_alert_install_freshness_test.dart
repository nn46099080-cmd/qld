import 'package:flutter_test/flutter_test.dart';
import 'package:qld_alert_app/main.dart';

void main() {
  test('remote alert sent before install is stale', () {
    const installSeenAtMs = 2000;

    expect(
      isRemoteAlertStaleForInstallData(
        {'sentAtMs': '1999'},
        installSeenAtMs,
      ),
      isTrue,
    );
  });

  test('remote alert sent after install is fresh', () {
    const installSeenAtMs = 2000;

    expect(
      isRemoteAlertStaleForInstallData(
        {'sentAtMs': '2000'},
        installSeenAtMs,
      ),
      isFalse,
    );
    expect(
      isRemoteAlertStaleForInstallData(
        {'sentAtMs': '2001'},
        installSeenAtMs,
      ),
      isFalse,
    );
  });

  test('remote alert without sentAt is stale after install', () {
    expect(
      isRemoteAlertStaleForInstallData(
        {'type': 'qldMoveUp4'},
        2000,
      ),
      isTrue,
    );
  });

  test('remote alert uses fallback sent time when payload omits sentAt', () {
    expect(
      isRemoteAlertStaleForInstallData(
        {'type': 'qldMoveUp4'},
        2000,
        fallbackSentAtMs: 1999,
      ),
      isTrue,
    );
  });
}
