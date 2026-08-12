import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh'),
    Locale('zh', 'TW')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'QLD Alert'**
  String get appTitle;

  /// No description provided for @menuThemeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get menuThemeTitle;

  /// No description provided for @menuLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get menuLanguageTitle;

  /// No description provided for @menuThemeLight.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get menuThemeLight;

  /// No description provided for @menuThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get menuThemeDark;

  /// No description provided for @noBuyZone.
  ///
  /// In en, this message translates to:
  /// **'No Additional Buy Zone'**
  String get noBuyZone;

  /// No description provided for @tapToViewStrategy.
  ///
  /// In en, this message translates to:
  /// **'Tap to View Strategy'**
  String get tapToViewStrategy;

  /// No description provided for @buyNow.
  ///
  /// In en, this message translates to:
  /// **'Buy Now'**
  String get buyNow;

  /// No description provided for @buyingInProgress.
  ///
  /// In en, this message translates to:
  /// **'Buying in Progress'**
  String get buyingInProgress;

  /// No description provided for @hold.
  ///
  /// In en, this message translates to:
  /// **'Hold'**
  String get hold;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navChart.
  ///
  /// In en, this message translates to:
  /// **'Chart'**
  String get navChart;

  /// No description provided for @navExchange.
  ///
  /// In en, this message translates to:
  /// **'FX'**
  String get navExchange;

  /// No description provided for @navFearGreed.
  ///
  /// In en, this message translates to:
  /// **'Fear'**
  String get navFearGreed;

  /// No description provided for @fearGreedTitle.
  ///
  /// In en, this message translates to:
  /// **'Fear & Greed'**
  String get fearGreedTitle;

  /// No description provided for @fearGreedInlineLabel.
  ///
  /// In en, this message translates to:
  /// **'CNN Fear & Greed'**
  String get fearGreedInlineLabel;

  /// No description provided for @fearGreedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'CNN U.S. Market Sentiment'**
  String get fearGreedSubtitle;

  /// No description provided for @fearGreedUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Fear & Greed data is unavailable.'**
  String get fearGreedUnavailable;

  /// No description provided for @navAlert.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get navAlert;

  /// No description provided for @navStrategy.
  ///
  /// In en, this message translates to:
  /// **'Strategy'**
  String get navStrategy;

  /// No description provided for @alertRecovery10.
  ///
  /// In en, this message translates to:
  /// **'QLD recovered 10%'**
  String get alertRecovery10;

  /// No description provided for @alertMarketOpen.
  ///
  /// In en, this message translates to:
  /// **'The U.S. market has opened'**
  String get alertMarketOpen;

  /// No description provided for @alertNewHigh.
  ///
  /// In en, this message translates to:
  /// **'New high reached'**
  String get alertNewHigh;

  /// No description provided for @portfolio.
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get portfolio;

  /// No description provided for @portfolioAssetInput.
  ///
  /// In en, this message translates to:
  /// **'Assets'**
  String get portfolioAssetInput;

  /// No description provided for @portfolioClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get portfolioClose;

  /// No description provided for @exitAdDialogBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get exitAdDialogBack;

  /// No description provided for @exitAdDialogExit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exitAdDialogExit;

  /// No description provided for @exitAdDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'When you exit the app, a full-screen ad may be shown at most once every 3 hours. Ad revenue is used to operate the app and improve its features. Thank you.'**
  String get exitAdDialogMessage;

  /// No description provided for @portfolioQldShares.
  ///
  /// In en, this message translates to:
  /// **'QLD Shares'**
  String get portfolioQldShares;

  /// No description provided for @portfolioTqqqShares.
  ///
  /// In en, this message translates to:
  /// **'TQQQ Shares'**
  String get portfolioTqqqShares;

  /// No description provided for @portfolioQldAveragePrice.
  ///
  /// In en, this message translates to:
  /// **'QLD Avg Price'**
  String get portfolioQldAveragePrice;

  /// No description provided for @portfolioTqqqAveragePrice.
  ///
  /// In en, this message translates to:
  /// **'TQQQ Avg Price'**
  String get portfolioTqqqAveragePrice;

  /// No description provided for @portfolioCashUsd.
  ///
  /// In en, this message translates to:
  /// **'Cash USD'**
  String get portfolioCashUsd;

  /// No description provided for @portfolioTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get portfolioTotal;

  /// No description provided for @portfolioProfitLoss.
  ///
  /// In en, this message translates to:
  /// **'P/L'**
  String get portfolioProfitLoss;

  /// No description provided for @portfolioSharesUnit.
  ///
  /// In en, this message translates to:
  /// **'shares'**
  String get portfolioSharesUnit;

  /// No description provided for @portfolioReturnRate.
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get portfolioReturnRate;

  /// No description provided for @portfolioAveragePriceShort.
  ///
  /// In en, this message translates to:
  /// **'Avg Price'**
  String get portfolioAveragePriceShort;

  /// No description provided for @portfolioPriceLoading.
  ///
  /// In en, this message translates to:
  /// **'price loading'**
  String get portfolioPriceLoading;

  /// No description provided for @portfolioToBreakeven.
  ///
  /// In en, this message translates to:
  /// **'To breakeven'**
  String get portfolioToBreakeven;

  /// No description provided for @portfolioBreakevenCleared.
  ///
  /// In en, this message translates to:
  /// **'Breakeven cleared'**
  String get portfolioBreakevenCleared;

  /// No description provided for @basePosition.
  ///
  /// In en, this message translates to:
  /// **'Base Position'**
  String get basePosition;

  /// No description provided for @fromPreviousClose.
  ///
  /// In en, this message translates to:
  /// **'vs Previous Close'**
  String get fromPreviousClose;

  /// No description provided for @from10yHigh.
  ///
  /// In en, this message translates to:
  /// **'vs All-Time High'**
  String get from10yHigh;

  /// No description provided for @holdQLDPlusCash.
  ///
  /// In en, this message translates to:
  /// **'QLD 70% + Cash 30%'**
  String get holdQLDPlusCash;

  /// No description provided for @basePositionDescription.
  ///
  /// In en, this message translates to:
  /// **'[ Strategy Guide ]\n\nThis strategy does not invest all assets into QLD at once.\n\nAt the beginning, only part of the assets is invested, while the rest is held in cash to prepare for major market declines.\n\nThe power of holding cash\n\nCash is not held to increase returns. It provides the psychological room to stay disciplined even during a falling market.\n\nMore important than the highest possible return is an investment system that can keep compounding until the end.\n\nExample:\n- Invest only 70% of initial assets into QLD\n- Hold the remaining 30% in cash\n\nQLD is an ETF that tracks approximately 2x the daily movement of the Nasdaq-100 Index.\n\nTherefore, in the initial state:\n2x leverage × 70% investment = approximately 1.4x overall exposure.\n\nFor example:\n- Nasdaq +1%\n→ Total assets about +1.4%\n\nWhen a major decline occurs, the cash held is used step by step for additional buying.\n\nExample:\n- Additional buying around the QLD -40% zone\n\nThis allows more shares to be accumulated at lower prices, and when the market recovers, the average entry price can be significantly reduced.\n\nAs a result, this strategy may produce higher returns during recovery phases than a simple buy-and-hold strategy.\n\nThe core of this strategy is:\n- Reduce volatility with cash during rising markets\n- Use cash to buy more during major declines and lower the average cost.'**
  String get basePositionDescription;

  /// No description provided for @basePositionIntro.
  ///
  /// In en, this message translates to:
  /// **'This base strategy does not invest everything at once. It holds QLD together with cash, reducing swings in rising markets and keeping room to buy more during major declines.'**
  String get basePositionIntro;

  /// No description provided for @basePositionQldAllocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Core QLD holding'**
  String get basePositionQldAllocationLabel;

  /// No description provided for @basePositionCashAllocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Cash reserve'**
  String get basePositionCashAllocationLabel;

  /// No description provided for @basePositionCorePrinciple.
  ///
  /// In en, this message translates to:
  /// **'Core Principles'**
  String get basePositionCorePrinciple;

  /// No description provided for @basePositionCashTitle.
  ///
  /// In en, this message translates to:
  /// **'Cash is not money that lowers returns'**
  String get basePositionCashTitle;

  /// No description provided for @basePositionCashText.
  ///
  /// In en, this message translates to:
  /// **'It is safety room for staying disciplined in major declines and buying more at lower prices.'**
  String get basePositionCashText;

  /// No description provided for @basePositionInitialLeverageTitle.
  ///
  /// In en, this message translates to:
  /// **'Initial movement is about 1.4x'**
  String get basePositionInitialLeverageTitle;

  /// No description provided for @basePositionInitialLeverageText.
  ///
  /// In en, this message translates to:
  /// **'QLD tracks roughly 2x the Nasdaq-100. Holding only 70% of assets in QLD lowers total portfolio movement to about 1.4x.'**
  String get basePositionInitialLeverageText;

  /// No description provided for @basePositionStepLeverageTitle.
  ///
  /// In en, this message translates to:
  /// **'Leverage rises step by step in drawdowns'**
  String get basePositionStepLeverageTitle;

  /// No description provided for @basePositionStepLeverageText.
  ///
  /// In en, this message translates to:
  /// **'From the -20% to -30% zones, adding TQQQ can lift total movement to about 1.8x. In the deepest drawdown zones, it can rise toward about 2.3x.'**
  String get basePositionStepLeverageText;

  /// No description provided for @basePositionLowAverageTitle.
  ///
  /// In en, this message translates to:
  /// **'More fear means a lower average cost'**
  String get basePositionLowAverageTitle;

  /// No description provided for @basePositionLowAverageText.
  ///
  /// In en, this message translates to:
  /// **'This app is structured to use cash to average down into TQQQ as drawdowns deepen. Building shares near low zones can make the later rebound work harder for returns.'**
  String get basePositionLowAverageText;

  /// No description provided for @basePositionSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get basePositionSummaryTitle;

  /// No description provided for @basePositionSummaryText.
  ///
  /// In en, this message translates to:
  /// **'The goal is not to guess the highest return. It is to keep a plan through drawdowns and let compounding continue for longer.'**
  String get basePositionSummaryText;

  /// No description provided for @buySignalMessage.
  ///
  /// In en, this message translates to:
  /// **'Buy signals will automatically appear here.'**
  String get buySignalMessage;

  /// No description provided for @checkStrategyCard.
  ///
  /// In en, this message translates to:
  /// **'Check the strategy card for your current zone.'**
  String get checkStrategyCard;

  /// No description provided for @strategyCardLabel.
  ///
  /// In en, this message translates to:
  /// **'Strategy Card'**
  String get strategyCardLabel;

  /// No description provided for @currentPrice.
  ///
  /// In en, this message translates to:
  /// **'Current Price'**
  String get currentPrice;

  /// No description provided for @futuresLabel.
  ///
  /// In en, this message translates to:
  /// **'After-hours'**
  String get futuresLabel;

  /// No description provided for @tenYearHigh.
  ///
  /// In en, this message translates to:
  /// **'All-Time High'**
  String get tenYearHigh;

  /// No description provided for @buyStrategy.
  ///
  /// In en, this message translates to:
  /// **'Buy Strategy'**
  String get buyStrategy;

  /// No description provided for @noBuyZoneTitle.
  ///
  /// In en, this message translates to:
  /// **'No Additional Buy Zone'**
  String get noBuyZoneTitle;

  /// No description provided for @strategyOverview.
  ///
  /// In en, this message translates to:
  /// **'Strategy Overview'**
  String get strategyOverview;

  /// No description provided for @corePrinciple.
  ///
  /// In en, this message translates to:
  /// **'Core Principle'**
  String get corePrinciple;

  /// No description provided for @suggestedAllocation.
  ///
  /// In en, this message translates to:
  /// **'Suggested Asset Allocation'**
  String get suggestedAllocation;

  /// No description provided for @riskManagement.
  ///
  /// In en, this message translates to:
  /// **'Risk Management'**
  String get riskManagement;

  /// No description provided for @actionGuide.
  ///
  /// In en, this message translates to:
  /// **'Action Guide'**
  String get actionGuide;

  /// No description provided for @marketStable.
  ///
  /// In en, this message translates to:
  /// **'The Nasdaq market has historically maintained a long-term upward trend driven by technological innovation and global growth companies in the United States. Based on this growth potential, ProShares Ultra QQQ (QLD) is a leveraged ETF designed to track 2x the daily performance of the Nasdaq-100 Index, making it an efficient investment vehicle during long-term bullish market conditions.\n\nHowever, due to the nature of leveraged ETFs, volatility and downside risk can increase significantly during market downturns. Therefore, disciplined risk management is more important than simple buy-and-hold strategies. Maintaining approximately 30% of total assets in cash while gradually buying during sharp declines can help lower the average entry price and maximize long-term compounded returns.\n\nIn other words, the core of the QLD strategy is to utilize leverage efficiency during bull markets while maintaining sufficient cash reserves to respond flexibly during market corrections.'**
  String get marketStable;

  /// No description provided for @noPanicSignals.
  ///
  /// In en, this message translates to:
  /// **'The Nasdaq market is not simply a collection of companies. It operates through a continuous rebalancing and replacement mechanism that maintains competitiveness over time. Innovative companies with strong growth and profitability are added to the index, while weaker companies gradually lose weight or are removed.\n\nThis structure continuously reallocates capital toward productive and high-growth businesses, strengthening the market’s long-term growth potential. Supported by technological innovation in the United States, the expansion of global platform companies, and ongoing monetary liquidity growth, the Nasdaq has become one of the primary markets absorbing global capital flows.\n\nIn other words, the Nasdaq is not just a market that rises over time, but a structural growth system driven by constant innovation and corporate evolution. Because of these characteristics, it is widely viewed as a market with strong long-term upside potential that benefits from both technological advancement and monetary expansion.'**
  String get noPanicSignals;

  /// No description provided for @maintainBalanced.
  ///
  /// In en, this message translates to:
  /// **'Maintaining balanced positions and sufficient cash reserves allows for flexible responses during future market corrections.'**
  String get maintainBalanced;

  /// No description provided for @cashReserveRule.
  ///
  /// In en, this message translates to:
  /// **'Always maintain at least 30% cash reserves.'**
  String get cashReserveRule;

  /// No description provided for @cashPsychology.
  ///
  /// In en, this message translates to:
  /// **'Holding cash provides psychological stability and enables consistent buying opportunities during future market downturns.'**
  String get cashPsychology;

  /// No description provided for @allocation1.
  ///
  /// In en, this message translates to:
  /// **'• Maintain core QLD positions'**
  String get allocation1;

  /// No description provided for @allocation2.
  ///
  /// In en, this message translates to:
  /// **'• Secure at least 30% cash by taking profits when possible'**
  String get allocation2;

  /// No description provided for @allocation3.
  ///
  /// In en, this message translates to:
  /// **'• Never chase short-term price surges'**
  String get allocation3;

  /// No description provided for @allocation4.
  ///
  /// In en, this message translates to:
  /// **'• Prepare for future buying opportunities'**
  String get allocation4;

  /// No description provided for @risk1.
  ///
  /// In en, this message translates to:
  /// **'Even strong bull markets can reverse sharply at any time.'**
  String get risk1;

  /// No description provided for @risk2.
  ///
  /// In en, this message translates to:
  /// **'Lack of cash reserves can reduce flexibility during market corrections.'**
  String get risk2;

  /// No description provided for @guide1.
  ///
  /// In en, this message translates to:
  /// **'✅ Stay disciplined'**
  String get guide1;

  /// No description provided for @guide2.
  ///
  /// In en, this message translates to:
  /// **'✅ Maintain strategic cash reserves'**
  String get guide2;

  /// No description provided for @guide3.
  ///
  /// In en, this message translates to:
  /// **'✅ Focus on long-term positioning'**
  String get guide3;

  /// No description provided for @guide4.
  ///
  /// In en, this message translates to:
  /// **'❌ Avoid emotional overbuying'**
  String get guide4;

  /// No description provided for @minus20Title.
  ///
  /// In en, this message translates to:
  /// **'-20% Strategy'**
  String get minus20Title;

  /// No description provided for @minus20Headline.
  ///
  /// In en, this message translates to:
  /// **'Start Weekly 1% of Total Cash TQQQ Accumulation'**
  String get minus20Headline;

  /// No description provided for @minus20OverviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Strategy Overview'**
  String get minus20OverviewTitle;

  /// No description provided for @minus20OverviewText.
  ///
  /// In en, this message translates to:
  /// **'This zone represents approximately a 10% correction in QQQ.\n\nSince the decline is still relatively moderate, maintaining cash reserves remains important.'**
  String get minus20OverviewText;

  /// No description provided for @minus20AllocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Suggested Allocation'**
  String get minus20AllocationTitle;

  /// No description provided for @minus20AllocationText.
  ///
  /// In en, this message translates to:
  /// **'• Start accumulating with very small positions or simply hold\n• Proceed with slow and gradual buying\n• Avoid aggressive early entries\n• Preserve cash for larger potential declines'**
  String get minus20AllocationText;

  /// No description provided for @minus20HistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Historical Recovery Data'**
  String get minus20HistoryTitle;

  /// No description provided for @minus20HistoryText.
  ///
  /// In en, this message translates to:
  /// **'• Average recovery period: approximately 1–2 months\n• Nasdaq has historically rebounded frequently after -20% corrections\n• Psychological pressure is relatively lower compared to major crashes'**
  String get minus20HistoryText;

  /// No description provided for @minus20RiskTitle.
  ///
  /// In en, this message translates to:
  /// **'Risk Warning'**
  String get minus20RiskTitle;

  /// No description provided for @minus20RiskText.
  ///
  /// In en, this message translates to:
  /// **'Further downside is still possible after a -20% decline.\n\nAggressive early entries may create liquidity risk during deeper corrections.'**
  String get minus20RiskText;

  /// No description provided for @minus20GuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Action Guide'**
  String get minus20GuideTitle;

  /// No description provided for @minus20GuideText.
  ///
  /// In en, this message translates to:
  /// **'✅ Start slowly\n✅ Buying is not mandatory at this stage\n✅ Maintain sufficient cash reserves\n❌ Avoid emotional buying'**
  String get minus20GuideText;

  /// No description provided for @minus30Title.
  ///
  /// In en, this message translates to:
  /// **'-30% Strategy'**
  String get minus30Title;

  /// No description provided for @minus30Headline.
  ///
  /// In en, this message translates to:
  /// **'Buy TQQQ with 20% Cash'**
  String get minus30Headline;

  /// No description provided for @minus30OverviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Strategy Overview'**
  String get minus30OverviewTitle;

  /// No description provided for @minus30OverviewText.
  ///
  /// In en, this message translates to:
  /// **'This zone represents a high-opportunity accumulation phase.\n\nHistorically, Nasdaq corrections around -30% have often provided strong long-term buying opportunities.\n\nAlthough fear and volatility increase significantly at this stage, disciplined dollar-cost averaging can improve long-term returns.'**
  String get minus30OverviewText;

  /// No description provided for @minus30AllocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Suggested Allocation'**
  String get minus30AllocationTitle;

  /// No description provided for @minus30AllocationText.
  ///
  /// In en, this message translates to:
  /// **'• Deploy approximately 20% of available cash\n• Continue gradual accumulation\n• Avoid deploying all capital too quickly\n• Maintain flexibility for deeper declines'**
  String get minus30AllocationText;

  /// No description provided for @minus30HistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Historical Recovery Data'**
  String get minus30HistoryTitle;

  /// No description provided for @minus30HistoryText.
  ///
  /// In en, this message translates to:
  /// **'• Average recovery period ranges from approximately 6 months to over 1 year\n• Historically, strong rebounds often followed -30% corrections\n• Volatility and psychological pressure increase significantly in this zone'**
  String get minus30HistoryText;

  /// No description provided for @minus30RiskTitle.
  ///
  /// In en, this message translates to:
  /// **'Risk Warning'**
  String get minus30RiskTitle;

  /// No description provided for @minus30RiskText.
  ///
  /// In en, this message translates to:
  /// **'Markets may remain highly volatile even after a -30% decline.\n\nOvercommitting capital without cash reserves can increase both psychological and financial risks.'**
  String get minus30RiskText;

  /// No description provided for @minus30GuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Action Guide'**
  String get minus30GuideTitle;

  /// No description provided for @minus30GuideText.
  ///
  /// In en, this message translates to:
  /// **'✅ Maintain disciplined accumulation\n✅ Control emotions\n✅ Preserve remaining cash\n❌ Avoid panic buying and excessive leverage'**
  String get minus30GuideText;

  /// No description provided for @minus40Title.
  ///
  /// In en, this message translates to:
  /// **'-40% Strategy'**
  String get minus40Title;

  /// No description provided for @minus40Headline.
  ///
  /// In en, this message translates to:
  /// **'Deploy 30% Cash – TQQQ Entry Zone'**
  String get minus40Headline;

  /// No description provided for @minus40OverviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Strategy Overview'**
  String get minus40OverviewTitle;

  /// No description provided for @minus40OverviewText.
  ///
  /// In en, this message translates to:
  /// **'The -40% zone is a period of extreme market fear, but it can also become an important long-term buying opportunity. Maintaining a planned strategy is more important than emotional reactions.'**
  String get minus40OverviewText;

  /// No description provided for @minus40AllocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Capital Allocation'**
  String get minus40AllocationTitle;

  /// No description provided for @minus40AllocationText.
  ///
  /// In en, this message translates to:
  /// **'Avoid deploying all capital at once. Scale in gradually across multiple stages while preserving sufficient cash for potential further downside.'**
  String get minus40AllocationText;

  /// No description provided for @minus40HistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Crash History'**
  String get minus40HistoryTitle;

  /// No description provided for @minus40HistoryText.
  ///
  /// In en, this message translates to:
  /// **'Historically, markets have eventually recovered even after major crashes. Extreme fear zones have often created opportunities for long-term investors.'**
  String get minus40HistoryText;

  /// No description provided for @minus40RiskTitle.
  ///
  /// In en, this message translates to:
  /// **'Psychological Risk'**
  String get minus40RiskTitle;

  /// No description provided for @minus40RiskText.
  ///
  /// In en, this message translates to:
  /// **'As declines deepen, fear and anxiety intensify. It is important to stay disciplined and avoid reacting emotionally to short-term volatility and news.'**
  String get minus40RiskText;

  /// No description provided for @minus40GuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Survival Guide'**
  String get minus40GuideTitle;

  /// No description provided for @minus40GuideText.
  ///
  /// In en, this message translates to:
  /// **'Focus on long-term survival rather than predicting short-term rebounds. Avoid excessive leverage and emotional all-in positions while maintaining a consistent accumulation strategy.'**
  String get minus40GuideText;

  /// No description provided for @minus50Title.
  ///
  /// In en, this message translates to:
  /// **'-50% Strategy'**
  String get minus50Title;

  /// No description provided for @minus50Headline.
  ///
  /// In en, this message translates to:
  /// **'Buy TQQQ with All Remaining Cash'**
  String get minus50Headline;

  /// No description provided for @minus50OverviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Deploy Remaining Cash into TQQQ'**
  String get minus50OverviewTitle;

  /// No description provided for @minus50OverviewText.
  ///
  /// In en, this message translates to:
  /// **'A -50% decline represents an extreme market fear environment. Most investors experience panic during this phase, and volatility can remain exceptionally high.'**
  String get minus50OverviewText;

  /// No description provided for @minus50AllocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Capital Allocation'**
  String get minus50AllocationTitle;

  /// No description provided for @minus50AllocationText.
  ///
  /// In en, this message translates to:
  /// **'Deploy remaining cash into TQQQ. Continue lowering the average entry price through systematic recurring purchases afterward.'**
  String get minus50AllocationText;

  /// No description provided for @minus50HistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'After Major Crashes'**
  String get minus50HistoryTitle;

  /// No description provided for @minus50HistoryText.
  ///
  /// In en, this message translates to:
  /// **'Historically, markets have recovered over time following major crashes. The Nasdaq has structurally maintained long-term growth. Extreme fear should be viewed as opportunity rather than panic.'**
  String get minus50HistoryText;

  /// No description provided for @minus50RiskTitle.
  ///
  /// In en, this message translates to:
  /// **'Psychological Pressure'**
  String get minus50RiskTitle;

  /// No description provided for @minus50RiskText.
  ///
  /// In en, this message translates to:
  /// **'Rather than feeling psychological pressure, investors should recognize this phase as a potential deep-value buying opportunity.'**
  String get minus50RiskText;

  /// No description provided for @minus50GuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Survival Strategy'**
  String get minus50GuideTitle;

  /// No description provided for @minus50GuideText.
  ///
  /// In en, this message translates to:
  /// **'Accumulate TQQQ aggressively while continuously lowering the average cost basis through systematic recurring purchases.'**
  String get minus50GuideText;

  /// No description provided for @exchangeUsdKrw.
  ///
  /// In en, this message translates to:
  /// **'Dollar/Won'**
  String get exchangeUsdKrw;

  /// No description provided for @exchangeUsdJpy.
  ///
  /// In en, this message translates to:
  /// **'Dollar/Yen'**
  String get exchangeUsdJpy;

  /// No description provided for @exchangeEurUsd.
  ///
  /// In en, this message translates to:
  /// **'Euro/Dollar'**
  String get exchangeEurUsd;

  /// No description provided for @exchangeUsdRub.
  ///
  /// In en, this message translates to:
  /// **'Dollar/Ruble'**
  String get exchangeUsdRub;

  /// No description provided for @exchangeUsdTwd.
  ///
  /// In en, this message translates to:
  /// **'Dollar/Taiwan Dollar'**
  String get exchangeUsdTwd;

  /// No description provided for @exchangeUsdCny.
  ///
  /// In en, this message translates to:
  /// **'Dollar/Yuan'**
  String get exchangeUsdCny;

  /// No description provided for @fearGreedExtremeFear.
  ///
  /// In en, this message translates to:
  /// **'Extreme Fear'**
  String get fearGreedExtremeFear;

  /// No description provided for @fearGreedFear.
  ///
  /// In en, this message translates to:
  /// **'Fear'**
  String get fearGreedFear;

  /// No description provided for @fearGreedNeutral.
  ///
  /// In en, this message translates to:
  /// **'Neutral'**
  String get fearGreedNeutral;

  /// No description provided for @fearGreedGreed.
  ///
  /// In en, this message translates to:
  /// **'Greed'**
  String get fearGreedGreed;

  /// No description provided for @fearGreedExtremeGreed.
  ///
  /// In en, this message translates to:
  /// **'Extreme Greed'**
  String get fearGreedExtremeGreed;

  /// No description provided for @fearGreedIndicatorsTitle.
  ///
  /// In en, this message translates to:
  /// **'7 Fear & Greed Indicators'**
  String get fearGreedIndicatorsTitle;

  /// No description provided for @fearGreedFaqTitle.
  ///
  /// In en, this message translates to:
  /// **'Fear & Greed Index FAQs'**
  String get fearGreedFaqTitle;

  /// No description provided for @fearGreedWhatTitle.
  ///
  /// In en, this message translates to:
  /// **'What is the CNN Business Fear & Greed Index?'**
  String get fearGreedWhatTitle;

  /// No description provided for @fearGreedWhatBody.
  ///
  /// In en, this message translates to:
  /// **'The Fear & Greed Index gauges stock market sentiment and whether stocks may be fairly priced. Excessive fear can push share prices lower, while excessive greed can push them higher.'**
  String get fearGreedWhatBody;

  /// No description provided for @fearGreedCalculatedTitle.
  ///
  /// In en, this message translates to:
  /// **'How is Fear & Greed calculated?'**
  String get fearGreedCalculatedTitle;

  /// No description provided for @fearGreedCalculatedBody.
  ///
  /// In en, this message translates to:
  /// **'The index combines seven market indicators: momentum, price strength, price breadth, put and call options, junk bond demand, market volatility, and safe haven demand. Each indicator is weighted equally to create a 0 to 100 score.'**
  String get fearGreedCalculatedBody;

  /// No description provided for @fearGreedFrequencyTitle.
  ///
  /// In en, this message translates to:
  /// **'How often is it calculated?'**
  String get fearGreedFrequencyTitle;

  /// No description provided for @fearGreedFrequencyBody.
  ///
  /// In en, this message translates to:
  /// **'Each component and the overall index update when new market data becomes available.'**
  String get fearGreedFrequencyBody;

  /// No description provided for @fearGreedUseTitle.
  ///
  /// In en, this message translates to:
  /// **'How should I use it?'**
  String get fearGreedUseTitle;

  /// No description provided for @fearGreedUseBody.
  ///
  /// In en, this message translates to:
  /// **'Use it as a market mood indicator. It can help you notice emotional extremes, but decisions should still be checked with price, fundamentals, risk control, and your own strategy.'**
  String get fearGreedUseBody;

  /// No description provided for @strategyAdLabel.
  ///
  /// In en, this message translates to:
  /// **'Ad'**
  String get strategyAdLabel;

  /// No description provided for @alertSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Alert Settings'**
  String get alertSettingsTitle;

  /// No description provided for @alertSettingsCloseBasisNote.
  ///
  /// In en, this message translates to:
  /// **'Alerts are sent based on closing prices.'**
  String get alertSettingsCloseBasisNote;

  /// No description provided for @alertHighTitle.
  ///
  /// In en, this message translates to:
  /// **'New High Alert'**
  String get alertHighTitle;

  /// No description provided for @alertHighSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Notify when a new high is reached after installation'**
  String get alertHighSubtitle;

  /// No description provided for @alertMarketOpenTitle.
  ///
  /// In en, this message translates to:
  /// **'Market Open Alert'**
  String get alertMarketOpenTitle;

  /// No description provided for @alertMarketOpenSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Notify once when the U.S. regular market opens'**
  String get alertMarketOpenSubtitle;

  /// No description provided for @alertStrategySettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Strategy Alert'**
  String get alertStrategySettingTitle;

  /// No description provided for @alertStrategySettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Notify when the -20%, -30%, -40%, -50% zones change'**
  String get alertStrategySettingSubtitle;

  /// No description provided for @noBuyHeadline.
  ///
  /// In en, this message translates to:
  /// **'No extra buying. Keep 30% cash.'**
  String get noBuyHeadline;

  /// No description provided for @noBuyActionTitle.
  ///
  /// In en, this message translates to:
  /// **'Immediate Action'**
  String get noBuyActionTitle;

  /// No description provided for @noBuyActionText.
  ///
  /// In en, this message translates to:
  /// **'Do not buy new QLD or TQQQ. Keep the existing QLD position and protect 30% cash.'**
  String get noBuyActionText;

  /// No description provided for @noBuyCashTitle.
  ///
  /// In en, this message translates to:
  /// **'Cash Rule'**
  String get noBuyCashTitle;

  /// No description provided for @noBuyCashText.
  ///
  /// In en, this message translates to:
  /// **'Cash is reserve capital for the next decline zone. Do not reduce it even if the market rises.'**
  String get noBuyCashText;

  /// No description provided for @noBuyAvoidTitle.
  ///
  /// In en, this message translates to:
  /// **'Avoid'**
  String get noBuyAvoidTitle;

  /// No description provided for @noBuyAvoidText.
  ///
  /// In en, this message translates to:
  /// **'Do not chase prices just because they are rising. Wait until the -20% zone appears.'**
  String get noBuyAvoidText;

  /// No description provided for @noBuyNextTitle.
  ///
  /// In en, this message translates to:
  /// **'Next Step'**
  String get noBuyNextTitle;

  /// No description provided for @noBuyNextText.
  ///
  /// In en, this message translates to:
  /// **'When the -20% zone is reached, prepare to start fractional recurring TQQQ buys.'**
  String get noBuyNextText;

  /// No description provided for @minus20ActionTitle.
  ///
  /// In en, this message translates to:
  /// **'Immediate Action'**
  String get minus20ActionTitle;

  /// No description provided for @minus20ActionText.
  ///
  /// In en, this message translates to:
  /// **'Start buying TQQQ weekly at 1% of your cash holdings.\nEx) \$500 cash → buy \$5 per week'**
  String get minus20ActionText;

  /// No description provided for @minus20BuyRuleTitle.
  ///
  /// In en, this message translates to:
  /// **'Purpose'**
  String get minus20BuyRuleTitle;

  /// No description provided for @minus20BuyRuleText.
  ///
  /// In en, this message translates to:
  /// **'This setup starts in the -20% zone so that, if the market moves sideways, small recurring buys can gradually lower the TQQQ average cost. The point is not to time an immediate profit, but to build a lower cost basis.'**
  String get minus20BuyRuleText;

  /// No description provided for @minus20CashTitle.
  ///
  /// In en, this message translates to:
  /// **'Cash Management'**
  String get minus20CashTitle;

  /// No description provided for @minus20CashText.
  ///
  /// In en, this message translates to:
  /// **'Most cash must remain available for the -30%, -40%, and -50% zones. Even after planned cash is fully used at -50%, new cash can keep lowering the average through weekly accumulation.\n\nEven if the market moves sideways for 10 or more weeks, continue accumulating 1% of total cash every week. The longer the sideways movement, the more shares you build up — there is no reason to stop.\n\nWhen the -30% zone is reached, make a single additional purchase using 20% of the remaining cash at that point. The weekly accumulation does not stop — it continues alongside the -30% strategy. Accumulation ends only when the previous high is recovered and rebalancing takes place.'**
  String get minus20CashText;

  /// No description provided for @minus20AvoidTitle.
  ///
  /// In en, this message translates to:
  /// **'Exit Plan'**
  String get minus20AvoidTitle;

  /// No description provided for @minus20AvoidText.
  ///
  /// In en, this message translates to:
  /// **'Do not sell these TQQQ shares on every short rebound. Treat them as part of the position to close later when a new high is reached and the TQQQ position is being trimmed.'**
  String get minus20AvoidText;

  /// No description provided for @minus30ActionTitle.
  ///
  /// In en, this message translates to:
  /// **'Immediate Action'**
  String get minus30ActionTitle;

  /// No description provided for @minus30ActionText.
  ///
  /// In en, this message translates to:
  /// **'Use only 20% of available cash to buy TQQQ. Check total cash before placing the order.'**
  String get minus30ActionText;

  /// No description provided for @minus30BuyRuleTitle.
  ///
  /// In en, this message translates to:
  /// **'Buy Rule'**
  String get minus30BuyRuleTitle;

  /// No description provided for @minus30BuyRuleText.
  ///
  /// In en, this message translates to:
  /// **'If cash is \$10,000, use only \$2,000 for TQQQ and preserve the remaining 80%.'**
  String get minus30BuyRuleText;

  /// No description provided for @minus30AdditionalTitle.
  ///
  /// In en, this message translates to:
  /// **'Additional Action'**
  String get minus30AdditionalTitle;

  /// No description provided for @minus30AdditionalText.
  ///
  /// In en, this message translates to:
  /// **'QLD accumulation can continue, but wait until the next zone for additional TQQQ buying.'**
  String get minus30AdditionalText;

  /// No description provided for @minus30AvoidTitle.
  ///
  /// In en, this message translates to:
  /// **'Avoid'**
  String get minus30AvoidTitle;

  /// No description provided for @minus30AvoidText.
  ///
  /// In en, this message translates to:
  /// **'Do not spend too much cash because you expect a rebound. Act as if the -40% zone can still arrive.'**
  String get minus30AvoidText;

  /// No description provided for @minus40ActionTitle.
  ///
  /// In en, this message translates to:
  /// **'Immediate Action'**
  String get minus40ActionTitle;

  /// No description provided for @minus40ActionText.
  ///
  /// In en, this message translates to:
  /// **'Use 30% of remaining cash to buy TQQQ. Exclude the amount already used at -30%.'**
  String get minus40ActionText;

  /// No description provided for @minus40BuyRuleTitle.
  ///
  /// In en, this message translates to:
  /// **'Buy Rule'**
  String get minus40BuyRuleTitle;

  /// No description provided for @minus40BuyRuleText.
  ///
  /// In en, this message translates to:
  /// **'If remaining cash is \$8,000, use only \$2,400. The key is not using everything at once.'**
  String get minus40BuyRuleText;

  /// No description provided for @minus40HoldTitle.
  ///
  /// In en, this message translates to:
  /// **'Holding Rule'**
  String get minus40HoldTitle;

  /// No description provided for @minus40HoldText.
  ///
  /// In en, this message translates to:
  /// **'Keep QLD and increase TQQQ only up to the planned amount. Leave cash for further downside.'**
  String get minus40HoldText;

  /// No description provided for @minus40AvoidTitle.
  ///
  /// In en, this message translates to:
  /// **'Avoid'**
  String get minus40AvoidTitle;

  /// No description provided for @minus40AvoidText.
  ///
  /// In en, this message translates to:
  /// **'Do not sell existing holdings out of fear. Do not buy with all cash out of greed either.'**
  String get minus40AvoidText;

  /// No description provided for @minus50ActionTitle.
  ///
  /// In en, this message translates to:
  /// **'Immediate Action'**
  String get minus50ActionTitle;

  /// No description provided for @minus50ActionText.
  ///
  /// In en, this message translates to:
  /// **'Use all remaining cash to buy TQQQ. This is the final planned cash deployment stage.'**
  String get minus50ActionText;

  /// No description provided for @minus50BuyRuleTitle.
  ///
  /// In en, this message translates to:
  /// **'Buy Rule'**
  String get minus50BuyRuleTitle;

  /// No description provided for @minus50BuyRuleText.
  ///
  /// In en, this message translates to:
  /// **'Base the order only on actual remaining cash after excluding money already used at -30% and -40%.'**
  String get minus50BuyRuleText;

  /// No description provided for @minus50AfterTitle.
  ///
  /// In en, this message translates to:
  /// **'Afterward'**
  String get minus50AfterTitle;

  /// No description provided for @minus50AfterText.
  ///
  /// In en, this message translates to:
  /// **'When new cash is added later, accumulate TQQQ or QLD regularly and focus on lowering average cost.'**
  String get minus50AfterText;

  /// No description provided for @minus50AvoidTitle.
  ///
  /// In en, this message translates to:
  /// **'Avoid'**
  String get minus50AvoidTitle;

  /// No description provided for @minus50AvoidText.
  ///
  /// In en, this message translates to:
  /// **'Do not give up just because the loss is large. Do not use debt or short-term living money for extra buys.'**
  String get minus50AvoidText;

  /// No description provided for @alertNasdaq200Title.
  ///
  /// In en, this message translates to:
  /// **'Nasdaq 100 200-Day Alert'**
  String get alertNasdaq200Title;

  /// No description provided for @alertNasdaq200Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Notify when Nasdaq 100 breaks below or above the 200-day line'**
  String get alertNasdaq200Subtitle;

  /// No description provided for @alertNasdaq200Breakdown.
  ///
  /// In en, this message translates to:
  /// **'Nasdaq 100 has broken below the 200-day moving average'**
  String get alertNasdaq200Breakdown;

  /// No description provided for @alertNasdaq200Breakout.
  ///
  /// In en, this message translates to:
  /// **'Nasdaq 100 has broken back above the 200-day moving average'**
  String get alertNasdaq200Breakout;

  /// No description provided for @chartGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'How to read this chart'**
  String get chartGuideTitle;

  /// No description provided for @chartMiniTitle.
  ///
  /// In en, this message translates to:
  /// **'3-month chart with 20-day and 200-day averages'**
  String get chartMiniTitle;

  /// No description provided for @chartGuideCandleTitle.
  ///
  /// In en, this message translates to:
  /// **'3-month candles'**
  String get chartGuideCandleTitle;

  /// No description provided for @chartGuideCandleBody.
  ///
  /// In en, this message translates to:
  /// **'Shows recent QLD price movement at a glance. Green means the period closed higher; red means it closed lower.'**
  String get chartGuideCandleBody;

  /// No description provided for @chartGuideMa200Title.
  ///
  /// In en, this message translates to:
  /// **'200-day line'**
  String get chartGuideMa200Title;

  /// No description provided for @chartGuideMa200Body.
  ///
  /// In en, this message translates to:
  /// **'A long-term trend line. Price above it suggests strength; below it suggests checking risk and cash.'**
  String get chartGuideMa200Body;

  /// No description provided for @chartMa200SheetTitle.
  ///
  /// In en, this message translates to:
  /// **'What is the 200-day moving average?'**
  String get chartMa200SheetTitle;

  /// No description provided for @chartMa200SheetBody.
  ///
  /// In en, this message translates to:
  /// **'The 200-day moving average is a long-term trend line calculated from the average closing price over roughly the last 200 trading days.\n\nMany investors watch it because it filters out short-term noise and makes the broader market direction easier to see. Price above the 200-day line is often read as a healthier long-term trend, while price below it can suggest weaker momentum or a need to review risk.\n\nIt should not be used as a standalone buy or sell signal. For a leveraged ETF like QLD, use it as a reference together with cash allocation, drawdown level, average cost, and your investing horizon.'**
  String get chartMa200SheetBody;

  /// No description provided for @chartMa20SheetTitle.
  ///
  /// In en, this message translates to:
  /// **'What is the 20-day moving average?'**
  String get chartMa20SheetTitle;

  /// No description provided for @chartMa20SheetBody.
  ///
  /// In en, this message translates to:
  /// **'The 20-day moving average is a short-term trend line calculated from the average closing price over roughly the last 20 trading days.\n\nMany investors watch it because it reacts faster than the 200-day line and helps show recent momentum. Price staying above the 20-day line can suggest short-term strength, while repeated breaks below it can mean the recent trend is weakening.\n\nFor QLD, the 20-day line is useful for reading short-term speed and volatility, but it can produce many false signals. It works best when compared with the 200-day line, cash level, and your planned buying zones.'**
  String get chartMa20SheetBody;

  /// No description provided for @alertPortfolioCashTitle.
  ///
  /// In en, this message translates to:
  /// **'Cash Rebalancing Alert'**
  String get alertPortfolioCashTitle;

  /// No description provided for @alertPortfolioCashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Notify when cash falls below 20% after stocks rise'**
  String get alertPortfolioCashSubtitle;

  /// No description provided for @alertPortfolioCashHigh.
  ///
  /// In en, this message translates to:
  /// **'Cash ratio is below 20%. Consider rebalancing to rebuild cash.'**
  String get alertPortfolioCashHigh;

  /// No description provided for @alertPortfolioCashLow.
  ///
  /// In en, this message translates to:
  /// **'Cash ratio is below 20%. Consider rebalancing to rebuild cash.'**
  String get alertPortfolioCashLow;

  /// No description provided for @alertAnnouncementTitle.
  ///
  /// In en, this message translates to:
  /// **'Announcement Notifications'**
  String get alertAnnouncementTitle;

  /// No description provided for @alertAnnouncementSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Receive announcements from QLD DIP ALERT as push notifications'**
  String get alertAnnouncementSubtitle;

  /// No description provided for @alertDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Alert Details'**
  String get alertDetailTitle;

  /// No description provided for @alertDetailOpenStrategy.
  ///
  /// In en, this message translates to:
  /// **'Open Strategy'**
  String get alertDetailOpenStrategy;

  /// No description provided for @alertDetailRecovery.
  ///
  /// In en, this message translates to:
  /// **'The decline zone has improved. Review your portfolio calmly and avoid rushed selling or buying.'**
  String get alertDetailRecovery;

  /// No description provided for @alertDetailNewHigh.
  ///
  /// In en, this message translates to:
  /// **'A new high has been recorded after installation. This becomes the new reference point for future decline calculations.'**
  String get alertDetailNewHigh;

  /// No description provided for @alertDetailMarketOpen.
  ///
  /// In en, this message translates to:
  /// **'The U.S. regular market has opened. Check prices and strategy alerts only if you planned to act today.'**
  String get alertDetailMarketOpen;

  /// No description provided for @alertDetailNasdaq200Breakdown.
  ///
  /// In en, this message translates to:
  /// **'Nasdaq 100 moved below its 200-day moving average. This can signal weaker long-term trend conditions, so review risk and cash levels.'**
  String get alertDetailNasdaq200Breakdown;

  /// No description provided for @alertDetailNasdaq200Breakout.
  ///
  /// In en, this message translates to:
  /// **'Nasdaq 100 moved back above its 200-day moving average. This can signal improving trend conditions, but continue following your strategy.'**
  String get alertDetailNasdaq200Breakout;

  /// No description provided for @alertDetailPortfolioCashHigh.
  ///
  /// In en, this message translates to:
  /// **'Cash is below the 20% guide. This often means stocks have risen and your cash buffer has become too small. Consider trimming part of the position and rebalancing toward your planned cash level.'**
  String get alertDetailPortfolioCashHigh;

  /// No description provided for @alertDetailPortfolioCashLow.
  ///
  /// In en, this message translates to:
  /// **'Cash is below the 20% guide. This often means stocks have risen and your cash buffer has become too small. Consider trimming part of the position and rebalancing toward your planned cash level.'**
  String get alertDetailPortfolioCashLow;

  /// No description provided for @alertDetailOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Open Link'**
  String get alertDetailOpenLink;

  /// No description provided for @appUpdateTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get appUpdateTitle;

  /// No description provided for @appUpdateMessage.
  ///
  /// In en, this message translates to:
  /// **'A newer version is available. Update now to use the latest features and fixes.'**
  String get appUpdateMessage;

  /// No description provided for @appUpdateLater.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get appUpdateLater;

  /// No description provided for @appUpdateNow.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get appUpdateNow;

  /// No description provided for @alertTestTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Test'**
  String get alertTestTitle;

  /// No description provided for @alertPermissionHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Not receiving notifications?'**
  String get alertPermissionHelpTitle;

  /// No description provided for @alertPermissionHelpBody.
  ///
  /// In en, this message translates to:
  /// **'If device notification permission is turned off, test notifications may not appear.'**
  String get alertPermissionHelpBody;

  /// No description provided for @alertPermissionRequest.
  ///
  /// In en, this message translates to:
  /// **'Request Permission'**
  String get alertPermissionRequest;

  /// No description provided for @alertPermissionOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get alertPermissionOpenSettings;

  /// No description provided for @holdPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Hold Position'**
  String get holdPageTitle;

  /// No description provided for @holdHeadline.
  ///
  /// In en, this message translates to:
  /// **'The planned buy has been completed. Focus on holding during the recovery.'**
  String get holdHeadline;

  /// No description provided for @holdPositionTitle.
  ///
  /// In en, this message translates to:
  /// **'Current position'**
  String get holdPositionTitle;

  /// No description provided for @holdPositionText.
  ///
  /// In en, this message translates to:
  /// **'Keep the QLD and TQQQ positions already purchased. Do not repeat the previous zone purchase just because the price revisits a recovered zone.'**
  String get holdPositionText;

  /// No description provided for @holdActionTitle.
  ///
  /// In en, this message translates to:
  /// **'Action now'**
  String get holdActionTitle;

  /// No description provided for @holdActionText.
  ///
  /// In en, this message translates to:
  /// **'Pause additional TQQQ buying and monitor the recovery. Preserve any remaining cash for a renewed decline.'**
  String get holdActionText;

  /// No description provided for @holdAvoidTitle.
  ///
  /// In en, this message translates to:
  /// **'Avoid'**
  String get holdAvoidTitle;

  /// No description provided for @holdAvoidText.
  ///
  /// In en, this message translates to:
  /// **'Do not rush to sell during volatility or make an impulsive additional purchase because recovery feels certain.'**
  String get holdAvoidText;

  /// No description provided for @holdResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Strategy reset'**
  String get holdResetTitle;

  /// No description provided for @holdResetText.
  ///
  /// In en, this message translates to:
  /// **'When QLD fully recovers to the previous high, this decline cycle is complete and the strategy returns to the initial no-buy position.'**
  String get holdResetText;

  /// No description provided for @rebalanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Rebalancing Zone'**
  String get rebalanceTitle;

  /// No description provided for @rebalanceHeadline.
  ///
  /// In en, this message translates to:
  /// **'Sell TQQQ and return to base position'**
  String get rebalanceHeadline;

  /// No description provided for @rebalanceOverviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Strategy Overview'**
  String get rebalanceOverviewTitle;

  /// No description provided for @rebalanceOverviewText.
  ///
  /// In en, this message translates to:
  /// **'All-time high recovery signals the end of the crisis response phase. It is time to sell the TQQQ accumulated in the -20% or lower zones and return to the base position (QLD 70%, Cash 30%).'**
  String get rebalanceOverviewText;

  /// No description provided for @rebalanceActionTitle.
  ///
  /// In en, this message translates to:
  /// **'Immediate Action'**
  String get rebalanceActionTitle;

  /// No description provided for @rebalanceActionText.
  ///
  /// In en, this message translates to:
  /// **'Sell all TQQQ accumulated or purchased in the -20% or lower zones. Then rebalance your assets according to the base position allocation.'**
  String get rebalanceActionText;

  /// No description provided for @rebalanceCashTitle.
  ///
  /// In en, this message translates to:
  /// **'Cash Target'**
  String get rebalanceCashTitle;

  /// No description provided for @rebalanceCashText.
  ///
  /// In en, this message translates to:
  /// **'After rebalancing, maintain QLD 70% and Cash 30%. Keep the secured cash as a reserve for the next downturn.'**
  String get rebalanceCashText;

  /// No description provided for @rebalanceAvoidTitle.
  ///
  /// In en, this message translates to:
  /// **'What to Avoid'**
  String get rebalanceAvoidTitle;

  /// No description provided for @rebalanceAvoidText.
  ///
  /// In en, this message translates to:
  /// **'Do not continue TQQQ accumulation after the all-time high recovery. Sell the positions accumulated during the crisis phase at this stage and return to the base position.'**
  String get rebalanceAvoidText;

  /// No description provided for @investmentCalculatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Expected Return Calculator'**
  String get investmentCalculatorTitle;

  /// No description provided for @investmentCalculatorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Simple compound calculation based on QLD\'s past average'**
  String get investmentCalculatorSubtitle;

  /// No description provided for @investmentCalculatorReturnRate.
  ///
  /// In en, this message translates to:
  /// **'10-Year Average Return'**
  String get investmentCalculatorReturnRate;

  /// No description provided for @investmentCalculatorLumpSumTitle.
  ///
  /// In en, this message translates to:
  /// **'Lump sum + dip buying'**
  String get investmentCalculatorLumpSumTitle;

  /// No description provided for @investmentCalculatorAmount.
  ///
  /// In en, this message translates to:
  /// **'Investment amount'**
  String get investmentCalculatorAmount;

  /// No description provided for @investmentCalculatorYears.
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get investmentCalculatorYears;

  /// No description provided for @investmentCalculatorExpectedValue.
  ///
  /// In en, this message translates to:
  /// **'Estimated value'**
  String get investmentCalculatorExpectedValue;

  /// No description provided for @investmentCalculatorPrincipalMultiple.
  ///
  /// In en, this message translates to:
  /// **'Multiple of principal'**
  String get investmentCalculatorPrincipalMultiple;

  /// No description provided for @investmentCalculatorMonthlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Recurring investing'**
  String get investmentCalculatorMonthlyTitle;

  /// No description provided for @investmentCalculatorMonthlyAmount.
  ///
  /// In en, this message translates to:
  /// **'Monthly amount'**
  String get investmentCalculatorMonthlyAmount;

  /// No description provided for @investmentCalculatorTotalPrincipal.
  ///
  /// In en, this message translates to:
  /// **'Total contributed'**
  String get investmentCalculatorTotalPrincipal;

  /// No description provided for @investmentCalculatorExpectedProfit.
  ///
  /// In en, this message translates to:
  /// **'Estimated profit'**
  String get investmentCalculatorExpectedProfit;

  /// No description provided for @investmentCalculatorDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This is a simple calculation based on past returns and does not guarantee future returns.'**
  String get investmentCalculatorDisclaimer;

  /// No description provided for @investmentCalculatorYearsSuffix.
  ///
  /// In en, this message translates to:
  /// **'yr'**
  String get investmentCalculatorYearsSuffix;

  /// No description provided for @investmentCalculatorTimesSuffix.
  ///
  /// In en, this message translates to:
  /// **'x'**
  String get investmentCalculatorTimesSuffix;

  /// No description provided for @investmentCalculatorChartHint.
  ///
  /// In en, this message translates to:
  /// **'You can review the average return against the historical chart.'**
  String get investmentCalculatorChartHint;

  /// No description provided for @investmentCalculatorCurrencySectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Currency conversion'**
  String get investmentCalculatorCurrencySectionTitle;

  /// No description provided for @investmentCalculatorCurrency.
  ///
  /// In en, this message translates to:
  /// **'Country/Currency'**
  String get investmentCalculatorCurrency;

  /// No description provided for @investmentCalculatorExchangeRate.
  ///
  /// In en, this message translates to:
  /// **'1 USD rate'**
  String get investmentCalculatorExchangeRate;

  /// No description provided for @investmentCalculatorExchangeRateHint.
  ///
  /// In en, this message translates to:
  /// **'Enter how much 1 USD is worth in the selected currency.'**
  String get investmentCalculatorExchangeRateHint;

  /// No description provided for @investmentCalculatorConvertedLumpSum.
  ///
  /// In en, this message translates to:
  /// **'Converted lump-sum value'**
  String get investmentCalculatorConvertedLumpSum;

  /// No description provided for @investmentCalculatorConvertedMonthly.
  ///
  /// In en, this message translates to:
  /// **'Converted recurring value'**
  String get investmentCalculatorConvertedMonthly;

  /// No description provided for @investmentCurrencyUnitedStatesUsd.
  ///
  /// In en, this message translates to:
  /// **'United States USD'**
  String get investmentCurrencyUnitedStatesUsd;

  /// No description provided for @investmentCurrencyKoreaKrw.
  ///
  /// In en, this message translates to:
  /// **'Korea KRW'**
  String get investmentCurrencyKoreaKrw;

  /// No description provided for @investmentCurrencyJapanJpy.
  ///
  /// In en, this message translates to:
  /// **'Japan JPY'**
  String get investmentCurrencyJapanJpy;

  /// No description provided for @investmentCurrencyChinaCny.
  ///
  /// In en, this message translates to:
  /// **'China CNY'**
  String get investmentCurrencyChinaCny;

  /// No description provided for @investmentCurrencyTaiwanTwd.
  ///
  /// In en, this message translates to:
  /// **'Taiwan TWD'**
  String get investmentCurrencyTaiwanTwd;

  /// No description provided for @investmentCurrencyGermanyEur.
  ///
  /// In en, this message translates to:
  /// **'Germany EUR'**
  String get investmentCurrencyGermanyEur;

  /// No description provided for @investmentCurrencyFranceEur.
  ///
  /// In en, this message translates to:
  /// **'France EUR'**
  String get investmentCurrencyFranceEur;

  /// No description provided for @investmentCurrencySpainEur.
  ///
  /// In en, this message translates to:
  /// **'Spain EUR'**
  String get investmentCurrencySpainEur;

  /// No description provided for @investmentCurrencyPortugalEur.
  ///
  /// In en, this message translates to:
  /// **'Portugal EUR'**
  String get investmentCurrencyPortugalEur;

  /// No description provided for @investmentCurrencyRussiaRub.
  ///
  /// In en, this message translates to:
  /// **'Russia RUB'**
  String get investmentCurrencyRussiaRub;

  /// No description provided for @contentTitle.
  ///
  /// In en, this message translates to:
  /// **'Contents'**
  String get contentTitle;

  /// No description provided for @contentInquiry.
  ///
  /// In en, this message translates to:
  /// **'Inquiries'**
  String get contentInquiry;

  /// No description provided for @contentInquirySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Leave an anonymous inquiry and check the reply.'**
  String get contentInquirySubtitle;

  /// No description provided for @contentInquiryBadge.
  ///
  /// In en, this message translates to:
  /// **'Q&A'**
  String get contentInquiryBadge;

  /// No description provided for @contentCloseGuess.
  ///
  /// In en, this message translates to:
  /// **'Close Guess'**
  String get contentCloseGuess;

  /// No description provided for @contentStockQuote.
  ///
  /// In en, this message translates to:
  /// **'Stock Quotes'**
  String get contentStockQuote;

  /// No description provided for @contentStockQuoteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A short quote to sharpen your investment instincts.'**
  String get contentStockQuoteSubtitle;

  /// No description provided for @contentStockQuoteBadge.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get contentStockQuoteBadge;

  /// No description provided for @contentNumberGuess.
  ///
  /// In en, this message translates to:
  /// **'Number Guess'**
  String get contentNumberGuess;

  /// No description provided for @contentNumberGuessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A light probability mini-game to enjoy casually.'**
  String get contentNumberGuessSubtitle;

  /// No description provided for @contentNumberGuessBadge.
  ///
  /// In en, this message translates to:
  /// **'Game'**
  String get contentNumberGuessBadge;

  /// No description provided for @contentBookReader.
  ///
  /// In en, this message translates to:
  /// **'Column'**
  String get contentBookReader;

  /// No description provided for @contentBookReaderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Public-domain texts you can read at a relaxed pace.'**
  String get contentBookReaderSubtitle;

  /// No description provided for @contentBookReaderBadge.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get contentBookReaderBadge;

  /// No description provided for @contentStockMeme.
  ///
  /// In en, this message translates to:
  /// **'Stock Meme'**
  String get contentStockMeme;

  /// No description provided for @contentLottoNumbers.
  ///
  /// In en, this message translates to:
  /// **'Lotto Numbers'**
  String get contentLottoNumbers;

  /// No description provided for @contentJumpDodge.
  ///
  /// In en, this message translates to:
  /// **'Jump Dodge Game'**
  String get contentJumpDodge;

  /// No description provided for @contentJumpDodgeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A jump mini-game for short focused sessions.'**
  String get contentJumpDodgeSubtitle;

  /// No description provided for @contentJumpDodgeBadge.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get contentJumpDodgeBadge;

  /// No description provided for @stockQuoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Stock Quotes'**
  String get stockQuoteTitle;

  /// No description provided for @stockQuoteTapHint.
  ///
  /// In en, this message translates to:
  /// **'Tap to see another quote.'**
  String get stockQuoteTapHint;

  /// No description provided for @stockQuoteShuffle.
  ///
  /// In en, this message translates to:
  /// **'Another quote'**
  String get stockQuoteShuffle;

  /// No description provided for @usageGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'How to use'**
  String get usageGuideTitle;

  /// No description provided for @usageGuideSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A rule-based guide for long-term Nasdaq 2x leverage'**
  String get usageGuideSubtitle;

  /// No description provided for @usageGuideCardTitle.
  ///
  /// In en, this message translates to:
  /// **'How to use'**
  String get usageGuideCardTitle;

  /// No description provided for @usageGuideCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Base position, decline zones, trade records, indicators'**
  String get usageGuideCardSubtitle;

  /// No description provided for @usageGuideWhatAppTitle.
  ///
  /// In en, this message translates to:
  /// **'What is this app?'**
  String get usageGuideWhatAppTitle;

  /// No description provided for @usageGuideWhatAppBody.
  ///
  /// In en, this message translates to:
  /// **'This app is a rule-based guide for investors using long-term upward Nasdaq 2x leverage.\n\nIt automatically calculates the current drawdown from the all-time high so you can see where the market stands, then provides a strategy for each zone.\n\nIt helps you stay with planned investment rules without being shaken by market fear or greed.'**
  String get usageGuideWhatAppBody;

  /// No description provided for @usageGuideNoBuyTitle.
  ///
  /// In en, this message translates to:
  /// **'1. Read the base position and strategy first'**
  String get usageGuideNoBuyTitle;

  /// No description provided for @usageGuideNoBuyBody.
  ///
  /// In en, this message translates to:
  /// **'First, tap the Base Position card on the main screen and read how to prepare. Also tap the Strategy tab at the bottom right to understand the detailed strategy.\n\n* Buy QLD with 70% of your total holding funds.'**
  String get usageGuideNoBuyBody;

  /// No description provided for @usageGuideStrategyTitle.
  ///
  /// In en, this message translates to:
  /// **'2. Check the automatic decline-zone strategy'**
  String get usageGuideStrategyTitle;

  /// No description provided for @usageGuideStrategyBody.
  ///
  /// In en, this message translates to:
  /// **'The Strategy Card on the main screen automatically shows the matching zone whenever QLD drops a certain percentage below its all-time high. Tap the card to make the corresponding purchase or rebalance. Alerts also arrive when conditions are met.'**
  String get usageGuideStrategyBody;

  /// No description provided for @usageGuideIndicatorsTitle.
  ///
  /// In en, this message translates to:
  /// **'Four support indicators'**
  String get usageGuideIndicatorsTitle;

  /// No description provided for @usageGuideIndicatorsBody.
  ///
  /// In en, this message translates to:
  /// **'CNN F&G shows whether market sentiment is closer to fear or greed.\n\nVIX shows market volatility. A higher number usually means more market anxiety.\n\nMajor U.S. events include NFP, CPI, and FOMC. NFP tracks employment, CPI tracks inflation, and FOMC shows the interest-rate direction. These events can move Nasdaq and QLD sharply.\n\nThe 10-year Treasury yield is the U.S. 10-year bond rate. A fast rise can pressure growth stocks, Nasdaq, and QLD.'**
  String get usageGuideIndicatorsBody;

  /// No description provided for @usageGuideQldTitle.
  ///
  /// In en, this message translates to:
  /// **'3. Buy through your broker and record it'**
  String get usageGuideQldTitle;

  /// No description provided for @usageGuideQldBody.
  ///
  /// In en, this message translates to:
  /// **'Use the displayed strategy and amount as a guide, then buy in your own brokerage app. After buying, record shares, average price, and cash in the app portfolio.'**
  String get usageGuideQldBody;

  /// No description provided for @usageGuideDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This app is for investment reference only and does not guarantee profit.'**
  String get usageGuideDisclaimer;

  /// No description provided for @usageGuideConfirm.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get usageGuideConfirm;

  /// No description provided for @bookReadingTitle.
  ///
  /// In en, this message translates to:
  /// **'Column'**
  String get bookReadingTitle;

  /// No description provided for @bookReaderPageNumber.
  ///
  /// In en, this message translates to:
  /// **'Page {page}'**
  String bookReaderPageNumber(int page);

  /// No description provided for @numGuessPrompt.
  ///
  /// In en, this message translates to:
  /// **'Guess a number between 1 and 1000.'**
  String get numGuessPrompt;

  /// No description provided for @numGuessInvalidInput.
  ///
  /// In en, this message translates to:
  /// **'Please enter a number between 1 and 1000.'**
  String get numGuessInvalidInput;

  /// No description provided for @numGuessCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct! You got it in {attempts} tries.'**
  String numGuessCorrect(int attempts);

  /// No description provided for @numGuessTooLow.
  ///
  /// In en, this message translates to:
  /// **'The number is higher.'**
  String get numGuessTooLow;

  /// No description provided for @numGuessTooHigh.
  ///
  /// In en, this message translates to:
  /// **'The number is lower.'**
  String get numGuessTooHigh;

  /// No description provided for @numGuessAttemptsLabel.
  ///
  /// In en, this message translates to:
  /// **'Attempts: {count}'**
  String numGuessAttemptsLabel(int count);

  /// No description provided for @numGuessLastGuessLabel.
  ///
  /// In en, this message translates to:
  /// **'Your guess: {number}'**
  String numGuessLastGuessLabel(int number);

  /// No description provided for @numGuessInputHint.
  ///
  /// In en, this message translates to:
  /// **'Enter number'**
  String get numGuessInputHint;

  /// No description provided for @numGuessConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get numGuessConfirm;

  /// No description provided for @numGuessNewGame.
  ///
  /// In en, this message translates to:
  /// **'New Game'**
  String get numGuessNewGame;

  /// No description provided for @numGuessRanking.
  ///
  /// In en, this message translates to:
  /// **'Ranking'**
  String get numGuessRanking;

  /// No description provided for @numGuessNoRecords.
  ///
  /// In en, this message translates to:
  /// **'No records yet.'**
  String get numGuessNoRecords;

  /// No description provided for @numGuessAttemptCount.
  ///
  /// In en, this message translates to:
  /// **'{count} tries'**
  String numGuessAttemptCount(int count);

  /// No description provided for @jumpLeaderboard.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard'**
  String get jumpLeaderboard;

  /// No description provided for @jumpScore.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get jumpScore;

  /// No description provided for @jumpPersonalBest.
  ///
  /// In en, this message translates to:
  /// **'Personal Best'**
  String get jumpPersonalBest;

  /// No description provided for @jumpTapToRestart.
  ///
  /// In en, this message translates to:
  /// **'Tap to restart'**
  String get jumpTapToRestart;

  /// No description provided for @jumpTapToStart.
  ///
  /// In en, this message translates to:
  /// **'Tap to start'**
  String get jumpTapToStart;

  /// No description provided for @jumpInstruction.
  ///
  /// In en, this message translates to:
  /// **'Tap the screen to jump and avoid obstacles.'**
  String get jumpInstruction;

  /// No description provided for @inquiryLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load inquiries.'**
  String get inquiryLoadError;

  /// No description provided for @inquiryAdminOnlyReply.
  ///
  /// In en, this message translates to:
  /// **'Only admins can submit replies.'**
  String get inquiryAdminOnlyReply;

  /// No description provided for @inquiryReplyEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter a reply.'**
  String get inquiryReplyEmpty;

  /// No description provided for @inquiryReplyError.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit reply. Please try again later.'**
  String get inquiryReplyError;

  /// No description provided for @inquiryAdminOnlyPin.
  ///
  /// In en, this message translates to:
  /// **'Only admins can pin.'**
  String get inquiryAdminOnlyPin;

  /// No description provided for @inquiryPinError.
  ///
  /// In en, this message translates to:
  /// **'Failed to save pin status.'**
  String get inquiryPinError;

  /// No description provided for @inquiryAdminOnlyDelete.
  ///
  /// In en, this message translates to:
  /// **'Only admins can delete.'**
  String get inquiryAdminOnlyDelete;

  /// No description provided for @inquiryDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Inquiry'**
  String get inquiryDeleteTitle;

  /// No description provided for @inquiryDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this inquiry?'**
  String get inquiryDeleteConfirm;

  /// No description provided for @inquiryCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get inquiryCancel;

  /// No description provided for @inquiryDeleteAction.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get inquiryDeleteAction;

  /// No description provided for @inquiryDeleteError.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete. Please try again later.'**
  String get inquiryDeleteError;

  /// No description provided for @inquiryContentEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your inquiry.'**
  String get inquiryContentEmpty;

  /// No description provided for @inquirySubmitError.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit inquiry. Please try again later.'**
  String get inquirySubmitError;

  /// No description provided for @inquiryAdminLabel.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get inquiryAdminLabel;

  /// No description provided for @inquiryPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get inquiryPasswordLabel;

  /// No description provided for @inquiryPasswordWrong.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password.'**
  String get inquiryPasswordWrong;

  /// No description provided for @inquiryAdminActivatedRegistered.
  ///
  /// In en, this message translates to:
  /// **'Admin mode enabled (device registered)'**
  String get inquiryAdminActivatedRegistered;

  /// No description provided for @inquiryAdminActivatedFailed.
  ///
  /// In en, this message translates to:
  /// **'Admin mode enabled (device registration failed)'**
  String get inquiryAdminActivatedFailed;

  /// No description provided for @inquiryContentDetailLabel.
  ///
  /// In en, this message translates to:
  /// **'Inquiry'**
  String get inquiryContentDetailLabel;

  /// No description provided for @inquiryAdminReplyLabel.
  ///
  /// In en, this message translates to:
  /// **'Admin Reply'**
  String get inquiryAdminReplyLabel;

  /// No description provided for @inquiryAdminReplyEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Reply'**
  String get inquiryAdminReplyEdit;

  /// No description provided for @inquirySaving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get inquirySaving;

  /// No description provided for @inquirySubmitReply.
  ///
  /// In en, this message translates to:
  /// **'Submit Reply'**
  String get inquirySubmitReply;

  /// No description provided for @inquiryPrevPage.
  ///
  /// In en, this message translates to:
  /// **'Previous page'**
  String get inquiryPrevPage;

  /// No description provided for @inquiryNextPage.
  ///
  /// In en, this message translates to:
  /// **'Next page'**
  String get inquiryNextPage;

  /// No description provided for @inquiryPageOf.
  ///
  /// In en, this message translates to:
  /// **'Page {current} / {total}'**
  String inquiryPageOf(int current, int total);

  /// No description provided for @inquiryUnpin.
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get inquiryUnpin;

  /// No description provided for @inquiryPin.
  ///
  /// In en, this message translates to:
  /// **'Pin to top'**
  String get inquiryPin;

  /// No description provided for @inquiryListTitle.
  ///
  /// In en, this message translates to:
  /// **'Inquiry List'**
  String get inquiryListTitle;

  /// No description provided for @inquiryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No inquiries yet.'**
  String get inquiryEmpty;

  /// No description provided for @inquiryWriteTitle.
  ///
  /// In en, this message translates to:
  /// **'Write Inquiry'**
  String get inquiryWriteTitle;

  /// No description provided for @inquiryContentFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get inquiryContentFieldLabel;

  /// No description provided for @inquirySubmitting.
  ///
  /// In en, this message translates to:
  /// **'Submitting...'**
  String get inquirySubmitting;

  /// No description provided for @inquirySubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get inquirySubmitButton;

  /// No description provided for @inquiryUserReplyLabel.
  ///
  /// In en, this message translates to:
  /// **'Add a follow-up message...'**
  String get inquiryUserReplyLabel;

  /// No description provided for @indicatorCnnFearGreed.
  ///
  /// In en, this message translates to:
  /// **'CNN Fear & Greed'**
  String get indicatorCnnFearGreed;

  /// No description provided for @indicatorVix.
  ///
  /// In en, this message translates to:
  /// **'VIX Volatility'**
  String get indicatorVix;

  /// No description provided for @indicatorUsSchedule.
  ///
  /// In en, this message translates to:
  /// **'Major U.S. Events'**
  String get indicatorUsSchedule;

  /// No description provided for @indicatorTenYearYield.
  ///
  /// In en, this message translates to:
  /// **'U.S. 10Y Yield'**
  String get indicatorTenYearYield;

  /// No description provided for @indicatorUsMarketTime.
  ///
  /// In en, this message translates to:
  /// **'U.S. Market Time'**
  String get indicatorUsMarketTime;

  /// No description provided for @indicatorVixHigh.
  ///
  /// In en, this message translates to:
  /// **'High volatility'**
  String get indicatorVixHigh;

  /// No description provided for @indicatorVixStable.
  ///
  /// In en, this message translates to:
  /// **'Normal zone'**
  String get indicatorVixStable;

  /// No description provided for @indicatorVixDefault.
  ///
  /// In en, this message translates to:
  /// **'Market anxiety index'**
  String get indicatorVixDefault;

  /// No description provided for @indicatorVixLow.
  ///
  /// In en, this message translates to:
  /// **'Very low volatility'**
  String get indicatorVixLow;

  /// No description provided for @indicatorVixCaution.
  ///
  /// In en, this message translates to:
  /// **'Caution zone'**
  String get indicatorVixCaution;

  /// No description provided for @indicatorTenYearDesc.
  ///
  /// In en, this message translates to:
  /// **'10-year bond rate'**
  String get indicatorTenYearDesc;

  /// No description provided for @marketWeekendLabel.
  ///
  /// In en, this message translates to:
  /// **'Weekend · To Open'**
  String get marketWeekendLabel;

  /// No description provided for @marketPreOpenLabel.
  ///
  /// In en, this message translates to:
  /// **'To Open'**
  String get marketPreOpenLabel;

  /// No description provided for @marketToCloseLabel.
  ///
  /// In en, this message translates to:
  /// **'To Close'**
  String get marketToCloseLabel;

  /// No description provided for @marketClosedLabel.
  ///
  /// In en, this message translates to:
  /// **'Market Closed'**
  String get marketClosedLabel;

  /// No description provided for @marketClosedValue.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get marketClosedValue;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @rsiOverbought.
  ///
  /// In en, this message translates to:
  /// **'Overbought'**
  String get rsiOverbought;

  /// No description provided for @rsiOversold.
  ///
  /// In en, this message translates to:
  /// **'Oversold'**
  String get rsiOversold;

  /// No description provided for @rsiNormal.
  ///
  /// In en, this message translates to:
  /// **'Neutral'**
  String get rsiNormal;

  /// No description provided for @rsiOverboughtZone.
  ///
  /// In en, this message translates to:
  /// **'Overbought zone'**
  String get rsiOverboughtZone;

  /// No description provided for @rsiOversoldZone.
  ///
  /// In en, this message translates to:
  /// **'Oversold zone'**
  String get rsiOversoldZone;

  /// No description provided for @rsiNormalZone.
  ///
  /// In en, this message translates to:
  /// **'Normal range'**
  String get rsiNormalZone;

  /// No description provided for @rsiOverboughtOversold.
  ///
  /// In en, this message translates to:
  /// **'Overbought / Oversold'**
  String get rsiOverboughtOversold;

  /// No description provided for @coverStrategyTab.
  ///
  /// In en, this message translates to:
  /// **'Strategy Tab'**
  String get coverStrategyTab;

  /// No description provided for @coverStrategyHint.
  ///
  /// In en, this message translates to:
  /// **'Swipe up to view the Strategy Tab'**
  String get coverStrategyHint;

  /// No description provided for @usScheduleSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'US Major Schedule'**
  String get usScheduleSheetTitle;

  /// No description provided for @noScheduleLeft.
  ///
  /// In en, this message translates to:
  /// **'No schedules registered'**
  String get noScheduleLeft;

  /// No description provided for @scheduleNameHint.
  ///
  /// In en, this message translates to:
  /// **'Event name'**
  String get scheduleNameHint;

  /// No description provided for @adminPassword.
  ///
  /// In en, this message translates to:
  /// **'Admin password'**
  String get adminPassword;

  /// No description provided for @addSchedule.
  ///
  /// In en, this message translates to:
  /// **'Add schedule'**
  String get addSchedule;

  /// No description provided for @wrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password.'**
  String get wrongPassword;

  /// No description provided for @checkScheduleNameAndDate.
  ///
  /// In en, this message translates to:
  /// **'Please check the event name and date.'**
  String get checkScheduleNameAndDate;

  /// No description provided for @editSchedule.
  ///
  /// In en, this message translates to:
  /// **'Edit schedule'**
  String get editSchedule;

  /// No description provided for @rsiDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'What is RSI(14)?'**
  String get rsiDialogTitle;

  /// No description provided for @rsiDialogContent.
  ///
  /// In en, this message translates to:
  /// **'RSI (Relative Strength Index) is an indicator that compares gains and losses over the past 14 days to show whether the current stock price is overbought or oversold, on a scale of 0–100.\n\n• 70 or above → Overbought zone\n  High chance of short-term correction after rapid rise.\n\n• 30 or below → Oversold zone\n  Possible rebound after sharp short-term drop.\n\n• 30–70 → Normal range\n  No overbought or oversold signal.'**
  String get rsiDialogContent;

  /// No description provided for @inquiryEditMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Message'**
  String get inquiryEditMessageTitle;

  /// No description provided for @inquiryEditMessageSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get inquiryEditMessageSave;

  /// No description provided for @inquiryTapToEdit.
  ///
  /// In en, this message translates to:
  /// **'Tap to edit'**
  String get inquiryTapToEdit;

  /// No description provided for @stockQuoteList.
  ///
  /// In en, this message translates to:
  /// **'Be fearful when others are greedy, and greedy when others are fearful. — Warren Buffett\nPrice is what you pay. Value is what you get. — Warren Buffett\nIt\'s far better to buy a wonderful company at a fair price. — Warren Buffett\nNever invest in a business you cannot understand. — Warren Buffett\nRisk comes from not knowing what you\'re doing. — Warren Buffett\nOur favorite holding period is forever. — Warren Buffett\nIt takes 20 years to build a reputation and five minutes to ruin it. — Warren Buffett\nMarket fluctuations are not a threat but an opportunity. — Warren Buffett\nOnly when the tide goes out do you discover who\'s been swimming naked. — Warren Buffett\nThe investor should focus on avoiding big mistakes rather than hitting home runs. — Warren Buffett\nStay within your circle of competence and mistakes decrease. — Warren Buffett\nBuying a stock means buying a piece of a business, not a piece of paper. — Warren Buffett\nOnly buy something you\'d be perfectly happy to hold if the market closed for 10 years. — Warren Buffett\nFocus on a company\'s long-term earnings power, not short-term price. — Warren Buffett\nA great business structure often matters more than great management. — Warren Buffett\nChoose the simple and certain over the complex and uncertain. — Warren Buffett\nInvesting in yourself may be the best investment of all. — Warren Buffett\nPatient judgment that can endure beats impulsive trading. — Warren Buffett\nYou don\'t have to swing at every pitch. Wait for the right one. — Warren Buffett\nTemperament matters more than IQ in investing. — Warren Buffett\nA great business reveals its value more and more over time. — Warren Buffett\nUnderstanding a good business well matters more than buying it cheaply. — Warren Buffett\nLook at a company\'s cash flow, not the market\'s noise. — Warren Buffett\nDebt-fueled investing makes even sound judgment dangerous. — Warren Buffett\nCash lets you act when opportunity arrives. — Warren Buffett\nBig money is made not by frequent trading but by patient waiting. — Charlie Munger\nInvert, always invert — avoid foolish mistakes rather than trying to be clever. — Charlie Munger\nWhen a problem is hard to solve, try working backwards. — Charlie Munger\nReputation and integrity can disappear in an instant. — Charlie Munger\nOwning a great business for a long time is the key to compounding. — Charlie Munger\nUnderstanding incentives helps you understand human behavior. — Charlie Munger\nThe more you act, the more chances you create for mistakes. — Charlie Munger\nInvesting requires the ability to wait. — Charlie Munger\nGood judgment comes from connecting knowledge across many fields. — Charlie Munger\nA quality business makes time your ally as an investor. — Charlie Munger\nWhen opportunities are rare, the prepared person has the advantage. — Charlie Munger\nTry to be a little less foolish each day rather than a little smarter. — Charlie Munger\nSuccess comes from maintaining fundamentals, not from complex formulas. — Charlie Munger\nGood investments feel uncomfortable to the impatient. — Charlie Munger\nYou don\'t need to learn from every mistake yourself — learn from others\'. — Charlie Munger\nOutstanding results come from acting boldly on rare opportunities. — Charlie Munger\nBeware the mistake of paying too much even for a great business. — Charlie Munger\nThe most dangerous words in investing are \'I sort of know.\' — Charlie Munger\nMaintaining simplicity helps long-term performance. — Charlie Munger\nTo beat the market, first beat your own impulses. — Charlie Munger\nMargin of safety is the investor\'s shield. — Benjamin Graham\nIn the short run, the market is a voting machine; in the long run, a weighing machine. — Benjamin Graham\nThe intelligent investor sells to optimists and buys from pessimists. — Benjamin Graham\nPrice movements are suggestions, not commands. — Benjamin Graham\nInvestment must be based on analysis; speculation relies on expectation. — Benjamin Graham\nDon\'t be ruled by Mr. Market\'s moods — exploit them. — Benjamin Graham\nBuying well below value is how you prepare for your own mistakes. — Benjamin Graham\nThe principle of avoiding loss comes before the principle of making profits. — Benjamin Graham\nMarkets are sometimes irrational, but value is ultimately reflected. — Benjamin Graham\nThe more uncertain the situation, the larger the margin of safety required. — Benjamin Graham\nThe investor must calculate value before price. — Benjamin Graham\nGood analysis comes from calm, not excitement. — Benjamin Graham\nThe defensive investor avoids overconfidence. — Benjamin Graham\nExpected return without principle is closer to speculation than investment. — Benjamin Graham\nMarket whims can become the long-term investor\'s friend. — Benjamin Graham\nBeing cheap alone is not enough — you need value and margin of safety. — Benjamin Graham\nTrust numbers and value over crowd emotions. — Benjamin Graham\nThose who admit they can be wrong survive longer. — Benjamin Graham\nThe first question in investing is not how much can I earn, but how much can I lose. — Benjamin Graham\nA good investment is a decision backed by sufficient analysis and sufficient margin of safety. — Benjamin Graham\nKnow what you own and why you own it. — Peter Lynch\nStocks are not lottery tickets — they are pieces of a business. — Peter Lynch\nIf a company does well, the stock will eventually follow. — Peter Lynch\nYou can find investment ideas in places you already understand. — Peter Lynch\nInvesting without research is like playing poker without looking at your cards. — Peter Lynch\nDownturns repeat — the question is whether you can endure them. — Peter Lynch\nGuts matter as much as knowledge in the stock market. — Peter Lynch\nEven a good stock needs revisiting when its story changes. — Peter Lynch\nNot every stock needs to succeed — one big winner can transform a portfolio. — Peter Lynch\nThe company\'s story comes before the stock price. — Peter Lynch\nEven in a business you know well, check the numbers. — Peter Lynch\nRather than predicting the market, focus on finding great companies. — Peter Lynch\nIndividual investors can discover great companies through everyday life. — Peter Lynch\nAn unpopular great company can offer larger opportunity. — Peter Lynch\nIf you\'re not prepared for a sharp drop, reduce your stock exposure. — Peter Lynch\nDon\'t fall in love with a stock — track the company\'s performance. — Peter Lynch\nThe biggest mistake is pretending to know what you don\'t know. — Peter Lynch\nA good investment idea doesn\'t require a complex explanation. — Peter Lynch\nDon\'t assume a stock is cheap just because the price has fallen. — Peter Lynch\nRevisit a growth stock the moment its growth story breaks down. — Peter Lynch\nThe winning formula in investing is to hold broadly and endure long. — John Bogle\nStay the course — don\'t change your plan because of market noise. — John Bogle\nDon\'t look for the needle in the haystack. Just buy the haystack. — John Bogle\nCosts are a certain drag; returns are uncertain. — John Bogle\nTime is your friend, impulse is your enemy. — John Bogle\nSpeculation leads with emotion; investing reduces it. — John Bogle\nLong-term investors don\'t need to predict the market. — John Bogle\nLow cost is the most powerful variable an investor can control. — John Bogle\nOwning the whole market reduces individual stock mistakes. — John Bogle\nThe ability to do nothing is an investor\'s competitive edge. — John Bogle\nSimple index funds outlast complex products. — John Bogle\nChasing returns can lower your returns. — John Bogle\nYou can\'t know the future, but you can lower your costs. — John Bogle\nDiversification, low cost, and long holding are the basics. — John Bogle\nOver time, markets reflect the performance of the entire economy. — John Bogle\nThe more often you check, the more reasons you find to be shaken. — John Bogle\nMaintain your investment plan with principle, not emotion. — John Bogle\nBoring investing can produce the strongest results. — John Bogle\nConsistently earning the market average is a powerful strategy. — John Bogle\nCosts and emotions are the biggest enemies of long-term investing. — John Bogle\nSuperior investing starts with thinking differently and more deeply than others. — Howard Marks\nRisk is not volatility but the possibility of permanent loss. — Howard Marks\nYou can\'t eliminate risk, but you can manage it. — Howard Marks\nThe higher the price, the smaller the margin of safety on future returns. — Howard Marks\nInvestors who ignore cycles are repeatedly surprised. — Howard Marks\nEven a great asset becomes a bad investment if bought too dearly. — Howard Marks\nIn investing, the asymmetry of gains and losses matters more than frequency of being right. — Howard Marks\nDefense must be prepared before the bear market arrives. — Howard Marks\nThe more consensus there is, the more reason there is to think differently. — Howard Marks\nProfits emerge when you understand the gap between price and value. — Howard Marks\nSuccessful investing is playing the probability game well. — Howard Marks\nA too-comfortable environment makes risk look cheap. — Howard Marks\nMarket psychology can drive prices far from value. — Howard Marks\nConservative investing isn\'t about missing opportunities — it\'s about raising survival odds. — Howard Marks\nRisk management is most needed when returns are good. — Howard Marks\nSecond-level thinking is the ability to interpret what everyone sees differently. — Howard Marks\nThe best buys rarely come at the most comfortable moments. — Howard Marks\nNot seeing risk is the greatest risk. — Howard Marks\nAs the market approaches extremes, caution becomes more important. — Howard Marks\nInvesting is not a game of certainty but of probability. — Howard Marks\nThe time of maximum pessimism is the best time to buy. — John Templeton\nThe time of maximum optimism is the best time to sell. — John Templeton\nBull markets are born in pessimism, grow in skepticism, and mature in optimism. — John Templeton\nWhen euphoria dominates the market, the bull market becomes dangerous. — John Templeton\nThe best opportunities are found where others look away. — John Templeton\nYou need courage to buy when others are selling. — John Templeton\nFour of the most dangerous words in investing are \'this time it\'s different.\' — John Templeton\nWherever in the world there is cheap value, you should be able to find it. — John Templeton\nPessimism drives prices down, and lower prices create opportunity. — John Templeton\nCalmly examine assets the crowd dislikes. — John Templeton\nBe an optimist, but be cold-eyed about prices. — John Templeton\nGreat opportunities start outside the crowd\'s attention. — John Templeton\nThe worst news doesn\'t always mean the worst investment. — John Templeton\nIf the price is low enough, even uncertainty can be rewarded. — John Templeton\nThose who buy in pessimism should be ready to sell in optimism. — John Templeton\nMarkets make their biggest mistakes at the extremes of emotion. — John Templeton\nOpportunity comes more from uncomfortable places than comfortable ones. — John Templeton\nGoing against the crowd requires both evidence and courage. — John Templeton\nLong-term returns can begin from decisions made at the most unpopular moment. — John Templeton\nThe investor is not someone who avoids fear but someone who analyzes it. — John Templeton\nBig money came not from being right but from enduring to the end. — Jesse Livermore\nThe market is never wrong; opinions are. — Jesse Livermore\nThe urge to always be doing something creates many losses. — Jesse Livermore\nLosses must be admitted while they are small. — Jesse Livermore\nIf the trend is alive, there\'s no reason to exit prematurely. — Jesse Livermore\nBeing right but unable to endure means big money stays out of reach. — Jesse Livermore\nThinking you must profit every day destroys a trader. — Jesse Livermore\nAdding to a losing position is a dangerous habit. — Jesse Livermore\nDon\'t try to argue with the market — listen to it. — Jesse Livermore\nEgo in front of price movement becomes a cost. — Jesse Livermore\nWhat matters more than when to buy is knowing when you\'re wrong. — Jesse Livermore\nBig trends reward those who endure. — Jesse Livermore\nEven good judgment can collapse from impatient liquidation. — Jesse Livermore\nMarkets don\'t care about an individual\'s hopes. — Jesse Livermore\nFrequent trading creates more mistakes than opportunities. — Jesse Livermore\nBig money comes to those who know how to sit quietly. — Jesse Livermore\nTo survive speculation, first limit your losses. — Jesse Livermore\nDon\'t ignore the direction the price is signaling. — Jesse Livermore\nMore important than conviction is the ability to exit when wrong. — Jesse Livermore\nSelf-discipline in trading is as important as analytical ability. — Jesse Livermore\nStock markets are moved by money and psychology. — André Kostolany\nThe owner walks slowly, the dog runs back and forth, but they arrive together. — André Kostolany\nAn investor must have money, ideas, and patience. — André Kostolany\nThe most expensive thing in the stock market is impatience. — André Kostolany\nStep back when the crowd gets excited. — André Kostolany\nA good investor reads the market\'s mood but doesn\'t follow it. — André Kostolany\nPrices are shaken by psychology, but value needs time. — André Kostolany\nInvesting needs imagination, but it needs patience even more. — André Kostolany\nWhen you invest with borrowed money, time becomes your enemy. — André Kostolany\nStocks transfer money from impatient people to patient people. — André Kostolany\nExpecting better results while thinking like everyone else is unrealistic. — André Kostolany\nPsychology moves the market before logic on many days. — André Kostolany\nInvesting without waiting moves closer to speculation. — André Kostolany\nInvestors in a hurry struggle to endure the market\'s whims. — André Kostolany\nDeclines are painful, but they are also the language of opportunity. — André Kostolany\nLooking at the market too often puts emotion ahead of thought. — André Kostolany\nPatience is the investor\'s hidden capital. — André Kostolany\nEven a good idea can fail without enough time. — André Kostolany\nThe investor must trust their own judgment over the crowd\'s applause. — André Kostolany\nThose who survive long in markets ultimately learn the most. — André Kostolany\nPain plus reflection equals progress. — Ray Dalio\nAdmitting what you don\'t know is the beginning of risk management. — Ray Dalio\nMixing assets with low correlation can make a portfolio more stable. — Ray Dalio\nWithout principles, emotions make decisions during crises. — Ray Dalio\nThe ability to see reality as it is is the starting point for good decision-making. — Ray Dalio\nInvestors need verifiable principles, not mere conviction. — Ray Dalio\nDiversification is not hiding ignorance — it\'s acknowledging uncertainty. — Ray Dalio\nIf you don\'t know your weaknesses, the market will show you. — Ray Dalio\nA good system applies the same standard even in emotional moments. — Ray Dalio\nUnderstanding the big picture makes you less shaken by short-term noise. — Ray Dalio\nWhat matters is not whether you\'re right or wrong, but how much you make when right and how little you lose when wrong. — George Soros\nMarkets don\'t just reflect reality — they also influence it. — George Soros\nThe ability to quickly admit you\'re wrong is a powerful weapon. — George Soros\nSurvival comes first; profits come second. — George Soros\nAs conviction grows, check the counter-case too. — George Soros\nMarket illusions can persist for a long time. — George Soros\nGood investors correct their errors quickly. — George Soros\nThe danger is not being wrong but staying wrong. — George Soros\nThe bigger the opportunity, the more important position management becomes. — George Soros\nInvesting means making decisions under imperfect information. — George Soros\nDefense before offense. — Paul Tudor Jones\nAdding to a losing position creates ever-greater danger. — Paul Tudor Jones\nPreserve capital and the next opportunity will come. — Paul Tudor Jones\nDon\'t try to be a hero in the market. — Paul Tudor Jones\nThe ability to keep losses small builds long-term performance. — Paul Tudor Jones\nWhen price moves against you, cut risk first. — Paul Tudor Jones\nAvoiding big losses comes before seeking big gains. — Paul Tudor Jones\nEgo in trading amplifies losses. — Paul Tudor Jones\nA defensive mindset is not weakness — it is a survival strategy. — Paul Tudor Jones\nAggression without loss management doesn\'t last. — Paul Tudor Jones\nCutting losses when small is the rule. — William O\'Neil & Mark Minervini\nStrong stocks are strong for a reason. — William O\'Neil & Mark Minervini\nDon\'t fight the trend. — William O\'Neil & Mark Minervini\nCharts can show danger signals faster than opinions. — William O\'Neil & Mark Minervini\nTo capture big winners, first avoid big losers. — William O\'Neil & Mark Minervini\nTrading without rules is just a record of emotions. — William O\'Neil & Mark Minervini\nFind the market\'s leaders but limit risk with numbers. — William O\'Neil & Mark Minervini\nWhat matters more than the entry is what you do when you\'re wrong. — William O\'Neil & Mark Minervini\nEven a good entry can\'t overcome poor stop-loss habits. — William O\'Neil & Mark Minervini\nIn a bull market, the strongest stocks can keep getting stronger. — William O\'Neil & Mark Minervini\nOwning the whole market reduces the burden of prediction. — Burton Malkiel\nDon\'t try to predict short-term price movements that are nearly random. — Burton Malkiel\nLow cost and broad diversification are areas investors can actually control. — Burton Malkiel\nLong-term index investing isn\'t glamorous, but it\'s consistent. — Burton Malkiel\nSimple participation often beats complex prediction. — Burton Malkiel\nDisrespect the average and you may end up below it. — Burton Malkiel\nMarket timing is tempting but rarely successful. — Burton Malkiel\nInvestors win first by cutting certain costs. — Burton Malkiel\nA diversified portfolio is a realistic answer to an uncertain future. — Burton Malkiel\nA simple strategy becomes more powerful when it can be maintained. — Burton Malkiel\nA great company has competitive depth beyond its revenue. — Philip Fisher\nWhen evaluating growth stocks, look at management and market opportunity together. — Philip Fisher\nA great company reveals its worth the longer you hold it. — Philip Fisher\nTo understand a company, research every voice around it. — Philip Fisher\nSelling can be a harder decision than buying. — Philip Fisher\nLong-term growth companies give you reasons to endure short-term volatility. — Philip Fisher\nGood management creates value that numbers don\'t show. — Philip Fisher\nLook at both growth potential and price together. — Philip Fisher\nIf you don\'t understand a company\'s quality, long holding becomes unstable. — Philip Fisher\nA great company makes time the investor\'s friend. — Philip Fisher\nMargin of safety is the investor\'s language for acknowledging uncertainty. — Seth Klarman\nValue investing looks at the gap between price and value, not popularity. — Seth Klarman\nRisk can grow precisely when others feel it doesn\'t exist. — Seth Klarman\nPatience is one of the most important assets of a value investor. — Seth Klarman\nEven a cheap price needs a reason — verify it. — Seth Klarman\nThe discipline of avoiding losses is the foundation of long-term returns. — Seth Klarman\nCash may be needed because good opportunities don\'t come often. — Seth Klarman\nInvestors should rely on their own analysis, not market popularity. — Seth Klarman\nThe larger the gap between value and price, the greater the opportunity. — Seth Klarman\nConviction without margin of safety is dangerous overconfidence. — Seth Klarman\nThe principle of buying great companies cheaply is simple but not easy. — Joel Greenblatt\nWhen a high-return business meets a low price, opportunity is created. — Joel Greenblatt\nEven a simple principle fails if you can\'t stick to it. — Joel Greenblatt\nValue investing looks boring but takes time. — Joel Greenblatt\nThe market\'s short-term irrationality creates opportunities. — Joel Greenblatt\nA good strategy must be hard for everyone to follow in order to endure. — Joel Greenblatt\nWhen price is below value, the investor\'s edge appears. — Joel Greenblatt\nLook at both company quality and price together. — Joel Greenblatt\nLong term, numbers are stronger than stories. — Joel Greenblatt\nValue investing is hard to do without patience. — Joel Greenblatt\nSeek a situation where heads you win big and tails you lose small. — Mohnish Pabrai\nSimple ideas can generate great returns. — Mohnish Pabrai\nA good investor knows how to replicate the principles of great investors. — Mohnish Pabrai\nThe best investments limit the downside while leaving the upside open. — Mohnish Pabrai\nWait for clear opportunities rather than complex ones. — Mohnish Pabrai\nInvestors need fewer decisions, but better ones. — Mohnish Pabrai\nFocus on the certain opportunities that come rarely. — Mohnish Pabrai\nCalculating the chance of loss first helps you survive longer. — Mohnish Pabrai\nA good investment should have a simple explanation. — Mohnish Pabrai\nWaiting is part of value investing. — Mohnish Pabrai\nTraveling long with a great company can be the most powerful strategy. — Nick Sleep\nInvestors should be owners, not traders. — Nick Sleep\nA long-term perspective is hard for competitors to copy. — Nick Sleep\nA good company culture compounds like interest over time. — Nick Sleep\nA company that thinks about its customers for the long term can reward investors too. — Nick Sleep\nTrue long-term investing endures the noise of quarterly results. — Nick Sleep\nThe intrinsic value of a great company builds slowly but powerfully. — Nick Sleep\nAn ownership mindset reduces the impulse to trade. — Nick Sleep\nThe longer you hold, the more company quality matters. — Nick Sleep\nFinding a company to travel with long-term beats frequent trading. — Nick Sleep\nDon\'t try to catch a falling knife. — Wall Street Wisdom\n\'Buy the rumor, sell the news\' means beware of crowd psychology. — Wall Street Wisdom\nIn a bull market, everyone looks smart. — Wall Street Wisdom\nCut losses fast; let profits run. — Wall Street Wisdom\nMarkets are colder than hope. — Wall Street Wisdom\nThe trend may be your friend, but it always ends at some point. — Wall Street Wisdom\nLearn first how not to lose money. — Wall Street Wisdom\nDiversification prevents a single mistake from being fatal. — Wall Street Wisdom\nLeverage compresses time but also compresses mistakes. — Wall Street Wisdom\nThe market is always preparing the next lesson. — Wall Street Wisdom\nGreat investment opportunities don\'t come often — be ready when they do. — Warren Buffett\nIf you aren\'t willing to hold a stock long-term, think twice about buying it short-term. — Warren Buffett\nA company\'s price tag changes daily, but its fundamentals don\'t. — Warren Buffett\nThe ability to understand a business is a stronger weapon than complex forecasts. — Warren Buffett\nA great business reduces the investor\'s mistakes over time. — Warren Buffett\nPublic fear becomes a discounted price tag for the prepared investor. — Warren Buffett\nPatience waiting for certain opportunities beats trying to grab every one. — Warren Buffett\nInvesting demands rational action, not brilliant action. — Warren Buffett\nLook for businesses that can earn for you long-term, not just stocks that look cheap. — Warren Buffett\nHolding a great company long-term is tedious — and that tedium becomes the result. — Warren Buffett\nThe greatest edge in investing is admitting what you don\'t know. — Charlie Munger\nOnce you find a great business, reducing unnecessary action helps. — Charlie Munger\nPatience combined with knowledge becomes a powerful investing tool. — Charlie Munger\nMany mistakes come from failing to see complexity as simplicity. — Charlie Munger\nInvestors should first consider why they might be wrong. — Charlie Munger\nThe best investors may not be those who trade daily but those who wait long. — Charlie Munger\nInverting shows you the paths to avoid first. — Charlie Munger\nLearning from others\' mistakes is the cheapest tuition. — Charlie Munger\nCompounding strengthens when a great company meets a long time horizon. — Charlie Munger\nGood temperament outlasts high intelligence in investment results. — Charlie Munger\nNot knowing the gap between value and price drags investors along with market moods. — Benjamin Graham\nThe market offers opportunity every day, but you don\'t need to follow every day. — Benjamin Graham\nThe investor must be the master of the market, not its servant. — Benjamin Graham\nMargin of safety is insurance against not knowing the future. — Benjamin Graham\nA falling price doesn\'t always mean more danger — paying too much is the real risk. — Benjamin Graham\nConviction without analysis turns investors into speculators. — Benjamin Graham\nPrice fluctuations test an investor\'s emotions; value demands their reason. — Benjamin Graham\nMarket prices are facts, but they aren\'t always the truth. — Benjamin Graham\nBuying cheap enough is more realistic protection than perfect future prediction. — Benjamin Graham\nThe intelligent investor finds margin of safety before popularity. — Benjamin Graham\nBefore buying a stock, be able to explain how that company makes money. — Peter Lynch\nGood investment ideas can be closer to daily life than you think. — Peter Lynch\nCheck whether the company\'s story still holds, not just the stock price. — Peter Lynch\nIf you\'re not prepared to endure declines, you\'ll struggle to enjoy the gains. — Peter Lynch\nKnow the company\'s earnings and outlook, not just its name. — Peter Lynch\nSpend time researching companies rather than trying to predict the market. — Peter Lynch\nBuild a structure so one or two failures don\'t destroy the whole portfolio. — Peter Lynch\nWinning stocks need time; failing stocks need review. — Peter Lynch\nBuying a company you don\'t know is entrusting your money to someone else\'s story. — Peter Lynch\nStocks require checking both the numbers and the story. — Peter Lynch\nConsistently earning ordinary market returns is anything but ordinary. — John Bogle\nInvestors don\'t need complex predictions to earn the whole market\'s returns. — John Bogle\nLow cost sides with the investor more and more over time. — John Bogle\nDoing nothing looks easy but is actually the hardest strategy. — John Bogle\nThe power of index investing lies in reducing unnecessary choices, not in genius selection. — John Bogle\nLong-term investors look at decades of compounding, not a day\'s news. — John Bogle\nThe foundation of investing is not being right more — it\'s building a structure that leaks less. — John Bogle\nLowering costs, taxes, and emotions can improve long-term performance. — John Bogle\nTime in the market beats timing the market. — John Bogle\nA simple portfolio is easier to protect even in a crisis. — John Bogle\nA good investor asks not just what to buy, but at what price. — Howard Marks\nWhen everyone is optimistic, doubt the price more than the good news. — Howard Marks\nWhen everyone is fearful, re-examine the price rather than the bad news. — Howard Marks\nRisk is most dangerous when it can\'t be seen. — Howard Marks\nInvestors don\'t predict the future — they make the odds favorable. — Howard Marks\nAt the end of a cycle, psychology pushes prices up ahead of logic. — Howard Marks\nManage risk well and the opportunity to profit comes again. — Howard Marks\nThe same thinking as everyone else makes different results harder to achieve. — Howard Marks\nThe best buying opportunities usually come alongside the most uncomfortable news. — Howard Marks\nThe successful investor prices uncertainty, not certainty. — Howard Marks\nEven amid despair, if the price is low enough, opportunity exists. — John Templeton\nA market everyone loves may already price in too much expectation. — John Templeton\nPessimism blinds investors, but for value investors it can be a map. — John Templeton\nThe greatest discounts appear where the crowd has thrown things away. — John Templeton\nWhen markets cheer, calculate risk before counting gains. — John Templeton\nThe most unpopular market can sometimes be the best starting point. — John Templeton\nExtreme pessimism can push prices even further below value. — John Templeton\nOpportunity exists everywhere; the crowd\'s vision is always limited. — John Templeton\nBuying in fear demands not just courage but analysis. — John Templeton\nAt the end of optimism, look for margin of safety over expectation. — John Templeton\nWhen you start fighting the market, losses become the cost of ego. — Jesse Livermore\nWhen signals say you\'re wrong, exit before pride does. — Jesse Livermore\nBeing right on a big trend but exiting too early leaves the big money behind. — Jesse Livermore\nThe desire to trade every day fools traders into thinking the market is their salary. — Jesse Livermore\nWhen price is not on your side, cut risk before looking for reasons. — Jesse Livermore\nIn speculation, hope is not a plan. — Jesse Livermore\nClear out a bad position while it\'s small to see the next opportunity. — Jesse Livermore\nMarkets can move longer than any individual\'s conviction. — Jesse Livermore\nBoth the ability to sit still and the ability to get out are necessary. — Jesse Livermore\nFollow the trend but limit your losses. — Jesse Livermore\nStock prices sometimes reflect psychology before the economy. — André Kostolany\nMoney without patience struggles to survive in markets. — André Kostolany\nCrowds are usually late to get excited and late to get fearful. — André Kostolany\nThe market\'s dog runs ahead but always returns to its owner. — André Kostolany\nEven a good idea can\'t become a good investment without time. — André Kostolany\nDebt robs the investor of patience. — André Kostolany\nIn markets, what you need before money is time to endure. — André Kostolany\nCrowd emotions shake prices but can\'t dominate forever. — André Kostolany\nThe investor must be someone who doesn\'t lose direction in the noise. — André Kostolany\nThe stock market demands both a calculator and a psychology textbook. — André Kostolany\nDiversification starts from humility, not conviction. — Ray Dalio\nGood principles are most needed on bad days, not good ones. — Ray Dalio\nKnowing your weaknesses makes your portfolio more realistic. — Ray Dalio\nIn an uncertain world, don\'t bet everything on a single outcome. — Ray Dalio\nEven painful losses, if properly reviewed, become material for the next judgment. — Ray Dalio\nBefore the market, know what kind of person you are. — Ray Dalio\nMixing different risks is the skill of enduring long-term. — Ray Dalio\nInvesting that denies reality will eventually be corrected by it. — Ray Dalio\nGood decision-making relies on principles and feedback, not emotions. — Ray Dalio\nInvestors often need to design balance rather than conviction. — Ray Dalio\nFixing a wrong judgment quickly can end the loss as tuition. — George Soros\nUnderstanding market illusions lets you see opportunity and danger at once. — George Soros\nPosition size is as important as conviction. — George Soros\nThe structure of winning big when right and losing small when wrong matters. — George Soros\nInvesting demands error-correction ability over perfect prediction. — George Soros\nSurviving investors know how to change their minds. — George Soros\nMarkets can be shaken even more by participants\' beliefs. — George Soros\nEven strong conviction is dangerous without loss-limit rules. — George Soros\nThe moment you realize you\'re wrong is the most important moment. — George Soros\nMarket opportunities usually appear within imperfect information. — George Soros\nOnly those who preserve capital can catch the next trend. — Paul Tudor Jones\nAdmitting losses while they are small is the professional habit. — Paul Tudor Jones\nReducing risk is not fear — it is strategy. — Paul Tudor Jones\nHave a loss-limiting plan ready before a reason to buy. — Paul Tudor Jones\nMarkets don\'t reward ego. — Paul Tudor Jones\nGood traders survive first, then profit. — Paul Tudor Jones\nInvestors who defend well don\'t miss their chance to attack. — Paul Tudor Jones\nHolding a wrong position long is stubbornness, not analysis. — Paul Tudor Jones\nControlling risk means controlling your mind too. — Paul Tudor Jones\nAvoiding large losses is the starting point of compounding. — Paul Tudor Jones\nMarket leaders often show strength first after a bear market. — William O\'Neil & Mark Minervini\nStop-loss rules must be set by numbers, not emotions. — William O\'Neil & Mark Minervini\nIgnoring the trend can turn good analysis into losses. — William O\'Neil & Mark Minervini\nDon\'t dismiss strong stocks just because they look expensive. — William O\'Neil & Mark Minervini\nDon\'t cling to weak stocks just because they look cheap. — William O\'Neil & Mark Minervini\nGood trades don\'t come from insisting the market is wrong. — William O\'Neil & Mark Minervini\nRisk-reward ratio and loss limits can matter more than win rate. — William O\'Neil & Mark Minervini\nCharts don\'t guarantee the future, but they can give warning signals. — William O\'Neil & Mark Minervini\nStrong rallies have reasons; weak bounces have limits. — William O\'Neil & Mark Minervini\nInvestors who follow rules shake less in emotional markets. — William O\'Neil & Mark Minervini\nOwning the whole market reduces the burden of prediction. — Burton Malkiel\nDon\'t strain to predict short-term movements that are nearly random. — Burton Malkiel\nLow cost and broad diversification are the domains the investor actually controls. — Burton Malkiel\nLong-term index investing isn\'t glamorous, but it\'s consistent. — Burton Malkiel\nSimple participation often beats complex prediction. — Burton Malkiel\nUnderestimate the average and you may end up below it. — Burton Malkiel\nThe lure of market timing is great, but the success rate is low. — Burton Malkiel\nInvestors win first by reducing certain costs. — Burton Malkiel\nA diversified portfolio is a realistic answer to an uncertain future. — Burton Malkiel\nA simple strategy grows stronger when it can be maintained long-term. — Burton Malkiel\nGreat companies have competitive depth beyond their revenue. — Philip Fisher\nWhen evaluating growth companies, look at people alongside numbers. — Philip Fisher\nA company\'s quality can matter more than its stock price as time passes. — Philip Fisher\nGood management is most visible in difficult times. — Philip Fisher\nFor long-term growth stocks, long-term direction matters more than short-term disappointment. — Philip Fisher\nDeep research builds conviction, and conviction builds patience. — Philip Fisher\nSelling a great company too soon is a common mistake. — Philip Fisher\nFocusing only on growth while ignoring price can make a great company a bad investment. — Philip Fisher\nCompany culture and R&D capacity can be seeds of long-term growth. — Philip Fisher\nOnce you find a great company, look at long-term competitiveness over short-term swings. — Philip Fisher\nValue investors must find comfort in unpopular prices. — Seth Klarman\nMargin of safety expresses the investor\'s humility in numbers. — Seth Klarman\nCash is not an idle asset — it is optionality. — Seth Klarman\nInvestors who see downside risk first can wait longer for upside opportunity. — Seth Klarman\nCheap assets have reasons — distinguish value from traps. — Seth Klarman\nValue can accumulate quietly where the market ignores. — Seth Klarman\nWaiting when there are no certain opportunities is also an investment decision. — Seth Klarman\nAvoiding losses is not timidity — it is how you preserve compounding. — Seth Klarman\nThe better the mood, the more margin of safety is needed. — Seth Klarman\nA good investment must carry its defense from the moment of purchase. — Seth Klarman\nMarkets being irrational short-term creates long-term opportunities. — Joel Greenblatt\nThe principle of buying great companies cheaply is simple but hard to practice. — Joel Greenblatt\nValue investing strategies must endure tedious stretches to be rewarded. — Joel Greenblatt\nBuying high-quality businesses at low prices is the core. — Joel Greenblatt\nEven a good strategy needs stretches painful enough that people quit — that\'s what makes it last. — Joel Greenblatt\nLooking at price and quality together reduces the chance of mistakes. — Joel Greenblatt\nMarkets occasionally attach the wrong price to a great company. — Joel Greenblatt\nDiscipline not shaken by short-term results completes the strategy. — Joel Greenblatt\nA cheap-and-good company beats a merely cheap one. — Joel Greenblatt\nMore important than the formula is the resolve to stick with it. — Joel Greenblatt\nFind structures where downside is small and upside is large. — Mohnish Pabrai\nGood investment ideas must be easy to understand to endure long. — Mohnish Pabrai\nWaiting is not time without opportunity — it is time to select opportunity. — Mohnish Pabrai\nReplicating proven principles is also a great investing skill. — Mohnish Pabrai\nThe appeal of value investing is a structure that loses little and wins big. — Mohnish Pabrai\nComplex investments have more places to go wrong. — Mohnish Pabrai\nInvestors need a few good ideas, not many. — Mohnish Pabrai\nEven with uncertainty, a low enough price can create opportunity. — Mohnish Pabrai\nBig opportunities don\'t come often — be patient in between. — Mohnish Pabrai\nSimplicity in investing is a strength, not a weakness. — Mohnish Pabrai\nTrue long-term investing is spending time alongside the business. — Nick Sleep\nA great company can create value for both customers and investors as time passes. — Nick Sleep\nReducing trading frequency clarifies the ownership perspective. — Nick Sleep\nGood company culture appears later than financial statements, but lasts longer. — Nick Sleep\nLong-term holding is not just holding any company for a long time. — Nick Sleep\nIf the company\'s direction is right, short-term swings are close to noise. — Nick Sleep\nCompanies worth traveling with long-term give hints in how they treat customers. — Nick Sleep\nGreat companies expand their options as time passes. — Nick Sleep\nShort-term trading makes you watch prices; long-term holding makes you watch the business. — Nick Sleep\nInvestors should observe the business\'s accumulated value, not just its price tag. — Nick Sleep\nMarkets can shake longer than the time you can endure. — Wall Street Wisdom\nMore important than buying cheap is buying in a way you can hold. — Wall Street Wisdom\nEven the best strategy is not good if you can\'t maintain it emotionally. — Wall Street Wisdom\nTo grow profits, first make sure losses don\'t ruin the account. — Wall Street Wisdom\nMarket noise is loud, but protecting the account is a quiet principle. — Wall Street Wisdom\nCash is frustration for the impatient and opportunity for the prepared. — Wall Street Wisdom\nWhen everyone looks the same direction, check the danger on the other side. — Wall Street Wisdom\nLeverage can hurt you if you get the direction right but the timing wrong. — Wall Street Wisdom\nDiversification can reduce jackpots but also reduces the chance of ruin. — Wall Street Wisdom\nBear markets test the investor\'s mind before the portfolio. — Wall Street Wisdom\nThe more urgent the news, the slower you should place the order. — Wall Street Wisdom\nThose who keep their account long enough will see the next bull market. — Wall Street Wisdom\nProfits are possibility; limiting losses is responsibility. — Wall Street Wisdom\nBefore buying, write down the worst case before the expected return. — Wall Street Wisdom\nProbability fits investing better than certainty. — Wall Street Wisdom'**
  String get stockQuoteList;

  /// No description provided for @intelligentInvestorBookTitle.
  ///
  /// In en, this message translates to:
  /// **'My View on Intelligent Investing'**
  String get intelligentInvestorBookTitle;

  /// No description provided for @longFormBookTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminiscences of a Stock Operator'**
  String get longFormBookTitle;

  /// No description provided for @intelligentInvestorCh1Title.
  ///
  /// In en, this message translates to:
  /// **'Ch1. Investing vs. Speculation'**
  String get intelligentInvestorCh1Title;

  /// No description provided for @intelligentInvestorCh2Title.
  ///
  /// In en, this message translates to:
  /// **'Ch2. Why Most Investors Fail'**
  String get intelligentInvestorCh2Title;

  /// No description provided for @intelligentInvestorCh3Title.
  ///
  /// In en, this message translates to:
  /// **'Ch3. The Market'**
  String get intelligentInvestorCh3Title;

  /// No description provided for @intelligentInvestorCh4Title.
  ///
  /// In en, this message translates to:
  /// **'Ch4. Margin of Safety'**
  String get intelligentInvestorCh4Title;

  /// No description provided for @intelligentInvestorCh5Title.
  ///
  /// In en, this message translates to:
  /// **'Ch5. Herd Psychology and Investing'**
  String get intelligentInvestorCh5Title;

  /// No description provided for @intelligentInvestorCh6Title.
  ///
  /// In en, this message translates to:
  /// **'Ch6. Why Markets Rise in the Long Run'**
  String get intelligentInvestorCh6Title;

  /// No description provided for @intelligentInvestorCh7Title.
  ///
  /// In en, this message translates to:
  /// **'Ch7. Lessons from the Dot-com Bubble'**
  String get intelligentInvestorCh7Title;

  /// No description provided for @intelligentInvestorCh8Title.
  ///
  /// In en, this message translates to:
  /// **'Ch8. Lessons from the Financial Crisis'**
  String get intelligentInvestorCh8Title;

  /// No description provided for @intelligentInvestorCh9Title.
  ///
  /// In en, this message translates to:
  /// **'Ch9. Lessons from the COVID Crash'**
  String get intelligentInvestorCh9Title;

  /// No description provided for @intelligentInvestorCh10Title.
  ///
  /// In en, this message translates to:
  /// **'Ch10. The AI Revolution and Today\'s Market'**
  String get intelligentInvestorCh10Title;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'ja',
        'ko',
        'pt',
        'ru',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'TW':
            return AppLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
