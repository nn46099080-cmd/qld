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
  String get holdQLDPlusCash => '持有 QLD + 30% 现金';

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
      '先点击主画面的“基础仓位卡片”，阅读如何准备。同时点击右下角的“策略”标签，了解详细策略。';

  @override
  String get usageGuideStrategyTitle => '2. 查看下跌区间自动策略';

  @override
  String get usageGuideStrategyBody =>
      '主画面第三张卡片会自动计算QLD相比历史最高价下跌了百分之几。对应策略会自动显示，满足条件时也会发送提醒。';

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
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get appTitle => 'QLD 提醒';

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
  String get holdQLDPlusCash => '持有 QLD + 30% 現金';

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
      '先點擊主畫面的「基礎部位卡片」，閱讀如何準備。同時點擊右下角的「策略」分頁，了解詳細策略。';

  @override
  String get usageGuideStrategyTitle => '2. 查看下跌區間自動策略';

  @override
  String get usageGuideStrategyBody =>
      '主畫面第三張卡片會自動計算QLD相較歷史最高價下跌了百分之幾。對應策略會自動顯示，符合條件時也會發送提醒。';

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
}
