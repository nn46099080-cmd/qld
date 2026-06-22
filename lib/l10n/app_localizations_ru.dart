// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Оповещение QLD';

  @override
  String get noBuyZone => 'Зона без покупок';

  @override
  String get tapToViewStrategy => 'Посмотреть стратегию';

  @override
  String get buyNow => 'Купить сейчас';

  @override
  String get buyingInProgress => 'Покупка выполняется';

  @override
  String get hold => 'Держать';

  @override
  String get navHome => 'Домой';

  @override
  String get navChart => 'График';

  @override
  String get navExchange => 'Валюты';

  @override
  String get navFearGreed => 'Страх';

  @override
  String get fearGreedTitle => 'Страх и жадность';

  @override
  String get fearGreedInlineLabel => 'CNN страх и жадность';

  @override
  String get fearGreedSubtitle => 'Настроения рынка США от CNN';

  @override
  String get fearGreedUnavailable =>
      'Не удалось загрузить данные страха и жадности.';

  @override
  String get navAlert => 'Сигналы';

  @override
  String get navStrategy => 'Стратегия';

  @override
  String get alertRecovery10 => 'QLD восстановился на 10%';

  @override
  String get alertMarketOpen => 'Рынок США открылся';

  @override
  String get alertNewHigh => 'Достигнут новый максимум';

  @override
  String get portfolio => 'Портфель';

  @override
  String get portfolioAssetInput => 'Активы';

  @override
  String get portfolioClose => 'Закрыть';

  @override
  String get exitAdDialogBack => 'Назад';

  @override
  String get exitAdDialogExit => 'Выйти';

  @override
  String get portfolioQldShares => 'Кол-во QLD';

  @override
  String get portfolioTqqqShares => 'Кол-во TQQQ';

  @override
  String get portfolioQldAveragePrice => 'Средняя цена QLD';

  @override
  String get portfolioTqqqAveragePrice => 'Средняя цена TQQQ';

  @override
  String get portfolioCashUsd => 'Деньги USD';

  @override
  String get portfolioTotal => 'Итого';

  @override
  String get portfolioProfitLoss => 'Приб./уб.';

  @override
  String get portfolioSharesUnit => 'акц.';

  @override
  String get portfolioReturnRate => 'Доходность';

  @override
  String get portfolioAveragePriceShort => 'Средняя цена';

  @override
  String get portfolioPriceLoading => 'загрузка цены';

  @override
  String get portfolioToBreakeven => 'До безубытка';

  @override
  String get portfolioBreakevenCleared => 'Выше безубытка';

  @override
  String get basePosition => 'Базовая позиция';

  @override
  String get fromPreviousClose => 'к прошлому закрытию';

  @override
  String get from10yHigh => 'от исторического максимума';

  @override
  String get holdQLDPlusCash => 'Держать QLD + 30% кэш';

  @override
  String get basePositionDescription =>
      '[ Руководство по стратегии ]\n\nЭта стратегия не предполагает вложение всех активов в QLD одновременно.\n\nВначале инвестируется только часть активов, а остальные средства хранятся в денежной форме для подготовки к сильному падению рынка.\n\nСила денежного резерва\n\nДенежный резерв нужен не для повышения доходности, а для сохранения спокойствия и дисциплины даже во время падения рынка.\n\nВажнее максимальной доходности иметь инвестиционную систему, способную поддерживать сложный процент до конца.\n\nПример:\n- Инвестировать в QLD только 70% начальных активов\n- Оставить остальные 30% в денежном резерве\n\nQLD — это ETF, который отслеживает примерно двойное дневное движение индекса Nasdaq-100.\n\nПоэтому в начальном состоянии:\nплечо 2x × инвестиция 70% = общая экспозиция около 1,4x.\n\nНапример:\n- Nasdaq +1%\n→ Общие активы около +1,4%\n\nПри сильном падении рынка денежный резерв постепенно используется для дополнительных покупок.\n\nПример:\n- Дополнительная покупка в районе падения QLD на 40%\n\nЭто позволяет приобрести больше паёв по низким ценам и значительно снизить среднюю цену входа при восстановлении рынка.\n\nВ результате во время восстановления эта стратегия может дать более высокую доходность, чем простое удержание позиции.\n\nОснова этой стратегии:\n- Снижать волатильность с помощью денежного резерва во время роста рынка\n- Использовать резерв для дополнительных покупок во время сильных падений и снижать среднюю цену.';

  @override
  String get basePositionIntro =>
      'Эта базовая стратегия не вкладывает все средства сразу. Она держит QLD вместе с кэшем, снижает колебания на растущем рынке и оставляет запас для докупок при сильных падениях.';

  @override
  String get basePositionQldAllocationLabel => 'Базовая доля QLD';

  @override
  String get basePositionCashAllocationLabel => 'Резерв кэша';

  @override
  String get basePositionCorePrinciple => 'Ключевые принципы';

  @override
  String get basePositionCashTitle => 'Кэш не просто снижает доходность';

  @override
  String get basePositionCashText =>
      'Это запас прочности, чтобы сохранять дисциплину при сильных падениях и покупать больше по низким ценам.';

  @override
  String get basePositionInitialLeverageTitle =>
      'Начальное движение около 1,4x';

  @override
  String get basePositionInitialLeverageText =>
      'QLD примерно в 2 раза повторяет движение Nasdaq-100. Если только 70% активов находится в QLD, общее движение портфеля снижается примерно до 1,4x.';

  @override
  String get basePositionStepLeverageTitle =>
      'При падениях плечо повышается поэтапно';

  @override
  String get basePositionStepLeverageText =>
      'Начиная с зон -20% и -30%, добавление TQQQ может поднять общее движение примерно до 1,8x. В самых глубоких зонах падения оно может приблизиться к 2,3x.';

  @override
  String get basePositionLowAverageTitle =>
      'Чем сильнее страх, тем ниже может стать средняя цена';

  @override
  String get basePositionLowAverageText =>
      'Приложение построено так, чтобы при углублении падения поэтапно использовать кэш для докупки TQQQ. Набор большего количества долей в низких зонах может усилить доходность при последующем отскоке.';

  @override
  String get basePositionSummaryTitle => 'Итог';

  @override
  String get basePositionSummaryText =>
      'Цель не в том, чтобы угадать максимальную доходность. Цель — сохранить план во время падений и дать сложному проценту работать дольше.';

  @override
  String get buySignalMessage => 'Сигналы покупки появятся здесь.';

  @override
  String get currentPrice => 'Текущая цена';

  @override
  String get futuresLabel => 'Вне сессии';

  @override
  String get tenYearHigh => 'Исторический максимум';

  @override
  String get buyStrategy => 'Стратегия покупки';

  @override
  String get noBuyZoneTitle => 'Зона без покупок';

  @override
  String get strategyOverview => 'Обзор';

  @override
  String get corePrinciple => 'Главный принцип';

  @override
  String get suggestedAllocation => 'Рекомендуемое распределение';

  @override
  String get riskManagement => 'Управление риском';

  @override
  String get actionGuide => 'План действий';

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
  String get minus20Title => 'Стратегия -20%';

  @override
  String get minus20Headline =>
      'Начать еженедельное накопление TQQQ на 1% кэша';

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
  String get minus30Title => 'Стратегия -30%';

  @override
  String get minus30Headline => 'Купить TQQQ на 20% кэша';

  @override
  String get minus30OverviewTitle => 'Strategy Overview';

  @override
  String get minus30OverviewText =>
      'This zone represents a high-opportunity accumulation phase.\n\nHistorically, Nasdaq corrections around -30% have often provided strong long-term buying opportunities.\n\nAlthough fear and volatility increase significantly at this stage, disciplined dollar-cost averaging can improve long-term returns.';

  @override
  String get minus30AllocationTitle => 'Suggested Allocation';

  @override
  String get minus30AllocationText =>
      '• Используйте примерно 20% доступного кэша\n• Продолжайте постепенное накопление\n• Не вкладывайте весь капитал слишком быстро\n• Сохраняйте гибкость для более глубоких падений';

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
  String get minus40Title => 'Стратегия -40%';

  @override
  String get minus40Headline => 'Использовать 30% кэша - вход TQQQ';

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
  String get minus50Title => 'Стратегия -50%';

  @override
  String get minus50Headline => 'Купить TQQQ на весь оставшийся кэш';

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
  String get exchangeUsdKrw => 'Доллар/вона';

  @override
  String get exchangeUsdJpy => 'Доллар/иена';

  @override
  String get exchangeEurUsd => 'Евро/доллар';

  @override
  String get exchangeUsdRub => 'Доллар/рубль';

  @override
  String get exchangeUsdTwd => 'Доллар/тайваньский доллар';

  @override
  String get exchangeUsdCny => 'Доллар/юань';

  @override
  String get fearGreedExtremeFear => 'Крайний страх';

  @override
  String get fearGreedFear => 'Страх';

  @override
  String get fearGreedNeutral => 'Нейтрально';

  @override
  String get fearGreedGreed => 'Жадность';

  @override
  String get fearGreedExtremeGreed => 'Крайняя жадность';

  @override
  String get fearGreedIndicatorsTitle => '7 индикаторов страха и жадности';

  @override
  String get fearGreedFaqTitle => 'Описание индекса страха и жадности';

  @override
  String get fearGreedWhatTitle => 'Что такое индекс страха и жадности CNN?';

  @override
  String get fearGreedWhatBody =>
      'Индекс показывает настроение фондового рынка и помогает оценить, выглядят ли акции справедливо оцененными. Чрезмерный страх часто давит на цены вниз, а чрезмерная жадность может толкать их вверх.';

  @override
  String get fearGreedCalculatedTitle => 'Как он рассчитывается?';

  @override
  String get fearGreedCalculatedBody =>
      'Индекс объединяет семь показателей: рыночный импульс, силу цен, ширину рынка, опционы put/call, спрос на мусорные облигации, волатильность и спрос на защитные активы. Каждый показатель имеет равный вес в шкале от 0 до 100.';

  @override
  String get fearGreedFrequencyTitle => 'Как часто он обновляется?';

  @override
  String get fearGreedFrequencyBody =>
      'Каждый компонент и общий индекс обновляются по мере появления новых рыночных данных.';

  @override
  String get fearGreedUseTitle => 'Как его использовать?';

  @override
  String get fearGreedUseBody =>
      'Используйте его как индикатор настроения рынка. Он помогает замечать эмоциональные крайности, но решения стоит сверять с ценой, фундаментальными факторами, управлением риском и собственной стратегией.';

  @override
  String get strategyAdLabel => 'Реклама';

  @override
  String get alertSettingsTitle => 'Настройки уведомлений';

  @override
  String get alertSettingsCloseBasisNote =>
      'Уведомления отправляются на основе цены закрытия.';

  @override
  String get alertHighTitle => 'Уведомление о новом максимуме';

  @override
  String get alertHighSubtitle =>
      'Уведомлять, когда после установки достигнут новый максимум';

  @override
  String get alertMarketOpenTitle => 'Уведомление об открытии рынка';

  @override
  String get alertMarketOpenSubtitle =>
      'Уведомлять один раз в день при открытии регулярной сессии США';

  @override
  String get alertStrategySettingTitle => 'Уведомление стратегии';

  @override
  String get alertStrategySettingSubtitle =>
      'Уведомлять об изменениях зон -20%, -30%, -40% и -50%';

  @override
  String get noBuyHeadline =>
      'Не покупать дополнительно. Держать 30% наличными.';

  @override
  String get noBuyActionTitle => 'Немедленное действие';

  @override
  String get noBuyActionText =>
      'Не покупайте новые QLD/TQQQ. Сохраняйте текущую позицию QLD и держите 30% наличными.';

  @override
  String get noBuyCashTitle => 'Правило наличных';

  @override
  String get noBuyCashText =>
      'Наличные — резерв для следующей зоны падения. Не уменьшайте их даже при росте рынка.';

  @override
  String get noBuyAvoidTitle => 'Избегать';

  @override
  String get noBuyAvoidText =>
      'Не догоняйте цену только потому, что она растет. Ждите зоны -20%.';

  @override
  String get noBuyNextTitle => 'Следующий шаг';

  @override
  String get noBuyNextText =>
      'При достижении -20% подготовьте небольшие регулярные покупки TQQQ.';

  @override
  String get minus20ActionTitle => 'Немедленное действие';

  @override
  String get minus20ActionText =>
      'Раз в неделю используйте только 1% общего кэша для дробного накопления TQQQ. Не вкладывайте крупную сумму сразу.';

  @override
  String get minus20BuyRuleTitle => 'Цель';

  @override
  String get minus20BuyRuleText =>
      'Эта настройка начинается в зоне -20%, чтобы при боковом рынке небольшие регулярные покупки постепенно снижали среднюю цену TQQQ. Цель — не угадать мгновенную прибыль, а создать более низкую среднюю стоимость.';

  @override
  String get minus20CashTitle => 'Управление наличными';

  @override
  String get minus20CashText =>
      'Большая часть кэша должна остаться для зон -30%, -40% и -50%. Даже после полного использования планового кэша на -50% новый кэш может продолжать снижать среднюю цену через еженедельное накопление.';

  @override
  String get minus20AvoidTitle => 'План выхода';

  @override
  String get minus20AvoidText =>
      'Не продавайте эти доли TQQQ на каждом коротком отскоке. Рассматривайте их как часть позиции, которую позже закрывают вместе с сокращением TQQQ после нового максимума.';

  @override
  String get minus30ActionTitle => 'Немедленное действие';

  @override
  String get minus30ActionText =>
      'Используйте только 20% доступных наличных для покупки TQQQ. Перед ордером проверьте общий остаток.';

  @override
  String get minus30BuyRuleTitle => 'Правило покупки';

  @override
  String get minus30BuyRuleText =>
      'Если наличные составляют \$10,000, используйте только \$2,000 для TQQQ и сохраните оставшиеся 80%.';

  @override
  String get minus30AdditionalTitle => 'Дополнительное действие';

  @override
  String get minus30AdditionalText =>
      'Накопление QLD можно продолжать, но дополнительные покупки TQQQ ждут следующей зоны.';

  @override
  String get minus30AvoidTitle => 'Избегать';

  @override
  String get minus30AvoidText =>
      'Не тратьте слишком много наличных из-за ожидания отскока. Действуйте так, будто зона -40% еще возможна.';

  @override
  String get minus40ActionTitle => 'Немедленное действие';

  @override
  String get minus40ActionText =>
      'Используйте 30% оставшихся наличных для покупки TQQQ. Исключите сумму, уже использованную на -30%.';

  @override
  String get minus40BuyRuleTitle => 'Правило покупки';

  @override
  String get minus40BuyRuleText =>
      'Если осталось \$8,000 наличных, используйте только \$2,400. Главное — не использовать все сразу.';

  @override
  String get minus40HoldTitle => 'Правило удержания';

  @override
  String get minus40HoldText =>
      'Держите QLD и увеличивайте TQQQ только до плановой доли. Оставьте наличные на дальнейшее падение.';

  @override
  String get minus40AvoidTitle => 'Избегать';

  @override
  String get minus40AvoidText =>
      'Не продавайте из страха. И не покупайте на все наличные из жадности.';

  @override
  String get minus50ActionTitle => 'Немедленное действие';

  @override
  String get minus50ActionText =>
      'Используйте все оставшиеся наличные для покупки TQQQ. Это последняя плановая стадия вложения наличных.';

  @override
  String get minus50BuyRuleTitle => 'Правило покупки';

  @override
  String get minus50BuyRuleText =>
      'Ориентируйтесь только на реальные оставшиеся наличные после сумм, использованных на -30% и -40%.';

  @override
  String get minus50AfterTitle => 'После этого';

  @override
  String get minus50AfterText =>
      'Когда появятся новые наличные, регулярно накапливайте TQQQ или QLD и снижайте среднюю цену.';

  @override
  String get minus50AvoidTitle => 'Избегать';

  @override
  String get minus50AvoidText =>
      'Не сдавайтесь только из-за большой просадки. Не используйте долги или краткосрочные деньги на докупку.';

  @override
  String get alertNasdaq200Title => 'Оповещение 200-дневной Nasdaq 100';

  @override
  String get alertNasdaq200Subtitle =>
      'Уведомлять при пробое Nasdaq 100 ниже или выше 200-дневной средней';

  @override
  String get alertNasdaq200Breakdown =>
      'Nasdaq 100 пробил вниз 200-дневную скользящую среднюю';

  @override
  String get alertNasdaq200Breakout =>
      'Nasdaq 100 снова пробил вверх 200-дневную скользящую среднюю';

  @override
  String get chartGuideTitle => 'Как читать этот график';

  @override
  String get chartMiniTitle =>
      '3-месячный график с 20- и 200-дневными средними';

  @override
  String get chartGuideCandleTitle => 'Свечи за 3 месяца';

  @override
  String get chartGuideCandleBody =>
      'Показывает недавнее движение QLD одним взглядом. Зеленый означает закрытие выше, красный - ниже.';

  @override
  String get chartGuideMa200Title => '200-дневная линия';

  @override
  String get chartGuideMa200Body =>
      'Ориентир долгосрочного тренда. Выше линии - признак силы; ниже стоит проверить риск и наличные.';

  @override
  String get chartMa200SheetTitle =>
      'Что такое 200-дневная скользящая средняя?';

  @override
  String get chartMa200SheetBody =>
      '200-дневная скользящая средняя - это долгосрочная линия тренда, рассчитанная по средним ценам закрытия примерно за последние 200 торговых дней.\n\nМногие инвесторы следят за ней, потому что она сглаживает краткосрочный шум и помогает увидеть общее направление рынка. Цена выше этой линии часто воспринимается как более сильный долгосрочный тренд, а цена ниже может указывать на ослабление импульса или необходимость пересмотреть риск.\n\nЕе не стоит использовать как самостоятельный сигнал покупки или продажи. Для такого волатильного ETF с плечом, как QLD, лучше рассматривать ее вместе с долей наличных, просадкой, средней ценой и сроком инвестирования.';

  @override
  String get chartMa20SheetTitle => 'Что такое 20-дневная скользящая средняя?';

  @override
  String get chartMa20SheetBody =>
      '20-дневная скользящая средняя - это краткосрочная линия тренда, рассчитанная по средним ценам закрытия примерно за последние 20 торговых дней.\n\nМногие инвесторы смотрят на нее, потому что она реагирует быстрее 200-дневной линии и помогает увидеть недавний импульс. Цена выше нее может говорить о краткосрочной силе, а повторные пробои вниз - об ослаблении недавнего тренда.\n\nДля QLD 20-дневная линия полезна для оценки краткосрочной скорости и волатильности, но может давать много ложных сигналов. Лучше сравнивать ее с 200-дневной линией, долей наличных и плановыми зонами покупки.';

  @override
  String get alertPortfolioCashTitle => 'Оповещение о ребалансировке наличных';

  @override
  String get alertPortfolioCashSubtitle =>
      'Уведомлять, когда доля наличных после роста акций падает ниже 20%';

  @override
  String get alertPortfolioCashHigh =>
      'Доля наличных ниже 20%. Рассмотрите ребалансировку для восстановления наличных.';

  @override
  String get alertPortfolioCashLow =>
      'Доля наличных ниже 20%. Рассмотрите ребалансировку для восстановления наличных.';

  @override
  String get alertAnnouncementTitle => 'Уведомления об объявлениях';

  @override
  String get alertAnnouncementSubtitle =>
      'Получать объявления от QLD DIP ALERT как push-уведомления';

  @override
  String get alertDetailTitle => 'Детали уведомления';

  @override
  String get alertDetailOpenStrategy => 'Открыть стратегию';

  @override
  String get alertDetailRecovery =>
      'Зона падения улучшилась. Спокойно проверьте портфель и избегайте поспешных сделок.';

  @override
  String get alertDetailNewHigh =>
      'После установки зафиксирован новый максимум. Он станет новой базой для расчета будущего снижения.';

  @override
  String get alertDetailMarketOpen =>
      'Регулярная сессия США открылась. Проверяйте цены и сигналы только если планировали действовать сегодня.';

  @override
  String get alertDetailNasdaq200Breakdown =>
      'Nasdaq 100 опустился ниже 200-дневной средней. Это может указывать на ослабление тренда; проверьте риск и наличные.';

  @override
  String get alertDetailNasdaq200Breakout =>
      'Nasdaq 100 вернулся выше 200-дневной средней. Это может указывать на улучшение тренда, но следуйте стратегии.';

  @override
  String get alertDetailPortfolioCashHigh =>
      'Доля наличных ниже ориентира 20%. Обычно это означает, что акции выросли, а денежный резерв стал слишком мал. Рассмотрите частичную фиксацию позиции и ребалансировку к плановой доле наличных.';

  @override
  String get alertDetailPortfolioCashLow =>
      'Доля наличных ниже ориентира 20%. Обычно это означает, что акции выросли, а денежный резерв стал слишком мал. Рассмотрите частичную фиксацию позиции и ребалансировку к плановой доле наличных.';

  @override
  String get alertDetailOpenLink => 'Открыть ссылку';

  @override
  String get appUpdateTitle => 'Доступно обновление';

  @override
  String get appUpdateMessage =>
      'Доступна новая версия. Обновите приложение, чтобы использовать последние функции и исправления.';

  @override
  String get appUpdateLater => 'Позже';

  @override
  String get appUpdateNow => 'Обновить';

  @override
  String get alertTestTitle => 'Тест уведомления';

  @override
  String get alertPermissionHelpTitle => 'Уведомления не приходят?';

  @override
  String get alertPermissionHelpBody =>
      'Если разрешение на уведомления отключено на устройстве, тестовые уведомления могут не отображаться.';

  @override
  String get alertPermissionRequest => 'Запросить разрешение';

  @override
  String get alertPermissionOpenSettings => 'Открыть настройки';

  @override
  String get holdPageTitle => 'Удерживать позицию';

  @override
  String get holdHeadline =>
      'Запланированная покупка выполнена. Во время восстановления сосредоточьтесь на удержании позиции.';

  @override
  String get holdPositionTitle => 'Текущая позиция';

  @override
  String get holdPositionText =>
      'Сохраняйте уже купленные позиции QLD и TQQQ. Не повторяйте покупку предыдущей зоны только потому, что цена вернулась в восстановленный диапазон.';

  @override
  String get holdActionTitle => 'Текущее действие';

  @override
  String get holdActionText =>
      'Приостановите дополнительные покупки TQQQ и наблюдайте за восстановлением. Сохраните оставшийся денежный резерв на случай нового падения.';

  @override
  String get holdAvoidTitle => 'Избегайте';

  @override
  String get holdAvoidText =>
      'Не спешите продавать из-за волатильности и не совершайте импульсивные покупки из-за уверенности в восстановлении.';

  @override
  String get holdResetTitle => 'Сброс стратегии';

  @override
  String get holdResetText =>
      'Когда QLD полностью восстановится до предыдущего максимума, цикл падения завершится и стратегия вернётся в исходное состояние без покупок.';

  @override
  String get investmentCalculatorTitle => 'Калькулятор ожидаемой доходности';

  @override
  String get investmentCalculatorSubtitle =>
      'Простой расчет сложного процента на основе средней доходности QLD';

  @override
  String get investmentCalculatorReturnRate => 'Средняя доходность за 10 лет';

  @override
  String get investmentCalculatorLumpSumTitle =>
      'Единовременно + покупка на просадке';

  @override
  String get investmentCalculatorAmount => 'Сумма инвестиции';

  @override
  String get investmentCalculatorYears => 'Срок';

  @override
  String get investmentCalculatorExpectedValue => 'Оценочная стоимость';

  @override
  String get investmentCalculatorPrincipalMultiple => 'Кратность капитала';

  @override
  String get investmentCalculatorMonthlyTitle => 'Регулярное инвестирование';

  @override
  String get investmentCalculatorMonthlyAmount => 'Ежемесячная сумма';

  @override
  String get investmentCalculatorTotalPrincipal => 'Всего внесено';

  @override
  String get investmentCalculatorExpectedProfit => 'Ожидаемая прибыль';

  @override
  String get investmentCalculatorDisclaimer =>
      'Это простой расчет на основе прошлой доходности и не является гарантией будущей доходности.';

  @override
  String get investmentCalculatorYearsSuffix => 'л.';

  @override
  String get investmentCalculatorTimesSuffix => 'x';

  @override
  String get investmentCalculatorChartHint =>
      'Среднюю доходность можно проверить по историческому графику.';

  @override
  String get investmentCalculatorCurrencySectionTitle => 'Конвертация валюты';

  @override
  String get investmentCalculatorCurrency => 'Страна/валюта';

  @override
  String get investmentCalculatorExchangeRate => 'Курс за 1 USD';

  @override
  String get investmentCalculatorExchangeRateHint =>
      'Введите, сколько стоит 1 USD в выбранной валюте.';

  @override
  String get investmentCalculatorConvertedLumpSum =>
      'Итог единовременной инвестиции';

  @override
  String get investmentCalculatorConvertedMonthly =>
      'Итог регулярной инвестиции';

  @override
  String get investmentCurrencyUnitedStatesUsd => 'США USD';

  @override
  String get investmentCurrencyKoreaKrw => 'Корея KRW';

  @override
  String get investmentCurrencyJapanJpy => 'Япония JPY';

  @override
  String get investmentCurrencyChinaCny => 'Китай CNY';

  @override
  String get investmentCurrencyTaiwanTwd => 'Тайвань TWD';

  @override
  String get investmentCurrencyGermanyEur => 'Германия EUR';

  @override
  String get investmentCurrencyFranceEur => 'Франция EUR';

  @override
  String get investmentCurrencySpainEur => 'Испания EUR';

  @override
  String get investmentCurrencyPortugalEur => 'Португалия EUR';

  @override
  String get investmentCurrencyRussiaRub => 'Россия RUB';

  @override
  String get contentTitle => 'Контент';

  @override
  String get contentInquiry => 'Вопросы';

  @override
  String get contentCloseGuess => 'Угадать закрытие';

  @override
  String get contentStockQuote => 'Биржевые цитаты';

  @override
  String get contentNumberGuess => 'Угадай число';

  @override
  String get contentBookReader => 'Чтение книг';

  @override
  String get contentStockMeme => 'Биржевой мем';

  @override
  String get contentLottoNumbers => 'Номера лотереи';

  @override
  String get contentJumpDodge => 'Игра: прыгай и уклоняйся';

  @override
  String get stockQuoteTitle => 'Биржевые цитаты';

  @override
  String get stockQuoteTapHint => 'Нажмите, чтобы увидеть другую цитату.';

  @override
  String get stockQuoteShuffle => 'Другая цитата';

  @override
  String get usageGuideTitle => 'Как пользоваться приложением';

  @override
  String get usageGuideSubtitle =>
      'Правила для долгосрочной стратегии Nasdaq 2x';

  @override
  String get usageGuideCardTitle => 'Как пользоваться приложением';

  @override
  String get usageGuideCardSubtitle =>
      'Базовая позиция, зоны падения, записи, индикаторы';

  @override
  String get usageGuideWhatAppTitle => 'Что это за приложение?';

  @override
  String get usageGuideWhatAppBody =>
      'Это приложение служит руководством по правилам для инвесторов в Nasdaq 2x с долгосрочным подходом.\n\nОно автоматически рассчитывает текущее снижение от исторического максимума, помогает понять текущую позицию рынка и предлагает стратегию для каждой зоны.\n\nОно помогает придерживаться заранее выбранных инвестиционных принципов, не поддаваясь рыночному страху или жадности.';

  @override
  String get usageGuideNoBuyTitle =>
      '1. Сначала изучите базовую позицию и стратегию';

  @override
  String get usageGuideNoBuyBody =>
      'На главном экране нажмите карточку базовой позиции и прочитайте, как подготовиться. Также откройте вкладку Стратегия внизу справа.';

  @override
  String get usageGuideStrategyTitle =>
      '2. Проверьте автоматическую стратегию по зоне';

  @override
  String get usageGuideStrategyBody =>
      'Третья карточка автоматически считает, на сколько процентов QLD ниже исторического максимума. Подходящая стратегия показывается автоматически, а при выполнении условий приходят уведомления.';

  @override
  String get usageGuideIndicatorsTitle => 'Четыре вспомогательных индикатора';

  @override
  String get usageGuideIndicatorsBody =>
      'CNN F&G показывает, ближе рынок к страху или жадности.\n\nVIX показывает волатильность рынка. Чем выше число, тем выше тревога.\n\nК важным событиям США относятся NFP, CPI и FOMC. NFP показывает занятость, CPI — инфляцию, FOMC — направление ставок. Эти события могут сильно двигать Nasdaq и QLD.\n\nДоходность 10-летних облигаций — это ставка по 10-летним казначейским облигациям США. Быстрый рост может давить на акции роста, Nasdaq и QLD.';

  @override
  String get usageGuideQldTitle => '3. Купите и запишите в портфель';

  @override
  String get usageGuideQldBody =>
      'Используйте стратегию и сумму как ориентир, купите через своего брокера, затем запишите количество, среднюю цену и наличные в портфеле приложения.';

  @override
  String get usageGuideDisclaimer =>
      'Это приложение только для справки и не гарантирует прибыль.';

  @override
  String get usageGuideConfirm => 'OK';
}
