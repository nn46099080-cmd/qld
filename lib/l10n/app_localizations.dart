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

  /// No description provided for @noBuyZone.
  ///
  /// In en, this message translates to:
  /// **'No Buy Zone'**
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
  /// **'QLD + 30% Cash'**
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
  /// **'No Buy Zone'**
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
  /// **'Start Weekly 1% Cash TQQQ Accumulation'**
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
  /// **'Use only 1% of total cash once a week to accumulate fractional TQQQ shares. Do not put in a large amount at once.'**
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
  /// **'Most cash must remain available for the -30%, -40%, and -50% zones. Even after planned cash is fully used at -50%, new cash can keep lowering the average through weekly accumulation.'**
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

  /// No description provided for @contentNumberGuess.
  ///
  /// In en, this message translates to:
  /// **'Number Guess'**
  String get contentNumberGuess;

  /// No description provided for @contentBookReader.
  ///
  /// In en, this message translates to:
  /// **'Book Reader'**
  String get contentBookReader;

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
  /// **'First, tap the Base Position card on the main screen and read how to prepare. Also tap the Strategy tab at the bottom right to understand the detailed strategy.'**
  String get usageGuideNoBuyBody;

  /// No description provided for @usageGuideStrategyTitle.
  ///
  /// In en, this message translates to:
  /// **'2. Check the automatic decline-zone strategy'**
  String get usageGuideStrategyTitle;

  /// No description provided for @usageGuideStrategyBody.
  ///
  /// In en, this message translates to:
  /// **'The third card on the main screen automatically calculates how far QLD is below its all-time high. The matching strategy is shown automatically, and alerts arrive when conditions are met.'**
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
