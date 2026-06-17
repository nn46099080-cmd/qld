// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'QLD Alert';

  @override
  String get noBuyZone => 'No Buy Zone';

  @override
  String get tapToViewStrategy => 'Tap to View Strategy';

  @override
  String get buyNow => 'Buy Now';

  @override
  String get buyingInProgress => 'Buying in Progress';

  @override
  String get hold => 'Hold';

  @override
  String get navHome => 'Home';

  @override
  String get navChart => 'Chart';

  @override
  String get navExchange => 'FX';

  @override
  String get navFearGreed => 'Fear';

  @override
  String get fearGreedTitle => 'Fear & Greed';

  @override
  String get fearGreedInlineLabel => 'CNN Fear & Greed';

  @override
  String get fearGreedSubtitle => 'CNN U.S. Market Sentiment';

  @override
  String get fearGreedUnavailable => 'Fear & Greed data is unavailable.';

  @override
  String get navAlert => 'Alert';

  @override
  String get navStrategy => 'Strategy';

  @override
  String get alertRecovery10 => 'QLD recovered 10%';

  @override
  String get alertMarketOpen => 'The U.S. market has opened';

  @override
  String get alertNewHigh => 'New high reached';

  @override
  String get portfolio => 'Portfolio';

  @override
  String get portfolioAssetInput => 'Assets';

  @override
  String get portfolioClose => 'Close';

  @override
  String get exitAdDialogBack => 'Back';

  @override
  String get exitAdDialogExit => 'Exit';

  @override
  String get portfolioQldShares => 'QLD Shares';

  @override
  String get portfolioTqqqShares => 'TQQQ Shares';

  @override
  String get portfolioQldAveragePrice => 'QLD Avg Price';

  @override
  String get portfolioTqqqAveragePrice => 'TQQQ Avg Price';

  @override
  String get portfolioCashUsd => 'Cash USD';

  @override
  String get portfolioTotal => 'Total';

  @override
  String get portfolioProfitLoss => 'P/L';

  @override
  String get portfolioSharesUnit => 'shares';

  @override
  String get portfolioReturnRate => 'Return';

  @override
  String get portfolioAveragePriceShort => 'Avg Price';

  @override
  String get portfolioPriceLoading => 'price loading';

  @override
  String get portfolioToBreakeven => 'To breakeven';

  @override
  String get portfolioBreakevenCleared => 'Breakeven cleared';

  @override
  String get basePosition => 'Base Position';

  @override
  String get fromPreviousClose => 'vs Previous Close';

  @override
  String get from10yHigh => 'vs All-Time High';

  @override
  String get holdQLDPlusCash => 'QLD + 30% Cash';

  @override
  String get basePositionDescription =>
      '[ Strategy Guide ]\n\nThis strategy does not invest all assets into QLD at once.\n\nAt the beginning, only part of the assets is invested, while the rest is held in cash to prepare for major market declines.\n\nThe power of holding cash\n\nCash is not held to increase returns. It provides the psychological room to stay disciplined even during a falling market.\n\nMore important than the highest possible return is an investment system that can keep compounding until the end.\n\nExample:\n- Invest only 70% of initial assets into QLD\n- Hold the remaining 30% in cash\n\nQLD is an ETF that tracks approximately 2x the daily movement of the Nasdaq-100 Index.\n\nTherefore, in the initial state:\n2x leverage × 70% investment = approximately 1.4x overall exposure.\n\nFor example:\n- Nasdaq +1%\n→ Total assets about +1.4%\n\nWhen a major decline occurs, the cash held is used step by step for additional buying.\n\nExample:\n- Additional buying around the QLD -40% zone\n\nThis allows more shares to be accumulated at lower prices, and when the market recovers, the average entry price can be significantly reduced.\n\nAs a result, this strategy may produce higher returns during recovery phases than a simple buy-and-hold strategy.\n\nThe core of this strategy is:\n- Reduce volatility with cash during rising markets\n- Use cash to buy more during major declines and lower the average cost.';

  @override
  String get buySignalMessage => 'Buy signals will automatically appear here.';

  @override
  String get currentPrice => 'Current Price';

  @override
  String get futuresLabel => 'After-hours';

  @override
  String get tenYearHigh => 'All-Time High';

  @override
  String get buyStrategy => 'Buy Strategy';

  @override
  String get noBuyZoneTitle => 'No Buy Zone';

  @override
  String get strategyOverview => 'Strategy Overview';

  @override
  String get corePrinciple => 'Core Principle';

  @override
  String get suggestedAllocation => 'Suggested Asset Allocation';

  @override
  String get riskManagement => 'Risk Management';

  @override
  String get actionGuide => 'Action Guide';

  @override
  String get marketStable =>
      'The Nasdaq market has historically maintained a long-term upward trend driven by technological innovation and global growth companies in the United States. Based on this growth potential, ProShares Ultra QQQ (QLD) is a leveraged ETF designed to track 2x the daily performance of the Nasdaq-100 Index, making it an efficient investment vehicle during long-term bullish market conditions.\n\nHowever, due to the nature of leveraged ETFs, volatility and downside risk can increase significantly during market downturns. Therefore, disciplined risk management is more important than simple buy-and-hold strategies. Maintaining approximately 30% of total assets in cash while gradually buying during sharp declines can help lower the average entry price and maximize long-term compounded returns.\n\nIn other words, the core of the QLD strategy is to utilize leverage efficiency during bull markets while maintaining sufficient cash reserves to respond flexibly during market corrections.';

  @override
  String get noPanicSignals =>
      'The Nasdaq market is not simply a collection of companies. It operates through a continuous rebalancing and replacement mechanism that maintains competitiveness over time. Innovative companies with strong growth and profitability are added to the index, while weaker companies gradually lose weight or are removed.\n\nThis structure continuously reallocates capital toward productive and high-growth businesses, strengthening the market’s long-term growth potential. Supported by technological innovation in the United States, the expansion of global platform companies, and ongoing monetary liquidity growth, the Nasdaq has become one of the primary markets absorbing global capital flows.\n\nIn other words, the Nasdaq is not just a market that rises over time, but a structural growth system driven by constant innovation and corporate evolution. Because of these characteristics, it is widely viewed as a market with strong long-term upside potential that benefits from both technological advancement and monetary expansion.';

  @override
  String get maintainBalanced =>
      'Maintaining balanced positions and sufficient cash reserves allows for flexible responses during future market corrections.';

  @override
  String get cashReserveRule => 'Always maintain at least 30% cash reserves.';

  @override
  String get cashPsychology =>
      'Holding cash provides psychological stability and enables consistent buying opportunities during future market downturns.';

  @override
  String get allocation1 => '• Maintain core QLD positions';

  @override
  String get allocation2 =>
      '• Secure at least 30% cash by taking profits when possible';

  @override
  String get allocation3 => '• Never chase short-term price surges';

  @override
  String get allocation4 => '• Prepare for future buying opportunities';

  @override
  String get risk1 =>
      'Even strong bull markets can reverse sharply at any time.';

  @override
  String get risk2 =>
      'Lack of cash reserves can reduce flexibility during market corrections.';

  @override
  String get guide1 => '✅ Stay disciplined';

  @override
  String get guide2 => '✅ Maintain strategic cash reserves';

  @override
  String get guide3 => '✅ Focus on long-term positioning';

  @override
  String get guide4 => '❌ Avoid emotional overbuying';

  @override
  String get minus20Title => '-20% Strategy';

  @override
  String get minus20Headline => 'Start Fractional Recurring TQQQ Buys';

  @override
  String get minus20OverviewTitle => 'Strategy Overview';

  @override
  String get minus20OverviewText =>
      'This zone represents approximately a 10% correction in QQQ.\n\nSince the decline is still relatively moderate, maintaining cash reserves remains important.';

  @override
  String get minus20AllocationTitle => 'Suggested Allocation';

  @override
  String get minus20AllocationText =>
      '• Start accumulating with very small positions or simply hold\n• Proceed with slow and gradual buying\n• Avoid aggressive early entries\n• Preserve cash for larger potential declines';

  @override
  String get minus20HistoryTitle => 'Historical Recovery Data';

  @override
  String get minus20HistoryText =>
      '• Average recovery period: approximately 1–2 months\n• Nasdaq has historically rebounded frequently after -20% corrections\n• Psychological pressure is relatively lower compared to major crashes';

  @override
  String get minus20RiskTitle => 'Risk Warning';

  @override
  String get minus20RiskText =>
      'Further downside is still possible after a -20% decline.\n\nAggressive early entries may create liquidity risk during deeper corrections.';

  @override
  String get minus20GuideTitle => 'Action Guide';

  @override
  String get minus20GuideText =>
      '✅ Start slowly\n✅ Buying is not mandatory at this stage\n✅ Maintain sufficient cash reserves\n❌ Avoid emotional buying';

  @override
  String get minus30Title => '-30% Strategy';

  @override
  String get minus30Headline => 'Buy TQQQ with 20% Cash';

  @override
  String get minus30OverviewTitle => 'Strategy Overview';

  @override
  String get minus30OverviewText =>
      'This zone represents a high-opportunity accumulation phase.\n\nHistorically, Nasdaq corrections around -30% have often provided strong long-term buying opportunities.\n\nAlthough fear and volatility increase significantly at this stage, disciplined dollar-cost averaging can improve long-term returns.';

  @override
  String get minus30AllocationTitle => 'Suggested Allocation';

  @override
  String get minus30AllocationText =>
      '• Deploy approximately 20% of available cash\n• Continue gradual accumulation\n• Avoid deploying all capital too quickly\n• Maintain flexibility for deeper declines';

  @override
  String get minus30HistoryTitle => 'Historical Recovery Data';

  @override
  String get minus30HistoryText =>
      '• Average recovery period ranges from approximately 6 months to over 1 year\n• Historically, strong rebounds often followed -30% corrections\n• Volatility and psychological pressure increase significantly in this zone';

  @override
  String get minus30RiskTitle => 'Risk Warning';

  @override
  String get minus30RiskText =>
      'Markets may remain highly volatile even after a -30% decline.\n\nOvercommitting capital without cash reserves can increase both psychological and financial risks.';

  @override
  String get minus30GuideTitle => 'Action Guide';

  @override
  String get minus30GuideText =>
      '✅ Maintain disciplined accumulation\n✅ Control emotions\n✅ Preserve remaining cash\n❌ Avoid panic buying and excessive leverage';

  @override
  String get minus40Title => '-40% Strategy';

  @override
  String get minus40Headline => 'Deploy 30% Cash – TQQQ Entry Zone';

  @override
  String get minus40OverviewTitle => 'Strategy Overview';

  @override
  String get minus40OverviewText =>
      'The -40% zone is a period of extreme market fear, but it can also become an important long-term buying opportunity. Maintaining a planned strategy is more important than emotional reactions.';

  @override
  String get minus40AllocationTitle => 'Capital Allocation';

  @override
  String get minus40AllocationText =>
      'Avoid deploying all capital at once. Scale in gradually across multiple stages while preserving sufficient cash for potential further downside.';

  @override
  String get minus40HistoryTitle => 'Crash History';

  @override
  String get minus40HistoryText =>
      'Historically, markets have eventually recovered even after major crashes. Extreme fear zones have often created opportunities for long-term investors.';

  @override
  String get minus40RiskTitle => 'Psychological Risk';

  @override
  String get minus40RiskText =>
      'As declines deepen, fear and anxiety intensify. It is important to stay disciplined and avoid reacting emotionally to short-term volatility and news.';

  @override
  String get minus40GuideTitle => 'Survival Guide';

  @override
  String get minus40GuideText =>
      'Focus on long-term survival rather than predicting short-term rebounds. Avoid excessive leverage and emotional all-in positions while maintaining a consistent accumulation strategy.';

  @override
  String get minus50Title => '-50% Strategy';

  @override
  String get minus50Headline => 'Buy TQQQ with All Remaining Cash';

  @override
  String get minus50OverviewTitle => 'Deploy Remaining Cash into TQQQ';

  @override
  String get minus50OverviewText =>
      'A -50% decline represents an extreme market fear environment. Most investors experience panic during this phase, and volatility can remain exceptionally high.';

  @override
  String get minus50AllocationTitle => 'Capital Allocation';

  @override
  String get minus50AllocationText =>
      'Deploy remaining cash into TQQQ. Continue lowering the average entry price through systematic recurring purchases afterward.';

  @override
  String get minus50HistoryTitle => 'After Major Crashes';

  @override
  String get minus50HistoryText =>
      'Historically, markets have recovered over time following major crashes. The Nasdaq has structurally maintained long-term growth. Extreme fear should be viewed as opportunity rather than panic.';

  @override
  String get minus50RiskTitle => 'Psychological Pressure';

  @override
  String get minus50RiskText =>
      'Rather than feeling psychological pressure, investors should recognize this phase as a potential deep-value buying opportunity.';

  @override
  String get minus50GuideTitle => 'Survival Strategy';

  @override
  String get minus50GuideText =>
      'Accumulate TQQQ aggressively while continuously lowering the average cost basis through systematic recurring purchases.';

  @override
  String get exchangeUsdKrw => 'Dollar/Won';

  @override
  String get exchangeUsdJpy => 'Dollar/Yen';

  @override
  String get exchangeEurUsd => 'Euro/Dollar';

  @override
  String get exchangeUsdRub => 'Dollar/Ruble';

  @override
  String get exchangeUsdTwd => 'Dollar/Taiwan Dollar';

  @override
  String get exchangeUsdCny => 'Dollar/Yuan';

  @override
  String get fearGreedExtremeFear => 'Extreme Fear';

  @override
  String get fearGreedFear => 'Fear';

  @override
  String get fearGreedNeutral => 'Neutral';

  @override
  String get fearGreedGreed => 'Greed';

  @override
  String get fearGreedExtremeGreed => 'Extreme Greed';

  @override
  String get fearGreedIndicatorsTitle => '7 Fear & Greed Indicators';

  @override
  String get fearGreedFaqTitle => 'Fear & Greed Index FAQs';

  @override
  String get fearGreedWhatTitle =>
      'What is the CNN Business Fear & Greed Index?';

  @override
  String get fearGreedWhatBody =>
      'The Fear & Greed Index gauges stock market sentiment and whether stocks may be fairly priced. Excessive fear can push share prices lower, while excessive greed can push them higher.';

  @override
  String get fearGreedCalculatedTitle => 'How is Fear & Greed calculated?';

  @override
  String get fearGreedCalculatedBody =>
      'The index combines seven market indicators: momentum, price strength, price breadth, put and call options, junk bond demand, market volatility, and safe haven demand. Each indicator is weighted equally to create a 0 to 100 score.';

  @override
  String get fearGreedFrequencyTitle => 'How often is it calculated?';

  @override
  String get fearGreedFrequencyBody =>
      'Each component and the overall index update when new market data becomes available.';

  @override
  String get fearGreedUseTitle => 'How should I use it?';

  @override
  String get fearGreedUseBody =>
      'Use it as a market mood indicator. It can help you notice emotional extremes, but decisions should still be checked with price, fundamentals, risk control, and your own strategy.';

  @override
  String get strategyAdLabel => 'Ad';

  @override
  String get alertSettingsTitle => 'Alert Settings';

  @override
  String get alertHighTitle => 'New High Alert';

  @override
  String get alertHighSubtitle =>
      'Notify when a new high is reached after installation';

  @override
  String get alertMarketOpenTitle => 'Market Open Alert';

  @override
  String get alertMarketOpenSubtitle =>
      'Notify once when the U.S. regular market opens';

  @override
  String get alertStrategySettingTitle => 'Strategy Alert';

  @override
  String get alertStrategySettingSubtitle =>
      'Notify when the -20%, -30%, -40%, -50% zones change';

  @override
  String get noBuyHeadline => 'No extra buying. Keep 30% cash.';

  @override
  String get noBuyActionTitle => 'Immediate Action';

  @override
  String get noBuyActionText =>
      'Do not buy new QLD or TQQQ. Keep the existing QLD position and protect 30% cash.';

  @override
  String get noBuyCashTitle => 'Cash Rule';

  @override
  String get noBuyCashText =>
      'Cash is reserve capital for the next decline zone. Do not reduce it even if the market rises.';

  @override
  String get noBuyAvoidTitle => 'Avoid';

  @override
  String get noBuyAvoidText =>
      'Do not chase prices just because they are rising. Wait until the -20% zone appears.';

  @override
  String get noBuyNextTitle => 'Next Step';

  @override
  String get noBuyNextText =>
      'When the -20% zone is reached, prepare to start fractional recurring TQQQ buys.';

  @override
  String get minus20ActionTitle => 'Immediate Action';

  @override
  String get minus20ActionText =>
      'Start very small fractional recurring TQQQ buys. Do not put in a large amount at once.';

  @override
  String get minus20BuyRuleTitle => 'Buy Rule';

  @override
  String get minus20BuyRuleText =>
      'Use only a tiny portion of total cash. The goal is not a big entry; it is to start the rhythm.';

  @override
  String get minus20CashTitle => 'Cash Management';

  @override
  String get minus20CashText =>
      'Most cash must remain available for the -30%, -40%, and -50% zones.';

  @override
  String get minus20AvoidTitle => 'Avoid';

  @override
  String get minus20AvoidText =>
      'Do not buy TQQQ aggressively. The -20% zone is still only the early stage.';

  @override
  String get minus30ActionTitle => 'Immediate Action';

  @override
  String get minus30ActionText =>
      'Use only 20% of available cash to buy TQQQ. Check total cash before placing the order.';

  @override
  String get minus30BuyRuleTitle => 'Buy Rule';

  @override
  String get minus30BuyRuleText =>
      'If cash is \$10,000, use only \$2,000 for TQQQ and preserve the remaining 80%.';

  @override
  String get minus30AdditionalTitle => 'Additional Action';

  @override
  String get minus30AdditionalText =>
      'QLD accumulation can continue, but wait until the next zone for additional TQQQ buying.';

  @override
  String get minus30AvoidTitle => 'Avoid';

  @override
  String get minus30AvoidText =>
      'Do not spend too much cash because you expect a rebound. Act as if the -40% zone can still arrive.';

  @override
  String get minus40ActionTitle => 'Immediate Action';

  @override
  String get minus40ActionText =>
      'Use 30% of remaining cash to buy TQQQ. Exclude the amount already used at -30%.';

  @override
  String get minus40BuyRuleTitle => 'Buy Rule';

  @override
  String get minus40BuyRuleText =>
      'If remaining cash is \$8,000, use only \$2,400. The key is not using everything at once.';

  @override
  String get minus40HoldTitle => 'Holding Rule';

  @override
  String get minus40HoldText =>
      'Keep QLD and increase TQQQ only up to the planned amount. Leave cash for further downside.';

  @override
  String get minus40AvoidTitle => 'Avoid';

  @override
  String get minus40AvoidText =>
      'Do not sell existing holdings out of fear. Do not buy with all cash out of greed either.';

  @override
  String get minus50ActionTitle => 'Immediate Action';

  @override
  String get minus50ActionText =>
      'Use all remaining cash to buy TQQQ. This is the final planned cash deployment stage.';

  @override
  String get minus50BuyRuleTitle => 'Buy Rule';

  @override
  String get minus50BuyRuleText =>
      'Base the order only on actual remaining cash after excluding money already used at -30% and -40%.';

  @override
  String get minus50AfterTitle => 'Afterward';

  @override
  String get minus50AfterText =>
      'When new cash is added later, accumulate TQQQ or QLD regularly and focus on lowering average cost.';

  @override
  String get minus50AvoidTitle => 'Avoid';

  @override
  String get minus50AvoidText =>
      'Do not give up just because the loss is large. Do not use debt or short-term living money for extra buys.';

  @override
  String get alertNasdaq200Title => 'Nasdaq 100 200-Day Alert';

  @override
  String get alertNasdaq200Subtitle =>
      'Notify when Nasdaq 100 breaks below or above the 200-day line';

  @override
  String get alertNasdaq200Breakdown =>
      'Nasdaq 100 has broken below the 200-day moving average';

  @override
  String get alertNasdaq200Breakout =>
      'Nasdaq 100 has broken back above the 200-day moving average';

  @override
  String get chartGuideTitle => 'How to read this chart';

  @override
  String get chartMiniTitle => '3-month chart with 20-day and 200-day averages';

  @override
  String get chartGuideCandleTitle => '3-month candles';

  @override
  String get chartGuideCandleBody =>
      'Shows recent QLD price movement at a glance. Green means the period closed higher; red means it closed lower.';

  @override
  String get chartGuideMa200Title => '200-day line';

  @override
  String get chartGuideMa200Body =>
      'A long-term trend line. Price above it suggests strength; below it suggests checking risk and cash.';

  @override
  String get chartMa200SheetTitle => 'What is the 200-day moving average?';

  @override
  String get chartMa200SheetBody =>
      'The 200-day moving average is a long-term trend line calculated from the average closing price over roughly the last 200 trading days.\n\nMany investors watch it because it filters out short-term noise and makes the broader market direction easier to see. Price above the 200-day line is often read as a healthier long-term trend, while price below it can suggest weaker momentum or a need to review risk.\n\nIt should not be used as a standalone buy or sell signal. For a leveraged ETF like QLD, use it as a reference together with cash allocation, drawdown level, average cost, and your investing horizon.';

  @override
  String get chartMa20SheetTitle => 'What is the 20-day moving average?';

  @override
  String get chartMa20SheetBody =>
      'The 20-day moving average is a short-term trend line calculated from the average closing price over roughly the last 20 trading days.\n\nMany investors watch it because it reacts faster than the 200-day line and helps show recent momentum. Price staying above the 20-day line can suggest short-term strength, while repeated breaks below it can mean the recent trend is weakening.\n\nFor QLD, the 20-day line is useful for reading short-term speed and volatility, but it can produce many false signals. It works best when compared with the 200-day line, cash level, and your planned buying zones.';

  @override
  String get alertPortfolioCashTitle => 'Cash Rebalancing Alert';

  @override
  String get alertPortfolioCashSubtitle =>
      'Notify when cash falls below 20% after stocks rise';

  @override
  String get alertPortfolioCashHigh =>
      'Cash ratio is below 20%. Consider rebalancing to rebuild cash.';

  @override
  String get alertPortfolioCashLow =>
      'Cash ratio is below 20%. Consider rebalancing to rebuild cash.';

  @override
  String get alertAnnouncementTitle => 'Announcement Notifications';

  @override
  String get alertAnnouncementSubtitle =>
      'Receive announcements from QLD DIP ALERT as push notifications';

  @override
  String get alertDetailTitle => 'Alert Details';

  @override
  String get alertDetailOpenStrategy => 'Open Strategy';

  @override
  String get alertDetailRecovery =>
      'The decline zone has improved. Review your portfolio calmly and avoid rushed selling or buying.';

  @override
  String get alertDetailNewHigh =>
      'A new high has been recorded after installation. This becomes the new reference point for future decline calculations.';

  @override
  String get alertDetailMarketOpen =>
      'The U.S. regular market has opened. Check prices and strategy alerts only if you planned to act today.';

  @override
  String get alertDetailNasdaq200Breakdown =>
      'Nasdaq 100 moved below its 200-day moving average. This can signal weaker long-term trend conditions, so review risk and cash levels.';

  @override
  String get alertDetailNasdaq200Breakout =>
      'Nasdaq 100 moved back above its 200-day moving average. This can signal improving trend conditions, but continue following your strategy.';

  @override
  String get alertDetailPortfolioCashHigh =>
      'Cash is below the 20% guide. This often means stocks have risen and your cash buffer has become too small. Consider trimming part of the position and rebalancing toward your planned cash level.';

  @override
  String get alertDetailPortfolioCashLow =>
      'Cash is below the 20% guide. This often means stocks have risen and your cash buffer has become too small. Consider trimming part of the position and rebalancing toward your planned cash level.';

  @override
  String get alertDetailOpenLink => 'Open Link';

  @override
  String get appUpdateTitle => 'Update Available';

  @override
  String get appUpdateMessage =>
      'A newer version is available. Update now to use the latest features and fixes.';

  @override
  String get appUpdateLater => 'Later';

  @override
  String get appUpdateNow => 'Update';

  @override
  String get alertTestTitle => 'Notification Test';

  @override
  String get alertPermissionHelpTitle => 'Not receiving notifications?';

  @override
  String get alertPermissionHelpBody =>
      'If device notification permission is turned off, test notifications may not appear.';

  @override
  String get alertPermissionRequest => 'Request Permission';

  @override
  String get alertPermissionOpenSettings => 'Open Settings';

  @override
  String get holdPageTitle => 'Hold Position';

  @override
  String get holdHeadline =>
      'The planned buy has been completed. Focus on holding during the recovery.';

  @override
  String get holdPositionTitle => 'Current position';

  @override
  String get holdPositionText =>
      'Keep the QLD and TQQQ positions already purchased. Do not repeat the previous zone purchase just because the price revisits a recovered zone.';

  @override
  String get holdActionTitle => 'Action now';

  @override
  String get holdActionText =>
      'Pause additional TQQQ buying and monitor the recovery. Preserve any remaining cash for a renewed decline.';

  @override
  String get holdAvoidTitle => 'Avoid';

  @override
  String get holdAvoidText =>
      'Do not rush to sell during volatility or make an impulsive additional purchase because recovery feels certain.';

  @override
  String get holdResetTitle => 'Strategy reset';

  @override
  String get holdResetText =>
      'When QLD fully recovers to the previous high, this decline cycle is complete and the strategy returns to the initial no-buy position.';

  @override
  String get investmentCalculatorTitle => 'Expected Return Calculator';

  @override
  String get investmentCalculatorSubtitle =>
      'Simple compound calculation based on QLD\'s past average';

  @override
  String get investmentCalculatorReturnRate => '10-Year Average Return';

  @override
  String get investmentCalculatorLumpSumTitle => 'Lump sum + dip buying';

  @override
  String get investmentCalculatorAmount => 'Investment amount';

  @override
  String get investmentCalculatorYears => 'Period';

  @override
  String get investmentCalculatorExpectedValue => 'Estimated value';

  @override
  String get investmentCalculatorPrincipalMultiple => 'Multiple of principal';

  @override
  String get investmentCalculatorMonthlyTitle => 'Recurring investing';

  @override
  String get investmentCalculatorMonthlyAmount => 'Monthly amount';

  @override
  String get investmentCalculatorTotalPrincipal => 'Total contributed';

  @override
  String get investmentCalculatorExpectedProfit => 'Estimated profit';

  @override
  String get investmentCalculatorDisclaimer =>
      'This is a simple calculation based on past returns and does not guarantee future returns.';

  @override
  String get investmentCalculatorYearsSuffix => 'yr';

  @override
  String get investmentCalculatorTimesSuffix => 'x';

  @override
  String get investmentCalculatorChartHint =>
      'You can review the average return against the historical chart.';

  @override
  String get investmentCalculatorCurrencySectionTitle => 'Currency conversion';

  @override
  String get investmentCalculatorCurrency => 'Country/Currency';

  @override
  String get investmentCalculatorExchangeRate => '1 USD rate';

  @override
  String get investmentCalculatorExchangeRateHint =>
      'Enter how much 1 USD is worth in the selected currency.';

  @override
  String get investmentCalculatorConvertedLumpSum => 'Converted lump-sum value';

  @override
  String get investmentCalculatorConvertedMonthly =>
      'Converted recurring value';

  @override
  String get investmentCurrencyUnitedStatesUsd => 'United States USD';

  @override
  String get investmentCurrencyKoreaKrw => 'Korea KRW';

  @override
  String get investmentCurrencyJapanJpy => 'Japan JPY';

  @override
  String get investmentCurrencyChinaCny => 'China CNY';

  @override
  String get investmentCurrencyTaiwanTwd => 'Taiwan TWD';

  @override
  String get investmentCurrencyGermanyEur => 'Germany EUR';

  @override
  String get investmentCurrencyFranceEur => 'France EUR';

  @override
  String get investmentCurrencySpainEur => 'Spain EUR';

  @override
  String get investmentCurrencyPortugalEur => 'Portugal EUR';

  @override
  String get investmentCurrencyRussiaRub => 'Russia RUB';
}
