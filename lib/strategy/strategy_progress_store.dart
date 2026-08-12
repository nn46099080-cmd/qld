import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StrategyProgress {
  const StrategyProgress({
    required this.touchedMinus20,
    required this.touchedMinus30,
    required this.touchedMinus40,
    required this.touchedMinus50,
    required this.activeDropZone,
    required this.initialized,
    required this.rebalanceTouchedAnyZone,
    required this.rebalanceCardTriggeredAt,
  });

  final bool touchedMinus20;
  final bool touchedMinus30;
  final bool touchedMinus40;
  final bool touchedMinus50;
  final int activeDropZone;
  final bool initialized;
  final bool rebalanceTouchedAnyZone;
  final int rebalanceCardTriggeredAt; // ms epoch, 0 = not triggered
}

class StrategyProgressStore {
  const StrategyProgressStore();

  static const _touchedMinus20Key = 'strategyTouchedMinus20';
  static const _touchedMinus30Key = 'strategyTouchedMinus30';
  static const _touchedMinus40Key = 'strategyTouchedMinus40';
  static const _touchedMinus50Key = 'strategyTouchedMinus50';
  static const _activeDropZoneKey = 'strategyActiveDropZone';
  static const _initializedKey = 'strategyDropAlertInitialized';
  static const _rebalanceTouchedAnyZoneKey = 'rebalanceTouchedAnyZone';
  static const _rebalanceCardTriggeredAtKey = 'rebalanceCardTriggeredAt';

  Future<StrategyProgress> load() async {
    final prefs = await SharedPreferences.getInstance();

    // Recover reached zones if an app update preserved alert history but an
    // older strategy-progress key was lost or partially written.
    final reachedZones = <int>{};
    for (final raw in prefs.getStringList('alertHistory') ?? const <String>[]) {
      try {
        final item = jsonDecode(raw);
        final type = item is Map ? item['type']?.toString() : null;
        if (type == 'minus20') reachedZones.add(20);
        if (type == 'minus30') reachedZones.add(30);
        if (type == 'minus40') reachedZones.add(40);
        if (type == 'minus50') reachedZones.add(50);
      } catch (_) {
        // Ignore malformed legacy history entries.
      }
    }

    final touched20 = prefs.getBool(_touchedMinus20Key) ?? false;
    final touched30 = prefs.getBool(_touchedMinus30Key) ?? false;
    final touched40 = prefs.getBool(_touchedMinus40Key) ?? false;
    final touched50 = prefs.getBool(_touchedMinus50Key) ?? false;
    final activeZone = prefs.getInt(_activeDropZoneKey) ?? 0;

    return StrategyProgress(
      touchedMinus20:
          touched20 || reachedZones.contains(20) || activeZone >= 20,
      touchedMinus30:
          touched30 || reachedZones.contains(30) || activeZone >= 30,
      touchedMinus40:
          touched40 || reachedZones.contains(40) || activeZone >= 40,
      touchedMinus50:
          touched50 || reachedZones.contains(50) || activeZone >= 50,
      activeDropZone: activeZone,
      initialized: prefs.getBool(_initializedKey) ?? false,
      rebalanceTouchedAnyZone:
          prefs.getBool(_rebalanceTouchedAnyZoneKey) ?? false,
      rebalanceCardTriggeredAt: prefs.getInt(_rebalanceCardTriggeredAtKey) ?? 0,
    );
  }

  Future<void> save(StrategyProgress progress) async {
    final prefs = await SharedPreferences.getInstance();

    await Future.wait([
      prefs.setBool(_touchedMinus20Key, progress.touchedMinus20),
      prefs.setBool(_touchedMinus30Key, progress.touchedMinus30),
      prefs.setBool(_touchedMinus40Key, progress.touchedMinus40),
      prefs.setBool(_touchedMinus50Key, progress.touchedMinus50),
      prefs.setInt(_activeDropZoneKey, progress.activeDropZone),
      prefs.setBool(_initializedKey, progress.initialized),
      prefs.setBool(
          _rebalanceTouchedAnyZoneKey, progress.rebalanceTouchedAnyZone),
      prefs.setInt(
          _rebalanceCardTriggeredAtKey, progress.rebalanceCardTriggeredAt),
    ]);
  }
}
