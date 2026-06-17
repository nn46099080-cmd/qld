import 'package:flutter_test/flutter_test.dart';
import 'package:qld_alert_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test(
    'blocks initial notification navigation only on first app launch',
    () async {
      SharedPreferences.setMockInitialValues({});

      expect(await initialRemoteMessageNavigationAllowed(), isFalse);
      expect(await initialRemoteMessageNavigationAllowed(), isTrue);
    },
  );
}
