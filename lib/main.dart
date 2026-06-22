import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import 'l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'adsense/adsense_platform_view_stub.dart'
    if (dart.library.html) 'adsense/adsense_platform_view_web.dart';
import 'strategy/strategy_progress_store.dart';

part 'strategy/strategy_pages.dart';
part 'market/market_catalog.dart';
part 'market/chart_page.dart';
part 'market/exchange_page.dart';
part 'alerts/alert_pages.dart';
part 'fear_greed/fear_greed_page.dart';

const AndroidNotificationChannel _qldAlertChannel = AndroidNotificationChannel(
  'qld_alerts',
  'QLD Alerts',
  description: 'QLD buy zone and Firebase push alerts',
  importance: Importance.high,
);

const _announcementTopic = 'qld_alerts';

const List<String> _alertTopicLanguages = [
  'en',
  'ko',
  'ja',
  'es',
  'pt',
  'ru',
  'zh',
  'zh_TW',
  'fr',
  'de',
];

final FlutterLocalNotificationsPlugin _localNotifications =
    FlutterLocalNotificationsPlugin();
final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<_QLDAlertAppState> _qldAlertAppKey =
    GlobalKey<_QLDAlertAppState>();
final ValueNotifier<bool> whiteModeNotifier = ValueNotifier<bool>(true);
final ValueNotifier<AppUserIdentity> appUserIdentityNotifier =
    ValueNotifier<AppUserIdentity>(const AppUserIdentity());
final ValueNotifier<bool> appUserAdminNotifier = ValueNotifier<bool>(false);
const MethodChannel _appSettingsChannel =
    MethodChannel('qld_alert/app_settings');

const _announcementAlertType = 'announcement';
const _tradingViewInstallAlertType = 'tradingViewInstall';
const _initialRemoteMessageNavigationReadyKey =
    'initialRemoteMessageNavigationReady';
const _remoteAlertInstallSeenAtKey = 'remoteAlertInstallSeenAtMs';
const _staleNotificationCleanupDoneKey = 'staleNotificationCleanupDone';
const _appUserUidPrefsKey = 'appUserUid';
const _appUserNicknamePrefsKey = 'appUserNickname';
const _ownerAdminUid = 'qld-admin-179204';
const _ownerAdminPassword = '0610aa!!';
const _tradingViewInstallUrl =
    'https://play.google.com/store/apps/details?id=com.tradingview.tradingviewapp&utm_source=chatgpt.com';
const _currentAppVersionCode = 50;
const _androidPackageName = 'com.qldalert.app';
const _releaseAdMobBottomBannerUnitId =
    'ca-app-pub-8561157852710726/9908440913';
const _releaseAdMobExitUnitId = 'ca-app-pub-8561157852710726/8106285955';
const _adsenseClientId = 'ca-pub-8561157852710726';
const _adsenseBottomBannerSlotId = String.fromEnvironment(
  'ADSENSE_BOTTOM_SLOT',
  defaultValue: '2225309867',
);
const _adsenseBottomBannerViewType = 'qld-adsense-bottom-banner';
const _bottomBannerAdHeight = 50.0;
const _bottomBannerAdWidth = 320.0;

String get _adMobBottomBannerUnitId => _releaseAdMobBottomBannerUnitId;

String get _adMobExitUnitId => _releaseAdMobExitUnitId;

bool get canRequestAds =>
    !kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS);

bool get canRequestAdsense =>
    kIsWeb &&
    supportsAdsensePlatformView &&
    _adsenseBottomBannerSlotId.trim().isNotEmpty;

double get bottomBannerAdHeight =>
    kIsWeb && !canRequestAdsense ? 0 : _bottomBannerAdHeight;

const _yahooProxyBaseUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/';
const _appConfigUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/app-config';
const _quoteStreamUrl =
    'wss://billowing-band-06cd.nn46099080.workers.dev/stream';
const _futuresQuoteSymbol = 'NQ=F';
const _vixQuoteSymbol = '^VIX';
const _tenYearYieldQuoteSymbol = '^TNX';
const _priceRefreshIntervalSeconds = 30;
const _fearGreedProxyUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/fear-greed';
const _paidEntitlementRegisterUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/paid-entitlement/register';
const _privacyPolicyUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/privacy';
const _financialDisclaimerUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/financial-disclaimer';
const _closeGuessRankingsUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/close-guess-rankings';
const _closeGuessSubmitUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/close-guess';
const _closeGuessWinnerMessageUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/close-guess-winner-message';
const _inquiriesUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/inquiries';
const _inquiriesReplyUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/inquiries/reply';
const _inquiriesPinUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/inquiries/pin';
const _inquiriesDeleteUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/inquiries/delete';
const _adminStatusUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/admin-status';
const _majorUsSchedulesUrl =
    'https://billowing-band-06cd.nn46099080.workers.dev/major-us-schedules';
const _numberGuessRankingPrefsKey = 'number_guess_rankings';

Uri _chartProxyUri(String symbol) => Uri.parse(_yahooProxyBaseUrl).replace(
      queryParameters: {'symbol': symbol},
    );

Uri _dailyChartProxyUri(String symbol) => Uri.parse(_yahooProxyBaseUrl).replace(
      queryParameters: {
        'symbol': symbol,
        'dailyOnly': '1',
      },
    );

class _MajorUsScheduleItem {
  const _MajorUsScheduleItem({
    required this.title,
    required this.date,
  });

  final String title;
  final DateTime date;
}

final List<_MajorUsScheduleItem> _majorUsSchedules = [
  _MajorUsScheduleItem(
    title: 'FOMC',
    date: DateTime(2026, 6, 17),
  ),
  _MajorUsScheduleItem(
    title: 'NFP',
    date: DateTime(2026, 7, 2),
  ),
  _MajorUsScheduleItem(
    title: 'CPI',
    date: DateTime(2026, 7, 14),
  ),
  _MajorUsScheduleItem(
    title: 'FOMC',
    date: DateTime(2026, 7, 29),
  ),
  _MajorUsScheduleItem(
    title: 'NFP',
    date: DateTime(2026, 8, 7),
  ),
  _MajorUsScheduleItem(
    title: 'CPI',
    date: DateTime(2026, 8, 12),
  ),
  _MajorUsScheduleItem(
    title: 'NFP',
    date: DateTime(2026, 9, 4),
  ),
  _MajorUsScheduleItem(
    title: 'CPI',
    date: DateTime(2026, 9, 11),
  ),
  _MajorUsScheduleItem(
    title: 'FOMC',
    date: DateTime(2026, 9, 16),
  ),
  _MajorUsScheduleItem(
    title: 'NFP',
    date: DateTime(2026, 10, 2),
  ),
  _MajorUsScheduleItem(
    title: 'CPI',
    date: DateTime(2026, 10, 14),
  ),
  _MajorUsScheduleItem(
    title: 'FOMC',
    date: DateTime(2026, 10, 28),
  ),
  _MajorUsScheduleItem(
    title: 'NFP',
    date: DateTime(2026, 11, 6),
  ),
  _MajorUsScheduleItem(
    title: 'CPI',
    date: DateTime(2026, 11, 10),
  ),
  _MajorUsScheduleItem(
    title: 'NFP',
    date: DateTime(2026, 12, 4),
  ),
  _MajorUsScheduleItem(
    title: 'FOMC',
    date: DateTime(2026, 12, 9),
  ),
  _MajorUsScheduleItem(
    title: 'CPI',
    date: DateTime(2026, 12, 10),
  ),
];

List<_MajorUsScheduleItem> _activeMajorUsSchedules =
    List<_MajorUsScheduleItem>.of(_majorUsSchedules);

Future<void> _loadSavedMajorUsSchedules() async {
  try {
    final response = await http.get(
      Uri.parse(_majorUsSchedulesUrl),
      headers: {'Accept': 'application/json'},
    ).timeout(const Duration(seconds: 8));
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Schedule API ${response.statusCode}');
    }
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final data = decoded['items'] as List<dynamic>? ?? const [];
    final schedules = data
        .whereType<Map<String, dynamic>>()
        .map(
          (item) => _MajorUsScheduleItem(
            title: '${item['title'] ?? ''}',
            date: DateTime.parse('${item['date'] ?? ''}'),
          ),
        )
        .where((item) => item.title.trim().isNotEmpty)
        .toList();
    if (schedules.isNotEmpty) {
      _activeMajorUsSchedules = schedules;
    }
  } catch (error) {
    debugPrint('Major US schedules unavailable: $error');
  }
}

Future<void> _saveMajorUsScheduleToServer({
  required String action,
  required _MajorUsScheduleItem item,
  _MajorUsScheduleItem? previousItem,
}) async {
  final identity = await activateOwnerAdminIdentity();
  final response = await http
      .post(
        Uri.parse(_majorUsSchedulesUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'adminUid': identity.uid,
          'action': action,
          'item': {
            'title': item.title,
            'date': DateFormat('yyyy-MM-dd').format(item.date),
          },
          if (previousItem != null)
            'previousItem': {
              'title': previousItem.title,
              'date': DateFormat('yyyy-MM-dd').format(previousItem.date),
            },
        }),
      )
      .timeout(const Duration(seconds: 8));
  if (response.statusCode < 200 || response.statusCode >= 300) {
    throw Exception('Schedule API ${response.statusCode}');
  }
  final decoded = jsonDecode(response.body) as Map<String, dynamic>;
  final data = decoded['items'] as List<dynamic>? ?? const [];
  final schedules = data
      .whereType<Map<String, dynamic>>()
      .map(
        (item) => _MajorUsScheduleItem(
          title: '${item['title'] ?? ''}',
          date: DateTime.parse('${item['date'] ?? ''}'),
        ),
      )
      .where((item) => item.title.trim().isNotEmpty)
      .toList();
  if (schedules.isNotEmpty) {
    _activeMajorUsSchedules = schedules;
  }
}

List<_MajorUsScheduleItem> _upcomingMajorUsSchedules([DateTime? now]) {
  final current = now ?? DateTime.now();
  final today = DateTime(current.year, current.month, current.day);
  final upcoming = _activeMajorUsSchedules
      .where((item) => !item.date.isBefore(today))
      .toList()
    ..sort((a, b) => a.date.compareTo(b.date));
  return upcoming;
}

_MajorUsScheduleItem? _nextMajorUsSchedule([DateTime? now]) {
  final upcoming = _upcomingMajorUsSchedules(now);
  return upcoming.isEmpty ? null : upcoming.first;
}

int _daysUntilSchedule(DateTime date, [DateTime? now]) {
  final current = now ?? DateTime.now();
  final today = DateTime(current.year, current.month, current.day);
  return date.difference(today).inDays;
}

String _scheduleDdayLabel(DateTime date, [DateTime? now]) {
  final days = _daysUntilSchedule(date, now);
  return days == 0 ? 'D-DAY' : 'D-$days';
}

DateTime? _parseMajorUsScheduleDate(String source) {
  final trimmed = source.trim();
  if (trimmed.isEmpty) return null;

  final normalized = trimmed.replaceAll('.', '-').replaceAll('/', '-');
  final parts = normalized.split('-').where((part) => part.isNotEmpty).toList();
  int? year;
  int? month;
  int? day;

  if (parts.length == 3) {
    year = int.tryParse(parts[0]);
    month = int.tryParse(parts[1]);
    day = int.tryParse(parts[2]);
  } else if (parts.length == 2) {
    final now = DateTime.now();
    year = now.year;
    month = int.tryParse(parts[0]);
    day = int.tryParse(parts[1]);
  } else {
    final digits = trimmed.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length == 8) {
      year = int.tryParse(digits.substring(0, 4));
      month = int.tryParse(digits.substring(4, 6));
      day = int.tryParse(digits.substring(6, 8));
    } else if (digits.length == 4) {
      final now = DateTime.now();
      year = now.year;
      month = int.tryParse(digits.substring(0, 2));
      day = int.tryParse(digits.substring(2, 4));
    }
  }

  if (year == null || month == null || day == null) return null;
  var parsed = DateTime(year, month, day);
  if (parsed.year != year || parsed.month != month || parsed.day != day) {
    return null;
  }
  final today = DateTime.now();
  final todayOnly = DateTime(today.year, today.month, today.day);
  if (parts.length == 2 ||
      trimmed.replaceAll(RegExp(r'[^0-9]'), '').length == 4) {
    if (parsed.isBefore(todayOnly)) {
      parsed = DateTime(year + 1, month, day);
    }
  }
  return parsed;
}

Future<void> _showMajorUsScheduleEditDialog(
  BuildContext context,
  _MajorUsScheduleItem schedule,
  VoidCallback onChanged,
) async {
  if (!appUserAdminNotifier.value) return;

  final titleController = TextEditingController(text: schedule.title);
  final dateController = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(schedule.date),
  );

  try {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final whiteMode = isWhiteModeEnabled(dialogContext);
        final primaryText = whiteMode ? _lightText : _darkText;
        final secondaryText = whiteMode ? _lightMuted : _darkMuted;
        final dialogBg = whiteMode ? _lightSurface : _darkSurface;
        return AlertDialog(
          backgroundColor: dialogBg,
          title: Text(
            '\uc77c\uc815 \uc218\uc815',
            style: TextStyle(
              color: primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                style: TextStyle(color: primaryText),
                decoration: InputDecoration(
                  labelText: '\uc77c\uc815\uba85',
                  labelStyle: TextStyle(color: secondaryText),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: dateController,
                keyboardType: TextInputType.datetime,
                style: TextStyle(color: primaryText),
                decoration: InputDecoration(
                  labelText: 'YYYY-MM-DD',
                  labelStyle: TextStyle(color: secondaryText),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('\ucde8\uc18c'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('\uc800\uc7a5'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) return;

    final parsedDate = _parseMajorUsScheduleDate(dateController.text);
    final title = titleController.text.trim();
    if (title.isEmpty || parsedDate == null) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '\uc77c\uc815\uba85\uacfc \ub0a0\uc9dc\ub97c \ud655\uc778\ud574 \uc8fc\uc138\uc694.',
          ),
        ),
      );
      return;
    }

    final index = _activeMajorUsSchedules.indexWhere(
      (item) => item.title == schedule.title && item.date == schedule.date,
    );
    if (index < 0) return;

    final nextItem = _MajorUsScheduleItem(
      title: title,
      date: parsedDate,
    );
    await _saveMajorUsScheduleToServer(
      action: 'update',
      item: nextItem,
      previousItem: schedule,
    );
    onChanged();
  } finally {
    titleController.dispose();
    dateController.dispose();
  }
}

void _showMajorUsScheduleSheet(
  BuildContext context, {
  VoidCallback? onChanged,
}) {
  final whiteMode = whiteModeNotifier.value;
  final sheetBg = whiteMode ? Colors.white : _darkSurface;
  final primaryText = whiteMode ? _lightText : _darkText;
  final secondaryText = whiteMode ? _lightMuted : _darkMuted;
  final lineColor = whiteMode ? _lightLine : _darkLineSoft;
  final addTitleController = TextEditingController();
  final addDateController = TextEditingController();
  final passwordController = TextEditingController();

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) {
      return StatefulBuilder(
        builder: (sheetContext, setSheetState) {
          final schedules = _upcomingMajorUsSchedules();
          final isAdmin = appUserAdminNotifier.value;
          InputDecoration addInputDecoration(String label) => InputDecoration(
                labelText: label,
                labelStyle: TextStyle(color: secondaryText, fontSize: 11),
                isDense: true,
                filled: true,
                fillColor:
                    whiteMode ? const Color(0xFFF8FAFC) : _darkSurfaceSoft,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: lineColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: lineColor),
                ),
              );

          Future<void> addSchedule() async {
            if (passwordController.text.trim() != _ownerAdminPassword) {
              ScaffoldMessenger.of(sheetContext).showSnackBar(
                const SnackBar(
                  content: Text(
                    '\ube44\ubc00\ubc88\ud638\uac00 \ub9de\uc9c0 \uc54a\uc2b5\ub2c8\ub2e4.',
                  ),
                ),
              );
              return;
            }

            final title = addTitleController.text.trim();
            final date = _parseMajorUsScheduleDate(addDateController.text);
            if (title.isEmpty || date == null) {
              ScaffoldMessenger.of(sheetContext).showSnackBar(
                const SnackBar(
                  content: Text(
                    '\uc77c\uc815\uba85\uacfc \ub0a0\uc9dc\ub97c \ud655\uc778\ud574 \uc8fc\uc138\uc694.',
                  ),
                ),
              );
              return;
            }

            await _saveMajorUsScheduleToServer(
              action: 'add',
              item: _MajorUsScheduleItem(title: title, date: date),
            );
            addTitleController.clear();
            addDateController.clear();
            passwordController.clear();
            setSheetState(() {});
            onChanged?.call();
          }

          return Container(
            constraints: const BoxConstraints(maxHeight: 520),
            padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
            decoration: BoxDecoration(
              color: sheetBg,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: lineColor,
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\ubbf8\uad6d \uc8fc\uc694\uc77c\uc815',
                          style: TextStyle(
                            color: primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(sheetContext).pop(),
                        icon: const Icon(Icons.close_rounded),
                        color: secondaryText,
                        tooltip: 'Close',
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  if (schedules.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28),
                      child: Text(
                        '\ub0a8\uc740 \uc77c\uc815\uc774 \uc5c6\uc2b5\ub2c8\ub2e4.',
                        style: TextStyle(
                          color: secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  else
                    Flexible(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: schedules.length,
                        separatorBuilder: (_, __) => Divider(
                          height: 1,
                          color: lineColor,
                        ),
                        itemBuilder: (_, index) {
                          final schedule = schedules[index];
                          return ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              schedule.title,
                              style: TextStyle(
                                color: primaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            subtitle: Text(
                              DateFormat('yyyy.MM.dd').format(schedule.date),
                              style: TextStyle(
                                color: secondaryText,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _scheduleDdayLabel(schedule.date),
                                  style: TextStyle(
                                    color: _portfolioLossRed,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                if (isAdmin) ...[
                                  const SizedBox(width: 4),
                                  IconButton(
                                    visualDensity: VisualDensity.compact,
                                    tooltip: '\uc77c\uc815 \uc218\uc815',
                                    onPressed: () async {
                                      await _showMajorUsScheduleEditDialog(
                                        sheetContext,
                                        schedule,
                                        () {
                                          setSheetState(() {});
                                          onChanged?.call();
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.edit_calendar_rounded,
                                      size: 18,
                                    ),
                                    color: secondaryText,
                                  ),
                                ],
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: lineColor),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: addTitleController,
                          style: TextStyle(color: primaryText, fontSize: 12),
                          decoration: addInputDecoration('\uc77c\uc815\uba85'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: addDateController,
                          keyboardType: TextInputType.datetime,
                          style: TextStyle(color: primaryText, fontSize: 12),
                          decoration: addInputDecoration('YYYY-MM-DD'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          style: TextStyle(color: primaryText, fontSize: 12),
                          decoration: addInputDecoration(
                            '\uad00\ub9ac\uc790 \ube44\ubc00\ubc88\ud638',
                          ),
                          onSubmitted: (_) => addSchedule(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 44,
                        child: FilledButton.icon(
                          onPressed: addSchedule,
                          icon: const Icon(Icons.add_rounded, size: 18),
                          label: const Text(
                            '\uc77c\uc815 \ucd94\uac00',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  ).whenComplete(() {
    addTitleController.dispose();
    addDateController.dispose();
    passwordController.dispose();
  });
}

Uri _quoteProxyUri(String symbol) => Uri.parse(_yahooProxyBaseUrl).replace(
      path: '/quote',
      queryParameters: {'symbol': symbol},
    );

/// All market data must go through Cloudflare Worker (never Yahoo directly).
Future<Map<String, dynamic>?> _fetchChartFromWorker(
  String symbol,
) async {
  return _fetchChartFromWorkerUri(_chartProxyUri(symbol), symbol);
}

Future<Map<String, dynamic>?> _fetchDailyChartFromWorker(
  String symbol,
) async {
  return _fetchChartFromWorkerUri(_dailyChartProxyUri(symbol), symbol);
}

Future<Map<String, dynamic>?> _fetchChartFromWorkerUri(
  Uri uri,
  String symbol,
) async {
  try {
    final response = await http.get(uri).timeout(const Duration(seconds: 8));

    if (response.statusCode != 200) {
      debugPrint(
        'Market data server returned ${response.statusCode} ($symbol)',
      );
      return null;
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final results = data['chart']?['result'] as List?;

    if (results == null || results.isEmpty) {
      debugPrint('Market data response empty ($symbol)');
      return null;
    }

    return results[0] as Map<String, dynamic>;
  } catch (error) {
    debugPrint('Market data network unavailable ($symbol)');
    return null;
  }
}

class FinnhubQuote {
  const FinnhubQuote({
    required this.currentPrice,
    required this.previousClose,
    required this.source,
    this.preMarketPrice = 0,
    this.postMarketPrice = 0,
    this.regularMarketPrice = 0,
  });

  final double currentPrice;
  final double previousClose;
  final String source;
  final double preMarketPrice;
  final double postMarketPrice;
  final double regularMarketPrice;
}

class AppUserIdentity {
  const AppUserIdentity({
    this.uid = '',
    this.nickname = '',
  });

  final String uid;
  final String nickname;

  String get displayName {
    final trimmedNickname = nickname.trim();
    if (trimmedNickname.isNotEmpty) return trimmedNickname;
    if (uid.length >= 6) return '익명-${uid.substring(uid.length - 6)}';
    return '익명';
  }

  AppUserIdentity copyWith({
    String? uid,
    String? nickname,
  }) {
    return AppUserIdentity(
      uid: uid ?? this.uid,
      nickname: nickname ?? this.nickname,
    );
  }
}

String appUserDisplayName(AppUserIdentity identity, {bool isAdmin = false}) {
  if (isAdmin) return '관리자';
  return identity.displayName;
}

Future<AppUserIdentity> ensureAnonymousUserIdentity() async {
  final prefs = await SharedPreferences.getInstance();
  var uid = prefs.getString(_appUserUidPrefsKey) ?? '';

  if (uid != _ownerAdminUid && !kIsWeb) {
    try {
      final auth = FirebaseAuth.instance;
      final credential =
          auth.currentUser == null ? await auth.signInAnonymously() : null;
      uid = (credential?.user ?? auth.currentUser)?.uid ?? uid;
    } catch (error) {
      debugPrint('Anonymous Firebase auth unavailable: $error');
    }
  }

  if (uid.isEmpty) {
    final suffix = math.Random().nextInt(999999).toString().padLeft(6, '0');
    uid = 'local-${DateTime.now().millisecondsSinceEpoch}-$suffix';
  }

  await prefs.setString(_appUserUidPrefsKey, uid);
  final identity = AppUserIdentity(
    uid: uid,
    nickname: prefs.getString(_appUserNicknamePrefsKey) ?? '',
  );
  appUserIdentityNotifier.value = identity;
  unawaited(refreshAppUserAdminStatus(identity.uid));
  return identity;
}

Future<AppUserIdentity> saveAppUserNickname(String nickname) async {
  final prefs = await SharedPreferences.getInstance();
  final identity = await ensureAnonymousUserIdentity();
  final trimmed = nickname.trim().replaceAll(RegExp(r'\s+'), ' ');
  await prefs.setString(_appUserNicknamePrefsKey, trimmed);
  final nextIdentity = identity.copyWith(nickname: trimmed);
  appUserIdentityNotifier.value = nextIdentity;
  return nextIdentity;
}

Future<AppUserIdentity> activateOwnerAdminIdentity() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_appUserUidPrefsKey, _ownerAdminUid);
  final identity = AppUserIdentity(
    uid: _ownerAdminUid,
    nickname: prefs.getString(_appUserNicknamePrefsKey) ?? '',
  );
  appUserIdentityNotifier.value = identity;
  await refreshAppUserAdminStatus(identity.uid);
  return identity;
}

Future<String> userScopedPrefsKey(String baseKey) async {
  final identity = await ensureAnonymousUserIdentity();
  return '$baseKey:${identity.uid}';
}

Future<bool> refreshAppUserAdminStatus([String? uid]) async {
  final targetUid = uid ?? (await ensureAnonymousUserIdentity()).uid;
  if (targetUid.isEmpty) return false;
  if (targetUid == _ownerAdminUid) {
    appUserAdminNotifier.value = true;
    return true;
  }

  try {
    final response = await http
        .get(
          Uri.parse(_adminStatusUrl).replace(
            queryParameters: {'uid': targetUid},
          ),
        )
        .timeout(const Duration(seconds: 8));
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Admin API ${response.statusCode}');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final isAdmin = data['isAdmin'] == true;
    appUserAdminNotifier.value = isAdmin;
    return isAdmin;
  } catch (error) {
    debugPrint('Admin status unavailable: $error');
    appUserAdminNotifier.value = false;
    return false;
  }
}

class CloseGuessEntry {
  const CloseGuessEntry({
    required this.id,
    required this.price,
    required this.close,
    required this.date,
    this.uid = '',
    this.submittedAt = '',
  });

  final String id;
  final String uid;
  final double price;
  final double close;
  final String date;
  final String submittedAt;

  double get difference => (price - close).abs();

  Map<String, dynamic> toJson() => {
        'id': id,
        'nickname': id,
        'uid': uid,
        'price': price,
        'close': close,
        'date': date,
        'submittedAt': submittedAt,
      };

  static CloseGuessEntry? fromJson(String source) {
    try {
      final data = jsonDecode(source) as Map<String, dynamic>;
      return fromMap(data);
    } catch (_) {
      return null;
    }
  }

  static CloseGuessEntry? fromMap(
    Map<String, dynamic> data, {
    String fallbackDate = '',
  }) {
    try {
      final id = (data['id'] ?? '').toString().trim();
      final uid = (data['uid'] ?? '').toString().trim();
      final price = _numberToDouble(data['price']);
      final close = _numberToDouble(data['close']);
      final date = (data['date'] ?? fallbackDate).toString();
      if (id.isEmpty || price <= 0 || close <= 0 || date.isEmpty) {
        return null;
      }
      return CloseGuessEntry(
        id: id,
        uid: uid,
        price: price,
        close: close,
        date: date,
        submittedAt: (data['submittedAt'] ?? '').toString(),
      );
    } catch (_) {
      return null;
    }
  }
}

class CloseGuessWinnerMessage {
  const CloseGuessWinnerMessage({
    required this.id,
    required this.message,
    required this.updatedAt,
  });

  final String id;
  final String message;
  final String updatedAt;

  static CloseGuessWinnerMessage? fromMap(Map<String, dynamic>? data) {
    if (data == null) return null;
    final id = (data['id'] ?? '').toString().trim();
    final message = (data['message'] ?? '').toString().trim();
    if (id.isEmpty || message.isEmpty) return null;
    return CloseGuessWinnerMessage(
      id: id,
      message: message,
      updatedAt: (data['updatedAt'] ?? '').toString(),
    );
  }
}

class CloseGuessRankingState {
  const CloseGuessRankingState({
    required this.date,
    required this.dates,
    required this.entries,
    required this.referenceClose,
    this.winnerMessage,
  });

  final String date;
  final List<String> dates;
  final List<CloseGuessEntry> entries;
  final double referenceClose;
  final CloseGuessWinnerMessage? winnerMessage;

  static CloseGuessRankingState? fromMap(Map<String, dynamic> data) {
    final date = (data['date'] ?? '').toString();
    final rawDates = data['dates'] as List? ?? const [];
    final rawEntries = data['entries'] as List? ?? const [];
    if (date.isEmpty) return null;

    return CloseGuessRankingState(
      date: date,
      dates: rawDates.map((value) => value.toString()).toList(),
      referenceClose: _numberToDouble(data['referenceClose']),
      entries: rawEntries
          .whereType<Map>()
          .map(
            (entry) => CloseGuessEntry.fromMap(
              Map<String, dynamic>.from(entry),
              fallbackDate: date,
            ),
          )
          .whereType<CloseGuessEntry>()
          .toList(),
      winnerMessage: CloseGuessWinnerMessage.fromMap(
        data['winnerMessage'] is Map
            ? Map<String, dynamic>.from(data['winnerMessage'] as Map)
            : null,
      ),
    );
  }
}

class QldMiniCandle {
  const QldMiniCandle({
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.ma20,
    required this.ma200,
  });

  final double open;
  final double high;
  final double low;
  final double close;
  final double? ma20;
  final double? ma200;
}

List<QldMiniCandle> _qldMiniCandlesWithRealtimeClose(
  List<QldMiniCandle> candles,
  double price,
) {
  if (candles.isEmpty || price <= 0) return candles;

  final nextCandles = List<QldMiniCandle>.of(candles);
  final last = nextCandles.last;
  nextCandles[nextCandles.length - 1] = QldMiniCandle(
    open: last.open,
    high: math.max(last.high, price),
    low: math.min(last.low, price),
    close: price,
    ma20: last.ma20,
    ma200: last.ma200,
  );
  return nextCandles;
}

class _QldMiniCandlePainter extends CustomPainter {
  const _QldMiniCandlePainter({
    required this.candles,
    required this.minY,
    required this.maxY,
    required this.gridColor,
    required this.labelTextColor,
    required this.labelBackgroundColor,
    required this.upColor,
    required this.downColor,
    required this.markerColor,
    required this.currentPrice,
    required this.currentPriceColor,
    required this.currentPriceStrokeColor,
  });

  final List<QldMiniCandle> candles;
  final double minY;
  final double maxY;
  final Color gridColor;
  final Color labelTextColor;
  final Color labelBackgroundColor;
  final Color upColor;
  final Color downColor;
  final Color markerColor;
  final double currentPrice;
  final Color currentPriceColor;
  final Color currentPriceStrokeColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (candles.isEmpty ||
        maxY <= minY ||
        size.width <= 0 ||
        size.height <= 0) {
      return;
    }

    final range = maxY - minY;
    final candleWidth = math.max(1.2, (size.width / candles.length) * 0.46);
    final wickPaint = Paint()
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    final bodyPaint = Paint();

    double xForIndex(int index) {
      final usableWidth = math.max(1.0, size.width - 22);
      if (candles.length == 1) return usableWidth / 2;
      return (index / (candles.length - 1)) * usableWidth;
    }

    double yForPrice(double value) {
      return size.height - ((value - minY) / range) * size.height;
    }

    void drawPriceLabel(
      String text,
      Offset anchor, {
      required Color color,
      bool alignRight = true,
    }) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
            color: color,
            fontSize: 9,
            fontWeight: FontWeight.w700,
          ),
        ),
        textDirection: ui.TextDirection.ltr,
      )..layout();
      final dx = alignRight ? anchor.dx - textPainter.width : anchor.dx;
      final dy = (anchor.dy - textPainter.height / 2)
          .clamp(4.0, size.height - textPainter.height - 4)
          .toDouble();
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(
          dx - 4,
          dy - 2,
          textPainter.width + 8,
          textPainter.height + 4,
        ),
        const Radius.circular(4),
      );
      canvas.drawRRect(
        rect,
        Paint()..color = labelBackgroundColor,
      );
      textPainter.paint(canvas, Offset(dx, dy));
    }

    final axisPaint = Paint()
      ..color = gridColor
      ..strokeWidth = 1;
    final axisValues = <double>[
      maxY,
      minY + range / 2,
      minY,
    ];

    for (final value in axisValues) {
      final y = yForPrice(value).clamp(0.0, size.height).toDouble();
      canvas.drawLine(Offset(0, y), Offset(size.width, y), axisPaint);
    }

    var lowestPrice = double.infinity;
    var lowestIndex = 0;
    var highestPrice = 0.0;
    var highestIndex = 0;

    for (int i = 0; i < candles.length; i++) {
      final candle = candles[i];
      if (candle.low < lowestPrice) {
        lowestPrice = candle.low;
        lowestIndex = i;
      }
      if (candle.high > highestPrice) {
        highestPrice = candle.high;
        highestIndex = i;
      }
      final isUp = candle.close >= candle.open;
      final color = isUp ? upColor : downColor;
      final x = xForIndex(i);
      final highY = yForPrice(candle.high).clamp(0.0, size.height).toDouble();
      final lowY = yForPrice(candle.low).clamp(0.0, size.height).toDouble();
      final openY = yForPrice(candle.open).clamp(0.0, size.height).toDouble();
      final closeY = yForPrice(candle.close).clamp(0.0, size.height).toDouble();
      final top = math.min(openY, closeY);
      final bottom = math.max(openY, closeY);

      wickPaint.color = color.withValues(alpha: 0.72);
      canvas.drawLine(Offset(x, highY), Offset(x, lowY), wickPaint);

      bodyPaint.color = color;
      final bodyRect = RRect.fromRectAndRadius(
        Rect.fromLTRB(
          x - candleWidth / 2,
          top,
          x + candleWidth / 2,
          math.max(bottom, top + 1.4),
        ),
        const Radius.circular(1.8),
      );
      canvas.drawRRect(bodyRect, bodyPaint);
    }

    for (final value in axisValues) {
      final y = yForPrice(value).clamp(0.0, size.height).toDouble();
      drawPriceLabel(
        '\$${value.toStringAsFixed(2)}',
        Offset(size.width - 5, y),
        color: labelTextColor,
      );
    }

    if (lowestPrice.isFinite) {
      final lowX = xForIndex(lowestIndex).clamp(8.0, size.width - 8).toDouble();
      final lowY = yForPrice(lowestPrice).clamp(0.0, size.height).toDouble();
      canvas.drawCircle(
        Offset(lowX, lowY),
        2.8,
        Paint()..color = markerColor,
      );
      drawPriceLabel(
        '\$${lowestPrice.toStringAsFixed(2)}',
        Offset(
          math.min(lowX + 8, size.width - 6),
          lowY,
        ),
        color: markerColor,
        alignRight: lowX > size.width - 68,
      );
    }

    if (highestPrice > 0) {
      final highX =
          xForIndex(highestIndex).clamp(8.0, size.width - 8).toDouble();
      final highY = yForPrice(highestPrice).clamp(0.0, size.height).toDouble();
      canvas.drawCircle(
        Offset(highX, highY),
        2.8,
        Paint()..color = markerColor,
      );
      drawPriceLabel(
        '\$${highestPrice.toStringAsFixed(2)}',
        Offset(
          math.min(highX + 8, size.width - 6),
          highY,
        ),
        color: markerColor,
        alignRight: highX > size.width - 68,
      );
    }

    if (currentPrice > 0) {
      final currentX =
          xForIndex(candles.length - 1).clamp(8.0, size.width - 8).toDouble();
      final currentY =
          yForPrice(currentPrice).clamp(0.0, size.height).toDouble();
      canvas.drawCircle(
        Offset(currentX, currentY),
        5.6,
        Paint()..color = currentPriceStrokeColor,
      );
      canvas.drawCircle(
        Offset(currentX, currentY),
        3.8,
        Paint()..color = currentPriceColor,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _QldMiniCandlePainter oldDelegate) {
    return oldDelegate.candles != candles ||
        oldDelegate.minY != minY ||
        oldDelegate.maxY != maxY ||
        oldDelegate.gridColor != gridColor ||
        oldDelegate.labelTextColor != labelTextColor ||
        oldDelegate.labelBackgroundColor != labelBackgroundColor ||
        oldDelegate.upColor != upColor ||
        oldDelegate.downColor != downColor ||
        oldDelegate.markerColor != markerColor ||
        oldDelegate.currentPrice != currentPrice ||
        oldDelegate.currentPriceColor != currentPriceColor ||
        oldDelegate.currentPriceStrokeColor != currentPriceStrokeColor;
  }
}

class _QldMiniCurrentPricePainter extends CustomPainter {
  const _QldMiniCurrentPricePainter({
    required this.candleCount,
    required this.minY,
    required this.maxY,
    required this.currentPrice,
    required this.color,
    required this.strokeColor,
  });

  final int candleCount;
  final double minY;
  final double maxY;
  final double currentPrice;
  final Color color;
  final Color strokeColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (candleCount <= 0 ||
        currentPrice <= 0 ||
        maxY <= minY ||
        size.width <= 0 ||
        size.height <= 0) {
      return;
    }

    final usableWidth = math.max(1.0, size.width - 22);
    final x = candleCount == 1 ? usableWidth / 2 : usableWidth;
    final y =
        size.height - ((currentPrice - minY) / (maxY - minY)) * size.height;
    final center = Offset(
      x.clamp(8.0, size.width - 8).toDouble(),
      y.clamp(0.0, size.height).toDouble(),
    );

    canvas.drawCircle(center, 5.6, Paint()..color = strokeColor);
    canvas.drawCircle(center, 3.8, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _QldMiniCurrentPricePainter oldDelegate) {
    return oldDelegate.candleCount != candleCount ||
        oldDelegate.minY != minY ||
        oldDelegate.maxY != maxY ||
        oldDelegate.currentPrice != currentPrice ||
        oldDelegate.color != color ||
        oldDelegate.strokeColor != strokeColor;
  }
}

double _numberToDouble(dynamic value) {
  if (value is num) return value.toDouble();
  return double.tryParse(value?.toString() ?? '') ?? 0;
}

bool shouldApplyQuoteTimestamp(int incomingTimestamp, int appliedTimestamp) {
  return incomingTimestamp > 0 && incomingTimestamp > appliedTimestamp;
}

bool shouldZeroExtendedSessionFutures({
  required bool isRegularMarketSession,
  required bool isAfterFuturesStart,
  required bool isUsMarketOpenDayForFutures,
  required bool isFuturesSession,
}) {
  return isRegularMarketSession ||
      !isAfterFuturesStart ||
      !isUsMarketOpenDayForFutures ||
      !isFuturesSession;
}

double extendedSessionPercentForDisplay({
  required bool shouldZeroFutures,
  required double futuresPercent,
}) {
  return shouldZeroFutures ? 0.0 : futuresPercent;
}

double extendedSessionPriceForDisplay({
  required double currentPrice,
  required double extendedSessionPercent,
}) {
  if (currentPrice <= 0) return 0;
  return currentPrice * (1 + extendedSessionPercent / 100);
}

Future<FinnhubQuote?> fetchQuote(String symbol) async {
  try {
    final response = await http.get(_quoteProxyUri(symbol)).timeout(
          const Duration(seconds: 8),
        );

    if (response.statusCode != 200) {
      debugPrint(
        'Worker quote failed ($symbol): HTTP ${response.statusCode}',
      );
      return null;
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final responseSymbol = data['symbol']?.toString().toUpperCase() ?? '';
    final requestedSymbol = symbol.toUpperCase();
    final previousClose = _numberToDouble(data['previousClose'] ?? data['pc']);
    final preMarketPrice = _numberToDouble(data['preMarketPrice']);
    final postMarketPrice = _numberToDouble(data['postMarketPrice']);
    final regularMarketPrice = _numberToDouble(data['regularMarketPrice']);
    final currentPrice = regularMarketPrice > 0
        ? regularMarketPrice
        : _numberToDouble(data['currentPrice'] ?? data['c']);
    final source = data['source']?.toString() ?? 'finnhub';

    if (responseSymbol.isNotEmpty && responseSymbol != requestedSymbol) {
      debugPrint(
        'Worker quote symbol mismatch: requested $symbol, got $responseSymbol',
      );
      return null;
    }

    if (currentPrice <= 0) {
      debugPrint(
        'Worker quote invalid ($symbol): current=$currentPrice, body=${response.body}',
      );
      return null;
    }

    debugPrint(
      'Worker quote ok ($symbol): current=$currentPrice previousClose=$previousClose cache=${response.headers['x-cache']}',
    );

    return FinnhubQuote(
      currentPrice: currentPrice,
      previousClose: previousClose,
      source: source,
      preMarketPrice: preMarketPrice,
      postMarketPrice: postMarketPrice,
      regularMarketPrice: regularMarketPrice,
    );
  } catch (error) {
    debugPrint('Worker quote unavailable ($symbol): $error');
    return null;
  }
}

Future<String> savedLanguageCode() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('selectedLanguage') ?? 'en';
}

String alertTopicLanguageCode(String code) {
  final normalized = code.replaceAll('-', '_');
  if (normalized == 'zh_TW' || normalized.toLowerCase() == 'zh_hant') {
    return 'zh_TW';
  }
  if (normalized.startsWith('zh')) return 'zh';
  if (_alertTopicLanguages.contains(normalized)) return normalized;

  final baseCode = normalized.split('_').first;
  return _alertTopicLanguages.contains(baseCode) ? baseCode : 'en';
}

String alertTopicForLanguage(String code) =>
    '${_announcementTopic}_${alertTopicLanguageCode(code)}';

Future<void> syncAlertLanguageTopic(String languageCode) async {
  if (kIsWeb) return;

  final messaging = FirebaseMessaging.instance;
  final nextTopic = alertTopicForLanguage(languageCode);

  // Subscribe first so changing language never creates an alert delivery gap.
  await messaging.subscribeToTopic(nextTopic);

  // Keep the shared topic only for announcements sent manually. Automated
  // alerts are sent exclusively through language-specific topics.
  await messaging.subscribeToTopic(_announcementTopic);

  for (final code in _alertTopicLanguages) {
    final topic = alertTopicForLanguage(code);
    if (topic == nextTopic) continue;
    await messaging.unsubscribeFromTopic(topic);
  }
}

Future<bool> registerVerifiedCoreAlertPurchase(
  PurchaseDetails purchase,
) async {
  if (kIsWeb || purchase.verificationData.source != 'google_play') {
    return false;
  }

  final fcmToken = await coreAlertFcmTokenWithRetry();
  final purchaseToken = purchase.verificationData.serverVerificationData.trim();
  if (fcmToken == null || fcmToken.isEmpty || purchaseToken.isEmpty) {
    return false;
  }

  try {
    final response = await http
        .post(
          Uri.parse(_paidEntitlementRegisterUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'purchaseToken': purchaseToken,
            'fcmToken': fcmToken,
            'language': await savedLanguageCode(),
          }),
        )
        .timeout(const Duration(seconds: 15));
    if (response.statusCode != 200) return false;

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return data['entitled'] == true;
  } catch (_) {
    return false;
  }
}

Future<String?> coreAlertFcmTokenWithRetry() async {
  for (final delay in const [
    Duration.zero,
    Duration(seconds: 1),
    Duration(seconds: 3),
    Duration(seconds: 6),
  ]) {
    if (delay > Duration.zero) {
      await Future<void>.delayed(delay);
    }

    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null && token.trim().isNotEmpty) {
        return token.trim();
      }
    } catch (_) {}
  }

  return null;
}

Future<void> syncAlertLanguageTopicSafely(String languageCode) async {
  try {
    await syncAlertLanguageTopic(languageCode);
  } catch (error) {
    debugPrint('Alert language topic sync failed: $error');
  }
}

String localeLanguageCode(Locale locale) {
  if (locale.languageCode == 'zh' &&
      locale.scriptCode?.toLowerCase() == 'hant') {
    return 'zh_TW';
  }
  if (locale.languageCode == 'zh' && locale.countryCode == 'TW') {
    return 'zh_TW';
  }
  return locale.languageCode;
}

const Map<String, Map<String, String>> _closeGuessTexts = {
  'title': {
    'en': 'Close Guess Ranking',
    'ko': '종가 맞추기 랭킹',
    'ja': '終値予想ランキング',
    'es': 'Ranking de predicción del cierre',
    'pt': 'Ranking de previsão do fechamento',
    'ru': 'Рейтинг прогноза закрытия',
    'zh': '收盘价竞猜排名',
    'zh_TW': '收盤價預測排名',
    'fr': 'Classement du prix de clôture',
    'de': 'Schlusskurs-Tipp-Rangliste',
  },
  'badge': {
    'en': 'Predict today',
    'ko': '오늘 예측하기',
    'ja': '今日を予想',
    'es': 'Predecir hoy',
    'pt': 'Prever hoje',
    'ru': 'Прогноз на сегодня',
    'zh': '今日预测',
    'zh_TW': '今日預測',
    'fr': 'Prédire aujourd hui',
    'de': 'Heute tippen',
  },
  'cta': {
    'en': 'Open from market close through the first 3 hours',
    'ko': '장 마감 후부터 장 시작 3시간까지 참여하세요',
    'ja': '開始後3時間以内に参加して1位を狙おう',
    'es': 'Participa en las primeras 3 horas y busca el #1',
    'pt': 'Participe nas primeiras 3 horas e mire o 1º lugar',
    'ru': 'Участвуйте в первые 3 часа и боритесь за #1',
    'zh': '开盘后3小时内参与，冲击第1名',
    'zh_TW': '開盤後3小時內參加，挑戰第1名',
    'fr': 'Participez dans les 3 premières heures et visez la 1re place',
    'de': 'In den ersten 3 Stunden teilnehmen und Platz 1 anpeilen',
  },
  'rulesTitle': {
    'en': 'Game rules',
    'ko': '게임 룰',
    'ja': 'ゲームルール',
    'es': 'Reglas del juego',
    'pt': 'Regras do jogo',
    'ru': 'Правила игры',
    'zh': '游戏规则',
    'zh_TW': '遊戲規則',
    'fr': 'Règles du jeu',
    'de': 'Spielregeln',
  },
  'rulesBody': {
    'en':
        'Guess the QLD closing price. Entries are open from the previous market close through the first 3 hours of the next regular U.S. market session. Each day, ranks 1 to 5 are listed by closest distance to the reference close.',
    'ko':
        'QLD 종가를 예상해서 가격을 입력하세요. 참가는 미국 장 마감 후부터 다음 정규장 시작 후 3시간까지 가능하고, 기준 종가와 가장 가까운 순서대로 매일 1위부터 5위까지 기록됩니다.',
    'ja':
        '今日のQLD終値を予想してください。参加できるのは米国通常取引開始後3時間だけです。毎日、基準終値に近い順で1位から5位まで表示されます。',
    'es':
        'Adivina el precio de cierre de QLD de hoy. Solo se puede participar durante las primeras 3 horas de la sesión regular de EE. UU. Cada día se listan los puestos 1 a 5 según la menor distancia al cierre de referencia.',
    'pt':
        'Tente adivinhar o preço de fechamento do QLD hoje. As entradas ficam abertas apenas nas primeiras 3 horas do pregão regular dos EUA. Todos os dias, os lugares 1 a 5 aparecem por menor distância do fechamento de referência.',
    'ru':
        'Угадайте сегодняшнюю цену закрытия QLD. Участие открыто только первые 3 часа регулярной торговой сессии США. Каждый день места с 1 по 5 сортируются по близости к базовой цене закрытия.',
    'zh': '预测今天 QLD 的收盘价。只能在美国常规交易开盘后的前3小时内参加。每天按最接近参考收盘价的顺序列出第1到第5名。',
    'zh_TW': '預測今天 QLD 的收盤價。只能在美國常規交易開盤後前3小時內參加。每天依最接近參考收盤價的順序列出第1到第5名。',
    'fr':
        'Devinez le cours de clôture de QLD aujourd hui. Les participations sont ouvertes uniquement pendant les 3 premières heures de la séance régulière américaine. Chaque jour, les rangs 1 à 5 sont classés selon l écart le plus faible avec la clôture de référence.',
    'de':
        'Tippe den heutigen QLD-Schlusskurs. Eingaben sind nur in den ersten 3 Stunden der regulären US-Handelszeit möglich. Jeden Tag werden die Plätze 1 bis 5 nach der kleinsten Abweichung vom Referenzschlusskurs gelistet.',
  },
  'rule1': {
    'en':
        'Enter an optional nickname and expected price before the 3-hour market-open cutoff',
    'ko': '장 마감 후부터 장 시작 3시간 안에 닉네임 선택 입력과 예상 가격 입력',
    'ja': '開始後3時間以内にIDと予想価格を入力',
    'es': 'Introduce tu ID y precio esperado dentro de las 3 horas de apertura',
    'pt': 'Digite seu ID e preço esperado em até 3 horas após a abertura',
    'ru': 'Введите ID и ожидаемую цену в течение 3 часов после открытия',
    'zh': '开盘后3小时内输入ID和预测价格',
    'zh_TW': '開盤後3小時內輸入ID和預測價格',
    'fr':
        'Entrez votre ID et votre prix prévu dans les 3 heures après l ouverture',
    'de':
        'ID und erwarteten Preis innerhalb von 3 Stunden nach Marktöffnung eingeben',
  },
  'rule2': {
    'en': 'Daily rankings are sorted by smallest error',
    'ko': '오차가 작은 순서로 날짜별 랭킹 표시',
    'ja': '誤差が小さい順に日別ランキングを表示',
    'es': 'El ranking diario se ordena por menor error',
    'pt': 'O ranking diário é ordenado pelo menor erro',
    'ru': 'Ежедневный рейтинг сортируется по минимальной ошибке',
    'zh': '每日排名按误差从小到大显示',
    'zh_TW': '每日排名依誤差由小到大顯示',
    'fr': 'Le classement quotidien est trié par plus petite erreur',
    'de': 'Tägliche Rangliste nach kleinster Abweichung sortiert',
  },
  'rule3': {
    'en': '#1 can write a 100-character message at the bottom',
    'ko': '1위는 하단에 100자 한마디 작성 가능',
    'ja': '1位は下部に100文字のメッセージを書けます',
    'es': 'El #1 puede escribir un mensaje de 100 caracteres abajo',
    'pt': 'O 1º lugar pode escrever uma mensagem de 100 caracteres abaixo',
    'ru': '#1 может написать сообщение до 100 символов внизу',
    'zh': '第1名可在下方写100字以内留言',
    'zh_TW': '第1名可在下方寫100字以內留言',
    'fr': 'Le #1 peut écrire un message de 100 caractères en bas',
    'de': 'Platz 1 kann unten eine Nachricht mit 100 Zeichen schreiben',
  },
  'start': {
    'en': 'Start',
    'ko': '시작',
    'ja': '開始',
    'es': 'Empezar',
    'pt': 'Começar',
    'ru': 'Начать',
    'zh': '开始',
    'zh_TW': '開始',
    'fr': 'Commencer',
    'de': 'Starten',
  },
  'todayPrediction': {
    'en': 'Today prediction',
    'ko': '오늘의 예측',
    'ja': '今日の予想',
    'es': 'Predicción de hoy',
    'pt': 'Previsão de hoje',
    'ru': 'Прогноз на сегодня',
    'zh': '今日预测',
    'zh_TW': '今日預測',
    'fr': 'Prédiction du jour',
    'de': 'Heutiger Tipp',
  },
  'referenceCloseLoading': {
    'en': 'Loading reference close',
    'ko': '기준 종가를 불러오는 중',
    'ja': '基準終値を読み込み中',
    'es': 'Cargando cierre de referencia',
    'pt': 'Carregando fechamento de referência',
    'ru': 'Загрузка базовой цены закрытия',
    'zh': '正在加载参考收盘价',
    'zh_TW': '正在載入參考收盤價',
    'fr': 'Chargement de la clôture de référence',
    'de': 'Referenzschlusskurs wird geladen',
  },
  'join': {
    'en': 'Join',
    'ko': '참가하기',
    'ja': '参加する',
    'es': 'Participar',
    'pt': 'Participar',
    'ru': 'Участвовать',
    'zh': '参加',
    'zh_TW': '參加',
    'fr': 'Participer',
    'de': 'Teilnehmen',
  },
  'noPlayers': {
    'en': 'No entries yet. Leave the first prediction.',
    'ko': '아직 참가자가 없습니다. 첫 번째 예측을 남겨보세요.',
    'ja': 'まだ参加者はいません。最初の予想を残してください。',
    'es': 'Aún no hay participantes. Deja la primera predicción.',
    'pt': 'Ainda não há participantes. Faça a primeira previsão.',
    'ru': 'Пока нет участников. Оставьте первый прогноз.',
    'zh': '还没有参与者。留下第一个预测吧。',
    'zh_TW': '還沒有參與者。留下第一個預測吧。',
    'fr':
        'Aucune participation pour le moment. Laissez la première prédiction.',
    'de': 'Noch keine Einträge. Gib den ersten Tipp ab.',
  },
  'winnerMessageTitle': {
    'en': '#1 message',
    'ko': '1위의 한마디',
    'ja': '1位のひとこと',
    'es': 'Mensaje del #1',
    'pt': 'Mensagem do 1º lugar',
    'ru': 'Сообщение #1',
    'zh': '第1名留言',
    'zh_TW': '第1名留言',
    'fr': 'Message du #1',
    'de': 'Nachricht von Platz 1',
  },
  'noWinnerMessage': {
    'en': 'No message from #1 yet.',
    'ko': '아직 1위의 한마디가 없습니다.',
    'ja': '1位のメッセージはまだありません。',
    'es': 'Aún no hay mensaje del #1.',
    'pt': 'Ainda não há mensagem do 1º lugar.',
    'ru': 'Пока нет сообщения от #1.',
    'zh': '第1名还没有留言。',
    'zh_TW': '第1名還沒有留言。',
    'fr': 'Pas encore de message du #1.',
    'de': 'Noch keine Nachricht von Platz 1.',
  },
  'winnerMessageInput': {
    'en': '#1 message',
    'ko': '1위 한마디',
    'ja': '1位のメッセージ',
    'es': 'Mensaje del #1',
    'pt': 'Mensagem do 1º lugar',
    'ru': 'Сообщение #1',
    'zh': '第1名留言',
    'zh_TW': '第1名留言',
    'fr': 'Message du #1',
    'de': 'Nachricht von Platz 1',
  },
  'leaveMessage': {
    'en': 'Leave message',
    'ko': '한마디 남기기',
    'ja': 'メッセージを残す',
    'es': 'Dejar mensaje',
    'pt': 'Deixar mensagem',
    'ru': 'Оставить сообщение',
    'zh': '留下留言',
    'zh_TW': '留下留言',
    'fr': 'Laisser un message',
    'de': 'Nachricht hinterlassen',
  },
  'referenceCloseMissing': {
    'en': 'Load the reference close, then try again.',
    'ko': '기준 종가를 불러온 뒤 다시 입력해 주세요.',
    'ja': '基準終値を読み込んでからもう一度入力してください。',
    'es': 'Carga el cierre de referencia y vuelve a intentarlo.',
    'pt': 'Carregue o fechamento de referência e tente novamente.',
    'ru': 'Загрузите базовую цену закрытия и попробуйте снова.',
    'zh': '请先加载参考收盘价后再输入。',
    'zh_TW': '請先載入參考收盤價後再輸入。',
    'fr': 'Chargez la clôture de référence, puis réessayez.',
    'de': 'Referenzschlusskurs laden und erneut versuchen.',
  },
  'idPriceMissing': {
    'en': 'Enter the expected price.',
    'ko': '예상 가격을 입력해 주세요.',
    'ja': 'IDと価格を入力してください。',
    'es': 'Introduce tu ID y precio.',
    'pt': 'Digite seu ID e preço.',
    'ru': 'Введите ID и цену.',
    'zh': '请输入ID和价格。',
    'zh_TW': '請輸入ID和價格。',
    'fr': 'Entrez votre ID et votre prix.',
    'de': 'ID und Preis eingeben.',
  },
  'submissionWindowClosed': {
    'en':
        'Entries are open from market close through the first 3 hours of the next regular U.S. session.',
    'ko': '참가는 미국 장 마감 후부터 다음 정규장 시작 후 3시간까지만 가능합니다.',
    'ja': '参加できるのは米国通常取引開始後3時間だけです。',
    'es':
        'Las entradas solo están abiertas durante las primeras 3 horas tras la apertura regular de EE. UU.',
    'pt':
        'As entradas ficam abertas apenas nas primeiras 3 horas após a abertura regular dos EUA.',
    'ru':
        'Участие открыто только первые 3 часа после открытия регулярного рынка США.',
    'zh': '只能在美国常规市场开盘后的前3小时内参加。',
    'zh_TW': '只能在美國常規市場開盤後前3小時內參加。',
    'fr':
        'Les participations sont ouvertes seulement pendant les 3 premières heures après l ouverture régulière américaine.',
    'de':
        'Eingaben sind nur in den ersten 3 Stunden nach der regulären US-Markteröffnung möglich.',
  },
  'winnerTokenMissing': {
    'en': 'Only the device that actually recorded #1 can leave a message.',
    'ko': '실제로 1위를 기록한 기기에서만 한마디를 남길 수 있습니다.',
    'ja': '実際に1位を記録した端末だけがメッセージを残せます。',
    'es':
        'Solo el dispositivo que realmente consiguió el #1 puede dejar un mensaje.',
    'pt':
        'Só o dispositivo que realmente ficou em 1º pode deixar uma mensagem.',
    'ru': 'Оставить сообщение может только устройство, реально занявшее #1.',
    'zh': '只有实际获得第1名的设备可以留言。',
    'zh_TW': '只有實際獲得第1名的裝置可以留言。',
    'fr':
        'Seul l appareil qui a réellement obtenu la 1re place peut laisser un message.',
    'de':
        'Nur das Gerät, das wirklich Platz 1 erreicht hat, kann eine Nachricht hinterlassen.',
  },
  'rankingUnavailable': {
    'en': 'Ranking is temporarily unavailable. Please try again soon.',
    'ko': '랭킹 서버가 잠시 불안정합니다. 잠시 후 다시 시도해 주세요.',
    'ja': 'ランキングサーバーが一時的に利用できません。少し後でもう一度お試しください。',
    'es':
        'El ranking no está disponible temporalmente. Inténtalo de nuevo pronto.',
    'pt':
        'O ranking está temporariamente indisponível. Tente novamente em breve.',
    'ru': 'Рейтинг временно недоступен. Попробуйте снова чуть позже.',
    'zh': '排名服务暂时不可用。请稍后再试。',
    'zh_TW': '排名服務暫時無法使用。請稍後再試。',
    'fr': 'Le classement est temporairement indisponible. Réessayez bientôt.',
    'de':
        'Die Rangliste ist vorübergehend nicht verfügbar. Bitte bald erneut versuchen.',
  },
  'messageSaveFailed': {
    'en': 'Message could not be saved. Please try again soon.',
    'ko': '한마디를 저장하지 못했습니다. 잠시 후 다시 시도해 주세요.',
    'ja': 'メッセージを保存できませんでした。少し後でもう一度お試しください。',
    'es': 'No se pudo guardar el mensaje. Inténtalo de nuevo pronto.',
    'pt': 'Não foi possível salvar a mensagem. Tente novamente em breve.',
    'ru': 'Не удалось сохранить сообщение. Попробуйте снова чуть позже.',
    'zh': '无法保存留言。请稍后再试。',
    'zh_TW': '無法儲存留言。請稍後再試。',
    'fr': 'Le message n a pas pu être enregistré. Réessayez bientôt.',
    'de':
        'Die Nachricht konnte nicht gespeichert werden. Bitte bald erneut versuchen.',
  },
};

String localizedCloseGuessText(Locale locale, String key) {
  final texts = _closeGuessTexts[key];
  if (texts == null) return '';
  final code = localeLanguageCode(locale);
  return texts[code] ?? texts[locale.languageCode] ?? texts['en'] ?? '';
}

String localizedCloseGuessReferenceClose(Locale locale, double close) {
  final value = '\$${close.toStringAsFixed(2)}';
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '$value 기준 종가';
    case 'ja':
      return '$value 基準終値';
    case 'es':
      return 'Cierre de referencia $value';
    case 'pt':
      return 'Fechamento de referência $value';
    case 'ru':
      return 'Базовая цена закрытия $value';
    case 'zh':
    case 'zh_TW':
      return '参考收盘价 $value';
    case 'fr':
      return 'Clôture de référence $value';
    case 'de':
      return 'Referenzschlusskurs $value';
    default:
      return 'Reference close $value';
  }
}

String localizedCloseGuessRank(Locale locale, int rank) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '$rank위';
    case 'ja':
      return '$rank位';
    case 'es':
    case 'pt':
    case 'fr':
    case 'de':
    case 'ru':
    case 'zh':
    case 'zh_TW':
      return '#$rank';
    default:
      final suffix = rank == 1
          ? 'st'
          : rank == 2
              ? 'nd'
              : rank == 3
                  ? 'rd'
                  : 'th';
      return '$rank$suffix';
  }
}

String localizedCloseGuessDifference(Locale locale, double difference) {
  final value = difference.toStringAsFixed(2);
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '오차 $value';
    case 'ja':
      return '誤差 $value';
    case 'es':
      return 'Error $value';
    case 'pt':
      return 'Erro $value';
    case 'ru':
      return 'Ошибка $value';
    case 'zh':
    case 'zh_TW':
      return '误差 $value';
    case 'fr':
      return 'Écart $value';
    case 'de':
      return 'Abw. $value';
    default:
      return 'Error $value';
  }
}

String localizedCloseGuessPreviousResultTitle(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '\uC5B4\uC81C \uACB0\uACFC';
    case 'ja':
      return '\u524D\u56DE\u306E\u7D50\u679C';
    case 'es':
      return 'Resultado anterior';
    case 'pt':
      return 'Resultado anterior';
    case 'fr':
      return 'Resultat precedent';
    case 'de':
      return 'Letztes Ergebnis';
    default:
      return 'Previous result';
  }
}

String localizedCloseGuessPreviousClose(Locale locale, double close) {
  final value = '\$${close.toStringAsFixed(2)}';
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '\uC5B4\uC81C\uB294 $value\uC5D0 \uB9C8\uAC10';
    case 'ja':
      return '\u524D\u56DE\u306E\u7D42\u5024 $value';
    case 'es':
      return 'Cerro en $value';
    case 'pt':
      return 'Fechou em $value';
    case 'fr':
      return 'Cloture a $value';
    case 'de':
      return 'Schlusskurs $value';
    default:
      return 'Closed at $value';
  }
}

String localizedCloseGuessWinnerSummary(
  Locale locale,
  CloseGuessEntry? winner,
) {
  final name = winner?.id.trim() ?? '';
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return name.isEmpty ? '1\uB4F1 \uC5C6\uC74C' : '1\uB4F1 $name';
    case 'ja':
      return name.isEmpty ? '1\u4F4D\u306A\u3057' : '1\u4F4D $name';
    case 'es':
      return name.isEmpty ? 'Sin ganador' : 'Ganador $name';
    case 'pt':
      return name.isEmpty ? 'Sem vencedor' : '1o lugar $name';
    case 'fr':
      return name.isEmpty ? 'Aucun gagnant' : '1er $name';
    case 'de':
      return name.isEmpty ? 'Kein Gewinner' : 'Platz 1 $name';
    default:
      return name.isEmpty ? 'No winner' : 'Winner $name';
  }
}

bool _isCloseGuessNewYorkDst(DateTime utcNow) {
  final year = utcNow.year;
  final dstStartDay = _closeGuessNthWeekdayOfMonthUtc(
    year,
    3,
    DateTime.sunday,
    2,
  );
  final dstEndDay = _closeGuessNthWeekdayOfMonthUtc(
    year,
    11,
    DateTime.sunday,
    1,
  );

  final dstStartUtc = DateTime.utc(year, 3, dstStartDay, 7);
  final dstEndUtc = DateTime.utc(year, 11, dstEndDay, 6);
  return !utcNow.isBefore(dstStartUtc) && utcNow.isBefore(dstEndUtc);
}

int _closeGuessNthWeekdayOfMonthUtc(
  int year,
  int month,
  int weekday,
  int n,
) {
  final first = DateTime.utc(year, month, 1);
  final delta = (weekday - first.weekday + 7) % 7;
  return 1 + delta + (n - 1) * 7;
}

final Map<int, _UsMarketCalendar> _closeGuessMarketCalendarCache = {};

String _closeGuessDateString(int year, int month, int day) =>
    '${year.toString().padLeft(4, '0')}-'
    '${month.toString().padLeft(2, '0')}-'
    '${day.toString().padLeft(2, '0')}';

DateTime _closeGuessToNewYorkTime(DateTime utcNow) => utcNow.add(
      Duration(hours: _isCloseGuessNewYorkDst(utcNow) ? -4 : -5),
    );

int _closeGuessLastWeekdayOfMonthUtc(int year, int month, int weekday) {
  final last = DateTime.utc(year, month + 1, 0);
  final delta = (last.weekday - weekday + 7) % 7;
  return last.day - delta;
}

DateTime _closeGuessEasterSunday(int year) {
  final a = year % 19;
  final b = year ~/ 100;
  final c = year % 100;
  final d = b ~/ 4;
  final e = b % 4;
  final f = (b + 8) ~/ 25;
  final g = (b - f + 1) ~/ 3;
  final h = (19 * a + b - d - g + 15) % 30;
  final i = c ~/ 4;
  final k = c % 4;
  final l = (32 + 2 * e + 2 * i - h - k) % 7;
  final m = (a + 11 * h + 22 * l) ~/ 451;
  final month = (h + l - 7 * m + 114) ~/ 31;
  final day = ((h + l - 7 * m + 114) % 31) + 1;

  return DateTime.utc(year, month, day);
}

void _closeGuessAddObservedFixedHoliday(
  Set<String> dates,
  int year,
  int month,
  int day, {
  bool skipSaturdayObserved = false,
}) {
  final date = DateTime.utc(year, month, day);
  if (date.weekday == DateTime.sunday) {
    final observed = date.add(const Duration(days: 1));
    dates.add(
      _closeGuessDateString(observed.year, observed.month, observed.day),
    );
    return;
  }

  if (date.weekday == DateTime.saturday) {
    if (skipSaturdayObserved) return;
    final observed = date.subtract(const Duration(days: 1));
    dates.add(
      _closeGuessDateString(observed.year, observed.month, observed.day),
    );
    return;
  }

  dates.add(_closeGuessDateString(year, month, day));
}

String _closeGuessPreviousTradingDate(
  int year,
  int month,
  int day,
  Set<String> closedDates,
) {
  var current =
      DateTime.utc(year, month, day).subtract(const Duration(days: 1));
  while (current.weekday == DateTime.saturday ||
      current.weekday == DateTime.sunday ||
      closedDates.contains(
        _closeGuessDateString(current.year, current.month, current.day),
      )) {
    current = current.subtract(const Duration(days: 1));
  }
  return _closeGuessDateString(current.year, current.month, current.day);
}

_UsMarketCalendar _closeGuessMarketCalendar(int year) {
  final cached = _closeGuessMarketCalendarCache[year];
  if (cached != null) return cached;

  final closedDates = <String>{};
  final earlyCloseDates = <String>{};

  _closeGuessAddObservedFixedHoliday(
    closedDates,
    year,
    1,
    1,
    skipSaturdayObserved: true,
  );
  closedDates.add(
    _closeGuessDateString(
      year,
      1,
      _closeGuessNthWeekdayOfMonthUtc(year, 1, DateTime.monday, 3),
    ),
  );
  closedDates.add(
    _closeGuessDateString(
      year,
      2,
      _closeGuessNthWeekdayOfMonthUtc(year, 2, DateTime.monday, 3),
    ),
  );

  final easter = _closeGuessEasterSunday(year);
  final goodFriday = easter.subtract(const Duration(days: 2));
  closedDates.add(
    _closeGuessDateString(goodFriday.year, goodFriday.month, goodFriday.day),
  );

  closedDates.add(
    _closeGuessDateString(
      year,
      5,
      _closeGuessLastWeekdayOfMonthUtc(year, 5, DateTime.monday),
    ),
  );
  _closeGuessAddObservedFixedHoliday(closedDates, year, 6, 19);
  _closeGuessAddObservedFixedHoliday(closedDates, year, 7, 4);
  closedDates.add(
    _closeGuessDateString(
      year,
      9,
      _closeGuessNthWeekdayOfMonthUtc(year, 9, DateTime.monday, 1),
    ),
  );
  closedDates.add(
    _closeGuessDateString(
      year,
      11,
      _closeGuessNthWeekdayOfMonthUtc(year, 11, DateTime.thursday, 4),
    ),
  );
  _closeGuessAddObservedFixedHoliday(closedDates, year, 12, 25);

  final thanksgivingDay =
      _closeGuessNthWeekdayOfMonthUtc(year, 11, DateTime.thursday, 4);
  final dayAfterThanksgiving =
      DateTime.utc(year, 11, thanksgivingDay).add(const Duration(days: 1));
  earlyCloseDates.add(
    _closeGuessDateString(
      dayAfterThanksgiving.year,
      dayAfterThanksgiving.month,
      dayAfterThanksgiving.day,
    ),
  );
  earlyCloseDates.add(
    _closeGuessPreviousTradingDate(year, 7, 4, closedDates),
  );

  final christmasEve = DateTime.utc(year, 12, 24);
  final christmasEveString = _closeGuessDateString(year, 12, 24);
  if (christmasEve.weekday >= DateTime.monday &&
      christmasEve.weekday <= DateTime.friday &&
      !closedDates.contains(christmasEveString)) {
    earlyCloseDates.add(christmasEveString);
  }

  final calendar = _UsMarketCalendar(
    closedDates: closedDates,
    earlyCloseDates: earlyCloseDates,
  );
  _closeGuessMarketCalendarCache[year] = calendar;
  return calendar;
}

bool _closeGuessIsMarketOpenDay(DateTime ny) {
  final date = _closeGuessDateString(ny.year, ny.month, ny.day);
  final isWeekday =
      ny.weekday >= DateTime.monday && ny.weekday <= DateTime.friday;
  return isWeekday &&
      !_closeGuessMarketCalendar(ny.year).closedDates.contains(date);
}

int _closeGuessMarketCloseMinute(DateTime ny) {
  final date = _closeGuessDateString(ny.year, ny.month, ny.day);
  return _closeGuessMarketCalendar(ny.year).earlyCloseDates.contains(date)
      ? 13 * 60
      : 16 * 60;
}

String _closeGuessNextTradingDate(DateTime ny) {
  var current =
      DateTime.utc(ny.year, ny.month, ny.day).add(const Duration(days: 1));
  while (current.weekday == DateTime.saturday ||
      current.weekday == DateTime.sunday ||
      _closeGuessMarketCalendar(current.year).closedDates.contains(
            _closeGuessDateString(current.year, current.month, current.day),
          )) {
    current = current.add(const Duration(days: 1));
  }
  return _closeGuessDateString(current.year, current.month, current.day);
}

String _closeGuessSubmissionDate([DateTime? now]) {
  final utcNow = (now ?? DateTime.now()).toUtc();
  final ny = _closeGuessToNewYorkTime(utcNow);
  final minutes = ny.hour * 60 + ny.minute;

  if (!_closeGuessIsMarketOpenDay(ny)) {
    return _closeGuessNextTradingDate(ny);
  }

  if (minutes >= _closeGuessMarketCloseMinute(ny)) {
    return _closeGuessNextTradingDate(ny);
  }

  return _closeGuessDateString(ny.year, ny.month, ny.day);
}

String localizedCoreAlertTitle(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '커피 한 잔으로 개발 응원';
    default:
      return 'Support development with a coffee';
  }
}

String localizedCoreAlertSubtitle(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '투자에 도움 되는 앱으로 계속 개선하겠습니다.';
    default:
      return 'Help keep improving the app for investment decisions.';
  }
}

String localizedCoreAlertLockedText(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '개발 응원';
    default:
      return 'Support';
  }
}

String localizedCoreAlertSupportedText(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '응원 완료';
    default:
      return 'Supported';
  }
}

String localizedCoreAlertPurchaseButton(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '커피 한 잔으로 응원하기';
    default:
      return 'Support with a coffee';
  }
}

String localizedCoreAlertLifetimeNote(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '커피 한 잔 정도의 응원은 투자에 도움 되는 기능을 꾸준히 개발하는 데 사용됩니다.';
    default:
      return 'A coffee-sized support helps fund steady development of investment-focused features.';
  }
}

String localizedCoreAlertPaywallBody(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return 'QLD DIP ALERT는 가격 변동, 알림, 참고 지표를 더 보기 쉽고 안정적으로 제공해 투자 판단을 정리하는 데 도움이 되도록 개발하고 있습니다. 커피 한 잔 정도의 응원은 서버 운영, 기능 개선, 더 안정적인 알림과 화면 개선에 사용됩니다.';
    default:
      return 'QLD DIP ALERT is built to make price moves, alerts, and reference indicators clearer and more reliable for investment decisions. A coffee-sized support helps fund server costs, feature improvements, more reliable alerts, and a clearer app experience.';
  }
}

String localizedCoreAlertPurchaseUnavailable(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '스토어 상품이 연결된 뒤 이용할 수 있습니다.';
    default:
      return 'Available after the store product is connected.';
  }
}

String localizedCoreAlertPurchasePending(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '응원 결제를 진행하고 있습니다.';
    default:
      return 'Support payment is in progress.';
  }
}

String localizedCoreAlertPurchaseComplete(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '응원해주셔서 감사합니다. 투자에 도움 되는 기능을 꾸준히 개발하겠습니다.';
    default:
      return 'Thank you for the support. I will keep improving investment-focused features.';
  }
}

String localizedCoreAlertPurchaseFailed(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '응원 결제를 완료하지 못했습니다.';
    default:
      return 'Support payment could not be completed.';
  }
}

String localizedCoreAlertPurchaseLaunchFailed(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '결제창을 열 수 없습니다. Google Play 계정과 결제 상품 설정을 확인해 주세요.';
    default:
      return 'The purchase screen could not be opened. Check the Google Play account and product setup.';
  }
}

String localizedCoreAlertPurchaseCanceled(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '응원 결제가 취소되었습니다.';
    default:
      return 'Support payment was canceled.';
  }
}

String localizedCoreAlertPurchaseVerificationFailed(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '응원 결제 확인 중 문제가 생겼습니다. 잠시 후 다시 시도해 주세요.';
    default:
      return 'There was a problem verifying the support payment. Please try again shortly.';
  }
}

String localizedCoreAlertRestoreFailed(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '결제 내역 복원에 실패했습니다. Google Play 계정을 확인한 뒤 다시 시도해 주세요.';
    default:
      return 'Purchase restore failed. Check your Google Play account and try again.';
  }
}

String localizedCoreAlertRestorePending(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '결제 내역을 확인하고 있습니다.';
    default:
      return 'Checking purchase history...';
  }
}

String localizedCoreAlertRestoreNotFound(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '복원할 결제 내역을 찾지 못했습니다. Google Play 계정을 확인해 주세요.';
    default:
      return 'No purchase history was found to restore. Check your Google Play account.';
  }
}

String localizedCoreAlertRestoreButton(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '결제 내역 복원';
    default:
      return 'Restore purchase';
  }
}

String localizedQldMoveAlertTitle(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return 'QLD 4% / 7% / 10% 급등/급락 알림';
    default:
      return 'QLD 4% / 7% / 10% move alerts';
  }
}

String localizedQldMoveAlertSubtitle(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '전일 종가 대비 4%, 7%, 10% 구간에 도달하면 단계별로 알려줍니다.';
    default:
      return 'Alerts step by step when QLD reaches 4%, 7%, and 10% moves from the previous close.';
  }
}

String localizedQldMoveUpAlert(Locale locale, double percent) {
  final value = percent.abs().toStringAsFixed(1);
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return 'QLD $value% 급등';
    default:
      return 'QLD up $value%';
  }
}

String localizedQldMoveDownAlert(Locale locale, double percent) {
  final value = percent.abs().toStringAsFixed(1);
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return 'QLD $value% 급락';
    default:
      return 'QLD down $value%';
  }
}

String localizedQldMoveAlertDetail(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return 'QLD가 전일 종가 대비 4%, 7%, 10% 구간에 도달했습니다. 큰 변동은 단기 흐름 전환이나 수급 변화를 의미할 수 있어 확인이 필요합니다.';
    default:
      return 'QLD reached a 4%, 7%, or 10% move zone from the previous close. A large move can sometimes signal a short-term shift in market flow.';
  }
}

String localizedSimpleQldMoveAlertTitle(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return 'QLD 큰 상승/큰 하락';
    default:
      return 'QLD big move alerts';
  }
}

String localizedSimpleQldMoveAlertSubtitle(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '전일 종가 대비 4% 이상 큰 상승이나 큰 하락이 있을 때 한 번만 알려줍니다.';
    default:
      return 'Alerts once when QLD moves 4% or more up or down from the previous close.';
  }
}

String localizedSimpleQldMoveAlertDetail(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return 'QLD가 전일 종가 대비 4% 이상 크게 움직였습니다. 알림에 실제 변동률이 함께 표시되니 계획에 영향이 있는지 확인하세요.';
    default:
      return 'QLD moved 4% or more from the previous close. The alert includes the actual move percentage so you can check whether it affects your plan.';
  }
}

String localizedProfitTargetSettingTitle(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '수익률 목표 알림';
    default:
      return 'Profit Target Alert';
  }
}

String localizedProfitTargetSettingSubtitle(Locale locale) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '평단가 대비 50%, 100%, 200%, 300% 도달 시 알림';
    default:
      return 'Notify at 50%, 100%, 200%, and 300% above your average price';
  }
}

String localizedProfitTargetMessage(
  Locale locale,
  String symbol,
  int target,
) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '$symbol 수익률 $target% 도달';
    default:
      return '$symbol profit reached $target%';
  }
}

String localizedProfitTargetDetail(
  Locale locale,
  String symbol,
  int target,
) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '$symbol가 입력한 평균단가 대비 $target% 수익률을 달성했습니다. 급하게 전량 매도하기보다 목표 비중과 현금 비중을 함께 확인하세요.';
    default:
      return '$symbol reached a $target% gain from your average price. Check your target allocation and cash level before making a rushed sell decision.';
  }
}

String localizedPriceRefreshStatus(
  Locale locale, {
  required bool isRefreshing,
  required bool isCached,
}) {
  final code = localeLanguageCode(locale);

  if (isRefreshing) {
    switch (code) {
      case 'ko':
        return '업데이트 중...';
      case 'ja':
        return '?닸뼭訝?..';
      case 'es':
        return 'Actualizando...';
      case 'pt':
        return 'Atualizando...';
      case 'ru':
        return '?閨戟棘勻剋筠戟龜筠...';
      case 'zh':
        return '閭ｅ쑉?닸뼭...';
      case 'zh_TW':
        return '閭ｅ쑉?닸뼭...';
      case 'fr':
        return 'Mise 횪 jour...';
      case 'de':
        return 'Aktualisierung...';
      default:
        return 'Updating...';
    }
  }

  if (isCached) {
    switch (code) {
      case 'ko':
        return '최근 저장 가격';
      case 'ja':
        return '?瓦묇퓷耶섅걬?뚣걼堊→졏';
      case 'es':
        return 'Precio guardado reciente';
      case 'pt':
        return 'Pre챌o salvo recente';
      case 'ru':
        return '?棘?剋筠畇戟?? ?棘??逵戟筠戟戟逵? ?筠戟逵';
      case 'zh':
        return '최근 저장 가격';
      case 'zh_TW':
        return '최근 저장 가격';
      case 'fr':
        return 'Prix enregistr챕 r챕cent';
      case 'de':
        return 'Zuletzt gespeicherter Preis';
      default:
        return 'Recent saved price';
    }
  }

  switch (code) {
    case 'ko':
      return '방금 갱신됨';
    case 'ja':
      return '餓딀쎍?겹걬?뚣겲?쀣걼';
    case 'es':
      return 'Actualizado ahora';
    case 'pt':
      return 'Atualizado agora';
    case 'ru':
      return '龜棘剋?克棘 ??棘 棘閨戟棘勻剋筠戟棘';
    case 'zh':
      return '?싧닖?닸뼭';
    case 'zh_TW':
      return '?쎾돍?닸뼭';
    case 'fr':
      return 'Mis 횪 jour maintenant';
    case 'de':
      return 'Gerade aktualisiert';
    default:
      return 'Just updated';
  }
}

String localizedPriceRefreshStatusWithCountdown(
  Locale locale, {
  required bool isRefreshing,
  required bool isCached,
  required int countdownSeconds,
}) {
  final status = localizedPriceRefreshStatus(
    locale,
    isRefreshing: isRefreshing,
    isCached: isCached,
  );

  if (isRefreshing || isCached) return status;

  final seconds = countdownSeconds.clamp(0, _priceRefreshIntervalSeconds);
  switch (localeLanguageCode(locale)) {
    case 'ko':
      return '다음 갱신까지(${seconds}s)';
    case 'ja':
      return '\u6B21\u306E\u66F4\u65B0\u307E\u3067(${seconds}s)';
    case 'zh':
    case 'zh_TW':
      return '\u8DDD\u4E0B\u6B21\u66F4\u65B0(${seconds}s)';
    default:
      return 'Next refresh in(${seconds}s)';
  }
}

String localizedMarketStatusText(
  Locale locale, {
  required bool isPreMarket,
  required bool isRegularMarket,
  required bool isAfterHours,
}) {
  switch (localeLanguageCode(locale)) {
    case 'ko':
      if (isPreMarket) return '프리장';
      if (isRegularMarket) return '실시간';
      if (isAfterHours) return '시간외';
      return '휴장';
    case 'ja':
      if (isPreMarket) return '野꾢뎺';
      if (isRegularMarket) return 'Live';
      if (isAfterHours) return 'After';
      return '鴉묈졃';
    case 'zh':
      if (isPreMarket) return '?섇뎺';
      if (isRegularMarket) return '若욄뿶';
      if (isAfterHours) return '?섇릮';
      return '鴉묈툊';
    case 'zh_TW':
      if (isPreMarket) return '?ㅵ뎺';
      if (isRegularMarket) return '?녔셽';
      if (isAfterHours) return '?ㅵ풄';
      return '鴉묈툊';
    default:
      if (isPreMarket) return 'PRE';
      if (isRegularMarket) return 'LIVE';
      if (isAfterHours) return 'POST';
      return 'CLOSED';
  }
}

String localizedRemoteValue(
  Map<String, dynamic> data,
  String key,
  String languageCode,
  String fallback,
) {
  final normalizedCode = languageCode.replaceAll('-', '_');
  final baseCode = normalizedCode.split('_').first;
  final camelCode = normalizedCode
      .split('_')
      .map(
        (part) => part.isEmpty
            ? part
            : '${part[0].toUpperCase()}${part.substring(1)}',
      )
      .join();
  final lowerCode = normalizedCode.toLowerCase();
  final aliases = <String>{
    normalizedCode,
    lowerCode,
    baseCode,
    if (normalizedCode == 'zh_TW') ...[
      'zh-Hant',
      'zh_Hant',
      'zhHant',
      'tw',
      'traditional',
    ],
    if (normalizedCode == 'zh') ...[
      'zh_CN',
      'zh-CN',
      'zh_Hans',
      'zhHans',
      'cn',
      'simplified',
    ],
  };

  final candidates = <String>[
    for (final code in aliases) ...[
      '${key}_$code',
      '$key-$code',
      '$key${code.toUpperCase()}',
    ],
    '$key$camelCode',
    '${key}_${baseCode.toUpperCase()}',
    key,
  ];

  for (final candidate in candidates) {
    final value = data[candidate]?.toString();
    if (value != null && value.trim().isNotEmpty) {
      return value.trim();
    }
  }

  return fallback;
}

bool containsKoreanText(String value) {
  return RegExp(r'[\u1100-\u11ff\u3130-\u318f\uac00-\ud7a3]').hasMatch(value);
}

String localizedAutomaticRemoteValue(
  Map<String, dynamic> data,
  String key,
  String languageCode,
  String fallback,
) {
  final localized = localizedRemoteValue(data, key, languageCode, fallback);
  if (alertTopicLanguageCode(languageCode) == 'ko' ||
      !containsKoreanText(localized)) {
    return localized;
  }

  final english = localizedRemoteValue(data, key, 'en', '');
  if (english.isNotEmpty && !containsKoreanText(english)) {
    return english;
  }

  return key == 'title' ? 'QLD Alert' : '';
}

Future<AlertHistoryItem> alertItemFromRemoteMessageLocalized(
  RemoteMessage message,
) async {
  final languageCode = await savedLanguageCode();
  final data = message.data;
  final type = data['type']?.toString() ?? _announcementAlertType;
  final valueForLanguage = isAnnouncementAlertType(type)
      ? localizedRemoteValue
      : localizedAutomaticRemoteValue;
  final fallbackTitle =
      message.notification?.title ?? data['title']?.toString() ?? 'QLD Alert';
  final fallbackBody =
      message.notification?.body ?? data['body']?.toString() ?? '';

  final title = valueForLanguage(
    data,
    'title',
    languageCode,
    fallbackTitle,
  );
  final body = valueForLanguage(
    data,
    'body',
    languageCode,
    fallbackBody,
  );
  final detail = valueForLanguage(
    data,
    'detail',
    languageCode,
    body.isEmpty ? title : body,
  );
  final link = localizedRemoteValue(
    data,
    'link',
    languageCode,
    data['url']?.toString() ?? '',
  );
  return AlertHistoryItem(
    message: title,
    detail: detail,
    link: link,
    type: type,
    createdAt: DateTime.now(),
  );
}

bool isAnnouncementAlertType(String type) {
  return type == _announcementAlertType ||
      type == 'notice' ||
      type == 'announcement' ||
      type == 'push';
}

AlertHistoryItem tradingViewInstallAlertItem() {
  return AlertHistoryItem(
    message: 'Install TradingView',
    detail: 'Install TradingView to open charts directly from this app.',
    link: _tradingViewInstallUrl,
    type: _tradingViewInstallAlertType,
    createdAt: DateTime(2026, 1, 1),
  );
}

List<AlertHistoryItem> sortAlertHistoryItems(
  Iterable<AlertHistoryItem> source, {
  int limit = 50,
}) {
  final announcements = <AlertHistoryItem>[];
  final others = <AlertHistoryItem>[];

  for (final item in source) {
    if (item.message.isEmpty) continue;

    if (item.type == _tradingViewInstallAlertType) {
      continue;
    } else if (isAnnouncementAlertType(item.type)) {
      if (announcements.isEmpty) {
        announcements.add(item);
      }
    } else {
      others.add(item);
    }
  }

  return [
    tradingViewInstallAlertItem(),
    ...announcements,
    ...others,
  ].take(limit).toList();
}

Future<bool> alertTypeEnabledFromPrefs(String type) async {
  final prefs = await SharedPreferences.getInstance();

  if (isAnnouncementAlertType(type)) {
    return prefs.getBool('announcementAlertEnabled') ?? true;
  }

  if (type == 'high') {
    return prefs.getBool('highAlertEnabled') ?? true;
  }

  if (type == 'marketOpen') {
    return prefs.getBool('marketOpenAlertEnabled') ?? true;
  }

  if (type == 'qldMoveUp4' || type == 'qldMoveDown4') {
    return prefs.getBool('qldMoveAlertEnabled') ?? true;
  }

  if (type == 'coreAlert') {
    final purchased = prefs.getBool('coreAlertPurchased') ?? false;
    return purchased && (prefs.getBool('coreAlertEnabled') ?? false);
  }

  if (type == 'minus20' ||
      type == 'minus30' ||
      type == 'minus40' ||
      type == 'minus50' ||
      type == 'recovery20' ||
      type == 'recovery30' ||
      type == 'recovery40' ||
      type == 'recovery50') {
    return prefs.getBool('strategyAlertEnabled') ?? true;
  }

  if (type == 'nasdaq200Breakdown' ||
      type == 'nasdaq200Breakout' ||
      type == 'nasdaq200Recovery') {
    return prefs.getBool('nasdaq200AlertEnabled') ?? true;
  }

  if (type == 'portfolioCashHigh' || type == 'portfolioCashLow') {
    return prefs.getBool('portfolioCashAlertEnabled') ?? true;
  }

  if (type == 'fearGreedExtremeFear') {
    return prefs.getBool('fearGreedExtremeFearAlertEnabled') ?? true;
  }

  if (type == 'fearGreedExtremeGreed') {
    return prefs.getBool('fearGreedExtremeGreedAlertEnabled') ?? true;
  }

  if (type.startsWith('profitTarget')) {
    return prefs.getBool('profitTargetAlertEnabled') ?? true;
  }

  return true;
}

Future<bool> initialRemoteMessageNavigationAllowed() async {
  final prefs = await SharedPreferences.getInstance();
  final ready = prefs.getBool(_initialRemoteMessageNavigationReadyKey) ?? false;

  if (!ready) {
    await prefs.setBool(_initialRemoteMessageNavigationReadyKey, true);
    return false;
  }

  return true;
}

Future<int> ensureRemoteAlertInstallSeenAt({
  DateTime? now,
}) async {
  final prefs = await SharedPreferences.getInstance();
  final saved = prefs.getInt(_remoteAlertInstallSeenAtKey);
  if (saved != null && saved > 0) return saved;

  final installSeenAt = (now ?? DateTime.now()).millisecondsSinceEpoch;
  await prefs.setInt(_remoteAlertInstallSeenAtKey, installSeenAt);
  return installSeenAt;
}

Future<bool> remoteAlertInstallSeenAtExists() async {
  final prefs = await SharedPreferences.getInstance();
  return (prefs.getInt(_remoteAlertInstallSeenAtKey) ?? 0) > 0;
}

Future<void> clearStaleNotificationsOnFreshInstall(bool freshInstall) async {
  if (kIsWeb || !freshInstall) return;

  final prefs = await SharedPreferences.getInstance();
  if (prefs.getBool(_staleNotificationCleanupDoneKey) == true) return;

  await _localNotifications.cancelAll();
  await prefs.setBool(_staleNotificationCleanupDoneKey, true);
}

int _remoteMessageSentAtMs(Map<String, dynamic> data) {
  final raw = data['sentAtMs'] ?? data['sentAt'];
  if (raw == null) return 0;

  if (raw is int) return raw;
  if (raw is num) return raw.toInt();

  final value = raw.toString().trim();
  if (value.isEmpty) return 0;

  final numeric = int.tryParse(value);
  if (numeric != null) return numeric;

  return DateTime.tryParse(value)?.millisecondsSinceEpoch ?? 0;
}

bool isRemoteAlertStaleForInstallData(
  Map<String, dynamic> data,
  int installSeenAtMs, {
  int fallbackSentAtMs = 0,
}) {
  final sentAtMs = _remoteMessageSentAtMs(data);
  final effectiveSentAtMs = sentAtMs > 0 ? sentAtMs : fallbackSentAtMs;
  if (installSeenAtMs <= 0) return false;
  if (effectiveSentAtMs <= 0) return true;

  return effectiveSentAtMs < installSeenAtMs;
}

Future<bool> remoteAlertFreshForInstall(RemoteMessage message) async {
  final installSeenAtMs = await ensureRemoteAlertInstallSeenAt();
  return !isRemoteAlertStaleForInstallData(
    message.data,
    installSeenAtMs,
    fallbackSentAtMs: message.sentTime?.millisecondsSinceEpoch ?? 0,
  );
}

Uri? alertLinkUri(AlertHistoryItem item, String detail) {
  final candidates = [
    item.link,
    item.detail,
    item.message,
    detail,
  ];
  final linkPattern = RegExp(
    r'(https?://[^\s<>)\]]+|www\.[^\s<>)\]]+)',
    caseSensitive: false,
  );

  for (final source in candidates) {
    final raw = source.trim();
    final match = linkPattern.firstMatch(raw);
    final value = (match?.group(0) ?? raw)
        .trim()
        .replaceAll(RegExp(r'[.,竊뚳옙?占?占?\]}]+$'), '');

    if (value.isEmpty) continue;

    final hasScheme =
        value.startsWith('http://') || value.startsWith('https://');
    final looksLikePlainDomain =
        !value.contains(RegExp(r'\s')) && value.contains('.') && !hasScheme;
    final normalized = value.startsWith('www.') || looksLikePlainDomain
        ? 'https://$value'
        : value;
    final uri = Uri.tryParse(normalized);

    if (uri != null &&
        uri.hasScheme &&
        (uri.scheme == 'http' || uri.scheme == 'https')) {
      return uri;
    }
  }

  return null;
}

Future<void> saveAlertHistoryItemToPrefs(AlertHistoryItem item) async {
  final prefs = await SharedPreferences.getInstance();
  final savedItems = prefs.getStringList('alertHistory') ?? [];
  final savedHistory = savedItems.map(AlertHistoryItem.fromJson).where(
        (savedItem) =>
            !isAnnouncementAlertType(item.type) ||
            !isAnnouncementAlertType(savedItem.type),
      );
  final nextItems = sortAlertHistoryItems([
    item,
    ...savedHistory,
  ]);
  final nextUnread = (prefs.getInt(_unreadAlertCountKey) ?? 0) + 1;

  await prefs.setStringList(
    'alertHistory',
    nextItems.map((item) => jsonEncode(item.toJson())).toList(),
  );
  await prefs.setInt(_unreadAlertCountKey, nextUnread);
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  ui.DartPluginRegistrant.ensureInitialized();
  await Firebase.initializeApp();
  await initializeLocalNotifications();
  if (!await remoteAlertFreshForInstall(message)) return;

  final item = await alertItemFromRemoteMessageLocalized(message);
  if (!await alertTypeEnabledFromPrefs(item.type)) return;

  final shown = await showLocalAlertNotification(
    item.message,
    detail: item.detail,
    link: item.link,
    type: item.type,
    eventKey: remoteAlertDeliveryKey(message, item),
  );
  if (!shown) return;

  await saveAlertHistoryItemToPrefs(item);
}

Future<void> initializeLocalNotifications() async {
  if (kIsWeb) return;

  const androidSettings = AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );
  const initSettings = InitializationSettings(
    android: androidSettings,
  );

  await _localNotifications.initialize(
    initSettings,
    onDidReceiveNotificationResponse: (response) {
      final payload = response.payload;
      if (payload == null || payload.isEmpty) return;

      try {
        final item = AlertHistoryItem.fromJson(payload);
        appNavigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) => AlertDetailPage(item: item),
          ),
        );
      } catch (_) {}
    },
  );

  final androidPlugin =
      _localNotifications.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

  await androidPlugin?.createNotificationChannel(_qldAlertChannel);
  await androidPlugin?.requestNotificationsPermission();
}

Future<void> requestLocalNotificationPermission() async {
  if (kIsWeb) return;

  final androidPlugin =
      _localNotifications.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

  await androidPlugin?.requestNotificationsPermission();
}

Future<void> openAndroidAppNotificationSettings() async {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) return;

  try {
    await _appSettingsChannel.invokeMethod('openNotificationSettings');
  } catch (_) {
    await _appSettingsChannel.invokeMethod('openAppSettings');
  }
}

Future<void> requestAndroidPinnedShortcutOnce() async {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) return;

  final prefs = await SharedPreferences.getInstance();
  const key = 'androidPinnedShortcutPromptShown';
  if (prefs.getBool(key) == true) return;

  await prefs.setBool(key, true);
  try {
    await _appSettingsChannel.invokeMethod('requestPinShortcut');
  } catch (_) {
    // Some launchers do not support pinned shortcut requests.
  }
}

int stableNotificationId(String value) {
  var hash = 0x811c9dc5;
  for (final unit in value.codeUnits) {
    hash ^= unit;
    hash = (hash * 0x01000193) & 0x7fffffff;
  }
  return hash == 0 ? 1 : hash;
}

String? remoteAlertDeliveryKey(RemoteMessage message, AlertHistoryItem item) {
  final alertTag = message.data['alertTag']?.toString().trim() ?? '';
  if (alertTag.isNotEmpty) return alertTag;

  final nyDate = message.data['nyDate']?.toString().trim() ?? '';
  if (nyDate.isNotEmpty) return '${item.type}:$nyDate';

  return null;
}

String? localAlertDeliveryKey(String type, String? eventKey) {
  final key = eventKey?.trim() ?? '';
  if (key.isNotEmpty) return key;

  return null;
}

Future<bool> reserveAlertDelivery(String? key) async {
  final normalizedKey = key?.trim() ?? '';
  if (normalizedKey.isEmpty) return true;

  final prefs = await SharedPreferences.getInstance();
  final prefsKey = 'deliveredAlert:$normalizedKey';
  if (prefs.getBool(prefsKey) == true) return false;

  await prefs.setBool(prefsKey, true);
  return true;
}

Future<void> showPushNotification(RemoteMessage message) async {
  if (kIsWeb) return;

  final item = await alertItemFromRemoteMessageLocalized(message);

  if (!await alertTypeEnabledFromPrefs(item.type)) {
    return;
  }

  final deliveryKey = remoteAlertDeliveryKey(message, item);
  if (!await reserveAlertDelivery(deliveryKey)) return;

  final notificationKey = deliveryKey ?? '${item.type}:${item.message}';

  await _localNotifications.show(
    stableNotificationId(notificationKey),
    item.message,
    item.detail,
    NotificationDetails(
      android: AndroidNotificationDetails(
        _qldAlertChannel.id,
        _qldAlertChannel.name,
        channelDescription: _qldAlertChannel.description,
        importance: Importance.high,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
    ),
    payload: jsonEncode(item.toJson()),
  );
}

Future<bool> showLocalAlertNotification(
  String message, {
  String detail = '',
  String link = '',
  String type = 'info',
  String? eventKey,
}) async {
  if (kIsWeb) return false;
  if (!await alertTypeEnabledFromPrefs(type)) return false;
  if (!await reserveAlertDelivery(localAlertDeliveryKey(type, eventKey))) {
    return false;
  }

  final payload = jsonEncode(
    AlertHistoryItem(
      message: message,
      detail: detail,
      link: link,
      type: type,
      createdAt: DateTime.now(),
    ).toJson(),
  );

  await _localNotifications.show(
    stableNotificationId(eventKey ?? '$type:$message'),
    'QLD Alert',
    message,
    NotificationDetails(
      android: AndroidNotificationDetails(
        _qldAlertChannel.id,
        _qldAlertChannel.name,
        channelDescription: _qldAlertChannel.description,
        importance: Importance.high,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
    ),
    payload: payload,
  );
  return true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (canRequestAds) {
    await MobileAds.instance.initialize();
    BottomBannerAdCache.instance.preload();
  }

  if (!kIsWeb) {
    await Firebase.initializeApp();
    await ensureAnonymousUserIdentity();
    final isFreshInstall = !await remoteAlertInstallSeenAtExists();
    await ensureRemoteAlertInstallSeenAt();
    FirebaseMessaging.onBackgroundMessage(
      firebaseMessagingBackgroundHandler,
    );
    await initializeLocalNotifications();
    await clearStaleNotificationsOnFreshInstall(isFreshInstall);
  }

  runApp(QLDAlertApp(key: _qldAlertAppKey));
}

class QLDAlertApp extends StatefulWidget {
  const QLDAlertApp({super.key});

  @override
  State<QLDAlertApp> createState() => _QLDAlertAppState();
}

class _QLDAlertAppState extends State<QLDAlertApp> {
  Locale _locale = const Locale('en');
  bool _isWhiteMode = true;

  Locale _localeFromCode(String code) {
    final parts = code.split('_');

    if (parts.length >= 2) {
      return Locale(parts[0], parts[1]);
    }

    return Locale(code);
  }

  @override
  void initState() {
    super.initState();
    loadSavedLanguage();
    loadSavedWhiteMode();
  }

  Future<void> loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    final savedLanguage = prefs.getString('selectedLanguage') ?? 'en';

    if (!mounted) return;

    setState(() {
      _locale = _localeFromCode(savedLanguage);
    });
    unawaited(syncAlertLanguageTopicSafely(savedLanguage));
  }

  Future<void> changeLanguage(String code) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'selectedLanguage',
      code,
    );

    if (!mounted) return;

    setState(() {
      _locale = _localeFromCode(code);
    });
    await syncAlertLanguageTopicSafely(code);
  }

  Future<void> loadSavedWhiteMode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedWhiteMode = prefs.getBool('whiteMode') ?? true;

    if (!mounted) return;

    setState(() {
      _isWhiteMode = savedWhiteMode;
    });
    whiteModeNotifier.value = savedWhiteMode;
  }

  Future<void> changeWhiteMode(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('whiteMode', enabled);

    if (!mounted) return;

    setState(() {
      _isWhiteMode = enabled;
    });
    whiteModeNotifier.value = enabled;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        final app = MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child ?? const SizedBox.shrink(),
        );
        final styledApp = AnnotatedRegion<SystemUiOverlayStyle>(
          value: _isWhiteMode
              ? SystemUiOverlayStyle.dark.copyWith(
                  statusBarColor: const Color(0xFFF7FAFC),
                  systemNavigationBarColor: Colors.white,
                )
              : SystemUiOverlayStyle.light.copyWith(
                  statusBarColor: Colors.transparent,
                  systemNavigationBarColor: const Color(0xFF0D1117),
                ),
          child: app,
        );

        return WhiteModeScope(
          notifier: whiteModeNotifier,
          child: styledApp,
        );
      },
      theme: (_isWhiteMode ? ThemeData.light() : ThemeData.dark()).copyWith(
        scaffoldBackgroundColor:
            _isWhiteMode ? const Color(0xFFF7FAFC) : const Color(0xFF0D1117),
      ),
      navigatorKey: appNavigatorKey,
      home: HomePage(
        onLanguageChanged: changeLanguage,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final Function(String) onLanguageChanged;

  const HomePage({
    super.key,
    required this.onLanguageChanged,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

enum _UsMarketSession { pre, regular, afterHours, closed }

class _UsMarketCalendar {
  const _UsMarketCalendar({
    required this.closedDates,
    required this.earlyCloseDates,
  });

  final Set<String> closedDates;
  final Set<String> earlyCloseDates;
}

class AlertHistoryItem {
  const AlertHistoryItem({
    required this.message,
    this.detail = '',
    this.link = '',
    required this.type,
    required this.createdAt,
  });

  final String message;
  final String detail;
  final String link;
  final String type;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => {
        'message': message,
        'detail': detail,
        'link': link,
        'type': type,
        'createdAt': createdAt.toIso8601String(),
      };

  static AlertHistoryItem fromJson(String source) {
    final data = jsonDecode(source) as Map<String, dynamic>;

    return AlertHistoryItem(
      message: data['message'] as String? ?? '',
      detail: data['detail'] as String? ?? '',
      link: data['link'] as String? ?? '',
      type: data['type'] as String? ?? 'info',
      createdAt: DateTime.tryParse(data['createdAt'] as String? ?? '') ??
          DateTime.now(),
    );
  }
}

class AppUpdateInfo {
  const AppUpdateInfo({
    required this.latestVersionCode,
    required this.title,
    required this.message,
    required this.updateUrl,
    this.forceUpdate = false,
  });

  final int latestVersionCode;
  final String title;
  final String message;
  final String updateUrl;
  final bool forceUpdate;
}

class LatestAnnouncementInfo {
  const LatestAnnouncementInfo({
    required this.id,
    required this.item,
  });

  final String id;
  final AlertHistoryItem item;
}

Future<AppUpdateInfo?> fetchAppUpdateInfo() async {
  try {
    final response = await http
        .get(Uri.parse(_appConfigUrl))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode != 200) return null;

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final latestVersionCode = int.tryParse(
          '${data['latestVersionCode'] ?? data['androidVersionCode'] ?? ''}',
        ) ??
        0;

    if (latestVersionCode <= _currentAppVersionCode) return null;

    final languageCode = await savedLanguageCode();
    final fallbackTitle = data['title']?.toString() ?? '';
    final fallbackMessage = data['message']?.toString() ?? '';
    final updateUrl = data['updateUrl']?.toString().trim();

    return AppUpdateInfo(
      latestVersionCode: latestVersionCode,
      title: localizedRemoteValue(
        data,
        'title',
        languageCode,
        fallbackTitle,
      ),
      message: localizedRemoteValue(
        data,
        'message',
        languageCode,
        fallbackMessage,
      ),
      updateUrl: updateUrl == null || updateUrl.isEmpty
          ? 'market://details?id=$_androidPackageName'
          : updateUrl,
      forceUpdate: data['forceUpdate'] == true ||
          data['forceUpdate']?.toString().toLowerCase() == 'true',
    );
  } catch (_) {
    return null;
  }
}

Future<LatestAnnouncementInfo?> fetchLatestAnnouncementInfo() async {
  try {
    final response = await http
        .get(Uri.parse(_appConfigUrl))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode != 200) return null;

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final rawAnnouncement = data['announcement'] ??
        data['latestAnnouncement'] ??
        data['notice'] ??
        data['latestNotice'];
    final hasTopLevelAnnouncementFields =
        data.containsKey('announcementTitle') ||
            data.containsKey('announcementMessage') ||
            data.containsKey('noticeTitle') ||
            data.containsKey('noticeMessage');

    if (rawAnnouncement == null && !hasTopLevelAnnouncementFields) {
      return null;
    }

    final source = rawAnnouncement is Map
        ? Map<String, dynamic>.from(rawAnnouncement)
        : data;
    final enabledValue = source['enabled'] ??
        source['announcementEnabled'] ??
        source['noticeEnabled'];

    if (enabledValue == false ||
        enabledValue?.toString().toLowerCase() == 'false') {
      return null;
    }

    final languageCode = await savedLanguageCode();
    final fallbackTitle = source['title']?.toString() ??
        source['noticeTitle']?.toString() ??
        source['announcementTitle']?.toString() ??
        '';
    final fallbackDetail = source['detail']?.toString() ??
        source['body']?.toString() ??
        source['content']?.toString() ??
        source['message']?.toString() ??
        source['noticeMessage']?.toString() ??
        source['announcementMessage']?.toString() ??
        '';
    final title = [
      localizedRemoteValue(source, 'title', languageCode, ''),
      localizedRemoteValue(source, 'announcementTitle', languageCode, ''),
      localizedRemoteValue(source, 'noticeTitle', languageCode, ''),
      fallbackTitle,
    ].map((value) => value.trim()).firstWhere(
          (value) => value.isNotEmpty,
          orElse: () => '',
        );
    final detail = [
      localizedRemoteValue(source, 'message', languageCode, ''),
      localizedRemoteValue(source, 'detail', languageCode, ''),
      localizedRemoteValue(source, 'body', languageCode, ''),
      localizedRemoteValue(source, 'content', languageCode, ''),
      localizedRemoteValue(source, 'announcementMessage', languageCode, ''),
      localizedRemoteValue(source, 'noticeMessage', languageCode, ''),
      fallbackDetail,
    ].map((value) => value.trim()).firstWhere(
          (value) => value.isNotEmpty,
          orElse: () => '',
        );
    final link = (source['link'] ??
            source['url'] ??
            source['noticeUrl'] ??
            source['announcementUrl'] ??
            '')
        .toString()
        .trim();
    final message = title.isNotEmpty ? title : detail;

    if (message.isEmpty) return null;

    final rawId = (source['id'] ??
            source['noticeId'] ??
            source['announcementId'] ??
            source['version'] ??
            source['updatedAt'] ??
            '')
        .toString()
        .trim();
    final id = rawId.isNotEmpty
        ? rawId
        : base64Url.encode(utf8.encode('$message|$detail|$link'));

    return LatestAnnouncementInfo(
      id: id,
      item: AlertHistoryItem(
        message: message,
        detail: detail,
        link: link,
        type: _announcementAlertType,
        createdAt: DateTime.now(),
      ),
    );
  } catch (_) {
    return null;
  }
}

class FearGreedData {
  const FearGreedData({
    required this.score,
    required this.rating,
    this.updatedAt,
  });

  final double score;
  final String rating;
  final DateTime? updatedAt;
}

const _fearGreedCacheKey = 'fearGreedDataCache';

Future<void> saveCachedFearGreedData(FearGreedData data) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(
    _fearGreedCacheKey,
    jsonEncode({
      'score': data.score,
      'rating': data.rating,
      'updatedAt': data.updatedAt?.toIso8601String(),
    }),
  );
}

Future<FearGreedData?> loadCachedFearGreedData() async {
  final prefs = await SharedPreferences.getInstance();
  final source = prefs.getString(_fearGreedCacheKey);
  if (source == null || source.isEmpty) return null;

  try {
    final data = jsonDecode(source) as Map<String, dynamic>;
    final score = double.tryParse('${data['score']}');
    if (score == null) return null;

    return FearGreedData(
      score: score,
      rating: '${data['rating'] ?? fearGreedRatingForScore(score)}',
      updatedAt: DateTime.tryParse('${data['updatedAt'] ?? ''}'),
    );
  } catch (_) {
    return null;
  }
}

const _fearGreedZoneBounds = [0.0, 25.0, 45.0, 55.0, 75.0, 100.0];

int fearGreedSegmentForScore(double score) {
  if (score <= 25) return 0;
  if (score <= 45) return 1;
  if (score <= 55) return 2;
  if (score <= 75) return 3;
  return 4;
}

String fearGreedRatingForScore(double score) {
  if (score <= 25) return 'Extreme Fear';
  if (score <= 45) return 'Fear';
  if (score <= 55) return 'Neutral';
  if (score <= 75) return 'Greed';
  return 'Extreme Greed';
}

double? findFearGreedScore(dynamic value) {
  if (value is Map) {
    if (value.containsKey('score')) {
      return double.tryParse('${value['score']}');
    }

    for (final child in value.values) {
      final found = findFearGreedScore(child);
      if (found != null) return found;
    }
  }

  if (value is List) {
    for (final child in value) {
      final found = findFearGreedScore(child);
      if (found != null) return found;
    }
  }

  return null;
}

FearGreedData parseFearGreedData(Map<String, dynamic> json) {
  final now = json['fear_and_greed'];

  if (now is Map<String, dynamic>) {
    final score = double.tryParse('${now['score']}') ?? 0;
    final rating = '${now['rating'] ?? fearGreedRatingForScore(score)}';
    final timestamp = int.tryParse('${now['timestamp'] ?? ''}');

    return FearGreedData(
      score: score,
      rating: rating,
      updatedAt: timestamp == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(
              timestamp < 10000000000 ? timestamp * 1000 : timestamp,
            ),
    );
  }

  final score = findFearGreedScore(json) ?? 0;

  return FearGreedData(
    score: score,
    rating: fearGreedRatingForScore(score),
  );
}

List<String> splitCsvLine(String line) {
  final cells = <String>[];
  final buffer = StringBuffer();
  var inQuotes = false;

  for (var i = 0; i < line.length; i++) {
    final char = line[i];

    if (char == '"') {
      final isEscapedQuote =
          inQuotes && i + 1 < line.length && line[i + 1] == '"';
      if (isEscapedQuote) {
        buffer.write('"');
        i++;
      } else {
        inQuotes = !inQuotes;
      }
      continue;
    }

    if (char == ',' && !inQuotes) {
      cells.add(buffer.toString().trim());
      buffer.clear();
      continue;
    }

    buffer.write(char);
  }

  cells.add(buffer.toString().trim());
  return cells;
}

FearGreedData parseFearGreedCsv(String source) {
  final lines = const LineSplitter()
      .convert(source)
      .map((line) => line.trim())
      .where((line) => line.isNotEmpty)
      .toList();

  if (lines.length < 2) {
    throw const FormatException('Fear & Greed CSV is empty');
  }

  final headers = splitCsvLine(lines.first)
      .map((cell) => cell.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), ''))
      .toList();
  final dateIndex = headers.indexWhere((header) => header == 'date');
  final scoreIndex = headers.indexWhere(
    (header) =>
        header == 'score' ||
        header == 'feargreed' ||
        header == 'fearandgreed' ||
        header == 'feargreedscore',
  );
  final ratingIndex = headers.indexWhere(
    (header) => header == 'rating' || header == 'classification',
  );

  if (scoreIndex < 0) {
    throw const FormatException('Fear & Greed score column not found');
  }

  for (final line in lines.skip(1).toList().reversed) {
    final cells = splitCsvLine(line);
    if (scoreIndex >= cells.length) continue;

    final score = double.tryParse(cells[scoreIndex]);
    if (score == null) continue;

    final rating = ratingIndex >= 0 && ratingIndex < cells.length
        ? cells[ratingIndex]
        : '';
    final date = dateIndex >= 0 && dateIndex < cells.length
        ? DateTime.tryParse(cells[dateIndex])
        : null;

    return FearGreedData(
      score: score,
      rating: rating.isEmpty ? fearGreedRatingForScore(score) : rating,
      updatedAt: date,
    );
  }

  throw const FormatException('Fear & Greed CSV has no score');
}

Color fearGreedColorForScore(double score) {
  if (score <= 25) return Colors.redAccent;
  if (score <= 45) return Colors.orangeAccent;
  if (score < 55) return Colors.amberAccent;
  if (score < 75) return Colors.lightGreenAccent;
  return _cyan;
}

Future<FearGreedData> fetchFearGreedData() async {
  final response = await http
      .get(Uri.parse(_fearGreedProxyUrl))
      .timeout(const Duration(seconds: 8));

  if (response.statusCode != 200 || response.body.trim().isEmpty) {
    throw Exception('Fear & Greed proxy returned ${response.statusCode}');
  }

  return parseFearGreedData(
    jsonDecode(response.body) as Map<String, dynamic>,
  );
}

const _appBg = Color(0xFF07111D);
const _cardBg = Color(0xF20E1A29);
const _cardLine = Color(0xFF26364A);
const _darkSurface = Color(0xF2111D2D);
const _darkSurfaceSoft = Color(0xFF0D1826);
const _darkLineSoft = Color(0xFF203044);
const _darkText = Color(0xFFF8FAFC);
const _darkMuted = Color(0xFF94A3B8);
const _darkFaint = Color(0xFF64748B);
const _cyan = Color(0xFF34DDB8);
const _blue = Color(0xFF48A8FF);
const _purple = Color(0xFF7650F4);
const _commentGreen = Color(0xFF4ADE80);
const _portfolioGainGreen = Color(0xFF059669);
const _portfolioLossRed = Colors.redAccent;
const _coreAlertProductId = 'core_alert';
const _storedTenYearHighKey = 'storedTenYearHigh';
ScrollController? _activeHomeScrollController;

class WhiteModeScope extends InheritedNotifier<ValueNotifier<bool>> {
  const WhiteModeScope({
    super.key,
    required ValueNotifier<bool> notifier,
    required super.child,
  }) : super(notifier: notifier);

  static bool? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<WhiteModeScope>()
        ?.notifier
        ?.value;
  }
}

bool isWhiteModeEnabled(BuildContext context) =>
    WhiteModeScope.maybeOf(context) ?? whiteModeNotifier.value;

const _lightAppBg = Color(0xFFF7FAFC);
const _lightSurface = Color(0xFFFFFFFF);
const _lightLine = Color(0xFFE2E8F0);
const _lightText = Color(0xFF0F172A);
const _lightMuted = Color(0xFF64748B);
const _lightBlue = Color(0xFF2563EB);
const _lightCyan = Color(0xFF0891B2);

enum NavTab {
  chart,
  exchange,
  fearGreed,
  alert,
  strategy,
}

const _unreadAlertCountKey = 'unreadAlertCount';
final ValueNotifier<int> alertBadgeCount = ValueNotifier<int>(0);

Future<void> loadAlertBadgeCount() async {
  final prefs = await SharedPreferences.getInstance();
  alertBadgeCount.value = prefs.getInt(_unreadAlertCountKey) ?? 0;
}

Future<void> incrementAlertBadgeCount() async {
  final prefs = await SharedPreferences.getInstance();
  final nextCount = (prefs.getInt(_unreadAlertCountKey) ?? 0) + 1;

  await prefs.setInt(_unreadAlertCountKey, nextCount);
  alertBadgeCount.value = nextCount;
}

Future<void> clearAlertBadgeCount() async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setInt(_unreadAlertCountKey, 0);
  alertBadgeCount.value = 0;
}

Widget buildLanguageMenuButton(
  BuildContext context, {
  double iconSize = 22,
}) {
  final whiteMode = isWhiteModeEnabled(context);

  return PopupMenuButton<String>(
    padding: EdgeInsets.zero,
    icon: Icon(
      Icons.language,
      color: whiteMode ? _lightText : Colors.white,
      size: iconSize,
    ),
    onSelected: (value) {
      context
          .findAncestorStateOfType<_QLDAlertAppState>()
          ?.changeLanguage(value);
    },
    itemBuilder: (context) => const [
      PopupMenuItem(
        value: 'en',
        child: Text('English'),
      ),
      PopupMenuItem(
        value: 'ko',
        child: Text('한국어'),
      ),
      PopupMenuItem(
        value: 'ja',
        child: Text('日本語'),
      ),
      PopupMenuItem(
        value: 'es',
        child: Text('Español'),
      ),
      PopupMenuItem(
        value: 'pt',
        child: Text('Português'),
      ),
      PopupMenuItem(
        value: 'ru',
        child: Text('Русский'),
      ),
      PopupMenuItem(
        value: 'zh',
        child: Text('简体中文'),
      ),
      PopupMenuItem(
        value: 'zh_TW',
        child: Text('繁體中文'),
      ),
      PopupMenuItem(
        value: 'fr',
        child: Text('Français'),
      ),
      PopupMenuItem(
        value: 'de',
        child: Text('Deutsch'),
      ),
    ],
  );
}

Widget buildWhiteModeButton(
  BuildContext context, {
  double iconSize = 22,
}) {
  final isWhiteMode = isWhiteModeEnabled(context);

  return IconButton(
    visualDensity: VisualDensity.compact,
    tooltip: isWhiteMode ? 'Dark mode' : 'White mode',
    icon: Icon(
      isWhiteMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
      color: isWhiteMode ? _lightText : Colors.white,
      size: iconSize,
    ),
    onPressed: () {
      _qldAlertAppKey.currentState?.changeWhiteMode(!isWhiteMode);
    },
  );
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  double qldPrice = 0;
  double tqqqPrice = 0;
  double qldPreviousClose = 0;
  double futuresPrice = 0;
  double futuresPreviousClose = 0;
  double futuresBaselinePrice = 0;
  String futuresBaselineDate = '';
  double vixPrice = 0;
  double tenYearYield = 0;
  double basePrice = 0;
  double allTimeHigh = 0;
  String lastHighAlertDate = '';
  String fcmToken = '';

  double qldShares = 0;
  double tqqqShares = 0;
  double cashAmount = 0;
  double qldAveragePrice = 0;
  double tqqqAveragePrice = 0;

  final qldController = TextEditingController();
  final tqqqController = TextEditingController();
  final cashController = TextEditingController();
  final qldAverageController = TextEditingController();
  final tqqqAverageController = TextEditingController();
  final lumpSumInvestmentController = TextEditingController();
  final lumpSumYearsController = TextEditingController();
  final monthlyInvestmentController = TextEditingController();
  final monthlyInvestmentYearsController = TextEditingController();
  final returnRateController = TextEditingController();
  final closeGuessIdController = TextEditingController();
  final closeGuessPriceController = TextEditingController();
  final closeGuessMessageController = TextEditingController();
  final homeScrollController = ScrollController();

  bool showPortfolioInput = false;
  bool showCloseGuessInput = false;
  String investmentCalculatorCurrency = 'KRW';
  List<CloseGuessEntry> closeGuessEntries = [];
  List<String> closeGuessDates = [];
  CloseGuessWinnerMessage? closeGuessWinnerMessage;
  String closeGuessSelectedDate = '';
  String closeGuessLastSubmittedId = '';
  String closeGuessWinnerMessageToken = '';
  bool closeGuessLoading = false;

  String latestDate = '';
  String highDate = '';

  bool isLoading = true;
  bool isRefreshingPrice = false;
  bool isUsingCachedPrice = false;
  int priceRefreshCountdownSeconds = _priceRefreshIntervalSeconds;

  bool isPreMarket = false;
  bool isRegularMarket = false;
  bool isAfterHours = false;
  bool isPriceUp = true;
  List<AlertHistoryItem> alertHistory = [];
  List<QldMiniCandle> qldMiniCandles = [];
  FearGreedData? homeFearGreedData;

  late AnimationController _blinkController;
  late Animation<double> _blinkAnimation;

  Timer? priceTimer;
  Timer? priceRefreshCountdownTimer;
  Timer? yahooHistoryTimer;
  Timer? nasdaq200Timer;
  Timer? fearGreedTimer;
  Timer? quoteStreamReconnectTimer;
  WebSocketChannel? quoteStreamChannel;
  StreamSubscription<dynamic>? quoteStreamSubscription;
  StreamSubscription<List<PurchaseDetails>>? coreAlertPurchaseSubscription;
  ProductDetails? coreAlertProduct;
  final ValueNotifier<int> coreAlertPurchaseRevision = ValueNotifier<int>(0);
  DateTime? lastHighDateRefreshAt;
  DateTime? lastHistoricalReferenceRefreshAt;
  final Map<int, _UsMarketCalendar> _usMarketCalendarCache = {};

  bool _isNewYorkDst(DateTime utcNow) {
    final year = utcNow.year;
    final dstStartDay = _nthWeekdayOfMonthUtc(
      year,
      3,
      DateTime.sunday,
      2,
    );
    final dstEndDay = _nthWeekdayOfMonthUtc(
      year,
      11,
      DateTime.sunday,
      1,
    );

    final dstStartUtc = DateTime.utc(year, 3, dstStartDay, 7);
    final dstEndUtc = DateTime.utc(year, 11, dstEndDay, 6);

    return !utcNow.isBefore(dstStartUtc) && utcNow.isBefore(dstEndUtc);
  }

  int _newYorkUtcOffsetHours(DateTime utcNow) =>
      _isNewYorkDst(utcNow) ? -4 : -5;

  DateTime _toNewYorkTime(DateTime utcNow) =>
      utcNow.add(Duration(hours: _newYorkUtcOffsetHours(utcNow)));

  int _nthWeekdayOfMonthUtc(
    int year,
    int month,
    int weekday,
    int n,
  ) {
    final first = DateTime.utc(year, month, 1);
    final delta = (weekday - first.weekday + 7) % 7;
    return 1 + delta + (n - 1) * 7;
  }

  _UsMarketSession _usMarketSessionFromUtc(DateTime utcNow) {
    final ny = _toNewYorkTime(utcNow);
    final nyDate = ny.toString().substring(0, 10);

    final isWeekday =
        ny.weekday >= DateTime.monday && ny.weekday <= DateTime.friday;
    if (!isWeekday || _isUsMarketClosedDate(nyDate)) {
      return _UsMarketSession.closed;
    }

    final minutes = ny.hour * 60 + ny.minute;

    const preStart = 4 * 60;
    const regularStart = 9 * 60 + 30;
    final regularEnd = _usMarketCloseMinute(ny);
    const afterHoursEnd = 20 * 60;

    if (minutes >= preStart && minutes < regularStart) {
      return _UsMarketSession.pre;
    }

    if (minutes >= regularStart && minutes < regularEnd) {
      return _UsMarketSession.regular;
    }

    if (minutes >= regularEnd && minutes < afterHoursEnd) {
      return _UsMarketSession.afterHours;
    }

    return _UsMarketSession.closed;
  }

  bool _isUsMarketClosedDate(String nyDate) {
    final year = int.tryParse(nyDate.substring(0, 4));
    if (year == null) return false;

    return _usMarketCalendar(year).closedDates.contains(nyDate);
  }

  int _usMarketCloseMinute(DateTime ny) {
    final nyDate = ny.toString().substring(0, 10);
    return _usMarketCalendar(ny.year).earlyCloseDates.contains(nyDate)
        ? 13 * 60
        : 16 * 60;
  }

  _UsMarketCalendar _usMarketCalendar(int year) {
    final cached = _usMarketCalendarCache[year];
    if (cached != null) return cached;

    final closedDates = <String>{};
    final earlyCloseDates = <String>{};

    _addObservedFixedHoliday(
      closedDates,
      year,
      1,
      1,
      skipSaturdayObserved: true,
    );
    closedDates.add(
      _dateString(year, 1, _nthWeekdayOfMonthUtc(year, 1, DateTime.monday, 3)),
    );
    closedDates.add(
      _dateString(year, 2, _nthWeekdayOfMonthUtc(year, 2, DateTime.monday, 3)),
    );

    final easter = _easterSunday(year);
    final goodFriday = easter.subtract(const Duration(days: 2));
    closedDates.add(
      _dateString(goodFriday.year, goodFriday.month, goodFriday.day),
    );

    closedDates.add(
      _dateString(
        year,
        5,
        _lastWeekdayOfMonthUtc(year, 5, DateTime.monday),
      ),
    );
    _addObservedFixedHoliday(closedDates, year, 6, 19);
    _addObservedFixedHoliday(closedDates, year, 7, 4);
    closedDates.add(
      _dateString(year, 9, _nthWeekdayOfMonthUtc(year, 9, DateTime.monday, 1)),
    );
    closedDates.add(
      _dateString(
        year,
        11,
        _nthWeekdayOfMonthUtc(year, 11, DateTime.thursday, 4),
      ),
    );
    _addObservedFixedHoliday(closedDates, year, 12, 25);

    final thanksgivingDay =
        _nthWeekdayOfMonthUtc(year, 11, DateTime.thursday, 4);
    final dayAfterThanksgiving =
        DateTime.utc(year, 11, thanksgivingDay).add(const Duration(days: 1));
    earlyCloseDates.add(
      _dateString(
        dayAfterThanksgiving.year,
        dayAfterThanksgiving.month,
        dayAfterThanksgiving.day,
      ),
    );

    earlyCloseDates.add(_previousTradingDate(year, 7, 4, closedDates));

    final christmasEve = DateTime.utc(year, 12, 24);
    final christmasEveString =
        _dateString(christmasEve.year, christmasEve.month, christmasEve.day);
    if (christmasEve.weekday >= DateTime.monday &&
        christmasEve.weekday <= DateTime.friday &&
        !closedDates.contains(christmasEveString)) {
      earlyCloseDates.add(christmasEveString);
    }

    final calendar = _UsMarketCalendar(
      closedDates: closedDates,
      earlyCloseDates: earlyCloseDates,
    );
    _usMarketCalendarCache[year] = calendar;
    return calendar;
  }

  String _dateString(int year, int month, int day) =>
      "$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";

  int _kstFuturesStartHour(DateTime utcNow) => _isNewYorkDst(utcNow) ? 7 : 8;

  String _kstFuturesBaselineDate([DateTime? now]) {
    final utcNow = (now ?? DateTime.now().toUtc()).toUtc();
    final startHour = _kstFuturesStartHour(utcNow);
    final kst = utcNow.add(
      const Duration(hours: 9),
    );
    final baselineDay =
        kst.hour >= startHour ? kst : kst.subtract(const Duration(days: 1));
    return _dateString(
      baselineDay.year,
      baselineDay.month,
      baselineDay.day,
    );
  }

  bool _isAfterKstFuturesStart(DateTime utcNow) {
    final startHour = _kstFuturesStartHour(utcNow);
    final kst = utcNow.toUtc().add(const Duration(hours: 9));
    return kst.hour >= startHour;
  }

  bool _isUsMarketOpenDayForFuturesFromUtc(DateTime utcNow) {
    final baselineDate = _kstFuturesBaselineDate(utcNow);
    final parts = baselineDate.split('-').map(int.parse).toList();
    final day = DateTime.utc(parts[0], parts[1], parts[2]);
    final isWeekday =
        day.weekday >= DateTime.monday && day.weekday <= DateTime.friday;
    return isWeekday && !_isUsMarketClosedDate(baselineDate);
  }

  bool _isUsTechFuturesSessionFromUtc(DateTime utcNow) {
    final ny = _toNewYorkTime(utcNow.toUtc());
    final minutes = ny.hour * 60 + ny.minute;
    const futuresOpen = 18 * 60;
    const dailyHaltStart = 17 * 60;

    if (ny.weekday == DateTime.saturday) return false;
    if (ny.weekday == DateTime.sunday) return minutes >= futuresOpen;
    if (ny.weekday == DateTime.friday) return minutes < dailyHaltStart;
    if (minutes >= dailyHaltStart && minutes < futuresOpen) return false;
    return true;
  }

  int _lastWeekdayOfMonthUtc(int year, int month, int weekday) {
    final last = DateTime.utc(year, month + 1, 0);
    final delta = (last.weekday - weekday + 7) % 7;
    return last.day - delta;
  }

  DateTime _easterSunday(int year) {
    final a = year % 19;
    final b = year ~/ 100;
    final c = year % 100;
    final d = b ~/ 4;
    final e = b % 4;
    final f = (b + 8) ~/ 25;
    final g = (b - f + 1) ~/ 3;
    final h = (19 * a + b - d - g + 15) % 30;
    final i = c ~/ 4;
    final k = c % 4;
    final l = (32 + 2 * e + 2 * i - h - k) % 7;
    final m = (a + 11 * h + 22 * l) ~/ 451;
    final month = (h + l - 7 * m + 114) ~/ 31;
    final day = ((h + l - 7 * m + 114) % 31) + 1;

    return DateTime.utc(year, month, day);
  }

  void _addObservedFixedHoliday(
    Set<String> dates,
    int year,
    int month,
    int day, {
    bool skipSaturdayObserved = false,
  }) {
    final date = DateTime.utc(year, month, day);

    if (date.weekday == DateTime.sunday) {
      final observed = date.add(const Duration(days: 1));
      dates.add(_dateString(observed.year, observed.month, observed.day));
      return;
    }

    if (date.weekday == DateTime.saturday) {
      if (skipSaturdayObserved) return;

      final observed = date.subtract(const Duration(days: 1));
      dates.add(_dateString(observed.year, observed.month, observed.day));
      return;
    }

    dates.add(_dateString(year, month, day));
  }

  String _previousTradingDate(
    int year,
    int month,
    int day,
    Set<String> closedDates,
  ) {
    var current =
        DateTime.utc(year, month, day).subtract(const Duration(days: 1));

    while (current.weekday == DateTime.saturday ||
        current.weekday == DateTime.sunday ||
        closedDates.contains(
          _dateString(current.year, current.month, current.day),
        )) {
      current = current.subtract(const Duration(days: 1));
    }

    return _dateString(current.year, current.month, current.day);
  }

  bool touchedMinus20 = false;
  bool touchedMinus30 = false;
  bool touchedMinus40 = false;
  bool touchedMinus50 = false;
  int activeDropZone = 0;
  bool dropAlertInitialized = false;
  final strategyProgressStore = const StrategyProgressStore();
  late final Future<void> strategyProgressReady;
  String lastMarketOpenAlertDate = '';
  bool marketOpenAlertInitialized = false;
  bool highAlertEnabled = true;
  bool marketOpenAlertEnabled = true;
  bool strategyAlertEnabled = true;
  bool coreAlertEnabled = false;
  bool coreAlertPurchased = false;
  bool coreAlertStoreAvailable = false;
  bool coreAlertProductLoading = false;
  bool coreAlertPurchasePending = false;
  DateTime? coreAlertPurchaseMessageUntil;
  DateTime? coreAlertRestoreMessageUntil;
  bool nasdaq200AlertEnabled = true;
  bool portfolioCashAlertEnabled = true;
  bool qldMoveAlertEnabled = true;
  bool profitTargetAlertEnabled = true;
  bool fearGreedExtremeFearAlertEnabled = true;
  bool fearGreedExtremeGreedAlertEnabled = true;
  bool announcementAlertEnabled = true;
  bool exitDialogOpen = false;
  BannerAd? _exitDialogBannerAd;
  bool _exitDialogBannerAdLoaded = false;
  int nasdaq200State = 0;
  int portfolioCashState = 0;
  int fearGreedState = 0;
  int qldMoveCloseState = 0;
  int qldProfitTargetState = 0;
  int tqqqProfitTargetState = 0;
  bool updateDialogShown = false;
  bool quoteStreamConnected = false;
  bool isApplyingStreamQuote = false;
  int lastAppliedQuoteTimestamp = 0;
  bool showContentWidgetButton = false;
  Timer? contentWidgetHideTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _activeHomeScrollController = homeScrollController;
    homeScrollController.addListener(showContentWidgetButtonTemporarily);
    _preloadExitDialogBannerAd();
    _loadSavedMajorUsSchedules().then((_) {
      if (mounted) setState(() {});
    });

    if (!kIsWeb) {
      FirebaseMessaging.instance.setAutoInitEnabled(true);
      FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      savedLanguageCode().then(syncAlertLanguageTopicSafely);

      FirebaseMessaging.instance.getToken().then((token) {
        if (!mounted) return;
        setState(() {
          fcmToken = token ?? '';
        });
      });
      FirebaseMessaging.instance.onTokenRefresh.listen((token) {
        if (mounted) {
          setState(() {
            fcmToken = token;
          });
        }
        unawaited(restoreCoreAlertPurchase(showPending: false));
      });

      FirebaseMessaging.onMessage.listen((message) async {
        if (!await remoteAlertFreshForInstall(message)) return;
        final item = await alertItemFromRemoteMessageLocalized(message);
        showAndSaveRemoteAlert(
          item,
          eventKey: remoteAlertDeliveryKey(message, item),
        );
      });

      FirebaseMessaging.onMessageOpenedApp.listen((message) async {
        if (!await remoteAlertFreshForInstall(message)) return;
        final item = await alertItemFromRemoteMessageLocalized(message);
        if (!await alertTypeEnabledFromPrefs(item.type)) return;

        unawaited(
          addAlertHistory(
            item.message,
            item.type,
            detail: item.detail,
            link: item.link,
          ),
        );
        appNavigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) => AlertDetailPage(item: item),
          ),
        );
      });

      FirebaseMessaging.instance.getInitialMessage().then((message) async {
        final navigationAllowed = await initialRemoteMessageNavigationAllowed();
        if (message == null) return;
        if (!navigationAllowed) return;
        if (!await remoteAlertFreshForInstall(message)) return;

        final item = await alertItemFromRemoteMessageLocalized(message);
        if (!await alertTypeEnabledFromPrefs(item.type)) return;

        unawaited(
          addAlertHistory(
            item.message,
            item.type,
            detail: item.detail,
            link: item.link,
          ),
        );
        appNavigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) => AlertDetailPage(item: item),
          ),
        );
      });
    }

    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _blinkAnimation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(_blinkController);

    strategyProgressReady = loadStrategyProgress();
    loadPortfolio();
    loadInvestmentCalculator();
    loadAlertHistory();
    loadAlertBadgeCount();
    loadLastHighAlertDate();
    loadLastMarketOpenAlertDate();
    loadStoredAllTimeHigh();
    loadAlertSettings();
    loadCachedPrices();
    initCoreAlertPurchase();
    fetchHomeFearGreed();
    _fetchLatestAnnouncement();

    startQuoteStream();
    startPriceRefreshCountdown();
    unawaited(fetchCurrentPrices(force: true));
    fetchQldHistoricalReference();
    evaluateNasdaq200DayAlert();

    priceTimer = Timer.periodic(
      const Duration(seconds: _priceRefreshIntervalSeconds),
      (timer) {
        if (!quoteStreamConnected) {
          fetchCurrentPrices();
        }
      },
    );
    yahooHistoryTimer = Timer.periodic(
      const Duration(hours: 1),
      (timer) {
        refreshQldHistoricalReferenceOnSchedule();
      },
    );
    nasdaq200Timer = Timer.periodic(
      const Duration(hours: 1),
      (timer) {
        evaluateNasdaq200DayAlert();
      },
    );
    fearGreedTimer = Timer.periodic(
      const Duration(hours: 1),
      (timer) {
        fetchHomeFearGreed();
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkForAppUpdate();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed || kIsWeb) return;

    unawaited(savedLanguageCode().then(syncAlertLanguageTopicSafely));

    unawaited(restoreCoreAlertPurchase(showPending: false));
    unawaited(checkForAppUpdate());
  }

  Future<void> checkForAppUpdate() async {
    if (updateDialogShown || !mounted) return;

    final info = await fetchAppUpdateInfo();
    if (info == null || !mounted || updateDialogShown) return;

    updateDialogShown = true;
    final l10n = AppLocalizations.of(context)!;
    final updateUri = Uri.tryParse(info.updateUrl);
    final whiteMode = isWhiteModeEnabled(context);
    final dialogBg = whiteMode ? _lightSurface : const Color(0xFF151B24);
    final titleColor = whiteMode ? _lightText : Colors.white;
    final messageColor = whiteMode ? _lightMuted : Colors.white70;

    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: dialogBg,
          title: Text(
            info.title.isEmpty ? l10n.appUpdateTitle : info.title,
            style: TextStyle(
              color: titleColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            info.message.isEmpty ? l10n.appUpdateMessage : info.message,
            style: TextStyle(
              color: messageColor,
              height: 1.45,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(l10n.appUpdateLater),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _blue,
                foregroundColor: Colors.white,
              ),
              onPressed: updateUri == null
                  ? null
                  : () {
                      launchUrl(
                        updateUri,
                        mode: LaunchMode.externalApplication,
                      );
                    },
              child: Text(l10n.appUpdateNow),
            ),
          ],
        );
      },
    );
  }

  Future<void> loadPortfolio() async {
    final prefs = await SharedPreferences.getInstance();

    qldShares = prefs.getDouble('qldShares') ?? 0;
    tqqqShares = prefs.getDouble('tqqqShares') ?? 0;
    cashAmount = prefs.getDouble('cashAmount') ?? 0;
    qldAveragePrice = prefs.getDouble('qldAveragePrice') ?? 0;
    tqqqAveragePrice = prefs.getDouble('tqqqAveragePrice') ?? 0;

    qldController.text = formatShareQuantity(qldShares);
    tqqqController.text = formatShareQuantity(tqqqShares);
    cashController.text = cashAmount.toStringAsFixed(0);
    qldAverageController.text =
        qldAveragePrice > 0 ? qldAveragePrice.toStringAsFixed(2) : '0';
    tqqqAverageController.text =
        tqqqAveragePrice > 0 ? tqqqAveragePrice.toStringAsFixed(2) : '0';

    setState(() {});
  }

  Future<void> savePortfolio() async {
    final prefs = await SharedPreferences.getInstance();

    final previousQldAveragePrice = qldAveragePrice;
    final previousTqqqAveragePrice = tqqqAveragePrice;

    qldShares = double.tryParse(qldController.text) ?? 0;

    tqqqShares = double.tryParse(tqqqController.text) ?? 0;

    cashAmount = double.tryParse(cashController.text) ?? 0;
    qldAveragePrice = double.tryParse(qldAverageController.text) ?? 0;
    tqqqAveragePrice = double.tryParse(tqqqAverageController.text) ?? 0;
    final averagePriceChanged = previousQldAveragePrice != qldAveragePrice ||
        previousTqqqAveragePrice != tqqqAveragePrice;

    await prefs.setDouble(
      'qldShares',
      qldShares,
    );

    await prefs.setDouble(
      'tqqqShares',
      tqqqShares,
    );

    await prefs.setDouble(
      'cashAmount',
      cashAmount,
    );
    await prefs.setDouble(
      'qldAveragePrice',
      qldAveragePrice,
    );
    await prefs.setDouble(
      'tqqqAveragePrice',
      tqqqAveragePrice,
    );
    await prefs.setBool('portfolioCashAlertInitialized', false);
    if (averagePriceChanged) {
      await prefs.setBool('profitTargetAlertInitialized', false);
    }

    setState(() {});
    await evaluatePortfolioCashAlert();
    await evaluateProfitTargetAlert();
  }

  Future<void> loadInvestmentCalculator() async {
    final prefs = await SharedPreferences.getInstance();

    lumpSumInvestmentController.text = formatCalculatorInputNumber(
      prefs.getDouble('investmentCalculatorLumpSum') ?? 10000000,
    );
    lumpSumYearsController.text =
        (prefs.getInt('investmentCalculatorLumpSumYears') ?? 10).toString();
    monthlyInvestmentController.text = formatCalculatorInputNumber(
      prefs.getDouble('investmentCalculatorMonthly') ?? 500000,
    );
    monthlyInvestmentYearsController.text =
        (prefs.getInt('investmentCalculatorMonthlyYears') ?? 10).toString();
    final savedReturnRate = prefs.getDouble('investmentCalculatorReturnRate');
    final defaultReturnRate = savedReturnRate == null || savedReturnRate == 25
        ? 29.63
        : savedReturnRate;
    returnRateController.text = defaultReturnRate.toStringAsFixed(2);
    investmentCalculatorCurrency =
        prefs.getString('investmentCalculatorCurrency') ?? 'KRW';

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> saveInvestmentCalculator() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(
      'investmentCalculatorLumpSum',
      parseCalculatorNumber(lumpSumInvestmentController.text),
    );
    await prefs.setInt(
      'investmentCalculatorLumpSumYears',
      int.tryParse(lumpSumYearsController.text) ?? 0,
    );
    await prefs.setDouble(
      'investmentCalculatorMonthly',
      parseCalculatorNumber(monthlyInvestmentController.text),
    );
    await prefs.setInt(
      'investmentCalculatorMonthlyYears',
      int.tryParse(monthlyInvestmentYearsController.text) ?? 0,
    );
    await prefs.setDouble(
      'investmentCalculatorReturnRate',
      parseCalculatorNumber(returnRateController.text),
    );
    await prefs.setString(
      'investmentCalculatorCurrency',
      investmentCalculatorCurrency,
    );
  }

  String closeGuessRankingDate() {
    return _closeGuessSubmissionDate();
  }

  double closeGuessReferenceClose() {
    final session = _usMarketSessionFromUtc(DateTime.now().toUtc());
    if (session == _UsMarketSession.regular) {
      return qldPreviousClose > 0 ? qldPreviousClose : qldPrice;
    }
    return qldPrice > 0 ? qldPrice : qldPreviousClose;
  }

  List<CloseGuessEntry> sortedCloseGuessEntries() {
    final date = closeGuessSelectedDate.isEmpty
        ? closeGuessRankingDate()
        : closeGuessSelectedDate;
    final entries =
        closeGuessEntries.where((entry) => entry.date == date).toList()
          ..sort((a, b) {
            final differenceCompare = a.difference.compareTo(b.difference);
            if (differenceCompare != 0) return differenceCompare;
            return a.price.compareTo(b.price);
          });
    return entries.take(5).toList();
  }

  Future<void> loadLocalCloseGuessRanking() async {
    final prefs = await SharedPreferences.getInstance();
    final savedItems = prefs.getStringList('closeGuessRanking') ?? [];
    closeGuessEntries = savedItems
        .map(CloseGuessEntry.fromJson)
        .whereType<CloseGuessEntry>()
        .toList();
    closeGuessDates = closeGuessEntries
        .map((entry) => entry.date)
        .toSet()
        .toList()
      ..sort((a, b) => b.compareTo(a));
    if (closeGuessDates.isEmpty) {
      closeGuessDates = [closeGuessRankingDate()];
    }
    if (closeGuessSelectedDate.isEmpty) {
      closeGuessSelectedDate = closeGuessDates.first;
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> loadCloseGuessRanking({String? date}) async {
    final selectedDate = date ?? closeGuessSelectedDate;
    if (mounted) {
      setState(() {
        closeGuessLoading = true;
      });
    }

    try {
      final uri = Uri.parse(_closeGuessRankingsUrl).replace(
        queryParameters: selectedDate.isEmpty ? null : {'date': selectedDate},
      );
      final response = await http.get(uri).timeout(const Duration(seconds: 8));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Ranking API ${response.statusCode}');
      }
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final ranking = CloseGuessRankingState.fromMap(data);
      if (ranking == null) throw Exception('Invalid ranking response');
      applyCloseGuessRanking(ranking);
      closeGuessWinnerMessageToken =
          (data['winnerMessageToken'] ?? '').toString();
      await saveCloseGuessRanking();
    } catch (_) {
      await loadLocalCloseGuessRanking();
    } finally {
      if (mounted) {
        setState(() {
          closeGuessLoading = false;
        });
      }
    }
  }

  Future<void> saveCloseGuessRanking() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'closeGuessRanking',
      closeGuessEntries.map((entry) => jsonEncode(entry.toJson())).toList(),
    );
  }

  void applyCloseGuessRanking(CloseGuessRankingState ranking) {
    setState(() {
      closeGuessSelectedDate = ranking.date;
      closeGuessDates = ranking.dates.isEmpty
          ? [ranking.date]
          : ranking.dates.toSet().toList();
      closeGuessEntries = ranking.entries
          .map(
            (entry) => CloseGuessEntry(
              id: entry.id,
              uid: entry.uid,
              price: entry.price,
              close: entry.close,
              date: ranking.date,
              submittedAt: entry.submittedAt,
            ),
          )
          .toList();
      closeGuessWinnerMessage = ranking.winnerMessage;
      showCloseGuessInput = true;
    });
  }

  void applyCloseGuessRankingWithSubmittedEntry(
    CloseGuessRankingState ranking,
    CloseGuessEntry submittedEntry,
  ) {
    final submittedForRankingDate = CloseGuessEntry(
      id: submittedEntry.id,
      uid: submittedEntry.uid,
      price: submittedEntry.price,
      close: submittedEntry.close,
      date: ranking.date,
      submittedAt: submittedEntry.submittedAt,
    );
    final mergedEntries = ranking.entries
        .where(
          (entry) => submittedForRankingDate.uid.isNotEmpty
              ? entry.uid != submittedForRankingDate.uid
              : entry.id != submittedForRankingDate.id,
        )
        .toList()
      ..add(submittedForRankingDate);

    applyCloseGuessRanking(
      CloseGuessRankingState(
        date: ranking.date,
        dates: ranking.dates.contains(ranking.date)
            ? ranking.dates
            : [ranking.date, ...ranking.dates],
        entries: mergedEntries,
        referenceClose: ranking.referenceClose,
        winnerMessage: ranking.winnerMessage,
      ),
    );
  }

  Future<void> submitCloseGuess() async {
    final gameLocale = Localizations.localeOf(context);
    final identity = await ensureAnonymousUserIdentity();
    if (!mounted) return;
    final isAdmin = appUserAdminNotifier.value;
    final id = closeGuessIdController.text.trim().isNotEmpty
        ? closeGuessIdController.text.trim()
        : appUserDisplayName(identity, isAdmin: isAdmin);
    final priceText = closeGuessPriceController.text.trim().replaceAll(',', '');
    final rawPrice = double.tryParse(priceText) ?? 0;
    final price = double.parse(rawPrice.toStringAsFixed(2));
    final close = closeGuessReferenceClose();

    if (price <= 0 || close <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            close <= 0
                ? localizedCloseGuessText(gameLocale, 'referenceCloseMissing')
                : localizedCloseGuessText(gameLocale, 'idPriceMissing'),
          ),
        ),
      );
      return;
    }

    final date = closeGuessRankingDate();
    final nextEntry = CloseGuessEntry(
      id: id,
      uid: identity.uid,
      price: price,
      close: close,
      date: date,
      submittedAt: DateTime.now().toIso8601String(),
    );
    closeGuessLastSubmittedId = identity.uid;

    try {
      final response = await http
          .post(
            Uri.parse(_closeGuessSubmitUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(nextEntry.toJson()),
          )
          .timeout(const Duration(seconds: 8));
      if (response.statusCode == 403) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                localizedCloseGuessText(gameLocale, 'submissionWindowClosed')),
          ),
        );
        return;
      }
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Ranking API ${response.statusCode}');
      }
      final ranking = CloseGuessRankingState.fromMap(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
      if (ranking == null) throw Exception('Invalid ranking response');
      applyCloseGuessRankingWithSubmittedEntry(ranking, nextEntry);
    } catch (_) {
      final nextEntries = closeGuessEntries
          .where((entry) => !(entry.date == date && entry.uid == identity.uid))
          .toList()
        ..add(nextEntry);

      setState(() {
        closeGuessEntries = nextEntries;
        closeGuessDates = {...closeGuessDates, date}.toList()
          ..sort((a, b) => b.compareTo(a));
        closeGuessSelectedDate = date;
        showCloseGuessInput = true;
      });
    }

    closeGuessIdController.clear();
    closeGuessPriceController.clear();
    await saveCloseGuessRanking();
  }

  Future<void> submitCloseGuessWinnerMessage() async {
    final message = closeGuessMessageController.text.trim();
    final rankings = sortedCloseGuessEntries();
    final winner = rankings.isEmpty ? null : rankings.first;
    if (winner == null ||
        winner.uid != closeGuessLastSubmittedId ||
        closeGuessWinnerMessageToken.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('?꾩옱 1?꾨쭔 ?쒕쭏?붾? ?④만 ???덉뒿?덈떎.')),
      );
      return;
    }

    try {
      final response = await http
          .post(
            Uri.parse(_closeGuessWinnerMessageUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'date': closeGuessSelectedDate,
              'uid': closeGuessLastSubmittedId,
              'id': winner.id,
              'token': closeGuessWinnerMessageToken,
              'message': message,
            }),
          )
          .timeout(const Duration(seconds: 8));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Ranking API ${response.statusCode}');
      }
      final ranking = CloseGuessRankingState.fromMap(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
      if (ranking == null) throw Exception('Invalid ranking response');
      applyCloseGuessRanking(ranking);
      closeGuessMessageController.clear();
    } catch (_) {
      setState(() {
        closeGuessWinnerMessage = message.isEmpty
            ? null
            : CloseGuessWinnerMessage(
                id: winner.id,
                message: message,
                updatedAt: DateTime.now().toIso8601String(),
              );
      });
    }
  }

  Future<void> loadAlertHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final savedItems = prefs.getStringList('alertHistory') ?? [];

    alertHistory = sortAlertHistoryItems(
      savedItems.map(AlertHistoryItem.fromJson),
    );

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> loadLastHighAlertDate() async {
    final prefs = await SharedPreferences.getInstance();
    final savedDate = prefs.getString('lastHighAlertDate') ?? '';

    if (!mounted) return;

    setState(() {
      lastHighAlertDate = savedDate;
    });
  }

  Future<void> loadLastMarketOpenAlertDate() async {
    final prefs = await SharedPreferences.getInstance();
    final savedDate = prefs.getString('lastMarketOpenAlertDate') ?? '';
    final initialized = prefs.getBool('marketOpenAlertInitialized') ?? false;

    if (!mounted) return;

    setState(() {
      lastMarketOpenAlertDate = savedDate;
      marketOpenAlertInitialized = initialized;
    });
  }

  Future<void> loadStoredAllTimeHigh() async {
    final prefs = await SharedPreferences.getInstance();
    final savedHigh = prefs.getDouble(_storedTenYearHighKey) ?? 0;

    if (!mounted || savedHigh <= 0) return;

    setState(() {
      allTimeHigh = savedHigh;
      basePrice = math.max(basePrice, savedHigh);
    });
  }

  Future<void> loadCachedPrices() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedQldPrice = prefs.getDouble('lastQldPrice') ?? 0;
    final cachedTqqqPrice = prefs.getDouble('lastTqqqPrice') ?? 0;
    final cachedFuturesPrice = prefs.getDouble('lastFuturesPrice') ?? 0;
    final cachedFuturesPreviousClose =
        prefs.getDouble('lastFuturesPreviousClose') ?? 0;
    final cachedFuturesBaselinePrice =
        prefs.getDouble('lastFuturesBaselinePrice') ?? 0;
    final cachedFuturesBaselineDate =
        prefs.getString('lastFuturesBaselineDate') ?? '';
    final cachedVixPrice = prefs.getDouble('lastVixPrice') ?? 0;
    final cachedTenYearYield = prefs.getDouble('lastTenYearYield') ?? 0;
    final cachedIsPriceUp = prefs.getBool('lastIsPriceUp') ?? isPriceUp;
    final cachedDate = prefs.getString('lastPriceDate') ?? '';
    final cachedTimestamp = prefs.getInt('lastPriceUpdatedAt') ?? 0;

    if (!mounted || (cachedQldPrice <= 0 && cachedTqqqPrice <= 0)) return;
    if (lastAppliedQuoteTimestamp > cachedTimestamp) return;

    setState(() {
      if (cachedQldPrice > 0) qldPrice = cachedQldPrice;
      if (cachedTqqqPrice > 0) tqqqPrice = cachedTqqqPrice;
      if (cachedFuturesPrice > 0) futuresPrice = cachedFuturesPrice;
      if (cachedFuturesPreviousClose > 0) {
        futuresPreviousClose = cachedFuturesPreviousClose;
      }
      if (cachedFuturesBaselinePrice > 0) {
        futuresBaselinePrice = cachedFuturesBaselinePrice;
      }
      if (cachedFuturesBaselineDate.isNotEmpty) {
        futuresBaselineDate = cachedFuturesBaselineDate;
      }
      if (cachedVixPrice > 0) vixPrice = cachedVixPrice;
      if (cachedTenYearYield > 0) tenYearYield = cachedTenYearYield;
      lastAppliedQuoteTimestamp = cachedTimestamp;
      isPriceUp = cachedIsPriceUp;
      if (cachedDate.isNotEmpty) latestDate = cachedDate;
      isLoading = false;
      isRefreshingPrice = true;
      isUsingCachedPrice = true;
    });
  }

  Future<void> saveCachedPrices({
    required double qld,
    required double tqqq,
    required double futures,
    required double futuresPrevious,
    required double futuresBaseline,
    required String futuresBaselineDay,
    required double vix,
    required double tenYear,
    required bool priceUp,
    required int updatedAt,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final nowDate = DateTime.now().toString().substring(0, 10);

    if (qld > 0) {
      await prefs.setDouble('lastQldPrice', qld);
    }
    if (tqqq > 0) {
      await prefs.setDouble('lastTqqqPrice', tqqq);
    }
    if (futures > 0) {
      await prefs.setDouble('lastFuturesPrice', futures);
    }
    if (futuresPrevious > 0) {
      await prefs.setDouble('lastFuturesPreviousClose', futuresPrevious);
    }
    if (futuresBaseline > 0) {
      await prefs.setDouble('lastFuturesBaselinePrice', futuresBaseline);
    }
    if (futuresBaselineDay.isNotEmpty) {
      await prefs.setString('lastFuturesBaselineDate', futuresBaselineDay);
    }
    if (vix > 0) {
      await prefs.setDouble('lastVixPrice', vix);
    }
    if (tenYear > 0) {
      await prefs.setDouble('lastTenYearYield', tenYear);
    }
    await prefs.setBool('lastIsPriceUp', priceUp);
    await prefs.setString('lastPriceDate', nowDate);
    await prefs.setInt('lastPriceUpdatedAt', updatedAt);
  }

  Future<void> loadAlertSettings() async {
    final prefs = await SharedPreferences.getInstance();

    if (!mounted) return;

    setState(() {
      highAlertEnabled = prefs.getBool('highAlertEnabled') ?? true;
      marketOpenAlertEnabled = prefs.getBool('marketOpenAlertEnabled') ?? true;
      strategyAlertEnabled = prefs.getBool('strategyAlertEnabled') ?? true;
      coreAlertEnabled = prefs.getBool('coreAlertEnabled') ?? false;
      coreAlertPurchased = prefs.getBool('coreAlertPurchased') ?? false;
      nasdaq200AlertEnabled = prefs.getBool('nasdaq200AlertEnabled') ?? true;
      portfolioCashAlertEnabled =
          prefs.getBool('portfolioCashAlertEnabled') ?? true;
      qldMoveAlertEnabled = prefs.getBool('qldMoveAlertEnabled') ?? true;
      profitTargetAlertEnabled =
          prefs.getBool('profitTargetAlertEnabled') ?? true;
      fearGreedExtremeFearAlertEnabled =
          prefs.getBool('fearGreedExtremeFearAlertEnabled') ?? true;
      fearGreedExtremeGreedAlertEnabled =
          prefs.getBool('fearGreedExtremeGreedAlertEnabled') ?? true;
      announcementAlertEnabled =
          prefs.getBool('announcementAlertEnabled') ?? true;
      nasdaq200State = prefs.getInt('nasdaq200State') ?? 0;
      portfolioCashState = prefs.getInt('portfolioCashState') ?? 0;
      fearGreedState = prefs.getInt('fearGreedState') ?? 0;
      qldMoveCloseState = prefs.getInt('qldMoveCloseState') ?? 0;
      qldProfitTargetState = prefs.getInt('qldProfitTargetState') ?? 0;
      tqqqProfitTargetState = prefs.getInt('tqqqProfitTargetState') ?? 0;
    });
  }

  Future<void> loadStrategyProgress() async {
    final progress = await strategyProgressStore.load();

    touchedMinus20 = progress.touchedMinus20;
    touchedMinus30 = progress.touchedMinus30;
    touchedMinus40 = progress.touchedMinus40;
    touchedMinus50 = progress.touchedMinus50;
    activeDropZone = progress.activeDropZone;
    dropAlertInitialized = progress.initialized;

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> saveStrategyProgress() async {
    await strategyProgressStore.save(
      StrategyProgress(
        touchedMinus20: touchedMinus20,
        touchedMinus30: touchedMinus30,
        touchedMinus40: touchedMinus40,
        touchedMinus50: touchedMinus50,
        activeDropZone: activeDropZone,
        initialized: dropAlertInitialized,
      ),
    );
  }

  Future<void> fetchHomeFearGreed() async {
    try {
      final nextData = await fetchFearGreedData();
      await saveCachedFearGreedData(nextData);
      await evaluateFearGreedAlert(nextData);

      if (!mounted) return;

      setState(() {
        homeFearGreedData = nextData;
      });
    } catch (_) {
      final cachedData = await loadCachedFearGreedData();
      if (!mounted) return;

      setState(() {
        homeFearGreedData = cachedData;
      });
    }
  }

  int fearGreedAlertStateForScore(double score) {
    if (score <= 25) return -1;
    if (score > 75) return 1;
    return 0;
  }

  Future<void> evaluateFearGreedAlert(FearGreedData data) async {
    if (!shouldEvaluateCloseBasedAlertsNow()) return;

    final nextState = fearGreedAlertStateForScore(data.score);
    final prefs = await SharedPreferences.getInstance();
    final savedState = prefs.getInt('fearGreedState') ?? fearGreedState;
    final initialized = prefs.getBool('fearGreedAlertInitialized') ?? false;

    if (!initialized) {
      fearGreedState = nextState;
      await prefs.setInt('fearGreedState', nextState);
      await prefs.setBool('fearGreedAlertInitialized', true);
      return;
    }

    if (savedState == nextState) return;

    fearGreedState = nextState;
    await prefs.setInt('fearGreedState', nextState);

    if (nextState == 0 || !mounted) return;

    final l10n = AppLocalizations.of(context)!;
    final score = data.score.toStringAsFixed(0);
    final extremeFearEnabled =
        prefs.getBool('fearGreedExtremeFearAlertEnabled') ??
            fearGreedExtremeFearAlertEnabled;
    final extremeGreedEnabled =
        prefs.getBool('fearGreedExtremeGreedAlertEnabled') ??
            fearGreedExtremeGreedAlertEnabled;

    if (nextState < 0 && extremeFearEnabled) {
      showAndSaveAlert(
        '${l10n.fearGreedTitle}: ${l10n.fearGreedExtremeFear} $score',
        Colors.redAccent,
        'fearGreedExtremeFear',
        detail: l10n.fearGreedUseBody,
      );
    }

    if (nextState > 0 && extremeGreedEnabled) {
      showAndSaveAlert(
        '${l10n.fearGreedTitle}: ${l10n.fearGreedExtremeGreed} $score',
        Colors.green,
        'fearGreedExtremeGreed',
        detail: l10n.fearGreedUseBody,
      );
    }
  }

  Future<void> saveAlertSetting(
    String key,
    bool value,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  bool get shouldShowCoreAlertPurchaseMessage {
    final until = coreAlertPurchaseMessageUntil;
    return until != null && DateTime.now().isBefore(until);
  }

  bool get shouldShowCoreAlertRestoreMessage {
    final until = coreAlertRestoreMessageUntil;
    return until != null && DateTime.now().isBefore(until);
  }

  void expectCoreAlertPurchaseMessage() {
    coreAlertPurchaseMessageUntil = DateTime.now().add(
      const Duration(minutes: 2),
    );
  }

  void expectCoreAlertRestoreMessage() {
    coreAlertRestoreMessageUntil = DateTime.now().add(
      const Duration(minutes: 2),
    );
  }

  void clearCoreAlertPurchaseMessageExpectation() {
    coreAlertPurchaseMessageUntil = null;
  }

  void clearCoreAlertRestoreMessageExpectation() {
    coreAlertRestoreMessageUntil = null;
  }

  bool isCoreAlertAlreadyOwnedError(Object? error) {
    final text = error?.toString().toLowerCase() ?? '';
    return (text.contains('already') && text.contains('own')) ||
        text.contains('item_already_owned') ||
        text.contains('itemalreadyowned') ||
        text.contains('billingresponse.itemalreadyowned');
  }

  void initCoreAlertPurchase() {
    if (kIsWeb) return;

    coreAlertPurchaseSubscription =
        InAppPurchase.instance.purchaseStream.listen(
      handleCoreAlertPurchaseUpdates,
      onError: (_) {
        if (!mounted) return;

        setState(() {
          coreAlertPurchasePending = false;
        });
      },
    );

    unawaited(loadCoreAlertProduct(restoreOwnedPurchase: true));
  }

  Future<void> loadCoreAlertProduct({
    bool restoreOwnedPurchase = false,
  }) async {
    if (kIsWeb || !mounted) return;

    setState(() {
      coreAlertProductLoading = true;
    });

    try {
      final available = await InAppPurchase.instance.isAvailable();
      if (!mounted) return;

      if (!available) {
        setState(() {
          coreAlertStoreAvailable = false;
          coreAlertProductLoading = false;
        });
        return;
      }

      final response = await InAppPurchase.instance.queryProductDetails(
        {_coreAlertProductId},
      );
      if (!mounted) return;

      setState(() {
        coreAlertStoreAvailable = true;
        coreAlertProduct = response.productDetails.isEmpty
            ? null
            : response.productDetails.first;
        coreAlertProductLoading = false;
      });

      if (restoreOwnedPurchase) {
        await InAppPurchase.instance.restorePurchases();
      }
    } catch (_) {
      if (!mounted) return;

      setState(() {
        coreAlertStoreAvailable = false;
        coreAlertProductLoading = false;
      });
    }
  }

  Future<void> startCoreAlertPurchase() async {
    final locale = Localizations.localeOf(context);

    if (kIsWeb) {
      showCoreAlertPurchaseMessage(
        localizedCoreAlertPurchaseUnavailable(locale),
      );
      return;
    }

    if (coreAlertPurchasePending) {
      showCoreAlertPurchaseMessage(
        localizedCoreAlertPurchasePending(locale),
      );
      return;
    }

    var product = coreAlertProduct;
    if (product == null) {
      await loadCoreAlertProduct();
      product = coreAlertProduct;
    }

    if (!coreAlertStoreAvailable || product == null) {
      showCoreAlertPurchaseMessage(
        localizedCoreAlertPurchaseUnavailable(locale),
      );
      return;
    }

    setState(() {
      coreAlertPurchasePending = true;
    });
    coreAlertPurchaseRevision.value++;
    expectCoreAlertPurchaseMessage();

    try {
      final purchaseParam = PurchaseParam(productDetails: product);
      final launched = await InAppPurchase.instance.buyNonConsumable(
        purchaseParam: purchaseParam,
      );

      if (launched) {
        scheduleCoreAlertPurchaseRestoreChecks();
      }

      if (!launched && mounted) {
        setState(() {
          coreAlertPurchasePending = false;
        });
        coreAlertPurchaseRevision.value++;
        clearCoreAlertPurchaseMessageExpectation();
        showCoreAlertPurchaseMessage(
          localizedCoreAlertPurchaseLaunchFailed(locale),
        );
      }
    } catch (error) {
      if (!mounted) return;

      setState(() {
        coreAlertPurchasePending = false;
      });
      coreAlertPurchaseRevision.value++;
      clearCoreAlertPurchaseMessageExpectation();
      debugPrint('Core Alert purchase launch failed: $error');
      if (isCoreAlertAlreadyOwnedError(error)) {
        showCoreAlertPurchaseMessage(
          localizedCoreAlertRestorePending(locale),
        );
        unawaited(restoreCoreAlertPurchase());
        return;
      }
      showCoreAlertPurchaseMessage(
        localizedCoreAlertPurchaseLaunchFailed(locale),
      );
    }
  }

  void scheduleCoreAlertPurchaseRestoreChecks() {
    for (final delay in const [
      Duration(seconds: 3),
      Duration(seconds: 10),
    ]) {
      Future.delayed(delay, () {
        if (!mounted || coreAlertPurchased) return;
        unawaited(restoreCoreAlertPurchase(showPending: false));
      });
    }
  }

  Future<void> restoreCoreAlertPurchase({
    bool showPending = true,
  }) async {
    if (kIsWeb) return;

    if (showPending) {
      setState(() {
        coreAlertPurchasePending = true;
      });
      coreAlertPurchaseRevision.value++;
      expectCoreAlertRestoreMessage();
      showCoreAlertPurchaseMessage(
        localizedCoreAlertRestorePending(Localizations.localeOf(context)),
      );
    }

    try {
      await InAppPurchase.instance.restorePurchases();
      if (!mounted) return;

      if (showPending) {
        final expectedUntil = coreAlertRestoreMessageUntil;
        Future.delayed(const Duration(seconds: 20), () {
          if (!mounted ||
              coreAlertPurchased ||
              coreAlertRestoreMessageUntil != expectedUntil) {
            return;
          }

          setState(() {
            coreAlertPurchasePending = false;
          });
          coreAlertPurchaseRevision.value++;
          clearCoreAlertRestoreMessageExpectation();
          showCoreAlertPurchaseMessage(
            localizedCoreAlertRestoreNotFound(
              Localizations.localeOf(context),
            ),
          );
        });
      } else {
        setState(() {
          coreAlertPurchasePending = false;
        });
        coreAlertPurchaseRevision.value++;
      }
    } catch (_) {
      if (!mounted) return;

      setState(() {
        coreAlertPurchasePending = false;
      });
      coreAlertPurchaseRevision.value++;
      if (showPending || shouldShowCoreAlertRestoreMessage) {
        showCoreAlertPurchaseMessage(
          localizedCoreAlertRestoreFailed(Localizations.localeOf(context)),
        );
      }
      clearCoreAlertRestoreMessageExpectation();
    }
  }

  Future<void> handleCoreAlertPurchaseUpdates(
    List<PurchaseDetails> purchases,
  ) async {
    for (final purchase in purchases) {
      if (purchase.productID != _coreAlertProductId) continue;
      final notifyPurchase = shouldShowCoreAlertPurchaseMessage;
      final notifyRestore = shouldShowCoreAlertRestoreMessage;

      if (purchase.status == PurchaseStatus.pending) {
        if (mounted && (notifyPurchase || notifyRestore)) {
          setState(() {
            coreAlertPurchasePending = true;
          });
          coreAlertPurchaseRevision.value++;
        }
        continue;
      }

      if (purchase.status == PurchaseStatus.error) {
        final alreadyOwned = isCoreAlertAlreadyOwnedError(purchase.error);
        if (mounted) {
          setState(() {
            coreAlertPurchasePending = false;
          });
          coreAlertPurchaseRevision.value++;
          debugPrint(
            'Core Alert purchase failed: '
            '${purchase.error?.code} ${purchase.error?.message}',
          );
          if (notifyPurchase) {
            showCoreAlertPurchaseMessage(
              localizedCoreAlertPurchaseFailed(Localizations.localeOf(context)),
            );
          } else if (notifyRestore) {
            showCoreAlertPurchaseMessage(
              localizedCoreAlertRestoreFailed(Localizations.localeOf(context)),
            );
          } else if (alreadyOwned) {
            showCoreAlertPurchaseMessage(
              localizedCoreAlertRestorePending(Localizations.localeOf(context)),
            );
          }
        }
        clearCoreAlertPurchaseMessageExpectation();
        clearCoreAlertRestoreMessageExpectation();

        if (purchase.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchase);
        }
        if (alreadyOwned) {
          unawaited(restoreCoreAlertPurchase());
        }
        continue;
      }

      if (purchase.status == PurchaseStatus.canceled) {
        if (mounted) {
          setState(() {
            coreAlertPurchasePending = false;
          });
          coreAlertPurchaseRevision.value++;
          if (notifyPurchase) {
            showCoreAlertPurchaseMessage(
              localizedCoreAlertPurchaseCanceled(
                Localizations.localeOf(context),
              ),
            );
          }
        }
        clearCoreAlertPurchaseMessageExpectation();
        clearCoreAlertRestoreMessageExpectation();

        if (purchase.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchase);
        }
        continue;
      }

      if (purchase.status == PurchaseStatus.purchased ||
          purchase.status == PurchaseStatus.restored) {
        final verified = await unlockCoreAlertPurchase(
          purchase,
          enableAlert: true,
          showMessage: notifyPurchase || notifyRestore,
        );
        if (!verified) continue;
      }

      if (purchase.pendingCompletePurchase) {
        await InAppPurchase.instance.completePurchase(purchase);
      }
    }
  }

  Future<bool> unlockCoreAlertPurchase(
    PurchaseDetails purchase, {
    required bool enableAlert,
    required bool showMessage,
  }) async {
    final verified = await registerVerifiedCoreAlertPurchase(purchase);
    if (!verified) {
      if (mounted) {
        setState(() {
          coreAlertPurchasePending = false;
        });
        coreAlertPurchaseRevision.value++;
        if (showMessage) {
          showCoreAlertPurchaseMessage(
            localizedCoreAlertPurchaseVerificationFailed(
              Localizations.localeOf(context),
            ),
          );
        }
      }
      clearCoreAlertPurchaseMessageExpectation();
      clearCoreAlertRestoreMessageExpectation();
      return false;
    }

    final prefs = await SharedPreferences.getInstance();
    final nextEnabled =
        enableAlert || prefs.getBool('coreAlertEnabled') == true;

    await prefs.setBool('coreAlertPurchased', true);
    await prefs.setBool('coreAlertEnabled', nextEnabled);
    await syncAlertLanguageTopicSafely(await savedLanguageCode());

    if (!mounted) return true;

    setState(() {
      coreAlertPurchased = true;
      coreAlertEnabled = nextEnabled;
      coreAlertPurchasePending = false;
    });
    coreAlertPurchaseRevision.value++;

    if (showMessage) {
      showCoreAlertPurchaseMessage(
        localizedCoreAlertPurchaseComplete(Localizations.localeOf(context)),
      );
    }
    clearCoreAlertPurchaseMessageExpectation();
    clearCoreAlertRestoreMessageExpectation();
    return true;
  }

  void showCoreAlertPurchaseMessage(String message) {
    if (!mounted) return;
    final whiteMode = isWhiteModeEnabled(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: whiteMode ? _lightBlue : const Color(0xFF151B24),
      ),
    );
  }

  Future<void> addAlertHistory(
    String message,
    String type, {
    String detail = '',
    String link = '',
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final nextItems = sortAlertHistoryItems([
      AlertHistoryItem(
        message: message,
        detail: detail,
        link: link,
        type: type,
        createdAt: DateTime.now(),
      ),
      ...alertHistory.where(
        (item) =>
            !isAnnouncementAlertType(type) ||
            !isAnnouncementAlertType(item.type),
      ),
    ]);

    await prefs.setStringList(
      'alertHistory',
      nextItems.map((item) => jsonEncode(item.toJson())).toList(),
    );

    if (!mounted) return;

    setState(() {
      alertHistory = nextItems;
    });

    await incrementAlertBadgeCount();
  }

  Future<void> _fetchLatestAnnouncement() async {
    final info = await fetchLatestAnnouncementInfo();
    if (info == null) return;

    final prefs = await SharedPreferences.getInstance();
    final savedId = prefs.getString('latestAnnouncementId') ?? '';

    if (savedId == info.id) return;

    final savedItems = prefs.getStringList('alertHistory') ?? [];
    final isFirstAnnouncementSync = savedId.isEmpty && savedItems.isEmpty;

    if (isFirstAnnouncementSync) {
      await prefs.setString('latestAnnouncementId', info.id);
      return;
    }

    final filteredItems = savedItems.where((source) {
      try {
        return !isAnnouncementAlertType(
          AlertHistoryItem.fromJson(source).type,
        );
      } catch (_) {
        return true;
      }
    }).toList();
    final nextItems = [
      jsonEncode(info.item.toJson()),
      ...filteredItems,
    ].take(50).toList();

    await prefs.setStringList('alertHistory', nextItems);
    await prefs.setString('latestAnnouncementId', info.id);

    if (!mounted) return;

    setState(() {
      alertHistory = sortAlertHistoryItems([
        info.item,
        ...alertHistory.where(
          (item) => !isAnnouncementAlertType(item.type),
        ),
      ]);
    });

    await incrementAlertBadgeCount();
  }

  void showAndSaveRemoteAlert(AlertHistoryItem item, {String? eventKey}) {
    if (!isAlertTypeEnabled(item.type)) {
      return;
    }

    showAndSaveAlert(
      item.message,
      isAnnouncementAlertType(item.type)
          ? Colors.amberAccent
          : item.type == 'coreAlert'
              ? _commentGreen
              : item.type == 'qldMoveDown4'
                  ? Colors.redAccent
                  : _cyan,
      item.type,
      detail: item.detail,
      link: item.link,
      eventKey: eventKey,
    );
  }

  bool isAlertTypeEnabled(String type) {
    if (isAnnouncementAlertType(type)) return announcementAlertEnabled;
    if (type == 'high') return highAlertEnabled;
    if (type == 'marketOpen') return marketOpenAlertEnabled;
    if (type == 'qldMoveUp4' || type == 'qldMoveDown4') {
      return qldMoveAlertEnabled;
    }
    if (type == 'coreAlert') return coreAlertPurchased && coreAlertEnabled;
    if (type == 'minus20' ||
        type == 'minus30' ||
        type == 'minus40' ||
        type == 'minus50' ||
        type == 'recovery20' ||
        type == 'recovery30' ||
        type == 'recovery40' ||
        type == 'recovery50') {
      return strategyAlertEnabled;
    }
    if (type == 'nasdaq200Breakdown' ||
        type == 'nasdaq200Breakout' ||
        type == 'nasdaq200Recovery') {
      return nasdaq200AlertEnabled;
    }
    if (type == 'portfolioCashHigh' || type == 'portfolioCashLow') {
      return portfolioCashAlertEnabled;
    }
    if (type == 'fearGreedExtremeFear') {
      return fearGreedExtremeFearAlertEnabled;
    }
    if (type == 'fearGreedExtremeGreed') {
      return fearGreedExtremeGreedAlertEnabled;
    }
    if (type.startsWith('profitTarget')) {
      return profitTargetAlertEnabled;
    }
    return true;
  }

  void showAndSaveAlert(
    String message,
    Color color,
    String type, {
    String? detail,
    String link = '',
    String? eventKey,
  }) {
    Future.microtask(() async {
      if (!mounted) return;
      if (!isAlertTypeEnabled(type)) return;

      final alertDetail = detail ??
          localizedAlertDetailForType(
            AppLocalizations.of(context)!,
            type,
            message,
          );

      final shown = await showLocalAlertNotification(
        message,
        detail: alertDetail,
        link: link,
        type: type,
        eventKey: eventKey,
      );
      if (!shown) return;
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Text(
            message,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );

      addAlertHistory(message, type, detail: alertDetail, link: link);
    });
  }

  void showZoneAlert(String title, Color color, String type,
      {String? eventKey}) {
    showAndSaveAlert(
      title,
      color,
      type,
      eventKey: eventKey,
    );
  }

  void sendTestAlertNotification({
    required String title,
    required String type,
    String? detail,
  }) {
    unawaited(
      showLocalAlertNotification(
        title,
        detail: detail ??
            localizedAlertDetailForType(
              AppLocalizations.of(context)!,
              type,
              title,
            ),
        type: type,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: _blue,
        content: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget buildAlertTestTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    final whiteMode = isWhiteModeEnabled(context);
    final surface =
        whiteMode ? _lightSurface : Colors.white.withValues(alpha: 0.04);
    final line = whiteMode ? _lightLine : Colors.white.withValues(alpha: 0.08);
    final primaryText = whiteMode ? _lightText : Colors.white;
    final secondaryText = whiteMode ? _lightMuted : Colors.white54;
    final iconMuted = whiteMode ? const Color(0xFF94A3B8) : Colors.white38;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: line),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 19),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: primaryText,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: secondaryText,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.notifications_active_rounded,
              color: iconMuted,
              size: 17,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationPermissionHelpCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _cyan.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _cyan.withValues(alpha: 0.16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.notifications_off_outlined,
                color: _cyan,
                size: 18,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  '?占쎈┝?????占쎈굹??',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            '湲곌린 ?占쎈┝ 沅뚰븳??爰쇱졇 ?占쎌쑝占??占쎌뒪???占쎈┝???占쎌떆?占쏙옙? ?占쎌쓣 ???占쎌뒿?占쎈떎.',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 11,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    unawaited(requestLocalNotificationPermission());
                  },
                  icon:
                      const Icon(Icons.check_circle_outline_rounded, size: 16),
                  label: const Text('沅뚰븳 ?占쎌껌'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white70,
                    side:
                        BorderSide(color: Colors.white.withValues(alpha: 0.16)),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    unawaited(openAndroidAppNotificationSettings());
                  },
                  icon: const Icon(Icons.settings_rounded, size: 16),
                  label: const Text('?占쎌젙 ?占쎄린'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _blue,
                    foregroundColor: Colors.white,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLocalizedNotificationPermissionHelpCard() {
    final l10n = AppLocalizations.of(context)!;
    final whiteMode = isWhiteModeEnabled(context);
    final primaryText = whiteMode ? _lightText : Colors.white;
    final secondaryText = whiteMode ? _lightMuted : Colors.white60;
    final outlineText = whiteMode ? _lightBlue : Colors.white70;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _cyan.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _cyan.withValues(alpha: 0.16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.notifications_off_outlined,
                color: _cyan,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l10n.alertPermissionHelpTitle,
                  style: TextStyle(
                    color: primaryText,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            l10n.alertPermissionHelpBody,
            style: TextStyle(
              color: secondaryText,
              fontSize: 11,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    unawaited(requestLocalNotificationPermission());
                  },
                  icon:
                      const Icon(Icons.check_circle_outline_rounded, size: 16),
                  label: Text(l10n.alertPermissionRequest),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: outlineText,
                    side: BorderSide(
                      color: whiteMode
                          ? _lightLine
                          : Colors.white.withValues(alpha: 0.16),
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    unawaited(openAndroidAppNotificationSettings());
                  },
                  icon: const Icon(Icons.settings_rounded, size: 16),
                  label: Text(l10n.alertPermissionOpenSettings),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _blue,
                    foregroundColor: Colors.white,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showAlertTestSheet() {
    final whiteMode = isWhiteModeEnabled(context);
    final sheetBg = whiteMode ? _lightAppBg : const Color(0xFF0D1724);
    final primaryText = whiteMode ? _lightText : Colors.white;
    final accent = whiteMode ? _lightCyan : _cyan;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: sheetBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        final l10n = AppLocalizations.of(sheetContext)!;
        final locale = Localizations.localeOf(sheetContext);

        void runTest({
          required String title,
          required String type,
          String? detail,
        }) {
          Navigator.pop(sheetContext);
          sendTestAlertNotification(
            title: title,
            type: type,
            detail: detail,
          );
        }

        return SafeArea(
          top: false,
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.72,
            minChildSize: 0.42,
            maxChildSize: 0.92,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_active_rounded,
                          color: accent,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          l10n.alertTestTitle,
                          style: TextStyle(
                            color: primaryText,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    buildLocalizedNotificationPermissionHelpCard(),
                    buildAlertTestTile(
                      icon: Icons.trending_up_rounded,
                      title: l10n.alertHighTitle,
                      subtitle: l10n.alertHighSubtitle,
                      color: Colors.lightGreenAccent,
                      onTap: () => runTest(
                        title: l10n.alertNewHigh,
                        type: 'high',
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.schedule_rounded,
                      title: l10n.alertMarketOpenTitle,
                      subtitle: l10n.alertMarketOpenSubtitle,
                      color: _blue,
                      onTap: () => runTest(
                        title: l10n.alertMarketOpen,
                        type: 'marketOpen',
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.rule_rounded,
                      title: l10n.minus20Headline,
                      subtitle: l10n.alertStrategySettingTitle,
                      color: Colors.green,
                      onTap: () => runTest(
                        title: l10n.minus20Headline,
                        type: 'minus20',
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.shopping_cart_checkout_rounded,
                      title: l10n.minus30Headline,
                      subtitle: l10n.alertStrategySettingTitle,
                      color: Colors.orange,
                      onTap: () => runTest(
                        title: l10n.minus30Headline,
                        type: 'minus30',
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.warning_amber_rounded,
                      title: l10n.minus40Headline,
                      subtitle: l10n.alertStrategySettingTitle,
                      color: Colors.redAccent,
                      onTap: () => runTest(
                        title: l10n.minus40Headline,
                        type: 'minus40',
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.bolt_rounded,
                      title: l10n.minus50Headline,
                      subtitle: l10n.alertStrategySettingTitle,
                      color: Colors.purpleAccent,
                      onTap: () => runTest(
                        title: l10n.minus50Headline,
                        type: 'minus50',
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.show_chart_rounded,
                      title: l10n.alertNasdaq200Breakdown,
                      subtitle: l10n.alertNasdaq200Title,
                      color: Colors.redAccent,
                      onTap: () => runTest(
                        title: l10n.alertNasdaq200Breakdown,
                        type: 'nasdaq200Breakdown',
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.show_chart_rounded,
                      title: l10n.alertNasdaq200Breakout,
                      subtitle: l10n.alertNasdaq200Title,
                      color: _cyan,
                      onTap: () => runTest(
                        title: l10n.alertNasdaq200Breakout,
                        type: 'nasdaq200Breakout',
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.arrow_upward_rounded,
                      title: localizedQldMoveUpAlert(locale, 4),
                      subtitle: localizedSimpleQldMoveAlertTitle(locale),
                      color: _cyan,
                      onTap: () => runTest(
                        title: localizedQldMoveUpAlert(locale, 4),
                        type: 'qldMoveUp4',
                        detail: localizedSimpleQldMoveAlertDetail(locale),
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.arrow_downward_rounded,
                      title: localizedQldMoveDownAlert(locale, -4),
                      subtitle: localizedSimpleQldMoveAlertTitle(locale),
                      color: Colors.redAccent,
                      onTap: () => runTest(
                        title: localizedQldMoveDownAlert(locale, -4),
                        type: 'qldMoveDown4',
                        detail: localizedSimpleQldMoveAlertDetail(locale),
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.account_balance_wallet_outlined,
                      title: l10n.alertPortfolioCashLow,
                      subtitle: l10n.alertPortfolioCashTitle,
                      color: Colors.redAccent,
                      onTap: () => runTest(
                        title: l10n.alertPortfolioCashLow,
                        type: 'portfolioCashLow',
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.account_balance_wallet_outlined,
                      title: l10n.alertPortfolioCashHigh,
                      subtitle: l10n.alertPortfolioCashTitle,
                      color: _cyan,
                      onTap: () => runTest(
                        title: l10n.alertPortfolioCashHigh,
                        type: 'portfolioCashHigh',
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.sentiment_very_dissatisfied_rounded,
                      title: l10n.fearGreedExtremeFear,
                      subtitle: l10n.fearGreedTitle,
                      color: Colors.redAccent,
                      onTap: () => runTest(
                        title:
                            '${l10n.fearGreedTitle}: ${l10n.fearGreedExtremeFear}',
                        type: 'fearGreedExtremeFear',
                        detail: l10n.fearGreedUseBody,
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.sentiment_very_satisfied_rounded,
                      title: l10n.fearGreedExtremeGreed,
                      subtitle: l10n.fearGreedTitle,
                      color: Colors.green,
                      onTap: () => runTest(
                        title:
                            '${l10n.fearGreedTitle}: ${l10n.fearGreedExtremeGreed}',
                        type: 'fearGreedExtremeGreed',
                        detail: l10n.fearGreedUseBody,
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.emoji_events_outlined,
                      title: localizedProfitTargetSettingTitle(locale),
                      subtitle: localizedProfitTargetSettingSubtitle(locale),
                      color: Colors.lightGreenAccent,
                      onTap: () => runTest(
                        title: localizedProfitTargetSettingTitle(locale),
                        type: 'profitTargetQld50',
                        detail: localizedProfitTargetDetail(locale, 'QLD', 50),
                      ),
                    ),
                    buildAlertTestTile(
                      icon: Icons.campaign_outlined,
                      title: l10n.alertAnnouncementTitle,
                      subtitle: l10n.alertAnnouncementSubtitle,
                      color: Colors.amberAccent,
                      onTap: () => runTest(
                        title: l10n.alertAnnouncementTitle,
                        type: _announcementAlertType,
                        detail: l10n.alertAnnouncementSubtitle,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildAlertSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final whiteMode = isWhiteModeEnabled(context);
    final surface =
        whiteMode ? _lightSurface : Colors.white.withValues(alpha: 0.04);
    final line = whiteMode ? _lightLine : Colors.white.withValues(alpha: 0.08);
    final primaryText = whiteMode ? _lightText : Colors.white;
    final secondaryText = whiteMode ? _lightMuted : Colors.white54;
    final inactiveIcon = whiteMode ? const Color(0xFF94A3B8) : Colors.white38;

    return GestureDetector(
      onTap: () => onChanged(!value),
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: line,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: value ? _blue : inactiveIcon,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: primaryText,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: secondaryText,
                      fontSize: 10,
                      height: 1.25,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: value,
              activeThumbColor: _blue,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPremiumAlertSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String lockedText,
    required String purchaseText,
    required bool purchased,
    required bool value,
    required bool busy,
    required ValueChanged<bool> onChanged,
    required VoidCallback onPurchase,
  }) {
    const premiumColor = _commentGreen;
    final whiteMode = isWhiteModeEnabled(context);
    final premiumTextColor =
        whiteMode ? const Color(0xFF047857) : const Color(0xFF34D399);
    final enabled = purchased && value;
    final baseSurface =
        whiteMode ? _lightSurface : Colors.white.withValues(alpha: 0.04);
    final primaryText = whiteMode ? _lightText : Colors.white;
    final secondaryText = whiteMode ? _lightMuted : Colors.white54;

    return GestureDetector(
      onTap: purchased ? () => onChanged(!value) : onPurchase,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Color.alphaBlend(
            premiumColor.withValues(alpha: enabled ? 0.07 : 0.025),
            baseSurface,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: premiumColor.withValues(alpha: purchased ? 0.30 : 0.18),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  purchased ? icon : Icons.trending_up_rounded,
                  color: premiumTextColor,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: primaryText,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  constraints: const BoxConstraints(maxWidth: 110),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: premiumColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    purchased
                        ? localizedCoreAlertSupportedText(
                            Localizations.localeOf(context),
                          )
                        : lockedText,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: premiumTextColor,
                      fontSize: 8.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: secondaryText,
                fontSize: 10,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: purchased
                  ? Switch(
                      value: value,
                      activeThumbColor: premiumColor,
                      onChanged: onChanged,
                    )
                  : SizedBox(
                      width: double.infinity,
                      height: 34,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: premiumColor.withValues(alpha: 0.10),
                          foregroundColor: premiumTextColor,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: premiumTextColor.withValues(alpha: 0.52),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: busy ? null : onPurchase,
                        child: Text(
                          purchaseText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void showCoreAlertPaywallSheet() {
    final locale = Localizations.localeOf(context);
    const premiumColor = _commentGreen;
    final whiteMode = isWhiteModeEnabled(context);
    final premiumTextColor =
        whiteMode ? const Color(0xFF047857) : const Color(0xFF34D399);
    final sheetBg = whiteMode ? _lightSurface : const Color(0xFF0D1724);
    final primaryText = whiteMode ? _lightText : Colors.white;
    final secondaryText = whiteMode ? _lightMuted : Colors.white70;
    final productPrice = coreAlertProduct?.price;
    final purchaseText = productPrice == null
        ? localizedCoreAlertPurchaseButton(locale)
        : '${localizedCoreAlertPurchaseButton(locale)} $productPrice';

    showModalBottomSheet(
      context: context,
      backgroundColor: sheetBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (paywallContext) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: premiumColor.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.trending_up_rounded,
                        color: premiumTextColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        localizedCoreAlertTitle(locale),
                        style: TextStyle(
                          color: primaryText,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  localizedCoreAlertPaywallBody(locale),
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  localizedCoreAlertLifetimeNote(locale),
                  style: TextStyle(
                    color: premiumTextColor,
                    fontSize: 11,
                    height: 1.3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: premiumColor.withValues(alpha: 0.10),
                      foregroundColor: premiumTextColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: premiumTextColor.withValues(alpha: 0.52),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: coreAlertPurchasePending
                        ? null
                        : () {
                            Navigator.pop(paywallContext);
                            startCoreAlertPurchase();
                          },
                    child: Text(
                      coreAlertPurchasePending
                          ? localizedCoreAlertPurchasePending(locale)
                          : purchaseText,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showAlertSettingsSheet() {
    final whiteMode = isWhiteModeEnabled(context);
    final sheetBg = whiteMode ? _lightAppBg : const Color(0xFF0D1724);
    final primaryText = whiteMode ? _lightText : Colors.white;
    final secondaryText = whiteMode ? _lightMuted : Colors.white60;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: sheetBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            final l10n = AppLocalizations.of(context)!;

            void updateSetting(
              String key,
              bool value,
              ValueChanged<bool> apply,
            ) {
              setState(() {
                apply(value);
              });

              setSheetState(() {});
              saveAlertSetting(key, value);
            }

            void updateCoreAlertSetting(bool value) {
              final languageTag =
                  Localizations.localeOf(context).toLanguageTag();
              setState(() {
                coreAlertEnabled = value;
              });

              coreAlertPurchaseRevision.value++;
              setSheetState(() {});
              unawaited(
                saveAlertSetting('coreAlertEnabled', value).then(
                  (_) => syncAlertLanguageTopicSafely(
                    languageTag,
                  ),
                ),
              );
            }

            return SafeArea(
              top: false,
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.72,
                minChildSize: 0.42,
                maxChildSize: 0.92,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              l10n.alertSettingsTitle,
                              style: TextStyle(
                                color: primaryText,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              l10n.alertSettingsCloseBasisNote,
                              style: TextStyle(
                                color: secondaryText,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        buildAlertSettingTile(
                          icon: Icons.trending_up_rounded,
                          title: l10n.alertHighTitle,
                          subtitle: l10n.alertHighSubtitle,
                          value: highAlertEnabled,
                          onChanged: (value) {
                            updateSetting(
                              'highAlertEnabled',
                              value,
                              (next) => highAlertEnabled = next,
                            );
                          },
                        ),
                        buildAlertSettingTile(
                          icon: Icons.schedule_rounded,
                          title: l10n.alertMarketOpenTitle,
                          subtitle: l10n.alertMarketOpenSubtitle,
                          value: marketOpenAlertEnabled,
                          onChanged: (value) {
                            updateSetting(
                              'marketOpenAlertEnabled',
                              value,
                              (next) => marketOpenAlertEnabled = next,
                            );
                          },
                        ),
                        buildAlertSettingTile(
                          icon: Icons.rule_rounded,
                          title: l10n.alertStrategySettingTitle,
                          subtitle: l10n.alertStrategySettingSubtitle,
                          value: strategyAlertEnabled,
                          onChanged: (value) {
                            updateSetting(
                              'strategyAlertEnabled',
                              value,
                              (next) => strategyAlertEnabled = next,
                            );
                          },
                        ),
                        buildAlertSettingTile(
                          icon: Icons.show_chart_rounded,
                          title: l10n.alertNasdaq200Title,
                          subtitle: l10n.alertNasdaq200Subtitle,
                          value: nasdaq200AlertEnabled,
                          onChanged: (value) {
                            updateSetting(
                              'nasdaq200AlertEnabled',
                              value,
                              (next) => nasdaq200AlertEnabled = next,
                            );
                          },
                        ),
                        buildAlertSettingTile(
                          icon: Icons.swap_vert_rounded,
                          title: localizedSimpleQldMoveAlertTitle(
                            Localizations.localeOf(context),
                          ),
                          subtitle: localizedSimpleQldMoveAlertSubtitle(
                            Localizations.localeOf(context),
                          ),
                          value: qldMoveAlertEnabled,
                          onChanged: (value) {
                            updateSetting(
                              'qldMoveAlertEnabled',
                              value,
                              (next) => qldMoveAlertEnabled = next,
                            );
                          },
                        ),
                        buildAlertSettingTile(
                          icon: Icons.account_balance_wallet_outlined,
                          title: l10n.alertPortfolioCashTitle,
                          subtitle: l10n.alertPortfolioCashSubtitle,
                          value: portfolioCashAlertEnabled,
                          onChanged: (value) {
                            updateSetting(
                              'portfolioCashAlertEnabled',
                              value,
                              (next) => portfolioCashAlertEnabled = next,
                            );
                          },
                        ),
                        buildAlertSettingTile(
                          icon: Icons.sentiment_very_dissatisfied_rounded,
                          title: l10n.fearGreedExtremeFear,
                          subtitle: l10n.fearGreedTitle,
                          value: fearGreedExtremeFearAlertEnabled,
                          onChanged: (value) {
                            updateSetting(
                              'fearGreedExtremeFearAlertEnabled',
                              value,
                              (next) => fearGreedExtremeFearAlertEnabled = next,
                            );
                          },
                        ),
                        buildAlertSettingTile(
                          icon: Icons.sentiment_very_satisfied_rounded,
                          title: l10n.fearGreedExtremeGreed,
                          subtitle: l10n.fearGreedTitle,
                          value: fearGreedExtremeGreedAlertEnabled,
                          onChanged: (value) {
                            updateSetting(
                              'fearGreedExtremeGreedAlertEnabled',
                              value,
                              (next) =>
                                  fearGreedExtremeGreedAlertEnabled = next,
                            );
                          },
                        ),
                        buildAlertSettingTile(
                          icon: Icons.emoji_events_outlined,
                          title: localizedProfitTargetSettingTitle(
                            Localizations.localeOf(context),
                          ),
                          subtitle: localizedProfitTargetSettingSubtitle(
                            Localizations.localeOf(context),
                          ),
                          value: profitTargetAlertEnabled,
                          onChanged: (value) {
                            updateSetting(
                              'profitTargetAlertEnabled',
                              value,
                              (next) => profitTargetAlertEnabled = next,
                            );
                          },
                        ),
                        buildAlertSettingTile(
                          icon: Icons.campaign_outlined,
                          title: l10n.alertAnnouncementTitle,
                          subtitle: l10n.alertAnnouncementSubtitle,
                          value: announcementAlertEnabled,
                          onChanged: (value) {
                            updateSetting(
                              'announcementAlertEnabled',
                              value,
                              (next) => announcementAlertEnabled = next,
                            );
                          },
                        ),
                        const SizedBox(height: 6),
                        ValueListenableBuilder<int>(
                          valueListenable: coreAlertPurchaseRevision,
                          builder: (context, _, __) {
                            return buildPremiumAlertSettingTile(
                              icon: Icons.trending_up_rounded,
                              title: localizedCoreAlertTitle(
                                Localizations.localeOf(context),
                              ),
                              subtitle: localizedCoreAlertSubtitle(
                                Localizations.localeOf(context),
                              ),
                              lockedText: localizedCoreAlertLockedText(
                                Localizations.localeOf(context),
                              ),
                              purchaseText: coreAlertPurchasePending
                                  ? localizedCoreAlertPurchasePending(
                                      Localizations.localeOf(context),
                                    )
                                  : coreAlertProduct == null
                                      ? localizedCoreAlertPurchaseButton(
                                          Localizations.localeOf(context),
                                        )
                                      : '${localizedCoreAlertPurchaseButton(
                                          Localizations.localeOf(context),
                                        )} ${coreAlertProduct!.price}',
                              purchased: coreAlertPurchased,
                              value: coreAlertEnabled,
                              busy: coreAlertPurchasePending,
                              onPurchase: showCoreAlertPaywallSheet,
                              onChanged: (value) {
                                if (!coreAlertPurchased) {
                                  showCoreAlertPaywallSheet();
                                  return;
                                }

                                updateCoreAlertSetting(value);
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () => launchUrl(
                                Uri.parse(_privacyPolicyUrl),
                                mode: LaunchMode.externalApplication,
                              ),
                              child: const Text('Privacy Policy'),
                            ),
                            TextButton(
                              onPressed: () => launchUrl(
                                Uri.parse(_financialDisclaimerUrl),
                                mode: LaunchMode.externalApplication,
                              ),
                              child: const Text('Financial Disclaimer'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  int dropZoneForPercent(double dropPercent) {
    if (dropPercent <= -50) return 50;
    if (dropPercent <= -40) return 40;
    if (dropPercent <= -30) return 30;
    if (dropPercent <= -20) return 20;
    return 0;
  }

  Future<void> evaluateDropAlerts(double dropPercent) async {
    if (!shouldEvaluateCloseBasedAlertsNow()) return;

    await strategyProgressReady;
    if (!mounted) return;

    final nextZone = dropZoneForPercent(dropPercent);

    if (!dropAlertInitialized) {
      activeDropZone = nextZone;
      touchedMinus20 = nextZone >= 20;
      touchedMinus30 = nextZone >= 30;
      touchedMinus40 = nextZone >= 40;
      touchedMinus50 = nextZone >= 50;
      dropAlertInitialized = true;
      await saveStrategyProgress();
      if (mounted) setState(() {});
      return;
    }

    if (nextZone == activeDropZone) {
      final hasTouchedZone =
          touchedMinus20 || touchedMinus30 || touchedMinus40 || touchedMinus50;
      if (dropPercent >= 0 && hasTouchedZone) {
        touchedMinus20 = false;
        touchedMinus30 = false;
        touchedMinus40 = false;
        touchedMinus50 = false;
        await saveStrategyProgress();
        if (mounted) setState(() {});
      }
      return;
    }

    if (nextZone > activeDropZone) {
      if (activeDropZone < 20 && nextZone >= 20) {
        touchedMinus20 = true;
        if (strategyAlertEnabled) {
          showZoneAlert(
            AppLocalizations.of(context)!.minus20Headline,
            Colors.green,
            'minus20',
          );
        }
      }

      if (activeDropZone < 30 && nextZone >= 30) {
        touchedMinus30 = true;
        if (strategyAlertEnabled) {
          showZoneAlert(
            AppLocalizations.of(context)!.minus30Headline,
            Colors.orange,
            'minus30',
          );
        }
      }

      if (activeDropZone < 40 && nextZone >= 40) {
        touchedMinus40 = true;
        if (strategyAlertEnabled) {
          showZoneAlert(
            AppLocalizations.of(context)!.minus40Headline,
            Colors.red,
            'minus40',
          );
        }
      }

      if (activeDropZone < 50 && nextZone >= 50) {
        touchedMinus50 = true;
        if (strategyAlertEnabled) {
          showZoneAlert(
            AppLocalizations.of(context)!.minus50Headline,
            Colors.purple,
            'minus50',
          );
        }
      }
    } else {
      if (strategyAlertEnabled && activeDropZone >= 50 && nextZone < 50) {
        showZoneAlert(
          AppLocalizations.of(context)!.alertRecovery10,
          Colors.purple,
          'recovery50',
        );
      }

      if (strategyAlertEnabled && activeDropZone >= 40 && nextZone < 40) {
        showZoneAlert(
          AppLocalizations.of(context)!.alertRecovery10,
          Colors.red,
          'recovery40',
        );
      }

      if (strategyAlertEnabled && activeDropZone >= 30 && nextZone < 30) {
        showZoneAlert(
          AppLocalizations.of(context)!.alertRecovery10,
          Colors.orange,
          'recovery30',
        );
      }

      if (strategyAlertEnabled && activeDropZone >= 20 && nextZone < 20) {
        showZoneAlert(
          AppLocalizations.of(context)!.alertRecovery10,
          Colors.green,
          'recovery20',
        );
      }
    }

    activeDropZone = nextZone;
    if (dropPercent >= 0) {
      touchedMinus20 = false;
      touchedMinus30 = false;
      touchedMinus40 = false;
      touchedMinus50 = false;
    }
    await saveStrategyProgress();
    if (mounted) setState(() {});
  }

  int qldMoveStateForPercent(double percent) {
    if (percent >= 4) return 1;
    if (percent <= -4) return -1;
    return 0;
  }

  int qldMoveDownThresholdForPercent(double percent) {
    if (percent <= -4) return 4;
    return 0;
  }

  int qldMoveUpThresholdForPercent(double percent) {
    if (percent >= 4) return 4;
    return 0;
  }

  bool shouldEvaluateCloseBasedAlertsNow() {
    final nowUtc = DateTime.now().toUtc();
    final session = _usMarketSessionFromUtc(nowUtc);
    if (session == _UsMarketSession.pre ||
        session == _UsMarketSession.regular) {
      return false;
    }

    final nowNy = _toNewYorkTime(nowUtc);
    final nyDate = nowNy.toString().substring(0, 10);
    final isTradingDay = nowNy.weekday >= DateTime.monday &&
        nowNy.weekday <= DateTime.friday &&
        !_isUsMarketClosedDate(nyDate);
    if (!isTradingDay) return false;

    final nowNyMinutes = nowNy.hour * 60 + nowNy.minute;
    return nowNyMinutes >= _usMarketCloseMinute(nowNy) + 10;
  }

  Future<void> evaluateQldCloseMoveAlert({
    required List? timestamps,
    required List? closes,
  }) async {
    if (timestamps == null || closes == null) return;

    final nowUtc = DateTime.now().toUtc();
    final session = _usMarketSessionFromUtc(nowUtc);
    if (session == _UsMarketSession.pre ||
        session == _UsMarketSession.regular) {
      return;
    }

    final valid = <({String date, double close})>[];
    final count = math.min(timestamps.length, closes.length);

    for (int i = 0; i < count; i++) {
      final closeValue = closes[i];
      final timestampValue = timestamps[i];
      if (closeValue == null || timestampValue == null) continue;

      final close = (closeValue as num).toDouble();
      if (close <= 0) continue;

      final nyDate = _toNewYorkTime(
        DateTime.fromMillisecondsSinceEpoch(
          (timestampValue as num).toInt() * 1000,
          isUtc: true,
        ),
      ).toString().substring(0, 10);

      valid.add((date: nyDate, close: close));
    }

    if (valid.length < 2) return;

    final today = valid.last;
    final previous = valid[valid.length - 2];
    if (today.date == previous.date || previous.close <= 0) return;

    final nowNy = _toNewYorkTime(nowUtc);
    final nowNyDate = nowNy.toString().substring(0, 10);
    final nowNyMinutes = nowNy.hour * 60 + nowNy.minute;
    final isTodayTradingDay = nowNy.weekday >= DateTime.monday &&
        nowNy.weekday <= DateTime.friday &&
        !_isUsMarketClosedDate(nowNyDate);
    final afterTodayClose =
        isTodayTradingDay && nowNyMinutes >= _usMarketCloseMinute(nowNy) + 10;
    if (afterTodayClose && today.date != nowNyDate) return;

    final percent = ((today.close - previous.close) / previous.close) * 100;
    final nextState = qldMoveStateForPercent(percent);
    final threshold = nextState < 0
        ? qldMoveDownThresholdForPercent(percent)
        : qldMoveUpThresholdForPercent(percent);
    final prefs = await SharedPreferences.getInstance();
    final initialized = prefs.getBool('qldMoveCloseAlertInitialized') ?? false;
    final thresholdKey = nextState < 0
        ? 'lastQldMoveDownThreshold:${today.date}'
        : 'lastQldMoveUpThreshold:${today.date}';
    final savedThreshold = prefs.getInt(thresholdKey) ?? 0;

    if (!initialized) {
      qldMoveCloseState = nextState;
      await prefs.setInt('qldMoveCloseState', nextState);
      await prefs.setBool('qldMoveCloseAlertInitialized', true);
      if (nextState != 0 && threshold > 0) {
        await prefs.setInt(thresholdKey, threshold);
        await prefs.setString('lastQldMoveCloseAlertDate', today.date);
      }
      return;
    }

    qldMoveCloseState = nextState;
    await prefs.setInt('qldMoveCloseState', nextState);

    if (nextState == 0 || threshold == 0 || !mounted) return;
    if (savedThreshold >= threshold) return;

    final enabled = prefs.getBool('qldMoveAlertEnabled') ?? qldMoveAlertEnabled;
    if (!enabled) return;

    await prefs.setInt(thresholdKey, threshold);
    await prefs.setString('lastQldMoveCloseAlertDate', today.date);
    if (!mounted) return;
    final locale = Localizations.localeOf(context);
    showAndSaveAlert(
      nextState > 0
          ? localizedQldMoveUpAlert(locale, percent)
          : localizedQldMoveDownAlert(locale, percent),
      nextState > 0 ? _cyan : Colors.redAccent,
      nextState > 0 ? 'qldMoveUp4' : 'qldMoveDown4',
      detail: localizedSimpleQldMoveAlertDetail(locale),
      eventKey:
          '${nextState > 0 ? 'qldMoveUp4' : 'qldMoveDown4'}:${today.date}',
    );
  }

  Future<void> evaluateMarketOpenAlert(
    _UsMarketSession session,
    SharedPreferences prefs,
  ) async {
    // Alerts are evaluated from closing data only. The market-open toggle is
    // retained for existing installs, but it no longer emits an opening alert.
    if (!marketOpenAlertInitialized) {
      marketOpenAlertInitialized = true;
      await prefs.setBool('marketOpenAlertInitialized', true);
    }
  }

  Future<void> evaluateNasdaq200DayAlert() async {
    if (!shouldEvaluateCloseBasedAlertsNow()) return;

    final result = await _fetchDailyChartFromWorker('^NDX');
    if (result == null) return;

    final indicators = result['indicators'] as Map<String, dynamic>?;
    final quotes = indicators?['quote'] as List?;
    if (quotes == null || quotes.isEmpty) return;

    final quote = quotes.first as Map<String, dynamic>?;
    if (quote == null) return;

    final closes = quote['close'] as List?;
    if (closes == null) return;

    final validCloses = closes
        .where((value) => value != null)
        .map((value) => (value as num).toDouble())
        .toList();

    if (validCloses.length < 200) return;

    final latest = validCloses.last;
    final last200 = validCloses.sublist(validCloses.length - 200);
    final ma200 = last200.reduce((sum, value) => sum + value) / last200.length;
    final nextState = latest >= ma200 ? 1 : -1;

    final prefs = await SharedPreferences.getInstance();
    final savedState = prefs.getInt('nasdaq200State') ?? nasdaq200State;

    if (savedState == 0) {
      nasdaq200State = nextState;
      await prefs.setInt('nasdaq200State', nextState);
      return;
    }

    if (savedState == nextState) return;

    nasdaq200State = nextState;
    await prefs.setInt('nasdaq200State', nextState);

    if (!nasdaq200AlertEnabled || !mounted) return;

    final l10n = AppLocalizations.of(context)!;
    final message = nextState < 0
        ? l10n.alertNasdaq200Breakdown
        : l10n.alertNasdaq200Breakout;

    showZoneAlert(
      message,
      nextState < 0 ? Colors.redAccent : _cyan,
      nextState < 0 ? 'nasdaq200Breakdown' : 'nasdaq200Breakout',
    );
  }

  Future<void> evaluatePortfolioCashAlert() async {
    if (!shouldEvaluateCloseBasedAlertsNow()) return;

    final hasQldPosition = qldShares > 0;
    final hasTqqqPosition = tqqqShares > 0;

    if ((hasQldPosition && qldPrice <= 0) ||
        (hasTqqqPosition && tqqqPrice <= 0)) {
      return;
    }

    final qldValue = qldShares * qldPrice;
    final tqqqValue = tqqqShares * tqqqPrice;
    final stockValue = qldValue + tqqqValue;
    final totalAsset = qldValue + tqqqValue + cashAmount;

    if (totalAsset <= 0 || stockValue <= 0) return;

    final cashPercent = (cashAmount / totalAsset) * 100;
    final nextState = cashPercent <= 20 ? -1 : 0;

    final prefs = await SharedPreferences.getInstance();
    final savedState = prefs.getInt('portfolioCashState') ?? portfolioCashState;
    final initialized = prefs.getBool('portfolioCashAlertInitialized') ?? false;

    if (!initialized) {
      portfolioCashState = nextState;
      await prefs.setInt('portfolioCashState', nextState);
      await prefs.setBool('portfolioCashAlertInitialized', true);
      return;
    }

    if (savedState == nextState) return;

    portfolioCashState = nextState;
    await prefs.setInt('portfolioCashState', nextState);

    if (nextState == 0 || !portfolioCashAlertEnabled || !mounted) return;

    final l10n = AppLocalizations.of(context)!;
    showZoneAlert(
      l10n.alertPortfolioCashLow,
      Colors.orangeAccent,
      'portfolioCashLow',
    );
  }

  int profitTargetMilestone(
    double currentPrice,
    double averagePrice,
  ) {
    if (currentPrice <= 0 || averagePrice <= 0) return 0;

    final profitPercent = ((currentPrice - averagePrice) / averagePrice) * 100;

    if (profitPercent >= 300) return 300;
    if (profitPercent >= 200) return 200;
    if (profitPercent >= 100) return 100;
    if (profitPercent >= 50) return 50;
    return 0;
  }

  Future<void> evaluateProfitTargetAlert() async {
    if (!shouldEvaluateCloseBasedAlertsNow()) return;

    if ((qldAveragePrice > 0 && qldPrice <= 0) ||
        (tqqqAveragePrice > 0 && tqqqPrice <= 0)) {
      return;
    }

    final qldTarget = profitTargetMilestone(qldPrice, qldAveragePrice);
    final tqqqTarget = profitTargetMilestone(tqqqPrice, tqqqAveragePrice);

    if (qldAveragePrice <= 0 && tqqqAveragePrice <= 0) return;

    final prefs = await SharedPreferences.getInstance();
    final initialized = prefs.getBool('profitTargetAlertInitialized') ?? false;
    final savedQldTarget =
        prefs.getInt('qldProfitTargetState') ?? qldProfitTargetState;
    final savedTqqqTarget =
        prefs.getInt('tqqqProfitTargetState') ?? tqqqProfitTargetState;

    if (!initialized) {
      qldProfitTargetState = qldTarget;
      tqqqProfitTargetState = tqqqTarget;
      await prefs.setInt('qldProfitTargetState', qldTarget);
      await prefs.setInt('tqqqProfitTargetState', tqqqTarget);
      await prefs.setBool('profitTargetAlertInitialized', true);
      return;
    }

    final nextQldSavedTarget = math.max(savedQldTarget, qldTarget);
    final nextTqqqSavedTarget = math.max(savedTqqqTarget, tqqqTarget);

    qldProfitTargetState = nextQldSavedTarget;
    tqqqProfitTargetState = nextTqqqSavedTarget;
    await prefs.setInt('qldProfitTargetState', nextQldSavedTarget);
    await prefs.setInt('tqqqProfitTargetState', nextTqqqSavedTarget);

    if (!profitTargetAlertEnabled || !mounted) return;

    final locale = Localizations.localeOf(context);

    if (qldTarget > savedQldTarget) {
      showAndSaveAlert(
        localizedProfitTargetMessage(locale, 'QLD', qldTarget),
        Colors.lightGreenAccent,
        'profitTargetQld$qldTarget',
        detail: localizedProfitTargetDetail(locale, 'QLD', qldTarget),
      );
    }

    if (tqqqTarget > savedTqqqTarget) {
      showAndSaveAlert(
        localizedProfitTargetMessage(locale, 'TQQQ', tqqqTarget),
        Colors.lightGreenAccent,
        'profitTargetTqqq$tqqqTarget',
        detail: localizedProfitTargetDetail(locale, 'TQQQ', tqqqTarget),
      );
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    contentWidgetHideTimer?.cancel();
    homeScrollController.removeListener(showContentWidgetButtonTemporarily);
    _blinkController.dispose();
    priceTimer?.cancel();
    priceRefreshCountdownTimer?.cancel();
    yahooHistoryTimer?.cancel();
    nasdaq200Timer?.cancel();
    fearGreedTimer?.cancel();
    quoteStreamReconnectTimer?.cancel();
    quoteStreamSubscription?.cancel();
    quoteStreamChannel?.sink.close();
    coreAlertPurchaseSubscription?.cancel();
    coreAlertPurchaseRevision.dispose();

    qldController.dispose();
    tqqqController.dispose();
    cashController.dispose();
    qldAverageController.dispose();
    tqqqAverageController.dispose();
    lumpSumInvestmentController.dispose();
    lumpSumYearsController.dispose();
    monthlyInvestmentController.dispose();
    monthlyInvestmentYearsController.dispose();
    returnRateController.dispose();
    closeGuessIdController.dispose();
    closeGuessPriceController.dispose();
    closeGuessMessageController.dispose();
    homeScrollController.dispose();
    _exitDialogBannerAd?.dispose();
    if (_activeHomeScrollController == homeScrollController) {
      _activeHomeScrollController = null;
    }

    super.dispose();
  }

  void _preloadExitDialogBannerAd() {
    if (!canRequestAds || _exitDialogBannerAd != null) return;

    final bannerAd = BannerAd(
      adUnitId: _adMobExitUnitId,
      size: AdSize.mediumRectangle,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted || ad != _exitDialogBannerAd) {
            ad.dispose();
            return;
          }
          setState(() {
            _exitDialogBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Exit AdMob failed to load: $error');
          ad.dispose();
          if (_exitDialogBannerAd == ad) {
            _exitDialogBannerAd = null;
            _exitDialogBannerAdLoaded = false;
          }
          Future.delayed(const Duration(seconds: 12), () {
            if (mounted && _exitDialogBannerAd == null) {
              _preloadExitDialogBannerAd();
            }
          });
        },
      ),
    );

    _exitDialogBannerAd = bannerAd;
    _exitDialogBannerAdLoaded = false;
    unawaited(bannerAd.load());
  }

  BannerAd? _takePreloadedExitDialogBannerAd() {
    if (!_exitDialogBannerAdLoaded) {
      _preloadExitDialogBannerAd();
      return null;
    }

    final bannerAd = _exitDialogBannerAd;
    _exitDialogBannerAd = null;
    _exitDialogBannerAdLoaded = false;
    _preloadExitDialogBannerAd();
    return bannerAd;
  }

  void showContentWidgetButtonTemporarily() {
    if (!mounted || isLoading) return;

    contentWidgetHideTimer?.cancel();
    if (!showContentWidgetButton) {
      setState(() {
        showContentWidgetButton = true;
      });
    }

    contentWidgetHideTimer = Timer(const Duration(seconds: 5), () {
      if (!mounted) return;
      setState(() {
        showContentWidgetButton = false;
      });
    });
  }

  Future<void> fetchCurrentPrices({bool force = false}) async {
    final session = _usMarketSessionFromUtc(DateTime.now().toUtc());
    final prefs = await SharedPreferences.getInstance();

    if (quoteStreamConnected && !force) {
      final results = await Future.wait([
        fetchQuote(_vixQuoteSymbol),
        fetchQuote(_tenYearYieldQuoteSymbol),
      ]);
      final vixQuote = results[0];
      final tenYearQuote = results[1];
      if (!mounted || (vixQuote == null && tenYearQuote == null)) return;

      final nextVixPrice = vixQuote == null
          ? vixPrice
          : displayPriceForSession(vixQuote, session);
      final nextTenYearYield = tenYearQuote == null
          ? tenYearYield
          : displayPriceForSession(tenYearQuote, session);
      setState(() {
        vixPrice = nextVixPrice;
        tenYearYield = nextTenYearYield;
      });
      if (nextVixPrice > 0) {
        await prefs.setDouble('lastVixPrice', nextVixPrice);
      }
      if (nextTenYearYield > 0) {
        await prefs.setDouble('lastTenYearYield', nextTenYearYield);
      }
      return;
    }

    if (mounted) {
      setState(() {
        isRefreshingPrice = true;
      });
    }

    await evaluateMarketOpenAlert(session, prefs);

    final results = await Future.wait([
      fetchQuote('QLD'),
      fetchQuote('TQQQ'),
      fetchQuote(_futuresQuoteSymbol),
      fetchQuote(_vixQuoteSymbol),
      fetchQuote(_tenYearYieldQuoteSymbol),
    ]);
    final qldQuote = results[0];
    final tqqqQuote = results[1];
    final futuresQuote = results[2];
    final vixQuote = results[3];
    final tenYearQuote = results[4];

    await applyCurrentQuotes(
      qldQuote,
      tqqqQuote,
      futuresQuote,
      vixQuote,
      tenYearQuote,
      session,
      prefs,
    );
  }

  void startQuoteStream() {
    quoteStreamReconnectTimer?.cancel();
    quoteStreamSubscription?.cancel();
    quoteStreamChannel?.sink.close();

    try {
      final channel = WebSocketChannel.connect(Uri.parse(_quoteStreamUrl));
      quoteStreamChannel = channel;
      quoteStreamSubscription = channel.stream.listen(
        (message) {
          quoteStreamConnected = true;
          unawaited(handleQuoteStreamMessage(message));
        },
        onError: (_) {
          quoteStreamConnected = false;
          scheduleQuoteStreamReconnect();
        },
        onDone: () {
          quoteStreamConnected = false;
          scheduleQuoteStreamReconnect();
        },
        cancelOnError: true,
      );
    } catch (_) {
      quoteStreamConnected = false;
      scheduleQuoteStreamReconnect();
    }
  }

  void scheduleQuoteStreamReconnect() {
    if (!mounted || quoteStreamReconnectTimer?.isActive == true) return;

    final seconds = 30 + math.Random().nextInt(8);
    quoteStreamReconnectTimer = Timer(Duration(seconds: seconds), () {
      if (mounted) startQuoteStream();
    });
  }

  void startPriceRefreshCountdown() {
    priceRefreshCountdownTimer?.cancel();
    priceRefreshCountdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => updatePriceRefreshCountdown(),
    );
    updatePriceRefreshCountdown();
  }

  int currentPriceRefreshCountdownSeconds() {
    if (lastAppliedQuoteTimestamp <= 0) return _priceRefreshIntervalSeconds;

    final elapsedSeconds = math.max(
      0,
      ((DateTime.now().millisecondsSinceEpoch - lastAppliedQuoteTimestamp) /
              1000)
          .floor(),
    );
    return math.max(0, _priceRefreshIntervalSeconds - elapsedSeconds);
  }

  void updatePriceRefreshCountdown() {
    if (!mounted) return;

    final nextSeconds = currentPriceRefreshCountdownSeconds();
    if (nextSeconds == priceRefreshCountdownSeconds) return;

    setState(() {
      priceRefreshCountdownSeconds = nextSeconds;
    });
  }

  FinnhubQuote? quoteFromStream(dynamic raw) {
    if (raw is! Map) return null;

    final currentPrice = _numberToDouble(raw['currentPrice'] ?? raw['c']);
    final previousClose = _numberToDouble(raw['previousClose'] ?? raw['pc']);
    final preMarketPrice = _numberToDouble(raw['preMarketPrice']);
    final postMarketPrice = _numberToDouble(raw['postMarketPrice']);
    final regularMarketPrice = _numberToDouble(raw['regularMarketPrice']);
    final displayCurrentPrice =
        regularMarketPrice > 0 ? regularMarketPrice : currentPrice;
    if (displayCurrentPrice <= 0) return null;

    return FinnhubQuote(
      currentPrice: displayCurrentPrice,
      previousClose: previousClose,
      source: raw['source']?.toString() ?? 'quote-stream',
      preMarketPrice: preMarketPrice,
      postMarketPrice: postMarketPrice,
      regularMarketPrice: regularMarketPrice,
    );
  }

  Future<void> handleQuoteStreamMessage(dynamic message) async {
    if (isApplyingStreamQuote) return;
    isApplyingStreamQuote = true;

    try {
      final data = jsonDecode(message.toString()) as Map<String, dynamic>;
      if (data['type'] != 'quotes') return;
      final quoteTimestamp = _numberToDouble(data['timestamp']).toInt();
      if (!shouldApplyQuoteTimestamp(
        quoteTimestamp,
        lastAppliedQuoteTimestamp,
      )) {
        return;
      }

      final qldQuote = quoteFromStream(data['qld']);
      final tqqqQuote = quoteFromStream(data['tqqq']);
      final futuresQuote = quoteFromStream(data['futures']);
      final session = _usMarketSessionFromUtc(DateTime.now().toUtc());
      final prefs = await SharedPreferences.getInstance();
      await evaluateMarketOpenAlert(session, prefs);
      await applyCurrentQuotes(
        qldQuote,
        tqqqQuote,
        futuresQuote,
        null,
        null,
        session,
        prefs,
        quoteTimestamp: quoteTimestamp,
      );
    } catch (error) {
      debugPrint('Quote stream message failed: $error');
    } finally {
      isApplyingStreamQuote = false;
    }
  }

  Future<void> applyCurrentQuotes(
    FinnhubQuote? qldQuote,
    FinnhubQuote? tqqqQuote,
    FinnhubQuote? futuresQuote,
    FinnhubQuote? vixQuote,
    FinnhubQuote? tenYearQuote,
    _UsMarketSession session,
    SharedPreferences prefs, {
    int? quoteTimestamp,
  }) async {
    if (!mounted) return;

    var nextQldPrice = qldPrice;
    var nextTqqqPrice = tqqqPrice;
    var nextQldPreviousClose = qldPreviousClose;
    var nextFuturesPrice = futuresPrice;
    var nextFuturesPreviousClose = futuresPreviousClose;
    var nextFuturesBaselinePrice = futuresBaselinePrice;
    var nextFuturesBaselineDate = futuresBaselineDate;
    var nextVixPrice = vixPrice;
    var nextTenYearYield = tenYearYield;
    var nextIsPriceUp = isPriceUp;

    if (qldQuote != null) {
      nextQldPrice = displayPriceForSession(qldQuote, session);
      if (qldQuote.previousClose > 0) {
        nextQldPreviousClose = qldQuote.previousClose;
      }
      nextIsPriceUp =
          qldQuote.previousClose <= 0 || nextQldPrice >= qldQuote.previousClose;
    } else {
      debugPrint('QLD Finnhub failed, keeping last price: $qldPrice');
    }

    if (tqqqQuote != null) {
      nextTqqqPrice = displayPriceForSession(tqqqQuote, session);
    } else {
      debugPrint('TQQQ Finnhub failed, keeping last price: $tqqqPrice');
    }

    if (futuresQuote != null) {
      nextFuturesPrice = displayPriceForSession(futuresQuote, session);
      if (futuresQuote.previousClose > 0) {
        nextFuturesPreviousClose = futuresQuote.previousClose;
      }
      final nowUtc = DateTime.now().toUtc();
      if (_isAfterKstFuturesStart(nowUtc) &&
          _isUsMarketOpenDayForFuturesFromUtc(nowUtc) &&
          _isUsTechFuturesSessionFromUtc(nowUtc)) {
        final baselineDate = _kstFuturesBaselineDate();
        final preferredBaselinePrice = nextFuturesPreviousClose > 0
            ? nextFuturesPreviousClose
            : nextFuturesPrice;
        final baselineMismatch = preferredBaselinePrice > 0 &&
            nextFuturesBaselinePrice > 0 &&
            ((nextFuturesBaselinePrice - preferredBaselinePrice).abs() /
                    preferredBaselinePrice) >
                0.001;
        if (nextFuturesBaselineDate != baselineDate ||
            nextFuturesBaselinePrice <= 0 ||
            baselineMismatch) {
          nextFuturesBaselineDate = baselineDate;
          nextFuturesBaselinePrice = preferredBaselinePrice;
        }
      }
    } else {
      debugPrint(
          '$_futuresQuoteSymbol Yahoo failed, keeping last futures price: $futuresPrice');
    }

    if (vixQuote != null) {
      nextVixPrice = displayPriceForSession(vixQuote, session);
    } else if (!quoteStreamConnected) {
      debugPrint(
        '$_vixQuoteSymbol Yahoo failed, keeping last VIX price: $vixPrice',
      );
    }

    if (tenYearQuote != null) {
      nextTenYearYield = displayPriceForSession(tenYearQuote, session);
    } else if (!quoteStreamConnected) {
      debugPrint(
        '$_tenYearYieldQuoteSymbol Yahoo failed, keeping last 10Y yield: $tenYearYield',
      );
    }

    final hasFreshPrice = qldQuote != null ||
        tqqqQuote != null ||
        futuresQuote != null ||
        vixQuote != null ||
        tenYearQuote != null;
    final appliedTimestamp = hasFreshPrice
        ? quoteTimestamp ?? DateTime.now().millisecondsSinceEpoch
        : 0;

    if (hasFreshPrice &&
        !shouldApplyQuoteTimestamp(
          appliedTimestamp,
          lastAppliedQuoteTimestamp,
        )) {
      return;
    }

    setState(() {
      qldPrice = nextQldPrice;
      tqqqPrice = nextTqqqPrice;
      qldPreviousClose = nextQldPreviousClose;
      futuresPrice = nextFuturesPrice;
      futuresPreviousClose = nextFuturesPreviousClose;
      futuresBaselinePrice = nextFuturesBaselinePrice;
      futuresBaselineDate = nextFuturesBaselineDate;
      vixPrice = nextVixPrice;
      tenYearYield = nextTenYearYield;
      isPreMarket = session == _UsMarketSession.pre;
      isRegularMarket = session == _UsMarketSession.regular;
      isAfterHours = session == _UsMarketSession.afterHours;
      isPriceUp = nextIsPriceUp;
      latestDate = DateTime.now().toString().substring(0, 10);
      isLoading = false;
      isRefreshingPrice = false;
      isUsingCachedPrice = !hasFreshPrice && (qldPrice > 0 || tqqqPrice > 0);
      if (hasFreshPrice) {
        lastAppliedQuoteTimestamp = appliedTimestamp;
        priceRefreshCountdownSeconds = _priceRefreshIntervalSeconds;
      }
      if (qldQuote != null) {
        qldMiniCandles = _qldMiniCandlesWithRealtimeClose(
          qldMiniCandles,
          nextQldPrice,
        );
      }
    });

    await saveCachedPrices(
      qld: qldPrice,
      tqqq: tqqqPrice,
      futures: futuresPrice,
      futuresPrevious: futuresPreviousClose,
      futuresBaseline: futuresBaselinePrice,
      futuresBaselineDay: futuresBaselineDate,
      vix: vixPrice,
      tenYear: tenYearYield,
      priceUp: isPriceUp,
      updatedAt: lastAppliedQuoteTimestamp,
    );

    await evaluateNewHighAlertFromCurrentPrice(prefs);
    await evaluatePortfolioCashAlert();
    await evaluateProfitTargetAlert();

    if (basePrice > 0 && qldPrice > 0) {
      final nextDropPercent = ((qldPrice - basePrice) / basePrice) * 100;
      await evaluateDropAlerts(nextDropPercent);
    }
  }

  double displayPriceForSession(FinnhubQuote quote, _UsMarketSession session) {
    return quote.currentPrice;
  }

  Future<void> evaluateNewHighAlertFromCurrentPrice(
    SharedPreferences prefs,
  ) async {
    if (!shouldEvaluateCloseBasedAlertsNow()) return;
    if (qldPrice <= 0) return;

    final referenceHigh = basePrice > 0 ? basePrice : allTimeHigh;
    final isNewHigh = referenceHigh > 0 && qldPrice > referenceHigh;
    final today =
        _toNewYorkTime(DateTime.now().toUtc()).toString().substring(0, 10);

    if (!isNewHigh) return;

    final savedHighAlertDate =
        prefs.getString('lastHighAlertDate') ?? lastHighAlertDate;

    if (highAlertEnabled && savedHighAlertDate != today) {
      lastHighAlertDate = today;
      await prefs.setString('lastHighAlertDate', today);
      if (!mounted) return;
      showZoneAlert(
        AppLocalizations.of(context)!.alertNewHigh,
        Colors.green,
        'high',
      );
    }
  }

  List<QldMiniCandle> buildQldMiniCandles({
    required List? opens,
    required List? highs,
    required List? lows,
    required List? closes,
  }) {
    if (opens == null ||
        highs == null ||
        lows == null ||
        closes == null ||
        closes.isEmpty) {
      return const [];
    }

    final validCandles = <QldMiniCandle>[];
    final rollingCloses = <double>[];
    final length = math
        .min(
          math.min(opens.length, highs.length),
          math.min(lows.length, closes.length),
        )
        .toInt();

    for (int i = 0; i < length; i++) {
      final open = _numberToDouble(opens[i]);
      final high = _numberToDouble(highs[i]);
      final low = _numberToDouble(lows[i]);
      final close = _numberToDouble(closes[i]);

      if (open <= 0 || high <= 0 || low <= 0 || close <= 0) {
        continue;
      }

      rollingCloses.add(close);
      final ma20 = rollingCloses.length >= 20
          ? rollingCloses
                  .skip(rollingCloses.length - 20)
                  .fold<double>(0, (sum, value) => sum + value) /
              20
          : null;
      final ma200 = rollingCloses.length >= 200
          ? rollingCloses
                  .skip(rollingCloses.length - 200)
                  .fold<double>(0, (sum, value) => sum + value) /
              200
          : null;

      validCandles.add(
        QldMiniCandle(
          open: open,
          high: math.max(high, math.max(open, close)),
          low: math.min(low, math.min(open, close)),
          close: close,
          ma20: ma20,
          ma200: ma200,
        ),
      );
    }

    const visibleTradingDays = 66;
    if (validCandles.length <= visibleTradingDays) return validCandles;
    return validCandles.sublist(validCandles.length - visibleTradingDays);
  }

  void refreshQldHistoricalReferenceOnSchedule() {
    final now = DateTime.now();
    const interval = Duration(hours: 1);
    final lastRefresh = lastHistoricalReferenceRefreshAt;

    if (lastRefresh != null && now.difference(lastRefresh) < interval) {
      return;
    }

    fetchQldHistoricalReference();
  }

  Future<void> fetchQldHistoricalReference() async {
    try {
      final result = await _fetchChartFromWorker('QLD');

      if (result == null) {
        debugPrint('Yahoo historical QLD failed, keeping previous basePrice');
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
        return;
      }

      final timestamps = result['timestamp'] as List?;
      final indicators = result['indicators'] as Map<String, dynamic>?;
      final quoteList = indicators?['quote'] as List?;
      final quote = quoteList != null && quoteList.isNotEmpty
          ? quoteList.first as Map<String, dynamic>?
          : null;
      final opens = quote?['open'] as List?;
      final highs = quote?['high'] as List?;
      final lows = quote?['low'] as List?;
      final closes = quote?['close'] as List?;
      final miniCandles = buildQldMiniCandles(
        opens: opens,
        highs: highs,
        lows: lows,
        closes: closes,
      );

      if (timestamps == null || highs == null || highs.isEmpty) {
        debugPrint('Yahoo historical QLD response missing highs');
        return;
      }

      await evaluateQldCloseMoveAlert(
        timestamps: timestamps,
        closes: closes,
      );

      double highestPrice = 0;
      int highestIndex = 0;

      for (int i = 0; i < highs.length; i++) {
        final high = highs[i];
        if (high != null && high > highestPrice) {
          highestPrice = (high as num).toDouble();
          highestIndex = i;
        }
      }

      if (highestPrice <= 0) return;

      final now = DateTime.now();
      final shouldRefreshHighDate = lastHighDateRefreshAt == null ||
          now.difference(lastHighDateRefreshAt!) >= const Duration(hours: 6) ||
          highDate.isEmpty;
      final highDateTime = DateTime.fromMillisecondsSinceEpoch(
        (timestamps[highestIndex] as num).toInt() * 1000,
      );

      final prefs = await SharedPreferences.getInstance();
      allTimeHigh = highestPrice;
      await prefs.setDouble(_storedTenYearHighKey, highestPrice);

      if (!mounted) return;

      setState(() {
        lastHistoricalReferenceRefreshAt = now;
        basePrice = allTimeHigh;
        qldMiniCandles = _qldMiniCandlesWithRealtimeClose(
          miniCandles,
          qldPrice,
        );
        if (shouldRefreshHighDate) {
          if (highestPrice >= allTimeHigh || highDate.isEmpty) {
            highDate = highDateTime.toString().substring(0, 10);
          }
          lastHighDateRefreshAt = now;
        }
        isLoading = false;
      });

      if (basePrice > 0 && qldPrice > 0) {
        final nextDropPercent = ((qldPrice - basePrice) / basePrice) * 100;
        await evaluateDropAlerts(nextDropPercent);
      }
    } catch (error) {
      debugPrint('Yahoo historical QLD unavailable: $error');
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> openTradingView() async {
    final Uri uri = tradingViewSymbolOverviewUri('AMEX-QLD');

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception(
        'Could not launch $uri',
      );
    }
  }

  Future<void> openVixTradingView() async {
    final Uri uri = tradingViewSymbolOverviewUri('TVC-VIX');

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception(
        'Could not launch $uri',
      );
    }
  }

  Future<void> openTenYearYieldTradingView() async {
    final Uri uri = tradingViewSymbolOverviewUri('TVC-TNX');

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception(
        'Could not launch $uri',
      );
    }
  }

  Future<void> openQldTenYearChart() async {
    final Uri uri = tradingViewSymbolOverviewUri(
      'AMEX-QLD',
      range: '120M',
    );

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception(
        'Could not launch $uri',
      );
    }
  }

  void showBasePositionInfo() {
    final l10n = AppLocalizations.of(context)!;
    final whiteMode = isWhiteModeEnabled(context);
    final sheetBg = whiteMode ? _lightSurface : const Color(0xFF111D2C);
    final handleColor = whiteMode ? _lightLine : Colors.white24;
    final primaryText = whiteMode ? _lightText : Colors.white;
    final secondaryText = whiteMode ? _lightMuted : Colors.white70;
    final accent = whiteMode ? _lightCyan : _cyan;
    final cardBg = whiteMode ? const Color(0xFFF8FAFC) : _darkSurfaceSoft;
    final cardLine = whiteMode ? _lightLine : _darkLineSoft;

    Widget allocationChip(String label, String value, Color color) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: whiteMode ? 0.10 : 0.14),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: color.withValues(alpha: 0.26)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  color: primaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget principleTile(IconData icon, String title, String body) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cardLine),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: accent.withValues(alpha: whiteMode ? 0.10 : 0.14),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: accent, size: 19),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    body,
                    style: TextStyle(
                      color: secondaryText,
                      fontSize: 13,
                      height: 1.45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.86,
          minChildSize: 0.35,
          maxChildSize: 0.95,
          snap: true,
          snapSizes: const [0.35, 0.86, 0.95],
          shouldCloseOnMinExtent: true,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: sheetBg,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                border: whiteMode ? Border.all(color: _lightLine) : null,
              ),
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 42,
                          height: 4,
                          decoration: BoxDecoration(
                            color: handleColor,
                            borderRadius: BorderRadius.circular(99),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: accent.withValues(
                                  alpha: whiteMode ? 0.10 : 0.16),
                            ),
                            child: Icon(
                              Icons.shield_outlined,
                              color: accent,
                              size: 26,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              l10n.basePosition,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        l10n.basePositionIntro,
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.55,
                          color: secondaryText,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          allocationChip(
                            l10n.basePositionQldAllocationLabel,
                            '70%',
                            accent,
                          ),
                          const SizedBox(width: 10),
                          allocationChip(
                            l10n.basePositionCashAllocationLabel,
                            '30%',
                            whiteMode
                                ? const Color(0xFFD97706)
                                : Colors.amberAccent,
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        l10n.basePositionCorePrinciple,
                        style: TextStyle(
                          color: primaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 10),
                      principleTile(
                        Icons.savings_outlined,
                        l10n.basePositionCashTitle,
                        l10n.basePositionCashText,
                      ),
                      const SizedBox(height: 10),
                      principleTile(
                        Icons.speed_rounded,
                        l10n.basePositionInitialLeverageTitle,
                        l10n.basePositionInitialLeverageText,
                      ),
                      const SizedBox(height: 10),
                      principleTile(
                        Icons.stacked_line_chart_rounded,
                        l10n.basePositionStepLeverageTitle,
                        l10n.basePositionStepLeverageText,
                      ),
                      const SizedBox(height: 10),
                      principleTile(
                        Icons.trending_down_rounded,
                        l10n.basePositionLowAverageTitle,
                        l10n.basePositionLowAverageText,
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color:
                              accent.withValues(alpha: whiteMode ? 0.08 : 0.12),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: accent.withValues(
                                alpha: whiteMode ? 0.20 : 0.28),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.basePositionSummaryTitle,
                              style: TextStyle(
                                color: primaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              l10n.basePositionSummaryText,
                              style: TextStyle(
                                color: secondaryText,
                                fontSize: 13,
                                height: 1.45,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showUsageGuideInfo() {
    final l10n = AppLocalizations.of(context)!;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => UsageGuidePage(l10n: l10n),
      ),
    );
  }

  Future<void> showExitAdDialog() async {
    if (exitDialogOpen || !mounted) return;
    exitDialogOpen = true;
    final exitDialogBannerAd = _takePreloadedExitDialogBannerAd();

    try {
      final l10n = AppLocalizations.of(context)!;
      final whiteMode = isWhiteModeEnabled(context);
      final dialogBg = whiteMode ? _lightSurface : _darkSurface;
      final borderColor = whiteMode ? _lightLine : _darkLineSoft;

      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) {
          return Dialog(
            backgroundColor: dialogBg,
            insetPadding: const EdgeInsets.symmetric(horizontal: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: borderColor),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ExitDialogBannerAd(ad: exitDialogBannerAd),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                          },
                          child: Text(l10n.exitAdDialogBack),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                            SystemNavigator.pop();
                          },
                          child: Text(l10n.exitAdDialogExit),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    } finally {
      exitDialogOpen = false;
      exitDialogBannerAd?.dispose();
      _preloadExitDialogBannerAd();
    }
  }

  @override
  Widget build(BuildContext context) {
    double dropPercent = 0;

    if (basePrice > 0) {
      dropPercent = ((qldPrice - basePrice) / basePrice) * 100;
    }
    final double previousCloseChange = qldPreviousClose > 0 && qldPrice > 0
        ? qldPrice - qldPreviousClose
        : 0.0;
    final double previousClosePercent = qldPreviousClose > 0
        ? (previousCloseChange / qldPreviousClose) * 100
        : 0.0;
    final previousCloseColor = qldPreviousClose <= 0 || qldPrice <= 0
        ? Colors.white38
        : previousCloseChange >= 0
            ? _portfolioGainGreen
            : _portfolioLossRed;
    final nextMajorSchedule = _nextMajorUsSchedule();
    final nowUtc = DateTime.now().toUtc();
    final currentMarketSession = _usMarketSessionFromUtc(nowUtc);
    final shouldZeroFutures =
        currentMarketSession == _UsMarketSession.regular ||
            !_isAfterKstFuturesStart(nowUtc) ||
            !_isUsMarketOpenDayForFuturesFromUtc(nowUtc) ||
            !_isUsTechFuturesSessionFromUtc(nowUtc);
    final futuresReferencePrice =
        futuresPreviousClose > 0 ? futuresPreviousClose : futuresBaselinePrice;
    final futuresPercent = shouldZeroFutures
        ? 0.0
        : futuresReferencePrice > 0 && futuresPrice > 0
            ? ((futuresPrice - futuresReferencePrice) / futuresReferencePrice) *
                100 *
                2
            : 0.0;
    String signedPriceChangeAmountText(double amount) {
      if (qldPreviousClose <= 0 || qldPrice <= 0) return '--';
      final sign = amount > 0
          ? '+'
          : amount < 0
              ? '-'
              : '';
      return '$sign\$${amount.abs().toStringAsFixed(2)}';
    }

    String signedPriceChangePercentText(double percent) {
      if (qldPreviousClose <= 0 || qldPrice <= 0) return '';
      final sign = percent > 0
          ? '+'
          : percent < 0
              ? '-'
              : '';
      return '($sign${percent.abs().toStringAsFixed(2)}%)';
    }

    double extendedSessionPercentValue() {
      return shouldZeroFutures ? 0.0 : futuresPercent;
    }

    double extendedSessionReferencePrice() {
      if (qldPrice <= 0) return 0;
      return qldPrice * (1 + extendedSessionPercentValue() / 100);
    }

    String extendedSessionPriceText() {
      final referencePrice = extendedSessionReferencePrice();
      if (referencePrice <= 0) return '--';
      return '\$${referencePrice.toStringAsFixed(2)}';
    }

    String extendedSessionPercentText() {
      final referencePrice = extendedSessionReferencePrice();
      if (referencePrice <= 0) return '';
      final percent = extendedSessionPercentValue();
      final sign = percent > 0
          ? '+'
          : percent < 0
              ? '-'
              : '';
      return '($sign${percent.abs().toStringAsFixed(2)}%)';
    }

    final qldValue = qldShares * qldPrice;

    final tqqqValue = tqqqShares * tqqqPrice;

    final totalAsset = qldValue + tqqqValue + cashAmount;
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : _appBg;
    final cardBg = whiteMode ? _lightSurface : _cardBg;
    final cardLine = whiteMode ? _lightLine : _cardLine;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;
    final tertiaryText = whiteMode ? const Color(0xFF94A3B8) : _darkFaint;
    final accentBlue = whiteMode ? _lightBlue : _blue;
    final accentCyan = whiteMode ? _lightCyan : _cyan;
    final futuresPercentColor = shouldZeroFutures
        ? tertiaryText
        : futuresReferencePrice <= 0 || futuresPrice <= 0
            ? tertiaryText
            : futuresPercent >= 0
                ? _portfolioGainGreen
                : _portfolioLossRed;
    final showSunFuturesIcon = !shouldZeroFutures;
    final futuresIconColor =
        showSunFuturesIcon ? Colors.amberAccent : futuresPercentColor;
    final extendedSessionPercent = extendedSessionPercentValue();
    final extendedSessionPercentColor = extendedSessionPercent > 0
        ? _portfolioGainGreen
        : extendedSessionPercent < 0
            ? _portfolioLossRed
            : tertiaryText;
    final homeInfoLabelStyle = TextStyle(
      fontSize: 11.2,
      color: tertiaryText,
      fontWeight: FontWeight.w600,
    );
    final homeInfoValueStyle = TextStyle(
      fontSize: 11.2,
      color: secondaryText,
      fontWeight: FontWeight.w700,
    );
    final homeInfoEmphasisValueStyle = homeInfoValueStyle.copyWith(
      fontSize: 12.0,
    );
    final homeFearGreedScore = homeFearGreedData?.score;
    final fearGreedValue = homeFearGreedScore?.toStringAsFixed(0) ?? '--';
    final fearGreedValueColor = homeFearGreedScore == null
        ? secondaryText
        : fearGreedColorForScore(homeFearGreedScore);
    final vixValueColor = vixPrice <= 0
        ? secondaryText
        : vixPrice >= 20
            ? _portfolioLossRed
            : accentBlue;
    final vixValue = vixPrice > 0 ? vixPrice.toStringAsFixed(1) : '--';
    final scheduleLabel = nextMajorSchedule?.title ?? 'CPI';
    final scheduleValue = nextMajorSchedule == null
        ? '--'
        : _scheduleDdayLabel(nextMajorSchedule.date);
    final scheduleValueColor = nextMajorSchedule == null
        ? secondaryText
        : _daysUntilSchedule(nextMajorSchedule.date) <= 7
            ? _portfolioLossRed
            : whiteMode
                ? const Color(0xFFD97706)
                : Colors.amberAccent;
    final tenYearYieldValue =
        tenYearYield > 0 ? '${tenYearYield.toStringAsFixed(2)}%' : '--';
    final tenYearYieldColor = tenYearYield <= 0
        ? secondaryText
        : whiteMode
            ? const Color(0xFF0F766E)
            : accentCyan;

    Widget buildInlineInfoSegment({
      required String label,
      required String value,
      required Color valueColor,
      TextStyle? valueStyle,
      VoidCallback? onTap,
    }) {
      final text = FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: RichText(
          maxLines: 1,
          text: TextSpan(
            children: [
              TextSpan(text: '$label ', style: homeInfoLabelStyle),
              TextSpan(
                text: value,
                style: (valueStyle ?? homeInfoValueStyle).copyWith(
                  color: valueColor,
                ),
              ),
            ],
          ),
        ),
      );

      if (onTap == null) return text;

      return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: text,
      );
    }

    final cardShadow = whiteMode
        ? [
            BoxShadow(
              color: const Color(0xFF0F172A).withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ]
        : [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.30),
              blurRadius: 22,
              offset: const Offset(0, 12),
            ),
          ];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        final primaryFocus = FocusManager.instance.primaryFocus;
        if (primaryFocus != null && !primaryFocus.hasPrimaryFocus) {
          primaryFocus.unfocus();
          return;
        }

        unawaited(showExitAdDialog());
      },
      child: Scaffold(
        backgroundColor: pageBg,
        extendBody: false,
        appBar: AppBar(
          toolbarHeight: 48,
          automaticallyImplyLeading: false,
          titleSpacing: 12,
          title: Row(
            children: [
              AnimatedBuilder(
                animation: _blinkAnimation,
                builder: (context, child) {
                  final pulse = _blinkAnimation.value;
                  final color = Color.lerp(
                        _commentGreen.withValues(alpha: 0.58),
                        _commentGreen,
                        pulse,
                      ) ??
                      _commentGreen;

                  return IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                    icon: Icon(
                      Icons.notifications_active_rounded,
                      color: color.withValues(alpha: 0.58 + pulse * 0.42),
                      size: 19,
                    ),
                    onPressed: showAlertSettingsSheet,
                  );
                },
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: showAlertTestSheet,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color:
                        whiteMode ? const Color(0xFFF1F5F9) : _darkSurfaceSoft,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color:
                          whiteMode ? const Color(0xFFCBD5E1) : _darkLineSoft,
                    ),
                  ),
                  child: Text(
                    'TEST',
                    style: TextStyle(
                      color: whiteMode ? _lightText : _darkMuted,
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'QLD DIP ALERT',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 40,
                child: buildWhiteModeButton(context, iconSize: 20),
              ),
              SizedBox(
                width: 40,
                child: buildLanguageMenuButton(context, iconSize: 20),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: whiteMode ? _lightAppBg : _appBg,
          elevation: 0,
        ),
        bottomNavigationBar: buildFixedAdBottomBar(
          _buildBottomNav(dropPercent),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 4),
          child: IgnorePointer(
            ignoring: !showContentWidgetButton,
            child: AnimatedOpacity(
              opacity: showContentWidgetButton ? 1 : 0,
              duration: const Duration(milliseconds: 650),
              curve: Curves.easeInOutCubic,
              child: buildCloseGuessRankingCard(),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: whiteMode ? _lightAppBg : _appBg,
          ),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  controller: homeScrollController,
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 204),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
                        decoration: BoxDecoration(
                          color: whiteMode ? cardBg : _darkSurface,
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                            color: whiteMode ? cardLine : _darkLineSoft,
                          ),
                          boxShadow: cardShadow,
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .tenYearHigh,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: secondaryText,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          '\$${basePrice.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w800,
                                            color: primaryText,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 1),
                                      Text(
                                        highDate,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: tertiaryText,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 18,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: buildInlineInfoSegment(
                                                    label: 'CNN F&G',
                                                    value: fearGreedValue,
                                                    valueColor:
                                                        fearGreedValueColor,
                                                    valueStyle:
                                                        homeInfoEmphasisValueStyle,
                                                    onTap: () =>
                                                        openFearGreedPage(
                                                      context,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 5,
                                                  ),
                                                  child: Text(
                                                    '|',
                                                    style: homeInfoLabelStyle,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: buildInlineInfoSegment(
                                                    label: 'VIX',
                                                    value: vixValue,
                                                    valueColor: vixValueColor,
                                                    valueStyle:
                                                        homeInfoEmphasisValueStyle,
                                                    onTap: openVixTradingView,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 1),
                                          SizedBox(
                                            height: 18,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: buildInlineInfoSegment(
                                                    label: scheduleLabel,
                                                    value: scheduleValue,
                                                    valueColor:
                                                        scheduleValueColor,
                                                    onTap: () =>
                                                        _showMajorUsScheduleSheet(
                                                      context,
                                                      onChanged: () {
                                                        if (mounted) {
                                                          setState(() {});
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 5,
                                                  ),
                                                  child: Text(
                                                    '|',
                                                    style: homeInfoLabelStyle,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: buildInlineInfoSegment(
                                                    label: '10Y',
                                                    value: tenYearYieldValue,
                                                    valueColor:
                                                        tenYearYieldColor,
                                                    onTap:
                                                        openTenYearYieldTradingView,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 104,
                                  color: whiteMode
                                      ? cardLine
                                      : _darkLineSoft.withValues(alpha: 0.88),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!
                                                .currentPrice,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: secondaryText,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 3,
                                              vertical: 1,
                                            ),
                                            decoration: BoxDecoration(
                                              color: (isRegularMarket
                                                      ? const Color(0xFF1FD16B)
                                                      : Colors.redAccent)
                                                  .withValues(
                                                alpha: whiteMode ? 0.10 : 0.14,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                color: (isRegularMarket
                                                        ? const Color(
                                                            0xFF1FD16B)
                                                        : Colors.redAccent)
                                                    .withValues(alpha: 0.38),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.access_time_rounded,
                                                  size: 9,
                                                  color: isRegularMarket
                                                      ? const Color(0xFF1FD16B)
                                                      : Colors.redAccent,
                                                ),
                                                if (isRegularMarket) ...[
                                                  const SizedBox(width: 3),
                                                  const Text(
                                                    'LIVE',
                                                    style: TextStyle(
                                                      fontSize: 7,
                                                      color: Color(0xFF1FD16B),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: openTradingView,
                                        behavior: HitTestBehavior.opaque,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                qldPrice > 0
                                                    ? '\$${qldPrice.toStringAsFixed(2)}'
                                                    : '--',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w800,
                                                  color: primaryText,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color: tertiaryText,
                                                size: 18,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: RichText(
                                          text: TextSpan(
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    signedPriceChangeAmountText(
                                                  previousCloseChange,
                                                ),
                                                style: TextStyle(
                                                  color: primaryText,
                                                ),
                                              ),
                                              if (signedPriceChangePercentText(
                                                previousClosePercent,
                                              ).isNotEmpty) ...[
                                                const TextSpan(text: ' '),
                                                TextSpan(
                                                  text:
                                                      signedPriceChangePercentText(
                                                    previousClosePercent,
                                                  ),
                                                  style: TextStyle(
                                                    color: previousCloseColor,
                                                  ),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              showSunFuturesIcon
                                                  ? Icons.wb_sunny_rounded
                                                  : Icons.dark_mode_rounded,
                                              size: 9,
                                              color: futuresIconColor,
                                            ),
                                            const SizedBox(width: 5),
                                            RichText(
                                              text: TextSpan(
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        extendedSessionPriceText(),
                                                    style: TextStyle(
                                                      color: primaryText,
                                                    ),
                                                  ),
                                                  if (extendedSessionPercentText()
                                                      .isNotEmpty) ...[
                                                    const TextSpan(text: ' '),
                                                    TextSpan(
                                                      text:
                                                          extendedSessionPercentText(),
                                                      style: TextStyle(
                                                        color:
                                                            extendedSessionPercentColor,
                                                      ),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        localizedPriceRefreshStatusWithCountdown(
                                          Localizations.localeOf(context),
                                          isRefreshing: isRefreshingPrice,
                                          isCached: isUsingCachedPrice,
                                          countdownSeconds:
                                              priceRefreshCountdownSeconds,
                                        ),
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: isRefreshingPrice
                                              ? accentCyan
                                              : isUsingCachedPrice
                                                  ? Colors.amberAccent
                                                  : tertiaryText,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 2),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: showUsageGuideInfo,
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 3,
                              ),
                              child: Text(
                                '${AppLocalizations.of(context)!.usageGuideCardTitle} >',
                                style: TextStyle(
                                  color: accentCyan,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.underline,
                                  decorationColor: accentCyan,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                          onTap: showBasePositionInfo,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              color: whiteMode ? const Color(0xFFFFFBEB) : null,
                              gradient: whiteMode
                                  ? null
                                  : LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        _cyan.withValues(alpha: 0.18),
                                        const Color(0xFF0E1B2A),
                                      ],
                                    ),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: whiteMode
                                    ? const Color(0xFFE9C46A)
                                        .withValues(alpha: 0.34)
                                    : _cyan.withValues(alpha: 0.22),
                              ),
                              boxShadow: whiteMode
                                  ? [
                                      BoxShadow(
                                        color: const Color(0xFFD4A017)
                                            .withValues(alpha: 0.04),
                                        blurRadius: 18,
                                        offset: const Offset(0, 8),
                                      ),
                                    ]
                                  : [
                                      BoxShadow(
                                        color: _cyan.withValues(alpha: 0.04),
                                        blurRadius: 18,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: whiteMode
                                            ? const Color(0xFFFFF3C4)
                                            : _cyan.withValues(alpha: 0.08),
                                        border: Border.all(
                                          color: whiteMode
                                              ? const Color(0xFFE9C46A)
                                                  .withValues(alpha: 0.65)
                                              : _cyan.withValues(alpha: 0.26),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.shield_outlined,
                                        color: whiteMode
                                            ? const Color(0xFFA16207)
                                            : _cyan,
                                        size: 22,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!
                                                .basePosition,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: secondaryText,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .holdQLDPlusCash,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800,
                                              color: primaryText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: tertiaryText,
                                      size: 21,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 14),
                      buildAlertCard(
                        dropPercent,
                      ),
                      const SizedBox(height: 14),
                      buildPortfolioCard(
                        qldValue,
                        tqqqValue,
                        totalAsset,
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.candlestick_chart_rounded,
                              color: accentCyan,
                              size: 17,
                            ),
                            const SizedBox(width: 7),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.chartMiniTitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      buildQldMiniChart(),
                      const SizedBox(height: 8),
                      buildChartGuideInfoStrip(),
                      const SizedBox(height: 14),
                      buildInvestmentCalculatorCard(),
                      const SizedBox(height: 14),
                      if (DateTime.now().isBefore(DateTime(1900)))
                        Text(
                          '짤 2026 Dong Hwan. All rights reserved.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: whiteMode ? _lightMuted : Colors.white30,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      Text(
                        '(C) 2026 Dong Hwan. All rights reserved.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whiteMode ? _lightMuted : Colors.white30,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 144),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  void showMa200InfoSheet() {
    final l10n = AppLocalizations.of(context)!;
    final whiteMode = isWhiteModeEnabled(context);
    final sheetBg = whiteMode ? _lightSurface : const Color(0xFF111D2C);
    final line = whiteMode ? _lightLine : Colors.white24;
    final primaryText = whiteMode ? _lightText : Colors.white;
    final bodyText = whiteMode ? _lightMuted : Colors.white70;
    final accent = whiteMode ? _lightCyan : _cyan;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: sheetBg,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            border: whiteMode ? Border.all(color: _lightLine) : null,
          ),
          child: SafeArea(
            top: false,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 42,
                      height: 4,
                      decoration: BoxDecoration(
                        color: line,
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color:
                              accent.withValues(alpha: whiteMode ? 0.10 : 0.12),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: accent.withValues(
                                alpha: whiteMode ? 0.22 : 0.32),
                          ),
                        ),
                        child: Icon(
                          Icons.timeline_rounded,
                          color: accent,
                          size: 23,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          l10n.chartMa20SheetTitle,
                          style: TextStyle(
                            color: primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.chartMa20SheetBody,
                    style: TextStyle(
                      color: bodyText,
                      fontSize: 14,
                      height: 1.55,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent.withValues(alpha: 0.75),
                          borderRadius: BorderRadius.circular(99),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          l10n.chartMa200SheetTitle,
                          style: TextStyle(
                            color: primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l10n.chartMa200SheetBody,
                    style: TextStyle(
                      color: bodyText,
                      fontSize: 14,
                      height: 1.55,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildChartGuideStrip() {
    final l10n = AppLocalizations.of(context)!;
    final whiteMode = isWhiteModeEnabled(context);
    final surface = whiteMode ? _lightSurface : _darkSurfaceSoft;
    final line = whiteMode ? _lightLine : _darkLineSoft;
    final text = whiteMode ? _lightMuted : _darkMuted;
    final iconMuted = whiteMode ? const Color(0xFF94A3B8) : _darkFaint;

    return GestureDetector(
      onTap: showMa200InfoSheet,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: line),
        ),
        child: Row(
          children: [
            Icon(
              Icons.candlestick_chart_rounded,
              color: whiteMode ? _lightCyan : _cyan,
              size: 15,
            ),
            const SizedBox(width: 7),
            Expanded(
              child: Text(
                '${l10n.chartGuideCandleTitle} 쨌 ${l10n.chartGuideMa200Title}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: text,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.info_outline_rounded,
              color: iconMuted,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChartGuideInfoStrip() {
    final l10n = AppLocalizations.of(context)!;
    final whiteMode = isWhiteModeEnabled(context);
    final surface = whiteMode ? _lightSurface : _darkSurfaceSoft;
    final line = whiteMode ? _lightLine : _darkLineSoft;
    final text = whiteMode ? _lightMuted : _darkMuted;
    final iconMuted = whiteMode ? const Color(0xFF94A3B8) : _darkFaint;

    return GestureDetector(
      onTap: showMa200InfoSheet,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: line),
        ),
        child: Row(
          children: [
            Icon(
              Icons.candlestick_chart_rounded,
              color: whiteMode ? _lightCyan : _cyan,
              size: 15,
            ),
            const SizedBox(width: 7),
            Expanded(
              child: Text(
                l10n.chartMiniTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: text,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.info_outline_rounded,
              color: iconMuted,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChartGuideCard() {
    final l10n = AppLocalizations.of(context)!;
    final whiteMode = isWhiteModeEnabled(context);
    final surface = whiteMode ? _lightSurface : _darkSurface;
    final line = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final accent = whiteMode ? _lightCyan : _cyan;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: whiteMode ? 0.10 : 0.12),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: accent.withValues(alpha: whiteMode ? 0.22 : 0.28),
                  ),
                ),
                child: Icon(
                  Icons.candlestick_chart_rounded,
                  color: accent,
                  size: 17,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  l10n.chartGuideTitle,
                  style: TextStyle(
                    color: primaryText,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildChartGuideItem(
                  label: '3M',
                  title: l10n.chartGuideCandleTitle,
                  body: l10n.chartGuideCandleBody,
                  color: accent,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildChartGuideItem(
                  label: '200D',
                  title: l10n.chartGuideMa200Title,
                  body: l10n.chartGuideMa200Body,
                  color: Colors.amberAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartGuideItem({
    required String label,
    required String title,
    required String body,
    required Color color,
  }) {
    final whiteMode = isWhiteModeEnabled(context);
    final titleColor = whiteMode ? _lightText : Colors.white;
    final bodyColor = whiteMode ? _lightMuted : Colors.white60;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: whiteMode ? 0.08 : 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: whiteMode ? 0.20 : 0.18),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            body,
            style: TextStyle(
              color: bodyColor,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildQldMiniChart() {
    final whiteMode = isWhiteModeEnabled(context);
    final chartBg = whiteMode ? _lightSurface : _darkSurface;
    final chartLine = whiteMode ? _lightLine : _darkLineSoft;
    final chartText = whiteMode ? _lightMuted : _darkMuted;
    final chartSubText = whiteMode ? const Color(0xFF94A3B8) : _darkFaint;
    final chartAccent = whiteMode ? _lightCyan : _cyan;
    final chartUp = whiteMode
        ? const Color(0xFF0891B2).withValues(alpha: 0.82)
        : _cyan.withValues(alpha: 0.72);
    final chartDown = whiteMode
        ? const Color(0xFFEF4444).withValues(alpha: 0.78)
        : Colors.redAccent.withValues(alpha: 0.78);
    final chartMarker = whiteMode ? _lightText : Colors.white;

    if (qldMiniCandles.isEmpty) {
      return GestureDetector(
        onTap: openTradingView,
        child: Container(
          width: double.infinity,
          height: 220,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: chartBg,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: chartLine),
          ),
          child: SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: chartAccent,
            ),
          ),
        ),
      );
    }

    final ma20Spots = <FlSpot>[];
    final ma200Spots = <FlSpot>[];
    var minY = double.infinity;
    var maxY = 0.0;

    for (int i = 0; i < qldMiniCandles.length; i++) {
      final candle = qldMiniCandles[i];
      minY = math.min(minY, candle.low);
      maxY = math.max(maxY, candle.high);

      final ma20 = candle.ma20;
      if (ma20 != null && ma20 > 0) {
        ma20Spots.add(FlSpot(i.toDouble(), ma20));
        minY = math.min(minY, ma20);
        maxY = math.max(maxY, ma20);
      }

      final ma200 = candle.ma200;
      if (ma200 != null && ma200 > 0) {
        ma200Spots.add(FlSpot(i.toDouble(), ma200));
        minY = math.min(minY, ma200);
        maxY = math.max(maxY, ma200);
      }
    }

    final currentChartPrice =
        qldPrice > 0 ? qldPrice : qldMiniCandles.last.close;
    minY = math.min(minY, currentChartPrice);
    maxY = math.max(maxY, currentChartPrice);

    final yRange = math.max(0.01, maxY - minY);
    final paddedMinY = minY - yRange * 0.13;
    final paddedMaxY = maxY + yRange * 0.16;
    final lastX = (qldMiniCandles.length - 1).toDouble();
    const chartHeight = 220.0;
    const currentPriceLabelHeight = 14.0;
    final paddedRange = math.max(0.01, paddedMaxY - paddedMinY);
    final currentPriceY = chartHeight -
        ((currentChartPrice - paddedMinY) / paddedRange) * chartHeight;
    final currentPriceLabelTop = (currentPriceY - currentPriceLabelHeight / 2)
        .clamp(8.0, chartHeight - currentPriceLabelHeight - 8)
        .toDouble();

    final lineBars = <LineChartBarData>[
      if (ma20Spots.length >= 2)
        LineChartBarData(
          spots: ma20Spots,
          isCurved: true,
          color: chartAccent.withValues(alpha: 0.72),
          barWidth: 1.2,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      if (ma200Spots.length >= 2)
        LineChartBarData(
          spots: ma200Spots,
          isCurved: true,
          color: Colors.amberAccent.withValues(alpha: 0.72),
          barWidth: 1.3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
    ];

    return GestureDetector(
      onTap: openTradingView,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        height: 220,
        decoration: BoxDecoration(
          color: chartBg,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: chartLine),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _QldMiniCandlePainter(
                  candles: qldMiniCandles,
                  minY: paddedMinY,
                  maxY: paddedMaxY,
                  gridColor: whiteMode
                      ? const Color(0xFFE2E8F0)
                      : _darkLineSoft.withValues(alpha: 0.78),
                  labelTextColor: chartSubText,
                  labelBackgroundColor: whiteMode
                      ? Colors.white.withValues(alpha: 0.86)
                      : const Color(0xE60B1623),
                  upColor: chartUp,
                  downColor: chartDown,
                  markerColor: chartMarker,
                  currentPrice: currentChartPrice,
                  currentPriceColor: chartAccent,
                  currentPriceStrokeColor: whiteMode
                      ? _lightSurface
                      : Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ),
            Positioned.fill(
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: lastX + 3,
                  minY: paddedMinY,
                  maxY: paddedMaxY,
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineTouchData: const LineTouchData(enabled: false),
                  lineBarsData: lineBars,
                ),
              ),
            ),
            Positioned.fill(
              child: CustomPaint(
                painter: _QldMiniCurrentPricePainter(
                  candleCount: qldMiniCandles.length,
                  minY: paddedMinY,
                  maxY: paddedMaxY,
                  currentPrice: currentChartPrice,
                  color: chartAccent,
                  strokeColor: whiteMode
                      ? _lightSurface
                      : Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 8,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'QLD 3M',
                    style: TextStyle(
                      color: chartText,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (ma20Spots.length >= 2) ...[
                    const SizedBox(width: 8),
                    Container(
                      width: 16,
                      height: 2,
                      color: chartAccent.withValues(alpha: 0.72),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '20D',
                      style: TextStyle(
                        color: chartSubText,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                  if (ma200Spots.length >= 2) ...[
                    const SizedBox(width: 8),
                    Container(
                      width: 16,
                      height: 2,
                      color: Colors.amberAccent.withValues(alpha: 0.72),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '200D',
                      style: TextStyle(
                        color: chartSubText,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Positioned(
              right: 28,
              top: currentPriceLabelTop,
              child: Text(
                '\$${currentChartPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  color: chartAccent,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPortfolioCard(
    double qldValue,
    double tqqqValue,
    double totalAsset,
  ) {
    final whiteMode = isWhiteModeEnabled(context);
    final l10n = AppLocalizations.of(context)!;
    final cardBg = whiteMode ? _lightSurface : _darkSurface;
    final cardLine = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;
    final mutedText = whiteMode ? const Color(0xFF94A3B8) : _darkFaint;
    final cashColor = whiteMode ? _lightCyan : _cyan;
    final qldColor =
        whiteMode ? const Color(0xFF7C3AED) : const Color(0xFF8B5CF6);
    final tqqqColor = whiteMode ? _lightBlue : _blue;
    final cashPercent =
        totalAsset > 0 ? ((cashAmount / totalAsset) * 100).round() : 30;
    final qldPercent =
        totalAsset > 0 ? ((qldValue / totalAsset) * 100).round() : 70;
    final tqqqPercent =
        totalAsset > 0 ? ((tqqqValue / totalAsset) * 100).round() : 0;
    final chartCashValue = totalAsset > 0 ? cashAmount : 30.0;
    final chartQldValue = totalAsset > 0 ? qldValue : 70.0;
    final chartTqqqValue = totalAsset > 0 ? tqqqValue : 0.01;
    final qldCost = qldAveragePrice > 0 ? qldShares * qldAveragePrice : 0.0;
    final tqqqCost = tqqqAveragePrice > 0 ? tqqqShares * tqqqAveragePrice : 0.0;
    final totalCost = qldCost + tqqqCost;
    final totalProfit = qldValue + tqqqValue - totalCost;
    final hasAverageCost = totalCost > 0;
    final totalProfitText =
        '${totalProfit >= 0 ? '+' : '-'} \$${formatMoney(totalProfit.abs())}';
    final totalProfitColor =
        totalProfit >= 0 ? _portfolioGainGreen : _portfolioLossRed;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: cardLine,
        ),
        boxShadow: whiteMode
            ? [
                BoxShadow(
                  color: const Color(0xFF0F172A).withValues(alpha: 0.06),
                  blurRadius: 22,
                  offset: const Offset(0, 10),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.18),
                  blurRadius: 18,
                  offset: const Offset(0, 10),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.portfolio,
                  style: TextStyle(
                    fontSize: 16,
                    color: primaryText,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (showPortfolioInput) {
                    await savePortfolio();
                  }

                  if (!mounted) return;
                  setState(() {
                    showPortfolioInput = !showPortfolioInput;
                  });
                },
                child: Text(
                  showPortfolioInput
                      ? AppLocalizations.of(context)!.portfolioClose
                      : AppLocalizations.of(context)!.portfolioAssetInput,
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: mutedText,
                size: 22,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: SizedBox(
                  height: 142,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PieChart(
                        PieChartData(
                          sectionsSpace: 3,
                          centerSpaceRadius: 37,
                          sections: [
                            PieChartSectionData(
                              color: cashColor,
                              value: chartCashValue,
                              title: '',
                              radius: 31,
                            ),
                            PieChartSectionData(
                              color: qldColor,
                              value: chartQldValue,
                              title: '',
                              radius: 31,
                            ),
                            PieChartSectionData(
                              color: tqqqColor,
                              value: chartTqqqValue,
                              title: '',
                              radius: 31,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'CASH',
                            style: TextStyle(
                              color: secondaryText,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '$cashPercent%',
                            style: TextStyle(
                              color: cashColor,
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    _buildLegendRow(
                      'CASH',
                      cashColor,
                      cashPercent,
                    ),
                    const SizedBox(height: 10),
                    _buildLegendRow(
                      'QLD',
                      qldColor,
                      qldPercent,
                    ),
                    const SizedBox(height: 10),
                    _buildLegendRow(
                      'TQQQ',
                      tqqqColor,
                      tqqqPercent,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (hasAverageCost)
                Text(
                  '${l10n.portfolioProfitLoss} $totalProfitText',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: totalProfitColor,
                  ),
                ),
              const Spacer(),
              Text(
                '${l10n.portfolioTotal} \$${formatMoney(totalAsset)}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: primaryText,
                ),
              ),
            ],
          ),
          if (qldAveragePrice > 0 || tqqqAveragePrice > 0)
            const SizedBox(height: 10),
          if (qldAveragePrice > 0)
            buildAveragePriceSummary(
              'QLD',
              qldAveragePrice,
              qldColor,
            ),
          if (qldAveragePrice > 0 && tqqqAveragePrice > 0)
            const SizedBox(height: 8),
          if (tqqqAveragePrice > 0)
            buildAveragePriceSummary(
              'TQQQ',
              tqqqAveragePrice,
              tqqqColor,
            ),
          if (showPortfolioInput) const SizedBox(height: 20),
          if (showPortfolioInput)
            buildAssetRow(
              'QLD',
              qldColor,
              qldShares,
              qldValue,
              totalAsset,
            ),
          if (showPortfolioInput) const SizedBox(height: 10),
          if (showPortfolioInput)
            buildAssetRow(
              'TQQQ',
              tqqqColor,
              tqqqShares,
              tqqqValue,
              totalAsset,
            ),
          if (showPortfolioInput) const SizedBox(height: 10),
          if (showPortfolioInput)
            buildAssetRow(
              'CASH',
              cashColor,
              0,
              cashAmount,
              totalAsset,
              isCash: true,
            ),
          if (showPortfolioInput)
            Column(
              children: [
                const SizedBox(height: 18),
                buildInput(
                  AppLocalizations.of(context)!.portfolioQldShares,
                  qldController,
                  allowDecimal: true,
                ),
                const SizedBox(height: 12),
                buildInput(
                  AppLocalizations.of(context)!.portfolioQldAveragePrice,
                  qldAverageController,
                  allowDecimal: true,
                ),
                const SizedBox(height: 12),
                buildInput(
                  AppLocalizations.of(context)!.portfolioTqqqShares,
                  tqqqController,
                  allowDecimal: true,
                ),
                const SizedBox(height: 12),
                buildInput(
                  AppLocalizations.of(context)!.portfolioTqqqAveragePrice,
                  tqqqAverageController,
                  allowDecimal: true,
                ),
                const SizedBox(height: 12),
                buildInput(
                  AppLocalizations.of(context)!.portfolioCashUsd,
                  cashController,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: OutlinedButton(
                    onPressed: () async {
                      await savePortfolio();
                      if (!mounted) return;
                      setState(() {
                        showPortfolioInput = false;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: secondaryText,
                      side: BorderSide(
                        color: whiteMode ? _lightLine : _darkLineSoft,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.portfolioClose,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildLegendRow(
    String label,
    Color color,
    int percent,
  ) {
    final whiteMode = isWhiteModeEnabled(context);
    final textColor = whiteMode ? _lightMuted : Colors.white70;

    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          '$percent%',
          style: TextStyle(
            color: textColor,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget buildAssetRow(
    String name,
    Color color,
    double shares,
    double value,
    double totalAsset, {
    bool isCash = false,
  }) {
    final whiteMode = isWhiteModeEnabled(context);
    final rowBg = whiteMode ? const Color(0xFFF8FAFC) : _darkSurfaceSoft;
    final rowLine = whiteMode ? _lightLine : _darkLineSoft;
    final rowText = whiteMode ? _lightText : _darkText;

    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: rowBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: rowLine),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: color,
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              isCash
                  ? name
                  : '$name ${formatShareQuantity(shares)} ${AppLocalizations.of(context)!.portfolioSharesUnit}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: rowText,
              ),
            ),
          ),
          Text(
            totalAsset > 0
                ? '\$${formatMoney(value)} (${((value / totalAsset) * 100).toStringAsFixed(0)}%)'
                : '\$0',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: rowText,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAveragePriceSummary(
    String symbol,
    double averagePrice,
    Color color,
  ) {
    final l10n = AppLocalizations.of(context)!;
    final currentPrice = symbol == 'TQQQ' ? tqqqPrice : qldPrice;
    final hasCurrentPrice = currentPrice > 0;
    final profitPercent = hasCurrentPrice
        ? ((currentPrice - averagePrice) / averagePrice) * 100
        : 0.0;
    final recoveryPercent = hasCurrentPrice && currentPrice < averagePrice
        ? ((averagePrice - currentPrice) / currentPrice) * 100
        : 0.0;
    final isProfit = profitPercent >= 0;
    final whiteMode = isWhiteModeEnabled(context);
    final profitColor = isProfit ? _portfolioGainGreen : _portfolioLossRed;
    final summaryBg = whiteMode ? const Color(0xFFF8FAFC) : _darkSurfaceSoft;
    final summaryLine = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: summaryBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: summaryLine),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 42,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$symbol ${l10n.portfolioAveragePriceShort} \$${averagePrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: primaryText,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  hasCurrentPrice
                      ? '${l10n.currentPrice} \$${currentPrice.toStringAsFixed(2)}'
                      : '$symbol ${l10n.portfolioPriceLoading}',
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                hasCurrentPrice
                    ? '${l10n.portfolioReturnRate} ${isProfit ? '+' : ''}${profitPercent.toStringAsFixed(2)}%'
                    : '-',
                style: TextStyle(
                  color: hasCurrentPrice
                      ? profitColor
                      : (whiteMode ? const Color(0xFFCBD5E1) : _darkFaint),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                !hasCurrentPrice
                    ? '${l10n.portfolioToBreakeven} -'
                    : recoveryPercent > 0
                        ? '${l10n.portfolioToBreakeven} +${recoveryPercent.toStringAsFixed(2)}%'
                        : l10n.portfolioBreakevenCleared,
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInput(
    String hint,
    TextEditingController controller, {
    bool allowDecimal = false,
  }) {
    final whiteMode = isWhiteModeEnabled(context);
    final inputBg = whiteMode ? const Color(0xFFF8FAFC) : _darkSurfaceSoft;

    return TextField(
      controller: controller,
      keyboardType: allowDecimal
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.number,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => savePortfolio(),
      inputFormatters: [
        TextInputFormatter.withFunction((oldValue, newValue) {
          final text = newValue.text;
          if (text.isEmpty) return newValue;

          final pattern =
              allowDecimal ? RegExp(r'^\d*\.?\d*$') : RegExp(r'^\d*$');
          return pattern.hasMatch(text) ? newValue : oldValue;
        }),
      ],
      style: TextStyle(
        color: whiteMode ? _lightText : _darkText,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: hint,
        hintText: '0',
        labelStyle: TextStyle(
          color: whiteMode ? _lightMuted : _darkMuted,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: inputBg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: whiteMode ? _lightBlue : Colors.greenAccent,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget buildCloseGuessRankingCard() {
    final whiteMode = isWhiteModeEnabled(context);
    final cardBg =
        whiteMode ? const Color(0xFFF0F7FF) : const Color(0xFF102033);
    final cardLine =
        whiteMode ? const Color(0xFFB7D8FF) : _cyan.withValues(alpha: 0.22);
    final accent = whiteMode ? _lightBlue : _cyan;
    return Semantics(
      button: true,
      label: 'Contents',
      child: Container(
        width: 48,
        height: 42,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: whiteMode
                ? [
                    cardBg,
                    const Color(0xFFEAFDF7),
                  ]
                : [
                    cardBg,
                    const Color(0xFF0C2B2D),
                  ],
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: cardLine),
          boxShadow: whiteMode
              ? [
                  BoxShadow(
                    color: _lightBlue.withValues(alpha: 0.16),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: _cyan.withValues(alpha: 0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: InkWell(
          onTap: () {
            openContentListPageFromContext(context, closeGuessReferenceClose());
          },
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: Container(
              width: 32,
              height: 32,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: accent.withValues(alpha: whiteMode ? 0.10 : 0.14),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: accent.withValues(alpha: 0.42),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'assets/qld_widget_icon.png',
                  fit: BoxFit.contain,
                  gaplessPlayback: true,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.apps_rounded,
                    color: accent,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInvestmentCalculatorCard() {
    final whiteMode = isWhiteModeEnabled(context);
    final l10n = AppLocalizations.of(context)!;
    final cardBg = whiteMode ? _lightSurface : _darkSurface;
    final cardLine = whiteMode
        ? const Color(0xFFE2E8F0)
        : Colors.white.withValues(alpha: 0.08);
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;
    final mutedText = whiteMode ? const Color(0xFF94A3B8) : _darkFaint;
    final accent = whiteMode ? _lightBlue : _cyan;
    final panelBg =
        whiteMode ? const Color(0xFFF8FAFC) : const Color(0xFF111827);

    final annualReturn =
        (parseCalculatorNumber(returnRateController.text).clamp(0, 1000) / 100)
            .toDouble();
    final lumpSumInput = parseCalculatorNumber(lumpSumInvestmentController.text)
        .clamp(0, 1e15)
        .toDouble();
    final lumpYears =
        (int.tryParse(lumpSumYearsController.text) ?? 0).clamp(0, 80).toInt();
    final monthlyInput = parseCalculatorNumber(monthlyInvestmentController.text)
        .clamp(0, 1e15)
        .toDouble();
    final monthlyYears =
        (int.tryParse(monthlyInvestmentYearsController.text) ?? 0)
            .clamp(0, 80)
            .toInt();

    final currencyOptions = investmentCurrencyOptions(l10n);
    final selectedCurrency = currencyOptions.any(
      (option) => option.code == investmentCalculatorCurrency,
    )
        ? investmentCalculatorCurrency
        : currencyOptions.first.code;
    final selectedCurrencyOption = currencyOptions.firstWhere(
      (option) => option.code == selectedCurrency,
    );
    final lumpResultInput =
        (lumpSumInput * math.pow(1 + annualReturn, lumpYears)).toDouble();
    final monthlyRate = (math.pow(1 + annualReturn, 1 / 12) - 1).toDouble();
    final monthCount = monthlyYears * 12;
    final monthlyResultInput = monthlyRate == 0
        ? monthlyInput * monthCount
        : (monthlyInput *
                ((math.pow(1 + monthlyRate, monthCount) - 1) / monthlyRate))
            .toDouble();
    final monthlyPrincipalInput = monthlyInput * monthCount;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: cardLine),
        boxShadow: whiteMode
            ? [
                BoxShadow(
                  color: const Color(0xFF0F172A).withValues(alpha: 0.05),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.16),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: whiteMode ? 0.11 : 0.16),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.calculate_rounded,
                  color: accent,
                  size: 19,
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.investmentCalculatorTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      l10n.investmentCalculatorSubtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: secondaryText,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                flex: 54,
                child: buildCalculatorInput(
                  l10n.investmentCalculatorReturnRate,
                  returnRateController,
                  suffix: '%',
                  allowDecimal: true,
                  allowThousands: true,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 46,
                child: buildCurrencyDropdown(
                  selectedCurrency,
                  currencyOptions,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          buildCalculatorSection(
            title: l10n.investmentCalculatorLumpSumTitle,
            icon: Icons.savings_rounded,
            accent: accent,
            panelBg: panelBg,
            panelLine: cardLine,
            primaryText: primaryText,
            secondaryText: secondaryText,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: buildCalculatorInput(
                      currencyCalculatorLabel(
                        l10n.investmentCalculatorAmount,
                        selectedCurrencyOption,
                      ),
                      lumpSumInvestmentController,
                      allowThousands: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: buildCalculatorInput(
                      l10n.investmentCalculatorYears,
                      lumpSumYearsController,
                      suffix: l10n.investmentCalculatorYearsSuffix,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              buildCalculatorResultRow(
                currencyCalculatorLabel(
                  l10n.investmentCalculatorExpectedValue,
                  selectedCurrencyOption,
                ),
                formatCalculatorCurrencyMoney(
                  lumpResultInput,
                  selectedCurrencyOption,
                ),
                primaryText,
                accent,
              ),
              const SizedBox(height: 6),
              buildCalculatorResultRow(
                l10n.investmentCalculatorPrincipalMultiple,
                lumpSumInput > 0
                    ? '${(lumpResultInput / lumpSumInput).toStringAsFixed(1)}${l10n.investmentCalculatorTimesSuffix}'
                    : '-',
                secondaryText,
                secondaryText,
              ),
            ],
          ),
          const SizedBox(height: 12),
          buildCalculatorSection(
            title: l10n.investmentCalculatorMonthlyTitle,
            icon: Icons.auto_graph_rounded,
            accent: accent,
            panelBg: panelBg,
            panelLine: cardLine,
            primaryText: primaryText,
            secondaryText: secondaryText,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: buildCalculatorInput(
                      currencyCalculatorLabel(
                        l10n.investmentCalculatorMonthlyAmount,
                        selectedCurrencyOption,
                      ),
                      monthlyInvestmentController,
                      allowThousands: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: buildCalculatorInput(
                      l10n.investmentCalculatorYears,
                      monthlyInvestmentYearsController,
                      suffix: l10n.investmentCalculatorYearsSuffix,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              buildCalculatorResultRow(
                currencyCalculatorLabel(
                  l10n.investmentCalculatorTotalPrincipal,
                  selectedCurrencyOption,
                ),
                formatCalculatorCurrencyMoney(
                  monthlyPrincipalInput,
                  selectedCurrencyOption,
                ),
                secondaryText,
                secondaryText,
              ),
              const SizedBox(height: 6),
              buildCalculatorResultRow(
                currencyCalculatorLabel(
                  l10n.investmentCalculatorExpectedValue,
                  selectedCurrencyOption,
                ),
                formatCalculatorCurrencyMoney(
                  monthlyResultInput,
                  selectedCurrencyOption,
                ),
                primaryText,
                accent,
              ),
              const SizedBox(height: 6),
              buildCalculatorResultRow(
                l10n.investmentCalculatorPrincipalMultiple,
                monthlyPrincipalInput > 0
                    ? '${(monthlyResultInput / monthlyPrincipalInput).toStringAsFixed(1)}${l10n.investmentCalculatorTimesSuffix}'
                    : '-',
                secondaryText,
                secondaryText,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            l10n.investmentCalculatorDisclaimer,
            style: TextStyle(
              color: mutedText,
              fontSize: 10,
              height: 1.35,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: openQldTenYearChart,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 2,
                vertical: 4,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.investmentCalculatorChartHint,
                      style: TextStyle(
                        color: accent,
                        fontSize: 10,
                        height: 1.35,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: accent,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCalculatorSection({
    required String title,
    required IconData icon,
    required Color accent,
    required Color panelBg,
    required Color panelLine,
    required Color primaryText,
    required Color secondaryText,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: panelBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: panelLine),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: accent, size: 17),
              const SizedBox(width: 7),
              Text(
                title,
                style: TextStyle(
                  color: primaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget buildCalculatorInput(
    String label,
    TextEditingController controller, {
    String? suffix,
    bool allowDecimal = false,
    bool allowThousands = false,
  }) {
    final whiteMode = isWhiteModeEnabled(context);
    final inputBg = whiteMode ? Colors.white : const Color(0xFF0F172A);
    final inputLine = whiteMode
        ? const Color(0xFFCBD5E1)
        : Colors.white.withValues(alpha: 0.18);
    final inputFocusLine = whiteMode ? _lightBlue : _cyan;

    return TextField(
      controller: controller,
      keyboardType: allowDecimal
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.number,
      textInputAction: TextInputAction.done,
      onChanged: (_) {
        setState(() {});
        unawaited(saveInvestmentCalculator());
      },
      onSubmitted: (_) => saveInvestmentCalculator(),
      inputFormatters: [
        TextInputFormatter.withFunction((oldValue, newValue) {
          final text = newValue.text;
          if (text.isEmpty) return newValue;

          final pattern = allowThousands
              ? (allowDecimal ? RegExp(r'^[\d,]*\.?\d*$') : RegExp(r'^[\d,]*$'))
              : (allowDecimal ? RegExp(r'^\d*\.?\d*$') : RegExp(r'^\d*$'));
          if (!pattern.hasMatch(text)) return oldValue;
          if (!allowThousands) return newValue;
          return formatCalculatorEditingValue(
            newValue,
            allowDecimal: allowDecimal,
          );
        }),
      ],
      style: TextStyle(
        color: whiteMode ? _lightText : _darkText,
        fontSize: 13,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffix,
        isDense: true,
        labelStyle: TextStyle(
          color: whiteMode ? _lightMuted : _darkMuted,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        suffixStyle: TextStyle(
          color: whiteMode ? _lightMuted : _darkMuted,
          fontWeight: FontWeight.w700,
        ),
        filled: true,
        fillColor: inputBg,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: inputLine, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: inputLine, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: inputFocusLine,
            width: 1.6,
          ),
        ),
      ),
    );
  }

  TextEditingValue formatCalculatorEditingValue(
    TextEditingValue value, {
    required bool allowDecimal,
  }) {
    final text = value.text;
    if (text.isEmpty) return value;

    final parts = allowDecimal ? text.split('.') : <String>[text];
    final integerDigits = parts.first.replaceAll(',', '');
    final formattedInteger = integerDigits.isEmpty
        ? ''
        : NumberFormat('#,##0').format(int.parse(integerDigits));
    final formatted = allowDecimal && text.contains('.')
        ? '$formattedInteger.${parts.skip(1).join()}'
        : formattedInteger;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  Widget buildCurrencyDropdown(
    String selectedCurrency,
    List<_InvestmentCurrencyOption> currencyOptions,
  ) {
    final whiteMode = isWhiteModeEnabled(context);
    final inputBg = whiteMode ? Colors.white : const Color(0xFF0F172A);
    final textColor = whiteMode ? _lightText : _darkText;
    final mutedColor = whiteMode ? _lightMuted : _darkMuted;
    final inputLine = whiteMode
        ? const Color(0xFFCBD5E1)
        : Colors.white.withValues(alpha: 0.18);
    final inputFocusLine = whiteMode ? _lightBlue : _cyan;

    return DropdownButtonFormField<String>(
      initialValue: selectedCurrency,
      isExpanded: true,
      dropdownColor: inputBg,
      iconEnabledColor: mutedColor,
      style: TextStyle(
        color: textColor,
        fontSize: 13,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.investmentCalculatorCurrency,
        isDense: true,
        labelStyle: TextStyle(
          color: mutedColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: inputBg,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: inputLine, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: inputLine, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: inputFocusLine,
            width: 1.6,
          ),
        ),
      ),
      items: currencyOptions
          .map(
            (option) => DropdownMenuItem<String>(
              value: option.code,
              child: Text(
                option.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value == null) return;
        setState(() {
          investmentCalculatorCurrency = value;
        });
        unawaited(saveInvestmentCalculator());
      },
    );
  }

  Widget buildCalculatorResultRow(
    String label,
    String value,
    Color labelColor,
    Color valueColor,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 310;
        if (compact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: labelColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),
              Align(
                alignment: Alignment.centerRight,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text(
                    value,
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: valueColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return Row(
          children: [
            Flexible(
              flex: 4,
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: labelColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 6,
              child: Align(
                alignment: Alignment.centerRight,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text(
                    value,
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: valueColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String formatCalculatorMoney(double value) {
    if (value <= 0 || value.isNaN || value.isInfinite) return '-';
    return formatMoney(value);
  }

  String formatCalculatorUsdMoney(double value) {
    if (value <= 0 || value.isNaN || value.isInfinite) return '-';
    return '\$${NumberFormat('#,##0').format(value)} USD';
  }

  String formatCalculatorCurrencyMoney(
    double value,
    _InvestmentCurrencyOption currency,
  ) {
    if (value <= 0 || value.isNaN || value.isInfinite) return '-';
    final formatted = NumberFormat('#,##0').format(value);
    final displayCode = investmentCurrencyDisplayCode(currency);
    return '$formatted $displayCode';
  }

  String usdCalculatorLabel(String label) => '$label (USD)';

  String currencyCalculatorLabel(
    String label,
    _InvestmentCurrencyOption currency,
  ) {
    return '$label (${investmentCurrencyDisplayCode(currency)})';
  }

  String investmentCurrencyDisplayCode(_InvestmentCurrencyOption currency) {
    return currency.code.startsWith('EUR_') ? 'EUR' : currency.code;
  }

  double parseCalculatorNumber(String text, {double fallback = 0}) {
    final normalized = text.replaceAll(',', '').trim();
    if (normalized.isEmpty) return fallback;
    return double.tryParse(normalized) ?? fallback;
  }

  String formatCalculatorInputNumber(double value) {
    if (value <= 0 || value.isNaN || value.isInfinite) return '0';
    return NumberFormat('#,##0.##').format(value);
  }

  List<_InvestmentCurrencyOption> investmentCurrencyOptions(
    AppLocalizations l10n,
  ) {
    return [
      _InvestmentCurrencyOption(
        code: 'USD',
        symbol: r'$',
        label: l10n.investmentCurrencyUnitedStatesUsd,
      ),
      _InvestmentCurrencyOption(
        code: 'KRW',
        symbol: '₩',
        label: l10n.investmentCurrencyKoreaKrw,
      ),
      _InvestmentCurrencyOption(
        code: 'JPY',
        symbol: 'JPY',
        label: l10n.investmentCurrencyJapanJpy,
      ),
      _InvestmentCurrencyOption(
        code: 'CNY',
        symbol: 'CNY',
        label: l10n.investmentCurrencyChinaCny,
      ),
      _InvestmentCurrencyOption(
        code: 'TWD',
        symbol: 'NT\$',
        label: l10n.investmentCurrencyTaiwanTwd,
      ),
      _InvestmentCurrencyOption(
        code: 'EUR_DE',
        symbol: '€',
        label: l10n.investmentCurrencyGermanyEur,
      ),
      _InvestmentCurrencyOption(
        code: 'EUR_FR',
        symbol: '€',
        label: l10n.investmentCurrencyFranceEur,
      ),
      _InvestmentCurrencyOption(
        code: 'EUR_ES',
        symbol: '€',
        label: l10n.investmentCurrencySpainEur,
      ),
      _InvestmentCurrencyOption(
        code: 'EUR_PT',
        symbol: '€',
        label: l10n.investmentCurrencyPortugalEur,
      ),
      _InvestmentCurrencyOption(
        code: 'RUB',
        symbol: '₽',
        label: l10n.investmentCurrencyRussiaRub,
      ),
    ];
  }

  Widget buildAlertCard(double dropPercent) {
    final whiteMode = isWhiteModeEnabled(context);
    Color color;
    IconData icon;
    String title;
    String subtitle;
    Widget page;
    bool useStrongAccent = true;

    if (dropPercent <= -50) {
      color = Colors.purple;
      icon = Icons.bolt_rounded;
      title = AppLocalizations.of(context)!.minus50Headline;
      subtitle = AppLocalizations.of(context)!.tapToViewStrategy;
      page = const Minus50Page();
    } else if (touchedMinus50 && dropPercent > -50) {
      color = Colors.purple;
      icon = Icons.check_circle_outline_rounded;
      title = AppLocalizations.of(context)!.hold;
      subtitle = AppLocalizations.of(context)!.tapToViewStrategy;
      page = const HoldPositionPage(
        lastZone: '-50%',
        accent: Colors.purpleAccent,
      );
    } else if (dropPercent <= -40) {
      color = Colors.red;
      icon = Icons.warning_amber_rounded;
      title = AppLocalizations.of(context)!.minus40Headline;
      subtitle = AppLocalizations.of(context)!.tapToViewStrategy;
      page = const Minus40Page();
    } else if (touchedMinus40 && dropPercent > -40 && dropPercent <= -20) {
      color = Colors.redAccent;
      icon = Icons.check_circle_outline_rounded;
      title = AppLocalizations.of(context)!.hold;
      subtitle = AppLocalizations.of(context)!.tapToViewStrategy;
      page = const HoldPositionPage(
        lastZone: '-40%',
        accent: Colors.redAccent,
      );
    } else if (dropPercent <= -30) {
      color = Colors.orange;
      icon = Icons.shopping_cart_checkout_rounded;
      title = AppLocalizations.of(context)!.minus30Headline;
      subtitle = AppLocalizations.of(context)!.tapToViewStrategy;
      page = const Minus30Page();
    } else if (touchedMinus30 && dropPercent > -30 && dropPercent <= -20) {
      color = Colors.orangeAccent;
      icon = Icons.check_circle_outline_rounded;
      title = AppLocalizations.of(context)!.hold;
      subtitle = AppLocalizations.of(context)!.tapToViewStrategy;
      page = const HoldPositionPage(
        lastZone: '-30%',
        accent: Colors.orangeAccent,
      );
    } else if (dropPercent <= -20) {
      color = Colors.green;
      icon = Icons.auto_graph_rounded;
      title = AppLocalizations.of(context)!.minus20Headline;
      subtitle = AppLocalizations.of(context)!.tapToViewStrategy;
      page = const Minus20Page();
    } else if (touchedMinus20 && dropPercent > -20) {
      color = Colors.greenAccent;
      icon = Icons.check_circle_outline_rounded;
      title = AppLocalizations.of(context)!.hold;
      subtitle = AppLocalizations.of(context)!.tapToViewStrategy;
      page = const HoldPositionPage(
        lastZone: '-20%',
        accent: Colors.greenAccent,
      );
    } else {
      color = Colors.blueGrey;
      icon = Icons.rule_rounded;
      title = AppLocalizations.of(context)!.noBuyZone;
      subtitle = AppLocalizations.of(context)!.buySignalMessage;
      page = const NoBuyZonePage();
      useStrongAccent = false;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => page,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: whiteMode ? _lightSurface : _darkSurface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: whiteMode
                ? color.withValues(alpha: 0.22)
                : color.withValues(alpha: useStrongAccent ? 0.26 : 0.20),
          ),
          boxShadow: whiteMode
              ? [
                  BoxShadow(
                    color: const Color(0xFF0F172A).withValues(alpha: 0.04),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [
                  BoxShadow(
                    color:
                        color.withValues(alpha: useStrongAccent ? 0.04 : 0.02),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withValues(alpha: whiteMode ? 0.10 : 0.10),
                border: Border.all(
                  color: color.withValues(alpha: whiteMode ? 0.22 : 0.32),
                ),
              ),
              child: Icon(
                icon,
                color: whiteMode ? _lightText : color,
                size: 28,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${AppLocalizations.of(context)!.from10yHigh} ',
                            style: TextStyle(
                              fontSize: 13,
                              color: whiteMode ? _lightMuted : _darkMuted,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '${dropPercent.toStringAsFixed(2)}%',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: whiteMode ? _lightText : _darkText,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: whiteMode ? _lightMuted : _darkMuted,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.chevron_right_rounded,
              color: whiteMode ? _lightMuted : _darkFaint,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(double dropPercent) {
    final whiteMode = isWhiteModeEnabled(context);

    return Container(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: whiteMode ? Colors.white : const Color(0xF20A1726),
        borderRadius: BorderRadius.zero,
        border: Border(
          top: BorderSide(color: whiteMode ? _lightLine : _darkLineSoft),
        ),
        boxShadow: whiteMode
            ? [
                BoxShadow(
                  color: const Color(0xFF0F172A).withValues(alpha: 0.06),
                  blurRadius: 18,
                  offset: const Offset(0, -6),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.32),
                  blurRadius: 22,
                  offset: const Offset(0, -6),
                ),
              ],
      ),
      child: SafeArea(
        top: false,
        minimum: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              Icons.home_rounded,
              AppLocalizations.of(context)!.navHome,
              true,
              () {
                goHomeAndScrollTop(context);
              },
            ),
            _navItem(
              Icons.show_chart_rounded,
              AppLocalizations.of(context)!.navChart,
              false,
              () => openChartPage(context),
            ),
            _navItem(
              Icons.currency_exchange_rounded,
              AppLocalizations.of(context)!.navExchange,
              false,
              () => openExchangePage(context),
            ),
            _navItem(
              Icons.speed_rounded,
              AppLocalizations.of(context)!.navFearGreed,
              false,
              () => openFearGreedPage(context),
            ),
            ValueListenableBuilder<int>(
              valueListenable: alertBadgeCount,
              builder: (context, count, _) {
                return _navItem(
                  Icons.notifications_none_rounded,
                  AppLocalizations.of(context)!.navAlert,
                  false,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NotificationHistoryPage(
                          items: alertHistory,
                        ),
                      ),
                    );
                  },
                  badgeCount: count,
                );
              },
            ),
            _navItem(
              Icons.rule_rounded,
              AppLocalizations.of(context)!.navStrategy,
              false,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StrategyPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
      IconData icon, String label, bool selected, VoidCallback onTap,
      {int badgeCount = 0}) {
    final whiteMode = isWhiteModeEnabled(context);
    final color = selected
        ? (whiteMode ? _lightBlue : _blue)
        : (whiteMode ? _lightMuted : Colors.white54);

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: SizedBox(
        width: 48,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
                if (badgeCount > 0)
                  Positioned(
                    right: -9,
                    top: -7,
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 15,
                        minHeight: 15,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        badgeCount > 99 ? '99+' : '$badgeCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: 9,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatMoney(double value) {
    return NumberFormat('#,###').format(value);
  }

  String formatShareQuantity(double value) {
    if (value == value.truncateToDouble()) {
      return value.toStringAsFixed(0);
    }

    return value.toStringAsFixed(6).replaceFirst(RegExp(r'\.?0+$'), '');
  }
}

class _InvestmentCurrencyOption {
  const _InvestmentCurrencyOption({
    required this.code,
    required this.symbol,
    required this.label,
  });

  final String code;
  final String symbol;
  final String label;
}

Future<void> launchTradingViewPage([String symbolPath = 'AMEX-QLD']) async {
  final uri = tradingViewSymbolOverviewUri(symbolPath);

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }
}

Uri tradingViewSymbolOverviewUri(
  String symbolPath, {
  String range = '1M',
}) {
  return Uri.https(
    'www.tradingview.com',
    '/symbols/$symbolPath/',
    {
      'range': range,
      'chartType': 'candlesticks',
      'style': '1',
    },
  );
}

bool matchesSearchQuery(String searchText, String query) {
  final normalizedQuery = normalizeChartSearchText(query);

  if (normalizedQuery.isEmpty) return true;
  final normalizedSearchText = normalizeChartSearchText(searchText);
  return normalizedSearchTextMatchesQuery(
    normalizedSearchText,
    normalizedQuery,
  );
}

bool normalizedSearchTextMatchesQuery(
  String normalizedSearchText,
  String normalizedQuery,
) {
  if (normalizedSearchText.contains(normalizedQuery)) return true;
  if (normalizedSearchText.replaceAll(' ', '').contains(
        normalizedQuery.replaceAll(' ', ''),
      )) {
    return true;
  }

  final tokens = normalizedQuery
      .split(RegExp(r'\s+'))
      .where((token) => token.isNotEmpty)
      .toList();

  return tokens.isNotEmpty && tokens.every(normalizedSearchText.contains);
}

bool matchesAnySearchToken(String searchText, String query) {
  final normalizedSearchText = normalizeChartSearchText(searchText);
  return normalizedSearchTextMatchesAnyToken(
    normalizedSearchText,
    normalizeChartSearchText(query),
  );
}

bool normalizedSearchTextMatchesAnyToken(
  String normalizedSearchText,
  String normalizedQuery,
) {
  final tokens = normalizedQuery
      .split(RegExp(r'\s+'))
      .where((token) => token.isNotEmpty)
      .toList();

  return tokens.isNotEmpty && tokens.any(normalizedSearchText.contains);
}

String normalizeChartSearchText(String value) {
  return value
      .replaceAllMapped(
        RegExp(r'([a-z])([A-Z])'),
        (match) => '${match.group(1)} ${match.group(2)}',
      )
      .toLowerCase()
      .replaceAll(RegExp(r'[찼횪창찾채책훮]'), 'a')
      .replaceAll(RegExp(r'[챕챔챗챘휆]'), 'e')
      .replaceAll(RegExp(r'[챠챙챤챦카]'), 'i')
      .replaceAll(RegExp(r'[처챵척천철흲]'), 'o')
      .replaceAll(RegExp(r'[첬첫청체큰]'), 'u')
      .replaceAll('챌', 'c')
      .replaceAll('챰', 'n')
      .replaceAll('횩', 'ss')
      .replaceAll('&', ' and ')
      .replaceAll(RegExp(r'[.,/()_\-:]+'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}

List<String> expandedChartSearchQueries(String query) {
  final normalizedQuery = normalizeChartSearchText(query);

  if (normalizedQuery.isEmpty) return const [''];

  final expansions = <String>{normalizedQuery};

  for (final entry in _chartSearchTermExpansions.entries) {
    final key = normalizeChartSearchText(entry.key);

    if (key.isEmpty || !normalizedQuery.contains(key)) continue;

    for (final value in entry.value) {
      final normalizedValue = normalizeChartSearchText(value);

      if (normalizedValue.isNotEmpty) {
        expansions.add(normalizedValue);
        expansions.add(normalizedQuery.replaceAll(key, normalizedValue));
      }
    }
  }

  return expansions.toList(growable: false);
}

bool matchesExpandedChartSearch(String searchText, String query) {
  return expandedChartSearchQueries(query)
      .any((expandedQuery) => matchesSearchQuery(searchText, expandedQuery));
}

bool normalizedSearchTextMatchesExpandedQueries(
  String normalizedSearchText,
  List<String> expandedQueries,
) {
  return expandedQueries.any(
    (expandedQuery) => normalizedSearchTextMatchesQuery(
      normalizedSearchText,
      expandedQuery,
    ),
  );
}

bool matchesAnyExpandedChartSearchToken(String searchText, String query) {
  return expandedChartSearchQueries(query).any(
    (expandedQuery) => matchesAnySearchToken(searchText, expandedQuery),
  );
}

bool normalizedSearchTextMatchesAnyExpandedQueryToken(
  String normalizedSearchText,
  List<String> expandedQueries,
) {
  return expandedQueries.any(
    (expandedQuery) => normalizedSearchTextMatchesAnyToken(
      normalizedSearchText,
      expandedQuery,
    ),
  );
}

String localizedChartKeywordAliasesForText(String value) {
  final normalizedValue = normalizeChartSearchText(value);
  final searchableValue = ' $normalizedValue ';
  final aliases = <String>{};

  for (final entry in _localizedChartKeywordAliases.entries) {
    if (searchableValue.contains(' ${entry.key} ')) {
      aliases.addAll(entry.value);
    }
  }

  return aliases.join(' ');
}

void openChartPage(BuildContext context) {
  if (context.findAncestorWidgetOfExactType<ChartPage>() != null) {
    return;
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const ChartPage(),
    ),
  );
}

void openExchangePage(BuildContext context) {
  if (context.findAncestorWidgetOfExactType<ExchangePage>() != null) {
    return;
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const ExchangePage(),
    ),
  );
}

void openFearGreedPage(BuildContext context) {
  if (context.findAncestorWidgetOfExactType<FearGreedPage>() != null) {
    return;
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const FearGreedPage(),
    ),
  );
}

void openCloseGuessRankingPage(double initialClose) {
  appNavigatorKey.currentState?.push(
    MaterialPageRoute(
      builder: (_) => CloseGuessRankingPage(
        initialClose: initialClose,
      ),
    ),
  );
}

void openContentListPage(double initialClose) {
  appNavigatorKey.currentState?.push(
    MaterialPageRoute(
      builder: (_) => ContentListPage(
        initialClose: initialClose,
      ),
    ),
  );
}

void openContentListPageFromContext(
  BuildContext context,
  double initialClose,
) {
  Navigator.of(context, rootNavigator: true).push(
    MaterialPageRoute(
      builder: (_) => ContentListPage(
        initialClose: initialClose,
      ),
    ),
  );
}

void goHomeAndScrollTop(BuildContext context) {
  Navigator.popUntil(context, (route) => route.isFirst);

  Future.delayed(const Duration(milliseconds: 80), () {
    final controller = _activeHomeScrollController;

    if (controller == null || !controller.hasClients) return;

    controller.animateTo(
      0,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );
  });
}

class UsageGuidePage extends StatelessWidget {
  const UsageGuidePage({super.key, required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : _appBg;
    final primaryText = whiteMode ? _lightText : _darkText;
    final bodyText = whiteMode ? _lightMuted : _darkMuted;
    final line = whiteMode ? _lightLine : _darkLineSoft;

    Widget section(String title, String body) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: primaryText,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            body,
            style: TextStyle(
              color: bodyText,
              fontSize: 14,
              height: 1.62,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    Widget divider() => Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Divider(height: 1, color: line),
        );

    return Scaffold(
      backgroundColor: pageBg,
      bottomNavigationBar: buildAdOnlyBottomBar(),
      appBar: AppBar(
        title: Text(l10n.usageGuideTitle),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 4, 18, 32),
          children: [
            Text(
              l10n.usageGuideSubtitle,
              style: TextStyle(
                color: bodyText,
                fontSize: 13,
                height: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
            divider(),
            section(l10n.usageGuideWhatAppTitle, l10n.usageGuideWhatAppBody),
            divider(),
            section(l10n.usageGuideNoBuyTitle, l10n.usageGuideNoBuyBody),
            divider(),
            section(l10n.usageGuideStrategyTitle, l10n.usageGuideStrategyBody),
            divider(),
            section(l10n.usageGuideQldTitle, l10n.usageGuideQldBody),
            divider(),
            section(
              l10n.usageGuideIndicatorsTitle,
              l10n.usageGuideIndicatorsBody,
            ),
            const SizedBox(height: 18),
            Text(
              l10n.usageGuideDisclaimer,
              style: TextStyle(
                color: bodyText,
                fontSize: 12,
                height: 1.45,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NicknameSettingsCard extends StatefulWidget {
  const NicknameSettingsCard({super.key});

  @override
  State<NicknameSettingsCard> createState() => _NicknameSettingsCardState();
}

class _NicknameSettingsCardState extends State<NicknameSettingsCard> {
  final controller = TextEditingController();
  bool saving = false;

  @override
  void initState() {
    super.initState();
    controller.text = appUserIdentityNotifier.value.nickname;
    appUserIdentityNotifier.addListener(syncNickname);
    unawaited(ensureAnonymousUserIdentity());
  }

  @override
  void dispose() {
    appUserIdentityNotifier.removeListener(syncNickname);
    controller.dispose();
    super.dispose();
  }

  void syncNickname() {
    final nickname = appUserIdentityNotifier.value.nickname;
    if (controller.text == nickname) return;
    controller.text = nickname;
  }

  Future<void> save() async {
    if (saving) return;
    setState(() {
      saving = true;
    });
    await saveAppUserNickname(controller.text);
    if (!mounted) return;
    setState(() {
      saving = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('닉네임이 저장되었습니다.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final whiteMode = isWhiteModeEnabled(context);
    final cardBg = whiteMode ? _lightSurface : _darkSurface;
    final cardLine = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;
    final accent = whiteMode ? _lightBlue : _cyan;

    return ValueListenableBuilder<AppUserIdentity>(
      valueListenable: appUserIdentityNotifier,
      builder: (context, identity, _) {
        final shortUid = identity.uid.length > 8
            ? identity.uid.substring(identity.uid.length - 8)
            : identity.uid;

        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: cardLine),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.badge_outlined, color: accent, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '닉네임 선택 입력',
                      style: TextStyle(
                        color: primaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: appUserAdminNotifier,
                    builder: (context, isAdmin, __) {
                      return Text(
                        isAdmin
                            ? '관리자'
                            : (shortUid.isEmpty ? 'UID 준비 중' : 'UID $shortUid'),
                        style: TextStyle(
                          color: isAdmin ? accent : secondaryText,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                    tooltip: 'UID 복사',
                    onPressed: identity.uid.isEmpty
                        ? null
                        : () async {
                            await Clipboard.setData(
                              ClipboardData(text: identity.uid),
                            );
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('UID가 복사되었습니다.')),
                            );
                          },
                    icon: Icon(
                      Icons.copy_rounded,
                      color: secondaryText,
                      size: 17,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(color: primaryText, fontSize: 13),
                      decoration: InputDecoration(
                        hintText: appUserDisplayName(
                          identity,
                          isAdmin: appUserAdminNotifier.value,
                        ),
                        hintStyle: TextStyle(color: secondaryText),
                        filled: true,
                        fillColor: whiteMode
                            ? const Color(0xFFF8FAFC)
                            : _darkSurfaceSoft,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: cardLine),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: cardLine),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: accent),
                        ),
                      ),
                      onSubmitted: (_) => save(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 42,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: accent,
                        foregroundColor: whiteMode ? Colors.white : _appBg,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: save,
                      child: Text(
                        saving ? '저장 중' : '저장',
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class ContentListPage extends StatelessWidget {
  const ContentListPage({
    super.key,
    required this.initialClose,
  });

  final double initialClose;

  @override
  Widget build(BuildContext context) {
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : _appBg;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;

    Widget item({
      required int number,
      required IconData icon,
      required String title,
      required String subtitle,
      required Color color,
      required VoidCallback onTap,
      String badge = '',
    }) {
      return Material(
        color: whiteMode ? Colors.white : const Color(0xFF111827),
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            constraints: const BoxConstraints(minHeight: 86),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: whiteMode ? _lightLine : _darkLineSoft,
              ),
              boxShadow: whiteMode
                  ? [
                      BoxShadow(
                        color: color.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: whiteMode ? 0.11 : 0.16),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: color.withValues(alpha: whiteMode ? 0.18 : 0.24),
                    ),
                  ),
                  child: Icon(icon, color: color, size: 21),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: color.withValues(
                                alpha: whiteMode ? 0.08 : 0.13,
                              ),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              number.toString().padLeft(2, '0'),
                              style: TextStyle(
                                color: color,
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const SizedBox(width: 7),
                          Expanded(
                            child: Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: primaryText,
                                fontSize: 14.5,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          if (badge.isNotEmpty) ...[
                            const SizedBox(width: 6),
                            Text(
                              badge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: color,
                                fontSize: 10.5,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 7),
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: secondaryText,
                          fontSize: 12,
                          height: 1.28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.chevron_right_rounded,
                  color: secondaryText,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget gap() => const SizedBox(height: 10);

    return Scaffold(
      backgroundColor: pageBg,
      bottomNavigationBar: buildAdOnlyBottomBar(),
      appBar: AppBar(
        title: const Text('콘텐츠'),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          buildWhiteModeButton(context),
        ],
      ),
      body: ColoredBox(
        color: pageBg,
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            children: [
              item(
                number: 1,
                icon: Icons.help_outline_rounded,
                title: '문의사항',
                subtitle: '익명 문의를 남기고 답변을 확인합니다.',
                color: const Color(0xFF2563EB),
                badge: 'Q&A',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const InquiryPage(),
                    ),
                  );
                },
              ),
              gap(),
              item(
                number: 2,
                icon: Icons.emoji_events_rounded,
                title: '종가맞추기',
                subtitle: 'QLD 기준 종가를 예측하고 랭킹을 겨룹니다.',
                color: const Color(0xFFD97706),
                badge: '랭킹',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CloseGuessRankingPage(
                        initialClose: initialClose,
                      ),
                    ),
                  );
                },
              ),
              gap(),
              item(
                number: 3,
                icon: Icons.format_quote_rounded,
                title: '오늘의 주식 명언',
                subtitle: '투자 감각을 다듬는 짧은 문장을 확인합니다.',
                color: const Color(0xFF059669),
                badge: '매일',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const StockQuotePage(),
                    ),
                  );
                },
              ),
              gap(),
              item(
                number: 4,
                icon: Icons.casino_rounded,
                title: '숫자 맞추기',
                subtitle: '가볍게 즐기는 확률형 미니게임입니다.',
                color: const Color(0xFF7C3AED),
                badge: '게임',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NumberGuessGamePage(),
                    ),
                  );
                },
              ),
              gap(),
              item(
                number: 5,
                icon: Icons.menu_book_rounded,
                title: '책 읽기',
                subtitle: '차분히 읽을 수 있는 공개 도메인 텍스트입니다.',
                color: const Color(0xFF0F766E),
                badge: '읽기',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LongFormBookReaderPage(),
                    ),
                  );
                },
              ),
              gap(),
              item(
                number: 6,
                icon: Icons.theater_comedy_rounded,
                title: '주식 짤',
                subtitle: '투자자가 공감할 만한 짧은 유머 모음입니다.',
                color: const Color(0xFFE11D48),
                badge: '유머',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const StockMemePage(),
                    ),
                  );
                },
              ),
              gap(),
              item(
                number: 7,
                icon: Icons.confirmation_number_rounded,
                title: '로또번호 추천',
                subtitle: '부담 없이 뽑아보는 랜덤 번호 추천입니다.',
                color: const Color(0xFF0891B2),
                badge: '랜덤',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LottoNumberPage(),
                    ),
                  );
                },
              ),
              gap(),
              item(
                number: 8,
                icon: Icons.directions_run_rounded,
                title: '점프 장애물 피하기',
                subtitle: '짧게 집중해서 즐기는 점프 미니게임입니다.',
                color: const Color(0xFFEA580C),
                badge: '액션',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const JumpDodgeGamePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StockQuotePage extends StatefulWidget {
  const StockQuotePage({super.key});

  @override
  State<StockQuotePage> createState() => _StockQuotePageState();
}

class _StockQuotePageState extends State<StockQuotePage> {
  final random = math.Random();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = random.nextInt(stockQuotes.length);
  }

  void showRandomQuote() {
    final quotes = localizedQuotes(Localizations.localeOf(context));
    if (quotes.length < 2) {
      return;
    }

    var nextIndex = random.nextInt(quotes.length);
    while (nextIndex == currentIndex) {
      nextIndex = random.nextInt(quotes.length);
    }

    setState(() {
      currentIndex = nextIndex;
    });
  }

  static const stockQuotes = <String>[
    '다른 사람이 탐욕스러울 때는 조심하고, 모두가 두려워할 때는 기회를 보라. — 워런 버핏',
    '가격은 지불하는 것이고, 가치는 얻는 것이다. — 워런 버핏',
    '훌륭한 회사를 적당한 가격에 사는 편이 낫다. — 워런 버핏',
    '이해하지 못하는 사업에는 투자하지 마라. — 워런 버핏',
    '위험은 자신이 무엇을 하는지 모를 때 커진다. — 워런 버핏',
    '좋은 기업을 샀다면 보유 기간은 길수록 좋다. — 워런 버핏',
    '평판을 쌓는 데는 오래 걸리지만 잃는 데는 짧은 순간이면 충분하다. — 워런 버핏',
    '시장 변동은 적이 아니라 기회가 될 수 있다. — 워런 버핏',
    '비가 온 뒤에야 누가 무리하게 헤엄쳤는지 보인다. — 워런 버핏',
    '투자자는 홈런보다 큰 실수를 피하는 데 집중해야 한다. — 워런 버핏',
    '능력 범위 안에서만 움직이면 실수는 줄어든다. — 워런 버핏',
    '주식을 사는 것은 종이 조각이 아니라 기업 일부를 사는 일이다. — 워런 버핏',
    '시장이 10년 닫혀도 보유할 종목만 사라. — 워런 버핏',
    '단기 가격보다 기업의 장기 수익력을 보라. — 워런 버핏',
    '훌륭한 경영진보다 훌륭한 사업 구조가 더 중요할 때가 많다. — 워런 버핏',
    '복잡한 것보다 단순하고 확실한 것을 선택하라. — 워런 버핏',
    '자신에게 투자하는 것이 가장 좋은 투자일 수 있다. — 워런 버핏',
    '조급한 매매보다 오래 버틸 수 있는 판단이 중요하다. — 워런 버핏',
    '모든 공을 칠 필요는 없다. 좋은 공이 올 때까지 기다려라. — 워런 버핏',
    '투자는 IQ보다 기질이 더 중요하다. — 워런 버핏',
    '훌륭한 기업은 시간이 지날수록 가치를 드러낸다. — 워런 버핏',
    '싼 가격보다 중요한 것은 좋은 사업을 제대로 이해하는 것이다. — 워런 버핏',
    '시장의 소음보다 기업의 현금흐름을 보라. — 워런 버핏',
    '빚에 기대는 투자는 좋은 판단도 위험하게 만든다. — 워런 버핏',
    '현금은 기회가 왔을 때 행동할 수 있게 해 준다. — 워런 버핏',
    '큰돈은 잦은 매매가 아니라 기다림에서 나온다. — 찰리 멍거',
    '똑똑해지려 애쓰기보다 어리석은 행동을 피하라. — 찰리 멍거',
    '문제를 풀기 어렵다면 거꾸로 생각해 보라. — 찰리 멍거',
    '평판과 정직함은 한순간에 사라질 수 있는 자산이다. — 찰리 멍거',
    '좋은 사업을 오래 보유하는 것이 복리의 핵심이다. — 찰리 멍거',
    '인센티브를 이해하면 사람의 행동을 더 잘 이해할 수 있다. — 찰리 멍거',
    '자주 움직일수록 실수할 기회도 늘어난다. — 찰리 멍거',
    '투자는 기다리는 능력을 요구한다. — 찰리 멍거',
    '좋은 판단은 여러 분야의 지식을 연결할 때 나온다. — 찰리 멍거',
    '질 좋은 사업은 시간이 투자자의 편이 되게 만든다. — 찰리 멍거',
    '기회가 드물다면 준비된 사람이 유리하다. — 찰리 멍거',
    '매일 똑똑해지기보다 매일 덜 어리석어져라. — 찰리 멍거',
    '성공은 복잡한 공식보다 기본기를 지키는 데서 온다. — 찰리 멍거',
    '좋은 투자는 인내심 없는 사람에게 불편하게 느껴진다. — 찰리 멍거',
    '세상 모든 실수를 직접 경험할 필요는 없다. 남의 실수에서 배워라. — 찰리 멍거',
    '탁월한 결과는 드문 기회에 크게 행동할 때 나온다. — 찰리 멍거',
    '좋은 사업을 비싸게 사는 실수를 경계하라. — 찰리 멍거',
    '투자에서 가장 위험한 말은 대충 안다는 착각이다. — 찰리 멍거',
    '단순함을 유지하는 것이 장기 성과에 도움이 된다. — 찰리 멍거',
    '시장을 이기려면 먼저 자신의 충동을 이겨야 한다. — 찰리 멍거',
    '안전마진은 투자자의 방어막이다. — 벤저민 그레이엄',
    '단기 시장은 인기투표지만 장기 시장은 저울이다. — 벤저민 그레이엄',
    '현명한 투자자는 낙관론자에게 팔고 비관론자에게 산다. — 벤저민 그레이엄',
    '가격 변동은 명령이 아니라 제안일 뿐이다. — 벤저민 그레이엄',
    '투자는 분석에 근거해야 하고 투기는 기대에 의존한다. — 벤저민 그레이엄',
    'Mr. Market의 기분에 휘둘리지 말고 이용하라. — 벤저민 그레이엄',
    '가치보다 충분히 싸게 사는 것이 실수에 대비하는 방법이다. — 벤저민 그레이엄',
    '손실을 막는 원칙이 수익을 만드는 원칙보다 먼저다. — 벤저민 그레이엄',
    '시장은 때로 비이성적이지만 가치는 결국 반영된다. — 벤저민 그레이엄',
    '확실하지 않을수록 안전마진은 더 커야 한다. — 벤저민 그레이엄',
    '투자자는 가격보다 가치를 먼저 계산해야 한다. — 벤저민 그레이엄',
    '좋은 분석은 흥분보다 차분함에서 나온다. — 벤저민 그레이엄',
    '방어적인 투자자는 과도한 자신감을 피한다. — 벤저민 그레이엄',
    '원칙 없는 기대수익은 투자라기보다 투기에 가깝다. — 벤저민 그레이엄',
    '시장의 변덕은 장기 투자자의 친구가 될 수 있다. — 벤저민 그레이엄',
    '싸다는 이유만으로 충분하지 않다. 가치와 안전마진이 필요하다. — 벤저민 그레이엄',
    '대중의 감정보다 숫자와 가치를 믿어라. — 벤저민 그레이엄',
    '실수할 가능성을 인정하는 사람이 더 오래 살아남는다. — 벤저민 그레이엄',
    '투자에서 첫 번째 질문은 얼마나 벌 수 있느냐가 아니라 얼마나 잃을 수 있느냐다. — 벤저민 그레이엄',
    '좋은 투자란 충분한 근거와 충분한 안전마진을 함께 가진 결정이다. — 벤저민 그레이엄',
    '무엇을 보유했는지, 왜 보유했는지 알아야 한다. — 피터 린치',
    '주식은 복권이 아니라 기업의 일부다. — 피터 린치',
    '기업이 잘하면 장기적으로 주가도 따라간다. — 피터 린치',
    '자신이 이해하는 곳에서 투자 아이디어를 찾을 수 있다. — 피터 린치',
    '조사를 하지 않은 투자는 희망에 가깝다. — 피터 린치',
    '하락장은 반복된다. 중요한 것은 견딜 수 있는가다. — 피터 린치',
    '주식시장에서 배짱은 지식만큼 중요하다. — 피터 린치',
    '좋은 종목도 스토리가 변하면 다시 점검해야 한다. — 피터 린치',
    '모든 종목이 성공할 필요는 없다. 큰 승자가 포트폴리오를 바꾼다. — 피터 린치',
    '주가보다 기업의 이야기가 먼저다. — 피터 린치',
    '잘 아는 사업이라도 숫자를 확인해야 한다. — 피터 린치',
    '시장을 맞히려 하기보다 좋은 회사를 찾는 데 집중하라. — 피터 린치',
    '개인 투자자는 일상 속에서 좋은 기업을 먼저 발견할 수 있다. — 피터 린치',
    '인기 없는 좋은 기업이 더 큰 기회를 줄 때가 있다. — 피터 린치',
    '급락을 견딜 배짱이 없다면 주식 비중을 낮춰야 한다. — 피터 린치',
    '종목을 사랑하지 말고 기업의 실적을 확인하라. — 피터 린치',
    '가장 큰 실수는 모르는 것을 아는 척하는 것이다. — 피터 린치',
    '좋은 투자 아이디어는 복잡한 설명을 필요로 하지 않는다. — 피터 린치',
    '주가가 내렸다는 이유만으로 싸다고 착각하지 마라. — 피터 린치',
    '성장주는 성장 스토리가 깨지는 순간 다시 봐야 한다. — 피터 린치',
    '투자의 승리 공식은 넓게 보유하고 오래 버티는 것이다. — 존 보글',
    '코스를 지켜라. 시장의 소음 때문에 계획을 바꾸지 마라. — 존 보글',
    '건초더미에서 바늘을 찾지 말고 건초더미 전체를 사라. — 존 보글',
    '비용은 확실한 손실이고 수익은 불확실하다. — 존 보글',
    '시간은 친구이고 충동은 적이다. — 존 보글',
    '투기에는 감정이 앞서고 투자는 감정을 줄인다. — 존 보글',
    '장기 투자자는 시장을 예측하지 않아도 된다. — 존 보글',
    '낮은 비용은 투자자가 통제할 수 있는 가장 강력한 변수다. — 존 보글',
    '시장 전체를 보유하면 개별 종목 실수를 줄일 수 있다. — 존 보글',
    '가만히 있는 능력은 투자자의 경쟁력이다. — 존 보글',
    '복잡한 상품보다 단순한 인덱스가 더 오래 살아남는다. — 존 보글',
    '수익률을 쫓는 행동이 수익률을 낮출 수 있다. — 존 보글',
    '투자자는 미래를 알 수 없지만 비용은 줄일 수 있다. — 존 보글',
    '분산과 낮은 비용, 장기 보유가 기본이다. — 존 보글',
    '시장은 장기적으로 기업 전체의 성과를 반영한다. — 존 보글',
    '자주 확인할수록 흔들릴 이유만 늘어난다. — 존 보글',
    '투자 계획은 감정이 아니라 원칙으로 유지해야 한다. — 존 보글',
    '지루한 투자가 가장 강한 결과를 만들 수 있다. — 존 보글',
    '시장의 평균을 꾸준히 받는 것도 강한 전략이다. — 존 보글',
    '장기 투자에서 가장 큰 적은 비용과 감정이다. — 존 보글',
    '뛰어난 투자는 남들과 다르게, 더 깊게 생각하는 데서 시작된다. — 하워드 막스',
    '위험은 변동성이 아니라 영구 손실 가능성에 가깝다. — 하워드 막스',
    '리스크를 없앨 수는 없지만 통제할 수는 있다. — 하워드 막스',
    '가격이 높을수록 미래 수익률의 안전마진은 줄어든다. — 하워드 막스',
    '사이클을 무시하는 투자자는 반복해서 놀라게 된다. — 하워드 막스',
    '좋은 자산도 너무 비싸게 사면 나쁜 투자가 된다. — 하워드 막스',
    '투자에서 중요한 것은 맞히는 빈도보다 손익의 비대칭이다. — 하워드 막스',
    '방어는 약세장이 오기 전에 준비해야 한다. — 하워드 막스',
    '대중이 확신할수록 반대로 생각할 필요가 커진다. — 하워드 막스',
    '수익은 가격과 가치의 차이를 이해할 때 생긴다. — 하워드 막스',
    '성공한 투자는 확률 게임을 잘하는 것이다. — 하워드 막스',
    '너무 좋은 분위기는 위험을 싸게 보이게 만든다. — 하워드 막스',
    '시장의 심리는 가격을 가치에서 멀어지게 만들 수 있다. — 하워드 막스',
    '보수적인 투자는 기회를 포기하는 것이 아니라 생존 확률을 높이는 것이다. — 하워드 막스',
    '리스크 관리는 수익률이 좋을 때 가장 필요하다. — 하워드 막스',
    '2차적 사고는 모두가 보는 것을 다르게 해석하는 능력이다. — 하워드 막스',
    '최고의 매수는 대개 가장 편안한 순간에 오지 않는다. — 하워드 막스',
    '위험을 인식하지 못하는 것이 가장 큰 위험이다. — 하워드 막스',
    '시장이 극단에 가까워질수록 신중함은 더 중요하다. — 하워드 막스',
    '투자는 확실성의 게임이 아니라 확률의 게임이다. — 하워드 막스',
    '최대 비관의 시기는 최고의 매수 기회가 될 수 있다. — 존 템플턴',
    '최대 낙관의 시기는 매도를 고민할 때다. — 존 템플턴',
    '강세장은 비관에서 태어나 회의 속에 자라고 낙관 속에 성숙한다. — 존 템플턴',
    '환희가 시장을 지배할 때 강세장은 위험해진다. — 존 템플턴',
    '가장 좋은 기회는 사람들이 외면하는 곳에 있다. — 존 템플턴',
    '남들이 팔 때 살 수 있는 용기가 필요하다. — 존 템플턴',
    '이번에는 다르다는 말은 대개 가장 위험하다. — 존 템플턴',
    '세계 어디든 싼 가치가 있다면 찾아볼 수 있어야 한다. — 존 템플턴',
    '비관론은 가격을 낮추고, 낮은 가격은 기회를 만든다. — 존 템플턴',
    '군중이 싫어하는 자산을 차분히 살펴보라. — 존 템플턴',
    '투자자는 낙관주의자이되 가격에는 냉정해야 한다. — 존 템플턴',
    '위대한 기회는 대중의 관심 밖에서 시작된다. — 존 템플턴',
    '최악의 뉴스가 항상 최악의 투자를 의미하지는 않는다. — 존 템플턴',
    '가격이 충분히 낮다면 불확실성도 보상받을 수 있다. — 존 템플턴',
    '비관 속에서 산 사람은 낙관 속에서 팔 준비를 해야 한다. — 존 템플턴',
    '시장은 감정의 극단에서 가장 큰 실수를 만든다. — 존 템플턴',
    '기회는 편안한 곳보다 불편한 곳에서 자주 나온다. — 존 템플턴',
    '군중과 반대로 가려면 근거와 용기가 함께 필요하다. — 존 템플턴',
    '장기 수익은 가장 인기 없는 순간의 판단에서 시작될 수 있다. — 존 템플턴',
    '투자자는 공포를 피하는 사람이 아니라 공포를 분석하는 사람이다. — 존 템플턴',
    '큰돈은 맞히는 것보다 끝까지 버티는 데서 나왔다. — 제시 리버모어',
    '시장은 틀리지 않는다. 의견이 틀릴 뿐이다. — 제시 리버모어',
    '계속 행동하려는 욕구가 많은 손실을 만든다. — 제시 리버모어',
    '손실은 작을 때 인정해야 한다. — 제시 리버모어',
    '추세가 살아 있다면 조급하게 내릴 필요가 없다. — 제시 리버모어',
    '맞고도 버티지 못하면 큰돈은 벌기 어렵다. — 제시 리버모어',
    '매일 돈을 벌어야 한다는 생각은 트레이더를 망친다. — 제시 리버모어',
    '손실 포지션에 물타기하는 것은 위험한 습관이다. — 제시 리버모어',
    '시장을 설득하려 하지 말고 시장의 말을 들어라. — 제시 리버모어',
    '가격 움직임 앞에서 자존심은 비용이 된다. — 제시 리버모어',
    '매수보다 중요한 것은 언제 틀렸는지 아는 것이다. — 제시 리버모어',
    '큰 추세는 인내한 사람에게 보상한다. — 제시 리버모어',
    '좋은 판단도 조급한 청산으로 무너질 수 있다. — 제시 리버모어',
    '시장은 개인의 희망을 신경 쓰지 않는다. — 제시 리버모어',
    '잦은 매매는 기회보다 실수를 더 많이 만든다. — 제시 리버모어',
    '큰돈은 조용히 앉아 있을 줄 아는 사람에게 간다. — 제시 리버모어',
    '투기에서 살아남으려면 먼저 손실을 제한해야 한다. — 제시 리버모어',
    '가격이 말하는 방향을 무시하지 마라. — 제시 리버모어',
    '확신보다 중요한 것은 틀렸을 때 빠져나오는 능력이다. — 제시 리버모어',
    '트레이딩에서 자제력은 분석력만큼 중요하다. — 제시 리버모어',
    '주식시장은 돈과 심리로 움직인다. — 앙드레 코스톨라니',
    '주인은 천천히 걷고 개는 앞뒤로 뛰지만 결국 함께 간다. — 앙드레 코스톨라니',
    '투자자는 돈, 생각, 인내를 가져야 한다. — 앙드레 코스톨라니',
    '주식시장에서 가장 비싼 것은 조급함이다. — 앙드레 코스톨라니',
    '대중이 흥분할 때는 한 걸음 물러나라. — 앙드레 코스톨라니',
    '좋은 투자자는 시장의 기분을 읽되 따라가지 않는다. — 앙드레 코스톨라니',
    '가격은 심리에 흔들리지만 가치는 시간이 필요하다. — 앙드레 코스톨라니',
    '투자에는 상상력도 필요하지만 인내가 더 필요하다. — 앙드레 코스톨라니',
    '빚으로 투자하면 시간이 적이 된다. — 앙드레 코스톨라니',
    '주식은 인내심 없는 사람의 돈을 인내심 있는 사람에게 옮긴다. — 앙드레 코스톨라니',
    '대중과 같은 생각을 하면서 대중보다 나은 결과를 기대하기 어렵다. — 앙드레 코스톨라니',
    '시장에는 논리보다 심리가 먼저 움직이는 날이 많다. — 앙드레 코스톨라니',
    '기다림 없는 투자는 투기와 가까워진다. — 앙드레 코스톨라니',
    '돈이 급한 투자자는 시장의 변덕을 견디기 어렵다. — 앙드레 코스톨라니',
    '하락은 고통스럽지만 기회의 언어이기도 하다. — 앙드레 코스톨라니',
    '시장을 너무 자주 보면 생각보다 감정이 앞선다. — 앙드레 코스톨라니',
    '인내심은 투자자의 숨은 자본이다. — 앙드레 코스톨라니',
    '좋은 아이디어도 시간이 없으면 실패할 수 있다. — 앙드레 코스톨라니',
    '투자자는 군중의 환호보다 자신의 판단을 믿어야 한다. — 앙드레 코스톨라니',
    '시장에서 오래 살아남는 사람이 결국 많은 것을 배운다. — 앙드레 코스톨라니',
    '고통은 성찰을 만나야 진보가 된다. — 레이 달리오',
    '모르는 것을 인정하는 것이 리스크 관리의 시작이다. — 레이 달리오',
    '상관관계가 낮은 자산을 섞으면 포트폴리오가 더 안정될 수 있다. — 레이 달리오',
    '원칙이 없으면 위기 때 감정이 결정을 대신한다. — 레이 달리오',
    '현실을 있는 그대로 보는 능력이 좋은 의사결정의 출발점이다. — 레이 달리오',
    '투자자는 확신보다 검증 가능한 원칙을 가져야 한다. — 레이 달리오',
    '분산은 무지를 숨기는 것이 아니라 불확실성을 인정하는 방법이다. — 레이 달리오',
    '자신의 약점을 모르면 시장이 대신 알려준다. — 레이 달리오',
    '좋은 시스템은 감정적인 순간에도 같은 기준을 적용한다. — 레이 달리오',
    '큰 그림을 이해하면 단기 소음에 덜 흔들린다. — 레이 달리오',
    '중요한 것은 맞고 틀림이 아니라 맞을 때 얼마나 벌고 틀릴 때 얼마나 잃느냐다. — 조지 소로스',
    '시장은 현실을 반영할 뿐 아니라 현실에 영향을 주기도 한다. — 조지 소로스',
    '틀렸다는 것을 빨리 인정하는 능력은 강한 무기다. — 조지 소로스',
    '생존이 먼저이고 수익은 그다음이다. — 조지 소로스',
    '확신이 커질수록 반대 가능성도 점검해야 한다. — 조지 소로스',
    '시장의 착각은 오래 지속될 수 있다. — 조지 소로스',
    '좋은 투자자는 자신의 오류를 빠르게 수정한다. — 조지 소로스',
    '위험한 것은 틀리는 것이 아니라 틀린 채 버티는 것이다. — 조지 소로스',
    '기회가 클수록 포지션 관리가 더 중요하다. — 조지 소로스',
    '투자는 불완전한 정보 속에서 결정을 내리는 일이다. — 조지 소로스',
    '공격보다 방어가 먼저다. — 폴 튜더 존스',
    '손실 포지션에 물타기하는 사람은 결국 더 큰 위험을 만든다. — 폴 튜더 존스',
    '자본을 지키면 다음 기회가 온다. — 폴 튜더 존스',
    '시장에서 영웅이 되려 하지 마라. — 폴 튜더 존스',
    '손실을 작게 만드는 능력이 장기 성과를 만든다. — 폴 튜더 존스',
    '가격이 자신의 생각과 다르게 움직이면 먼저 리스크를 줄여라. — 폴 튜더 존스',
    '큰 수익보다 큰 손실을 피하는 것이 먼저다. — 폴 튜더 존스',
    '트레이딩에서 자존심은 손실을 키운다. — 폴 튜더 존스',
    '방어적인 마음가짐은 약함이 아니라 생존 전략이다. — 폴 튜더 존스',
    '손실 관리 없는 공격은 오래가지 못한다. — 폴 튜더 존스',
    '손실은 작을 때 자르는 것이 원칙이다. — 윌리엄 오닐·마크 미너비니',
    '강한 주식은 강한 이유가 있다. — 윌리엄 오닐·마크 미너비니',
    '추세와 싸우지 마라. — 윌리엄 오닐·마크 미너비니',
    '차트는 의견보다 빠르게 위험을 보여줄 때가 있다. — 윌리엄 오닐·마크 미너비니',
    '큰 승자를 잡으려면 먼저 큰 패자를 피해야 한다. — 윌리엄 오닐·마크 미너비니',
    '규칙 없는 매매는 감정의 기록일 뿐이다. — 윌리엄 오닐·마크 미너비니',
    '시장의 리더를 찾되 리스크는 숫자로 제한하라. — 윌리엄 오닐·마크 미너비니',
    '매수보다 중요한 것은 틀렸을 때의 행동이다. — 윌리엄 오닐·마크 미너비니',
    '좋은 진입도 나쁜 손절 습관을 이기지 못한다. — 윌리엄 오닐·마크 미너비니',
    '강세장에서는 강한 종목이 더 강해질 수 있다. — 윌리엄 오닐·마크 미너비니',
    '대부분의 투자자에게 시장 전체를 보유하는 것이 합리적이다. — 버턴 말킬',
    '시장을 맞히기 어렵다면 낮은 비용으로 오래 참여하라. — 버턴 말킬',
    '무작위처럼 보이는 가격 움직임에 과도한 의미를 붙이지 마라. — 버턴 말킬',
    '인덱스 투자는 단순하지만 강력한 선택이다. — 버턴 말킬',
    '예측이 어렵다면 비용과 분산을 통제하라. — 버턴 말킬',
    '투자자는 자신이 통제할 수 있는 것에 집중해야 한다. — 버턴 말킬',
    '장기적으로 시장에 머무는 것이 시장을 맞히는 것보다 현실적이다. — 버턴 말킬',
    '유행하는 전략보다 검증된 단순함이 오래간다. — 버턴 말킬',
    '복잡한 예측은 낮은 비용의 힘을 자주 이기지 못한다. — 버턴 말킬',
    '평균을 꾸준히 얻는 전략은 생각보다 강하다. — 버턴 말킬',
    '훌륭한 기업은 숫자 너머의 질적 요소가 있다. — 필립 피셔',
    '성장주는 경영진과 시장 기회를 함께 봐야 한다. — 필립 피셔',
    '좋은 기업은 오래 보유할수록 진가가 드러날 수 있다. — 필립 피셔',
    '기업을 이해하려면 주변의 목소리까지 조사하라. — 필립 피셔',
    '매도는 매수보다 더 어려운 결정일 수 있다. — 필립 피셔',
    '장기 성장 기업은 단기 변동을 견딜 이유를 제공한다. — 필립 피셔',
    '좋은 경영진은 숫자에 보이지 않는 가치를 만든다. — 필립 피셔',
    '성장 가능성과 가격을 함께 보라. — 필립 피셔',
    '기업의 질을 모르면 장기 보유도 흔들린다. — 필립 피셔',
    '훌륭한 기업은 시간이 투자자의 친구가 되게 한다. — 필립 피셔',
    '안전마진은 불확실성을 인정하는 투자자의 언어다. — 세스 클라만',
    '가치투자는 인기보다 가격과 가치의 차이를 본다. — 세스 클라만',
    '위험은 남들이 위험하지 않다고 느낄 때 커질 수 있다. — 세스 클라만',
    '인내심은 가치투자자의 가장 중요한 자산 중 하나다. — 세스 클라만',
    '싼 가격에도 이유가 있는지 확인해야 한다. — 세스 클라만',
    '손실을 피하려는 태도가 장기 수익의 기반이 된다. — 세스 클라만',
    '좋은 기회는 자주 오지 않기 때문에 현금이 필요할 수 있다. — 세스 클라만',
    '투자자는 시장의 인기가 아니라 자신의 분석에 의존해야 한다. — 세스 클라만',
    '가치와 가격의 괴리가 클수록 기회도 커질 수 있다. — 세스 클라만',
    '안전마진 없는 확신은 위험한 자신감이다. — 세스 클라만',
    '좋은 회사를 싸게 사는 원칙은 단순하지만 쉽지 않다. — 조엘 그린블라트',
    '수익률이 높은 사업과 낮은 가격이 만나면 기회가 된다. — 조엘 그린블라트',
    '단순한 원칙도 지키지 못하면 성과가 나지 않는다. — 조엘 그린블라트',
    '가치투자는 지루해 보여도 시간이 필요하다. — 조엘 그린블라트',
    '시장이 단기적으로 틀릴 수 있다는 사실이 기회를 만든다. — 조엘 그린블라트',
    '좋은 전략은 모두가 따라 하기 어려워야 오래간다. — 조엘 그린블라트',
    '가격이 가치보다 낮을 때 투자자의 우위가 생긴다. — 조엘 그린블라트',
    '기업의 질과 가격을 함께 봐야 한다. — 조엘 그린블라트',
    '장기적으로 숫자는 이야기보다 강하다. — 조엘 그린블라트',
    '인내 없이 가치투자를 하기는 어렵다. — 조엘 그린블라트',
    '동전 던지기에서 앞면이면 크게 벌고 뒷면이면 적게 잃는 구조를 찾아라. — 모니시 파브라이',
    '단순한 아이디어가 큰 수익을 만들 수 있다. — 모니시 파브라이',
    '좋은 투자자는 훌륭한 투자자의 원칙을 복제할 줄 안다. — 모니시 파브라이',
    '하방은 제한하고 상방은 열어 두는 투자가 좋다. — 모니시 파브라이',
    '복잡한 문제보다 명확한 기회를 기다려라. — 모니시 파브라이',
    '투자자는 많은 결정보다 좋은 결정을 해야 한다. — 모니시 파브라이',
    '가끔 오는 확실한 기회에 집중하라. — 모니시 파브라이',
    '잃을 가능성을 먼저 계산하면 더 오래 살아남는다. — 모니시 파브라이',
    '좋은 투자는 설명이 단순해야 한다. — 모니시 파브라이',
    '기다림은 가치투자의 일부다. — 모니시 파브라이',
    '훌륭한 기업과 오래 동행하는 것이 가장 강한 전략이 될 수 있다. — 닉 슬립',
    '투자자는 거래자가 아니라 소유자가 되어야 한다. — 닉 슬립',
    '장기 관점은 경쟁자가 쉽게 따라 하기 어렵다. — 닉 슬립',
    '좋은 기업 문화는 시간이 지날수록 복리처럼 작동한다. — 닉 슬립',
    '고객을 오래 생각하는 기업은 투자자에게도 보상할 수 있다. — 닉 슬립',
    '진정한 장기 투자는 분기 실적의 소음을 견딘다. — 닉 슬립',
    '훌륭한 기업의 내재가치는 느리지만 강하게 쌓인다. — 닉 슬립',
    '소유자의 관점은 매매 충동을 줄여 준다. — 닉 슬립',
    '오래 보유할수록 기업의 질이 중요해진다. — 닉 슬립',
    '장기 동행할 기업을 찾는 것이 잦은 매매보다 낫다. — 닉 슬립',
    '떨어지는 칼날을 무조건 잡으려 하지 마라. — 월가 격언',
    '소문에 사고 뉴스에 팔라는 말은 군중 심리를 경계하라는 뜻이다. — 월가 격언',
    '강세장에서는 모두가 똑똑해 보인다. — 월가 격언',
    '손실은 빠르게 자르고 이익은 오래 키워라. — 월가 격언',
    '시장은 희망보다 냉정하다. — 월가 격언',
    '추세는 친구일 수 있지만 끝나는 순간도 있다. — 월가 격언',
    '돈을 잃지 않는 법을 먼저 배워라. — 월가 격언',
    '분산은 한 번의 실수를 치명상으로 만들지 않게 한다. — 월가 격언',
    '레버리지는 시간을 압축하지만 실수도 압축한다. — 월가 격언',
    '시장은 언제나 다음 교훈을 준비하고 있다. — 월가 격언',
    '훌륭한 투자 기회는 자주 오지 않으니, 왔을 때 준비되어 있어야 한다. — 워런 버핏',
    '장기적으로 보유할 마음이 없다면 단기 매수도 신중해야 한다. — 워런 버핏',
    '시장의 가격표가 매일 바뀐다고 기업의 본질이 매일 바뀌지는 않는다. — 워런 버핏',
    '사업을 이해하는 능력은 복잡한 예측보다 더 강한 무기다. — 워런 버핏',
    '좋은 기업은 시간이 지날수록 투자자의 실수를 줄여 준다. — 워런 버핏',
    '대중의 공포는 준비된 투자자에게 할인된 가격표가 될 수 있다. — 워런 버핏',
    '모든 기회를 잡으려는 욕심보다 확실한 기회를 기다리는 인내가 낫다. — 워런 버핏',
    '투자는 멋진 행동보다 합리적인 행동을 요구한다. — 워런 버핏',
    '싸게 보이는 주식보다 오래 벌 수 있는 사업을 먼저 보라. — 워런 버핏',
    '좋은 기업을 오래 보유하는 일은 생각보다 지루하고, 그 지루함이 성과가 된다. — 워런 버핏',
    '투자에서 가장 큰 우위는 자신이 모르는 것을 인정하는 태도다. — 찰리 멍거',
    '좋은 사업을 찾았다면 불필요한 행동을 줄이는 것이 도움이 된다. — 찰리 멍거',
    '인내심은 지식과 함께할 때 강력한 투자 도구가 된다. — 찰리 멍거',
    '많은 실수는 복잡한 것을 단순하게 보지 못해서 생긴다. — 찰리 멍거',
    '투자자는 자신이 왜 틀릴 수 있는지 먼저 생각해야 한다. — 찰리 멍거',
    '최고의 투자자는 매일 거래하는 사람이 아니라 오래 기다리는 사람일 수 있다. — 찰리 멍거',
    '거꾸로 생각하면 피해야 할 길이 먼저 보인다. — 찰리 멍거',
    '남의 실수를 배우는 것은 가장 저렴한 수업료다. — 찰리 멍거',
    '복리는 좋은 기업과 긴 시간이 만날 때 강해진다. — 찰리 멍거',
    '좋은 기질은 뛰어난 지능보다 투자 성과에 더 오래 남는다. — 찰리 멍거',
    '가치와 가격의 차이를 모르면 투자자는 시장의 기분에 끌려간다. — 벤저민 그레이엄',
    '시장은 매일 기회를 주지만 매일 따를 필요는 없다. — 벤저민 그레이엄',
    '투자자는 시장의 하인이 아니라 시장의 주인이 되어야 한다. — 벤저민 그레이엄',
    '안전마진은 미래를 모른다는 사실에 대한 보험이다. — 벤저민 그레이엄',
    '주가가 떨어진다고 항상 위험해지는 것은 아니며, 비싸게 사는 것이 더 위험할 수 있다. — 벤저민 그레이엄',
    '분석 없는 확신은 투자자를 투기꾼으로 만든다. — 벤저민 그레이엄',
    '가격 변동은 투자자의 감정을 시험하지만, 가치는 투자자의 이성을 요구한다. — 벤저민 그레이엄',
    '시장 가격은 사실이지만 항상 진실은 아니다. — 벤저민 그레이엄',
    '충분히 싸게 사는 것은 완벽한 미래 예측보다 현실적인 방어다. — 벤저민 그레이엄',
    '현명한 투자자는 인기보다 안전마진을 먼저 찾는다. — 벤저민 그레이엄',
    '주식을 사기 전에는 그 회사가 어떻게 돈을 버는지 설명할 수 있어야 한다. — 피터 린치',
    '좋은 투자 아이디어는 먼 곳보다 일상 가까이에 있을 수 있다. — 피터 린치',
    '주가가 아니라 기업의 스토리가 계속 유지되는지 확인하라. — 피터 린치',
    '하락을 견딜 마음이 없다면 상승의 열매도 오래 누리기 어렵다. — 피터 린치',
    '종목 이름보다 그 기업의 실적과 전망을 알아야 한다. — 피터 린치',
    '시장을 예측하는 데 시간을 쓰기보다 기업을 연구하는 데 시간을 써라. — 피터 린치',
    '한두 번의 실패가 전체 투자를 망치지 않도록 구조를 만들어라. — 피터 린치',
    '성공하는 종목은 시간이 필요하고, 실패하는 종목은 점검이 필요하다. — 피터 린치',
    '모르는 기업을 사는 것은 남의 이야기에 돈을 맡기는 것이다. — 피터 린치',
    '주식은 숫자와 이야기, 둘 다 확인해야 한다. — 피터 린치',
    '평범한 시장수익률을 꾸준히 얻는 것은 결코 평범한 일이 아니다. — 존 보글',
    '투자자는 시장 전체의 성과를 얻기 위해 복잡한 예측을 할 필요가 없다. — 존 보글',
    '낮은 비용은 시간이 지날수록 투자자의 편에 선다. — 존 보글',
    '가만히 있는 전략은 쉬워 보이지만 실제로는 가장 어렵다. — 존 보글',
    '인덱스 투자의 힘은 천재적인 선택이 아니라 불필요한 선택을 줄이는 데 있다. — 존 보글',
    '장기 투자자는 하루의 뉴스보다 수십 년의 복리를 본다. — 존 보글',
    '투자의 기본은 더 많이 맞히는 것이 아니라 덜 새는 구조를 만드는 것이다. — 존 보글',
    '비용과 세금, 감정을 낮추면 장기 성과는 더 좋아질 수 있다. — 존 보글',
    '시장에 남아 있는 시간이 시장 타이밍보다 중요하다. — 존 보글',
    '단순한 포트폴리오는 위기 때도 지키기 쉽다. — 존 보글',
    '좋은 투자자는 무엇을 살지뿐 아니라 얼마에 살지를 묻는다. — 하워드 막스',
    '모두가 낙관할 때는 좋은 뉴스보다 가격을 의심해야 한다. — 하워드 막스',
    '모두가 두려워할 때는 나쁜 뉴스보다 가격을 다시 봐야 한다. — 하워드 막스',
    '리스크는 보이지 않을 때 가장 위험하다. — 하워드 막스',
    '투자자는 미래를 맞히는 사람이 아니라 확률을 유리하게 만드는 사람이다. — 하워드 막스',
    '싸이클의 끝에서는 논리보다 심리가 가격을 밀어 올린다. — 하워드 막스',
    '위험을 잘 관리하면 수익을 얻을 기회가 다시 온다. — 하워드 막스',
    '남들과 같은 생각으로는 남들과 다른 결과를 얻기 어렵다. — 하워드 막스',
    '최고의 매수 기회는 대개 가장 불편한 뉴스와 함께 온다. — 하워드 막스',
    '성공한 투자자는 확실성보다 불확실성의 가격을 본다. — 하워드 막스',
    '절망적인 분위기 속에서도 가격이 충분히 낮다면 기회는 존재한다. — 존 템플턴',
    '모두가 좋아하는 시장은 이미 많은 기대를 가격에 담고 있을 수 있다. — 존 템플턴',
    '비관은 투자자의 눈을 가리지만 가치투자자에게는 지도일 수 있다. — 존 템플턴',
    '대중이 버린 곳에서 가장 큰 할인율이 나타날 수 있다. — 존 템플턴',
    '시장이 환호할 때는 수익보다 위험을 먼저 계산하라. — 존 템플턴',
    '가장 인기 없는 시장이 가장 좋은 출발점이 될 때가 있다. — 존 템플턴',
    '비관이 지나치면 가격은 가치보다 더 멀리 내려갈 수 있다. — 존 템플턴',
    '세계 어디든 기회는 있고, 군중의 시야는 늘 제한적이다. — 존 템플턴',
    '두려움 속에서 산다는 것은 용기만이 아니라 분석을 요구한다. — 존 템플턴',
    '낙관의 끝에서는 기대보다 안전마진을 봐야 한다. — 존 템플턴',
    '시장과 싸우기 시작하면 손실은 자존심의 비용이 된다. — 제시 리버모어',
    '틀렸다는 신호가 나오면 고집보다 퇴장이 먼저다. — 제시 리버모어',
    '큰 추세를 맞히고도 너무 일찍 내리면 큰돈은 남지 않는다. — 제시 리버모어',
    '매일 거래하려는 욕심은 시장을 월급처럼 착각하게 만든다. — 제시 리버모어',
    '가격이 내 편이 아닐 때는 이유보다 리스크를 먼저 줄여라. — 제시 리버모어',
    '투기에서 희망은 계획이 아니다. — 제시 리버모어',
    '잘못된 포지션은 작을 때 정리해야 다시 기회를 볼 수 있다. — 제시 리버모어',
    '시장은 개인의 확신보다 더 오래 움직일 수 있다. — 제시 리버모어',
    '앉아 있는 능력과 빠져나오는 능력은 둘 다 필요하다. — 제시 리버모어',
    '추세를 따르되 손실은 제한하라. — 제시 리버모어',
    '주가는 때로 경제보다 심리를 먼저 반영한다. — 앙드레 코스톨라니',
    '인내가 없는 돈은 시장에서 오래 살아남기 어렵다. — 앙드레 코스톨라니',
    '군중은 대개 늦게 흥분하고 늦게 두려워한다. — 앙드레 코스톨라니',
    '시장의 개는 앞서 뛰지만 결국 주인에게 돌아온다. — 앙드레 코스톨라니',
    '좋은 아이디어도 시간이 없으면 좋은 투자가 되기 어렵다. — 앙드레 코스톨라니',
    '빚은 투자자의 인내심을 빼앗는다. — 앙드레 코스톨라니',
    '시장에서 돈보다 먼저 필요한 것은 버틸 수 있는 시간이다. — 앙드레 코스톨라니',
    '대중의 감정은 가격을 흔들지만 영원히 지배하지는 못한다. — 앙드레 코스톨라니',
    '투자자는 소음 속에서 방향을 잃지 않는 사람이 되어야 한다. — 앙드레 코스톨라니',
    '주식시장은 계산기와 심리학 책을 함께 요구한다. — 앙드레 코스톨라니',
    '분산은 확신이 아니라 겸손에서 출발한다. — 레이 달리오',
    '좋은 원칙은 좋은 날보다 나쁜 날에 더 필요하다. — 레이 달리오',
    '자신의 약점을 알면 포트폴리오도 더 현실적으로 만들 수 있다. — 레이 달리오',
    '불확실한 세상에서는 한 가지 결과에 모든 것을 걸지 말아야 한다. — 레이 달리오',
    '고통스러운 손실도 제대로 복기하면 다음 판단의 재료가 된다. — 레이 달리오',
    '시장보다 먼저 자신이 어떤 사람인지 알아야 한다. — 레이 달리오',
    '서로 다른 위험을 섞는 것은 오래 버티기 위한 기술이다. — 레이 달리오',
    '현실을 부정하는 투자는 언젠가 현실에 의해 조정된다. — 레이 달리오',
    '좋은 의사결정은 감정보다 원칙과 피드백에 의존한다. — 레이 달리오',
    '투자자는 확신이 아니라 균형을 설계해야 할 때가 많다. — 레이 달리오',
    '틀린 판단을 빨리 고치면 손실은 수업료로 끝날 수 있다. — 조지 소로스',
    '시장의 착각을 이해하면 기회와 위험을 동시에 볼 수 있다. — 조지 소로스',
    '포지션 크기는 확신만큼이나 중요하다. — 조지 소로스',
    '맞았을 때 크게 벌고 틀렸을 때 작게 잃는 구조가 중요하다. — 조지 소로스',
    '투자는 완벽한 예측보다 오류 수정 능력을 요구한다. — 조지 소로스',
    '살아남는 투자자는 자신의 생각을 바꿀 줄 안다. — 조지 소로스',
    '시장은 참여자의 믿음에 의해 더 크게 흔들릴 수 있다. — 조지 소로스',
    '강한 확신도 손실 제한 규칙 없이는 위험하다. — 조지 소로스',
    '자신이 틀렸음을 알게 되는 순간이 가장 중요한 순간이다. — 조지 소로스',
    '시장의 기회는 대개 불완전한 정보 속에서 나타난다. — 조지 소로스',
    '자본을 지키는 사람만 다음 추세를 잡을 수 있다. — 폴 튜더 존스',
    '손실이 커지기 전에 작게 인정하는 것이 프로의 습관이다. — 폴 튜더 존스',
    '위험을 줄이는 것은 겁이 아니라 전략이다. — 폴 튜더 존스',
    '매수 이유보다 손실 제한 계획이 먼저 준비되어야 한다. — 폴 튜더 존스',
    '시장은 자존심을 보상하지 않는다. — 폴 튜더 존스',
    '좋은 트레이더는 먼저 살아남고 그다음에 번다. — 폴 튜더 존스',
    '방어를 잘하는 투자자는 공격할 기회를 잃지 않는다. — 폴 튜더 존스',
    '틀린 포지션을 오래 들고 있는 것은 분석이 아니라 고집이다. — 폴 튜더 존스',
    '리스크를 통제하면 마음도 통제된다. — 폴 튜더 존스',
    '큰 손실을 피하는 것이 복리의 출발점이다. — 폴 튜더 존스',
    '시장의 리더는 약세장 이후 먼저 힘을 보일 때가 많다. — 윌리엄 오닐·마크 미너비니',
    '손절 규칙은 감정이 아니라 숫자로 정해야 한다. — 윌리엄 오닐·마크 미너비니',
    '추세를 무시하면 좋은 분석도 손실로 끝날 수 있다. — 윌리엄 오닐·마크 미너비니',
    '강한 종목을 비싸다는 이유만으로 무시하지 마라. — 윌리엄 오닐·마크 미너비니',
    '약한 종목을 싸다는 이유만으로 붙잡지 마라. — 윌리엄 오닐·마크 미너비니',
    '좋은 매매는 시장이 틀렸다고 우기는 데서 나오지 않는다. — 윌리엄 오닐·마크 미너비니',
    '승률보다 손익비와 손실 제한이 더 중요할 수 있다. — 윌리엄 오닐·마크 미너비니',
    '차트는 미래를 보장하지 않지만 위험 신호를 줄 수 있다. — 윌리엄 오닐·마크 미너비니',
    '강한 상승에는 이유가 있고, 약한 반등에는 한계가 있다. — 윌리엄 오닐·마크 미너비니',
    '규칙을 지키는 투자자는 감정적인 시장에서도 흔들림이 줄어든다. — 윌리엄 오닐·마크 미너비니',
    '시장 전체를 보유하는 전략은 예측의 부담을 줄여 준다. — 버턴 말킬',
    '무작위에 가까운 단기 움직임을 예언하려 애쓰지 마라. — 버턴 말킬',
    '낮은 비용과 넓은 분산은 투자자가 실제로 통제할 수 있는 영역이다. — 버턴 말킬',
    '장기 인덱스 투자는 화려하지 않지만 꾸준하다. — 버턴 말킬',
    '복잡한 예측보다 단순한 참여가 더 나을 때가 많다. — 버턴 말킬',
    '평균을 우습게 보면 평균에도 못 미칠 수 있다. — 버턴 말킬',
    '시장 타이밍의 유혹은 크지만 성공 확률은 낮다. — 버턴 말킬',
    '투자자는 확실한 비용을 줄이는 데서 먼저 이긴다. — 버턴 말킬',
    '분산된 포트폴리오는 모르는 미래에 대한 현실적인 답이다. — 버턴 말킬',
    '단순한 전략은 오래 유지할 수 있을 때 더 강해진다. — 버턴 말킬',
    '위대한 기업은 매출보다 더 깊은 경쟁력을 가진다. — 필립 피셔',
    '성장 기업을 볼 때는 숫자와 사람을 함께 봐야 한다. — 필립 피셔',
    '기업의 품질은 시간이 지날수록 주가보다 더 중요해질 수 있다. — 필립 피셔',
    '좋은 경영진은 어려운 시기에 더 잘 드러난다. — 필립 피셔',
    '장기 성장주는 단기 실망보다 장기 방향성이 중요하다. — 필립 피셔',
    '깊은 조사는 확신을 만들고 확신은 인내를 만든다. — 필립 피셔',
    '좋은 기업을 너무 빨리 파는 것은 흔한 실수다. — 필립 피셔',
    '성장성만 보고 가격을 무시하면 좋은 기업도 나쁜 투자가 된다. — 필립 피셔',
    '기업 문화와 연구개발 능력은 장기 성장의 씨앗이 될 수 있다. — 필립 피셔',
    '훌륭한 회사를 찾았다면 단기 변동보다 장기 경쟁력을 보라. — 필립 피셔',
    '가치투자자는 인기 없는 가격에서 편안함을 찾아야 한다. — 세스 클라만',
    '안전마진은 투자자의 겸손을 숫자로 표현한 것이다. — 세스 클라만',
    '현금은 아무것도 하지 않는 자산이 아니라 선택권일 수 있다. — 세스 클라만',
    '하락 위험을 먼저 본 투자자는 상승 기회도 더 오래 기다릴 수 있다. — 세스 클라만',
    '싼 자산에는 이유가 있으니 가치와 함정을 구분해야 한다. — 세스 클라만',
    '시장이 무시하는 곳에서 가치는 조용히 쌓일 수 있다. — 세스 클라만',
    '확실한 기회가 없을 때 기다리는 것도 투자 결정이다. — 세스 클라만',
    '손실 회피는 소심함이 아니라 복리를 지키는 방법이다. — 세스 클라만',
    '분위기가 좋을수록 안전마진은 더 필요하다. — 세스 클라만',
    '좋은 투자는 매수 순간부터 방어력을 갖고 있어야 한다. — 세스 클라만',
    '시장이 단기적으로 비합리적이기 때문에 장기 기회가 생긴다. — 조엘 그린블라트',
    '좋은 회사를 싼 가격에 사는 원칙은 단순하지만 실천은 어렵다. — 조엘 그린블라트',
    '가치투자 전략은 지루한 기간을 견뎌야 보상받는다. — 조엘 그린블라트',
    '수익성 높은 기업을 낮은 가격에 사는 것이 핵심이다. — 조엘 그린블라트',
    '좋은 전략도 사람들이 포기할 만큼 힘든 구간이 있어야 오래 작동한다. — 조엘 그린블라트',
    '가격과 품질을 함께 보면 실수 확률을 줄일 수 있다. — 조엘 그린블라트',
    '시장은 가끔 훌륭한 기업에 잘못된 가격을 붙인다. — 조엘 그린블라트',
    '단기 성과에 흔들리지 않는 규율이 전략을 완성한다. — 조엘 그린블라트',
    '싸기만 한 기업보다 싸고 좋은 기업이 낫다. — 조엘 그린블라트',
    '투자 공식보다 중요한 것은 그 공식을 버티는 마음이다. — 조엘 그린블라트',
    '하방이 작고 상방이 큰 구조를 찾는 것이 핵심이다. — 모니시 파브라이',
    '좋은 투자 아이디어는 이해하기 쉬워야 오래 버틸 수 있다. — 모니시 파브라이',
    '기다림은 기회가 없는 시간이 아니라 기회를 고르는 시간이다. — 모니시 파브라이',
    '검증된 원칙을 따라 하는 것도 훌륭한 투자 능력이다. — 모니시 파브라이',
    '적게 잃고 크게 벌 수 있는 구조가 가치투자의 매력이다. — 모니시 파브라이',
    '복잡한 투자는 실수할 부분도 많다. — 모니시 파브라이',
    '투자자는 많은 아이디어보다 좋은 몇 개의 아이디어가 필요하다. — 모니시 파브라이',
    '불확실성이 있어도 가격이 충분히 낮다면 기회가 될 수 있다. — 모니시 파브라이',
    '큰 기회는 자주 오지 않으니 평소에는 참아야 한다. — 모니시 파브라이',
    '투자에서 단순함은 약점이 아니라 장점이 될 수 있다. — 모니시 파브라이',
    '진짜 장기 투자는 기업과 함께 시간을 보내는 일이다. — 닉 슬립',
    '훌륭한 기업은 시간이 지날수록 고객과 투자자 모두에게 가치를 줄 수 있다. — 닉 슬립',
    '거래 빈도를 줄이면 소유자의 관점이 더 선명해진다. — 닉 슬립',
    '좋은 기업 문화는 재무제표보다 늦게 보이지만 오래 남는다. — 닉 슬립',
    '장기 보유는 아무 기업이나 오래 들고 있는 것이 아니다. — 닉 슬립',
    '기업의 방향성이 맞다면 단기 변동은 소음에 가까울 수 있다. — 닉 슬립',
    '오래 동행할 기업은 고객을 대하는 방식에서 힌트를 준다. — 닉 슬립',
    '좋은 기업은 시간이 지날수록 선택지를 넓힌다. — 닉 슬립',
    '단기 매매는 가격을 보게 하고 장기 보유는 사업을 보게 한다. — 닉 슬립',
    '투자자는 가격표보다 사업의 누적 가치를 관찰해야 한다. — 닉 슬립',
    '시장은 당신이 버틸 수 있는 시간보다 더 오래 흔들릴 수 있다. — 월가 격언',
    '싸게 사는 것보다 더 중요한 것은 버틸 수 있게 사는 것이다. — 월가 격언',
    '최고의 전략도 감정적으로 지킬 수 없다면 좋은 전략이 아니다. — 월가 격언',
    '수익을 키우려면 먼저 손실이 계좌를 망치지 않게 해야 한다. — 월가 격언',
    '시장의 소음은 크지만 계좌를 지키는 것은 조용한 원칙이다. — 월가 격언',
    '현금은 조급한 사람에게 답답함이고 준비된 사람에게 기회다. — 월가 격언',
    '모두가 같은 방향을 볼 때 반대편 위험을 확인하라. — 월가 격언',
    '레버리지는 방향을 맞혀도 시간을 틀리면 위험해진다. — 월가 격언',
    '분산은 대박을 줄일 수 있지만 파산 가능성도 줄인다. — 월가 격언',
    '하락장은 포트폴리오보다 먼저 투자자의 마음을 테스트한다. — 월가 격언',
    '뉴스가 급할수록 주문은 천천히 내야 한다. — 월가 격언',
    '계좌를 오래 유지하는 사람이 다음 상승장을 볼 수 있다. — 월가 격언',
    '이익은 가능성이고 손실 제한은 책임이다. — 월가 격언',
    '매수 전에는 기대수익보다 최악의 경우를 먼저 적어 보라. — 월가 격언',
    '시장에는 확신보다 확률이 더 잘 어울린다. — 월가 격언',
  ];

  List<String> localizedQuotes(Locale locale) {
    return stockQuotes;
  }

  @override
  Widget build(BuildContext context) {
    final quotes = localizedQuotes(Localizations.localeOf(context));
    final safeIndex = currentIndex.clamp(0, quotes.length - 1).toInt();
    final quote = quotes[safeIndex];
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : _appBg;
    final cardBg = whiteMode ? _lightSurface : _darkSurface;
    final cardLine = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;
    final accent = whiteMode ? _lightBlue : _cyan;

    return Scaffold(
      backgroundColor: pageBg,
      bottomNavigationBar: buildAdOnlyBottomBar(),
      appBar: AppBar(
        title: const Text('오늘의 주식 명언'),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          buildWhiteModeButton(context),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                '${safeIndex + 1} / ${quotes.length}',
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 22),
                child: InkWell(
                  onTap: showRandomQuote,
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: cardLine),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: accent.withValues(
                                alpha: whiteMode ? 0.10 : 0.16,
                              ),
                              borderRadius: BorderRadius.circular(99),
                            ),
                            child: Text(
                              'QUOTE #${safeIndex + 1}',
                              style: TextStyle(
                                color: accent,
                                fontSize: 11,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.format_quote_rounded,
                          color: accent,
                          size: 54,
                        ),
                        const SizedBox(height: 18),
                        Text(
                          quote,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryText,
                            fontSize: 21,
                            height: 1.38,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Text(
                          '탭하면 다른 문구가 나옵니다.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: secondaryText,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 88),
              child: SizedBox(
                width: double.infinity,
                height: 46,
                child: FilledButton.icon(
                  onPressed: showRandomQuote,
                  icon: const Icon(Icons.shuffle_rounded, size: 18),
                  label: const Text('다른 명언 보기'),
                  style: FilledButton.styleFrom(
                    backgroundColor: accent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LottoNumberPage extends StatefulWidget {
  const LottoNumberPage({super.key});

  @override
  State<LottoNumberPage> createState() => _LottoNumberPageState();
}

class _LottoNumberPageState extends State<LottoNumberPage> {
  final random = math.Random();
  List<int> numbers = [];

  @override
  void initState() {
    super.initState();
    generateNumbers();
  }

  void generateNumbers() {
    final pool = List<int>.generate(45, (index) => index + 1);
    pool.shuffle(random);
    setState(() {
      numbers = pool.take(6).toList()..sort();
    });
  }

  Color ballColor(int number) {
    if (number <= 10) return const Color(0xFFF59E0B);
    if (number <= 20) return const Color(0xFF2563EB);
    if (number <= 30) return const Color(0xFFEF4444);
    if (number <= 40) return const Color(0xFF6B7280);
    return const Color(0xFF10B981);
  }

  @override
  Widget build(BuildContext context) {
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : _appBg;
    final cardBg = whiteMode ? _lightSurface : _darkSurface;
    final cardLine = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;
    final accent = whiteMode ? _lightBlue : _cyan;

    return Scaffold(
      backgroundColor: pageBg,
      bottomNavigationBar: buildAdOnlyBottomBar(),
      appBar: AppBar(
        title: const Text('로또번호 추천'),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          buildWhiteModeButton(context),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 88),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: cardLine),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: accent.withValues(
                            alpha: whiteMode ? 0.10 : 0.16,
                          ),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Icon(
                          Icons.confirmation_number_rounded,
                          color: accent,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '오늘의 추천 번호',
                              style: TextStyle(
                                color: primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '1부터 45까지 중복 없이 6개',
                              style: TextStyle(
                                color: secondaryText,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Wrap(
                    spacing: 9,
                    runSpacing: 9,
                    alignment: WrapAlignment.center,
                    children: numbers.map((number) {
                      final color = ballColor(number);
                      return Container(
                        width: 48,
                        height: 48,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: color.withValues(alpha: 0.28),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Text(
                          '$number',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: accent,
                        foregroundColor: whiteMode ? Colors.white : _appBg,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: generateNumbers,
                      icon: const Icon(Icons.refresh_rounded, size: 18),
                      label: const Text(
                        '새로 추천',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StockMemePage extends StatefulWidget {
  const StockMemePage({super.key});

  @override
  State<StockMemePage> createState() => _StockMemePageState();
}

class _StockMemePageState extends State<StockMemePage> {
  final controller = PageController(viewportFraction: 0.9);
  int currentIndex = 0;

  static const memes = <_StockMeme>[
    _StockMeme(
      title: 'STONKS',
      caption: '이유는 모르겠지만 올라감',
      punchline: '분석 끝. 매수 완료.',
      icon: Icons.trending_up_rounded,
      color: Color(0xFF2563EB),
    ),
    _StockMeme(
      title: '고점 매수 저점 매도',
      caption: '내가 사면 조정, 내가 팔면 반등',
      punchline: '시장 타이밍의 반대 교과서',
      icon: Icons.swap_vert_rounded,
      color: Color(0xFFEF4444),
    ),
    _StockMeme(
      title: '다이아몬드 손',
      caption: '계좌는 흔들려도 손은 안 흔들림',
      punchline: '버티는 중인지 묶인 건지는 비밀',
      icon: Icons.diamond_rounded,
      color: Color(0xFF06B6D4),
    ),
    _StockMeme(
      title: '종이 손',
      caption: '-1% 보고 바로 탈출',
      punchline: '손절은 빠르고 후회는 길다',
      icon: Icons.description_rounded,
      color: Color(0xFFF59E0B),
    ),
    _StockMeme(
      title: '물타기 장인',
      caption: '평단은 낮아졌는데 비중은 커짐',
      punchline: '계획이었는지 습관이었는지',
      icon: Icons.water_drop_rounded,
      color: Color(0xFF0EA5E9),
    ),
    _StockMeme(
      title: '가방 보유자',
      caption: '잠깐 들고 있으려던 포지션',
      punchline: '어느새 장기투자자가 됨',
      icon: Icons.work_rounded,
      color: Color(0xFF7C3AED),
    ),
    _StockMeme(
      title: 'FOMO 진입',
      caption: '다들 돈 번다길래 늦게 탑승',
      punchline: '내 좌석은 꼭 꼭대기에 있음',
      icon: Icons.rocket_launch_rounded,
      color: Color(0xFFEC4899),
    ),
    _StockMeme(
      title: '공포의 빨간불',
      caption: '뉴스 보기 전에는 괜찮았는데',
      punchline: '헤드라인이 손절 버튼을 누름',
      icon: Icons.warning_amber_rounded,
      color: Color(0xFFDC2626),
    ),
    _StockMeme(
      title: '이번엔 다르다',
      caption: '가장 비싼 문장',
      punchline: '차트는 조용히 예전 일을 반복함',
      icon: Icons.history_rounded,
      color: Color(0xFF14B8A6),
    ),
    _StockMeme(
      title: '달나라 간다',
      caption: '목표가는 우주, 손절가는 지하',
      punchline: '연료는 희망과 댓글',
      icon: Icons.nightlight_round,
      color: Color(0xFF6366F1),
    ),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : _appBg;
    final cardBg = whiteMode ? _lightSurface : _darkSurface;
    final cardLine = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;

    return Scaffold(
      backgroundColor: pageBg,
      bottomNavigationBar: buildAdOnlyBottomBar(),
      appBar: AppBar(
        title: const Text('주식 짤'),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          buildWhiteModeButton(context),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                '좌우로 넘겨서 보기',
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: memes.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final meme = memes[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(6, 8, 6, 22),
                    child: _StockMemeCard(
                      meme: meme,
                      number: index + 1,
                      cardBg: cardBg,
                      cardLine: cardLine,
                      primaryText: primaryText,
                      secondaryText: secondaryText,
                      whiteMode: whiteMode,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 88),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(memes.length, (index) {
                  final selected = index == currentIndex;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    width: selected ? 18 : 7,
                    height: 7,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: selected
                          ? memes[currentIndex].color
                          : secondaryText.withValues(alpha: 0.35),
                      borderRadius: BorderRadius.circular(99),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StockMeme {
  const _StockMeme({
    required this.title,
    required this.caption,
    required this.punchline,
    required this.icon,
    required this.color,
  });

  final String title;
  final String caption;
  final String punchline;
  final IconData icon;
  final Color color;
}

class _StockMemeCard extends StatelessWidget {
  const _StockMemeCard({
    required this.meme,
    required this.number,
    required this.cardBg,
    required this.cardLine,
    required this.primaryText,
    required this.secondaryText,
    required this.whiteMode,
  });

  final _StockMeme meme;
  final int number;
  final Color cardBg;
  final Color cardLine;
  final Color primaryText;
  final Color secondaryText;
  final bool whiteMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: cardLine),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: meme.color.withValues(alpha: whiteMode ? 0.10 : 0.16),
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                '주식 밈 #$number',
                style: TextStyle(
                  color: meme.color,
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              color: meme.color.withValues(alpha: whiteMode ? 0.12 : 0.18),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: meme.color.withValues(alpha: 0.24)),
            ),
            child: Icon(
              meme.icon,
              color: meme.color,
              size: 48,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            meme.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryText,
              fontSize: 27,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            meme.caption,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryText,
              fontSize: 17,
              height: 1.35,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            meme.punchline,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: secondaryText,
              fontSize: 13,
              height: 1.35,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class LongFormBookReaderPage extends StatefulWidget {
  const LongFormBookReaderPage({super.key});

  @override
  State<LongFormBookReaderPage> createState() => _LongFormBookReaderPageState();
}

class _LongFormBookReaderPageState extends State<LongFormBookReaderPage> {
  static const _bookReaderPagePrefsKey = 'long_form_book_reader_page';
  static const _bookReaderLanguagePrefsKey = 'long_form_book_reader_language';

  final pageController = PageController();
  int currentPage = 0;
  bool showEnglish = false;

  static const koreanPages = <_BookChapter>[
    _BookChapter(
      title: '원서 소개',
      body: '''
Reminiscences of a Stock Operator
Edwin Lefevre

이 독서판은 영어 원서의 흐름을 따라 한국어로 읽기 쉽게 옮긴 번역형 본문입니다. 원문을 한 문장씩 그대로 옮긴 완역본은 아니지만, 책의 이야기 전개와 핵심 장면을 따라가며 긴 글로 읽을 수 있도록 구성했습니다.

이 책의 주인공은 어린 시절 증권 중개 사무실에서 시세판을 기록하던 소년으로 시작합니다. 그는 숫자가 움직이는 방식에 매혹되고, 사람들이 왜 사고파는지보다 가격이 어떻게 움직이는지에 먼저 관심을 갖습니다. 누군가는 그를 투기꾼이라 부르고, 누군가는 천재적인 시세 읽기의 소유자라 말합니다. 그러나 이 책이 보여주는 것은 화려한 성공담만이 아닙니다.

그는 여러 번 큰돈을 벌고, 여러 번 거의 모든 것을 잃습니다. 시장을 맞힌 순간에도 사람은 무너질 수 있고, 틀렸다는 사실을 빨리 인정하지 못하면 작은 실수는 순식간에 인생을 흔드는 손실이 됩니다. 그래서 이 책은 돈을 버는 법보다, 시장 앞에서 사람이 어떻게 흔들리는지를 더 오래 보여줍니다.
''',
    ),
    _BookChapter(
      title: '1. 시세판 앞의 소년',
      body: '''
나는 아주 어릴 때부터 숫자가 움직이는 모습을 지켜보았다. 사무실 한쪽에는 시세가 적힌 판이 있었고, 사람들은 그 숫자 하나하나에 얼굴빛이 달라졌다. 어떤 사람은 가격이 조금만 올라가도 세상을 얻은 듯 웃었고, 어떤 사람은 몇 포인트 빠졌다는 말에 금세 말수가 줄었다.

처음에는 그저 일을 빨리 처리하는 소년일 뿐이었다. 누가 무슨 종목을 불러주면 받아 적고, 전신으로 들어오는 가격을 판에 옮겼다. 하지만 같은 일을 매일 반복하다 보니 이상한 것이 보이기 시작했다. 가격은 아무렇게나 움직이는 듯했지만, 어떤 때에는 오르려는 힘이 분명했고, 어떤 때에는 아무리 버티려 해도 아래로 밀리는 힘이 느껴졌다.

나는 사람들이 떠드는 이유보다 숫자의 움직임을 더 믿게 되었다. 사무실 안의 어른들은 늘 이유를 말했다. 회사가 좋다, 소문이 있다, 누군가가 산다, 곧 오른다. 그러나 가격은 그들의 말과 다르게 움직일 때가 많았다. 그때부터 나는 생각했다. 시장에서 중요한 것은 말이 아니라 실제 거래되는 가격이라고.

그 깨달음은 어린 나에게는 놀이처럼 시작되었다. 그러나 시간이 지나면서 그것은 내 인생을 바꾸는 기술이 되었다. 나는 가격이 올라갈 것인지 내려갈 것인지 맞히는 것보다, 가격이 움직이기 시작하는 순간을 알아차리는 일에 빠져들었다.
''',
    ),
    _BookChapter(
      title: '2. 처음 배운 승리',
      body: '''
처음 돈을 걸었을 때 나는 내가 특별한 사람이라고 생각하지 않았다. 다만 시세판을 오래 보았기 때문에 남들보다 조금 더 빨리 알아차릴 수 있다고 믿었다. 가격이 어떤 식으로 움직이는지, 사람들이 흥분할 때 숫자가 어떻게 반응하는지, 조용한 종목이 갑자기 살아날 때 어떤 모습이 나타나는지 눈에 익었다.

초기의 승리는 위험했다. 돈을 벌면 사람은 자신의 판단이 옳았다는 증거를 얻었다고 느낀다. 나 역시 그랬다. 몇 번의 성공은 나에게 자신감을 주었고, 그 자신감은 곧 더 크게 베팅하고 싶은 마음으로 바뀌었다. 시장은 처음에는 친절한 선생처럼 보였다. 내가 맞히면 돈을 주었고, 나는 그 돈이 내 실력의 대가라고 생각했다.

그러나 시장은 사람을 가르칠 때 늘 부드럽게 가르치지 않는다. 처음에 쉽게 번 돈은 사람을 조심스럽게 만들지 않는다. 오히려 더 대담하게 만든다. 대담함은 때로 필요하지만, 준비되지 않은 대담함은 손실을 부르는 지름길이다.

나는 이 사실을 나중에 여러 번 배웠다. 이상하게도 시장에서 가장 비싼 수업료는 항상 같은 교훈을 다시 배우는 데 쓰인다. 사람은 이미 알고 있다고 생각하는 것을 실제로 지키지 못할 때 가장 크게 다친다.
''',
    ),
    _BookChapter(
      title: '3. 시장은 설명을 기다려주지 않는다',
      body: '''
사람들은 가격이 움직인 뒤에 이유를 찾는 것을 좋아한다. 주가가 오르면 좋은 소식 때문이라고 하고, 빠지면 나쁜 소문 때문이라고 말한다. 하지만 내가 시세판 앞에서 배운 것은 달랐다. 가격은 종종 뉴스보다 먼저 움직이고, 설명은 나중에 붙는다.

나는 이유를 모른 채 매수하거나 매도하는 일이 불안하지 않았다. 불안한 것은 오히려 가격이 분명히 말하고 있는데도, 내 생각과 다르다는 이유로 듣지 않는 일이었다. 시장은 친절하게 설명하지 않는다. 다만 움직일 뿐이다. 그 움직임을 인정할 것인지, 아니면 내 의견을 붙잡을 것인지는 투자자의 선택이다.

초보자는 흔히 의견을 거래한다. 좋은 회사니까 오른다, 많이 빠졌으니까 오른다, 누구나 좋다고 하니까 오른다. 그러나 시장은 의견에 보상하지 않는다. 시장이 보상하는 것은 옳은 시점에 옳은 방향으로 서 있는 사람이다. 그리고 틀렸을 때 빨리 물러나는 사람이다.

나는 점점 더 말을 줄이고 가격을 보게 되었다. 누가 무엇을 말했는지보다, 실제로 돈이 어느 방향으로 움직이고 있는지가 중요했다. 시장에서 말은 많고 돈은 조용하다. 그러나 결국 가격을 움직이는 것은 말이 아니라 돈이다.
''',
    ),
    _BookChapter(
      title: '4. 빨리 맞히는 것과 크게 버는 것은 다르다',
      body: '''
나는 어린 시절부터 단기 움직임을 잘 맞히는 편이었다. 가격이 몇 포인트 움직일 방향을 잡아내는 일은 나에게 자연스럽게 느껴졌다. 그러나 시장에서 오래 살아보니, 빨리 맞히는 능력과 크게 버는 능력은 전혀 다른 문제였다.

작은 움직임을 자주 맞히면 사람은 바빠진다. 계속 사고팔고, 작은 이익을 챙기고, 다시 들어간다. 겉보기에는 매우 능숙해 보인다. 하지만 큰 추세가 시작될 때도 같은 방식으로 행동하면, 정작 가장 큰 돈이 걸린 구간을 놓치게 된다.

큰돈은 자주 움직이는 손에서 나오지 않았다. 큰돈은 옳은 자리에 앉은 뒤, 시장이 충분히 움직일 때까지 버티는 데서 나왔다. 이것은 말로는 쉽지만 실제로는 어렵다. 가격은 절대 한 방향으로만 가지 않는다. 좋은 포지션도 중간에 흔들리고, 흔들림은 사람의 마음을 시험한다.

나는 여러 번 너무 일찍 팔았다. 맞혔지만 크게 벌지 못했다. 그때마다 깨달았다. 시장에서 중요한 것은 단지 방향을 맞히는 것이 아니라, 맞았을 때 충분히 얻을 수 있는 마음과 규칙을 갖는 것이다.
''',
    ),
    _BookChapter(
      title: '5. 틀렸을 때 작아지는 기술',
      body: '''
시장에서는 누구나 틀린다. 문제는 틀렸다는 사실 자체가 아니라, 틀렸을 때 어떻게 행동하느냐다. 작은 손실은 투자자에게 보내는 시장의 짧은 경고다. 그 경고를 무시하면 시장은 더 큰 목소리로 말한다. 그때는 이미 손실이 커져 있다.

나는 여러 번 손실을 키웠다. 처음에는 조금만 기다리면 돌아올 것 같았다. 그 다음에는 여기서 팔면 너무 억울하다고 생각했다. 더 지나면 손실이 너무 커져서 판단이 흐려졌다. 그 순간부터 투자자는 시장을 보는 것이 아니라 자신의 손실만 보게 된다.

손실을 작게 자르는 일은 차가운 기술처럼 보이지만, 사실은 가장 감정적인 훈련이다. 자존심을 내려놓아야 하고, 내가 틀렸다는 사실을 인정해야 하며, 방금 전까지 믿었던 생각을 버릴 수 있어야 한다. 많은 사람이 이것을 하지 못해 시장에서 사라진다.

나는 결국 배웠다. 손실은 투자자의 적이 아니라 관리해야 할 비용이다. 작은 손실은 다음 기회를 살려두는 비용이다. 큰 손실은 다음 기회에 참여할 능력 자체를 빼앗아간다.
''',
    ),
    _BookChapter(
      title: '6. 소문은 사람을 움직이고 가격은 돈을 움직인다',
      body: '''
월스트리트에는 늘 소문이 있었다. 어떤 회사가 좋아진다, 누군가 대량으로 산다, 곧 발표가 있다, 큰손이 움직인다. 사람들은 이런 말을 좋아한다. 소문은 이야기가 있고, 이야기는 사람의 마음을 쉽게 붙잡는다.

그러나 소문으로 산 주식은 마음을 약하게 만든다. 내가 왜 샀는지 내 안에 분명한 이유가 없기 때문이다. 남의 말을 믿고 들어간 포지션은 문제가 생겼을 때 다시 그 사람의 말을 기다리게 한다. 시장은 이미 틀렸다고 말하는데, 투자자는 아직 누군가의 안심시키는 말을 기다린다.

나는 정보가 나쁘다고 말하는 것이 아니다. 시장에는 정보가 필요하다. 하지만 정보는 판단의 재료일 뿐, 판단 그 자체가 되어서는 안 된다. 누군가의 확신이 내 확신을 대신하면 안 된다.

시장에서 자기 생각이 없는 사람은 운 좋게 돈을 벌 수는 있다. 하지만 오래 지키기는 어렵다. 왜냐하면 돈을 벌게 해준 이유를 모르기 때문에, 돈을 잃기 시작했을 때 빠져나올 이유도 모르기 때문이다.
''',
    ),
    _BookChapter(
      title: '7. 추세가 시작될 때의 고요함',
      body: '''
큰 움직임은 항상 큰 소리와 함께 시작되지 않는다. 때로는 조용히 시작된다. 사람들은 아직 의심하고, 뉴스는 뚜렷하지 않고, 가격은 천천히 그러나 꾸준히 한쪽으로 기울어진다. 그때 시장은 이미 준비하고 있는 경우가 많다.

나는 시세판을 볼 때 가격 자체보다 가격의 태도를 보려 했다. 오르다가 밀려도 다시 살아나는지, 빠질 듯하다가도 매수가 들어오는지, 사람들이 무관심한 사이에 거래가 쌓이는지. 이런 것들은 말보다 먼저 나타나는 신호였다.

추세를 타는 일은 용기가 필요하다. 그러나 그 용기는 무작정 뛰어드는 용기가 아니다. 시장이 보여주는 증거를 기다리고, 그 증거가 충분할 때 행동하는 용기다. 너무 빨리 들어가면 흔들림에 지치고, 너무 늦게 들어가면 위험이 커진다.

결국 추세 매매는 시장을 앞서가려는 일이 아니라, 시장이 이미 가고 있는 길에 올라타는 일이다. 이 차이를 이해하지 못하면 사람은 늘 예측에 취하고, 예측이 빗나갈 때 크게 다친다.
''',
    ),
    _BookChapter(
      title: '8. 너무 많이 아는 사람의 함정',
      body: '''
시장에는 똑똑한 사람이 많다. 회사의 재무를 잘 아는 사람, 경제를 잘 아는 사람, 정치와 금리를 읽는 사람, 산업을 깊게 파는 사람이 있다. 그러나 많이 안다는 것이 항상 돈을 벌게 해주지는 않는다.

문제는 지식이 많아질수록 자기 생각을 버리기 어려워진다는 데 있다. 어떤 사람이 한 회사에 대해 너무 많이 알면, 가격이 반대로 움직여도 자신이 모르는 무언가가 있다고 생각하기보다 시장이 틀렸다고 믿기 쉽다. 그는 사실을 보고 있다고 생각하지만, 실제로는 자신의 결론을 지키고 있을 수 있다.

나는 시장에서 겸손이 필요하다는 것을 늦게 배웠다. 겸손은 아무것도 모른다고 말하는 태도가 아니다. 겸손은 내가 많이 알고 있어도 틀릴 수 있다는 사실을 인정하는 태도다. 이것이 없으면 지식은 무기가 아니라 짐이 된다.

가격이 내 생각과 다르게 움직일 때는 화를 낼 일이 아니다. 그때는 질문해야 한다. 내가 무엇을 놓쳤는가. 그리고 더 중요한 질문을 해야 한다. 이 포지션을 계속 유지할 이유가 아직 남아 있는가.
''',
    ),
    _BookChapter(
      title: '9. 돈을 벌고 나서 더 위험해지는 이유',
      body: '''
손실 뒤에는 조심스러워지는 사람이 많다. 그러나 큰 수익 뒤에는 오히려 더 위험해지는 사람이 많다. 돈을 벌면 사람은 자신의 판단이 특별하다고 느낀다. 시장이 나를 인정했다고 착각한다.

나 역시 큰 수익을 얻은 뒤에는 마음이 커졌다. 같은 금액을 걸어도 작아 보였고, 전보다 더 큰 포지션을 잡아도 괜찮을 것 같았다. 이전의 성공이 다음 거래의 안전을 보장해주는 것처럼 느껴졌다. 그러나 시장은 과거의 수익을 보고 다음 손실을 줄여주지 않는다.

수익 뒤의 가장 큰 위험은 규칙이 느슨해지는 것이다. 원래는 기다렸을 자리에서 서두르고, 원래는 줄였을 손실을 버티고, 원래는 확인했을 신호를 대충 넘긴다. 자신감이 판단을 대신하기 시작하면 위험은 조용히 커진다.

시장에서 돈을 벌었을 때 가장 먼저 해야 할 일은 축하가 아니라 다시 작아지는 것이다. 마음을 작게 만들고, 규칙을 다시 확인하고, 이번 수익이 다음 거래를 망치지 않도록 해야 한다.
''',
    ),
    _BookChapter(
      title: '10. 쉬는 것도 포지션이다',
      body: '''
사람들은 시장에 참여하지 않는 시간을 낭비라고 생각한다. 그러나 나는 시간이 지나면서 쉬는 것도 하나의 포지션이라는 사실을 알게 되었다. 현금을 들고 기다리는 사람은 아무것도 하지 않는 사람이 아니다. 그는 다음 기회를 살 수 있는 권리를 들고 있는 사람이다.

매일 매매하려는 욕구는 강하다. 시세판은 계속 움직이고, 움직임은 사람을 유혹한다. 그러나 모든 움직임이 기회는 아니다. 어떤 움직임은 그저 소음이고, 어떤 움직임은 사람의 인내심을 빼앗기 위해 존재하는 것처럼 보인다.

좋은 투기자는 늘 행동하는 사람이 아니다. 좋은 투기자는 행동해야 할 때와 하지 말아야 할 때를 구분하는 사람이다. 이 구분이 없으면 에너지는 작은 거래에 흩어지고, 큰 기회가 왔을 때 이미 마음과 돈이 지쳐 있다.

나는 여러 번 쉬지 못해서 손해를 보았다. 시장이 나를 부르는 것 같았지만, 실제로는 내가 시장을 붙잡고 있었을 뿐이었다. 쉬는 법을 배우는 것은 매수와 매도만큼이나 중요한 기술이다.
''',
    ),
    _BookChapter(
      title: '11. 물타기가 위험해지는 순간',
      body: '''
가격이 내려갈수록 더 사면 평균 매입 단가는 낮아진다. 이 계산은 너무 단순해서 사람을 안심시킨다. 그러나 시장에서 단순한 계산이 항상 좋은 판단은 아니다. 가격이 내려가는 데에는 이유가 있을 수 있고, 그 이유를 모른 채 더 사는 것은 손실을 키우는 행동이 될 수 있다.

나는 손실이 난 포지션을 더 키우는 일이 얼마나 위험한지 배웠다. 처음에는 좋은 가격이라고 생각한다. 조금 더 빠지면 더 좋은 가격이라고 생각한다. 하지만 어느 순간부터 그것은 좋은 가격이 아니라 잘못된 판단을 인정하지 않으려는 행동이 된다.

물타기가 항상 나쁜 것은 아니다. 그러나 계획 없는 물타기는 대개 위험하다. 처음부터 어느 구간에서 얼마를 더 살지, 어디까지 틀리면 멈출지 정해두지 않았다면, 추가 매수는 전략이 아니라 감정의 방어가 된다.

시장은 투자자가 억울해하는지 관심이 없다. 평균 단가가 낮아졌다는 사실도 시장에는 중요하지 않다. 중요한 것은 지금 포지션이 여전히 좋은 판단인지, 아니면 손실을 숨기기 위한 변명인지다.
''',
    ),
    _BookChapter(
      title: '12. 군중은 늘 늦게 확신한다',
      body: '''
시장에는 군중의 감정이 있다. 처음에는 아무도 믿지 않는다. 조금 오르면 의심하고, 더 오르면 관심을 갖고, 크게 오르면 확신한다. 그리고 가장 늦게 확신한 사람들이 가장 비싼 가격을 지불하는 경우가 많다.

하락도 비슷하다. 처음에는 일시적인 조정이라고 말한다. 더 빠지면 좋은 매수 기회라고 말한다. 훨씬 더 빠지면 두려움이 퍼지고, 마지막에는 더 이상 견디지 못한 사람들이 팔기 시작한다. 그때가 지나고 나서야 시장은 바닥을 만들기도 한다.

군중을 비웃기는 쉽다. 그러나 누구나 군중의 일부가 될 수 있다. 나 역시 그랬다. 사람은 혼자 있을 때보다 함께 흥분할 때 더 쉽게 판단을 잃는다. 모두가 같은 말을 할 때, 그 말은 더 그럴듯하게 들린다.

그래서 투자자는 시장의 분위기를 보되, 분위기에 휩쓸리지 않아야 한다. 다수가 틀렸다는 뜻이 아니다. 다만 다수의 확신이 너무 뜨거워질 때, 위험도 함께 뜨거워질 수 있다는 사실을 기억해야 한다.
''',
    ),
    _BookChapter(
      title: '13. 레버리지는 마음을 확대한다',
      body: '''
레버리지는 수익과 손실만 키우는 것이 아니다. 사람의 마음도 키운다. 작은 상승은 큰 기쁨이 되고, 작은 하락은 큰 두려움이 된다. 같은 가격 움직임이라도 레버리지를 쓰면 전혀 다른 감정으로 다가온다.

나는 큰 포지션을 들고 있을 때 사람이 얼마나 쉽게 변하는지 보았다. 평소라면 차분히 볼 수 있는 흔들림도 견디기 어려워진다. 잠깐의 반등에 안도하고, 잠깐의 하락에 불안해진다. 결국 투자자는 시장이 아니라 자신의 감정과 싸우게 된다.

레버리지를 쓰는 사람에게 가장 필요한 것은 대담함보다 규율이다. 언제 줄일지, 언제 멈출지, 어느 정도 손실을 감당할지 미리 정하지 않으면 레버리지는 사람을 빠르게 몰아붙인다.

큰돈을 벌고 싶은 마음은 이해할 수 있다. 그러나 시장은 욕심이 큰 사람에게 더 친절하지 않다. 오히려 욕심이 큰 사람일수록 작은 흔들림에도 더 크게 흔들리도록 만든다.
''',
    ),
    _BookChapter(
      title: '14. 기다림은 고통스럽다',
      body: '''
좋은 기회를 기다리는 일은 생각보다 고통스럽다. 사람은 눈앞에서 가격이 움직이면 무언가 해야 할 것 같은 압박을 느낀다. 아무것도 하지 않는 시간은 뒤처지는 시간처럼 느껴지고, 다른 사람이 돈을 벌고 있다는 이야기는 마음을 더욱 조급하게 만든다.

그러나 시장에서 기다림은 빈 시간이 아니다. 기다림은 판단을 아끼는 시간이고, 돈을 지키는 시간이며, 다음 행동의 질을 높이는 시간이다. 아무 때나 들어가는 사람은 늘 빠져나올 이유를 찾게 된다. 기다린 사람은 들어가기 전부터 이유가 분명하다.

나는 좋은 기회를 기다리지 못해 여러 번 손해를 보았다. 대충 괜찮아 보이는 자리에서 들어가면, 시장은 대개 나를 시험했다. 확신이 약한 포지션은 작은 흔들림에도 마음이 흔들린다. 결국 좋은 매매는 좋은 기다림에서 시작된다.

기다림이 어려운 이유는 결과가 즉시 보이지 않기 때문이다. 하지만 시장에서 보이지 않는 준비가 보이는 수익을 만든다. 기다릴 줄 아는 사람은 모든 날을 자신의 날로 만들려 하지 않는다.
''',
    ),
    _BookChapter(
      title: '15. 시장은 복수를 허락하지 않는다',
      body: '''
손실을 본 뒤 바로 되찾고 싶은 마음은 강하다. 사람은 잃은 돈을 숫자로만 보지 않는다. 자존심, 억울함, 분노가 함께 붙는다. 그래서 손실 뒤의 거래는 위험하다. 그 거래는 시장을 보려는 거래가 아니라 마음을 회복하려는 거래가 되기 쉽다.

나는 복수 거래의 위험을 잘 안다. 방금 잃었기 때문에 더 크게 걸고 싶어진다. 이번에는 맞혀야 한다고 생각한다. 그러나 시장은 내가 방금 손실을 보았는지 알지 못하고, 알고 있다 해도 신경 쓰지 않는다.

손실 뒤에는 쉬어야 한다. 적어도 마음이 다시 시장을 볼 수 있을 때까지는 기다려야 한다. 손실을 되찾는 가장 좋은 방법은 곧바로 더 큰 거래를 하는 것이 아니라, 다음에 더 좋은 판단을 하는 것이다.

복수심은 시장에서 가장 비싼 감정 중 하나다. 분노는 방향을 보지 못하게 하고, 조급함은 규모를 키우게 하며, 억울함은 손절을 늦춘다. 시장은 이런 감정을 가진 사람에게서 천천히 돈을 가져간다.
''',
    ),
    _BookChapter(
      title: '16. 좋은 판단은 기록에서 나온다',
      body: '''
기억은 투자자에게 믿을 만한 도구가 아니다. 사람은 자신이 맞힌 거래를 더 선명하게 기억하고, 틀린 거래는 그럴 만한 이유가 있었다고 포장한다. 시간이 지나면 실수는 흐려지고 성공은 커진다.

그래서 기록이 필요하다. 내가 왜 샀는지, 어떤 신호를 보았는지, 어디서 틀렸다고 인정할 것인지, 실제로 어떻게 행동했는지 적어두면 자기 자신을 속이기 어려워진다. 시장에서 가장 어려운 상대는 때로 시장이 아니라 자기 합리화다.

기록은 단순한 일지가 아니다. 기록은 반복되는 실수를 보여준다. 어떤 사람은 늘 너무 빨리 산다. 어떤 사람은 늘 너무 늦게 판다. 어떤 사람은 손실 뒤에 무리한다. 기록이 없으면 이런 습관은 성격처럼 느껴지고, 고치기 어렵다.

나는 시장을 배우는 일이 결국 자신을 배우는 일이라는 사실을 알게 되었다. 숫자는 밖에 있지만, 실수의 뿌리는 안에 있다. 기록은 그 뿌리를 보게 해준다.
''',
    ),
    _BookChapter(
      title: '17. 큰 흐름과 작은 소음',
      body: '''
시장은 매일 흔들린다. 그 흔들림을 모두 의미 있는 신호로 받아들이면 투자자는 금세 지친다. 어떤 움직임은 중요한 변화의 시작이지만, 어떤 움직임은 그저 하루의 소음일 뿐이다.

큰 흐름을 보는 사람은 작은 흔들림에 덜 휘둘린다. 그러나 큰 흐름을 핑계로 명백한 위험 신호를 무시하면 안 된다. 이것이 어렵다. 투자자는 버텨야 할 조정과 피해야 할 전환을 구분해야 한다.

이 구분은 한 번에 배워지지 않는다. 차트를 오래 본다고 자동으로 생기는 것도 아니다. 중요한 것은 미리 기준을 세우는 것이다. 어떤 조건이 유지되면 버틸 것인지, 어떤 조건이 깨지면 나올 것인지 정해두어야 한다.

기준이 없는 사람은 매일 흔들린다. 가격이 오르면 희망을 키우고, 가격이 빠지면 공포에 빠진다. 기준이 있는 사람도 흔들리지만, 돌아갈 자리가 있다. 그 차이가 오래 버티는 힘이 된다.
''',
    ),
    _BookChapter(
      title: '18. 성공한 거래도 다시 검토해야 한다',
      body: '''
사람들은 손실 거래만 복기하려 한다. 그러나 성공한 거래도 다시 보아야 한다. 돈을 벌었다고 해서 판단이 모두 옳았던 것은 아니다. 운이 좋았을 수도 있고, 위험을 과하게 감수했는데 결과만 좋았을 수도 있다.

성공한 거래를 검토하지 않으면 위험한 습관이 강화된다. 무리하게 들어갔는데 돈을 벌면, 다음에도 그렇게 해도 된다고 생각한다. 손절 기준 없이 버텼는데 살아나면, 다음에도 버티면 된다고 믿는다. 시장은 가끔 잘못된 행동에도 보상을 주는데, 그것이 더 큰 위험을 만든다.

좋은 투자자는 결과와 과정을 함께 본다. 돈을 벌었는가도 중요하지만, 그 돈을 버는 과정이 반복 가능한가가 더 중요하다. 반복할 수 없는 수익은 실력이 아니라 사건에 가깝다.

나는 시장에서 오래 살아남으려면 자신에게 엄격해야 한다고 배웠다. 손실 앞에서만 엄격한 것이 아니라, 수익 앞에서도 엄격해야 한다. 그래야 수익이 자만으로 바뀌지 않는다.
''',
    ),
    _BookChapter(
      title: '19. 시장에서 살아남는 사람',
      body: '''
시장에는 한때 크게 번 사람이 많다. 그러나 오래 살아남은 사람은 훨씬 적다. 큰 수익은 사람들의 눈에 잘 보이지만, 오래 버티는 능력은 조용해서 잘 보이지 않는다. 하지만 결국 시장에서 가장 중요한 것은 생존이다.

살아남는 사람은 자신이 언제 약해지는지 안다. 어떤 상황에서 조급해지는지, 어떤 손실을 견디지 못하는지, 어떤 소문에 흔들리는지 알고 있다. 그는 시장만 연구하지 않고 자기 자신도 연구한다.

또한 살아남는 사람은 기회가 없을 때 억지로 기회를 만들지 않는다. 시장이 분명하지 않으면 기다리고, 손실이 커지면 줄이고, 크게 맞았을 때도 다시 규칙으로 돌아온다. 그는 한 번의 거래로 인생을 바꾸려 하지 않는다.

이 책이 오래 읽히는 이유는 시장의 기술보다 인간의 약점을 더 정확하게 보여주기 때문이다. 시대가 바뀌고 도구가 바뀌어도, 탐욕과 공포와 자존심은 크게 달라지지 않는다.
''',
    ),
    _BookChapter(
      title: '20. 마지막 장',
      body: '''
나는 시장에서 수많은 것을 배웠다. 가격은 말보다 정직하고, 손실은 빨리 인정할수록 작아지며, 큰돈은 조급한 손보다 기다릴 줄 아는 마음에 더 자주 온다. 그러나 이 모든 교훈은 알고 있는 것만으로는 부족하다. 실제 돈이 걸렸을 때 지킬 수 있어야 한다.

투자자는 늘 두 가지 싸움을 한다. 하나는 시장과의 싸움이고, 다른 하나는 자기 자신과의 싸움이다. 시장과의 싸움에서는 이길 수도 있고 질 수도 있다. 그러나 자기 자신과의 싸움에서 계속 지면, 시장에서 오래 버틸 수 없다.

좋은 판단은 화려하지 않다. 좋은 판단은 때로 지루하고, 때로 답답하고, 때로 아무것도 하지 않는 모습으로 나타난다. 하지만 그런 판단이 계좌를 지키고, 다음 기회를 가능하게 한다.

시장은 내일도 열린다. 이 단순한 사실을 잊지 않는 사람은 오늘 모든 것을 걸지 않는다. 오늘 살아남아야 내일의 기회를 볼 수 있다. 그것이 이 오래된 책이 지금도 투자자에게 남기는 가장 중요한 문장이다.
''',
    ),
  ];

  static const englishPages = <_BookChapter>[
    _BookChapter(
      title: 'About This Edition',
      body: '''
Reminiscences of a Stock Operator
Edwin Lefevre

This reader follows the flow of the English classic and presents it in a readable app format. It is arranged as a long-form reading edition rather than a short summary, so the reader can move through the story and its lessons page by page.

The story begins with a boy who works near a quotation board and becomes fascinated by the movement of prices. He watches grown men change their faces over a few points of movement. Before he understands the language of finance, he understands that prices speak in their own way.

The book is not only about making money. It is about judgment, discipline, fear, greed, and the strange habit people have of ignoring the market when it disagrees with them. The operator wins, loses, rises again, and learns that the market is a severe teacher.
''',
    ),
    _BookChapter(
      title: '1. The Boy at the Quotation Board',
      body: '''
I was young when I first began watching prices. The office had a board where quotations were written, and men came in with hopes, fears, and opinions. A small change in price could brighten one face and darken another. I did not know much about companies then, but I knew that numbers could command men.

At first I was only a boy doing a job. I wrote down prices as they came in and copied them where others could see them. But after doing the same thing day after day, I began to notice that prices had habits. They did not move exactly as men said they should. Sometimes they rose before the reason was known, and sometimes they fell while everyone still had explanations for why they ought to rise.

I became less interested in what people said and more interested in what prices did. Talk was easy. Buying and selling with real money was different. The tape, as traders called it, seemed to tell a story before the crowd understood the plot.

What began as a boy's curiosity slowly became the center of my life. I wanted to know when a price was ready to move, when a move was false, and when the crowd was late. The market became my classroom, and the cost of tuition would later prove very high.
''',
    ),
    _BookChapter(
      title: '2. The First Taste of Winning',
      body: '''
When I first risked money, I did not think of myself as a great trader. I simply believed I had watched the board long enough to see things that others missed. I knew how prices behaved when interest appeared and how they acted when a move had no strength behind it.

Early success is dangerous. When a man makes money, he is tempted to believe that the money is proof of wisdom. I was no different. A few correct trades gave me confidence, and confidence soon became the desire to trade larger.

At first the market seemed generous. I was right often enough to believe that the game was simple. But the market does not remain gentle with a man who grows careless. It lets him win just enough to become bold, and then it charges him for confusing boldness with skill.

I learned later that the most expensive lessons are often the ones we thought we had already learned. Knowing a rule is easy. Obeying it while money is at risk is the real test.
''',
    ),
    _BookChapter(
      title: '3. The Market Does Not Wait for Explanations',
      body: '''
People enjoy explaining price movements after they happen. If a stock rises, they find a favorable reason. If it falls, they discover a bad rumor. But prices often move before the explanation arrives.

I was not afraid of trading without a perfect explanation. I was more afraid of ignoring a clear movement because it disagreed with my opinion. The market does not explain itself politely. It moves, and the trader must decide whether to listen.

Beginners often trade opinions. They buy because a company is good, because a stock has fallen a great deal, or because someone important is said to be buying. But the market does not pay a man for having an opinion. It pays him for being right in position and right in time.

So I learned to listen less to talk and more to action. Words could be loud, but money was quieter and more decisive. In the end, the price was the record of what money had actually done.
''',
    ),
    _BookChapter(
      title: '4. Being Right Quickly Is Not the Same as Making Big Money',
      body: '''
I was good at catching small movements. A few points up or down often seemed clear to me before others saw it. But catching small movements and making large profits are not the same thing.

A man who trades every small turn becomes busy. He buys, sells, takes a profit, and begins again. He may look skillful, but if he treats a great trend like a small fluctuation, he will leave the largest money on the table.

The big money was not made by constant action. It was made by sitting with a correct position while the market carried it far enough. This sounds simple, but it is difficult because no good position moves in a straight line.

I was right many times and still failed to make what I should have made. I sold too soon. I feared losing a profit more than I respected the trend. In time I learned that being right is only the beginning. Holding correctly is the harder art.
''',
    ),
    _BookChapter(
      title: '5. The Art of Becoming Small When Wrong',
      body: '''
Every trader is wrong. The difference between survival and ruin is what he does after he becomes wrong. A small loss is the market's quiet warning. If ignored, the warning becomes louder and more expensive.

I enlarged losses many times. At first I told myself the price would return. Then I told myself it would be foolish to sell after such a decline. Finally the loss became so large that I no longer watched the market clearly. I watched only my own wound.

Cutting a loss looks like a cold technique, but it is really emotional discipline. A man must give up pride, admit error, and abandon an idea that only a short time earlier felt certain.

A small loss is the price of staying in the game. A large loss can take away the ability to play the next hand. That is why the first loss is usually the best loss.
''',
    ),
    _BookChapter(
      title: '6. Rumors Move People, Prices Move Money',
      body: '''
Wall Street has always been full of rumors. A company is improving, a pool is buying, an announcement is coming, an important man knows something. People love such stories because stories make uncertainty feel manageable.

But a position entered on another man's word is weak. If trouble comes, the trader waits for another man's reassurance instead of reading the market. The price may already be saying that the trade is wrong, but the trader waits for the rumor to save him.

Information has value, but it must not replace judgment. A rumor may be a reason to investigate, but it is not a reason to surrender responsibility. The money at risk belongs to the trader, so the final decision must also belong to him.

A man may make money by accident on another man's tip. Keeping that money is another matter. If he does not know why he entered, he will not know when to leave.
''',
    ),
    _BookChapter(
      title: '7. The Quiet Beginning of a Trend',
      body: '''
Great movements do not always begin with noise. Often they begin quietly. The crowd is uncertain, the news is incomplete, and the price begins to lean in one direction with increasing persistence.

I watched not only the price but the behavior of the price. Did it recover after a decline? Did buying appear when weakness should have continued? Did volume gather before the public became interested? Such signs often appeared before explanations.

Following a trend requires courage, but not blind courage. It requires the patience to wait for evidence and the courage to act when the evidence is sufficient. Enter too early and the ordinary shaking of the market may wear you out. Enter too late and the risk may be too large.

Trend trading is not the art of predicting the future. It is the art of recognizing where the market has already begun to go.
''',
    ),
    _BookChapter(
      title: '8. The Trap of Knowing Too Much',
      body: '''
There are many intelligent people in the market. Some understand balance sheets, some understand economics, some understand politics and interest rates, and some know an industry deeply. But knowledge alone does not guarantee profits.

The danger is that knowledge can make a man stubborn. If he knows too much about a company, he may explain away a falling price because he believes the market has failed to appreciate what he knows. He thinks he is defending facts, but often he is defending his conclusion.

Humility is not ignorance. Humility is the ability to say, even after careful study, that the market may be showing something I have missed. Without that humility, knowledge becomes a burden.

When price moves against an idea, the question is not whether the market has insulted me. The question is whether the reason for the position still exists.
''',
    ),
    _BookChapter(
      title: '9. Why Profit Can Make a Man More Dangerous',
      body: '''
After a loss, many men become careful. After a large profit, many become dangerous. Profit can make a man believe that the market has confirmed his superiority.

I knew that feeling. After making money, the same position size seemed too small. A larger trade seemed natural. Past success appeared to promise future safety, though the market makes no such promise.

The greatest danger after profit is the loosening of rules. A man enters sooner than he should, holds a loss longer than he planned, and ignores signals he would have respected before. Confidence begins to replace discipline.

After a large win, the trader must become small again in his own mind. He must return to rules before profit becomes pride.
''',
    ),
    _BookChapter(
      title: '10. Rest Is Also a Position',
      body: '''
Many traders think that staying out of the market is wasted time. It is not. Cash is a position. It gives a man the right to act when a real opportunity appears.

The market moves every day, and movement tempts men to participate. But not every movement is an opportunity. Some movement is only noise. Some exists only to exhaust attention and capital.

The good speculator is not the man who is always busy. He is the man who knows when action is required and when inaction is wiser. Without that distinction, energy is scattered across mediocre trades.

I lost money many times because I could not rest. I thought the market was calling me, but often I was the one clinging to the market.
''',
    ),
    _BookChapter(
      title: '11. The Danger of Averaging Down',
      body: '''
When a price falls, buying more lowers the average cost. The arithmetic is simple, and that simplicity comforts people. But simple arithmetic is not always good judgment.

A falling price may be falling for a reason. If a man buys more without understanding whether the original judgment remains valid, he may be increasing a mistake rather than improving a position.

Averaging down is not always wrong, but unplanned averaging down is dangerous. If the trader did not decide in advance where to add, how much to add, and where to stop, the additional purchase is often emotional defense.

The market does not care that a man's average cost has improved. It cares only about supply, demand, fear, greed, and money.
''',
    ),
    _BookChapter(
      title: '12. The Crowd Becomes Certain Too Late',
      body: '''
At first the crowd doubts a move. Then it notices. Then it believes. Finally it becomes certain, and often the last certainty comes at the highest price.

Declines work the same way. At first the decline is called temporary. Then it is called an opportunity. Later it becomes frightening. At the end, those who can no longer bear the fear sell in despair.

It is easy to laugh at the crowd, but every trader can become part of it. A man thinks more poorly when he is excited with others. Agreement makes an idea feel safer than it really is.

The trader must observe the mood of the crowd without becoming its servant. The crowd is not always wrong, but when certainty becomes too hot, risk often becomes hot with it.
''',
    ),
    _BookChapter(
      title: '13. Leverage Enlarges the Mind as Well as the Account',
      body: '''
Leverage does not only enlarge profits and losses. It enlarges emotion. A small rise becomes great joy. A small decline becomes great fear.

With a large position, ordinary fluctuation becomes difficult to endure. A movement that would have been harmless at normal size becomes a threat. The trader stops reading the market and begins reading his own anxiety.

The leveraged trader needs discipline more than courage. He must know when to reduce, when to stop, and how much pain he can afford before the trade begins.

The desire to make large money is understandable. But the market is not kinder to large desire. It often uses that desire to make a man overstay, overtrade, and overrisk.
''',
    ),
    _BookChapter(
      title: '14. Waiting Is Painful',
      body: '''
Waiting for a good opportunity is painful. When prices move, a man feels he ought to be doing something. Doing nothing can feel like falling behind.

But waiting is not empty time. It preserves judgment, capital, and emotional strength. A man who enters casually must search for reasons later. A man who waits enters with reasons already formed.

I lost money because I did not wait. A position that is only almost right can become very uncomfortable. Weak conviction cannot survive ordinary market noise.

Good trading begins before the trade. It begins in the waiting.
''',
    ),
    _BookChapter(
      title: '15. The Market Does Not Allow Revenge',
      body: '''
After a loss, the desire to recover quickly is strong. The lost money carries pride, anger, and humiliation with it. That makes the next trade dangerous.

Revenge trading is not really trading the market. It is trading one's own injury. The man increases size because he wants relief, not because the opportunity is better.

The market does not know that a trader has just lost money, and if it knew, it would not care. It gives no special terms to a wounded man.

After a loss, the best first action is often rest. The money will not be recovered by anger. It will be recovered, if at all, by better judgment later.
''',
    ),
    _BookChapter(
      title: '16. Judgment Comes From Records',
      body: '''
Memory is not reliable in speculation. A man remembers his successes clearly and explains away his mistakes. With time, errors become reasonable and wins become larger in the imagination.

Records make self-deception harder. Why did I enter? What did I see? Where was I supposed to admit error? What did I actually do? Written answers reveal patterns that memory hides.

One man always buys too early. Another sells too late. Another becomes reckless after a loss. Without records these habits feel like personality. With records they become visible.

Learning the market is also learning oneself. The numbers are outside, but many mistakes begin inside.
''',
    ),
    _BookChapter(
      title: '17. The Main Movement and the Noise',
      body: '''
The market shakes every day. If every shake is treated as a major signal, the trader soon becomes exhausted. Some movements matter. Others are only noise.

The trader must distinguish a normal reaction from a change in character. This is difficult. Hold too stubbornly and a real reversal becomes ruin. React too quickly and every small shake throws you out.

The answer is not emotion but preparation. Before the market tests him, the trader must decide what conditions keep him in and what conditions take him out.

A man without standards is moved by every price. A man with standards may still feel fear, but he has a place to return.
''',
    ),
    _BookChapter(
      title: '18. Profitable Trades Must Also Be Reviewed',
      body: '''
Many traders review only their losses. But winning trades must also be examined. A profit does not prove that the process was sound.

Sometimes a man makes money after taking foolish risk. If he does not review the trade, the profit teaches him the wrong lesson. The market occasionally rewards bad behavior, and that reward can be dangerous.

The question is not only whether money was made. The question is whether the decision can be repeated without depending on luck.

A trader must be strict with profits as well as losses. Otherwise profit becomes the seed of future carelessness.
''',
    ),
    _BookChapter(
      title: '19. The Man Who Survives',
      body: '''
There are many people who once made large money in the market. There are fewer who survived for a long time. Large profits are visible. Survival is quieter.

The survivor knows his weaknesses. He knows when he becomes impatient, what kind of loss disturbs him, and which stories tempt him. He studies himself as much as he studies prices.

He does not force opportunity when none exists. He waits when the market is unclear, reduces when the trade is wrong, and returns to rules after both wins and losses.

This is why the book remains alive. It is not only about old markets. It is about human nature in markets, and human nature has not changed much.
''',
    ),
    _BookChapter(
      title: '20. Final Page',
      body: '''
The market taught me many things. Price is more honest than talk. Losses are best when they are small. Large profits come less often from restless hands than from patient judgment.

But knowing these things is not enough. They must be obeyed when money is at risk. That is where most men fail.

The trader fights two battles. One is with the market. The other is with himself. He may lose to the market and recover. If he continually loses to himself, he will not last.

The market will open again tomorrow. The man who remembers this does not need to risk everything today. To survive today is to keep the right to meet tomorrow's opportunity.
''',
    ),
  ];

  @override
  void initState() {
    super.initState();
    loadSavedBookPosition();
  }

  Future<void> loadSavedBookPosition() async {
    final prefs = await SharedPreferences.getInstance();
    final pageKey = await userScopedPrefsKey(_bookReaderPagePrefsKey);
    final languageKey = await userScopedPrefsKey(_bookReaderLanguagePrefsKey);
    final savedEnglish = prefs.getBool(languageKey) ?? false;
    final pageCount = savedEnglish ? englishPages.length : koreanPages.length;
    final savedPage = (prefs.getInt(pageKey) ?? 0).clamp(0, pageCount - 1);
    if (!mounted) return;
    setState(() {
      showEnglish = savedEnglish;
      currentPage = savedPage;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && pageController.hasClients) {
        pageController.jumpToPage(currentPage);
      }
    });
  }

  Future<void> saveBookPosition() async {
    final prefs = await SharedPreferences.getInstance();
    final pageKey = await userScopedPrefsKey(_bookReaderPagePrefsKey);
    final languageKey = await userScopedPrefsKey(_bookReaderLanguagePrefsKey);
    await prefs.setInt(pageKey, currentPage);
    await prefs.setBool(languageKey, showEnglish);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : _appBg;
    final cardBg = whiteMode ? _lightSurface : _darkSurface;
    final cardLine = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;
    final accent = whiteMode ? _lightBlue : _cyan;
    final pages = showEnglish ? englishPages : koreanPages;
    final progress = '${currentPage + 1}/${pages.length}';
    final screenTitle = showEnglish ? 'Book Reader' : '책 읽기';
    final bookTitle =
        showEnglish ? 'Reminiscences of a Stock Operator' : '어느 주식투자자의 회상';

    void changeBookLanguage(bool next) {
      if (showEnglish == next) return;
      setState(() {
        showEnglish = next;
        currentPage = 0;
      });
      if (pageController.hasClients) {
        pageController.jumpToPage(0);
      }
      saveBookPosition();
    }

    Widget languageButton(String label, bool value) {
      final selected = showEnglish == value;
      return Expanded(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => changeBookLanguage(value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 140),
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected ? accent : Colors.transparent,
              borderRadius: BorderRadius.circular(9),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                maxLines: 1,
                style: TextStyle(
                  color: selected
                      ? (whiteMode ? Colors.white : _appBg)
                      : secondaryText,
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: pageBg,
      bottomNavigationBar: buildAdOnlyBottomBar(),
      appBar: AppBar(
        title: Text(screenTitle),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          buildWhiteModeButton(context),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  bookTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: primaryText,
                    fontSize: 19,
                    height: 1.22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: cardLine),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 88,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: accent.withValues(
                            alpha: whiteMode ? 0.08 : 0.12,
                          ),
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(
                            color: accent.withValues(alpha: 0.18),
                          ),
                        ),
                        child: Row(
                          children: [
                            languageButton('한글', false),
                            const SizedBox(width: 3),
                            languageButton('EN', true),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 62,
                      height: 30,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color:
                              accent.withValues(alpha: whiteMode ? 0.08 : 0.12),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: accent.withValues(alpha: 0.22),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            progress,
                            maxLines: 1,
                            style: TextStyle(
                              color: accent,
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                  saveBookPosition();
                },
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: cardBg,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: cardLine),
                      ),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Text(
                            '${index + 1} 페이지',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: accent,
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            page.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 20,
                              height: 1.25,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 14),
                          SelectableText(
                            page.body,
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 15,
                              height: 1.62,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pages.length, (index) {
                  final selected = index == currentPage;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    width: selected ? 18 : 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: selected
                          ? accent
                          : secondaryText.withValues(alpha: 0.28),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookChapter {
  const _BookChapter({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
}

class JumpDodgeGamePage extends StatefulWidget {
  const JumpDodgeGamePage({super.key});

  @override
  State<JumpDodgeGamePage> createState() => _JumpDodgeGamePageState();
}

class _JumpDodgeGamePageState extends State<JumpDodgeGamePage> {
  static const _bestScoreKey = 'jumpDodgeBestScore';
  static const _groundHeight = 48.0;
  static const _playerSize = 34.0;
  static const _obstacleWidth = 24.0;
  static const _obstacleHeight = 42.0;

  Timer? timer;
  double playerY = 0;
  double velocity = 0;
  double obstacleX = 1.15;
  int score = 0;
  int bestScore = 0;
  bool running = false;
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    loadBestScore();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> loadBestScore() async {
    final prefs = await SharedPreferences.getInstance();
    final key = await userScopedPrefsKey(_bestScoreKey);
    if (!mounted) return;
    setState(() {
      bestScore = prefs.getInt(key) ?? 0;
    });
  }

  Future<void> saveBestScore() async {
    if (score <= bestScore) return;
    final prefs = await SharedPreferences.getInstance();
    final key = await userScopedPrefsKey(_bestScoreKey);
    await prefs.setInt(key, score);
    if (!mounted) return;
    setState(() {
      bestScore = score;
    });
  }

  void startGame() {
    timer?.cancel();
    setState(() {
      playerY = 0;
      velocity = 0;
      obstacleX = 1.15;
      score = 0;
      running = true;
      gameOver = false;
    });

    timer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (!mounted || !running) return;

      setState(() {
        velocity -= 0.0038;
        playerY = (playerY + velocity).clamp(0.0, 0.62);
        if (playerY == 0 && velocity < 0) velocity = 0;

        final speed = 0.012 + math.min(score, 900) / 90000;
        obstacleX -= speed;
        if (obstacleX < -0.18) {
          obstacleX = 1.12;
          score += 1;
        }
      });

      if (hasCollision()) {
        endGame();
      }
    });
  }

  void jump() {
    if (!running) {
      startGame();
      return;
    }
    if (playerY <= 0.01) {
      setState(() {
        velocity = 0.078;
      });
    }
  }

  bool hasCollision() {
    final playerLeft = 0.16;
    final playerRight = playerLeft + 0.12;
    final obstacleLeft = obstacleX;
    final obstacleRight = obstacleX + 0.08;
    final horizontalHit =
        obstacleLeft < playerRight && obstacleRight > playerLeft;
    final verticalHit = playerY < 0.20;
    return horizontalHit && verticalHit;
  }

  Future<void> endGame() async {
    timer?.cancel();
    setState(() {
      running = false;
      gameOver = true;
    });
    await saveBestScore();
  }

  @override
  Widget build(BuildContext context) {
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : _appBg;
    final cardBg = whiteMode ? _lightSurface : _darkSurface;
    final cardLine = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;
    final accent = whiteMode ? _lightBlue : _cyan;
    final danger = whiteMode ? const Color(0xFFEF4444) : Colors.redAccent;

    return Scaffold(
      backgroundColor: pageBg,
      bottomNavigationBar: buildAdOnlyBottomBar(),
      appBar: AppBar(
        title: const Text('점프 장애물 피하기'),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          buildWhiteModeButton(context),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 88),
          children: [
            Row(
              children: [
                Expanded(
                  child: _GameScoreBox(
                    label: '점수',
                    value: '$score',
                    color: accent,
                    whiteMode: whiteMode,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _GameScoreBox(
                    label: '신기록',
                    value: '$bestScore',
                    color: danger,
                    whiteMode: whiteMode,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: jump,
              child: AspectRatio(
                aspectRatio: 1.36,
                child: Container(
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: cardLine),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      final height = constraints.maxHeight;
                      final groundTop = height - _groundHeight;
                      final playerLeft = width * 0.16;
                      final playerBottom = _groundHeight + playerY * 150;
                      final obstacleLeft = width * obstacleX;

                      return Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            height: _groundHeight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: accent.withValues(
                                  alpha: whiteMode ? 0.08 : 0.14,
                                ),
                                borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(18),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: groundTop,
                            child: Container(height: 2, color: cardLine),
                          ),
                          Positioned(
                            left: playerLeft,
                            bottom: playerBottom,
                            child: Container(
                              width: _playerSize,
                              height: _playerSize,
                              decoration: BoxDecoration(
                                color: accent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.directions_run_rounded,
                                color: whiteMode ? Colors.white : _appBg,
                                size: 22,
                              ),
                            ),
                          ),
                          Positioned(
                            left: obstacleLeft,
                            bottom: _groundHeight,
                            child: Container(
                              width: _obstacleWidth,
                              height: _obstacleHeight,
                              decoration: BoxDecoration(
                                color: danger,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          if (!running)
                            Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: cardBg.withValues(alpha: 0.92),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: cardLine),
                                ),
                                child: Text(
                                  gameOver ? '다시 시작하려면 탭' : '탭해서 시작',
                                  style: TextStyle(
                                    color: primaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '화면을 탭해서 점프하고 장애물을 피하세요.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryText,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 44,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: accent,
                  foregroundColor: whiteMode ? Colors.white : _appBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: startGame,
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text(
                  '새 게임',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GameScoreBox extends StatelessWidget {
  const _GameScoreBox({
    required this.label,
    required this.value,
    required this.color,
    required this.whiteMode,
  });

  final String label;
  final String value;
  final Color color;
  final bool whiteMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: whiteMode ? 0.09 : 0.14),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class NumberGuessGamePage extends StatefulWidget {
  const NumberGuessGamePage({super.key});

  @override
  State<NumberGuessGamePage> createState() => _NumberGuessGamePageState();
}

class _NumberGuessGamePageState extends State<NumberGuessGamePage> {
  final guessController = TextEditingController();
  final random = math.Random();
  final rankings = <Map<String, dynamic>>[];

  late int answer;
  int attempts = 0;
  String message = '1부터 100 사이 숫자를 맞춰보세요.';
  bool solved = false;

  @override
  void initState() {
    super.initState();
    resetGame();
    unawaited(loadRankings());
  }

  @override
  void dispose() {
    guessController.dispose();
    super.dispose();
  }

  void resetGame() {
    answer = random.nextInt(100) + 1;
    attempts = 0;
    solved = false;
    message = '1부터 100 사이 숫자를 맞춰보세요.';
    guessController.clear();
    if (mounted) setState(() {});
  }

  Future<void> loadRankings() async {
    final prefs = await SharedPreferences.getInstance();
    final rawItems =
        prefs.getStringList(_numberGuessRankingPrefsKey) ?? const [];
    final nextItems = rawItems
        .map((raw) {
          try {
            final data = jsonDecode(raw) as Map<String, dynamic>;
            return {
              'name': (data['name'] ?? '').toString(),
              'attempts': int.tryParse('${data['attempts']}') ?? 0,
              'createdAt': (data['createdAt'] ?? '').toString(),
            };
          } catch (_) {
            return <String, dynamic>{};
          }
        })
        .where((item) =>
            (item['name'] ?? '').toString().isNotEmpty &&
            (item['attempts'] as int? ?? 0) > 0)
        .toList()
      ..sort((a, b) {
        final attemptCompare =
            (a['attempts'] as int).compareTo(b['attempts'] as int);
        if (attemptCompare != 0) return attemptCompare;
        return (b['createdAt'] as String).compareTo(a['createdAt'] as String);
      });

    if (!mounted) return;
    setState(() {
      rankings
        ..clear()
        ..addAll(nextItems.take(10));
    });
  }

  Future<void> recordRanking() async {
    final identity = await ensureAnonymousUserIdentity();
    final isAdmin = appUserAdminNotifier.value;
    final entry = {
      'name': appUserDisplayName(identity, isAdmin: isAdmin),
      'attempts': attempts,
      'createdAt': DateTime.now().toIso8601String(),
    };
    final nextItems = [entry, ...rankings]..sort((a, b) {
        final attemptCompare =
            (a['attempts'] as int).compareTo(b['attempts'] as int);
        if (attemptCompare != 0) return attemptCompare;
        return (b['createdAt'] as String).compareTo(a['createdAt'] as String);
      });
    final limitedItems = nextItems.take(10).toList();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _numberGuessRankingPrefsKey,
      limitedItems.map(jsonEncode).toList(),
    );
    if (!mounted) return;
    setState(() {
      rankings
        ..clear()
        ..addAll(limitedItems);
    });
  }

  void submitGuess() {
    if (solved) return;

    final guess = int.tryParse(guessController.text.trim()) ?? 0;
    if (guess < 1 || guess > 100) {
      setState(() {
        message = '1부터 100 사이 숫자를 입력해 주세요.';
      });
      return;
    }

    var completed = false;
    setState(() {
      attempts += 1;
      if (guess == answer) {
        solved = true;
        completed = true;
        message = '정답입니다. $attempts번 만에 맞췄어요.';
      } else if (guess < answer) {
        message = '더 큰 숫자입니다.';
      } else {
        message = '더 작은 숫자입니다.';
      }
    });
    guessController.clear();
    if (completed) {
      unawaited(recordRanking());
    }
  }

  String rankingTimeText(String source) {
    final date = DateTime.tryParse(source)?.toLocal();
    if (date == null) return '';
    return '${date.month.toString().padLeft(2, '0')}.'
        '${date.day.toString().padLeft(2, '0')} '
        '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : _appBg;
    final cardBg = whiteMode ? _lightSurface : _darkSurface;
    final cardLine = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;
    final accent = whiteMode ? _lightBlue : _cyan;

    return Scaffold(
      backgroundColor: pageBg,
      bottomNavigationBar: buildAdOnlyBottomBar(),
      appBar: AppBar(
        title: const Text('숫자 맞추기'),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          buildWhiteModeButton(context),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 88),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: cardLine),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: whiteMode ? 0.10 : 0.16),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.casino_rounded,
                      color: accent,
                      size: 26,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    message,
                    style: TextStyle(
                      color: primaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '시도 횟수 $attempts',
                    style: TextStyle(
                      color: secondaryText,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: guessController,
                    enabled: !solved,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => submitGuess(),
                    style: TextStyle(color: primaryText, fontSize: 15),
                    decoration: InputDecoration(
                      labelText: '숫자 입력',
                      labelStyle: TextStyle(color: secondaryText),
                      filled: true,
                      fillColor: whiteMode
                          ? const Color(0xFFF8FAFC)
                          : _darkSurfaceSoft,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: cardLine),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: cardLine),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: accent),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: accent,
                            foregroundColor: whiteMode ? Colors.white : _appBg,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: solved ? null : submitGuess,
                          icon: const Icon(Icons.check_rounded, size: 18),
                          label: const Text(
                            '확인',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 40,
                        width: 46,
                        child: IconButton.filledTonal(
                          onPressed: resetGame,
                          icon: const Icon(Icons.refresh_rounded),
                          tooltip: '새 게임',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: cardLine),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.leaderboard_rounded,
                        color: accent,
                        size: 19,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        '랭킹',
                        style: TextStyle(
                          color: primaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (rankings.isEmpty)
                    Text(
                      '아직 기록이 없습니다.',
                      style: TextStyle(
                        color: secondaryText,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  else
                    ...rankings.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      final rank = index + 1;
                      final name = (item['name'] ?? '').toString();
                      final attemptCount = item['attempts'] as int;
                      final createdAt =
                          rankingTimeText((item['createdAt'] ?? '').toString());
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index == rankings.length - 1 ? 0 : 9,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                              child: Text(
                                '$rank',
                                style: TextStyle(
                                  color: rank <= 3 ? accent : secondaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: primaryText,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Text(
                              '$attemptCount회',
                              style: TextStyle(
                                color: accent,
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            if (createdAt.isNotEmpty) ...[
                              const SizedBox(width: 8),
                              Text(
                                createdAt,
                                style: TextStyle(
                                  color: secondaryText,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InquiryPage extends StatefulWidget {
  const InquiryPage({super.key});

  @override
  State<InquiryPage> createState() => _InquiryPageState();
}

class _InquiryPageState extends State<InquiryPage> {
  static const int _inquiriesPerPage = 8;

  final contentController = TextEditingController();
  final replyControllers = <String, TextEditingController>{};
  final inquiries = <Map<String, String>>[];
  final replyingInquiryIds = <String>{};
  final pinningInquiryIds = <String>{};
  final deletingInquiryIds = <String>{};
  bool loading = false;
  bool submitting = false;
  int inquiryPage = 0;

  @override
  void initState() {
    super.initState();
    loadInquiries();
  }

  @override
  void dispose() {
    contentController.dispose();
    for (final controller in replyControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> loadInquiries() async {
    setState(() {
      loading = true;
    });
    try {
      final response = await http
          .get(Uri.parse(_inquiriesUrl))
          .timeout(const Duration(seconds: 8));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Inquiry API ${response.statusCode}');
      }
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      applyInquiryResponse(data);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('문의 목록을 불러오지 못했습니다.'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  void applyInquiryResponse(Map<String, dynamic> data) {
    final nextItems = (data['items'] as List? ?? const [])
        .whereType<Map>()
        .map(
          (item) => {
            'inquiryId': (item['inquiryId'] ?? '').toString(),
            'id': (item['nickname'] ?? item['id'] ?? '').toString(),
            'content': (item['content'] ?? '').toString(),
            'createdAt':
                formatInquiryDate((item['createdAt'] ?? '').toString()),
            'answer': (item['answer'] ?? '').toString(),
            'answeredAt':
                formatInquiryDate((item['answeredAt'] ?? '').toString()),
            'answeredBy': (item['answeredBy'] ?? '').toString(),
            'pinned': item['pinned'] == true ? 'true' : 'false',
            'pinnedAt': formatInquiryDate((item['pinnedAt'] ?? '').toString()),
          },
        )
        .where((item) => item['content']!.isNotEmpty)
        .toList();

    if (!mounted) return;
    setState(() {
      inquiries
        ..clear()
        ..addAll(nextItems);
      final maxPage = inquiries.isEmpty
          ? 0
          : ((inquiries.length - 1) / _inquiriesPerPage).floor();
      inquiryPage = inquiryPage.clamp(0, maxPage).toInt();
    });
  }

  TextEditingController replyControllerFor(String inquiryId, String answer) {
    final controller = replyControllers.putIfAbsent(
      inquiryId,
      () => TextEditingController(text: answer),
    );
    if (controller.text.isEmpty && answer.isNotEmpty) {
      controller.text = answer;
    }
    return controller;
  }

  Future<void> submitInquiryReply(Map<String, String> item) async {
    final inquiryId = item['inquiryId'] ?? '';
    if (inquiryId.isEmpty || replyingInquiryIds.contains(inquiryId)) return;

    final identity = await ensureAnonymousUserIdentity();
    if (!mounted) return;
    if (!appUserAdminNotifier.value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('관리자만 답변을 등록할 수 있습니다.')),
      );
      return;
    }

    final answer =
        replyControllerFor(inquiryId, item['answer'] ?? '').text.trim();
    if (answer.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('답변 내용을 입력해 주세요.')),
      );
      return;
    }

    setState(() {
      replyingInquiryIds.add(inquiryId);
    });

    try {
      final response = await http
          .post(
            Uri.parse(_inquiriesReplyUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'adminUid': identity.uid,
              'inquiryId': inquiryId,
              'answer': answer,
            }),
          )
          .timeout(const Duration(seconds: 8));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Inquiry reply API ${response.statusCode}');
      }
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      applyInquiryResponse(data);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('답변 등록에 실패했습니다. 잠시 후 다시 시도해 주세요.')),
      );
    } finally {
      if (mounted) {
        setState(() {
          replyingInquiryIds.remove(inquiryId);
        });
      }
    }
  }

  Future<void> toggleInquiryPin(Map<String, String> item) async {
    final inquiryId = item['inquiryId'] ?? '';
    if (inquiryId.isEmpty || pinningInquiryIds.contains(inquiryId)) return;

    final identity = await ensureAnonymousUserIdentity();
    if (!mounted) return;
    if (!appUserAdminNotifier.value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('관리자만 고정할 수 있습니다.')),
      );
      return;
    }

    final nextPinned = item['pinned'] != 'true';
    setState(() {
      pinningInquiryIds.add(inquiryId);
    });

    try {
      final response = await http
          .post(
            Uri.parse(_inquiriesPinUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'adminUid': identity.uid,
              'inquiryId': inquiryId,
              'pinned': nextPinned,
            }),
          )
          .timeout(const Duration(seconds: 8));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Inquiry pin API ${response.statusCode}');
      }
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      applyInquiryResponse(data);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('고정 상태를 저장하지 못했습니다.')),
      );
    } finally {
      if (mounted) {
        setState(() {
          pinningInquiryIds.remove(inquiryId);
        });
      }
    }
  }

  Future<void> deleteInquiry(Map<String, String> item) async {
    final inquiryId = item['inquiryId'] ?? '';
    if (inquiryId.isEmpty || deletingInquiryIds.contains(inquiryId)) return;

    final identity = await ensureAnonymousUserIdentity();
    if (!mounted) return;
    if (!appUserAdminNotifier.value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('관리자만 삭제할 수 있습니다.')),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final whiteMode = isWhiteModeEnabled(dialogContext);
        final primaryText = whiteMode ? _lightText : _darkText;
        final dialogBg = whiteMode ? _lightSurface : _darkSurface;
        return AlertDialog(
          backgroundColor: dialogBg,
          title: Text(
            '문의 삭제',
            style: TextStyle(color: primaryText, fontWeight: FontWeight.w900),
          ),
          content: Text(
            '이 문의를 삭제할까요?',
            style: TextStyle(color: primaryText),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('취소'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('삭제'),
            ),
          ],
        );
      },
    );
    if (confirmed != true || !mounted) return;

    setState(() {
      deletingInquiryIds.add(inquiryId);
    });

    try {
      final response = await http
          .post(
            Uri.parse(_inquiriesDeleteUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'adminUid': identity.uid,
              'inquiryId': inquiryId,
            }),
          )
          .timeout(const Duration(seconds: 8));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Inquiry delete API ${response.statusCode}');
      }
      replyControllers.remove(inquiryId)?.dispose();
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      applyInquiryResponse(data);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('삭제에 실패했습니다. 잠시 후 다시 시도해 주세요.')),
      );
    } finally {
      if (mounted) {
        setState(() {
          deletingInquiryIds.remove(inquiryId);
        });
      }
    }
  }

  String formatInquiryDate(String source) {
    final parsed = DateTime.tryParse(source);
    final date = parsed?.toLocal();
    if (date == null) return source;
    return '${date.year.toString().padLeft(4, '0')}.'
        '${date.month.toString().padLeft(2, '0')}.'
        '${date.day.toString().padLeft(2, '0')} '
        '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }

  Future<void> submitInquiry() async {
    if (submitting) return;

    final identity = await ensureAnonymousUserIdentity();
    if (!mounted) return;
    final isAdmin = appUserAdminNotifier.value;
    final content = contentController.text.trim();

    if (content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('문의 내용을 입력해 주세요.'),
        ),
      );
      return;
    }

    setState(() {
      submitting = true;
    });

    try {
      final response = await http
          .post(
            Uri.parse(_inquiriesUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'uid': identity.uid,
              'nickname': appUserDisplayName(identity, isAdmin: isAdmin),
              'content': content,
            }),
          )
          .timeout(const Duration(seconds: 8));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Inquiry API ${response.statusCode}');
      }
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      applyInquiryResponse(data);
      contentController.clear();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('문의 등록에 실패했습니다. 잠시 후 다시 시도해 주세요.'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          submitting = false;
        });
      }
    }
  }

  Future<void> showAdminLoginDialog() async {
    final passwordController = TextEditingController();
    try {
      final confirmed = await showDialog<bool>(
        context: context,
        barrierDismissible: true,
        builder: (dialogContext) {
          final whiteMode = isWhiteModeEnabled(dialogContext);
          final primaryText = whiteMode ? _lightText : _darkText;
          final secondaryText = whiteMode ? _lightMuted : _darkMuted;
          final dialogBg = whiteMode ? _lightSurface : _darkSurface;
          return AlertDialog(
            backgroundColor: dialogBg,
            title: Text(
              '관리자',
              style: TextStyle(
                color: primaryText,
                fontWeight: FontWeight.w900,
              ),
            ),
            content: TextField(
              controller: passwordController,
              obscureText: true,
              autofocus: true,
              style: TextStyle(color: primaryText),
              decoration: InputDecoration(
                labelText: '비밀번호',
                labelStyle: TextStyle(color: secondaryText),
              ),
              onSubmitted: (_) => Navigator.pop(dialogContext, true),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, false),
                child: const Text('취소'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(dialogContext, true),
                child: const Text('확인'),
              ),
            ],
          );
        },
      );

      if (confirmed != true || !mounted) return;

      if (passwordController.text.trim() != _ownerAdminPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('비밀번호가 맞지 않습니다.')),
        );
        return;
      }

      await activateOwnerAdminIdentity();
      if (!mounted) return;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('관리자 권한으로 전환되었습니다.')),
      );
    } finally {
      passwordController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : _appBg;
    final cardBg = whiteMode ? _lightSurface : _darkSurface;
    final cardLine = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;
    final accent = whiteMode ? _lightBlue : _cyan;
    final totalInquiryPages = inquiries.isEmpty
        ? 1
        : ((inquiries.length - 1) / _inquiriesPerPage).floor() + 1;
    final normalizedInquiryPage =
        inquiryPage.clamp(0, totalInquiryPages - 1).toInt();
    final pagedInquiries = inquiries
        .skip(normalizedInquiryPage * _inquiriesPerPage)
        .take(_inquiriesPerPage)
        .toList();

    InputDecoration inputDecoration(String label) => InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: secondaryText, fontSize: 12),
          filled: true,
          fillColor: whiteMode ? const Color(0xFFF8FAFC) : _darkSurfaceSoft,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: cardLine),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: cardLine),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: accent),
          ),
        );

    void openInquiryDetail(Map<String, String> item) {
      final inquiryId = item['inquiryId'] ?? '';
      final answer = item['answer'] ?? '';
      final answeredAt = item['answeredAt'] ?? '';
      final pinned = item['pinned'] == 'true';
      final canManageInquiry =
          appUserAdminNotifier.value && inquiryId.isNotEmpty;
      final replying = replyingInquiryIds.contains(inquiryId);
      final deleting = deletingInquiryIds.contains(inquiryId);
      final replyController =
          canManageInquiry ? replyControllerFor(inquiryId, answer) : null;

      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (detailContext) {
          final keyboardBottom = MediaQuery.viewInsetsOf(detailContext).bottom;
          return AnimatedPadding(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOutCubic,
            padding: EdgeInsets.only(bottom: keyboardBottom),
            child: FractionallySizedBox(
              heightFactor: keyboardBottom > 0 ? 0.96 : 0.86,
              child: Container(
                decoration: BoxDecoration(
                  color: pageBg,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(22),
                  ),
                ),
                child: SafeArea(
                  top: false,
                  child: ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: EdgeInsets.fromLTRB(
                      16,
                      14,
                      16,
                      keyboardBottom > 0 ? 120 : 22,
                    ),
                    children: [
                      Center(
                        child: Container(
                          width: 36,
                          height: 4,
                          decoration: BoxDecoration(
                            color: secondaryText.withValues(alpha: 0.35),
                            borderRadius: BorderRadius.circular(99),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Icon(
                            Icons.help_outline_rounded,
                            color: accent,
                            size: 18,
                          ),
                          const SizedBox(width: 7),
                          Expanded(
                            child: Text(
                              '문의 내용',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: primaryText,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          if (pinned)
                            Icon(
                              Icons.push_pin_rounded,
                              color: accent,
                              size: 16,
                            ),
                          const SizedBox(width: 8),
                          Text(
                            item['createdAt'] ?? '',
                            style: TextStyle(
                              color: secondaryText,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: cardBg,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: cardLine),
                        ),
                        child: Text(
                          item['content'] ?? '',
                          style: TextStyle(
                            color: primaryText,
                            fontSize: 14,
                            height: 1.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      if (answer.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: accent.withValues(
                              alpha: whiteMode ? 0.08 : 0.12,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: accent.withValues(alpha: 0.28),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.admin_panel_settings_rounded,
                                    color: accent,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      '관리자 답변',
                                      style: TextStyle(
                                        color: accent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  if (answeredAt.isNotEmpty)
                                    Text(
                                      answeredAt,
                                      style: TextStyle(
                                        color: secondaryText,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                answer,
                                style: TextStyle(
                                  color: primaryText,
                                  fontSize: 13,
                                  height: 1.45,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (canManageInquiry) ...[
                        const SizedBox(height: 14),
                        TextField(
                          controller: replyController,
                          minLines: 3,
                          maxLines: 7,
                          textInputAction: TextInputAction.newline,
                          style: TextStyle(color: primaryText, fontSize: 13),
                          decoration: inputDecoration(
                            answer.isEmpty ? '관리자 답변' : '답변 수정',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: FilledButton.icon(
                                style: FilledButton.styleFrom(
                                  backgroundColor: accent,
                                  foregroundColor:
                                      whiteMode ? Colors.white : _appBg,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: replying
                                    ? null
                                    : () => submitInquiryReply(item),
                                icon: replying
                                    ? SizedBox(
                                        width: 14,
                                        height: 14,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color:
                                              whiteMode ? Colors.white : _appBg,
                                        ),
                                      )
                                    : const Icon(Icons.reply_rounded, size: 17),
                                label: Text(
                                  replying ? '저장 중' : '답변 등록',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              height: 40,
                              width: 46,
                              child: IconButton.filledTonal(
                                tooltip: '문의 삭제',
                                onPressed: deleting
                                    ? null
                                    : () async {
                                        await deleteInquiry(item);
                                        if (detailContext.mounted) {
                                          Navigator.pop(detailContext);
                                        }
                                      },
                                icon: deleting
                                    ? const SizedBox(
                                        width: 14,
                                        height: 14,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : const Icon(Icons.delete_outline_rounded),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    Widget inquiryItem(Map<String, String> item) {
      final inquiryId = item['inquiryId'] ?? '';
      final answer = item['answer'] ?? '';
      final pinned = item['pinned'] == 'true';
      final canManageInquiry =
          appUserAdminNotifier.value && inquiryId.isNotEmpty;
      final pinning = pinningInquiryIds.contains(inquiryId);
      final preview = item['content'] ?? '';

      return Material(
        color: cardBg,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () => openInquiryDetail(item),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: cardLine),
            ),
            child: Row(
              children: [
                Icon(
                  pinned ? Icons.push_pin_rounded : Icons.help_outline_rounded,
                  color: pinned ? Colors.amber : accent,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          preview,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: primaryText,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      if (answer.isNotEmpty) ...[
                        const SizedBox(width: 6),
                        Icon(
                          Icons.mark_chat_read_rounded,
                          color: accent,
                          size: 14,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  item['createdAt'] ?? '',
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 9.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (canManageInquiry) ...[
                  const SizedBox(width: 4),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      tooltip: pinned ? '상단 고정 해제' : '상단 고정',
                      onPressed: pinning ? null : () => toggleInquiryPin(item),
                      icon: pinning
                          ? SizedBox(
                              width: 14,
                              height: 14,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: secondaryText,
                              ),
                            )
                          : Icon(
                              pinned
                                  ? Icons.star_rounded
                                  : Icons.star_border_rounded,
                              size: 19,
                            ),
                      color: pinned ? Colors.amber : secondaryText,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    }

    Widget inquiryPager() {
      if (inquiries.length <= _inquiriesPerPage) {
        return const SizedBox.shrink();
      }

      return Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              tooltip: '이전 페이지',
              onPressed: normalizedInquiryPage <= 0
                  ? null
                  : () {
                      setState(() {
                        inquiryPage = normalizedInquiryPage - 1;
                      });
                    },
              icon: const Icon(Icons.chevron_left_rounded),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: cardLine),
              ),
              child: Text(
                '${normalizedInquiryPage + 1}페이지 / $totalInquiryPages페이지',
                style: TextStyle(
                  color: primaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            IconButton(
              tooltip: '다음 페이지',
              onPressed: normalizedInquiryPage >= totalInquiryPages - 1
                  ? null
                  : () {
                      setState(() {
                        inquiryPage = normalizedInquiryPage + 1;
                      });
                    },
              icon: const Icon(Icons.chevron_right_rounded),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: pageBg,
      bottomNavigationBar: buildAdOnlyBottomBar(),
      appBar: AppBar(
        title: const Text('문의사항'),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          buildWhiteModeButton(context),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 88),
          children: [
            Text(
              '문의 리스트',
              style: TextStyle(
                color: primaryText,
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            if (loading)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: CircularProgressIndicator(color: accent),
                ),
              )
            else if (inquiries.isEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: cardLine),
                ),
                child: Text(
                  '아직 등록된 문의가 없습니다.',
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            else
              ...pagedInquiries.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: inquiryItem(item),
                ),
              ),
            inquiryPager(),
            const SizedBox(height: 18),
            Text(
              '문의 작성',
              style: TextStyle(
                color: primaryText,
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contentController,
              minLines: 5,
              maxLines: 8,
              textInputAction: TextInputAction.newline,
              style: TextStyle(color: primaryText, fontSize: 13),
              decoration: inputDecoration('내용'),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 44,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: accent,
                  foregroundColor: whiteMode ? Colors.white : _appBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: submitInquiry,
                icon: submitting
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: whiteMode ? Colors.white : _appBg,
                        ),
                      )
                    : const Icon(Icons.send_rounded, size: 18),
                label: Text(
                  submitting ? '등록 중' : '등록',
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Center(
              child: TextButton.icon(
                onPressed: showAdminLoginDialog,
                icon: Icon(
                  Icons.admin_panel_settings_rounded,
                  color: secondaryText,
                  size: 17,
                ),
                label: Text(
                  '관리자',
                  style: TextStyle(
                    color: secondaryText,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CloseGuessRankingPage extends StatefulWidget {
  const CloseGuessRankingPage({
    super.key,
    required this.initialClose,
  });

  final double initialClose;

  @override
  State<CloseGuessRankingPage> createState() => _CloseGuessRankingPageState();
}

class _CloseGuessRankingPageState extends State<CloseGuessRankingPage> {
  final idController = TextEditingController();
  final priceController = TextEditingController();
  final messageController = TextEditingController();

  List<CloseGuessEntry> entries = [];
  List<String> dates = [];
  CloseGuessWinnerMessage? winnerMessage;
  String selectedDate = '';
  String lastSubmittedId = '';
  String winnerMessageToken = '';
  double referenceClose = 0;
  bool loading = false;
  bool started = false;

  @override
  void initState() {
    super.initState();
    referenceClose = widget.initialClose;
    loadRanking();
  }

  @override
  void dispose() {
    idController.dispose();
    priceController.dispose();
    messageController.dispose();
    super.dispose();
  }

  String todayDate() => _closeGuessSubmissionDate();

  List<CloseGuessEntry> sortedEntries() {
    final date = selectedDate.isEmpty ? todayDate() : selectedDate;
    final next = entries.where((entry) => entry.date == date).toList()
      ..sort((a, b) {
        final diff = a.difference.compareTo(b.difference);
        if (diff != 0) return diff;
        return a.price.compareTo(b.price);
      });
    return next.take(5).toList();
  }

  Future<void> loadRanking({String? date}) async {
    setState(() {
      loading = true;
    });

    try {
      final uri = Uri.parse(_closeGuessRankingsUrl).replace(
        queryParameters: date == null && selectedDate.isEmpty
            ? null
            : {'date': date ?? selectedDate},
      );
      final response = await http.get(uri).timeout(const Duration(seconds: 8));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Ranking API ${response.statusCode}');
      }
      final ranking = CloseGuessRankingState.fromMap(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
      if (ranking == null) throw Exception('Invalid ranking response');
      if (!mounted) return;
      applyRanking(ranking);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        selectedDate = selectedDate.isEmpty ? todayDate() : selectedDate;
        dates = dates.isEmpty ? [selectedDate] : dates;
      });
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  void applyRanking(CloseGuessRankingState ranking) {
    setState(() {
      selectedDate = ranking.date;
      dates = ranking.dates.isEmpty ? [ranking.date] : ranking.dates;
      if (ranking.referenceClose > 0) {
        referenceClose = ranking.referenceClose;
      }
      entries = ranking.entries
          .map(
            (entry) => CloseGuessEntry(
              id: entry.id,
              uid: entry.uid,
              price: entry.price,
              close: entry.close,
              date: ranking.date,
              submittedAt: entry.submittedAt,
            ),
          )
          .toList();
      winnerMessage = ranking.winnerMessage;
    });
    unawaited(refreshWinnerMessageToken());
  }

  void applyRankingWithSubmittedEntry(
    CloseGuessRankingState ranking,
    CloseGuessEntry submittedEntry,
  ) {
    final submittedForRankingDate = CloseGuessEntry(
      id: submittedEntry.id,
      uid: submittedEntry.uid,
      price: submittedEntry.price,
      close: submittedEntry.close,
      date: ranking.date,
      submittedAt: submittedEntry.submittedAt,
    );
    final mergedEntries = ranking.entries
        .where(
          (entry) => submittedForRankingDate.uid.isNotEmpty
              ? entry.uid != submittedForRankingDate.uid
              : entry.id != submittedForRankingDate.id,
        )
        .toList()
      ..add(submittedForRankingDate);

    applyRanking(
      CloseGuessRankingState(
        date: ranking.date,
        dates: ranking.dates.contains(ranking.date)
            ? ranking.dates
            : [ranking.date, ...ranking.dates],
        entries: mergedEntries,
        referenceClose: ranking.referenceClose,
        winnerMessage: ranking.winnerMessage,
      ),
    );
  }

  Future<void> saveWinnerMessageToken(
      String date, String uid, String token) async {
    if (date.isEmpty || uid.isEmpty || token.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('closeGuessWinnerToken:$date:$uid', token);
  }

  Future<String> loadWinnerMessageToken(String date, String uid) async {
    if (date.isEmpty || uid.isEmpty) return '';
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('closeGuessWinnerToken:$date:$uid') ?? '';
  }

  Future<void> refreshWinnerMessageToken() async {
    final rankings = sortedEntries();
    final winner = rankings.isEmpty ? null : rankings.first;
    final identity = await ensureAnonymousUserIdentity();
    final token = winner == null || winner.uid != identity.uid
        ? ''
        : await loadWinnerMessageToken(selectedDate, identity.uid);
    if (!mounted) return;
    setState(() {
      winnerMessageToken = token;
    });
  }

  Future<void> submitGuess() async {
    final gameLocale = Localizations.localeOf(context);
    final identity = await ensureAnonymousUserIdentity();
    if (!mounted) return;
    final isAdmin = appUserAdminNotifier.value;
    final id = idController.text.trim().isNotEmpty
        ? idController.text.trim()
        : appUserDisplayName(identity, isAdmin: isAdmin);
    final rawPrice = double.tryParse(
          priceController.text.trim().replaceAll(',', ''),
        ) ??
        0;
    final price = double.parse(rawPrice.toStringAsFixed(2));
    final close = referenceClose > 0 ? referenceClose : widget.initialClose;

    if (price <= 0 || close <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            close <= 0
                ? localizedCloseGuessText(gameLocale, 'referenceCloseMissing')
                : localizedCloseGuessText(gameLocale, 'idPriceMissing'),
          ),
        ),
      );
      return;
    }

    final entry = CloseGuessEntry(
      id: id,
      uid: identity.uid,
      price: price,
      close: close,
      date: todayDate(),
      submittedAt: DateTime.now().toIso8601String(),
    );
    lastSubmittedId = identity.uid;

    try {
      final response = await http
          .post(
            Uri.parse(_closeGuessSubmitUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(entry.toJson()),
          )
          .timeout(const Duration(seconds: 8));
      if (response.statusCode == 403) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                localizedCloseGuessText(gameLocale, 'submissionWindowClosed')),
          ),
        );
        return;
      }
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Ranking API ${response.statusCode}');
      }
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final ranking = CloseGuessRankingState.fromMap(data);
      if (ranking == null) throw Exception('Invalid ranking response');
      final token = (data['winnerMessageToken'] ?? '').toString();
      if (token.isNotEmpty) {
        await saveWinnerMessageToken(ranking.date, identity.uid, token);
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(localizedCloseGuessText(gameLocale, 'rankingUnavailable')),
        ),
      );
      return;
    }

    idController.clear();
    priceController.clear();
    if (!mounted) return;
    setState(() {
      selectedDate = '';
      winnerMessageToken = '';
    });
    unawaited(loadRanking());
  }

  Future<void> submitWinnerMessage() async {
    final gameLocale = Localizations.localeOf(context);
    final rankings = sortedEntries();
    final winner = rankings.isEmpty ? null : rankings.first;
    final message = messageController.text.trim();
    final identity = await ensureAnonymousUserIdentity();
    final token = winner == null || winner.uid != identity.uid
        ? ''
        : (winnerMessageToken.isNotEmpty
            ? winnerMessageToken
            : await loadWinnerMessageToken(selectedDate, identity.uid));

    if (winner == null || token.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(localizedCloseGuessText(gameLocale, 'winnerTokenMissing')),
        ),
      );
      return;
    }

    try {
      final response = await http
          .post(
            Uri.parse(_closeGuessWinnerMessageUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'date': selectedDate,
              'uid': identity.uid,
              'id': winner.id,
              'token': token,
              'message': message,
            }),
          )
          .timeout(const Duration(seconds: 8));
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Ranking API ${response.statusCode}');
      }
      final ranking = CloseGuessRankingState.fromMap(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
      if (ranking == null) throw Exception('Invalid ranking response');
      applyRanking(ranking);
      messageController.clear();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(localizedCloseGuessText(gameLocale, 'messageSaveFailed')),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameLocale = Localizations.localeOf(context);
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : _appBg;
    final cardBg = whiteMode ? _lightSurface : _darkSurface;
    final cardLine = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;
    final mutedText = whiteMode ? const Color(0xFF94A3B8) : _darkFaint;
    final accent = whiteMode ? _lightBlue : _cyan;
    final panelBg =
        whiteMode ? const Color(0xFFF8FAFC) : const Color(0xFF111827);
    final rankings = sortedEntries();
    final winner = rankings.isEmpty ? null : rankings.first;

    InputDecoration inputDecoration(String label) => InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: secondaryText, fontSize: 12),
          filled: true,
          fillColor: panelBg,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: cardLine),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: cardLine),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: accent),
          ),
        );

    Widget ruleCard() {
      return Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: cardLine),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: accent.withValues(alpha: whiteMode ? 0.11 : 0.16),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                Icons.emoji_events_rounded,
                color: accent,
                size: 24,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              localizedCloseGuessText(gameLocale, 'rulesTitle'),
              style: TextStyle(
                color: primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              localizedCloseGuessText(gameLocale, 'rulesBody'),
              style: TextStyle(
                color: secondaryText,
                fontSize: 13,
                height: 1.45,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            _CloseGuessRuleRow(
              icon: Icons.edit_rounded,
              text: localizedCloseGuessText(gameLocale, 'rule1'),
              color: accent,
              textColor: primaryText,
            ),
            const SizedBox(height: 8),
            _CloseGuessRuleRow(
              icon: Icons.format_list_numbered_rounded,
              text: localizedCloseGuessText(gameLocale, 'rule2'),
              color: accent,
              textColor: primaryText,
            ),
            const SizedBox(height: 8),
            _CloseGuessRuleRow(
              icon: Icons.chat_bubble_rounded,
              text: localizedCloseGuessText(gameLocale, 'rule3'),
              color: accent,
              textColor: primaryText,
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: accent,
                  foregroundColor: whiteMode ? Colors.white : _appBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    started = true;
                  });
                  if (entries.isEmpty && !loading) {
                    unawaited(loadRanking());
                  }
                },
                child: Text(
                  localizedCloseGuessText(gameLocale, 'start'),
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: pageBg,
      bottomNavigationBar: buildAdOnlyBottomBar(),
      appBar: AppBar(
        title: Text(localizedCloseGuessText(gameLocale, 'title')),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          buildWhiteModeButton(context),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 88),
          children: started
              ? [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: cardLine),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localizedCloseGuessText(
                              gameLocale, 'todayPrediction'),
                          style: TextStyle(
                            color: primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          referenceClose > 0
                              ? localizedCloseGuessReferenceClose(
                                  gameLocale,
                                  referenceClose,
                                )
                              : localizedCloseGuessText(
                                  gameLocale,
                                  'referenceCloseLoading',
                                ),
                          style: TextStyle(
                            color: secondaryText,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: idController,
                                textInputAction: TextInputAction.next,
                                style:
                                    TextStyle(color: primaryText, fontSize: 13),
                                decoration: inputDecoration('닉네임(선택)'),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: priceController,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                inputFormatters: [
                                  TextInputFormatter.withFunction(
                                      (oldValue, newValue) {
                                    final text = newValue.text;
                                    if (text.isEmpty) return newValue;
                                    return RegExp(r'^\d*\.?\d{0,2}$')
                                            .hasMatch(text)
                                        ? newValue
                                        : oldValue;
                                  }),
                                ],
                                textInputAction: TextInputAction.done,
                                style:
                                    TextStyle(color: primaryText, fontSize: 13),
                                decoration: inputDecoration('가격 0.00'),
                                onSubmitted: (_) => submitGuess(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 42,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: accent,
                              foregroundColor:
                                  whiteMode ? Colors.white : _appBg,
                            ),
                            onPressed: submitGuess,
                            child: Text(
                              localizedCloseGuessText(gameLocale, 'join'),
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: cardLine),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                localizedCloseGuessPreviousResultTitle(
                                    gameLocale),
                                style: TextStyle(
                                  color: primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            if (loading)
                              SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: accent,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          referenceClose > 0
                              ? localizedCloseGuessPreviousClose(
                                  gameLocale,
                                  referenceClose,
                                )
                              : localizedCloseGuessText(
                                  gameLocale,
                                  'referenceCloseLoading',
                                ),
                          style: TextStyle(
                            color: primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          localizedCloseGuessWinnerSummary(gameLocale, winner),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: winner == null ? mutedText : accent,
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              : [
                  ruleCard(),
                ],
        ),
      ),
    );
  }
}

class _CloseGuessRuleRow extends StatelessWidget {
  const _CloseGuessRuleRow({
    required this.icon,
    required this.text,
    required this.color,
    required this.textColor,
  });

  final IconData icon;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 17),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildPersistentBottomNav(
  BuildContext context, {
  required NavTab currentTab,
}) {
  final l10n = AppLocalizations.of(context)!;
  final isChart = currentTab == NavTab.chart;
  final isExchange = currentTab == NavTab.exchange;
  final isFearGreed = currentTab == NavTab.fearGreed;
  final isAlert = currentTab == NavTab.alert;
  final isStrategy = currentTab == NavTab.strategy;
  final whiteMode = isWhiteModeEnabled(context);

  Widget item(IconData icon, String label, bool selected, VoidCallback onTap,
      {int badgeCount = 0}) {
    final color = selected
        ? (whiteMode ? _lightBlue : _blue)
        : (whiteMode ? _lightMuted : Colors.white54);

    return InkWell(
      borderRadius: BorderRadius.circular(13),
      onTap: selected ? null : onTap,
      child: SizedBox(
        width: 48,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 21,
                ),
                if (badgeCount > 0)
                  Positioned(
                    right: -9,
                    top: -7,
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 15,
                        minHeight: 15,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        badgeCount > 99 ? '99+' : '$badgeCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: 9,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  return Container(
    margin: EdgeInsets.zero,
    padding: const EdgeInsets.symmetric(
      horizontal: 6,
      vertical: 7,
    ),
    decoration: BoxDecoration(
      color: whiteMode ? Colors.white : const Color(0xF20A1726),
      borderRadius: BorderRadius.zero,
      border: Border(
        top: BorderSide(color: whiteMode ? _lightLine : _cardLine),
      ),
      boxShadow: whiteMode
          ? [
              BoxShadow(
                color: const Color(0xFF0F172A).withValues(alpha: 0.06),
                blurRadius: 18,
                offset: const Offset(0, -5),
              ),
            ]
          : const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 18,
                offset: Offset(0, -5),
              ),
            ],
    ),
    child: SafeArea(
      top: false,
      minimum: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          item(
            Icons.home_rounded,
            l10n.navHome,
            false,
            () {
              goHomeAndScrollTop(context);
            },
          ),
          item(
            Icons.show_chart_rounded,
            l10n.navChart,
            isChart,
            () => openChartPage(context),
          ),
          item(
            Icons.currency_exchange_rounded,
            l10n.navExchange,
            isExchange,
            () => openExchangePage(context),
          ),
          item(
            Icons.speed_rounded,
            l10n.navFearGreed,
            isFearGreed,
            () => openFearGreedPage(context),
          ),
          ValueListenableBuilder<int>(
            valueListenable: alertBadgeCount,
            builder: (context, count, _) {
              return item(
                Icons.notifications_none_rounded,
                l10n.navAlert,
                isAlert,
                () {
                  if (isAlert) return;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NotificationHistoryPage(),
                    ),
                  );
                },
                badgeCount: isAlert ? 0 : count,
              );
            },
          ),
          item(
            Icons.rule_rounded,
            l10n.navStrategy,
            isStrategy,
            () {
              if (isStrategy) return;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const StrategyPage(),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

Widget buildFixedAdBottomBar(
  Widget nav, {
  Widget? closeGuessWidget,
}) {
  return ColoredBox(
    color: whiteModeNotifier.value ? _lightAppBg : _appBg,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (closeGuessWidget != null)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 34, 12),
              child: closeGuessWidget,
            ),
          ),
        if (bottomBannerAdHeight > 0)
          SizedBox(
            height: bottomBannerAdHeight,
            child: const StrategyBannerAd(),
          ),
        nav,
      ],
    ),
  );
}

Widget buildAdOnlyBottomBar() {
  return ColoredBox(
    color: whiteModeNotifier.value ? _lightAppBg : _appBg,
    child: SafeArea(
      top: false,
      child: bottomBannerAdHeight > 0
          ? SizedBox(
              height: bottomBannerAdHeight,
              child: const StrategyBannerAd(),
            )
          : const SizedBox.shrink(),
    ),
  );
}
