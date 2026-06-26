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

    return StrategyProgress(
      touchedMinus20: prefs.getBool(_touchedMinus20Key) ?? false,
      touchedMinus30: prefs.getBool(_touchedMinus30Key) ?? false,
      touchedMinus40: prefs.getBool(_touchedMinus40Key) ?? false,
      touchedMinus50: prefs.getBool(_touchedMinus50Key) ?? false,
      activeDropZone: prefs.getInt(_activeDropZoneKey) ?? 0,
      initialized: prefs.getBool(_initializedKey) ?? false,
      rebalanceTouchedAnyZone:
          prefs.getBool(_rebalanceTouchedAnyZoneKey) ?? false,
      rebalanceCardTriggeredAt:
          prefs.getInt(_rebalanceCardTriggeredAtKey) ?? 0,
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
