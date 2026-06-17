import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    )!;
  }

  static const supportedLocales = [
    Locale('en'),
    Locale('ko'),
    Locale('ja'),
  ];

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  String get appTitle {
    switch (locale.languageCode) {
      case 'ko':
        return 'QLD 알림';
      case 'ja':
        return 'QLDアラート';
      default:
        return 'QLD Alert';
    }
  }

  String get buyStrategy {
    switch (locale.languageCode) {
      case 'ko':
        return '매수 전략';
      case 'ja':
        return '買い戦略';
      default:
        return 'BUY STRATEGY';
    }
  }

  String get noBuyZone {
    switch (locale.languageCode) {
      case 'ko':
        return '매수 금지 구간';
      case 'ja':
        return '購入禁止ゾーン';
      default:
        return 'NO BUY ZONE';
    }
  }

  String get tapToView {
    switch (locale.languageCode) {
      case 'ko':
        return '터치해서 전략 보기';
      case 'ja':
        return 'タップして戦略を見る';
      default:
        return 'TAP TO VIEW STRATEGY';
    }
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ko', 'ja'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
