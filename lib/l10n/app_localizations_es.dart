// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Alerta QLD';

  @override
  String get noBuyZone => 'Zona sin compra';

  @override
  String get tapToViewStrategy => 'Ver estrategia';

  @override
  String get buyNow => 'Comprar ahora';

  @override
  String get buyingInProgress => 'Compra en curso';

  @override
  String get hold => 'Mantener';

  @override
  String get navHome => 'Inicio';

  @override
  String get navChart => 'Gráfico';

  @override
  String get navExchange => 'Divisas';

  @override
  String get navFearGreed => 'Miedo';

  @override
  String get fearGreedTitle => 'Miedo y Codicia';

  @override
  String get fearGreedInlineLabel => 'CNN Miedo y codicia';

  @override
  String get fearGreedSubtitle => 'Sentimiento del mercado de EE. UU. de CNN';

  @override
  String get fearGreedUnavailable =>
      'No se pueden cargar los datos de miedo y codicia.';

  @override
  String get navAlert => 'Alertas';

  @override
  String get navStrategy => 'Estrategia';

  @override
  String get alertRecovery10 => 'QLD se recuperó un 10%';

  @override
  String get alertMarketOpen => 'El mercado estadounidense ha abierto';

  @override
  String get alertNewHigh => 'Nuevo máximo alcanzado';

  @override
  String get portfolio => 'Cartera';

  @override
  String get portfolioAssetInput => 'Activos';

  @override
  String get portfolioClose => 'Cerrar';

  @override
  String get exitAdDialogBack => 'Volver';

  @override
  String get exitAdDialogExit => 'Salir';

  @override
  String get portfolioQldShares => 'Cantidad de QLD';

  @override
  String get portfolioTqqqShares => 'Cantidad de TQQQ';

  @override
  String get portfolioQldAveragePrice => 'Precio medio QLD';

  @override
  String get portfolioTqqqAveragePrice => 'Precio medio TQQQ';

  @override
  String get portfolioCashUsd => 'Efectivo USD';

  @override
  String get portfolioTotal => 'Total';

  @override
  String get portfolioProfitLoss => 'Gan./pérd.';

  @override
  String get portfolioSharesUnit => 'acciones';

  @override
  String get portfolioReturnRate => 'Rentabilidad';

  @override
  String get portfolioAveragePriceShort => 'Precio medio';

  @override
  String get portfolioPriceLoading => 'cargando precio';

  @override
  String get portfolioToBreakeven => 'Para empatar';

  @override
  String get portfolioBreakevenCleared => 'Por encima del punto de equilibrio';

  @override
  String get basePosition => 'Posición base';

  @override
  String get fromPreviousClose => 'vs cierre previo';

  @override
  String get from10yHigh => 'vs máximo histórico';

  @override
  String get holdQLDPlusCash => 'Mantener QLD + 30% efectivo';

  @override
  String get basePositionDescription =>
      '[ Guía de estrategia ]\n\nEsta estrategia no invierte todos los activos en QLD de una sola vez.\n\nAl principio, solo se invierte una parte de los activos y el resto se mantiene en efectivo para prepararse ante grandes caídas del mercado.\n\nEl poder de mantener efectivo\n\nEl efectivo no se mantiene para aumentar la rentabilidad, sino para conservar la calma y la disciplina incluso durante una caída del mercado.\n\nMás importante que obtener la máxima rentabilidad es contar con un sistema de inversión capaz de mantener el interés compuesto hasta el final.\n\nEjemplo:\n- Invertir solo el 70% de los activos iniciales en QLD\n- Mantener el 30% restante en efectivo\n\nQLD es un ETF que sigue aproximadamente el doble del movimiento diario del índice Nasdaq-100.\n\nPor lo tanto, en el estado inicial:\napalancamiento 2x × inversión del 70% = exposición total aproximada de 1,4x.\n\nPor ejemplo:\n- Nasdaq +1%\n→ Activos totales aproximadamente +1,4%\n\nCuando se produce una gran caída, el efectivo disponible se utiliza gradualmente para realizar compras adicionales.\n\nEjemplo:\n- Compra adicional cerca de la zona de -40% de QLD\n\nEsto permite acumular más participaciones a precios más bajos y reducir significativamente el precio medio de compra cuando el mercado se recupera.\n\nComo resultado, esta estrategia puede generar una mayor rentabilidad durante la recuperación que una estrategia de simple mantenimiento.\n\nLa clave de esta estrategia es:\n- Reducir la volatilidad con efectivo durante mercados alcistas\n- Usar el efectivo para comprar más durante grandes caídas y reducir el precio medio.';

  @override
  String get basePositionIntro =>
      'Esta estrategia base no invierte todo de una vez. Mantiene QLD junto con efectivo, reduce las oscilaciones en mercados alcistas y deja margen para comprar más durante grandes caídas.';

  @override
  String get basePositionQldAllocationLabel => 'Posición base en QLD';

  @override
  String get basePositionCashAllocationLabel => 'Reserva de efectivo';

  @override
  String get basePositionCorePrinciple => 'Principios clave';

  @override
  String get basePositionCashTitle =>
      'El efectivo no es dinero que solo reduce la rentabilidad';

  @override
  String get basePositionCashText =>
      'Es margen de seguridad para mantener la disciplina en grandes caídas y comprar más a precios bajos.';

  @override
  String get basePositionInitialLeverageTitle =>
      'El movimiento inicial es de aprox. 1,4x';

  @override
  String get basePositionInitialLeverageText =>
      'QLD sigue aproximadamente 2 veces el Nasdaq-100. Si solo el 70% de los activos está en QLD, el movimiento total de la cartera baja a cerca de 1,4x.';

  @override
  String get basePositionStepLeverageTitle =>
      'En las caídas, el apalancamiento sube por etapas';

  @override
  String get basePositionStepLeverageText =>
      'Desde las zonas de -20% a -30%, añadir TQQQ puede elevar el movimiento total a cerca de 1,8x. En las zonas de mayor caída, puede acercarse a 2,3x.';

  @override
  String get basePositionLowAverageTitle =>
      'Cuanto mayor es el miedo, menor puede ser el precio medio';

  @override
  String get basePositionLowAverageText =>
      'La app está estructurada para usar efectivo y promediar a la baja en TQQQ a medida que la caída se profundiza. Acumular más participaciones en zonas bajas puede reforzar la rentabilidad en el rebote posterior.';

  @override
  String get basePositionSummaryTitle => 'Resumen';

  @override
  String get basePositionSummaryText =>
      'El objetivo no es adivinar la rentabilidad máxima. Es mantener un plan durante las caídas y dejar que el interés compuesto continúe durante más tiempo.';

  @override
  String get buySignalMessage => 'Las señales de compra aparecerán aquí.';

  @override
  String get currentPrice => 'Precio actual';

  @override
  String get futuresLabel => 'Fuera de horario';

  @override
  String get tenYearHigh => 'Máximo histórico';

  @override
  String get buyStrategy => 'Estrategia de compra';

  @override
  String get noBuyZoneTitle => 'Zona sin compra';

  @override
  String get strategyOverview => 'Resumen';

  @override
  String get corePrinciple => 'Principio clave';

  @override
  String get suggestedAllocation => 'Asignación sugerida';

  @override
  String get riskManagement => 'Gestión de riesgo';

  @override
  String get actionGuide => 'Guía de acción';

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
  String get minus20Title => '-20% Estrategia';

  @override
  String get minus20Headline =>
      'Iniciar acumulación semanal de TQQQ con 1% de efectivo';

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
  String get minus30Title => '-30% Estrategia';

  @override
  String get minus30Headline => 'Comprar TQQQ con 20% de efectivo';

  @override
  String get minus30OverviewTitle => 'Strategy Overview';

  @override
  String get minus30OverviewText =>
      'This zone represents a high-opportunity accumulation phase.\n\nHistorically, Nasdaq corrections around -30% have often provided strong long-term buying opportunities.\n\nAlthough fear and volatility increase significantly at this stage, disciplined dollar-cost averaging can improve long-term returns.';

  @override
  String get minus30AllocationTitle => 'Suggested Allocation';

  @override
  String get minus30AllocationText =>
      '• Usa aproximadamente el 20% del efectivo disponible\n• Continúa la acumulación gradual\n• Evita desplegar todo el capital demasiado rápido\n• Mantén flexibilidad para caídas más profundas';

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
  String get minus40Title => '-40% Estrategia';

  @override
  String get minus40Headline => 'Usar 30% efectivo - entrada TQQQ';

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
  String get minus50Title => '-50% Estrategia';

  @override
  String get minus50Headline => 'Comprar TQQQ con todo el efectivo restante';

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
  String get exchangeUsdKrw => 'Dólar/Won';

  @override
  String get exchangeUsdJpy => 'Dólar/Yen';

  @override
  String get exchangeEurUsd => 'Euro/Dólar';

  @override
  String get exchangeUsdRub => 'Dólar/Rublo';

  @override
  String get exchangeUsdTwd => 'Dólar/Dólar taiwanés';

  @override
  String get exchangeUsdCny => 'Dólar/Yuan';

  @override
  String get fearGreedExtremeFear => 'Miedo extremo';

  @override
  String get fearGreedFear => 'Miedo';

  @override
  String get fearGreedNeutral => 'Neutral';

  @override
  String get fearGreedGreed => 'Codicia';

  @override
  String get fearGreedExtremeGreed => 'Codicia extrema';

  @override
  String get fearGreedIndicatorsTitle => '7 indicadores de miedo y codicia';

  @override
  String get fearGreedFaqTitle => 'Preguntas del índice de miedo y codicia';

  @override
  String get fearGreedWhatTitle =>
      '¿Qué es el índice de miedo y codicia de CNN?';

  @override
  String get fearGreedWhatBody =>
      'El índice mide el sentimiento del mercado bursátil y si las acciones podrían estar valoradas de forma razonable. El miedo excesivo tiende a bajar los precios, mientras que la codicia excesiva puede empujarlos al alza.';

  @override
  String get fearGreedCalculatedTitle => '¿Cómo se calcula?';

  @override
  String get fearGreedCalculatedBody =>
      'Combina siete indicadores: impulso del mercado, fortaleza de precios, amplitud del mercado, opciones put/call, demanda de bonos basura, volatilidad y demanda de activos refugio. Todos tienen el mismo peso en una escala de 0 a 100.';

  @override
  String get fearGreedFrequencyTitle => '¿Con qué frecuencia se actualiza?';

  @override
  String get fearGreedFrequencyBody =>
      'Cada componente y el índice total se actualizan cuando hay nuevos datos de mercado disponibles.';

  @override
  String get fearGreedUseTitle => '¿Cómo debería usarlo?';

  @override
  String get fearGreedUseBody =>
      'Úsalo como una lectura del ánimo del mercado. Puede ayudar a detectar extremos emocionales, pero conviene combinarlo con precio, fundamentales, control de riesgo y tu propia estrategia.';

  @override
  String get strategyAdLabel => 'Anuncio';

  @override
  String get alertSettingsTitle => 'Ajustes de alertas';

  @override
  String get alertSettingsCloseBasisNote =>
      'Las alertas se envían según el precio de cierre.';

  @override
  String get alertHighTitle => 'Alerta de nuevo máximo';

  @override
  String get alertHighSubtitle =>
      'Avisar cuando se alcance un nuevo máximo tras instalar la app';

  @override
  String get alertMarketOpenTitle => 'Alerta de apertura';

  @override
  String get alertMarketOpenSubtitle =>
      'Avisar una vez al día cuando abra el mercado regular de EE. UU.';

  @override
  String get alertStrategySettingTitle => 'Alerta de estrategia';

  @override
  String get alertStrategySettingSubtitle =>
      'Avisar cambios en las zonas -20%, -30%, -40% y -50%';

  @override
  String get noBuyHeadline => 'No comprar más. Mantener 30% en efectivo.';

  @override
  String get noBuyActionTitle => 'Acción inmediata';

  @override
  String get noBuyActionText =>
      'No compres nuevos QLD/TQQQ. Mantén la posición actual en QLD y protege el 30% en efectivo.';

  @override
  String get noBuyCashTitle => 'Regla de efectivo';

  @override
  String get noBuyCashText =>
      'El efectivo es reserva para la siguiente zona de caída. No lo reduzcas aunque el mercado suba.';

  @override
  String get noBuyAvoidTitle => 'Evitar';

  @override
  String get noBuyAvoidText =>
      'No persigas el precio solo porque sube. Espera hasta que aparezca la zona de -20%.';

  @override
  String get noBuyNextTitle => 'Siguiente paso';

  @override
  String get noBuyNextText =>
      'Al llegar a -20%, prepárate para iniciar compras fraccionadas recurrentes de TQQQ.';

  @override
  String get minus20ActionTitle => 'Acción inmediata';

  @override
  String get minus20ActionText =>
      'Usa solo el 1% del efectivo total una vez por semana para acumular TQQQ fraccionado. No inviertas una cantidad grande de una vez.';

  @override
  String get minus20BuyRuleTitle => 'Objetivo';

  @override
  String get minus20BuyRuleText =>
      'Esta configuración empieza en la zona -20% para que, si el mercado se mueve lateralmente, las compras pequeñas reduzcan gradualmente el precio medio de TQQQ. El objetivo no es acertar una ganancia inmediata, sino construir un coste medio más bajo.';

  @override
  String get minus20CashTitle => 'Gestión de efectivo';

  @override
  String get minus20CashText =>
      'La mayor parte del efectivo debe quedar disponible para las zonas -30%, -40% y -50%. Incluso tras usar el efectivo planificado en -50%, el nuevo efectivo puede seguir bajando el precio medio con acumulación semanal.';

  @override
  String get minus20AvoidTitle => 'Plan de salida';

  @override
  String get minus20AvoidText =>
      'No vendas estas acciones de TQQQ en cada rebote corto. Trátalas como parte de la posición que se cerrará más adelante, cuando se marque un nuevo máximo y se reduzca TQQQ.';

  @override
  String get minus30ActionTitle => 'Acción inmediata';

  @override
  String get minus30ActionText =>
      'Usa solo el 20% del efectivo disponible para comprar TQQQ. Revisa el efectivo total antes de ordenar.';

  @override
  String get minus30BuyRuleTitle => 'Regla de compra';

  @override
  String get minus30BuyRuleText =>
      'Si tienes \$10,000 en efectivo, usa solo \$2,000 para TQQQ y conserva el 80% restante.';

  @override
  String get minus30AdditionalTitle => 'Acción adicional';

  @override
  String get minus30AdditionalText =>
      'Puedes mantener la acumulación de QLD, pero espera a la siguiente zona para comprar más TQQQ.';

  @override
  String get minus30AvoidTitle => 'Evitar';

  @override
  String get minus30AvoidText =>
      'No gastes demasiado efectivo esperando un rebote. Actúa como si la zona -40% aún pudiera llegar.';

  @override
  String get minus40ActionTitle => 'Acción inmediata';

  @override
  String get minus40ActionText =>
      'Usa el 30% del efectivo restante para comprar TQQQ. Excluye lo ya usado en -30%.';

  @override
  String get minus40BuyRuleTitle => 'Regla de compra';

  @override
  String get minus40BuyRuleText =>
      'Si el efectivo restante es \$8,000, usa solo \$2,400. La clave es no usar todo de una vez.';

  @override
  String get minus40HoldTitle => 'Regla de mantenimiento';

  @override
  String get minus40HoldText =>
      'Mantén QLD y aumenta TQQQ solo hasta la cantidad planificada. Deja efectivo por si cae más.';

  @override
  String get minus40AvoidTitle => 'Evitar';

  @override
  String get minus40AvoidText =>
      'No vendas posiciones por miedo. Tampoco compres con todo el efectivo por codicia.';

  @override
  String get minus50ActionTitle => 'Acción inmediata';

  @override
  String get minus50ActionText =>
      'Usa todo el efectivo restante para comprar TQQQ. Es la última fase planificada de uso de efectivo.';

  @override
  String get minus50BuyRuleTitle => 'Regla de compra';

  @override
  String get minus50BuyRuleText =>
      'Calcula solo con el efectivo real restante, excluyendo lo ya usado en -30% y -40%.';

  @override
  String get minus50AfterTitle => 'Después';

  @override
  String get minus50AfterText =>
      'Cuando entre nuevo efectivo, acumula TQQQ o QLD regularmente y enfócate en bajar el precio medio.';

  @override
  String get minus50AvoidTitle => 'Evitar';

  @override
  String get minus50AvoidText =>
      'No abandones solo por una gran pérdida. No uses deuda ni dinero de corto plazo para comprar más.';

  @override
  String get alertNasdaq200Title => 'Alerta media 200 días Nasdaq 100';

  @override
  String get alertNasdaq200Subtitle =>
      'Avisar cuando el Nasdaq 100 rompa por debajo o por encima de la media de 200 días';

  @override
  String get alertNasdaq200Breakdown =>
      'El Nasdaq 100 cayó por debajo de la media móvil de 200 días';

  @override
  String get alertNasdaq200Breakout =>
      'El Nasdaq 100 volvió a superar la media móvil de 200 días';

  @override
  String get chartGuideTitle => 'Cómo leer este gráfico';

  @override
  String get chartMiniTitle => 'Gráfico de 3 meses con medias de 20 y 200 días';

  @override
  String get chartGuideCandleTitle => 'Velas de 3 meses';

  @override
  String get chartGuideCandleBody =>
      'Muestra de un vistazo el movimiento reciente de QLD. Verde indica cierre al alza; rojo indica cierre a la baja.';

  @override
  String get chartGuideMa200Title => 'Línea de 200 días';

  @override
  String get chartGuideMa200Body =>
      'Una referencia de tendencia a largo plazo. Por encima sugiere fortaleza; por debajo conviene revisar riesgo y efectivo.';

  @override
  String get chartMa200SheetTitle => '¿Qué es la media móvil de 200 días?';

  @override
  String get chartMa200SheetBody =>
      'La media móvil de 200 días es una línea de tendencia de largo plazo calculada con el precio de cierre promedio de aproximadamente los últimos 200 días de mercado.\n\nMuchos inversores la siguen porque reduce el ruido de corto plazo y permite ver mejor la dirección general del mercado. Cuando el precio está por encima, suele interpretarse como una tendencia de largo plazo más sana; cuando está por debajo, puede indicar menor impulso o la necesidad de revisar el riesgo.\n\nNo debe usarse como una señal única de compra o venta. En un ETF apalancado como QLD, conviene usarla junto con la proporción de efectivo, la caída acumulada, el precio promedio y el horizonte de inversión.';

  @override
  String get chartMa20SheetTitle => '¿Qué es la media móvil de 20 días?';

  @override
  String get chartMa20SheetBody =>
      'La media móvil de 20 días es una línea de tendencia de corto plazo calculada con el cierre promedio de aproximadamente los últimos 20 días de mercado.\n\nMuchos inversores la observan porque reacciona más rápido que la media de 200 días y ayuda a ver el impulso reciente. Un precio sostenido por encima puede sugerir fortaleza de corto plazo; rupturas repetidas por debajo pueden indicar que la tendencia reciente se debilita.\n\nEn QLD, la línea de 20 días ayuda a leer velocidad y volatilidad de corto plazo, pero puede dar muchas señales falsas. Conviene compararla con la línea de 200 días, el efectivo disponible y las zonas de compra planificadas.';

  @override
  String get alertPortfolioCashTitle => 'Alerta de rebalanceo de efectivo';

  @override
  String get alertPortfolioCashSubtitle =>
      'Avisar cuando el efectivo caiga por debajo del 20% tras subidas';

  @override
  String get alertPortfolioCashHigh =>
      'El efectivo está por debajo del 20%. Considera rebalancear para recuperar efectivo.';

  @override
  String get alertPortfolioCashLow =>
      'El efectivo está por debajo del 20%. Considera rebalancear para recuperar efectivo.';

  @override
  String get alertAnnouncementTitle => 'Notificaciones de avisos';

  @override
  String get alertAnnouncementSubtitle =>
      'Recibir avisos enviados por QLD DIP ALERT como notificaciones push';

  @override
  String get alertDetailTitle => 'Detalle de alerta';

  @override
  String get alertDetailOpenStrategy => 'Ver estrategia';

  @override
  String get alertDetailRecovery =>
      'La zona de caída ha mejorado. Revisa la cartera con calma y evita vender o comprar por impulso.';

  @override
  String get alertDetailNewHigh =>
      'Se registró un nuevo máximo tras la instalación. Será la nueva referencia para calcular futuras caídas.';

  @override
  String get alertDetailMarketOpen =>
      'El mercado regular de EE. UU. ha abierto. Revisa precios y alertas solo si pensabas actuar hoy.';

  @override
  String get alertDetailNasdaq200Breakdown =>
      'El Nasdaq 100 cayó bajo la media móvil de 200 días. Puede indicar debilidad de tendencia; revisa riesgo y efectivo.';

  @override
  String get alertDetailNasdaq200Breakout =>
      'El Nasdaq 100 volvió sobre la media móvil de 200 días. Puede indicar mejora, pero sigue tu estrategia.';

  @override
  String get alertDetailPortfolioCashHigh =>
      'El efectivo está por debajo de la guía del 20%. Suele significar que las acciones subieron y el colchón de efectivo se redujo. Considera vender una parte y rebalancear hacia el nivel de efectivo previsto.';

  @override
  String get alertDetailPortfolioCashLow =>
      'El efectivo está por debajo de la guía del 20%. Suele significar que las acciones subieron y el colchón de efectivo se redujo. Considera vender una parte y rebalancear hacia el nivel de efectivo previsto.';

  @override
  String get alertDetailOpenLink => 'Abrir enlace';

  @override
  String get appUpdateTitle => 'Actualización disponible';

  @override
  String get appUpdateMessage =>
      'Hay una versión nueva disponible. Actualiza para usar las últimas funciones y correcciones.';

  @override
  String get appUpdateLater => 'Más tarde';

  @override
  String get appUpdateNow => 'Actualizar';

  @override
  String get alertTestTitle => 'Prueba de notificación';

  @override
  String get alertPermissionHelpTitle => '¿No recibes notificaciones?';

  @override
  String get alertPermissionHelpBody =>
      'Si el permiso de notificaciones del dispositivo está desactivado, es posible que las notificaciones de prueba no aparezcan.';

  @override
  String get alertPermissionRequest => 'Solicitar permiso';

  @override
  String get alertPermissionOpenSettings => 'Abrir ajustes';

  @override
  String get holdPageTitle => 'Mantener posición';

  @override
  String get holdHeadline =>
      'La compra planificada ya se ejecutó. Durante la recuperación, concéntrate en mantener la posición.';

  @override
  String get holdPositionTitle => 'Posición actual';

  @override
  String get holdPositionText =>
      'Mantén las posiciones de QLD y TQQQ ya compradas. No repitas la compra de una zona anterior solo porque el precio vuelva a una zona recuperada.';

  @override
  String get holdActionTitle => 'Acción actual';

  @override
  String get holdActionText =>
      'Pausa las compras adicionales de TQQQ y observa la recuperación. Conserva el efectivo restante ante una nueva caída.';

  @override
  String get holdAvoidTitle => 'Evitar';

  @override
  String get holdAvoidText =>
      'No vendas apresuradamente por la volatilidad ni compres impulsivamente por confiar en la recuperación.';

  @override
  String get holdResetTitle => 'Reinicio de estrategia';

  @override
  String get holdResetText =>
      'Cuando QLD recupere completamente el máximo anterior, este ciclo de caída termina y la estrategia vuelve a la posición inicial sin compras.';

  @override
  String get investmentCalculatorTitle =>
      'Calculadora de rentabilidad esperada';

  @override
  String get investmentCalculatorSubtitle =>
      'Cálculo compuesto simple basado en el promedio histórico de QLD';

  @override
  String get investmentCalculatorReturnRate => 'Rentabilidad media a 10 años';

  @override
  String get investmentCalculatorLumpSumTitle =>
      'Aporte único + compra en caídas';

  @override
  String get investmentCalculatorAmount => 'Importe invertido';

  @override
  String get investmentCalculatorYears => 'Periodo';

  @override
  String get investmentCalculatorExpectedValue => 'Valor estimado';

  @override
  String get investmentCalculatorPrincipalMultiple => 'Múltiplo del capital';

  @override
  String get investmentCalculatorMonthlyTitle => 'Inversión periódica';

  @override
  String get investmentCalculatorMonthlyAmount => 'Importe mensual';

  @override
  String get investmentCalculatorTotalPrincipal => 'Total aportado';

  @override
  String get investmentCalculatorExpectedProfit => 'Beneficio estimado';

  @override
  String get investmentCalculatorDisclaimer =>
      'Es un cálculo simple basado en rentabilidades pasadas y no garantiza rentabilidades futuras.';

  @override
  String get investmentCalculatorYearsSuffix => 'a';

  @override
  String get investmentCalculatorTimesSuffix => 'x';

  @override
  String get investmentCalculatorChartHint =>
      'Puedes revisar la rentabilidad media con el gráfico histórico.';

  @override
  String get investmentCalculatorCurrencySectionTitle => 'Conversión de divisa';

  @override
  String get investmentCalculatorCurrency => 'País/Moneda';

  @override
  String get investmentCalculatorExchangeRate => 'Tipo por 1 USD';

  @override
  String get investmentCalculatorExchangeRateHint =>
      'Introduce cuánto vale 1 USD en la moneda seleccionada.';

  @override
  String get investmentCalculatorConvertedLumpSum =>
      'Valor final de inversión única';

  @override
  String get investmentCalculatorConvertedMonthly =>
      'Valor final de inversión periódica';

  @override
  String get investmentCurrencyUnitedStatesUsd => 'Estados Unidos USD';

  @override
  String get investmentCurrencyKoreaKrw => 'Corea KRW';

  @override
  String get investmentCurrencyJapanJpy => 'Japón JPY';

  @override
  String get investmentCurrencyChinaCny => 'China CNY';

  @override
  String get investmentCurrencyTaiwanTwd => 'Taiwán TWD';

  @override
  String get investmentCurrencyGermanyEur => 'Alemania EUR';

  @override
  String get investmentCurrencyFranceEur => 'Francia EUR';

  @override
  String get investmentCurrencySpainEur => 'España EUR';

  @override
  String get investmentCurrencyPortugalEur => 'Portugal EUR';

  @override
  String get investmentCurrencyRussiaRub => 'Rusia RUB';

  @override
  String get contentTitle => 'Contenido';

  @override
  String get contentInquiry => 'Consultas';

  @override
  String get contentCloseGuess => 'Adivinar cierre';

  @override
  String get contentStockQuote => 'Frases bursatiles';

  @override
  String get contentNumberGuess => 'Adivina el numero';

  @override
  String get contentBookReader => 'Lector de libros';

  @override
  String get contentStockMeme => 'Meme bursatil';

  @override
  String get contentLottoNumbers => 'Numeros de loteria';

  @override
  String get contentJumpDodge => 'Juego de saltar y esquivar';

  @override
  String get stockQuoteTitle => 'Frases bursatiles';

  @override
  String get stockQuoteTapHint => 'Toca para ver otra frase.';

  @override
  String get stockQuoteShuffle => 'Ver otra frase';

  @override
  String get usageGuideTitle => 'Cómo usar la app';

  @override
  String get usageGuideSubtitle =>
      'Reglas para una estrategia Nasdaq 2x de largo plazo';

  @override
  String get usageGuideCardTitle => 'Cómo usar la app';

  @override
  String get usageGuideCardSubtitle =>
      'Posición base, zonas de caída, registros, indicadores';

  @override
  String get usageGuideWhatAppTitle => '¿Qué es esta app?';

  @override
  String get usageGuideWhatAppBody =>
      'Esta app es una guía de reglas para inversores de Nasdaq 2x con una visión de largo plazo.\n\nCalcula automáticamente la caída actual desde el máximo histórico para mostrar la posición del mercado y ofrece una estrategia para cada zona.\n\nAyuda a mantener los principios de inversión planificados sin dejarse llevar por el miedo o la codicia del mercado.';

  @override
  String get usageGuideNoBuyTitle =>
      '1. Lee primero la posición base y la estrategia';

  @override
  String get usageGuideNoBuyBody =>
      'Toca la tarjeta de Posición base en la pantalla principal y lee cómo prepararte. También revisa la pestaña Estrategia en la parte inferior derecha.';

  @override
  String get usageGuideStrategyTitle =>
      '2. Revisa la estrategia automática por caída';

  @override
  String get usageGuideStrategyBody =>
      'La tercera tarjeta calcula automáticamente cuánto está QLD por debajo de su máximo histórico. Se muestra la estrategia correspondiente y llegan alertas si se cumplen las condiciones.';

  @override
  String get usageGuideIndicatorsTitle => 'Cuatro indicadores de apoyo';

  @override
  String get usageGuideIndicatorsBody =>
      'CNN F&G muestra si el sentimiento del mercado está más cerca del miedo o la codicia.\n\nVIX muestra la volatilidad del mercado. Un número más alto suele significar más ansiedad.\n\nLos eventos clave de EE. UU. incluyen NFP, CPI y FOMC. NFP mide empleo, CPI mide inflación y FOMC marca la dirección de tasas. Pueden mover fuerte al Nasdaq y QLD.\n\nEl rendimiento del bono a 10 años es la tasa del Tesoro de EE. UU. a 10 años. Si sube rápido, puede presionar a acciones de crecimiento, Nasdaq y QLD.';

  @override
  String get usageGuideQldTitle => '3. Compra y registra en el portafolio';

  @override
  String get usageGuideQldBody =>
      'Usa la estrategia y el monto como guía, compra en tu broker y luego registra cantidad, precio promedio y efectivo en el portafolio de la app.';

  @override
  String get usageGuideDisclaimer =>
      'Esta app es solo una referencia de inversión y no garantiza ganancias.';

  @override
  String get usageGuideConfirm => 'OK';
}
