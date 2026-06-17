import 'package:flutter_test/flutter_test.dart';
import 'package:qld_alert_app/strategy/strategy_progress_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  const store = StrategyProgressStore();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('loads an empty strategy cycle by default', () async {
    final progress = await store.load();

    expect(progress.touchedMinus20, isFalse);
    expect(progress.touchedMinus30, isFalse);
    expect(progress.touchedMinus40, isFalse);
    expect(progress.touchedMinus50, isFalse);
    expect(progress.activeDropZone, 0);
    expect(progress.initialized, isFalse);
  });

  test('restores a minus 40 strategy cycle after restart', () async {
    await store.save(
      const StrategyProgress(
        touchedMinus20: true,
        touchedMinus30: true,
        touchedMinus40: true,
        touchedMinus50: false,
        activeDropZone: 30,
        initialized: true,
      ),
    );

    final restored = await const StrategyProgressStore().load();

    expect(restored.touchedMinus20, isTrue);
    expect(restored.touchedMinus30, isTrue);
    expect(restored.touchedMinus40, isTrue);
    expect(restored.touchedMinus50, isFalse);
    expect(restored.activeDropZone, 30);
    expect(restored.initialized, isTrue);
  });

  test('persists a fully recovered and reset strategy cycle', () async {
    await store.save(
      const StrategyProgress(
        touchedMinus20: false,
        touchedMinus30: false,
        touchedMinus40: false,
        touchedMinus50: false,
        activeDropZone: 0,
        initialized: true,
      ),
    );

    final restored = await store.load();

    expect(restored.touchedMinus20, isFalse);
    expect(restored.touchedMinus30, isFalse);
    expect(restored.touchedMinus40, isFalse);
    expect(restored.touchedMinus50, isFalse);
    expect(restored.activeDropZone, 0);
    expect(restored.initialized, isTrue);
  });
}
