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
  String get menuThemeTitle => 'Theme';

  @override
  String get menuLanguageTitle => 'Language';

  @override
  String get menuThemeLight => 'White';

  @override
  String get menuThemeDark => 'Dark';

  @override
  String get noBuyZone => 'No Additional Buy Zone';

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
  String get exitAdDialogMessage =>
      'When you exit the app, a full-screen ad may be shown at most once every 3 hours. Ad revenue is used to operate the app and improve its features. Thank you.';

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
  String get holdQLDPlusCash => 'QLD 70% + Cash 30%';

  @override
  String get basePositionDescription =>
      '[ Strategy Guide ]\n\nThis strategy does not invest all assets into QLD at once.\n\nAt the beginning, only part of the assets is invested, while the rest is held in cash to prepare for major market declines.\n\nThe power of holding cash\n\nCash is not held to increase returns. It provides the psychological room to stay disciplined even during a falling market.\n\nMore important than the highest possible return is an investment system that can keep compounding until the end.\n\nExample:\n- Invest only 70% of initial assets into QLD\n- Hold the remaining 30% in cash\n\nQLD is an ETF that tracks approximately 2x the daily movement of the Nasdaq-100 Index.\n\nTherefore, in the initial state:\n2x leverage × 70% investment = approximately 1.4x overall exposure.\n\nFor example:\n- Nasdaq +1%\n→ Total assets about +1.4%\n\nWhen a major decline occurs, the cash held is used step by step for additional buying.\n\nExample:\n- Additional buying around the QLD -40% zone\n\nThis allows more shares to be accumulated at lower prices, and when the market recovers, the average entry price can be significantly reduced.\n\nAs a result, this strategy may produce higher returns during recovery phases than a simple buy-and-hold strategy.\n\nThe core of this strategy is:\n- Reduce volatility with cash during rising markets\n- Use cash to buy more during major declines and lower the average cost.';

  @override
  String get basePositionIntro =>
      'This base strategy does not invest everything at once. It holds QLD together with cash, reducing swings in rising markets and keeping room to buy more during major declines.';

  @override
  String get basePositionQldAllocationLabel => 'Core QLD holding';

  @override
  String get basePositionCashAllocationLabel => 'Cash reserve';

  @override
  String get basePositionCorePrinciple => 'Core Principles';

  @override
  String get basePositionCashTitle => 'Cash is not money that lowers returns';

  @override
  String get basePositionCashText =>
      'It is safety room for staying disciplined in major declines and buying more at lower prices.';

  @override
  String get basePositionInitialLeverageTitle =>
      'Initial movement is about 1.4x';

  @override
  String get basePositionInitialLeverageText =>
      'QLD tracks roughly 2x the Nasdaq-100. Holding only 70% of assets in QLD lowers total portfolio movement to about 1.4x.';

  @override
  String get basePositionStepLeverageTitle =>
      'Leverage rises step by step in drawdowns';

  @override
  String get basePositionStepLeverageText =>
      'From the -20% to -30% zones, adding TQQQ can lift total movement to about 1.8x. In the deepest drawdown zones, it can rise toward about 2.3x.';

  @override
  String get basePositionLowAverageTitle =>
      'More fear means a lower average cost';

  @override
  String get basePositionLowAverageText =>
      'This app is structured to use cash to average down into TQQQ as drawdowns deepen. Building shares near low zones can make the later rebound work harder for returns.';

  @override
  String get basePositionSummaryTitle => 'Summary';

  @override
  String get basePositionSummaryText =>
      'The goal is not to guess the highest return. It is to keep a plan through drawdowns and let compounding continue for longer.';

  @override
  String get buySignalMessage => 'Buy signals will automatically appear here.';

  @override
  String get checkStrategyCard =>
      'Check the strategy card for your current zone.';

  @override
  String get strategyCardLabel => 'Strategy Card';

  @override
  String get currentPrice => 'Current Price';

  @override
  String get futuresLabel => 'After-hours';

  @override
  String get tenYearHigh => 'All-Time High';

  @override
  String get buyStrategy => 'Buy Strategy';

  @override
  String get noBuyZoneTitle => 'No Additional Buy Zone';

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
  String get minus20Headline =>
      'Start Weekly 1% of Total Cash TQQQ Accumulation';

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
  String get alertSettingsCloseBasisNote =>
      'Alerts are sent based on closing prices.';

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
      'Start buying TQQQ weekly at 1% of your cash holdings.\nEx) \$500 cash → buy \$5 per week';

  @override
  String get minus20BuyRuleTitle => 'Purpose';

  @override
  String get minus20BuyRuleText =>
      'This setup starts in the -20% zone so that, if the market moves sideways, small recurring buys can gradually lower the TQQQ average cost. The point is not to time an immediate profit, but to build a lower cost basis.';

  @override
  String get minus20CashTitle => 'Cash Management';

  @override
  String get minus20CashText =>
      'Most cash must remain available for the -30%, -40%, and -50% zones. Even after planned cash is fully used at -50%, new cash can keep lowering the average through weekly accumulation.\n\nEven if the market moves sideways for 10 or more weeks, continue accumulating 1% of total cash every week. The longer the sideways movement, the more shares you build up — there is no reason to stop.\n\nWhen the -30% zone is reached, make a single additional purchase using 20% of the remaining cash at that point. The weekly accumulation does not stop — it continues alongside the -30% strategy. Accumulation ends only when the previous high is recovered and rebalancing takes place.';

  @override
  String get minus20AvoidTitle => 'Exit Plan';

  @override
  String get minus20AvoidText =>
      'Do not sell these TQQQ shares on every short rebound. Treat them as part of the position to close later when a new high is reached and the TQQQ position is being trimmed.';

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
  String get rebalanceTitle => 'Rebalancing Zone';

  @override
  String get rebalanceHeadline => 'Sell TQQQ and return to base position';

  @override
  String get rebalanceOverviewTitle => 'Strategy Overview';

  @override
  String get rebalanceOverviewText =>
      'All-time high recovery signals the end of the crisis response phase. It is time to sell the TQQQ accumulated in the -20% or lower zones and return to the base position (QLD 70%, Cash 30%).';

  @override
  String get rebalanceActionTitle => 'Immediate Action';

  @override
  String get rebalanceActionText =>
      'Sell all TQQQ accumulated or purchased in the -20% or lower zones. Then rebalance your assets according to the base position allocation.';

  @override
  String get rebalanceCashTitle => 'Cash Target';

  @override
  String get rebalanceCashText =>
      'After rebalancing, maintain QLD 70% and Cash 30%. Keep the secured cash as a reserve for the next downturn.';

  @override
  String get rebalanceAvoidTitle => 'What to Avoid';

  @override
  String get rebalanceAvoidText =>
      'Do not continue TQQQ accumulation after the all-time high recovery. Sell the positions accumulated during the crisis phase at this stage and return to the base position.';

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

  @override
  String get contentTitle => 'Contents';

  @override
  String get contentInquiry => 'Inquiries';

  @override
  String get contentInquirySubtitle =>
      'Leave an anonymous inquiry and check the reply.';

  @override
  String get contentInquiryBadge => 'Q&A';

  @override
  String get contentCloseGuess => 'Close Guess';

  @override
  String get contentStockQuote => 'Stock Quotes';

  @override
  String get contentStockQuoteSubtitle =>
      'A short quote to sharpen your investment instincts.';

  @override
  String get contentStockQuoteBadge => 'Daily';

  @override
  String get contentNumberGuess => 'Number Guess';

  @override
  String get contentNumberGuessSubtitle =>
      'A light probability mini-game to enjoy casually.';

  @override
  String get contentNumberGuessBadge => 'Game';

  @override
  String get contentBookReader => 'Column';

  @override
  String get contentBookReaderSubtitle =>
      'Public-domain texts you can read at a relaxed pace.';

  @override
  String get contentBookReaderBadge => 'Read';

  @override
  String get contentStockMeme => 'Stock Meme';

  @override
  String get contentLottoNumbers => 'Lotto Numbers';

  @override
  String get contentJumpDodge => 'Jump Dodge Game';

  @override
  String get contentJumpDodgeSubtitle =>
      'A jump mini-game for short focused sessions.';

  @override
  String get contentJumpDodgeBadge => 'Action';

  @override
  String get stockQuoteTitle => 'Stock Quotes';

  @override
  String get stockQuoteTapHint => 'Tap to see another quote.';

  @override
  String get stockQuoteShuffle => 'Another quote';

  @override
  String get usageGuideTitle => 'How to use';

  @override
  String get usageGuideSubtitle =>
      'A rule-based guide for long-term Nasdaq 2x leverage';

  @override
  String get usageGuideCardTitle => 'How to use';

  @override
  String get usageGuideCardSubtitle =>
      'Base position, decline zones, trade records, indicators';

  @override
  String get usageGuideWhatAppTitle => 'What is this app?';

  @override
  String get usageGuideWhatAppBody =>
      'This app is a rule-based guide for investors using long-term upward Nasdaq 2x leverage.\n\nIt automatically calculates the current drawdown from the all-time high so you can see where the market stands, then provides a strategy for each zone.\n\nIt helps you stay with planned investment rules without being shaken by market fear or greed.';

  @override
  String get usageGuideNoBuyTitle =>
      '1. Read the base position and strategy first';

  @override
  String get usageGuideNoBuyBody =>
      'First, tap the Base Position card on the main screen and read how to prepare. Also tap the Strategy tab at the bottom right to understand the detailed strategy.\n\n* Buy QLD with 70% of your total holding funds.';

  @override
  String get usageGuideStrategyTitle =>
      '2. Check the automatic decline-zone strategy';

  @override
  String get usageGuideStrategyBody =>
      'The Strategy Card on the main screen automatically shows the matching zone whenever QLD drops a certain percentage below its all-time high. Tap the card to make the corresponding purchase or rebalance. Alerts also arrive when conditions are met.';

  @override
  String get usageGuideIndicatorsTitle => 'Four support indicators';

  @override
  String get usageGuideIndicatorsBody =>
      'CNN F&G shows whether market sentiment is closer to fear or greed.\n\nVIX shows market volatility. A higher number usually means more market anxiety.\n\nMajor U.S. events include NFP, CPI, and FOMC. NFP tracks employment, CPI tracks inflation, and FOMC shows the interest-rate direction. These events can move Nasdaq and QLD sharply.\n\nThe 10-year Treasury yield is the U.S. 10-year bond rate. A fast rise can pressure growth stocks, Nasdaq, and QLD.';

  @override
  String get usageGuideQldTitle => '3. Buy through your broker and record it';

  @override
  String get usageGuideQldBody =>
      'Use the displayed strategy and amount as a guide, then buy in your own brokerage app. After buying, record shares, average price, and cash in the app portfolio.';

  @override
  String get usageGuideDisclaimer =>
      'This app is for investment reference only and does not guarantee profit.';

  @override
  String get usageGuideConfirm => 'OK';

  @override
  String get bookReadingTitle => 'Column';

  @override
  String bookReaderPageNumber(int page) {
    return 'Page $page';
  }

  @override
  String get numGuessPrompt => 'Guess a number between 1 and 1000.';

  @override
  String get numGuessInvalidInput =>
      'Please enter a number between 1 and 1000.';

  @override
  String numGuessCorrect(int attempts) {
    return 'Correct! You got it in $attempts tries.';
  }

  @override
  String get numGuessTooLow => 'The number is higher.';

  @override
  String get numGuessTooHigh => 'The number is lower.';

  @override
  String numGuessAttemptsLabel(int count) {
    return 'Attempts: $count';
  }

  @override
  String numGuessLastGuessLabel(int number) {
    return 'Your guess: $number';
  }

  @override
  String get numGuessInputHint => 'Enter number';

  @override
  String get numGuessConfirm => 'Confirm';

  @override
  String get numGuessNewGame => 'New Game';

  @override
  String get numGuessRanking => 'Ranking';

  @override
  String get numGuessNoRecords => 'No records yet.';

  @override
  String numGuessAttemptCount(int count) {
    return '$count tries';
  }

  @override
  String get jumpLeaderboard => 'Leaderboard';

  @override
  String get jumpScore => 'Score';

  @override
  String get jumpPersonalBest => 'Personal Best';

  @override
  String get jumpTapToRestart => 'Tap to restart';

  @override
  String get jumpTapToStart => 'Tap to start';

  @override
  String get jumpInstruction => 'Tap the screen to jump and avoid obstacles.';

  @override
  String get inquiryLoadError => 'Failed to load inquiries.';

  @override
  String get inquiryAdminOnlyReply => 'Only admins can submit replies.';

  @override
  String get inquiryReplyEmpty => 'Please enter a reply.';

  @override
  String get inquiryReplyError =>
      'Failed to submit reply. Please try again later.';

  @override
  String get inquiryAdminOnlyPin => 'Only admins can pin.';

  @override
  String get inquiryPinError => 'Failed to save pin status.';

  @override
  String get inquiryAdminOnlyDelete => 'Only admins can delete.';

  @override
  String get inquiryDeleteTitle => 'Delete Inquiry';

  @override
  String get inquiryDeleteConfirm => 'Delete this inquiry?';

  @override
  String get inquiryCancel => 'Cancel';

  @override
  String get inquiryDeleteAction => 'Delete';

  @override
  String get inquiryDeleteError => 'Failed to delete. Please try again later.';

  @override
  String get inquiryContentEmpty => 'Please enter your inquiry.';

  @override
  String get inquirySubmitError =>
      'Failed to submit inquiry. Please try again later.';

  @override
  String get inquiryAdminLabel => 'Admin';

  @override
  String get inquiryPasswordLabel => 'Password';

  @override
  String get inquiryPasswordWrong => 'Incorrect password.';

  @override
  String get inquiryAdminActivatedRegistered =>
      'Admin mode enabled (device registered)';

  @override
  String get inquiryAdminActivatedFailed =>
      'Admin mode enabled (device registration failed)';

  @override
  String get inquiryContentDetailLabel => 'Inquiry';

  @override
  String get inquiryAdminReplyLabel => 'Admin Reply';

  @override
  String get inquiryAdminReplyEdit => 'Edit Reply';

  @override
  String get inquirySaving => 'Saving...';

  @override
  String get inquirySubmitReply => 'Submit Reply';

  @override
  String get inquiryPrevPage => 'Previous page';

  @override
  String get inquiryNextPage => 'Next page';

  @override
  String inquiryPageOf(int current, int total) {
    return 'Page $current / $total';
  }

  @override
  String get inquiryUnpin => 'Unpin';

  @override
  String get inquiryPin => 'Pin to top';

  @override
  String get inquiryListTitle => 'Inquiry List';

  @override
  String get inquiryEmpty => 'No inquiries yet.';

  @override
  String get inquiryWriteTitle => 'Write Inquiry';

  @override
  String get inquiryContentFieldLabel => 'Content';

  @override
  String get inquirySubmitting => 'Submitting...';

  @override
  String get inquirySubmitButton => 'Submit';

  @override
  String get inquiryUserReplyLabel => 'Add a follow-up message...';

  @override
  String get indicatorCnnFearGreed => 'CNN Fear & Greed';

  @override
  String get indicatorVix => 'VIX Volatility';

  @override
  String get indicatorUsSchedule => 'Major U.S. Events';

  @override
  String get indicatorTenYearYield => 'U.S. 10Y Yield';

  @override
  String get indicatorUsMarketTime => 'U.S. Market Time';

  @override
  String get indicatorVixHigh => 'High volatility';

  @override
  String get indicatorVixStable => 'Normal zone';

  @override
  String get indicatorVixDefault => 'Market anxiety index';

  @override
  String get indicatorVixLow => 'Very low volatility';

  @override
  String get indicatorVixCaution => 'Caution zone';

  @override
  String get indicatorTenYearDesc => '10-year bond rate';

  @override
  String get marketWeekendLabel => 'Weekend · To Open';

  @override
  String get marketPreOpenLabel => 'To Open';

  @override
  String get marketToCloseLabel => 'To Close';

  @override
  String get marketClosedLabel => 'Market Closed';

  @override
  String get marketClosedValue => 'Closed';

  @override
  String get noData => 'No data';

  @override
  String get rsiOverbought => 'Overbought';

  @override
  String get rsiOversold => 'Oversold';

  @override
  String get rsiNormal => 'Neutral';

  @override
  String get rsiOverboughtZone => 'Overbought zone';

  @override
  String get rsiOversoldZone => 'Oversold zone';

  @override
  String get rsiNormalZone => 'Normal range';

  @override
  String get rsiOverboughtOversold => 'Overbought / Oversold';

  @override
  String get coverStrategyTab => 'Strategy Tab';

  @override
  String get coverStrategyHint => 'Swipe up to view the Strategy Tab';

  @override
  String get usScheduleSheetTitle => 'US Major Schedule';

  @override
  String get noScheduleLeft => 'No schedules registered';

  @override
  String get scheduleNameHint => 'Event name';

  @override
  String get adminPassword => 'Admin password';

  @override
  String get addSchedule => 'Add schedule';

  @override
  String get wrongPassword => 'Incorrect password.';

  @override
  String get checkScheduleNameAndDate =>
      'Please check the event name and date.';

  @override
  String get editSchedule => 'Edit schedule';

  @override
  String get rsiDialogTitle => 'What is RSI(14)?';

  @override
  String get rsiDialogContent =>
      'RSI (Relative Strength Index) is an indicator that compares gains and losses over the past 14 days to show whether the current stock price is overbought or oversold, on a scale of 0–100.\n\n• 70 or above → Overbought zone\n  High chance of short-term correction after rapid rise.\n\n• 30 or below → Oversold zone\n  Possible rebound after sharp short-term drop.\n\n• 30–70 → Normal range\n  No overbought or oversold signal.';

  @override
  String get inquiryEditMessageTitle => 'Edit Message';

  @override
  String get inquiryEditMessageSave => 'Save';

  @override
  String get inquiryTapToEdit => 'Tap to edit';

  @override
  String get stockQuoteList =>
      'Be fearful when others are greedy, and greedy when others are fearful. — Warren Buffett\nPrice is what you pay. Value is what you get. — Warren Buffett\nIt\'s far better to buy a wonderful company at a fair price. — Warren Buffett\nNever invest in a business you cannot understand. — Warren Buffett\nRisk comes from not knowing what you\'re doing. — Warren Buffett\nOur favorite holding period is forever. — Warren Buffett\nIt takes 20 years to build a reputation and five minutes to ruin it. — Warren Buffett\nMarket fluctuations are not a threat but an opportunity. — Warren Buffett\nOnly when the tide goes out do you discover who\'s been swimming naked. — Warren Buffett\nThe investor should focus on avoiding big mistakes rather than hitting home runs. — Warren Buffett\nStay within your circle of competence and mistakes decrease. — Warren Buffett\nBuying a stock means buying a piece of a business, not a piece of paper. — Warren Buffett\nOnly buy something you\'d be perfectly happy to hold if the market closed for 10 years. — Warren Buffett\nFocus on a company\'s long-term earnings power, not short-term price. — Warren Buffett\nA great business structure often matters more than great management. — Warren Buffett\nChoose the simple and certain over the complex and uncertain. — Warren Buffett\nInvesting in yourself may be the best investment of all. — Warren Buffett\nPatient judgment that can endure beats impulsive trading. — Warren Buffett\nYou don\'t have to swing at every pitch. Wait for the right one. — Warren Buffett\nTemperament matters more than IQ in investing. — Warren Buffett\nA great business reveals its value more and more over time. — Warren Buffett\nUnderstanding a good business well matters more than buying it cheaply. — Warren Buffett\nLook at a company\'s cash flow, not the market\'s noise. — Warren Buffett\nDebt-fueled investing makes even sound judgment dangerous. — Warren Buffett\nCash lets you act when opportunity arrives. — Warren Buffett\nBig money is made not by frequent trading but by patient waiting. — Charlie Munger\nInvert, always invert — avoid foolish mistakes rather than trying to be clever. — Charlie Munger\nWhen a problem is hard to solve, try working backwards. — Charlie Munger\nReputation and integrity can disappear in an instant. — Charlie Munger\nOwning a great business for a long time is the key to compounding. — Charlie Munger\nUnderstanding incentives helps you understand human behavior. — Charlie Munger\nThe more you act, the more chances you create for mistakes. — Charlie Munger\nInvesting requires the ability to wait. — Charlie Munger\nGood judgment comes from connecting knowledge across many fields. — Charlie Munger\nA quality business makes time your ally as an investor. — Charlie Munger\nWhen opportunities are rare, the prepared person has the advantage. — Charlie Munger\nTry to be a little less foolish each day rather than a little smarter. — Charlie Munger\nSuccess comes from maintaining fundamentals, not from complex formulas. — Charlie Munger\nGood investments feel uncomfortable to the impatient. — Charlie Munger\nYou don\'t need to learn from every mistake yourself — learn from others\'. — Charlie Munger\nOutstanding results come from acting boldly on rare opportunities. — Charlie Munger\nBeware the mistake of paying too much even for a great business. — Charlie Munger\nThe most dangerous words in investing are \'I sort of know.\' — Charlie Munger\nMaintaining simplicity helps long-term performance. — Charlie Munger\nTo beat the market, first beat your own impulses. — Charlie Munger\nMargin of safety is the investor\'s shield. — Benjamin Graham\nIn the short run, the market is a voting machine; in the long run, a weighing machine. — Benjamin Graham\nThe intelligent investor sells to optimists and buys from pessimists. — Benjamin Graham\nPrice movements are suggestions, not commands. — Benjamin Graham\nInvestment must be based on analysis; speculation relies on expectation. — Benjamin Graham\nDon\'t be ruled by Mr. Market\'s moods — exploit them. — Benjamin Graham\nBuying well below value is how you prepare for your own mistakes. — Benjamin Graham\nThe principle of avoiding loss comes before the principle of making profits. — Benjamin Graham\nMarkets are sometimes irrational, but value is ultimately reflected. — Benjamin Graham\nThe more uncertain the situation, the larger the margin of safety required. — Benjamin Graham\nThe investor must calculate value before price. — Benjamin Graham\nGood analysis comes from calm, not excitement. — Benjamin Graham\nThe defensive investor avoids overconfidence. — Benjamin Graham\nExpected return without principle is closer to speculation than investment. — Benjamin Graham\nMarket whims can become the long-term investor\'s friend. — Benjamin Graham\nBeing cheap alone is not enough — you need value and margin of safety. — Benjamin Graham\nTrust numbers and value over crowd emotions. — Benjamin Graham\nThose who admit they can be wrong survive longer. — Benjamin Graham\nThe first question in investing is not how much can I earn, but how much can I lose. — Benjamin Graham\nA good investment is a decision backed by sufficient analysis and sufficient margin of safety. — Benjamin Graham\nKnow what you own and why you own it. — Peter Lynch\nStocks are not lottery tickets — they are pieces of a business. — Peter Lynch\nIf a company does well, the stock will eventually follow. — Peter Lynch\nYou can find investment ideas in places you already understand. — Peter Lynch\nInvesting without research is like playing poker without looking at your cards. — Peter Lynch\nDownturns repeat — the question is whether you can endure them. — Peter Lynch\nGuts matter as much as knowledge in the stock market. — Peter Lynch\nEven a good stock needs revisiting when its story changes. — Peter Lynch\nNot every stock needs to succeed — one big winner can transform a portfolio. — Peter Lynch\nThe company\'s story comes before the stock price. — Peter Lynch\nEven in a business you know well, check the numbers. — Peter Lynch\nRather than predicting the market, focus on finding great companies. — Peter Lynch\nIndividual investors can discover great companies through everyday life. — Peter Lynch\nAn unpopular great company can offer larger opportunity. — Peter Lynch\nIf you\'re not prepared for a sharp drop, reduce your stock exposure. — Peter Lynch\nDon\'t fall in love with a stock — track the company\'s performance. — Peter Lynch\nThe biggest mistake is pretending to know what you don\'t know. — Peter Lynch\nA good investment idea doesn\'t require a complex explanation. — Peter Lynch\nDon\'t assume a stock is cheap just because the price has fallen. — Peter Lynch\nRevisit a growth stock the moment its growth story breaks down. — Peter Lynch\nThe winning formula in investing is to hold broadly and endure long. — John Bogle\nStay the course — don\'t change your plan because of market noise. — John Bogle\nDon\'t look for the needle in the haystack. Just buy the haystack. — John Bogle\nCosts are a certain drag; returns are uncertain. — John Bogle\nTime is your friend, impulse is your enemy. — John Bogle\nSpeculation leads with emotion; investing reduces it. — John Bogle\nLong-term investors don\'t need to predict the market. — John Bogle\nLow cost is the most powerful variable an investor can control. — John Bogle\nOwning the whole market reduces individual stock mistakes. — John Bogle\nThe ability to do nothing is an investor\'s competitive edge. — John Bogle\nSimple index funds outlast complex products. — John Bogle\nChasing returns can lower your returns. — John Bogle\nYou can\'t know the future, but you can lower your costs. — John Bogle\nDiversification, low cost, and long holding are the basics. — John Bogle\nOver time, markets reflect the performance of the entire economy. — John Bogle\nThe more often you check, the more reasons you find to be shaken. — John Bogle\nMaintain your investment plan with principle, not emotion. — John Bogle\nBoring investing can produce the strongest results. — John Bogle\nConsistently earning the market average is a powerful strategy. — John Bogle\nCosts and emotions are the biggest enemies of long-term investing. — John Bogle\nSuperior investing starts with thinking differently and more deeply than others. — Howard Marks\nRisk is not volatility but the possibility of permanent loss. — Howard Marks\nYou can\'t eliminate risk, but you can manage it. — Howard Marks\nThe higher the price, the smaller the margin of safety on future returns. — Howard Marks\nInvestors who ignore cycles are repeatedly surprised. — Howard Marks\nEven a great asset becomes a bad investment if bought too dearly. — Howard Marks\nIn investing, the asymmetry of gains and losses matters more than frequency of being right. — Howard Marks\nDefense must be prepared before the bear market arrives. — Howard Marks\nThe more consensus there is, the more reason there is to think differently. — Howard Marks\nProfits emerge when you understand the gap between price and value. — Howard Marks\nSuccessful investing is playing the probability game well. — Howard Marks\nA too-comfortable environment makes risk look cheap. — Howard Marks\nMarket psychology can drive prices far from value. — Howard Marks\nConservative investing isn\'t about missing opportunities — it\'s about raising survival odds. — Howard Marks\nRisk management is most needed when returns are good. — Howard Marks\nSecond-level thinking is the ability to interpret what everyone sees differently. — Howard Marks\nThe best buys rarely come at the most comfortable moments. — Howard Marks\nNot seeing risk is the greatest risk. — Howard Marks\nAs the market approaches extremes, caution becomes more important. — Howard Marks\nInvesting is not a game of certainty but of probability. — Howard Marks\nThe time of maximum pessimism is the best time to buy. — John Templeton\nThe time of maximum optimism is the best time to sell. — John Templeton\nBull markets are born in pessimism, grow in skepticism, and mature in optimism. — John Templeton\nWhen euphoria dominates the market, the bull market becomes dangerous. — John Templeton\nThe best opportunities are found where others look away. — John Templeton\nYou need courage to buy when others are selling. — John Templeton\nFour of the most dangerous words in investing are \'this time it\'s different.\' — John Templeton\nWherever in the world there is cheap value, you should be able to find it. — John Templeton\nPessimism drives prices down, and lower prices create opportunity. — John Templeton\nCalmly examine assets the crowd dislikes. — John Templeton\nBe an optimist, but be cold-eyed about prices. — John Templeton\nGreat opportunities start outside the crowd\'s attention. — John Templeton\nThe worst news doesn\'t always mean the worst investment. — John Templeton\nIf the price is low enough, even uncertainty can be rewarded. — John Templeton\nThose who buy in pessimism should be ready to sell in optimism. — John Templeton\nMarkets make their biggest mistakes at the extremes of emotion. — John Templeton\nOpportunity comes more from uncomfortable places than comfortable ones. — John Templeton\nGoing against the crowd requires both evidence and courage. — John Templeton\nLong-term returns can begin from decisions made at the most unpopular moment. — John Templeton\nThe investor is not someone who avoids fear but someone who analyzes it. — John Templeton\nBig money came not from being right but from enduring to the end. — Jesse Livermore\nThe market is never wrong; opinions are. — Jesse Livermore\nThe urge to always be doing something creates many losses. — Jesse Livermore\nLosses must be admitted while they are small. — Jesse Livermore\nIf the trend is alive, there\'s no reason to exit prematurely. — Jesse Livermore\nBeing right but unable to endure means big money stays out of reach. — Jesse Livermore\nThinking you must profit every day destroys a trader. — Jesse Livermore\nAdding to a losing position is a dangerous habit. — Jesse Livermore\nDon\'t try to argue with the market — listen to it. — Jesse Livermore\nEgo in front of price movement becomes a cost. — Jesse Livermore\nWhat matters more than when to buy is knowing when you\'re wrong. — Jesse Livermore\nBig trends reward those who endure. — Jesse Livermore\nEven good judgment can collapse from impatient liquidation. — Jesse Livermore\nMarkets don\'t care about an individual\'s hopes. — Jesse Livermore\nFrequent trading creates more mistakes than opportunities. — Jesse Livermore\nBig money comes to those who know how to sit quietly. — Jesse Livermore\nTo survive speculation, first limit your losses. — Jesse Livermore\nDon\'t ignore the direction the price is signaling. — Jesse Livermore\nMore important than conviction is the ability to exit when wrong. — Jesse Livermore\nSelf-discipline in trading is as important as analytical ability. — Jesse Livermore\nStock markets are moved by money and psychology. — André Kostolany\nThe owner walks slowly, the dog runs back and forth, but they arrive together. — André Kostolany\nAn investor must have money, ideas, and patience. — André Kostolany\nThe most expensive thing in the stock market is impatience. — André Kostolany\nStep back when the crowd gets excited. — André Kostolany\nA good investor reads the market\'s mood but doesn\'t follow it. — André Kostolany\nPrices are shaken by psychology, but value needs time. — André Kostolany\nInvesting needs imagination, but it needs patience even more. — André Kostolany\nWhen you invest with borrowed money, time becomes your enemy. — André Kostolany\nStocks transfer money from impatient people to patient people. — André Kostolany\nExpecting better results while thinking like everyone else is unrealistic. — André Kostolany\nPsychology moves the market before logic on many days. — André Kostolany\nInvesting without waiting moves closer to speculation. — André Kostolany\nInvestors in a hurry struggle to endure the market\'s whims. — André Kostolany\nDeclines are painful, but they are also the language of opportunity. — André Kostolany\nLooking at the market too often puts emotion ahead of thought. — André Kostolany\nPatience is the investor\'s hidden capital. — André Kostolany\nEven a good idea can fail without enough time. — André Kostolany\nThe investor must trust their own judgment over the crowd\'s applause. — André Kostolany\nThose who survive long in markets ultimately learn the most. — André Kostolany\nPain plus reflection equals progress. — Ray Dalio\nAdmitting what you don\'t know is the beginning of risk management. — Ray Dalio\nMixing assets with low correlation can make a portfolio more stable. — Ray Dalio\nWithout principles, emotions make decisions during crises. — Ray Dalio\nThe ability to see reality as it is is the starting point for good decision-making. — Ray Dalio\nInvestors need verifiable principles, not mere conviction. — Ray Dalio\nDiversification is not hiding ignorance — it\'s acknowledging uncertainty. — Ray Dalio\nIf you don\'t know your weaknesses, the market will show you. — Ray Dalio\nA good system applies the same standard even in emotional moments. — Ray Dalio\nUnderstanding the big picture makes you less shaken by short-term noise. — Ray Dalio\nWhat matters is not whether you\'re right or wrong, but how much you make when right and how little you lose when wrong. — George Soros\nMarkets don\'t just reflect reality — they also influence it. — George Soros\nThe ability to quickly admit you\'re wrong is a powerful weapon. — George Soros\nSurvival comes first; profits come second. — George Soros\nAs conviction grows, check the counter-case too. — George Soros\nMarket illusions can persist for a long time. — George Soros\nGood investors correct their errors quickly. — George Soros\nThe danger is not being wrong but staying wrong. — George Soros\nThe bigger the opportunity, the more important position management becomes. — George Soros\nInvesting means making decisions under imperfect information. — George Soros\nDefense before offense. — Paul Tudor Jones\nAdding to a losing position creates ever-greater danger. — Paul Tudor Jones\nPreserve capital and the next opportunity will come. — Paul Tudor Jones\nDon\'t try to be a hero in the market. — Paul Tudor Jones\nThe ability to keep losses small builds long-term performance. — Paul Tudor Jones\nWhen price moves against you, cut risk first. — Paul Tudor Jones\nAvoiding big losses comes before seeking big gains. — Paul Tudor Jones\nEgo in trading amplifies losses. — Paul Tudor Jones\nA defensive mindset is not weakness — it is a survival strategy. — Paul Tudor Jones\nAggression without loss management doesn\'t last. — Paul Tudor Jones\nCutting losses when small is the rule. — William O\'Neil & Mark Minervini\nStrong stocks are strong for a reason. — William O\'Neil & Mark Minervini\nDon\'t fight the trend. — William O\'Neil & Mark Minervini\nCharts can show danger signals faster than opinions. — William O\'Neil & Mark Minervini\nTo capture big winners, first avoid big losers. — William O\'Neil & Mark Minervini\nTrading without rules is just a record of emotions. — William O\'Neil & Mark Minervini\nFind the market\'s leaders but limit risk with numbers. — William O\'Neil & Mark Minervini\nWhat matters more than the entry is what you do when you\'re wrong. — William O\'Neil & Mark Minervini\nEven a good entry can\'t overcome poor stop-loss habits. — William O\'Neil & Mark Minervini\nIn a bull market, the strongest stocks can keep getting stronger. — William O\'Neil & Mark Minervini\nOwning the whole market reduces the burden of prediction. — Burton Malkiel\nDon\'t try to predict short-term price movements that are nearly random. — Burton Malkiel\nLow cost and broad diversification are areas investors can actually control. — Burton Malkiel\nLong-term index investing isn\'t glamorous, but it\'s consistent. — Burton Malkiel\nSimple participation often beats complex prediction. — Burton Malkiel\nDisrespect the average and you may end up below it. — Burton Malkiel\nMarket timing is tempting but rarely successful. — Burton Malkiel\nInvestors win first by cutting certain costs. — Burton Malkiel\nA diversified portfolio is a realistic answer to an uncertain future. — Burton Malkiel\nA simple strategy becomes more powerful when it can be maintained. — Burton Malkiel\nA great company has competitive depth beyond its revenue. — Philip Fisher\nWhen evaluating growth stocks, look at management and market opportunity together. — Philip Fisher\nA great company reveals its worth the longer you hold it. — Philip Fisher\nTo understand a company, research every voice around it. — Philip Fisher\nSelling can be a harder decision than buying. — Philip Fisher\nLong-term growth companies give you reasons to endure short-term volatility. — Philip Fisher\nGood management creates value that numbers don\'t show. — Philip Fisher\nLook at both growth potential and price together. — Philip Fisher\nIf you don\'t understand a company\'s quality, long holding becomes unstable. — Philip Fisher\nA great company makes time the investor\'s friend. — Philip Fisher\nMargin of safety is the investor\'s language for acknowledging uncertainty. — Seth Klarman\nValue investing looks at the gap between price and value, not popularity. — Seth Klarman\nRisk can grow precisely when others feel it doesn\'t exist. — Seth Klarman\nPatience is one of the most important assets of a value investor. — Seth Klarman\nEven a cheap price needs a reason — verify it. — Seth Klarman\nThe discipline of avoiding losses is the foundation of long-term returns. — Seth Klarman\nCash may be needed because good opportunities don\'t come often. — Seth Klarman\nInvestors should rely on their own analysis, not market popularity. — Seth Klarman\nThe larger the gap between value and price, the greater the opportunity. — Seth Klarman\nConviction without margin of safety is dangerous overconfidence. — Seth Klarman\nThe principle of buying great companies cheaply is simple but not easy. — Joel Greenblatt\nWhen a high-return business meets a low price, opportunity is created. — Joel Greenblatt\nEven a simple principle fails if you can\'t stick to it. — Joel Greenblatt\nValue investing looks boring but takes time. — Joel Greenblatt\nThe market\'s short-term irrationality creates opportunities. — Joel Greenblatt\nA good strategy must be hard for everyone to follow in order to endure. — Joel Greenblatt\nWhen price is below value, the investor\'s edge appears. — Joel Greenblatt\nLook at both company quality and price together. — Joel Greenblatt\nLong term, numbers are stronger than stories. — Joel Greenblatt\nValue investing is hard to do without patience. — Joel Greenblatt\nSeek a situation where heads you win big and tails you lose small. — Mohnish Pabrai\nSimple ideas can generate great returns. — Mohnish Pabrai\nA good investor knows how to replicate the principles of great investors. — Mohnish Pabrai\nThe best investments limit the downside while leaving the upside open. — Mohnish Pabrai\nWait for clear opportunities rather than complex ones. — Mohnish Pabrai\nInvestors need fewer decisions, but better ones. — Mohnish Pabrai\nFocus on the certain opportunities that come rarely. — Mohnish Pabrai\nCalculating the chance of loss first helps you survive longer. — Mohnish Pabrai\nA good investment should have a simple explanation. — Mohnish Pabrai\nWaiting is part of value investing. — Mohnish Pabrai\nTraveling long with a great company can be the most powerful strategy. — Nick Sleep\nInvestors should be owners, not traders. — Nick Sleep\nA long-term perspective is hard for competitors to copy. — Nick Sleep\nA good company culture compounds like interest over time. — Nick Sleep\nA company that thinks about its customers for the long term can reward investors too. — Nick Sleep\nTrue long-term investing endures the noise of quarterly results. — Nick Sleep\nThe intrinsic value of a great company builds slowly but powerfully. — Nick Sleep\nAn ownership mindset reduces the impulse to trade. — Nick Sleep\nThe longer you hold, the more company quality matters. — Nick Sleep\nFinding a company to travel with long-term beats frequent trading. — Nick Sleep\nDon\'t try to catch a falling knife. — Wall Street Wisdom\n\'Buy the rumor, sell the news\' means beware of crowd psychology. — Wall Street Wisdom\nIn a bull market, everyone looks smart. — Wall Street Wisdom\nCut losses fast; let profits run. — Wall Street Wisdom\nMarkets are colder than hope. — Wall Street Wisdom\nThe trend may be your friend, but it always ends at some point. — Wall Street Wisdom\nLearn first how not to lose money. — Wall Street Wisdom\nDiversification prevents a single mistake from being fatal. — Wall Street Wisdom\nLeverage compresses time but also compresses mistakes. — Wall Street Wisdom\nThe market is always preparing the next lesson. — Wall Street Wisdom\nGreat investment opportunities don\'t come often — be ready when they do. — Warren Buffett\nIf you aren\'t willing to hold a stock long-term, think twice about buying it short-term. — Warren Buffett\nA company\'s price tag changes daily, but its fundamentals don\'t. — Warren Buffett\nThe ability to understand a business is a stronger weapon than complex forecasts. — Warren Buffett\nA great business reduces the investor\'s mistakes over time. — Warren Buffett\nPublic fear becomes a discounted price tag for the prepared investor. — Warren Buffett\nPatience waiting for certain opportunities beats trying to grab every one. — Warren Buffett\nInvesting demands rational action, not brilliant action. — Warren Buffett\nLook for businesses that can earn for you long-term, not just stocks that look cheap. — Warren Buffett\nHolding a great company long-term is tedious — and that tedium becomes the result. — Warren Buffett\nThe greatest edge in investing is admitting what you don\'t know. — Charlie Munger\nOnce you find a great business, reducing unnecessary action helps. — Charlie Munger\nPatience combined with knowledge becomes a powerful investing tool. — Charlie Munger\nMany mistakes come from failing to see complexity as simplicity. — Charlie Munger\nInvestors should first consider why they might be wrong. — Charlie Munger\nThe best investors may not be those who trade daily but those who wait long. — Charlie Munger\nInverting shows you the paths to avoid first. — Charlie Munger\nLearning from others\' mistakes is the cheapest tuition. — Charlie Munger\nCompounding strengthens when a great company meets a long time horizon. — Charlie Munger\nGood temperament outlasts high intelligence in investment results. — Charlie Munger\nNot knowing the gap between value and price drags investors along with market moods. — Benjamin Graham\nThe market offers opportunity every day, but you don\'t need to follow every day. — Benjamin Graham\nThe investor must be the master of the market, not its servant. — Benjamin Graham\nMargin of safety is insurance against not knowing the future. — Benjamin Graham\nA falling price doesn\'t always mean more danger — paying too much is the real risk. — Benjamin Graham\nConviction without analysis turns investors into speculators. — Benjamin Graham\nPrice fluctuations test an investor\'s emotions; value demands their reason. — Benjamin Graham\nMarket prices are facts, but they aren\'t always the truth. — Benjamin Graham\nBuying cheap enough is more realistic protection than perfect future prediction. — Benjamin Graham\nThe intelligent investor finds margin of safety before popularity. — Benjamin Graham\nBefore buying a stock, be able to explain how that company makes money. — Peter Lynch\nGood investment ideas can be closer to daily life than you think. — Peter Lynch\nCheck whether the company\'s story still holds, not just the stock price. — Peter Lynch\nIf you\'re not prepared to endure declines, you\'ll struggle to enjoy the gains. — Peter Lynch\nKnow the company\'s earnings and outlook, not just its name. — Peter Lynch\nSpend time researching companies rather than trying to predict the market. — Peter Lynch\nBuild a structure so one or two failures don\'t destroy the whole portfolio. — Peter Lynch\nWinning stocks need time; failing stocks need review. — Peter Lynch\nBuying a company you don\'t know is entrusting your money to someone else\'s story. — Peter Lynch\nStocks require checking both the numbers and the story. — Peter Lynch\nConsistently earning ordinary market returns is anything but ordinary. — John Bogle\nInvestors don\'t need complex predictions to earn the whole market\'s returns. — John Bogle\nLow cost sides with the investor more and more over time. — John Bogle\nDoing nothing looks easy but is actually the hardest strategy. — John Bogle\nThe power of index investing lies in reducing unnecessary choices, not in genius selection. — John Bogle\nLong-term investors look at decades of compounding, not a day\'s news. — John Bogle\nThe foundation of investing is not being right more — it\'s building a structure that leaks less. — John Bogle\nLowering costs, taxes, and emotions can improve long-term performance. — John Bogle\nTime in the market beats timing the market. — John Bogle\nA simple portfolio is easier to protect even in a crisis. — John Bogle\nA good investor asks not just what to buy, but at what price. — Howard Marks\nWhen everyone is optimistic, doubt the price more than the good news. — Howard Marks\nWhen everyone is fearful, re-examine the price rather than the bad news. — Howard Marks\nRisk is most dangerous when it can\'t be seen. — Howard Marks\nInvestors don\'t predict the future — they make the odds favorable. — Howard Marks\nAt the end of a cycle, psychology pushes prices up ahead of logic. — Howard Marks\nManage risk well and the opportunity to profit comes again. — Howard Marks\nThe same thinking as everyone else makes different results harder to achieve. — Howard Marks\nThe best buying opportunities usually come alongside the most uncomfortable news. — Howard Marks\nThe successful investor prices uncertainty, not certainty. — Howard Marks\nEven amid despair, if the price is low enough, opportunity exists. — John Templeton\nA market everyone loves may already price in too much expectation. — John Templeton\nPessimism blinds investors, but for value investors it can be a map. — John Templeton\nThe greatest discounts appear where the crowd has thrown things away. — John Templeton\nWhen markets cheer, calculate risk before counting gains. — John Templeton\nThe most unpopular market can sometimes be the best starting point. — John Templeton\nExtreme pessimism can push prices even further below value. — John Templeton\nOpportunity exists everywhere; the crowd\'s vision is always limited. — John Templeton\nBuying in fear demands not just courage but analysis. — John Templeton\nAt the end of optimism, look for margin of safety over expectation. — John Templeton\nWhen you start fighting the market, losses become the cost of ego. — Jesse Livermore\nWhen signals say you\'re wrong, exit before pride does. — Jesse Livermore\nBeing right on a big trend but exiting too early leaves the big money behind. — Jesse Livermore\nThe desire to trade every day fools traders into thinking the market is their salary. — Jesse Livermore\nWhen price is not on your side, cut risk before looking for reasons. — Jesse Livermore\nIn speculation, hope is not a plan. — Jesse Livermore\nClear out a bad position while it\'s small to see the next opportunity. — Jesse Livermore\nMarkets can move longer than any individual\'s conviction. — Jesse Livermore\nBoth the ability to sit still and the ability to get out are necessary. — Jesse Livermore\nFollow the trend but limit your losses. — Jesse Livermore\nStock prices sometimes reflect psychology before the economy. — André Kostolany\nMoney without patience struggles to survive in markets. — André Kostolany\nCrowds are usually late to get excited and late to get fearful. — André Kostolany\nThe market\'s dog runs ahead but always returns to its owner. — André Kostolany\nEven a good idea can\'t become a good investment without time. — André Kostolany\nDebt robs the investor of patience. — André Kostolany\nIn markets, what you need before money is time to endure. — André Kostolany\nCrowd emotions shake prices but can\'t dominate forever. — André Kostolany\nThe investor must be someone who doesn\'t lose direction in the noise. — André Kostolany\nThe stock market demands both a calculator and a psychology textbook. — André Kostolany\nDiversification starts from humility, not conviction. — Ray Dalio\nGood principles are most needed on bad days, not good ones. — Ray Dalio\nKnowing your weaknesses makes your portfolio more realistic. — Ray Dalio\nIn an uncertain world, don\'t bet everything on a single outcome. — Ray Dalio\nEven painful losses, if properly reviewed, become material for the next judgment. — Ray Dalio\nBefore the market, know what kind of person you are. — Ray Dalio\nMixing different risks is the skill of enduring long-term. — Ray Dalio\nInvesting that denies reality will eventually be corrected by it. — Ray Dalio\nGood decision-making relies on principles and feedback, not emotions. — Ray Dalio\nInvestors often need to design balance rather than conviction. — Ray Dalio\nFixing a wrong judgment quickly can end the loss as tuition. — George Soros\nUnderstanding market illusions lets you see opportunity and danger at once. — George Soros\nPosition size is as important as conviction. — George Soros\nThe structure of winning big when right and losing small when wrong matters. — George Soros\nInvesting demands error-correction ability over perfect prediction. — George Soros\nSurviving investors know how to change their minds. — George Soros\nMarkets can be shaken even more by participants\' beliefs. — George Soros\nEven strong conviction is dangerous without loss-limit rules. — George Soros\nThe moment you realize you\'re wrong is the most important moment. — George Soros\nMarket opportunities usually appear within imperfect information. — George Soros\nOnly those who preserve capital can catch the next trend. — Paul Tudor Jones\nAdmitting losses while they are small is the professional habit. — Paul Tudor Jones\nReducing risk is not fear — it is strategy. — Paul Tudor Jones\nHave a loss-limiting plan ready before a reason to buy. — Paul Tudor Jones\nMarkets don\'t reward ego. — Paul Tudor Jones\nGood traders survive first, then profit. — Paul Tudor Jones\nInvestors who defend well don\'t miss their chance to attack. — Paul Tudor Jones\nHolding a wrong position long is stubbornness, not analysis. — Paul Tudor Jones\nControlling risk means controlling your mind too. — Paul Tudor Jones\nAvoiding large losses is the starting point of compounding. — Paul Tudor Jones\nMarket leaders often show strength first after a bear market. — William O\'Neil & Mark Minervini\nStop-loss rules must be set by numbers, not emotions. — William O\'Neil & Mark Minervini\nIgnoring the trend can turn good analysis into losses. — William O\'Neil & Mark Minervini\nDon\'t dismiss strong stocks just because they look expensive. — William O\'Neil & Mark Minervini\nDon\'t cling to weak stocks just because they look cheap. — William O\'Neil & Mark Minervini\nGood trades don\'t come from insisting the market is wrong. — William O\'Neil & Mark Minervini\nRisk-reward ratio and loss limits can matter more than win rate. — William O\'Neil & Mark Minervini\nCharts don\'t guarantee the future, but they can give warning signals. — William O\'Neil & Mark Minervini\nStrong rallies have reasons; weak bounces have limits. — William O\'Neil & Mark Minervini\nInvestors who follow rules shake less in emotional markets. — William O\'Neil & Mark Minervini\nOwning the whole market reduces the burden of prediction. — Burton Malkiel\nDon\'t strain to predict short-term movements that are nearly random. — Burton Malkiel\nLow cost and broad diversification are the domains the investor actually controls. — Burton Malkiel\nLong-term index investing isn\'t glamorous, but it\'s consistent. — Burton Malkiel\nSimple participation often beats complex prediction. — Burton Malkiel\nUnderestimate the average and you may end up below it. — Burton Malkiel\nThe lure of market timing is great, but the success rate is low. — Burton Malkiel\nInvestors win first by reducing certain costs. — Burton Malkiel\nA diversified portfolio is a realistic answer to an uncertain future. — Burton Malkiel\nA simple strategy grows stronger when it can be maintained long-term. — Burton Malkiel\nGreat companies have competitive depth beyond their revenue. — Philip Fisher\nWhen evaluating growth companies, look at people alongside numbers. — Philip Fisher\nA company\'s quality can matter more than its stock price as time passes. — Philip Fisher\nGood management is most visible in difficult times. — Philip Fisher\nFor long-term growth stocks, long-term direction matters more than short-term disappointment. — Philip Fisher\nDeep research builds conviction, and conviction builds patience. — Philip Fisher\nSelling a great company too soon is a common mistake. — Philip Fisher\nFocusing only on growth while ignoring price can make a great company a bad investment. — Philip Fisher\nCompany culture and R&D capacity can be seeds of long-term growth. — Philip Fisher\nOnce you find a great company, look at long-term competitiveness over short-term swings. — Philip Fisher\nValue investors must find comfort in unpopular prices. — Seth Klarman\nMargin of safety expresses the investor\'s humility in numbers. — Seth Klarman\nCash is not an idle asset — it is optionality. — Seth Klarman\nInvestors who see downside risk first can wait longer for upside opportunity. — Seth Klarman\nCheap assets have reasons — distinguish value from traps. — Seth Klarman\nValue can accumulate quietly where the market ignores. — Seth Klarman\nWaiting when there are no certain opportunities is also an investment decision. — Seth Klarman\nAvoiding losses is not timidity — it is how you preserve compounding. — Seth Klarman\nThe better the mood, the more margin of safety is needed. — Seth Klarman\nA good investment must carry its defense from the moment of purchase. — Seth Klarman\nMarkets being irrational short-term creates long-term opportunities. — Joel Greenblatt\nThe principle of buying great companies cheaply is simple but hard to practice. — Joel Greenblatt\nValue investing strategies must endure tedious stretches to be rewarded. — Joel Greenblatt\nBuying high-quality businesses at low prices is the core. — Joel Greenblatt\nEven a good strategy needs stretches painful enough that people quit — that\'s what makes it last. — Joel Greenblatt\nLooking at price and quality together reduces the chance of mistakes. — Joel Greenblatt\nMarkets occasionally attach the wrong price to a great company. — Joel Greenblatt\nDiscipline not shaken by short-term results completes the strategy. — Joel Greenblatt\nA cheap-and-good company beats a merely cheap one. — Joel Greenblatt\nMore important than the formula is the resolve to stick with it. — Joel Greenblatt\nFind structures where downside is small and upside is large. — Mohnish Pabrai\nGood investment ideas must be easy to understand to endure long. — Mohnish Pabrai\nWaiting is not time without opportunity — it is time to select opportunity. — Mohnish Pabrai\nReplicating proven principles is also a great investing skill. — Mohnish Pabrai\nThe appeal of value investing is a structure that loses little and wins big. — Mohnish Pabrai\nComplex investments have more places to go wrong. — Mohnish Pabrai\nInvestors need a few good ideas, not many. — Mohnish Pabrai\nEven with uncertainty, a low enough price can create opportunity. — Mohnish Pabrai\nBig opportunities don\'t come often — be patient in between. — Mohnish Pabrai\nSimplicity in investing is a strength, not a weakness. — Mohnish Pabrai\nTrue long-term investing is spending time alongside the business. — Nick Sleep\nA great company can create value for both customers and investors as time passes. — Nick Sleep\nReducing trading frequency clarifies the ownership perspective. — Nick Sleep\nGood company culture appears later than financial statements, but lasts longer. — Nick Sleep\nLong-term holding is not just holding any company for a long time. — Nick Sleep\nIf the company\'s direction is right, short-term swings are close to noise. — Nick Sleep\nCompanies worth traveling with long-term give hints in how they treat customers. — Nick Sleep\nGreat companies expand their options as time passes. — Nick Sleep\nShort-term trading makes you watch prices; long-term holding makes you watch the business. — Nick Sleep\nInvestors should observe the business\'s accumulated value, not just its price tag. — Nick Sleep\nMarkets can shake longer than the time you can endure. — Wall Street Wisdom\nMore important than buying cheap is buying in a way you can hold. — Wall Street Wisdom\nEven the best strategy is not good if you can\'t maintain it emotionally. — Wall Street Wisdom\nTo grow profits, first make sure losses don\'t ruin the account. — Wall Street Wisdom\nMarket noise is loud, but protecting the account is a quiet principle. — Wall Street Wisdom\nCash is frustration for the impatient and opportunity for the prepared. — Wall Street Wisdom\nWhen everyone looks the same direction, check the danger on the other side. — Wall Street Wisdom\nLeverage can hurt you if you get the direction right but the timing wrong. — Wall Street Wisdom\nDiversification can reduce jackpots but also reduces the chance of ruin. — Wall Street Wisdom\nBear markets test the investor\'s mind before the portfolio. — Wall Street Wisdom\nThe more urgent the news, the slower you should place the order. — Wall Street Wisdom\nThose who keep their account long enough will see the next bull market. — Wall Street Wisdom\nProfits are possibility; limiting losses is responsibility. — Wall Street Wisdom\nBefore buying, write down the worst case before the expected return. — Wall Street Wisdom\nProbability fits investing better than certainty. — Wall Street Wisdom';

  @override
  String get intelligentInvestorBookTitle => 'My View on Intelligent Investing';

  @override
  String get longFormBookTitle => 'Reminiscences of a Stock Operator';

  @override
  String get intelligentInvestorCh1Title => 'Ch1. Investing vs. Speculation';

  @override
  String get intelligentInvestorCh2Title => 'Ch2. Why Most Investors Fail';

  @override
  String get intelligentInvestorCh3Title => 'Ch3. The Market';

  @override
  String get intelligentInvestorCh4Title => 'Ch4. Margin of Safety';

  @override
  String get intelligentInvestorCh5Title =>
      'Ch5. Herd Psychology and Investing';

  @override
  String get intelligentInvestorCh6Title =>
      'Ch6. Why Markets Rise in the Long Run';

  @override
  String get intelligentInvestorCh7Title =>
      'Ch7. Lessons from the Dot-com Bubble';

  @override
  String get intelligentInvestorCh8Title =>
      'Ch8. Lessons from the Financial Crisis';

  @override
  String get intelligentInvestorCh9Title => 'Ch9. Lessons from the COVID Crash';

  @override
  String get intelligentInvestorCh10Title =>
      'Ch10. The AI Revolution and Today\'s Market';
}
