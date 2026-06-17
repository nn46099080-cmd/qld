import 'package:flutter_test/flutter_test.dart';
import 'package:qld_alert_app/main.dart';

void main() {
  test('accepts only a quote newer than the currently applied quote', () {
    expect(shouldApplyQuoteTimestamp(2000, 1000), isTrue);
    expect(shouldApplyQuoteTimestamp(1000, 1000), isFalse);
    expect(shouldApplyQuoteTimestamp(999, 1000), isFalse);
    expect(shouldApplyQuoteTimestamp(0, 1000), isFalse);
  });
}
