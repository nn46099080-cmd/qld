// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'QLD 提醒';

  @override
  String get menuThemeTitle => '主题';

  @override
  String get menuLanguageTitle => '语言';

  @override
  String get menuThemeLight => '白色';

  @override
  String get menuThemeDark => '深色';

  @override
  String get noBuyZone => '禁止买入区间';

  @override
  String get tapToViewStrategy => '点击查看策略';

  @override
  String get buyNow => '立即买入';

  @override
  String get buyingInProgress => '买入进行中';

  @override
  String get hold => '持有';

  @override
  String get navHome => '首页';

  @override
  String get navChart => '图表';

  @override
  String get navExchange => '汇率';

  @override
  String get navFearGreed => '恐惧';

  @override
  String get fearGreedTitle => '恐惧与贪婪指数';

  @override
  String get fearGreedInlineLabel => 'CNN恐惧贪婪';

  @override
  String get fearGreedSubtitle => 'CNN 美国市场情绪';

  @override
  String get fearGreedUnavailable => '无法加载恐惧与贪婪数据。';

  @override
  String get navAlert => '提醒';

  @override
  String get navStrategy => '策略';

  @override
  String get alertRecovery10 => 'QLD 回升10%';

  @override
  String get alertMarketOpen => '美国股市已开盘';

  @override
  String get alertNewHigh => '创出新高';

  @override
  String get portfolio => '投资组合';

  @override
  String get portfolioAssetInput => '资产输入';

  @override
  String get portfolioClose => '关闭';

  @override
  String get exitAdDialogBack => '返回';

  @override
  String get exitAdDialogExit => '退出';

  @override
  String get exitAdDialogMessage =>
      '退出应用时，最多每3小时可能显示一次全屏广告。广告收入将用于应用运营和功能改进。谢谢。';

  @override
  String get portfolioQldShares => 'QLD 数量';

  @override
  String get portfolioTqqqShares => 'TQQQ 数量';

  @override
  String get portfolioQldAveragePrice => 'QLD 平均成本';

  @override
  String get portfolioTqqqAveragePrice => 'TQQQ 平均成本';

  @override
  String get portfolioCashUsd => '现金 USD';

  @override
  String get portfolioTotal => '总资产';

  @override
  String get portfolioProfitLoss => '浮动盈亏';

  @override
  String get portfolioSharesUnit => '股';

  @override
  String get portfolioReturnRate => '收益率';

  @override
  String get portfolioAveragePriceShort => '平均成本';

  @override
  String get portfolioPriceLoading => '价格加载中';

  @override
  String get portfolioToBreakeven => '回本还需';

  @override
  String get portfolioBreakevenCleared => '已高于成本';

  @override
  String get basePosition => '基础仓位';

  @override
  String get fromPreviousClose => '较前收盘价';

  @override
  String get from10yHigh => '相对历史最高价';

  @override
  String get holdQLDPlusCash => 'QLD 70% + 现金30%';

  @override
  String get basePositionDescription =>
      '[ 策略指南 ]\n\n本策略不会一次性将全部资产投入QLD。\n\n初始阶段只投入部分资产，其余资金以现金形式持有，为市场大幅下跌做好准备。\n\n持有现金的力量\n\n持有现金不是为了提高收益，而是为了在下跌市场中保持冷静与纪律，留出心理余地。\n\n比追求最高收益率更重要的，是建立一个能够将复利坚持到底的投资系统。\n\n示例：\n- 仅将初始资产的70%投入QLD\n- 剩余30%持有现金\n\nQLD是一只追踪纳斯达克100指数约2倍日内涨跌幅的ETF。\n\n因此，在初始状态下：\n2倍杠杆 × 70%投资比例 = 整体约1.4倍的市场敞口。\n\n例如：\n- 纳斯达克 +1%\n→ 总资产约 +1.4%\n\n当市场出现大幅下跌时，持有的现金将分阶段用于追加买入。\n\n示例：\n- 在QLD下跌约40%的区域追加买入\n\n这样可以在较低价格积累更多份额，并在市场恢复时显著降低平均买入成本。\n\n因此，与简单持有策略相比，本策略可能在恢复阶段获得更高收益。\n\n本策略的核心是：\n- 在上涨市场中利用现金降低波动\n- 在大幅下跌时使用现金追加买入并降低平均成本。';

  @override
  String get basePositionIntro =>
      '这是一种不一次性投入全部资金，而是同时持有 QLD 和现金的基础策略。上涨时降低波动，市场大跌时保留追加买入的空间。';

  @override
  String get basePositionQldAllocationLabel => 'QLD 基础持仓';

  @override
  String get basePositionCashAllocationLabel => '备用现金';

  @override
  String get basePositionCorePrinciple => '核心原则';

  @override
  String get basePositionCashTitle => '现金不是拖累收益的钱';

  @override
  String get basePositionCashText => '现金是在大幅下跌中保持纪律，并以更低价格追加买入的安全余地。';

  @override
  String get basePositionInitialLeverageTitle => '初始波动约为 1.4 倍';

  @override
  String get basePositionInitialLeverageText =>
      'QLD 大约追踪纳斯达克100的 2 倍波动。仅将 70% 资产配置在 QLD，整体资产波动会降至约 1.4 倍。';

  @override
  String get basePositionStepLeverageTitle => '下跌区间会逐步提高倍数';

  @override
  String get basePositionStepLeverageText =>
      '从 -20%~-30% 区间开始加入 TQQQ 摊低成本，整体波动可升至约 1.8 倍。在最深下跌区间，可能提高到约 2.3 倍。';

  @override
  String get basePositionLowAverageTitle => '恐惧越强，越要建立更低均价';

  @override
  String get basePositionLowAverageText =>
      '本应用的结构是：下跌越深，越用备用现金分阶段追加买入 TQQQ。在低位区间增加份额，之后大幅反弹时可更强地拉动收益率。';

  @override
  String get basePositionSummaryTitle => '总结';

  @override
  String get basePositionSummaryText => '目标不是猜中最高收益，而是在下跌市场中也能坚持计划，让复利持续更久。';

  @override
  String get buySignalMessage => '买入信号会自动显示在这里。';

  @override
  String get checkStrategyCard => '请查看当前区间的策略卡片。';

  @override
  String get strategyCardLabel => '策略卡片';

  @override
  String get currentPrice => '当前价格';

  @override
  String get futuresLabel => '盘后';

  @override
  String get tenYearHigh => '历史最高价';

  @override
  String get buyStrategy => '买入策略';

  @override
  String get noBuyZoneTitle => '禁止买入区间';

  @override
  String get strategyOverview => '策略概览';

  @override
  String get corePrinciple => '核心原则';

  @override
  String get suggestedAllocation => '建议配置';

  @override
  String get riskManagement => '风险管理';

  @override
  String get actionGuide => '行动指南';

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
  String get minus20Title => '-20% 策略';

  @override
  String get minus20Headline => '每周用总现金的1%开始定投TQQQ';

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
  String get minus30Title => '-30% 策略';

  @override
  String get minus30Headline => '用20%现金买入 TQQQ';

  @override
  String get minus30OverviewTitle => 'Strategy Overview';

  @override
  String get minus30OverviewText =>
      'This zone represents a high-opportunity accumulation phase.\n\nHistorically, Nasdaq corrections around -30% have often provided strong long-term buying opportunities.\n\nAlthough fear and volatility increase significantly at this stage, disciplined dollar-cost averaging can improve long-term returns.';

  @override
  String get minus30AllocationTitle => 'Suggested Allocation';

  @override
  String get minus30AllocationText =>
      '• 使用约20%的可用现金\n• 继续逐步积累\n• 避免过快投入全部资金\n• 为更深下跌保留灵活性';

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
  String get minus40Title => '-40% 策略';

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
  String get minus50Title => '-50% 策略';

  @override
  String get minus50Headline => '用全部剩余现金买入 TQQQ';

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
  String get exchangeUsdKrw => '美元/韩元';

  @override
  String get exchangeUsdJpy => '美元/日元';

  @override
  String get exchangeEurUsd => '欧元/美元';

  @override
  String get exchangeUsdRub => '美元/卢布';

  @override
  String get exchangeUsdTwd => '美元/新台币';

  @override
  String get exchangeUsdCny => '美元/人民币';

  @override
  String get fearGreedExtremeFear => '极度恐惧';

  @override
  String get fearGreedFear => '恐惧';

  @override
  String get fearGreedNeutral => '中性';

  @override
  String get fearGreedGreed => '贪婪';

  @override
  String get fearGreedExtremeGreed => '极度贪婪';

  @override
  String get fearGreedIndicatorsTitle => '7项恐惧与贪婪指标';

  @override
  String get fearGreedFaqTitle => '恐惧与贪婪指数说明';

  @override
  String get fearGreedWhatTitle => 'CNN恐惧与贪婪指数是什么？';

  @override
  String get fearGreedWhatBody =>
      '恐惧与贪婪指数用于衡量股票市场情绪，以及股票价格是否可能处于合理水平。过度恐惧往往压低股价，过度贪婪则可能推高股价。';

  @override
  String get fearGreedCalculatedTitle => '它是如何计算的？';

  @override
  String get fearGreedCalculatedBody =>
      '该指数结合七项市场指标：市场动能、股价强度、市场广度、看跌/看涨期权、垃圾债需求、市场波动率以及避险资产需求。每项指标权重相同，最终形成0到100分。';

  @override
  String get fearGreedFrequencyTitle => '多久更新一次？';

  @override
  String get fearGreedFrequencyBody => '每个组成指标和整体指数都会在新的市场数据可用时更新。';

  @override
  String get fearGreedUseTitle => '应该如何使用？';

  @override
  String get fearGreedUseBody =>
      '可将它作为观察市场情绪的辅助指标。它能帮助发现情绪极端，但实际决策仍应结合价格、基本面、风险管理和自己的策略。';

  @override
  String get strategyAdLabel => '广告';

  @override
  String get alertSettingsTitle => '通知设置';

  @override
  String get alertSettingsCloseBasisNote => '提醒会根据收盘价发送。';

  @override
  String get alertHighTitle => '新高提醒';

  @override
  String get alertHighSubtitle => '安装后创下新高时提醒';

  @override
  String get alertMarketOpenTitle => '开盘提醒';

  @override
  String get alertMarketOpenSubtitle => '美股常规交易开始时每天提醒一次';

  @override
  String get alertStrategySettingTitle => '策略提醒';

  @override
  String get alertStrategySettingSubtitle => '提醒 -20%、-30%、-40%、-50% 区间变化';

  @override
  String get noBuyHeadline => '禁止追加买入，保持30%现金';

  @override
  String get noBuyActionTitle => '立即行动';

  @override
  String get noBuyActionText => '不要新买QLD/TQQQ。维持现有QLD仓位，并保留30%现金。';

  @override
  String get noBuyCashTitle => '现金规则';

  @override
  String get noBuyCashText => '现金是为下一轮下跌区间准备的储备资金。即使市场上涨也不要减少。';

  @override
  String get noBuyAvoidTitle => '避免';

  @override
  String get noBuyAvoidText => '不要因为价格上涨就追买。等待-20%区间出现。';

  @override
  String get noBuyNextTitle => '下一步';

  @override
  String get noBuyNextText => '到达-20%后，准备开始小额分批定投TQQQ。';

  @override
  String get minus20ActionTitle => '立即行动';

  @override
  String get minus20ActionText => '每周用持有现金的1%定投TQQQ。\n例）现金500美元 → 每周买入5美元';

  @override
  String get minus20BuyRuleTitle => '目的';

  @override
  String get minus20BuyRuleText =>
      '从-20%区间开始设置，是为了在市场横盘时也能少量累积，逐步降低TQQQ平均成本。重点不是马上抓到利润，而是建立更低的平均成本。';

  @override
  String get minus20CashTitle => '现金管理';

  @override
  String get minus20CashText =>
      '大部分现金仍要保留给-30%、-40%、-50%区间。即使在-50%时用完计划现金，之后新增现金也通过每周定投继续降低平均成本。\n\n即使市场横盘超过10周，也要继续每周定投总现金的1%。横盘越久，累积的份额越多，没有理由停止。\n\n到达-30%区间时，将当时剩余现金的20%一次性追加买入。每周定投不停止，与-30%策略同步继续。定投的结束时机是前高点收复并进行再平衡时。';

  @override
  String get minus20AvoidTitle => '卖出标准';

  @override
  String get minus20AvoidText =>
      '这个区间累积的TQQQ不在每次短线反弹时卖出。应视为以后创出新高并整理TQQQ仓位时一起处理的部分。';

  @override
  String get minus30ActionTitle => '立即行动';

  @override
  String get minus30ActionText => '只使用可用现金的20%买入TQQQ。下单前先确认现金总额。';

  @override
  String get minus30BuyRuleTitle => '买入规则';

  @override
  String get minus30BuyRuleText =>
      '如果现金为 \$10,000，只使用 \$2,000 买入 TQQQ，并保留剩余80%。';

  @override
  String get minus30AdditionalTitle => '追加行动';

  @override
  String get minus30AdditionalText => 'QLD定投可以继续，但TQQQ追加买入要等到下一个区间。';

  @override
  String get minus30AvoidTitle => '避免';

  @override
  String get minus30AvoidText => '不要因为确信反弹就大量使用现金。要按-40%区间仍可能到来的前提行动。';

  @override
  String get minus40ActionTitle => '立即行动';

  @override
  String get minus40ActionText => '使用剩余现金的30%买入TQQQ。计算时排除-30%已经使用的金额。';

  @override
  String get minus40BuyRuleTitle => '买入规则';

  @override
  String get minus40BuyRuleText => '如果剩余现金为 \$8,000，只使用 \$2,400。关键是不要一次性全部投入。';

  @override
  String get minus40HoldTitle => '持有规则';

  @override
  String get minus40HoldText => '继续持有QLD，TQQQ只增加到计划比例。为进一步下跌保留现金。';

  @override
  String get minus40AvoidTitle => '避免';

  @override
  String get minus40AvoidText => '不要因恐惧卖出现有仓位，也不要因贪婪全额买入。';

  @override
  String get minus50ActionTitle => '立即行动';

  @override
  String get minus50ActionText => '使用所有剩余现金买入TQQQ。这是计划中的最后现金投入阶段。';

  @override
  String get minus50BuyRuleTitle => '买入规则';

  @override
  String get minus50BuyRuleText => '以排除-30%、-40%已使用金额后的实际剩余现金为基准。';

  @override
  String get minus50AfterTitle => '之后行动';

  @override
  String get minus50AfterText => '之后有新增现金时，定期累积TQQQ或QLD，专注降低平均成本。';

  @override
  String get minus50AvoidTitle => '避免';

  @override
  String get minus50AvoidText => '不要只因亏损较大就放弃。不要用债务或短期生活资金追加买入。';

  @override
  String get alertNasdaq200Title => '纳斯达克100 200日线提醒';

  @override
  String get alertNasdaq200Subtitle => '纳斯达克100跌破或突破200日线时提醒';

  @override
  String get alertNasdaq200Breakdown => '纳斯达克100跌破200日均线';

  @override
  String get alertNasdaq200Breakout => '纳斯达克100重新突破200日均线';

  @override
  String get chartGuideTitle => '如何查看此图表';

  @override
  String get chartMiniTitle => '3个月图表及20日、200日移动平均线';

  @override
  String get chartGuideCandleTitle => '3个月K线';

  @override
  String get chartGuideCandleBody => '一眼查看QLD近3个月的价格走势。绿色表示收高，红色表示收低。';

  @override
  String get chartGuideMa200Title => '200日线';

  @override
  String get chartGuideMa200Body => '用于观察长期趋势的参考线。价格在其上方偏强，在其下方则检查风险和现金比例。';

  @override
  String get chartMa200SheetTitle => '什么是200日移动平均线？';

  @override
  String get chartMa200SheetBody =>
      '200日移动平均线是用最近约200个交易日的收盘价平均计算出的长期趋势线。\n\n许多投资者会参考它，因为它能过滤短期波动，让市场的大方向更容易看清。价格位于200日线上方时，通常被理解为长期趋势相对健康；位于下方时，可能意味着动能转弱或需要重新检查风险。\n\n它不应单独作为买入或卖出信号。对于QLD这类波动较大的杠杆ETF，更适合作为参考指标，并与现金比例、回撤幅度、平均成本和投资周期一起判断。';

  @override
  String get chartMa20SheetTitle => '什么是20日移动平均线？';

  @override
  String get chartMa20SheetBody =>
      '20日移动平均线是用最近约20个交易日的收盘价平均计算出的短期趋势线。\n\n许多投资者会关注它，因为它比200日线反应更快，更容易观察近期动能。价格持续在20日线上方，通常表示短期走势较强；反复跌破则可能意味着近期趋势正在转弱。\n\n对于QLD这类波动较大的杠杆ETF，20日线有助于判断短期速度和波动，但也容易出现假信号。最好与200日线、现金比例和计划买入区间一起参考。';

  @override
  String get alertPortfolioCashTitle => '现金再平衡提醒';

  @override
  String get alertPortfolioCashSubtitle => '当股价上涨等导致现金比例低于20%时提醒';

  @override
  String get alertPortfolioCashHigh => '现金比例低于20%。请考虑再平衡以补充现金。';

  @override
  String get alertPortfolioCashLow => '现金比例低于20%。请考虑再平衡以补充现金。';

  @override
  String get alertAnnouncementTitle => '公告通知';

  @override
  String get alertAnnouncementSubtitle => '接收 QLD DIP ALERT 发送的公告推送';

  @override
  String get alertDetailTitle => '提醒详情';

  @override
  String get alertDetailOpenStrategy => '查看策略';

  @override
  String get alertDetailRecovery => '下跌区间已改善。请冷静检查投资组合，避免匆忙卖出或冲动买入。';

  @override
  String get alertDetailNewHigh => '安装后记录了新的最高价。它将作为未来下跌率计算的新基准。';

  @override
  String get alertDetailMarketOpen => '美股常规交易已开始。只有今天计划行动时再检查价格和策略提醒。';

  @override
  String get alertDetailNasdaq200Breakdown =>
      '纳斯达克100跌破200日均线。长期趋势可能转弱，请检查风险和现金比例。';

  @override
  String get alertDetailNasdaq200Breakout =>
      '纳斯达克100重新站上200日均线。趋势可能改善，但仍应遵循计划策略。';

  @override
  String get alertDetailPortfolioCashHigh =>
      '现金比例低于20%参考线。这通常意味着股价上涨后持仓比例变大、现金缓冲变小。请考虑减持部分仓位，并再平衡到计划的现金比例。';

  @override
  String get alertDetailPortfolioCashLow =>
      '现金比例低于20%参考线。这通常意味着股价上涨后持仓比例变大、现金缓冲变小。请考虑减持部分仓位，并再平衡到计划的现金比例。';

  @override
  String get alertDetailOpenLink => '打开链接';

  @override
  String get appUpdateTitle => '有可用更新';

  @override
  String get appUpdateMessage => '有新版本可用。请更新以使用最新功能和修复。';

  @override
  String get appUpdateLater => '稍后';

  @override
  String get appUpdateNow => '更新';

  @override
  String get alertTestTitle => '通知测试';

  @override
  String get alertPermissionHelpTitle => '收不到通知？';

  @override
  String get alertPermissionHelpBody => '如果设备通知权限已关闭，测试通知也可能不会显示。';

  @override
  String get alertPermissionRequest => '请求权限';

  @override
  String get alertPermissionOpenSettings => '打开设置';

  @override
  String get holdPageTitle => '继续持有';

  @override
  String get holdHeadline => '计划中的买入已经完成。恢复阶段应专注于继续持有。';

  @override
  String get holdPositionTitle => '当前持仓原则';

  @override
  String get holdPositionText =>
      '继续持有已经买入的QLD和TQQQ。不要仅因为价格重新进入已恢复的区间，就重复执行之前区间的买入。';

  @override
  String get holdActionTitle => '当前行动';

  @override
  String get holdActionText => '暂停追加买入TQQQ并观察恢复走势。保留剩余现金，以应对再次下跌。';

  @override
  String get holdAvoidTitle => '禁止行为';

  @override
  String get holdAvoidText => '不要因波动而匆忙卖出，也不要因确信会恢复而冲动追加买入。';

  @override
  String get holdResetTitle => '策略重置';

  @override
  String get holdResetText => '当QLD完全恢复至前高时，本轮下跌周期结束，策略将回到最初的禁止买入状态。';

  @override
  String get rebalanceTitle => '再平衡区间';

  @override
  String get rebalanceHeadline => '卖出TQQQ并回归基础仓位';

  @override
  String get rebalanceOverviewTitle => '策略概述';

  @override
  String get rebalanceOverviewText =>
      '历史新高的收复意味着危机应对阶段已结束。现在是卖出在-20%及以下区间积累的TQQQ，并回归基础仓位（QLD 70%，现金 30%）的时候了。';

  @override
  String get rebalanceActionTitle => '立即行动';

  @override
  String get rebalanceActionText => '卖出所有在-20%及以下区间积累或购买的TQQQ。然后按照基础仓位配置调整资产。';

  @override
  String get rebalanceCashTitle => '现金目标';

  @override
  String get rebalanceCashText =>
      '再平衡后维持QLD 70%、现金 30%的比例。将获得的现金作为下次下跌区间的备用资金保管。';

  @override
  String get rebalanceAvoidTitle => '需要避免的行为';

  @override
  String get rebalanceAvoidText => '历史新高收复后不要继续积累TQQQ。在此阶段卖出危机阶段积累的仓位，回归基础仓位。';

  @override
  String get investmentCalculatorTitle => '预期收益率计算器';

  @override
  String get investmentCalculatorSubtitle => '基于QLD过去平均值的简单复利计算';

  @override
  String get investmentCalculatorReturnRate => '10年平均收益率';

  @override
  String get investmentCalculatorLumpSumTitle => '一次性投资 + 逢低买入';

  @override
  String get investmentCalculatorAmount => '投资金额';

  @override
  String get investmentCalculatorYears => '期限';

  @override
  String get investmentCalculatorExpectedValue => '预计市值';

  @override
  String get investmentCalculatorPrincipalMultiple => '本金倍数';

  @override
  String get investmentCalculatorMonthlyTitle => '定投投资';

  @override
  String get investmentCalculatorMonthlyAmount => '每月金额';

  @override
  String get investmentCalculatorTotalPrincipal => '总投入';

  @override
  String get investmentCalculatorExpectedProfit => '预计收益';

  @override
  String get investmentCalculatorDisclaimer => '这是基于过去收益率的简单计算，并不保证未来收益。';

  @override
  String get investmentCalculatorYearsSuffix => '年';

  @override
  String get investmentCalculatorTimesSuffix => '倍';

  @override
  String get investmentCalculatorChartHint => '你可以通过历史图表验证平均收益率。';

  @override
  String get investmentCalculatorCurrencySectionTitle => '汇率换算';

  @override
  String get investmentCalculatorCurrency => '国家/货币';

  @override
  String get investmentCalculatorExchangeRate => '1 USD 汇率';

  @override
  String get investmentCalculatorExchangeRateHint => '请输入所选货币中1美元对应的金额。';

  @override
  String get investmentCalculatorConvertedLumpSum => '一次性投资最终金额';

  @override
  String get investmentCalculatorConvertedMonthly => '定投投资最终金额';

  @override
  String get investmentCurrencyUnitedStatesUsd => '美国 USD';

  @override
  String get investmentCurrencyKoreaKrw => '韩国 KRW';

  @override
  String get investmentCurrencyJapanJpy => '日本 JPY';

  @override
  String get investmentCurrencyChinaCny => '中国 CNY';

  @override
  String get investmentCurrencyTaiwanTwd => '台湾 TWD';

  @override
  String get investmentCurrencyGermanyEur => '德国 EUR';

  @override
  String get investmentCurrencyFranceEur => '法国 EUR';

  @override
  String get investmentCurrencySpainEur => '西班牙 EUR';

  @override
  String get investmentCurrencyPortugalEur => '葡萄牙 EUR';

  @override
  String get investmentCurrencyRussiaRub => '俄罗斯 RUB';

  @override
  String get contentTitle => '内容';

  @override
  String get contentInquiry => '咨询';

  @override
  String get contentInquirySubtitle => '留下匿名问题并查看回复。';

  @override
  String get contentInquiryBadge => 'Q&A';

  @override
  String get contentCloseGuess => '收盘价竞猜';

  @override
  String get contentStockQuote => '今日股票名言';

  @override
  String get contentStockQuoteSubtitle => '磨砺投资直觉的简短名言。';

  @override
  String get contentStockQuoteBadge => '每日';

  @override
  String get contentNumberGuess => '猜数字';

  @override
  String get contentNumberGuessSubtitle => '轻松享受的概率小游戏。';

  @override
  String get contentNumberGuessBadge => '游戏';

  @override
  String get contentBookReader => '专栏';

  @override
  String get contentBookReaderSubtitle => '可以从容阅读的公共领域文本。';

  @override
  String get contentBookReaderBadge => '阅读';

  @override
  String get contentStockMeme => '股票梗图';

  @override
  String get contentLottoNumbers => '彩票号码推荐';

  @override
  String get contentJumpDodge => '跳跃躲避游戏';

  @override
  String get contentJumpDodgeSubtitle => '短暂专注享受的跳跃小游戏。';

  @override
  String get contentJumpDodgeBadge => '动作';

  @override
  String get stockQuoteTitle => '今日股票名言';

  @override
  String get stockQuoteTapHint => '点击可查看另一句话。';

  @override
  String get stockQuoteShuffle => '查看另一句名言';

  @override
  String get usageGuideTitle => '应用使用方法';

  @override
  String get usageGuideSubtitle => '长期纳斯达克2倍杠杆策略规则';

  @override
  String get usageGuideCardTitle => '应用使用方法';

  @override
  String get usageGuideCardSubtitle => '基础仓位、下跌区间、买入记录、辅助指标';

  @override
  String get usageGuideWhatAppTitle => '这是什么应用？';

  @override
  String get usageGuideWhatAppBody =>
      '这个应用是面向长期纳斯达克2倍杠杆投资者的行动规则指南。\n\n它会自动计算当前价格相对历史最高点的回撤幅度，帮助确认当前位置，并为不同区间提供对应的投资策略。\n\n它帮助你不被市场的恐惧和贪婪左右，持续执行计划好的投资原则。';

  @override
  String get usageGuideNoBuyTitle => '1. 先阅读基础仓位和策略';

  @override
  String get usageGuideNoBuyBody =>
      '先点击主画面的“基础仓位卡片”，阅读如何准备。同时点击右下角的“策略”标签，了解详细策略。\n\n* 用总持有资金的70%购买QLD。';

  @override
  String get usageGuideStrategyTitle => '2. 查看下跌区间自动策略';

  @override
  String get usageGuideStrategyBody =>
      '主画面的“策略卡片”会在QLD相比历史最高价下跌一定百分比时自动显示对应区间。点击该卡片即可进行相应的买入或再平衡操作。满足条件时也会发送提醒。';

  @override
  String get usageGuideIndicatorsTitle => '四个辅助指标';

  @override
  String get usageGuideIndicatorsBody =>
      'CNN F&G显示市场情绪更偏恐惧还是贪婪。\n\nVIX显示市场波动和不安程度，数字越高通常代表市场越紧张。\n\n美国主要日程包括NFP、CPI、FOMC。NFP看就业，CPI看通胀，FOMC看利率方向。这些结果可能让纳斯达克和QLD大幅波动。\n\n10年国债收益率是美国10年期国债利率。快速上升时，可能对成长股、纳斯达克和QLD形成压力。';

  @override
  String get usageGuideQldTitle => '3. 买入后记录到投资组合';

  @override
  String get usageGuideQldBody =>
      '参考显示的策略和金额，在自己使用的券商买入。买入后，在应用的投资组合中记录数量、平均价格和现金。';

  @override
  String get usageGuideDisclaimer => '本应用内容仅供投资参考，不保证收益。';

  @override
  String get usageGuideConfirm => '确定';

  @override
  String get bookReadingTitle => '专栏';

  @override
  String bookReaderPageNumber(int page) {
    return '第$page页';
  }

  @override
  String get numGuessPrompt => '猜一个1到1000之间的数字。';

  @override
  String get numGuessInvalidInput => '请输入1到1000之间的数字。';

  @override
  String numGuessCorrect(int attempts) {
    return '正确！您用了$attempts次猜对了。';
  }

  @override
  String get numGuessTooLow => '数字更大。';

  @override
  String get numGuessTooHigh => '数字更小。';

  @override
  String numGuessAttemptsLabel(int count) {
    return '尝试次数: $count';
  }

  @override
  String numGuessLastGuessLabel(int number) {
    return '你的输入: $number';
  }

  @override
  String get numGuessInputHint => '输入数字';

  @override
  String get numGuessConfirm => '确认';

  @override
  String get numGuessNewGame => '新游戏';

  @override
  String get numGuessRanking => '排名';

  @override
  String get numGuessNoRecords => '暂无记录。';

  @override
  String numGuessAttemptCount(int count) {
    return '$count次';
  }

  @override
  String get jumpLeaderboard => '排行榜';

  @override
  String get jumpScore => '分数';

  @override
  String get jumpPersonalBest => '个人最佳';

  @override
  String get jumpTapToRestart => '点击重新开始';

  @override
  String get jumpTapToStart => '点击开始';

  @override
  String get jumpInstruction => '点击屏幕跳跃并躲避障碍物。';

  @override
  String get inquiryLoadError => '无法加载问题列表。';

  @override
  String get inquiryAdminOnlyReply => '只有管理员可以回复。';

  @override
  String get inquiryReplyEmpty => '请输入回复内容。';

  @override
  String get inquiryReplyError => '提交回复失败，请稍后重试。';

  @override
  String get inquiryAdminOnlyPin => '只有管理员可以置顶。';

  @override
  String get inquiryPinError => '无法保存置顶状态。';

  @override
  String get inquiryAdminOnlyDelete => '只有管理员可以删除。';

  @override
  String get inquiryDeleteTitle => '删除问题';

  @override
  String get inquiryDeleteConfirm => '删除此问题吗？';

  @override
  String get inquiryCancel => '取消';

  @override
  String get inquiryDeleteAction => '删除';

  @override
  String get inquiryDeleteError => '删除失败，请稍后重试。';

  @override
  String get inquiryContentEmpty => '请输入问题内容。';

  @override
  String get inquirySubmitError => '提交问题失败，请稍后重试。';

  @override
  String get inquiryAdminLabel => '管理员';

  @override
  String get inquiryPasswordLabel => '密码';

  @override
  String get inquiryPasswordWrong => '密码不正确。';

  @override
  String get inquiryAdminActivatedRegistered => '管理员模式已启用（设备已注册）';

  @override
  String get inquiryAdminActivatedFailed => '管理员模式已启用（设备注册失败）';

  @override
  String get inquiryContentDetailLabel => '问题内容';

  @override
  String get inquiryAdminReplyLabel => '管理员回复';

  @override
  String get inquiryAdminReplyEdit => '编辑回复';

  @override
  String get inquirySaving => '保存中...';

  @override
  String get inquirySubmitReply => '提交回复';

  @override
  String get inquiryPrevPage => '上一页';

  @override
  String get inquiryNextPage => '下一页';

  @override
  String inquiryPageOf(int current, int total) {
    return '第$current页 / 共$total页';
  }

  @override
  String get inquiryUnpin => '取消置顶';

  @override
  String get inquiryPin => '置顶';

  @override
  String get inquiryListTitle => '问题列表';

  @override
  String get inquiryEmpty => '暂无问题。';

  @override
  String get inquiryWriteTitle => '写问题';

  @override
  String get inquiryContentFieldLabel => '内容';

  @override
  String get inquirySubmitting => '提交中...';

  @override
  String get inquirySubmitButton => '提交';

  @override
  String get inquiryUserReplyLabel => '添加后续消息...';

  @override
  String get indicatorCnnFearGreed => 'CNN 恐惧贪婪';

  @override
  String get indicatorVix => 'VIX 波动率';

  @override
  String get indicatorUsSchedule => '美国重要发布日程';

  @override
  String get indicatorTenYearYield => '美国10年国债收益率';

  @override
  String get indicatorUsMarketTime => '美国市场剩余时间';

  @override
  String get indicatorVixHigh => '高波动区间';

  @override
  String get indicatorVixStable => '正常区间';

  @override
  String get indicatorVixDefault => '市场恐慌指标';

  @override
  String get indicatorVixLow => '波动率极低区间';

  @override
  String get indicatorVixCaution => '注意区间';

  @override
  String get indicatorTenYearDesc => '美国10年期国债利率';

  @override
  String get marketWeekendLabel => '周末休市·距开市';

  @override
  String get marketPreOpenLabel => '距开市';

  @override
  String get marketToCloseLabel => '距收市';

  @override
  String get marketClosedLabel => '市场休市';

  @override
  String get marketClosedValue => '休市中';

  @override
  String get noData => '暂无数据';

  @override
  String get rsiOverbought => '超买';

  @override
  String get rsiOversold => '超卖';

  @override
  String get rsiNormal => '中性';

  @override
  String get rsiOverboughtZone => '超买区间';

  @override
  String get rsiOversoldZone => '超卖区间';

  @override
  String get rsiNormalZone => '正常范围';

  @override
  String get rsiOverboughtOversold => '超买 / 超卖';

  @override
  String get coverStrategyTab => '策略标签';

  @override
  String get coverStrategyHint => '向上滑动查看策略标签';

  @override
  String get usScheduleSheetTitle => '美国主要日程';

  @override
  String get noScheduleLeft => '暂无已登记事件';

  @override
  String get scheduleNameHint => '事件名称';

  @override
  String get adminPassword => '管理员密码';

  @override
  String get addSchedule => '添加日程';

  @override
  String get wrongPassword => '密码不正确。';

  @override
  String get checkScheduleNameAndDate => '请确认事件名称和日期。';

  @override
  String get editSchedule => '编辑日程';

  @override
  String get rsiDialogTitle => 'RSI(14)是什么？';

  @override
  String get rsiDialogContent =>
      'RSI（相对强弱指数）通过比较过去14天的涨跌幅，以0~100的数值表示当前股价的超买或超卖状态。\n\n• 70以上 → 超买区间\n  短期急涨后调整的可能性较高。\n\n• 30以下 → 超卖区间\n  短期急跌后可能出现反弹。\n\n• 30~70 → 正常范围\n  无超买或超卖信号。';

  @override
  String get inquiryEditMessageTitle => '编辑消息';

  @override
  String get inquiryEditMessageSave => '保存';

  @override
  String get inquiryTapToEdit => '点击编辑';

  @override
  String get stockQuoteList =>
      '别人贪婪时要谨慎，别人恐惧时要看到机会。 — 沃伦·巴菲特\n价格是你支付的，价值是你得到的。 — 沃伦·巴菲特\n以合理的价格买入优秀的公司比较好。 — 沃伦·巴菲特\n不要投资你不了解的业务。 — 沃伦·巴菲特\n风险来自于不知道自己在做什么。 — 沃伦·巴菲特\n买了好公司，持有期越长越好。 — 沃伦·巴菲特\n建立声誉需要很长时间，而失去它只需要一瞬间。 — 沃伦·巴菲特\n市场波动不是威胁，而是机会。 — 沃伦·巴菲特\n潮水退去才知道谁在裸泳。 — 沃伦·巴菲特\n投资者应该专注于避免大错误，而不是追求本垒打。 — 沃伦·巴菲特\n在能力圈内行动，错误就会减少。 — 沃伦·巴菲特\n买股票是买企业的一部分，而不是一张纸。 — 沃伦·巴菲特\n只买即使市场关闭10年你也愿意持有的股票。 — 沃伦·巴菲特\n关注企业的长期盈利能力，而不是短期价格。 — 沃伦·巴菲特\n优秀的商业结构往往比优秀的管理层更重要。 — 沃伦·巴菲特\n选择简单确定的，而非复杂不确定的。 — 沃伦·巴菲特\n投资自己可能是最好的投资。 — 沃伦·巴菲特\n能够长期坚持的判断比冲动交易更重要。 — 沃伦·巴菲特\n不需要打每一个球，等待好球来临。 — 沃伦·巴菲特\n投资中气质比智商更重要。 — 沃伦·巴菲特\n优秀的企业随着时间推移会展现其价值。 — 沃伦·巴菲特\n真正理解好业务比买得便宜更重要。 — 沃伦·巴菲特\n关注企业的现金流，而不是市场噪音。 — 沃伦·巴菲特\n依靠债务的投资会让好的判断也变得危险。 — 沃伦·巴菲特\n现金让你在机会来临时能够行动。 — 沃伦·巴菲特\n大钱来自等待，而不是频繁交易。 — 查理·芒格\n与其努力变聪明，不如避免愚蠢的行为。 — 查理·芒格\n问题难以解决时，试着反向思考。 — 查理·芒格\n声誉和诚信可以在一瞬间消失。 — 查理·芒格\n长期持有好业务是复利的核心。 — 查理·芒格\n理解激励机制有助于更好地理解人的行为。 — 查理·芒格\n行动越频繁，犯错的机会也越多。 — 查理·芒格\n投资需要等待的能力。 — 查理·芒格\n好的判断来自于将多个领域的知识联系起来。 — 查理·芒格\n优质业务让时间成为投资者的朋友。 — 查理·芒格\n机会稀少时，有准备的人更有优势。 — 查理·芒格\n每天少一点愚蠢比每天聪明一点更重要。 — 查理·芒格\n成功来自坚持基本原则，而非复杂公式。 — 查理·芒格\n好的投资让没有耐心的人感到不舒服。 — 查理·芒格\n不必亲历所有错误，从他人的错误中学习。 — 查理·芒格\n卓越的成果来自在罕见机会出现时大胆行动。 — 查理·芒格\n警惕以过高价格买入好业务的错误。 — 查理·芒格\n投资中最危险的话是\"我大概知道\"的错觉。 — 查理·芒格\n保持简单有助于长期业绩。 — 查理·芒格\n要战胜市场，首先要战胜自己的冲动。 — 查理·芒格\n安全边际是投资者的盾牌。 — 本杰明·格雷厄姆\n短期市场是投票机，长期市场是称重机。 — 本杰明·格雷厄姆\n聪明的投资者向乐观者卖出，向悲观者买入。 — 本杰明·格雷厄姆\n价格波动是建议，不是命令。 — 本杰明·格雷厄姆\n投资应基于分析，投机依赖预期。 — 本杰明·格雷厄姆\n不要被市场先生的情绪左右，要利用它。 — 本杰明·格雷厄姆\n以远低于价值的价格买入是应对错误的方法。 — 本杰明·格雷厄姆\n防止损失的原则优先于创造利润的原则。 — 本杰明·格雷厄姆\n市场有时非理性，但价值终将得到反映。 — 本杰明·格雷厄姆\n越不确定，安全边际就越需要更大。 — 本杰明·格雷厄姆\n投资者应先计算价值，再看价格。 — 本杰明·格雷厄姆\n好的分析来自冷静，而非兴奋。 — 本杰明·格雷厄姆\n防御性投资者避免过度自信。 — 本杰明·格雷厄姆\n没有原则的预期收益更接近投机而非投资。 — 本杰明·格雷厄姆\n市场的变幻无常可以成为长期投资者的朋友。 — 本杰明·格雷厄姆\n仅仅便宜是不够的，需要价值和安全边际。 — 本杰明·格雷厄姆\n相信数字和价值，而非大众情绪。 — 本杰明·格雷厄姆\n承认可能犯错的人能活得更久。 — 本杰明·格雷厄姆\n投资中第一个问题不是能赚多少，而是可能亏多少。 — 本杰明·格雷厄姆\n好的投资是有充分依据和充分安全边际的决策。 — 本杰明·格雷厄姆\n要知道持有什么，为什么持有。 — 彼得·林奇\n股票不是彩票，而是企业的一部分。 — 彼得·林奇\n企业做好了，长期股价也会跟上。 — 彼得·林奇\n可以在自己熟悉的领域找到投资想法。 — 彼得·林奇\n没有调研的投资接近于希望。 — 彼得·林奇\n下跌市场会重复出现，重要的是能否坚持。 — 彼得·林奇\n在股市中，勇气和知识同样重要。 — 彼得·林奇\n好股票的故事改变时也要重新审视。 — 彼得·林奇\n不需要每只股票都成功，大赢家改变整个投资组合。 — 彼得·林奇\n企业的故事先于股价。 — 彼得·林奇\n即使了解的业务也要确认数字。 — 彼得·林奇\n与其试图预测市场，不如专注于寻找好公司。 — 彼得·林奇\n个人投资者可以在日常生活中首先发现好企业。 — 彼得·林奇\n不受欢迎的好企业有时会给予更大的机会。 — 彼得·林奇\n如果没有承受急跌的勇气，就应降低股票比例。 — 彼得·林奇\n不要爱上股票，要确认企业业绩。 — 彼得·林奇\n最大的错误是假装知道自己不知道的事。 — 彼得·林奇\n好的投资想法不需要复杂的解释。 — 彼得·林奇\n不要仅因股价下跌就以为便宜。 — 彼得·林奇\n成长股的成长故事破裂时要重新审视。 — 彼得·林奇\n投资的制胜公式是广泛持有并长期坚持。 — 约翰·博格\n保持方向，不要因市场噪音改变计划。 — 约翰·博格\n不要在干草堆里找针，买下整个干草堆。 — 约翰·博格\n成本是确定的损失，收益是不确定的。 — 约翰·博格\n时间是朋友，冲动是敌人。 — 约翰·博格\n投机情绪在前，投资减少情绪。 — 约翰·博格\n长期投资者不需要预测市场。 — 约翰·博格\n低成本是投资者能控制的最强变量。 — 约翰·博格\n持有整个市场可以减少个股失误。 — 约翰·博格\n什么都不做的能力是投资者的竞争优势。 — 约翰·博格\n简单的指数基金比复杂产品存活更久。 — 约翰·博格\n追求收益的行为可能降低收益。 — 约翰·博格\n投资者不能预知未来，但可以降低成本。 — 约翰·博格\n分散、低成本、长期持有是基础。 — 约翰·博格\n市场长期反映整体企业的业绩。 — 约翰·博格\n查看越频繁，动摇的理由越多。 — 约翰·博格\n投资计划应用原则而非情绪维持。 — 约翰·博格\n枯燥的投资可以产生最强的结果。 — 约翰·博格\n持续获得市场平均收益也是强大的策略。 — 约翰·博格\n长期投资最大的敌人是成本和情绪。 — 约翰·博格\n卓越的投资始于与众不同、更深入地思考。 — 霍华德·马克斯\n风险不是波动性，而是永久损失的可能性。 — 霍华德·马克斯\n风险无法消除，但可以控制。 — 霍华德·马克斯\n价格越高，未来收益的安全边际越小。 — 霍华德·马克斯\n忽视周期的投资者会反复感到惊讶。 — 霍华德·马克斯\n即使好资产，买得太贵也会变成坏投资。 — 霍华德·马克斯\n投资中重要的是损益的不对称性，而非正确的频率。 — 霍华德·马克斯\n防御必须在熊市来临之前准备好。 — 霍华德·马克斯\n大众越有把握，就越需要反向思考。 — 霍华德·马克斯\n当你理解价格与价值的差距时，利润就产生了。 — 霍华德·马克斯\n成功的投资是善于玩概率游戏。 — 霍华德·马克斯\n过于良好的氛围让风险看起来便宜。 — 霍华德·马克斯\n市场心理会让价格偏离价值。 — 霍华德·马克斯\n保守投资不是放弃机会，而是提高生存概率。 — 霍华德·马克斯\n风险管理在收益好时最为必要。 — 霍华德·马克斯\n二阶思维是对所有人看到的事物进行不同解读的能力。 — 霍华德·马克斯\n最佳买入时机通常不会在最舒适的时刻出现。 — 霍华德·马克斯\n看不到风险是最大的风险。 — 霍华德·马克斯\n市场越接近极端，谨慎就越重要。 — 霍华德·马克斯\n投资不是确定性游戏，而是概率游戏。 — 霍华德·马克斯\n最大悲观时期可能是最佳买入时机。 — 约翰·邓普顿\n最大乐观时期是考虑卖出的时候。 — 约翰·邓普顿\n牛市在悲观中诞生，在怀疑中成长，在乐观中成熟。 — 约翰·邓普顿\n当欣喜主导市场时，牛市变得危险。 — 约翰·邓普顿\n最好的机会存在于人们回避的地方。 — 约翰·邓普顿\n需要在别人卖出时买入的勇气。 — 约翰·邓普顿\n\"这次不同了\"这句话通常最为危险。 — 约翰·邓普顿\n世界各地只要有便宜的价值，就应该能找到它。 — 约翰·邓普顿\n悲观论降低价格，低价格创造机会。 — 约翰·邓普顿\n冷静地审视大众不喜欢的资产。 — 约翰·邓普顿\n投资者应该是乐观主义者，但对价格要冷静。 — 约翰·邓普顿\n伟大的机会从大众关注之外开始。 — 约翰·邓普顿\n最坏的消息并不总意味着最坏的投资。 — 约翰·邓普顿\n如果价格足够低，不确定性也能得到回报。 — 约翰·邓普顿\n在悲观中买入的人应该准备好在乐观中卖出。 — 约翰·邓普顿\n市场在情绪极端时会犯最大的错误。 — 约翰·邓普顿\n机会更多地来自不舒适的地方，而非舒适的地方。 — 约翰·邓普顿\n逆着大众行动需要依据和勇气。 — 约翰·邓普顿\n长期收益可以从最不受欢迎时刻的判断开始。 — 约翰·邓普顿\n投资者不是回避恐惧的人，而是分析恐惧的人。 — 约翰·邓普顿\n大钱不是来自猜对，而是坚持到最后。 — 杰西·利弗莫尔\n市场永远不会错，只有观点会错。 — 杰西·利弗莫尔\n总想行动的欲望会造成很多损失。 — 杰西·利弗莫尔\n损失必须在还小的时候承认。 — 杰西·利弗莫尔\n如果趋势还在，就没必要急着离开。 — 杰西·利弗莫尔\n判断正确却坚持不住，就很难赚大钱。 — 杰西·利弗莫尔\n认为每天都必须赚钱的想法会毁掉交易者。 — 杰西·利弗莫尔\n在亏损仓位上加仓是危险的习惯。 — 杰西·利弗莫尔\n不要试图说服市场，要倾听市场的声音。 — 杰西·利弗莫尔\n在价格运动面前，自尊心会成为成本。 — 杰西·利弗莫尔\n比何时买入更重要的是知道何时判断错误。 — 杰西·利弗莫尔\n大趋势奖励坚持的人。 — 杰西·利弗莫尔\n好的判断也可能因为急于平仓而崩溃。 — 杰西·利弗莫尔\n市场不在乎个人的希望。 — 杰西·利弗莫尔\n频繁交易制造的错误多于机会。 — 杰西·利弗莫尔\n大钱属于懂得安静坐等的人。 — 杰西·利弗莫尔\n要在投机中生存，首先要限制损失。 — 杰西·利弗莫尔\n不要无视价格所指示的方向。 — 杰西·利弗莫尔\n比信念更重要的是判断错误时退出的能力。 — 杰西·利弗莫尔\n交易中的自制力与分析能力同样重要。 — 杰西·利弗莫尔\n股市由资金和心理驱动。 — 安德烈·科斯托拉尼\n主人慢慢走，狗跑来跑去，但最终一起到达。 — 安德烈·科斯托拉尼\n投资者必须有钱、有想法、有耐心。 — 安德烈·科斯托拉尼\n股市中最贵的东西是急躁。 — 安德烈·科斯托拉尼\n大众兴奋时退后一步。 — 安德烈·科斯托拉尼\n好的投资者读懂市场情绪，但不跟随它。 — 安德烈·科斯托拉尼\n价格受心理影响，但价值需要时间。 — 安德烈·科斯托拉尼\n投资需要想象力，但更需要耐心。 — 安德烈·科斯托拉尼\n用借来的钱投资会让时间成为敌人。 — 安德烈·科斯托拉尼\n股票把没耐心的人的钱转移给有耐心的人。 — 安德烈·科斯托拉尼\n以和大众一样的想法期待比大众更好的结果是不现实的。 — 安德烈·科斯托拉尼\n市场上心理比逻辑先行的日子很多。 — 安德烈·科斯托拉尼\n没有等待的投资接近于投机。 — 安德烈·科斯托拉尼\n资金紧张的投资者难以承受市场的变幻无常。 — 安德烈·科斯托拉尼\n下跌是痛苦的，但也是机会的语言。 — 安德烈·科斯托拉尼\n过于频繁地看市场会让情绪先于思考。 — 安德烈·科斯托拉尼\n耐心是投资者隐藏的资本。 — 安德烈·科斯托拉尼\n即使好想法，没有时间也可能失败。 — 安德烈·科斯托拉尼\n投资者必须相信自己的判断，而非大众的喝彩。 — 安德烈·科斯托拉尼\n在市场中长期生存的人最终学到最多。 — 安德烈·科斯托拉尼\n痛苦加上反思等于进步。 — 瑞·达利欧\n承认不知道是风险管理的开始。 — 瑞·达利欧\n混合低相关资产可以使投资组合更稳定。 — 瑞·达利欧\n没有原则，危机时情绪就会替代决策。 — 瑞·达利欧\n如实看待现实的能力是良好决策的起点。 — 瑞·达利欧\n投资者需要可验证的原则，而非单纯的信念。 — 瑞·达利欧\n分散不是掩盖无知，而是承认不确定性。 — 瑞·达利欧\n不了解自己的弱点，市场会替你展示。 — 瑞·达利欧\n好的系统即使在情绪化时刻也应用同样的标准。 — 瑞·达利欧\n理解大局可以减少被短期噪音动摇。 — 瑞·达利欧\n重要的不是对错，而是对的时候赚多少，错的时候亏多少。 — 乔治·索罗斯\n市场不只是反映现实，也会影响现实。 — 乔治·索罗斯\n迅速承认错误的能力是强大的武器。 — 乔治·索罗斯\n生存第一，利润第二。 — 乔治·索罗斯\n信念越强，就越需要检验反面可能性。 — 乔治·索罗斯\n市场的幻觉可能持续很长时间。 — 乔治·索罗斯\n好的投资者迅速修正自己的错误。 — 乔治·索罗斯\n危险不是犯错，而是坚持错误。 — 乔治·索罗斯\n机会越大，仓位管理就越重要。 — 乔治·索罗斯\n投资是在不完整信息下做出决策。 — 乔治·索罗斯\n防御先于进攻。 — 保罗·都铎·琼斯\n在亏损仓位上加仓最终会造成更大危险。 — 保罗·都铎·琼斯\n保护资本，下一个机会自然会来。 — 保罗·都铎·琼斯\n不要试图在市场中当英雄。 — 保罗·都铎·琼斯\n将损失保持小的能力创造长期业绩。 — 保罗·都铎·琼斯\n价格反向运动时，先削减风险。 — 保罗·都铎·琼斯\n避免大损失先于追求大收益。 — 保罗·都铎·琼斯\n交易中的自尊会放大损失。 — 保罗·都铎·琼斯\n防御心态不是软弱，而是生存策略。 — 保罗·都铎·琼斯\n没有损失管理的进攻不会持久。 — 保罗·都铎·琼斯\n小的时候止损是原则。 — 威廉·欧奈尔·马克·米纳维尼\n强势股票强势有原因。 — 威廉·欧奈尔·马克·米纳维尼\n不要与趋势对抗。 — 威廉·欧奈尔·马克·米纳维尼\n图表有时比意见更快地显示风险。 — 威廉·欧奈尔·马克·米纳维尼\n要捕捉大赢家，先要避开大输家。 — 威廉·欧奈尔·马克·米纳维尼\n没有规则的交易只是情绪的记录。 — 威廉·欧奈尔·马克·米纳维尼\n寻找市场领导者，但用数字限制风险。 — 威廉·欧奈尔·马克·米纳维尼\n比买入更重要的是判断错误时的行动。 — 威廉·欧奈尔·马克·米纳维尼\n好的入场也无法克服糟糕的止损习惯。 — 威廉·欧奈尔·马克·米纳维尼\n在牛市中，强势股票可以变得更强。 — 威廉·欧奈尔·马克·米纳维尼\n对大多数投资者来说，持有整个市场是合理的。 — 伯顿·马尔基尔\n如果很难预测市场，就以低成本长期参与。 — 伯顿·马尔基尔\n不要对看似随机的价格运动赋予过度意义。 — 伯顿·马尔基尔\n指数投资简单但是强大的选择。 — 伯顿·马尔基尔\n如果预测困难，就控制成本和分散。 — 伯顿·马尔基尔\n投资者应专注于自己能控制的事情。 — 伯顿·马尔基尔\n长期留在市场比预测市场更现实。 — 伯顿·马尔基尔\n经过验证的简单性比流行策略更持久。 — 伯顿·马尔基尔\n复杂的预测往往无法战胜低成本的力量。 — 伯顿·马尔基尔\n持续获得平均收益的策略比想象中更强大。 — 伯顿·马尔基尔\n优秀的企业有超越数字的质量因素。 — 菲利普·费雪\n评估成长股时，要同时看管理层和市场机会。 — 菲利普·费雪\n好企业持有越久越能展现其真正价值。 — 菲利普·费雪\n要了解企业，研究周围所有人的声音。 — 菲利普·费雪\n卖出可能比买入更难的决定。 — 菲利普·费雪\n长期成长企业提供承受短期波动的理由。 — 菲利普·费雪\n好的管理层创造数字中看不到的价值。 — 菲利普·费雪\n同时看成长潜力和价格。 — 菲利普·费雪\n不了解企业质量，长期持有也会动摇。 — 菲利普·费雪\n优秀的企业让时间成为投资者的朋友。 — 菲利普·费雪\n安全边际是承认不确定性的投资者语言。 — 塞思·卡拉曼\n价值投资看的是价格与价值之差，而非人气。 — 塞思·卡拉曼\n当别人感觉不危险时，风险可能正在增大。 — 塞思·卡拉曼\n耐心是价值投资者最重要的资产之一。 — 塞思·卡拉曼\n即使是低价也要确认是否有理由。 — 塞思·卡拉曼\n避免损失的态度是长期收益的基础。 — 塞思·卡拉曼\n好机会不常有，所以可能需要现金。 — 塞思·卡拉曼\n投资者应依赖自己的分析，而非市场人气。 — 塞思·卡拉曼\n价值与价格的差距越大，机会也可能越大。 — 塞思·卡拉曼\n没有安全边际的信念是危险的自信。 — 塞思·卡拉曼\n便宜买好公司的原则简单但不容易。 — 乔尔·格林布拉特\n高收益业务遇上低价格时，机会就产生了。 — 乔尔·格林布拉特\n即使是简单的原则，不能坚守就不会有成果。 — 乔尔·格林布拉特\n价值投资看起来枯燥，但需要时间。 — 乔尔·格林布拉特\n市场短期内可能犯错这一事实创造了机会。 — 乔尔·格林布拉特\n好的策略必须让所有人都难以跟随才能持久。 — 乔尔·格林布拉特\n价格低于价值时，投资者的优势就产生了。 — 乔尔·格林布拉特\n要同时看企业质量和价格。 — 乔尔·格林布拉特\n长期来看，数字比故事更有力。 — 乔尔·格林布拉特\n没有耐心很难做价值投资。 — 乔尔·格林布拉特\n找到正面大赚、背面小亏的结构。 — 莫尼什·帕伯莱\n简单的想法可以产生大收益。 — 莫尼什·帕伯莱\n好投资者知道如何复制优秀投资者的原则。 — 莫尼什·帕伯莱\n限制下行并保持上行开放的投资是好的。 — 莫尼什·帕伯莱\n等待明确的机会，而非复杂的机会。 — 莫尼什·帕伯莱\n投资者需要的是好决策，而非多决策。 — 莫尼什·帕伯莱\n专注于偶尔出现的确定机会。 — 莫尼什·帕伯莱\n先计算损失可能性可以让你活得更久。 — 莫尼什·帕伯莱\n好的投资应该有简单的解释。 — 莫尼什·帕伯莱\n等待是价值投资的一部分。 — 莫尼什·帕伯莱\n与优秀企业长期同行可以是最强大的策略。 — 尼克·斯利普\n投资者应该是所有者，而非交易者。 — 尼克·斯利普\n长期视角是竞争对手难以模仿的。 — 尼克·斯利普\n良好的企业文化随时间推移像复利一样运作。 — 尼克·斯利普\n长期考虑客户的企业也能回报投资者。 — 尼克·斯利普\n真正的长期投资承受季度业绩的噪音。 — 尼克·斯利普\n优秀企业的内在价值缓慢但有力地积累。 — 尼克·斯利普\n所有者视角减少了交易冲动。 — 尼克·斯利普\n持有越久，企业质量越重要。 — 尼克·斯利普\n寻找可以长期同行的企业胜于频繁交易。 — 尼克·斯利普\n不要试图抓住下跌中的刀。 — 华尔街格言\n\"买谣言，卖新闻\"意味着警惕大众心理。 — 华尔街格言\n在牛市中，每个人看起来都很聪明。 — 华尔街格言\n快速止损，让利润奔跑。 — 华尔街格言\n市场比希望更冷酷。 — 华尔街格言\n趋势可能是朋友，但总有结束的时刻。 — 华尔街格言\n先学习如何不亏钱。 — 华尔街格言\n分散使一次失误不会致命。 — 华尔街格言\n杠杆压缩时间，但也压缩错误。 — 华尔街格言\n市场总在准备下一个教训。 — 华尔街格言\n伟大的投资机会不常来，来了要准备好。 — 沃伦·巴菲特\n如果没有长期持有的心态，短期买入也要谨慎。 — 沃伦·巴菲特\n市场的价格标签每天变，但企业的本质不会每天变。 — 沃伦·巴菲特\n理解业务的能力是比复杂预测更强的武器。 — 沃伦·巴菲特\n好企业随时间推移减少投资者的错误。 — 沃伦·巴菲特\n大众的恐惧对有准备的投资者来说可能是打折的价格标签。 — 沃伦·巴菲特\n等待确定机会的耐心胜于试图抓住每一个机会的贪婪。 — 沃伦·巴菲特\n投资需要理性行动，而非华丽行动。 — 沃伦·巴菲特\n先看能长期盈利的业务，而不是看起来便宜的股票。 — 沃伦·巴菲特\n长期持有好企业比想象中枯燥，而这种枯燥就是成果。 — 沃伦·巴菲特\n投资中最大的优势是承认自己不知道的态度。 — 查理·芒格\n找到好业务后，减少不必要的行动会有帮助。 — 查理·芒格\n耐心与知识结合时成为强大的投资工具。 — 查理·芒格\n许多错误来自无法将复杂的事看简单。 — 查理·芒格\n投资者首先应该思考自己为何可能犯错。 — 查理·芒格\n最好的投资者可能不是每天交易的人，而是长期等待的人。 — 查理·芒格\n反向思考会先看到需要避开的路。 — 查理·芒格\n从他人错误中学习是最便宜的学费。 — 查理·芒格\n复利在好企业与长时间相遇时变强。 — 查理·芒格\n好气质比卓越智力在投资成果上持续更久。 — 查理·芒格\n不了解价值与价格差距，投资者就会被市场情绪拖着走。 — 本杰明·格雷厄姆\n市场每天给机会，但不需要每天跟随。 — 本杰明·格雷厄姆\n投资者应该是市场的主人，而非市场的仆人。 — 本杰明·格雷厄姆\n安全边际是对不知道未来这一事实的保险。 — 本杰明·格雷厄姆\n股价下跌并不总意味着更危险，买得太贵可能更危险。 — 本杰明·格雷厄姆\n没有分析的信念把投资者变成投机者。 — 本杰明·格雷厄姆\n价格波动测试投资者的情绪，但价值要求理性。 — 本杰明·格雷厄姆\n市场价格是事实，但不总是真相。 — 本杰明·格雷厄姆\n买得足够便宜是比完美未来预测更现实的防御。 — 本杰明·格雷厄姆\n聪明的投资者先找安全边际，再找人气。 — 本杰明·格雷厄姆\n买股票前要能解释那家公司如何赚钱。 — 彼得·林奇\n好的投资想法可能比你想象的更近在日常生活中。 — 彼得·林奇\n确认的是企业的故事是否持续，而非股价。 — 彼得·林奇\n没有承受下跌的心理准备，就难以长期享受上涨的果实。 — 彼得·林奇\n要了解企业的业绩和前景，而非只知道股票名称。 — 彼得·林奇\n把时间用在研究企业上，而非试图预测市场。 — 彼得·林奇\n建立一两次失败不会破坏整体投资的结构。 — 彼得·林奇\n成功的股票需要时间，失败的股票需要检查。 — 彼得·林奇\n买不了解的企业是把钱托付给别人的故事。 — 彼得·林奇\n股票需要同时确认数字和故事。 — 彼得·林奇\n持续获得平凡市场收益率绝非平凡之事。 — 约翰·博格\n投资者不需要复杂预测来获得整个市场的收益。 — 约翰·博格\n低成本随时间推移越来越站在投资者一边。 — 约翰·博格\n什么都不做的策略看起来容易，但实际上最难。 — 约翰·博格\n指数投资的力量在于减少不必要的选择，而非天才的选择。 — 约翰·博格\n长期投资者看的是数十年的复利，而非一天的新闻。 — 约翰·博格\n投资的基础不是更多地猜对，而是建立漏洞更少的结构。 — 约翰·博格\n降低成本、税收和情绪可以改善长期业绩。 — 约翰·博格\n留在市场的时间比市场时机更重要。 — 约翰·博格\n简单的投资组合在危机时也更容易守护。 — 约翰·博格\n好的投资者不只问买什么，还问以什么价格买。 — 霍华德·马克斯\n所有人乐观时，比好消息更应该质疑价格。 — 霍华德·马克斯\n所有人恐惧时，比坏消息更应该重新审视价格。 — 霍华德·马克斯\n风险在看不见时最危险。 — 霍华德·马克斯\n投资者不是预测未来的人，而是使概率有利的人。 — 霍华德·马克斯\n周期末尾，心理比逻辑更先推动价格上涨。 — 霍华德·马克斯\n好好管理风险，获利的机会就会再来。 — 霍华德·马克斯\n与他人相同的想法很难获得与他人不同的结果。 — 霍华德·马克斯\n最好的买入机会通常伴随最不舒适的新闻而来。 — 霍华德·马克斯\n成功的投资者看的是不确定性的价格，而非确定性。 — 霍华德·马克斯\n即使在绝望的氛围中，如果价格足够低，机会依然存在。 — 约翰·邓普顿\n所有人喜欢的市场可能已经在价格中包含太多期望。 — 约翰·邓普顿\n悲观遮住投资者的眼，但对价值投资者来说可能是地图。 — 约翰·邓普顿\n大众抛弃的地方可能出现最大折扣率。 — 约翰·邓普顿\n市场欢呼时，先计算风险，而非收益。 — 约翰·邓普顿\n最不受欢迎的市场有时可以是最好的起点。 — 约翰·邓普顿\n悲观过头时，价格可能跌得比价值更远。 — 约翰·邓普顿\n世界各地都有机会，大众的视野总是有限的。 — 约翰·邓普顿\n在恐惧中买入不只需要勇气，还需要分析。 — 约翰·邓普顿\n乐观末尾，要看安全边际，而非期望。 — 约翰·邓普顿\n开始与市场对抗，损失就成了自尊的成本。 — 杰西·利弗莫尔\n出现判断错误的信号时，退出比固执更重要。 — 杰西·利弗莫尔\n判断对了大趋势，却太早离开，大钱就留不住。 — 杰西·利弗莫尔\n每天都想交易的欲望让交易者误以为市场是工资。 — 杰西·利弗莫尔\n价格不在自己一边时，先减少风险，再找理由。 — 杰西·利弗莫尔\n在投机中，希望不是计划。 — 杰西·利弗莫尔\n趁错误仓位还小时清算，才能看到下一个机会。 — 杰西·利弗莫尔\n市场可以比任何个人的信念运动更久。 — 杰西·利弗莫尔\n坐等的能力和退出的能力都是必要的。 — 杰西·利弗莫尔\n跟随趋势，但限制损失。 — 杰西·利弗莫尔\n股价有时比经济更先反映心理。 — 安德烈·科斯托拉尼\n没有耐心的钱很难在市场中长期生存。 — 安德烈·科斯托拉尼\n大众通常迟迟兴奋，迟迟恐惧。 — 安德烈·科斯托拉尼\n市场的狗跑在前面，但最终回到主人身边。 — 安德烈·科斯托拉尼\n即使是好想法，没有时间也难以成为好投资。 — 安德烈·科斯托拉尼\n债务剥夺投资者的耐心。 — 安德烈·科斯托拉尼\n在市场中，比钱更先需要的是能坚持的时间。 — 安德烈·科斯托拉尼\n大众的情绪震动价格，但不能永远主导。 — 安德烈·科斯托拉尼\n投资者必须成为在噪音中不迷失方向的人。 — 安德烈·科斯托拉尼\n股市同时需要计算器和心理学书。 — 安德烈·科斯托拉尼\n分散始于谦逊，而非信念。 — 瑞·达利欧\n好原则在坏日子比好日子更需要。 — 瑞·达利欧\n了解自己的弱点，投资组合也能更现实。 — 瑞·达利欧\n在不确定的世界中，不要把一切押在一个结果上。 — 瑞·达利欧\n即使是痛苦的损失，正确复盘也能成为下次判断的材料。 — 瑞·达利欧\n在市场之前，先知道自己是什么样的人。 — 瑞·达利欧\n混合不同风险是长期坚持的技术。 — 瑞·达利欧\n否认现实的投资总有一天会被现实修正。 — 瑞·达利欧\n好的决策依赖原则和反馈，而非情绪。 — 瑞·达利欧\n投资者很多时候需要设计平衡，而非信念。 — 瑞·达利欧\n快速修正错误判断，损失就可能以学费结束。 — 乔治·索罗斯\n理解市场幻觉，就能同时看到机会和危险。 — 乔治·索罗斯\n仓位大小和信念同样重要。 — 乔治·索罗斯\n正确时大赚、错误时少亏的结构很重要。 — 乔治·索罗斯\n投资需要纠错能力，而非完美预测。 — 乔治·索罗斯\n生存的投资者知道如何改变自己的想法。 — 乔治·索罗斯\n市场可以因参与者的信念而更大幅度波动。 — 乔治·索罗斯\n即使强烈的信念，没有止损规则也是危险的。 — 乔治·索罗斯\n知道自己判断错了的那一刻是最重要的时刻。 — 乔治·索罗斯\n市场机会通常出现在不完整信息中。 — 乔治·索罗斯\n只有保护资本的人才能抓住下一个趋势。 — 保罗·都铎·琼斯\n损失变大之前小额承认是专业人士的习惯。 — 保罗·都铎·琼斯\n减少风险不是胆怯，而是策略。 — 保罗·都铎·琼斯\n止损计划应该在买入理由之前就准备好。 — 保罗·都铎·琼斯\n市场不奖励自尊。 — 保罗·都铎·琼斯\n好的交易者先生存，然后再赚钱。 — 保罗·都铎·琼斯\n善于防守的投资者不会错失进攻机会。 — 保罗·都铎·琼斯\n长期持有错误仓位是固执，而非分析。 — 保罗·都铎·琼斯\n控制风险，心也得到控制。 — 保罗·都铎·琼斯\n避免大损失是复利的起点。 — 保罗·都铎·琼斯\n市场领导者往往在熊市后最先展示实力。 — 威廉·欧奈尔·马克·米纳维尼\n止损规则必须用数字而非情绪来设定。 — 威廉·欧奈尔·马克·米纳维尼\n忽视趋势会让好分析也以损失告终。 — 威廉·欧奈尔·马克·米纳维尼\n不要因为看起来贵就忽视强势股票。 — 威廉·欧奈尔·马克·米纳维尼\n不要因为看起来便宜就抓住弱势股票。 — 威廉·欧奈尔·马克·米纳维尼\n好的交易不来自坚持市场是错的。 — 威廉·欧奈尔·马克·米纳维尼\n盈亏比和损失限制可能比胜率更重要。 — 威廉·欧奈尔·马克·米纳维尼\n图表不保证未来，但可以给出风险信号。 — 威廉·欧奈尔·马克·米纳维尼\n强劲上涨有原因，弱势反弹有限制。 — 威廉·欧奈尔·马克·米纳维尼\n遵守规则的投资者在情绪化市场中也减少动摇。 — 威廉·欧奈尔·马克·米纳维尼\n持有整个市场的策略减轻了预测的负担。 — 伯顿·马尔基尔\n不要努力预言几乎随机的短期运动。 — 伯顿·马尔基尔\n低成本和广泛分散是投资者实际可控的领域。 — 伯顿·马尔基尔\n长期指数投资不华丽，但持续。 — 伯顿·马尔基尔\n简单参与往往好过复杂预测。 — 伯顿·马尔基尔\n低估平均值，可能连平均值都达不到。 — 伯顿·马尔基尔\n市场时机的诱惑很大，但成功率很低。 — 伯顿·马尔基尔\n投资者首先通过降低确定成本获胜。 — 伯顿·马尔基尔\n分散的投资组合是对未知未来的现实答案。 — 伯顿·马尔基尔\n简单的策略在能长期维持时会变得更强。 — 伯顿·马尔基尔\n伟大企业拥有超越营收的深层竞争力。 — 菲利普·费雪\n评估成长企业时，要同时看数字和人。 — 菲利普·费雪\n企业质量随时间推移可能比股价更重要。 — 菲利普·费雪\n好的管理层在困难时期更能显现。 — 菲利普·费雪\n对长期成长股来说，长期方向比短期失望更重要。 — 菲利普·费雪\n深入调研建立信念，信念建立耐心。 — 菲利普·费雪\n太快卖掉好公司是常见的错误。 — 菲利普·费雪\n只看成长性而忽视价格，好企业也会变成坏投资。 — 菲利普·费雪\n企业文化和研发能力可以成为长期成长的种子。 — 菲利普·费雪\n找到好公司后，看长期竞争力，而非短期波动。 — 菲利普·费雪\n价值投资者必须在不受欢迎的价格中找到舒适感。 — 塞思·卡拉曼\n安全边际是投资者谦逊的数字表达。 — 塞思·卡拉曼\n现金不是闲置资产，而是选择权。 — 塞思·卡拉曼\n先看下行风险的投资者可以更长地等待上行机会。 — 塞思·卡拉曼\n便宜资产有原因，要区分价值和陷阱。 — 塞思·卡拉曼\n市场忽视的地方，价值可以静静积累。 — 塞思·卡拉曼\n没有确定机会时等待也是投资决定。 — 塞思·卡拉曼\n避免损失不是胆小，而是维护复利的方法。 — 塞思·卡拉曼\n氛围越好，越需要安全边际。 — 塞思·卡拉曼\n好投资从买入那一刻起就必须有防御能力。 — 塞思·卡拉曼\n市场短期非理性创造长期机会。 — 乔尔·格林布拉特\n便宜买好公司的原则简单，但实践困难。 — 乔尔·格林布拉特\n价值投资策略必须熬过枯燥时期才能得到回报。 — 乔尔·格林布拉特\n以低价买高质量业务是核心。 — 乔尔·格林布拉特\n好策略也需要让人痛苦到想放弃的区间，这样才能持久运作。 — 乔尔·格林布拉特\n同时看价格和质量可以减少犯错概率。 — 乔尔·格林布拉特\n市场有时给优秀企业贴上错误的价格。 — 乔尔·格林布拉特\n不被短期成果动摇的纪律完成策略。 — 乔尔·格林布拉特\n只便宜的企业不如既便宜又好的企业。 — 乔尔·格林布拉特\n比投资公式更重要的是坚持那个公式的心。 — 乔尔·格林布拉特\n寻找下行小、上行大的结构是核心。 — 莫尼什·帕伯莱\n好的投资想法必须容易理解才能长期坚持。 — 莫尼什·帕伯莱\n等待不是没有机会的时间，而是挑选机会的时间。 — 莫尼什·帕伯莱\n复制经验证的原则也是优秀的投资能力。 — 莫尼什·帕伯莱\n少亏多赚的结构是价值投资的魅力。 — 莫尼什·帕伯莱\n复杂投资有更多出错之处。 — 莫尼什·帕伯莱\n投资者需要的是好的几个想法，而非许多想法。 — 莫尼什·帕伯莱\n即使有不确定性，价格足够低也可能成为机会。 — 莫尼什·帕伯莱\n大机会不常来，平时要忍耐。 — 莫尼什·帕伯莱\n投资中的简单性不是弱点，而是可以成为优势。 — 莫尼什·帕伯莱\n真正的长期投资是与企业共同度过时间。 — 尼克·斯利普\n优秀企业随时间推移能给客户和投资者双方带来价值。 — 尼克·斯利普\n减少交易频率使所有者视角更清晰。 — 尼克·斯利普\n好的企业文化比财务报表出现得晚，但持续更久。 — 尼克·斯利普\n长期持有不是随便持有任何企业很长时间。 — 尼克·斯利普\n如果企业方向正确，短期波动可能接近噪音。 — 尼克·斯利普\n可以长期同行的企业在对待客户的方式上给出线索。 — 尼克·斯利普\n好企业随时间推移扩大选择范围。 — 尼克·斯利普\n短期交易让你看价格，长期持有让你看业务。 — 尼克·斯利普\n投资者应该观察业务的积累价值，而非只看价格标签。 — 尼克·斯利普\n市场可以比你能坚持的时间更长地震荡。 — 华尔街格言\n比买得便宜更重要的是买得能够坚持。 — 华尔街格言\n最好的策略，如果感情上无法坚守，就不是好策略。 — 华尔街格言\n要增加利润，首先要确保损失不会毁掉账户。 — 华尔街格言\n市场噪音很大，但保护账户是静静的原则。 — 华尔街格言\n现金对急躁的人是烦恼，对有准备的人是机会。 — 华尔街格言\n所有人看同一方向时，确认另一边的危险。 — 华尔街格言\n杠杆在方向正确但时机错误时也会带来危险。 — 华尔街格言\n分散可以减少大赚，但也减少破产可能性。 — 华尔街格言\n下跌市场先于投资组合测试投资者的内心。 — 华尔街格言\n新闻越紧急，下单要越慢。 — 华尔街格言\n长期保持账户的人才能看到下一轮牛市。 — 华尔街格言\n利润是可能性，限制损失是责任。 — 华尔街格言\n买入前先写下最坏情况，而非预期收益。 — 华尔街格言\n市场上概率比确信更合适。 — 华尔街格言';

  @override
  String get intelligentInvestorBookTitle => '我对明智投资的看法';

  @override
  String get longFormBookTitle => '股票作手回忆录';

  @override
  String get intelligentInvestorCh1Title => 'Ch1. 投资与投机的区别';

  @override
  String get intelligentInvestorCh2Title => 'Ch2. 为什么大多数投资者会失败';

  @override
  String get intelligentInvestorCh3Title => 'Ch3. 市场';

  @override
  String get intelligentInvestorCh4Title => 'Ch4. 安全边际';

  @override
  String get intelligentInvestorCh5Title => 'Ch5. 群体心理与投资';

  @override
  String get intelligentInvestorCh6Title => 'Ch6. 为什么市场长期上涨';

  @override
  String get intelligentInvestorCh7Title => 'Ch7. 互联网泡沫的教训';

  @override
  String get intelligentInvestorCh8Title => 'Ch8. 金融危机的教训';

  @override
  String get intelligentInvestorCh9Title => 'Ch9. 新冠暴跌的教训';

  @override
  String get intelligentInvestorCh10Title => 'Ch10. AI革命与当前市场';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get appTitle => 'QLD 提醒';

  @override
  String get menuThemeTitle => '主題';

  @override
  String get menuLanguageTitle => '語言';

  @override
  String get menuThemeLight => '白色';

  @override
  String get menuThemeDark => '深色';

  @override
  String get noBuyZone => '禁止買入區間';

  @override
  String get tapToViewStrategy => '點擊查看策略';

  @override
  String get buyNow => '立即買入';

  @override
  String get buyingInProgress => '買入進行中';

  @override
  String get hold => '持有';

  @override
  String get navHome => '首頁';

  @override
  String get navChart => '圖表';

  @override
  String get navExchange => '匯率';

  @override
  String get navFearGreed => '恐懼';

  @override
  String get fearGreedTitle => '恐懼與貪婪指數';

  @override
  String get fearGreedInlineLabel => 'CNN恐懼貪婪';

  @override
  String get fearGreedSubtitle => 'CNN 美國市場情緒';

  @override
  String get fearGreedUnavailable => '無法載入恐懼與貪婪資料。';

  @override
  String get navAlert => '提醒';

  @override
  String get navStrategy => '策略';

  @override
  String get alertRecovery10 => 'QLD 回升10%';

  @override
  String get alertMarketOpen => '美國股市已開盤';

  @override
  String get alertNewHigh => '創下新高';

  @override
  String get portfolio => '投資組合';

  @override
  String get portfolioAssetInput => '資產輸入';

  @override
  String get portfolioClose => '關閉';

  @override
  String get exitAdDialogBack => '返回';

  @override
  String get exitAdDialogExit => '退出';

  @override
  String get exitAdDialogMessage =>
      '結束應用程式時，最多每3小時可能顯示一次全螢幕廣告。廣告收益將用於應用程式營運與功能改進。謝謝。';

  @override
  String get portfolioQldShares => 'QLD 數量';

  @override
  String get portfolioTqqqShares => 'TQQQ 數量';

  @override
  String get portfolioQldAveragePrice => 'QLD 平均成本';

  @override
  String get portfolioTqqqAveragePrice => 'TQQQ 平均成本';

  @override
  String get portfolioCashUsd => '現金 USD';

  @override
  String get portfolioTotal => '總資產';

  @override
  String get portfolioProfitLoss => '浮動盈虧';

  @override
  String get portfolioSharesUnit => '股';

  @override
  String get portfolioReturnRate => '收益率';

  @override
  String get portfolioAveragePriceShort => '平均成本';

  @override
  String get portfolioPriceLoading => '價格載入中';

  @override
  String get portfolioToBreakeven => '回本還需';

  @override
  String get portfolioBreakevenCleared => '已高於成本';

  @override
  String get basePosition => '基礎倉位';

  @override
  String get fromPreviousClose => '較前收盤價';

  @override
  String get from10yHigh => '相對歷史最高價';

  @override
  String get holdQLDPlusCash => 'QLD 70% + 現金30%';

  @override
  String get basePositionDescription =>
      '[ 策略指南 ]\n\n本策略不會一次將全部資產投入QLD。\n\n初始階段只投入部分資產，其餘資金以現金形式持有，為市場大幅下跌做好準備。\n\n持有現金的力量\n\n持有現金不是為了提高報酬，而是為了在下跌市場中保持冷靜與紀律，保留心理餘裕。\n\n比追求最高報酬率更重要的，是建立一套能將複利持續到底的投資系統。\n\n範例：\n- 僅將初始資產的70%投入QLD\n- 剩餘30%持有現金\n\nQLD是一檔追蹤那斯達克100指數約2倍每日漲跌幅的ETF。\n\n因此，在初始狀態下：\n2倍槓桿 × 70%投資比例 = 整體約1.4倍的市場曝險。\n\n例如：\n- 那斯達克 +1%\n→ 總資產約 +1.4%\n\n當市場出現大幅下跌時，持有的現金將分階段用於追加買入。\n\n範例：\n- 在QLD下跌約40%的區域追加買入\n\n如此可在較低價格累積更多部位，並在市場復甦時顯著降低平均買入成本。\n\n因此，與單純持有策略相比，本策略可能在復甦階段獲得更高報酬。\n\n本策略的核心是：\n- 在上漲市場中利用現金降低波動\n- 在大幅下跌時使用現金追加買入並降低平均成本。';

  @override
  String get basePositionIntro =>
      '這是一種不一次投入全部資金，而是同時持有 QLD 和現金的基礎策略。上漲時降低波動，市場大跌時保留追加買入的空間。';

  @override
  String get basePositionQldAllocationLabel => 'QLD 基礎持倉';

  @override
  String get basePositionCashAllocationLabel => '備用現金';

  @override
  String get basePositionCorePrinciple => '核心原則';

  @override
  String get basePositionCashTitle => '現金不是拖累報酬的資金';

  @override
  String get basePositionCashText => '現金是在大幅下跌中保持紀律，並以更低價格追加買入的安全餘裕。';

  @override
  String get basePositionInitialLeverageTitle => '初始波動約為 1.4 倍';

  @override
  String get basePositionInitialLeverageText =>
      'QLD 約追蹤那斯達克100的 2 倍波動。僅將 70% 資產配置在 QLD，整體資產波動會降至約 1.4 倍。';

  @override
  String get basePositionStepLeverageTitle => '下跌區間會逐步提高倍數';

  @override
  String get basePositionStepLeverageText =>
      '從 -20%~-30% 區間開始加入 TQQQ 攤低成本，整體波動可升至約 1.8 倍。在最深下跌區間，可能提高到約 2.3 倍。';

  @override
  String get basePositionLowAverageTitle => '恐懼越強，越要建立更低均價';

  @override
  String get basePositionLowAverageText =>
      '本應用的結構是：下跌越深，越用備用現金分階段追加買入 TQQQ。在低位區間增加部位，之後大幅反彈時可更強地拉動報酬率。';

  @override
  String get basePositionSummaryTitle => '總結';

  @override
  String get basePositionSummaryText => '目標不是猜中最高報酬，而是在下跌市場中也能堅持計畫，讓複利持續更久。';

  @override
  String get buySignalMessage => '買入信號會自動顯示在這裡。';

  @override
  String get checkStrategyCard => '請查看目前區間的策略卡片。';

  @override
  String get strategyCardLabel => '策略卡片';

  @override
  String get currentPrice => '目前價格';

  @override
  String get futuresLabel => '盤後';

  @override
  String get tenYearHigh => '歷史最高價';

  @override
  String get buyStrategy => '買入策略';

  @override
  String get noBuyZoneTitle => '禁止買入區間';

  @override
  String get strategyOverview => '策略概覽';

  @override
  String get corePrinciple => '核心原則';

  @override
  String get suggestedAllocation => '建議配置';

  @override
  String get riskManagement => '風險管理';

  @override
  String get actionGuide => '行動指南';

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
  String get minus20Title => '-20% 策略';

  @override
  String get minus20Headline => '每週用總現金的1%開始定投TQQQ';

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
  String get minus30Title => '-30% 策略';

  @override
  String get minus30Headline => '用20%現金買入 TQQQ';

  @override
  String get minus30OverviewTitle => 'Strategy Overview';

  @override
  String get minus30OverviewText =>
      'This zone represents a high-opportunity accumulation phase.\n\nHistorically, Nasdaq corrections around -30% have often provided strong long-term buying opportunities.\n\nAlthough fear and volatility increase significantly at this stage, disciplined dollar-cost averaging can improve long-term returns.';

  @override
  String get minus30AllocationTitle => 'Suggested Allocation';

  @override
  String get minus30AllocationText =>
      '• 使用約20%的可用現金\n• 繼續逐步累積\n• 避免過快投入全部資金\n• 為更深下跌保留彈性';

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
  String get minus40Title => '-40% 策略';

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
  String get minus50Title => '-50% 策略';

  @override
  String get minus50Headline => '用全部剩餘現金買入 TQQQ';

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
  String get exchangeUsdKrw => '美元/韓元';

  @override
  String get exchangeUsdJpy => '美元/日圓';

  @override
  String get exchangeEurUsd => '歐元/美元';

  @override
  String get exchangeUsdRub => '美元/盧布';

  @override
  String get exchangeUsdTwd => '美元/新台幣';

  @override
  String get exchangeUsdCny => '美元/人民幣';

  @override
  String get fearGreedExtremeFear => '極度恐懼';

  @override
  String get fearGreedFear => '恐懼';

  @override
  String get fearGreedNeutral => '中性';

  @override
  String get fearGreedGreed => '貪婪';

  @override
  String get fearGreedExtremeGreed => '極度貪婪';

  @override
  String get fearGreedIndicatorsTitle => '7項恐懼與貪婪指標';

  @override
  String get fearGreedFaqTitle => '恐懼與貪婪指數說明';

  @override
  String get fearGreedWhatTitle => 'CNN恐懼與貪婪指數是什麼？';

  @override
  String get fearGreedWhatBody =>
      '恐懼與貪婪指數用來衡量股票市場情緒，以及股價是否可能處於合理水準。過度恐懼往往壓低股價，過度貪婪則可能推升股價。';

  @override
  String get fearGreedCalculatedTitle => '它如何計算？';

  @override
  String get fearGreedCalculatedBody =>
      '該指數結合七項市場指標：市場動能、股價強度、市場廣度、賣權/買權、垃圾債需求、市場波動率與避險資產需求。每項指標權重相同，形成0到100分。';

  @override
  String get fearGreedFrequencyTitle => '多久更新一次？';

  @override
  String get fearGreedFrequencyBody => '每個組成指標與整體指數都會在新的市場資料可用時更新。';

  @override
  String get fearGreedUseTitle => '應該如何使用？';

  @override
  String get fearGreedUseBody =>
      '可作為觀察市場情緒的輔助指標。它能幫助辨識情緒極端，但實際決策仍應搭配價格、基本面、風險管理與自己的策略。';

  @override
  String get strategyAdLabel => '廣告';

  @override
  String get alertSettingsTitle => '通知設定';

  @override
  String get alertSettingsCloseBasisNote => '通知會以收盤價為基準發送。';

  @override
  String get alertHighTitle => '新高提醒';

  @override
  String get alertHighSubtitle => '安装后创下新高时提醒';

  @override
  String get alertMarketOpenTitle => '開盤提醒';

  @override
  String get alertMarketOpenSubtitle => '美股常规交易开始时每天提醒一次';

  @override
  String get alertStrategySettingTitle => '策略提醒';

  @override
  String get alertStrategySettingSubtitle => '提醒 -20%、-30%、-40%、-50% 区间变化';

  @override
  String get noBuyHeadline => '禁止追加買入，保持30%現金';

  @override
  String get noBuyActionTitle => '立即行动';

  @override
  String get noBuyActionText => '不要新买QLD/TQQQ。维持现有QLD仓位，并保留30%现金。';

  @override
  String get noBuyCashTitle => '现金规则';

  @override
  String get noBuyCashText => '现金是为下一轮下跌区间准备的储备资金。即使市场上涨也不要减少。';

  @override
  String get noBuyAvoidTitle => '避免';

  @override
  String get noBuyAvoidText => '不要因为价格上涨就追买。等待-20%区间出现。';

  @override
  String get noBuyNextTitle => '下一步';

  @override
  String get noBuyNextText => '到达-20%后，准备开始小额分批定投TQQQ。';

  @override
  String get minus20ActionTitle => '立即行动';

  @override
  String get minus20ActionText => '每週用持有現金的1%定投TQQQ。\n例）現金500美元 → 每週買入5美元';

  @override
  String get minus20BuyRuleTitle => '目的';

  @override
  String get minus20BuyRuleText =>
      '從-20%區間開始設定，是為了在市場橫盤時也能少量累積，逐步降低TQQQ平均成本。重點不是馬上抓到獲利，而是建立更低的平均成本。';

  @override
  String get minus20CashTitle => '现金管理';

  @override
  String get minus20CashText =>
      '大部分現金仍要保留給-30%、-40%、-50%區間。即使在-50%時用完計畫現金，之後新增現金也透過每週定投繼續降低平均成本。\n\n即使市場橫盤超過10週，也要繼續每週定投總現金的1%。橫盤越久，累積的份額越多，沒有理由停止。\n\n到達-30%區間時，將當時剩餘現金的20%一次性追加買入。每週定投不停止，與-30%策略同步繼續。定投的結束時機是前高點收復並進行再平衡時。';

  @override
  String get minus20AvoidTitle => '賣出標準';

  @override
  String get minus20AvoidText =>
      '這個區間累積的TQQQ不在每次短線反彈時賣出。應視為之後創新高並整理TQQQ部位時一起處理的部分。';

  @override
  String get minus30ActionTitle => '立即行动';

  @override
  String get minus30ActionText => '只使用可用現金的20%買入TQQQ。下單前先確認現金總額。';

  @override
  String get minus30BuyRuleTitle => '买入规则';

  @override
  String get minus30BuyRuleText =>
      '如果現金為 \$10,000，只使用 \$2,000 買入 TQQQ，並保留剩餘80%。';

  @override
  String get minus30AdditionalTitle => '追加行动';

  @override
  String get minus30AdditionalText => 'QLD定投可以继续，但TQQQ追加买入要等到下一个区间。';

  @override
  String get minus30AvoidTitle => '避免';

  @override
  String get minus30AvoidText => '不要因为确信反弹就大量使用现金。要按-40%区间仍可能到来的前提行动。';

  @override
  String get minus40ActionTitle => '立即行动';

  @override
  String get minus40ActionText => '使用剩余现金的30%买入TQQQ。计算时排除-30%已经使用的金额。';

  @override
  String get minus40BuyRuleTitle => '买入规则';

  @override
  String get minus40BuyRuleText => '如果剩餘現金為 \$8,000，只使用 \$2,400。關鍵是不要一次全部投入。';

  @override
  String get minus40HoldTitle => '持有规则';

  @override
  String get minus40HoldText => '继续持有QLD，TQQQ只增加到计划比例。为进一步下跌保留现金。';

  @override
  String get minus40AvoidTitle => '避免';

  @override
  String get minus40AvoidText => '不要因恐惧卖出现有仓位，也不要因贪婪全额买入。';

  @override
  String get minus50ActionTitle => '立即行动';

  @override
  String get minus50ActionText => '使用所有剩余现金买入TQQQ。这是计划中的最后现金投入阶段。';

  @override
  String get minus50BuyRuleTitle => '买入规则';

  @override
  String get minus50BuyRuleText => '以排除-30%、-40%已使用金额后的实际剩余现金为基准。';

  @override
  String get minus50AfterTitle => '之后行动';

  @override
  String get minus50AfterText => '之后有新增现金时，定期累积TQQQ或QLD，专注降低平均成本。';

  @override
  String get minus50AvoidTitle => '避免';

  @override
  String get minus50AvoidText => '不要只因亏损较大就放弃。不要用债务或短期生活资金追加买入。';

  @override
  String get alertNasdaq200Title => '納斯達克100 200日線提醒';

  @override
  String get alertNasdaq200Subtitle => '納斯達克100跌破或突破200日線時提醒';

  @override
  String get alertNasdaq200Breakdown => '納斯達克100跌破200日均線';

  @override
  String get alertNasdaq200Breakout => '納斯達克100重新突破200日均線';

  @override
  String get chartGuideTitle => '如何查看此圖表';

  @override
  String get chartMiniTitle => '3個月圖表與20日、200日移動平均線';

  @override
  String get chartGuideCandleTitle => '3個月K線';

  @override
  String get chartGuideCandleBody => '一眼查看QLD近3個月的價格走勢。綠色表示收高，紅色表示收低。';

  @override
  String get chartGuideMa200Title => '200日線';

  @override
  String get chartGuideMa200Body => '用於觀察長期趨勢的參考線。價格在其上方偏強，在其下方則檢查風險和現金比例。';

  @override
  String get chartMa200SheetTitle => '什麼是200日移動平均線？';

  @override
  String get chartMa200SheetBody =>
      '200日移動平均線是用最近約200個交易日的收盤價平均計算出的長期趨勢線。\n\n許多投資者會參考它，因為它能過濾短期波動，讓市場的大方向更容易看清。價格位於200日線上方時，通常被理解為長期趨勢相對健康；位於下方時，可能代表動能轉弱或需要重新檢查風險。\n\n它不應單獨作為買入或賣出訊號。對於QLD這類波動較大的槓桿ETF，更適合作為參考指標，並與現金比例、回撤幅度、平均成本和投資週期一起判斷。';

  @override
  String get chartMa20SheetTitle => '什麼是20日移動平均線？';

  @override
  String get chartMa20SheetBody =>
      '20日移動平均線是用最近約20個交易日的收盤價平均計算出的短期趨勢線。\n\n許多投資者會關注它，因為它比200日線反應更快，更容易觀察近期動能。價格持續在20日線上方，通常表示短期走勢較強；反覆跌破則可能代表近期趨勢正在轉弱。\n\n對於QLD這類波動較大的槓桿ETF，20日線有助於判斷短期速度和波動，但也容易出現假訊號。最好與200日線、現金比例和計畫買入區間一起參考。';

  @override
  String get alertPortfolioCashTitle => '現金再平衡提醒';

  @override
  String get alertPortfolioCashSubtitle => '當股價上漲等導致現金比例低於20%時提醒';

  @override
  String get alertPortfolioCashHigh => '現金比例低於20%。請考慮再平衡以補充現金。';

  @override
  String get alertPortfolioCashLow => '現金比例低於20%。請考慮再平衡以補充現金。';

  @override
  String get alertAnnouncementTitle => '公告通知';

  @override
  String get alertAnnouncementSubtitle => '接收 QLD DIP ALERT 傳送的公告推播';

  @override
  String get alertDetailTitle => '提醒詳情';

  @override
  String get alertDetailOpenStrategy => '查看策略';

  @override
  String get alertDetailRecovery => '下跌區間已改善。請冷靜檢查投資組合，避免匆忙賣出或衝動買入。';

  @override
  String get alertDetailNewHigh => '安裝後記錄了新的最高價。它將作為未來下跌率計算的新基準。';

  @override
  String get alertDetailMarketOpen => '美股常規交易已開始。只有今天計畫行動時再檢查價格和策略提醒。';

  @override
  String get alertDetailNasdaq200Breakdown =>
      '納斯達克100跌破200日均線。長期趨勢可能轉弱，請檢查風險和現金比例。';

  @override
  String get alertDetailNasdaq200Breakout =>
      '納斯達克100重新站上200日均線。趨勢可能改善，但仍應遵循計畫策略。';

  @override
  String get alertDetailPortfolioCashHigh =>
      '現金比例低於20%參考線。這通常代表股價上漲後持倉比例變大、現金緩衝變小。請考慮減持部分部位，並再平衡到計畫的現金比例。';

  @override
  String get alertDetailPortfolioCashLow =>
      '現金比例低於20%參考線。這通常代表股價上漲後持倉比例變大、現金緩衝變小。請考慮減持部分部位，並再平衡到計畫的現金比例。';

  @override
  String get alertDetailOpenLink => '開啟連結';

  @override
  String get appUpdateTitle => '有可用更新';

  @override
  String get appUpdateMessage => '有新版本可用。請更新以使用最新功能與修正。';

  @override
  String get appUpdateLater => '稍後';

  @override
  String get appUpdateNow => '更新';

  @override
  String get alertTestTitle => '通知測試';

  @override
  String get alertPermissionHelpTitle => '收不到通知嗎？';

  @override
  String get alertPermissionHelpBody => '如果裝置通知權限已關閉，測試通知也可能不會顯示。';

  @override
  String get alertPermissionRequest => '請求權限';

  @override
  String get alertPermissionOpenSettings => '開啟設定';

  @override
  String get holdPageTitle => '繼續持有';

  @override
  String get holdHeadline => '計畫中的買入已經完成。復甦階段應專注於繼續持有。';

  @override
  String get holdPositionTitle => '目前持有原則';

  @override
  String get holdPositionText =>
      '繼續持有已買入的QLD與TQQQ。不要僅因價格重新進入已復甦的區間，就重複執行先前區間的買入。';

  @override
  String get holdActionTitle => '目前行動';

  @override
  String get holdActionText => '暫停追加買入TQQQ並觀察復甦走勢。保留剩餘現金，以應對再次下跌。';

  @override
  String get holdAvoidTitle => '禁止行為';

  @override
  String get holdAvoidText => '不要因波動而匆忙賣出，也不要因確信會復甦而衝動追加買入。';

  @override
  String get holdResetTitle => '策略重設';

  @override
  String get holdResetText => '當QLD完全復甦至前高時，本輪下跌週期結束，策略將回到最初的禁止買入狀態。';

  @override
  String get rebalanceTitle => '再平衡區間';

  @override
  String get rebalanceHeadline => '賣出TQQQ並回歸基礎倉位';

  @override
  String get rebalanceOverviewTitle => '策略概述';

  @override
  String get rebalanceOverviewText =>
      '歷史新高的收復意味著危機應對階段已結束。現在是賣出在-20%及以下區間積累的TQQQ，並回歸基礎倉位（QLD 70%，現金 30%）的時候了。';

  @override
  String get rebalanceActionTitle => '立即行動';

  @override
  String get rebalanceActionText => '賣出所有在-20%及以下區間積累或購買的TQQQ。然後按照基礎倉位配置調整資產。';

  @override
  String get rebalanceCashTitle => '現金目標';

  @override
  String get rebalanceCashText =>
      '再平衡後維持QLD 70%、現金 30%的比例。將獲得的現金作為下次下跌區間的備用資金保管。';

  @override
  String get rebalanceAvoidTitle => '需要避免的行為';

  @override
  String get rebalanceAvoidText => '歷史新高收復後不要繼續積累TQQQ。在此階段賣出危機階段積累的倉位，回歸基礎倉位。';

  @override
  String get investmentCalculatorTitle => '預期報酬率計算器';

  @override
  String get investmentCalculatorSubtitle => '依QLD過去平均進行簡單複利計算';

  @override
  String get investmentCalculatorReturnRate => '10年平均報酬率';

  @override
  String get investmentCalculatorLumpSumTitle => '單筆投資 + 逢低買入';

  @override
  String get investmentCalculatorAmount => '投資金額';

  @override
  String get investmentCalculatorYears => '期間';

  @override
  String get investmentCalculatorExpectedValue => '預估市值';

  @override
  String get investmentCalculatorPrincipalMultiple => '本金倍數';

  @override
  String get investmentCalculatorMonthlyTitle => '定期投資';

  @override
  String get investmentCalculatorMonthlyAmount => '每月金額';

  @override
  String get investmentCalculatorTotalPrincipal => '總投入';

  @override
  String get investmentCalculatorExpectedProfit => '預估收益';

  @override
  String get investmentCalculatorDisclaimer => '這是依過去報酬率進行的簡單計算，並不保證未來報酬。';

  @override
  String get investmentCalculatorYearsSuffix => '年';

  @override
  String get investmentCalculatorTimesSuffix => '倍';

  @override
  String get investmentCalculatorChartHint => '你可以透過歷史圖表驗證平均報酬率。';

  @override
  String get investmentCalculatorCurrencySectionTitle => '匯率換算';

  @override
  String get investmentCalculatorCurrency => '國家/貨幣';

  @override
  String get investmentCalculatorExchangeRate => '1 USD 匯率';

  @override
  String get investmentCalculatorExchangeRateHint => '請輸入所選貨幣中1美元對應的金額。';

  @override
  String get investmentCalculatorConvertedLumpSum => '單筆投資最終金額';

  @override
  String get investmentCalculatorConvertedMonthly => '定期投資最終金額';

  @override
  String get investmentCurrencyUnitedStatesUsd => '美國 USD';

  @override
  String get investmentCurrencyKoreaKrw => '韓國 KRW';

  @override
  String get investmentCurrencyJapanJpy => '日本 JPY';

  @override
  String get investmentCurrencyChinaCny => '中國 CNY';

  @override
  String get investmentCurrencyTaiwanTwd => '台灣 TWD';

  @override
  String get investmentCurrencyGermanyEur => '德國 EUR';

  @override
  String get investmentCurrencyFranceEur => '法國 EUR';

  @override
  String get investmentCurrencySpainEur => '西班牙 EUR';

  @override
  String get investmentCurrencyPortugalEur => '葡萄牙 EUR';

  @override
  String get investmentCurrencyRussiaRub => '俄羅斯 RUB';

  @override
  String get contentTitle => '內容';

  @override
  String get contentInquiry => '諮詢';

  @override
  String get contentInquirySubtitle => '留下匿名問題並查看回覆。';

  @override
  String get contentInquiryBadge => 'Q&A';

  @override
  String get contentCloseGuess => '收盤價猜測';

  @override
  String get contentStockQuote => '今日股票名言';

  @override
  String get contentStockQuoteSubtitle => '磨練投資直覺的簡短名言。';

  @override
  String get contentStockQuoteBadge => '每日';

  @override
  String get contentNumberGuess => '猜數字';

  @override
  String get contentNumberGuessSubtitle => '輕鬆享受的機率小遊戲。';

  @override
  String get contentNumberGuessBadge => '遊戲';

  @override
  String get contentBookReader => '專欄';

  @override
  String get contentBookReaderSubtitle => '可以從容閱讀的公共領域文本。';

  @override
  String get contentBookReaderBadge => '閱讀';

  @override
  String get contentStockMeme => '股票迷因';

  @override
  String get contentLottoNumbers => '樂透號碼推薦';

  @override
  String get contentJumpDodge => '跳躍閃避遊戲';

  @override
  String get contentJumpDodgeSubtitle => '短暫專注享受的跳躍小遊戲。';

  @override
  String get contentJumpDodgeBadge => '動作';

  @override
  String get stockQuoteTitle => '今日股票名言';

  @override
  String get stockQuoteTapHint => '點一下可查看另一句話。';

  @override
  String get stockQuoteShuffle => '查看另一句名言';

  @override
  String get usageGuideTitle => 'App 使用方法';

  @override
  String get usageGuideSubtitle => '長期那斯達克2倍槓桿策略規則';

  @override
  String get usageGuideCardTitle => 'App 使用方法';

  @override
  String get usageGuideCardSubtitle => '基礎部位、下跌區間、買入紀錄、輔助指標';

  @override
  String get usageGuideWhatAppTitle => '這是什麼 App？';

  @override
  String get usageGuideWhatAppBody =>
      '這個 App 是面向長期那斯達克2倍槓桿投資者的行動規則指南。\n\n它會自動計算目前價格相對歷史最高點的回撤幅度，幫助確認目前位置，並為不同區間提供對應的投資策略。\n\n它幫助你不被市場的恐懼與貪婪左右，持續執行計畫好的投資原則。';

  @override
  String get usageGuideNoBuyTitle => '1. 先閱讀基礎部位和策略';

  @override
  String get usageGuideNoBuyBody =>
      '先點擊主畫面的「基礎部位卡片」，閱讀如何準備。同時點擊右下角的「策略」分頁，了解詳細策略。\n\n* 用總持有資金的70%購買QLD。';

  @override
  String get usageGuideStrategyTitle => '2. 查看下跌區間自動策略';

  @override
  String get usageGuideStrategyBody =>
      '主畫面的「策略卡片」會在QLD相較歷史最高價下跌一定百分比時自動顯示對應區間。點擊該卡片即可進行相應的買入或再平衡操作。符合條件時也會發送提醒。';

  @override
  String get usageGuideIndicatorsTitle => '四個輔助指標';

  @override
  String get usageGuideIndicatorsBody =>
      'CNN F&G顯示市場情緒更偏恐懼還是貪婪。\n\nVIX顯示市場波動和不安程度，數字越高通常代表市場越緊張。\n\n美國主要日程包括NFP、CPI、FOMC。NFP看就業，CPI看通膨，FOMC看利率方向。這些結果可能讓那斯達克和QLD大幅波動。\n\n10年國債殖利率是美國10年期國債利率。快速上升時，可能對成長股、那斯達克和QLD形成壓力。';

  @override
  String get usageGuideQldTitle => '3. 買入後記錄到投資組合';

  @override
  String get usageGuideQldBody =>
      '參考顯示的策略和金額，在自己使用的券商買入。買入後，在 App 的投資組合中記錄數量、平均價格和現金。';

  @override
  String get usageGuideDisclaimer => '本 App 內容僅供投資參考，不保證收益。';

  @override
  String get usageGuideConfirm => '確定';

  @override
  String get bookReadingTitle => '專欄';

  @override
  String bookReaderPageNumber(int page) {
    return '第$page頁';
  }

  @override
  String get numGuessPrompt => '猜一個1到1000之間的數字。';

  @override
  String get numGuessInvalidInput => '請輸入1到1000之間的數字。';

  @override
  String numGuessCorrect(int attempts) {
    return '正確！您用了$attempts次猜對了。';
  }

  @override
  String get numGuessTooLow => '數字更大。';

  @override
  String get numGuessTooHigh => '數字更小。';

  @override
  String numGuessAttemptsLabel(int count) {
    return '嘗試次數: $count';
  }

  @override
  String numGuessLastGuessLabel(int number) {
    return '你的輸入: $number';
  }

  @override
  String get numGuessInputHint => '輸入數字';

  @override
  String get numGuessConfirm => '確認';

  @override
  String get numGuessNewGame => '新遊戲';

  @override
  String get numGuessRanking => '排名';

  @override
  String get numGuessNoRecords => '暫無記錄。';

  @override
  String numGuessAttemptCount(int count) {
    return '$count次';
  }

  @override
  String get jumpLeaderboard => '排行榜';

  @override
  String get jumpScore => '分數';

  @override
  String get jumpPersonalBest => '個人最佳';

  @override
  String get jumpTapToRestart => '點擊重新開始';

  @override
  String get jumpTapToStart => '點擊開始';

  @override
  String get jumpInstruction => '點擊螢幕跳躍並躲避障礙物。';

  @override
  String get inquiryLoadError => '無法載入問題列表。';

  @override
  String get inquiryAdminOnlyReply => '只有管理員可以回覆。';

  @override
  String get inquiryReplyEmpty => '請輸入回覆內容。';

  @override
  String get inquiryReplyError => '提交回覆失敗，請稍後重試。';

  @override
  String get inquiryAdminOnlyPin => '只有管理員可以置頂。';

  @override
  String get inquiryPinError => '無法儲存置頂狀態。';

  @override
  String get inquiryAdminOnlyDelete => '只有管理員可以刪除。';

  @override
  String get inquiryDeleteTitle => '刪除問題';

  @override
  String get inquiryDeleteConfirm => '刪除此問題嗎？';

  @override
  String get inquiryCancel => '取消';

  @override
  String get inquiryDeleteAction => '刪除';

  @override
  String get inquiryDeleteError => '刪除失敗，請稍後重試。';

  @override
  String get inquiryContentEmpty => '請輸入問題內容。';

  @override
  String get inquirySubmitError => '提交問題失敗，請稍後重試。';

  @override
  String get inquiryAdminLabel => '管理員';

  @override
  String get inquiryPasswordLabel => '密碼';

  @override
  String get inquiryPasswordWrong => '密碼不正確。';

  @override
  String get inquiryAdminActivatedRegistered => '管理員模式已啟用（裝置已註冊）';

  @override
  String get inquiryAdminActivatedFailed => '管理員模式已啟用（裝置註冊失敗）';

  @override
  String get inquiryContentDetailLabel => '問題內容';

  @override
  String get inquiryAdminReplyLabel => '管理員回覆';

  @override
  String get inquiryAdminReplyEdit => '編輯回覆';

  @override
  String get inquirySaving => '儲存中...';

  @override
  String get inquirySubmitReply => '提交回覆';

  @override
  String get inquiryPrevPage => '上一頁';

  @override
  String get inquiryNextPage => '下一頁';

  @override
  String inquiryPageOf(int current, int total) {
    return '第$current頁 / 共$total頁';
  }

  @override
  String get inquiryUnpin => '取消置頂';

  @override
  String get inquiryPin => '置頂';

  @override
  String get inquiryListTitle => '問題列表';

  @override
  String get inquiryEmpty => '暫無問題。';

  @override
  String get inquiryWriteTitle => '寫問題';

  @override
  String get inquiryContentFieldLabel => '內容';

  @override
  String get inquirySubmitting => '提交中...';

  @override
  String get inquirySubmitButton => '提交';

  @override
  String get inquiryUserReplyLabel => '新增後續訊息...';

  @override
  String get indicatorCnnFearGreed => 'CNN 恐懼貪婪';

  @override
  String get indicatorVix => 'VIX 波動率';

  @override
  String get indicatorUsSchedule => '美國重要發布日程';

  @override
  String get indicatorTenYearYield => '美國10年國債收益率';

  @override
  String get indicatorUsMarketTime => '美國市場剩餘時間';

  @override
  String get indicatorVixHigh => '高波動區間';

  @override
  String get indicatorVixStable => '正常區間';

  @override
  String get indicatorVixDefault => '市場恐慌指標';

  @override
  String get indicatorVixLow => '波動率極低區間';

  @override
  String get indicatorVixCaution => '注意區間';

  @override
  String get indicatorTenYearDesc => '美國10年期國債利率';

  @override
  String get marketWeekendLabel => '週末休市·距開市';

  @override
  String get marketPreOpenLabel => '距開市';

  @override
  String get marketToCloseLabel => '距收市';

  @override
  String get marketClosedLabel => '市場休市';

  @override
  String get marketClosedValue => '休市中';

  @override
  String get noData => '暫無數據';

  @override
  String get rsiOverbought => '超買';

  @override
  String get rsiOversold => '超賣';

  @override
  String get rsiNormal => '中性';

  @override
  String get rsiOverboughtZone => '超買區間';

  @override
  String get rsiOversoldZone => '超賣區間';

  @override
  String get rsiNormalZone => '正常範圍';

  @override
  String get rsiOverboughtOversold => '超買 / 超賣';

  @override
  String get coverStrategyTab => '策略標籤';

  @override
  String get coverStrategyHint => '向上滑動查看策略標籤';

  @override
  String get usScheduleSheetTitle => '美國主要行程';

  @override
  String get noScheduleLeft => '暫無已登記事件';

  @override
  String get scheduleNameHint => '事件名稱';

  @override
  String get adminPassword => '管理員密碼';

  @override
  String get addSchedule => '新增日程';

  @override
  String get wrongPassword => '密碼不正確。';

  @override
  String get checkScheduleNameAndDate => '請確認活動名稱和日期。';

  @override
  String get editSchedule => '編輯日程';

  @override
  String get rsiDialogTitle => 'RSI(14)是什麼？';

  @override
  String get rsiDialogContent =>
      'RSI（相對強弱指數）透過比較過去14天的漲跌幅，以0~100的數值表示當前股價的超買或超賣狀態。\n\n• 70以上 → 超買區間\n  短期急漲後調整的可能性較高。\n\n• 30以下 → 超賣區間\n  短期急跌後可能出現反彈。\n\n• 30~70 → 正常範圍\n  無超買或超賣訊號。';

  @override
  String get inquiryEditMessageTitle => '編輯訊息';

  @override
  String get inquiryEditMessageSave => '儲存';

  @override
  String get inquiryTapToEdit => '點擊編輯';

  @override
  String get stockQuoteList =>
      '別人貪婪時要謹慎，別人恐懼時要看到機會。 — 沃倫·巴菲特\n價格是你支付的，價值是你得到的。 — 沃倫·巴菲特\n以合理的價格買入優秀的公司比較好。 — 沃倫·巴菲特\n不要投資你不了解的業務。 — 沃倫·巴菲特\n風險來自於不知道自己在做什麼。 — 沃倫·巴菲特\n買了好公司，持有期越長越好。 — 沃倫·巴菲特\n建立聲譽需要很長時間，而失去它只需要一瞬間。 — 沃倫·巴菲特\n市場波動不是威脅，而是機會。 — 沃倫·巴菲特\n潮水退去才知道誰在裸泳。 — 沃倫·巴菲特\n投資者應該專注於避免大錯誤，而不是追求全壘打。 — 沃倫·巴菲特\n在能力圈內行動，錯誤就會減少。 — 沃倫·巴菲特\n買股票是買企業的一部分，而不是一張紙。 — 沃倫·巴菲特\n只買即使市場關閉10年你也願意持有的股票。 — 沃倫·巴菲特\n關注企業的長期盈利能力，而不是短期價格。 — 沃倫·巴菲特\n優秀的商業結構往往比優秀的管理層更重要。 — 沃倫·巴菲特\n選擇簡單確定的，而非複雜不確定的。 — 沃倫·巴菲特\n投資自己可能是最好的投資。 — 沃倫·巴菲特\n能夠長期堅持的判斷比衝動交易更重要。 — 沃倫·巴菲特\n不需要打每一個球，等待好球來臨。 — 沃倫·巴菲特\n投資中氣質比智商更重要。 — 沃倫·巴菲特\n優秀的企業隨著時間推移會展現其價值。 — 沃倫·巴菲特\n真正理解好業務比買得便宜更重要。 — 沃倫·巴菲特\n關注企業的現金流，而不是市場雜訊。 — 沃倫·巴菲特\n依靠債務的投資會讓好的判斷也變得危險。 — 沃倫·巴菲特\n現金讓你在機會來臨時能夠行動。 — 沃倫·巴菲特\n大錢來自等待，而不是頻繁交易。 — 查理·蒙格\n與其努力變聰明，不如避免愚蠢的行為。 — 查理·蒙格\n問題難以解決時，試著反向思考。 — 查理·蒙格\n聲譽和誠信可以在一瞬間消失。 — 查理·蒙格\n長期持有好業務是複利的核心。 — 查理·蒙格\n理解激勵機制有助於更好地理解人的行為。 — 查理·蒙格\n行動越頻繁，犯錯的機會也越多。 — 查理·蒙格\n投資需要等待的能力。 — 查理·蒙格\n好的判斷來自於將多個領域的知識聯繫起來。 — 查理·蒙格\n優質業務讓時間成為投資者的朋友。 — 查理·蒙格\n機會稀少時，有準備的人更有優勢。 — 查理·蒙格\n每天少一點愚蠢比每天聰明一點更重要。 — 查理·蒙格\n成功來自堅持基本原則，而非複雜公式。 — 查理·蒙格\n好的投資讓沒有耐心的人感到不舒服。 — 查理·蒙格\n不必親歷所有錯誤，從他人的錯誤中學習。 — 查理·蒙格\n卓越的成果來自在罕見機會出現時大膽行動。 — 查理·蒙格\n警惕以過高價格買入好業務的錯誤。 — 查理·蒙格\n投資中最危險的話是「我大概知道」的錯覺。 — 查理·蒙格\n保持簡單有助於長期業績。 — 查理·蒙格\n要戰勝市場，首先要戰勝自己的衝動。 — 查理·蒙格\n安全邊際是投資者的盾牌。 — 班傑明·葛拉漢\n短期市場是投票機，長期市場是稱重機。 — 班傑明·葛拉漢\n聰明的投資者向樂觀者賣出，向悲觀者買入。 — 班傑明·葛拉漢\n價格波動是建議，不是命令。 — 班傑明·葛拉漢\n投資應基於分析，投機依賴預期。 — 班傑明·葛拉漢\n不要被市場先生的情緒左右，要利用它。 — 班傑明·葛拉漢\n以遠低於價值的價格買入是應對錯誤的方法。 — 班傑明·葛拉漢\n防止損失的原則優先於創造利潤的原則。 — 班傑明·葛拉漢\n市場有時非理性，但價值終將得到反映。 — 班傑明·葛拉漢\n越不確定，安全邊際就越需要更大。 — 班傑明·葛拉漢\n投資者應先計算價值，再看價格。 — 班傑明·葛拉漢\n好的分析來自冷靜，而非興奮。 — 班傑明·葛拉漢\n防禦性投資者避免過度自信。 — 班傑明·葛拉漢\n沒有原則的預期收益更接近投機而非投資。 — 班傑明·葛拉漢\n市場的變幻無常可以成為長期投資者的朋友。 — 班傑明·葛拉漢\n僅僅便宜是不夠的，需要價值和安全邊際。 — 班傑明·葛拉漢\n相信數字和價值，而非大眾情緒。 — 班傑明·葛拉漢\n承認可能犯錯的人能活得更久。 — 班傑明·葛拉漢\n投資中第一個問題不是能賺多少，而是可能虧多少。 — 班傑明·葛拉漢\n好的投資是有充分依據和充分安全邊際的決策。 — 班傑明·葛拉漢\n要知道持有什麼，為什麼持有。 — 彼得·林奇\n股票不是彩券，而是企業的一部分。 — 彼得·林奇\n企業做好了，長期股價也會跟上。 — 彼得·林奇\n可以在自己熟悉的領域找到投資想法。 — 彼得·林奇\n沒有調研的投資接近於希望。 — 彼得·林奇\n下跌市場會重複出現，重要的是能否堅持。 — 彼得·林奇\n在股市中，勇氣和知識同樣重要。 — 彼得·林奇\n好股票的故事改變時也要重新審視。 — 彼得·林奇\n不需要每隻股票都成功，大贏家改變整個投資組合。 — 彼得·林奇\n企業的故事先於股價。 — 彼得·林奇\n即使了解的業務也要確認數字。 — 彼得·林奇\n與其試圖預測市場，不如專注於尋找好公司。 — 彼得·林奇\n個人投資者可以在日常生活中首先發現好企業。 — 彼得·林奇\n不受歡迎的好企業有時會給予更大的機會。 — 彼得·林奇\n如果沒有承受急跌的勇氣，就應降低股票比例。 — 彼得·林奇\n不要愛上股票，要確認企業業績。 — 彼得·林奇\n最大的錯誤是假裝知道自己不知道的事。 — 彼得·林奇\n好的投資想法不需要複雜的解釋。 — 彼得·林奇\n不要僅因股價下跌就以為便宜。 — 彼得·林奇\n成長股的成長故事破裂時要重新審視。 — 彼得·林奇\n投資的制勝公式是廣泛持有並長期堅持。 — 約翰·柏格\n保持方向，不要因市場雜訊改變計劃。 — 約翰·柏格\n不要在乾草堆裡找針，買下整個乾草堆。 — 約翰·柏格\n成本是確定的損失，收益是不確定的。 — 約翰·柏格\n時間是朋友，衝動是敵人。 — 約翰·柏格\n投機情緒在前，投資減少情緒。 — 約翰·柏格\n長期投資者不需要預測市場。 — 約翰·柏格\n低成本是投資者能控制的最強變數。 — 約翰·柏格\n持有整個市場可以減少個股失誤。 — 約翰·柏格\n什麼都不做的能力是投資者的競爭優勢。 — 約翰·柏格\n簡單的指數基金比複雜產品存活更久。 — 約翰·柏格\n追求收益的行為可能降低收益。 — 約翰·柏格\n投資者不能預知未來，但可以降低成本。 — 約翰·柏格\n分散、低成本、長期持有是基礎。 — 約翰·柏格\n市場長期反映整體企業的業績。 — 約翰·柏格\n查看越頻繁，動搖的理由越多。 — 約翰·柏格\n投資計劃應用原則而非情緒維持。 — 約翰·柏格\n枯燥的投資可以產生最強的結果。 — 約翰·柏格\n持續獲得市場平均收益也是強大的策略。 — 約翰·柏格\n長期投資最大的敵人是成本和情緒。 — 約翰·柏格\n卓越的投資始於與眾不同、更深入地思考。 — 霍華德·馬克斯\n風險不是波動性，而是永久損失的可能性。 — 霍華德·馬克斯\n風險無法消除，但可以控制。 — 霍華德·馬克斯\n價格越高，未來收益的安全邊際越小。 — 霍華德·馬克斯\n忽視週期的投資者會反複感到驚訝。 — 霍華德·馬克斯\n即使好資產，買得太貴也會變成壞投資。 — 霍華德·馬克斯\n投資中重要的是損益的不對稱性，而非正確的頻率。 — 霍華德·馬克斯\n防禦必須在熊市來臨之前準備好。 — 霍華德·馬克斯\n大眾越有把握，就越需要反向思考。 — 霍華德·馬克斯\n當你理解價格與價值的差距時，利潤就產生了。 — 霍華德·馬克斯\n成功的投資是善於玩概率遊戲。 — 霍華德·馬克斯\n過於良好的氛圍讓風險看起來便宜。 — 霍華德·馬克斯\n市場心理會讓價格偏離價值。 — 霍華德·馬克斯\n保守投資不是放棄機會，而是提高生存概率。 — 霍華德·馬克斯\n風險管理在收益好時最為必要。 — 霍華德·馬克斯\n二階思維是對所有人看到的事物進行不同解讀的能力。 — 霍華德·馬克斯\n最佳買入時機通常不會在最舒適的時刻出現。 — 霍華德·馬克斯\n看不到風險是最大的風險。 — 霍華德·馬克斯\n市場越接近極端，謹慎就越重要。 — 霍華德·馬克斯\n投資不是確定性遊戲，而是概率遊戲。 — 霍華德·馬克斯\n最大悲觀時期可能是最佳買入時機。 — 約翰·鄧普頓\n最大樂觀時期是考慮賣出的時候。 — 約翰·鄧普頓\n牛市在悲觀中誕生，在懷疑中成長，在樂觀中成熟。 — 約翰·鄧普頓\n當欣喜主導市場時，牛市變得危險。 — 約翰·鄧普頓\n最好的機會存在於人們回避的地方。 — 約翰·鄧普頓\n需要在別人賣出時買入的勇氣。 — 約翰·鄧普頓\n「這次不同了」這句話通常最為危險。 — 約翰·鄧普頓\n世界各地只要有便宜的價值，就應該能找到它。 — 約翰·鄧普頓\n悲觀論降低價格，低價格創造機會。 — 約翰·鄧普頓\n冷靜地審視大眾不喜歡的資產。 — 約翰·鄧普頓\n投資者應該是樂觀主義者，但對價格要冷靜。 — 約翰·鄧普頓\n偉大的機會從大眾關注之外開始。 — 約翰·鄧普頓\n最壞的消息並不總意味著最壞的投資。 — 約翰·鄧普頓\n如果價格足夠低，不確定性也能得到回報。 — 約翰·鄧普頓\n在悲觀中買入的人應該準備好在樂觀中賣出。 — 約翰·鄧普頓\n市場在情緒極端時會犯最大的錯誤。 — 約翰·鄧普頓\n機會更多地來自不舒適的地方，而非舒適的地方。 — 約翰·鄧普頓\n逆著大眾行動需要依據和勇氣。 — 約翰·鄧普頓\n長期收益可以從最不受歡迎時刻的判斷開始。 — 約翰·鄧普頓\n投資者不是回避恐懼的人，而是分析恐懼的人。 — 約翰·鄧普頓\n大錢不是來自猜對，而是堅持到最後。 — 傑西·李佛摩\n市場永遠不會錯，只有觀點會錯。 — 傑西·李佛摩\n總想行動的慾望會造成很多損失。 — 傑西·李佛摩\n損失必須在還小的時候承認。 — 傑西·李佛摩\n如果趨勢還在，就沒必要急著離開。 — 傑西·李佛摩\n判斷正確卻堅持不住，就很難賺大錢。 — 傑西·李佛摩\n認為每天都必須賺錢的想法會毀掉交易者。 — 傑西·李佛摩\n在虧損倉位上加倉是危險的習慣。 — 傑西·李佛摩\n不要試圖說服市場，要傾聽市場的聲音。 — 傑西·李佛摩\n在價格運動面前，自尊心會成為成本。 — 傑西·李佛摩\n比何時買入更重要的是知道何時判斷錯誤。 — 傑西·李佛摩\n大趨勢獎勵堅持的人。 — 傑西·李佛摩\n好的判斷也可能因為急於平倉而崩潰。 — 傑西·李佛摩\n市場不在乎個人的希望。 — 傑西·李佛摩\n頻繁交易製造的錯誤多於機會。 — 傑西·李佛摩\n大錢屬於懂得安靜坐等的人。 — 傑西·李佛摩\n要在投機中生存，首先要限制損失。 — 傑西·李佛摩\n不要無視價格所指示的方向。 — 傑西·李佛摩\n比信念更重要的是判斷錯誤時退出的能力。 — 傑西·李佛摩\n交易中的自制力與分析能力同樣重要。 — 傑西·李佛摩\n股市由資金和心理驅動。 — 安德烈·科斯托蘭尼\n主人慢慢走，狗跑來跑去，但最終一起到達。 — 安德烈·科斯托蘭尼\n投資者必須有錢、有想法、有耐心。 — 安德烈·科斯托蘭尼\n股市中最貴的東西是急躁。 — 安德烈·科斯托蘭尼\n大眾興奮時退後一步。 — 安德烈·科斯托蘭尼\n好的投資者讀懂市場情緒，但不跟隨它。 — 安德烈·科斯托蘭尼\n價格受心理影響，但價值需要時間。 — 安德烈·科斯托蘭尼\n投資需要想像力，但更需要耐心。 — 安德烈·科斯托蘭尼\n用借來的錢投資會讓時間成為敵人。 — 安德烈·科斯托蘭尼\n股票把沒耐心的人的錢轉移給有耐心的人。 — 安德烈·科斯托蘭尼\n以和大眾一樣的想法期待比大眾更好的結果是不現實的。 — 安德烈·科斯托蘭尼\n市場上心理比邏輯先行的日子很多。 — 安德烈·科斯托蘭尼\n沒有等待的投資接近於投機。 — 安德烈·科斯托蘭尼\n資金緊張的投資者難以承受市場的變幻無常。 — 安德烈·科斯托蘭尼\n下跌是痛苦的，但也是機會的語言。 — 安德烈·科斯托蘭尼\n過於頻繁地看市場會讓情緒先於思考。 — 安德烈·科斯托蘭尼\n耐心是投資者隱藏的資本。 — 安德烈·科斯托蘭尼\n即使好想法，沒有時間也可能失敗。 — 安德烈·科斯托蘭尼\n投資者必須相信自己的判斷，而非大眾的喝彩。 — 安德烈·科斯托蘭尼\n在市場中長期生存的人最終學到最多。 — 安德烈·科斯托蘭尼\n痛苦加上反思等於進步。 — 瑞·達利歐\n承認不知道是風險管理的開始。 — 瑞·達利歐\n混合低相關資產可以使投資組合更穩定。 — 瑞·達利歐\n沒有原則，危機時情緒就會替代決策。 — 瑞·達利歐\n如實看待現實的能力是良好決策的起點。 — 瑞·達利歐\n投資者需要可驗證的原則，而非單純的信念。 — 瑞·達利歐\n分散不是掩蓋無知，而是承認不確定性。 — 瑞·達利歐\n不瞭解自己的弱點，市場會替你展示。 — 瑞·達利歐\n好的系統即使在情緒化時刻也應用同樣的標準。 — 瑞·達利歐\n理解大局可以減少被短期雜訊動搖。 — 瑞·達利歐\n重要的不是對錯，而是對的時候賺多少，錯的時候虧多少。 — 喬治·索羅斯\n市場不只是反映現實，也會影響現實。 — 喬治·索羅斯\n迅速承認錯誤的能力是強大的武器。 — 喬治·索羅斯\n生存第一，利潤第二。 — 喬治·索羅斯\n信念越強，就越需要檢驗反面可能性。 — 喬治·索羅斯\n市場的幻覺可能持續很長時間。 — 喬治·索羅斯\n好的投資者迅速修正自己的錯誤。 — 喬治·索羅斯\n危險不是犯錯，而是堅持錯誤。 — 喬治·索羅斯\n機會越大，倉位管理就越重要。 — 喬治·索羅斯\n投資是在不完整資訊下做出決策。 — 喬治·索羅斯\n防禦先於進攻。 — 保羅·都鐸·瓊斯\n在虧損倉位上加倉最終會造成更大危險。 — 保羅·都鐸·瓊斯\n保護資本，下一個機會自然會來。 — 保羅·都鐸·瓊斯\n不要試圖在市場中當英雄。 — 保羅·都鐸·瓊斯\n將損失保持小的能力創造長期業績。 — 保羅·都鐸·瓊斯\n價格反向運動時，先削減風險。 — 保羅·都鐸·瓊斯\n避免大損失先於追求大收益。 — 保羅·都鐸·瓊斯\n交易中的自尊會放大損失。 — 保羅·都鐸·瓊斯\n防禦心態不是軟弱，而是生存策略。 — 保羅·都鐸·瓊斯\n沒有損失管理的進攻不會持久。 — 保羅·都鐸·瓊斯\n小的時候止損是原則。 — 威廉·歐奈爾·馬克·米納維尼\n強勢股票強勢有原因。 — 威廉·歐奈爾·馬克·米納維尼\n不要與趨勢對抗。 — 威廉·歐奈爾·馬克·米納維尼\n圖表有時比意見更快地顯示風險。 — 威廉·歐奈爾·馬克·米納維尼\n要捕捉大贏家，先要避開大輸家。 — 威廉·歐奈爾·馬克·米納維尼\n沒有規則的交易只是情緒的記錄。 — 威廉·歐奈爾·馬克·米納維尼\n尋找市場領導者，但用數字限制風險。 — 威廉·歐奈爾·馬克·米納維尼\n比買入更重要的是判斷錯誤時的行動。 — 威廉·歐奈爾·馬克·米納維尼\n好的入場也無法克服糟糕的停損習慣。 — 威廉·歐奈爾·馬克·米納維尼\n在牛市中，強勢股票可以變得更強。 — 威廉·歐奈爾·馬克·米納維尼\n對大多數投資者來說，持有整個市場是合理的。 — 伯頓·墨基爾\n如果很難預測市場，就以低成本長期參與。 — 伯頓·墨基爾\n不要對看似隨機的價格運動賦予過度意義。 — 伯頓·墨基爾\n指數投資簡單但是強大的選擇。 — 伯頓·墨基爾\n如果預測困難，就控制成本和分散。 — 伯頓·墨基爾\n投資者應專注於自己能控制的事情。 — 伯頓·墨基爾\n長期留在市場比預測市場更現實。 — 伯頓·墨基爾\n經過驗證的簡單性比流行策略更持久。 — 伯頓·墨基爾\n複雜的預測往往無法戰勝低成本的力量。 — 伯頓·墨基爾\n持續獲得平均收益的策略比想像中更強大。 — 伯頓·墨基爾\n優秀的企業有超越數字的質量因素。 — 菲利普·費雪\n評估成長股時，要同時看管理層和市場機會。 — 菲利普·費雪\n好企業持有越久越能展現其真正價值。 — 菲利普·費雪\n要了解企業，研究周圍所有人的聲音。 — 菲利普·費雪\n賣出可能比買入更難的決定。 — 菲利普·費雪\n長期成長企業提供承受短期波動的理由。 — 菲利普·費雪\n好的管理層創造數字中看不到的價值。 — 菲利普·費雪\n同時看成長潛力和價格。 — 菲利普·費雪\n不了解企業質量，長期持有也會動搖。 — 菲利普·費雪\n優秀的企業讓時間成為投資者的朋友。 — 菲利普·費雪\n安全邊際是承認不確定性的投資者語言。 — 塞思·卡拉曼\n價值投資看的是價格與價值之差，而非人氣。 — 塞思·卡拉曼\n當別人感覺不危險時，風險可能正在增大。 — 塞思·卡拉曼\n耐心是價值投資者最重要的資產之一。 — 塞思·卡拉曼\n即使是低價也要確認是否有理由。 — 塞思·卡拉曼\n避免損失的態度是長期收益的基礎。 — 塞思·卡拉曼\n好機會不常有，所以可能需要現金。 — 塞思·卡拉曼\n投資者應依賴自己的分析，而非市場人氣。 — 塞思·卡拉曼\n價值與價格的差距越大，機會也可能越大。 — 塞思·卡拉曼\n沒有安全邊際的信念是危險的自信。 — 塞思·卡拉曼\n便宜買好公司的原則簡單但不容易。 — 喬爾·葛林布萊特\n高收益業務遇上低價格時，機會就產生了。 — 喬爾·葛林布萊特\n即使是簡單的原則，不能堅守就不會有成果。 — 喬爾·葛林布萊特\n價值投資看起來枯燥，但需要時間。 — 喬爾·葛林布萊特\n市場短期內可能犯錯這一事實創造了機會。 — 喬爾·葛林布萊特\n好的策略必須讓所有人都難以跟隨才能持久。 — 喬爾·葛林布萊特\n價格低於價值時，投資者的優勢就產生了。 — 喬爾·葛林布萊特\n要同時看企業質量和價格。 — 喬爾·葛林布萊特\n長期來看，數字比故事更有力。 — 喬爾·葛林布萊特\n沒有耐心很難做價值投資。 — 喬爾·葛林布萊特\n找到正面大賺、背面小虧的結構。 — 莫尼什·帕伯萊\n簡單的想法可以產生大收益。 — 莫尼什·帕伯萊\n好投資者知道如何複製優秀投資者的原則。 — 莫尼什·帕伯萊\n限制下行並保持上行開放的投資是好的。 — 莫尼什·帕伯萊\n等待明確的機會，而非複雜的機會。 — 莫尼什·帕伯萊\n投資者需要的是好決策，而非多決策。 — 莫尼什·帕伯萊\n專注於偶爾出現的確定機會。 — 莫尼什·帕伯萊\n先計算損失可能性可以讓你活得更久。 — 莫尼什·帕伯萊\n好的投資應該有簡單的解釋。 — 莫尼什·帕伯萊\n等待是價值投資的一部分。 — 莫尼什·帕伯萊\n與優秀企業長期同行可以是最強大的策略。 — 尼克·斯利普\n投資者應該是所有者，而非交易者。 — 尼克·斯利普\n長期視角是競爭對手難以模仿的。 — 尼克·斯利普\n良好的企業文化隨時間推移像複利一樣運作。 — 尼克·斯利普\n長期考慮客戶的企業也能回報投資者。 — 尼克·斯利普\n真正的長期投資承受季度業績的雜訊。 — 尼克·斯利普\n優秀企業的內在價值緩慢但有力地積累。 — 尼克·斯利普\n所有者視角減少了交易衝動。 — 尼克·斯利普\n持有越久，企業質量越重要。 — 尼克·斯利普\n尋找可以長期同行的企業勝於頻繁交易。 — 尼克·斯利普\n不要試圖抓住下跌中的刀。 — 華爾街格言\n「買謠言，賣新聞」意味著警惕大眾心理。 — 華爾街格言\n在牛市中，每個人看起來都很聰明。 — 華爾街格言\n快速止損，讓利潤奔跑。 — 華爾街格言\n市場比希望更冷酷。 — 華爾街格言\n趨勢可能是朋友，但總有結束的時刻。 — 華爾街格言\n先學習如何不虧錢。 — 華爾街格言\n分散使一次失誤不會致命。 — 華爾街格言\n槓桿壓縮時間，但也壓縮錯誤。 — 華爾街格言\n市場總在準備下一個教訓。 — 華爾街格言\n偉大的投資機會不常來，來了要準備好。 — 沃倫·巴菲特\n如果沒有長期持有的心態，短期買入也要謹慎。 — 沃倫·巴菲特\n市場的價格標籤每天變，但企業的本質不會每天變。 — 沃倫·巴菲特\n理解業務的能力是比複雜預測更強的武器。 — 沃倫·巴菲特\n好企業隨時間推移減少投資者的錯誤。 — 沃倫·巴菲特\n大眾的恐懼對有準備的投資者來說可能是打折的價格標籤。 — 沃倫·巴菲特\n等待確定機會的耐心勝於試圖抓住每一個機會的貪婪。 — 沃倫·巴菲特\n投資需要理性行動，而非華麗行動。 — 沃倫·巴菲特\n先看能長期盈利的業務，而不是看起來便宜的股票。 — 沃倫·巴菲特\n長期持有好企業比想像中枯燥，而這種枯燥就是成果。 — 沃倫·巴菲特\n投資中最大的優勢是承認自己不知道的態度。 — 查理·蒙格\n找到好業務後，減少不必要的行動會有幫助。 — 查理·蒙格\n耐心與知識結合時成為強大的投資工具。 — 查理·蒙格\n許多錯誤來自無法將複雜的事看簡單。 — 查理·蒙格\n投資者首先應該思考自己為何可能犯錯。 — 查理·蒙格\n最好的投資者可能不是每天交易的人，而是長期等待的人。 — 查理·蒙格\n反向思考會先看到需要避開的路。 — 查理·蒙格\n從他人錯誤中學習是最便宜的學費。 — 查理·蒙格\n複利在好企業與長時間相遇時變強。 — 查理·蒙格\n好氣質比卓越智力在投資成果上持續更久。 — 查理·蒙格\n不了解價值與價格差距，投資者就會被市場情緒拖著走。 — 班傑明·葛拉漢\n市場每天給機會，但不需要每天跟隨。 — 班傑明·葛拉漢\n投資者應該是市場的主人，而非市場的僕人。 — 班傑明·葛拉漢\n安全邊際是對不知道未來這一事實的保險。 — 班傑明·葛拉漢\n股價下跌並不總意味著更危險，買得太貴可能更危險。 — 班傑明·葛拉漢\n沒有分析的信念把投資者變成投機者。 — 班傑明·葛拉漢\n價格波動測試投資者的情緒，但價值要求理性。 — 班傑明·葛拉漢\n市場價格是事實，但不總是真相。 — 班傑明·葛拉漢\n買得足夠便宜是比完美未來預測更現實的防禦。 — 班傑明·葛拉漢\n聰明的投資者先找安全邊際，再找人氣。 — 班傑明·葛拉漢\n買股票前要能解釋那家公司如何賺錢。 — 彼得·林奇\n好的投資想法可能比你想像的更近在日常生活中。 — 彼得·林奇\n確認的是企業的故事是否持續，而非股價。 — 彼得·林奇\n沒有承受下跌的心理準備，就難以長期享受上漲的果實。 — 彼得·林奇\n要了解企業的業績和前景，而非只知道股票名稱。 — 彼得·林奇\n把時間用在研究企業上，而非試圖預測市場。 — 彼得·林奇\n建立一兩次失敗不會破壞整體投資的結構。 — 彼得·林奇\n成功的股票需要時間，失敗的股票需要檢查。 — 彼得·林奇\n買不了解的企業是把錢托付給別人的故事。 — 彼得·林奇\n股票需要同時確認數字和故事。 — 彼得·林奇\n持續獲得平凡市場收益率絕非平凡之事。 — 約翰·柏格\n投資者不需要複雜預測來獲得整個市場的收益。 — 約翰·柏格\n低成本隨時間推移越來越站在投資者一邊。 — 約翰·柏格\n什麼都不做的策略看起來容易，但實際上最難。 — 約翰·柏格\n指數投資的力量在於減少不必要的選擇，而非天才的選擇。 — 約翰·柏格\n長期投資者看的是數十年的複利，而非一天的新聞。 — 約翰·柏格\n投資的基礎不是更多地猜對，而是建立漏洞更少的結構。 — 約翰·柏格\n降低成本、稅收和情緒可以改善長期業績。 — 約翰·柏格\n留在市場的時間比市場時機更重要。 — 約翰·柏格\n簡單的投資組合在危機時也更容易守護。 — 約翰·柏格\n好的投資者不只問買什麼，還問以什麼價格買。 — 霍華德·馬克斯\n所有人樂觀時，比好消息更應該質疑價格。 — 霍華德·馬克斯\n所有人恐懼時，比壞消息更應該重新審視價格。 — 霍華德·馬克斯\n風險在看不見時最危險。 — 霍華德·馬克斯\n投資者不是預測未來的人，而是使概率有利的人。 — 霍華德·馬克斯\n週期末尾，心理比邏輯更先推動價格上漲。 — 霍華德·馬克斯\n好好管理風險，獲利的機會就會再來。 — 霍華德·馬克斯\n與他人相同的想法很難獲得與他人不同的結果。 — 霍華德·馬克斯\n最好的買入機會通常伴隨最不舒適的新聞而來。 — 霍華德·馬克斯\n成功的投資者看的是不確定性的價格，而非確定性。 — 霍華德·馬克斯\n即使在絕望的氛圍中，如果價格足夠低，機會依然存在。 — 約翰·鄧普頓\n所有人喜歡的市場可能已經在價格中包含太多期望。 — 約翰·鄧普頓\n悲觀遮住投資者的眼，但對價值投資者來說可能是地圖。 — 約翰·鄧普頓\n大眾拋棄的地方可能出現最大折扣率。 — 約翰·鄧普頓\n市場歡呼時，先計算風險，而非收益。 — 約翰·鄧普頓\n最不受歡迎的市場有時可以是最好的起點。 — 約翰·鄧普頓\n悲觀過頭時，價格可能跌得比價值更遠。 — 約翰·鄧普頓\n世界各地都有機會，大眾的視野總是有限的。 — 約翰·鄧普頓\n在恐懼中買入不只需要勇氣，還需要分析。 — 約翰·鄧普頓\n樂觀末尾，要看安全邊際，而非期望。 — 約翰·鄧普頓\n開始與市場對抗，損失就成了自尊的成本。 — 傑西·李佛摩\n出現判斷錯誤的信號時，退出比固執更重要。 — 傑西·李佛摩\n判斷對了大趨勢，卻太早離開，大錢就留不住。 — 傑西·李佛摩\n每天都想交易的慾望讓交易者誤以為市場是工資。 — 傑西·李佛摩\n價格不在自己一邊時，先減少風險，再找理由。 — 傑西·李佛摩\n在投機中，希望不是計劃。 — 傑西·李佛摩\n趁錯誤倉位還小時清算，才能看到下一個機會。 — 傑西·李佛摩\n市場可以比任何個人的信念運動更久。 — 傑西·李佛摩\n坐等的能力和退出的能力都是必要的。 — 傑西·李佛摩\n跟隨趨勢，但限制損失。 — 傑西·李佛摩\n股價有時比經濟更先反映心理。 — 安德烈·科斯托蘭尼\n沒有耐心的錢很難在市場中長期生存。 — 安德烈·科斯托蘭尼\n大眾通常遲遲興奮，遲遲恐懼。 — 安德烈·科斯托蘭尼\n市場的狗跑在前面，但最終回到主人身邊。 — 安德烈·科斯托蘭尼\n即使是好想法，沒有時間也難以成為好投資。 — 安德烈·科斯托蘭尼\n債務剝奪投資者的耐心。 — 安德烈·科斯托蘭尼\n在市場中，比錢更先需要的是能堅持的時間。 — 安德烈·科斯托蘭尼\n大眾的情緒震動價格，但不能永遠主導。 — 安德烈·科斯托蘭尼\n投資者必須成為在雜訊中不迷失方向的人。 — 安德烈·科斯托蘭尼\n股市同時需要計算器和心理學書。 — 安德烈·科斯托蘭尼\n分散始於謙遜，而非信念。 — 瑞·達利歐\n好原則在壞日子比好日子更需要。 — 瑞·達利歐\n了解自己的弱點，投資組合也能更現實。 — 瑞·達利歐\n在不確定的世界中，不要把一切押在一個結果上。 — 瑞·達利歐\n即使是痛苦的損失，正確復盤也能成為下次判斷的材料。 — 瑞·達利歐\n在市場之前，先知道自己是什麼樣的人。 — 瑞·達利歐\n混合不同風險是長期堅持的技術。 — 瑞·達利歐\n否認現實的投資總有一天會被現實修正。 — 瑞·達利歐\n好的決策依賴原則和反饋，而非情緒。 — 瑞·達利歐\n投資者很多時候需要設計平衡，而非信念。 — 瑞·達利歐\n快速修正錯誤判斷，損失就可能以學費結束。 — 喬治·索羅斯\n理解市場幻覺，就能同時看到機會和危險。 — 喬治·索羅斯\n倉位大小和信念同樣重要。 — 喬治·索羅斯\n正確時大賺、錯誤時少虧的結構很重要。 — 喬治·索羅斯\n投資需要糾錯能力，而非完美預測。 — 喬治·索羅斯\n生存的投資者知道如何改變自己的想法。 — 喬治·索羅斯\n市場可以因參與者的信念而更大幅度波動。 — 喬治·索羅斯\n即使強烈的信念，沒有止損規則也是危險的。 — 喬治·索羅斯\n知道自己判斷錯了的那一刻是最重要的時刻。 — 喬治·索羅斯\n市場機會通常出現在不完整資訊中。 — 喬治·索羅斯\n只有保護資本的人才能抓住下一個趨勢。 — 保羅·都鐸·瓊斯\n損失變大之前小額承認是專業人士的習慣。 — 保羅·都鐸·瓊斯\n減少風險不是膽怯，而是策略。 — 保羅·都鐸·瓊斯\n止損計劃應該在買入理由之前就準備好。 — 保羅·都鐸·瓊斯\n市場不獎勵自尊。 — 保羅·都鐸·瓊斯\n好的交易者先生存，然後再賺錢。 — 保羅·都鐸·瓊斯\n善於防守的投資者不會錯失進攻機會。 — 保羅·都鐸·瓊斯\n長期持有錯誤倉位是固執，而非分析。 — 保羅·都鐸·瓊斯\n控制風險，心也得到控制。 — 保羅·都鐸·瓊斯\n避免大損失是複利的起點。 — 保羅·都鐸·瓊斯\n市場領導者往往在熊市後最先展示實力。 — 威廉·歐奈爾·馬克·米納維尼\n止損規則必須用數字而非情緒來設定。 — 威廉·歐奈爾·馬克·米納維尼\n忽視趨勢會讓好分析也以損失告終。 — 威廉·歐奈爾·馬克·米納維尼\n不要因為看起來貴就忽視強勢股票。 — 威廉·歐奈爾·馬克·米納維尼\n不要因為看起來便宜就抓住弱勢股票。 — 威廉·歐奈爾·馬克·米納維尼\n好的交易不來自堅持市場是錯的。 — 威廉·歐奈爾·馬克·米納維尼\n盈虧比和損失限制可能比勝率更重要。 — 威廉·歐奈爾·馬克·米納維尼\n圖表不保證未來，但可以給出風險信號。 — 威廉·歐奈爾·馬克·米納維尼\n強勁上漲有原因，弱勢反彈有限制。 — 威廉·歐奈爾·馬克·米納維尼\n遵守規則的投資者在情緒化市場中也減少動搖。 — 威廉·歐奈爾·馬克·米納維尼\n持有整個市場的策略減輕了預測的負擔。 — 伯頓·墨基爾\n不要努力預言幾乎隨機的短期運動。 — 伯頓·墨基爾\n低成本和廣泛分散是投資者實際可控的領域。 — 伯頓·墨基爾\n長期指數投資不華麗，但持續。 — 伯頓·墨基爾\n簡單參與往往好過複雜預測。 — 伯頓·墨基爾\n低估平均值，可能連平均值都達不到。 — 伯頓·墨基爾\n市場時機的誘惑很大，但成功率很低。 — 伯頓·墨基爾\n投資者首先通過降低確定成本獲勝。 — 伯頓·墨基爾\n分散的投資組合是對未知未來的現實答案。 — 伯頓·墨基爾\n簡單的策略在能長期維持時會變得更強。 — 伯頓·墨基爾\n偉大企業擁有超越營收的深層競爭力。 — 菲利普·費雪\n評估成長企業時，要同時看數字和人。 — 菲利普·費雪\n企業質量隨時間推移可能比股價更重要。 — 菲利普·費雪\n好的管理層在困難時期更能顯現。 — 菲利普·費雪\n對長期成長股來說，長期方向比短期失望更重要。 — 菲利普·費雪\n深入調研建立信念，信念建立耐心。 — 菲利普·費雪\n太快賣掉好公司是常見的錯誤。 — 菲利普·費雪\n只看成長性而忽視價格，好企業也會變成壞投資。 — 菲利普·費雪\n企業文化和研發能力可以成為長期成長的種子。 — 菲利普·費雪\n找到好公司後，看長期競爭力，而非短期波動。 — 菲利普·費雪\n價值投資者必須在不受歡迎的價格中找到舒適感。 — 塞思·卡拉曼\n安全邊際是投資者謙遜的數字表達。 — 塞思·卡拉曼\n現金不是閒置資產，而是選擇權。 — 塞思·卡拉曼\n先看下行風險的投資者可以更長地等待上行機會。 — 塞思·卡拉曼\n便宜資產有原因，要區分價值和陷阱。 — 塞思·卡拉曼\n市場忽視的地方，價值可以靜靜積累。 — 塞思·卡拉曼\n沒有確定機會時等待也是投資決定。 — 塞思·卡拉曼\n避免損失不是膽小，而是維護複利的方法。 — 塞思·卡拉曼\n氛圍越好，越需要安全邊際。 — 塞思·卡拉曼\n好投資從買入那一刻起就必須有防禦能力。 — 塞思·卡拉曼\n市場短期非理性創造長期機會。 — 喬爾·葛林布萊特\n便宜買好公司的原則簡單，但實踐困難。 — 喬爾·葛林布萊特\n價值投資策略必須熬過枯燥時期才能得到回報。 — 喬爾·葛林布萊特\n以低價買高質量業務是核心。 — 喬爾·葛林布萊特\n好策略也需要讓人痛苦到想放棄的區間，這樣才能持久運作。 — 喬爾·葛林布萊特\n同時看價格和質量可以減少犯錯概率。 — 喬爾·葛林布萊特\n市場有時給優秀企業貼上錯誤的價格。 — 喬爾·葛林布萊特\n不被短期成果動搖的紀律完成策略。 — 喬爾·葛林布萊特\n只便宜的企業不如既便宜又好的企業。 — 喬爾·葛林布萊特\n比投資公式更重要的是堅持那個公式的心。 — 喬爾·葛林布萊特\n尋找下行小、上行大的結構是核心。 — 莫尼什·帕伯萊\n好的投資想法必須容易理解才能長期堅持。 — 莫尼什·帕伯萊\n等待不是沒有機會的時間，而是挑選機會的時間。 — 莫尼什·帕伯萊\n複製經驗證的原則也是優秀的投資能力。 — 莫尼什·帕伯萊\n少虧多賺的結構是價值投資的魅力。 — 莫尼什·帕伯萊\n複雜投資有更多出錯之處。 — 莫尼什·帕伯萊\n投資者需要的是好的幾個想法，而非許多想法。 — 莫尼什·帕伯萊\n即使有不確定性，價格足夠低也可能成為機會。 — 莫尼什·帕伯萊\n大機會不常來，平時要忍耐。 — 莫尼什·帕伯萊\n投資中的簡單性不是弱點，而是可以成為優勢。 — 莫尼什·帕伯萊\n真正的長期投資是與企業共同度過時間。 — 尼克·斯利普\n優秀企業隨時間推移能給客戶和投資者雙方帶來價值。 — 尼克·斯利普\n減少交易頻率使所有者視角更清晰。 — 尼克·斯利普\n好的企業文化比財務報表出現得晚，但持續更久。 — 尼克·斯利普\n長期持有不是隨便持有任何企業很長時間。 — 尼克·斯利普\n如果企業方向正確，短期波動可能接近雜訊。 — 尼克·斯利普\n可以長期同行的企業在對待客戶的方式上給出線索。 — 尼克·斯利普\n好企業隨時間推移擴大選擇範圍。 — 尼克·斯利普\n短期交易讓你看價格，長期持有讓你看業務。 — 尼克·斯利普\n投資者應該觀察業務的積累價值，而非只看價格標籤。 — 尼克·斯利普\n市場可以比你能堅持的時間更長地震盪。 — 華爾街格言\n比買得便宜更重要的是買得能夠堅持。 — 華爾街格言\n最好的策略，如果感情上無法堅守，就不是好策略。 — 華爾街格言\n要增加利潤，首先要確保損失不會毀掉賬戶。 — 華爾街格言\n市場雜訊很大，但保護賬戶是靜靜的原則。 — 華爾街格言\n現金對急躁的人是煩惱，對有準備的人是機會。 — 華爾街格言\n所有人看同一方向時，確認另一邊的危險。 — 華爾街格言\n槓桿在方向正確但時機錯誤時也會帶來危險。 — 華爾街格言\n分散可以減少大賺，但也減少破產可能性。 — 華爾街格言\n下跌市場先於投資組合測試投資者的內心。 — 華爾街格言\n新聞越緊急，下單要越慢。 — 華爾街格言\n長期保持賬戶的人才能看到下一輪牛市。 — 華爾街格言\n利潤是可能性，限制損失是責任。 — 華爾街格言\n買入前先寫下最壞情況，而非預期收益。 — 華爾街格言\n市場上概率比確信更合適。 — 華爾街格言';

  @override
  String get intelligentInvestorBookTitle => '我對明智投資的看法';

  @override
  String get longFormBookTitle => '股票作手回憶錄';

  @override
  String get intelligentInvestorCh1Title => 'Ch1. 投資與投機的區別';

  @override
  String get intelligentInvestorCh2Title => 'Ch2. 為什麼大多數投資者會失敗';

  @override
  String get intelligentInvestorCh3Title => 'Ch3. 市場';

  @override
  String get intelligentInvestorCh4Title => 'Ch4. 安全邊際';

  @override
  String get intelligentInvestorCh5Title => 'Ch5. 群體心理與投資';

  @override
  String get intelligentInvestorCh6Title => 'Ch6. 為什麼市場長期上漲';

  @override
  String get intelligentInvestorCh7Title => 'Ch7. 網路泡沫的教訓';

  @override
  String get intelligentInvestorCh8Title => 'Ch8. 金融危機的教訓';

  @override
  String get intelligentInvestorCh9Title => 'Ch9. 新冠暴跌的教訓';

  @override
  String get intelligentInvestorCh10Title => 'Ch10. AI革命與當前市場';
}
