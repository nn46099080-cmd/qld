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
  String get menuThemeTitle => 'Tema';

  @override
  String get menuLanguageTitle => 'Idioma';

  @override
  String get menuThemeLight => 'Claro';

  @override
  String get menuThemeDark => 'Oscuro';

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
  String get exitAdDialogMessage =>
      'Al salir de la aplicación, puede mostrarse un anuncio de pantalla completa como máximo una vez cada 3 horas. Los ingresos publicitarios se utilizan para mantener la aplicación y mejorar sus funciones. Gracias.';

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
  String get holdQLDPlusCash => 'QLD 70% + 30% efectivo';

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
  String get checkStrategyCard =>
      'Consulte la tarjeta de estrategia para su zona actual.';

  @override
  String get strategyCardLabel => 'Tarjeta de estrategia';

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
      'Iniciar acumulación semanal de TQQQ con 1% del efectivo total';

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
      'Compre TQQQ semanalmente con el 1% de su efectivo disponible.\nEj.) \$500 en efectivo → compra \$5 por semana';

  @override
  String get minus20BuyRuleTitle => 'Objetivo';

  @override
  String get minus20BuyRuleText =>
      'Esta configuración empieza en la zona -20% para que, si el mercado se mueve lateralmente, las compras pequeñas reduzcan gradualmente el precio medio de TQQQ. El objetivo no es acertar una ganancia inmediata, sino construir un coste medio más bajo.';

  @override
  String get minus20CashTitle => 'Gestión de efectivo';

  @override
  String get minus20CashText =>
      'La mayor parte del efectivo debe quedar disponible para las zonas -30%, -40% y -50%. Incluso tras usar el efectivo planificado en -50%, el nuevo efectivo puede seguir bajando el precio medio con acumulación semanal.\n\nIncluso si el mercado se mueve lateralmente durante 10 semanas o más, continúa acumulando el 1% del efectivo total cada semana. Cuanto más dure el movimiento lateral, más participaciones acumulas — no hay razón para detenerse.\n\nCuando se alcance la zona -30%, realiza una compra adicional única usando el 20% del efectivo restante en ese momento. La acumulación semanal no se detiene — continúa junto con la estrategia -30%. La acumulación termina solo cuando se recupere el máximo anterior y se realice el rebalanceo.';

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
  String get rebalanceTitle => 'Zona de reequilibrio';

  @override
  String get rebalanceHeadline => 'Vender TQQQ y volver a la posición base';

  @override
  String get rebalanceOverviewTitle => 'Resumen de estrategia';

  @override
  String get rebalanceOverviewText =>
      'La recuperación de máximos históricos señala el fin de la fase de respuesta a la crisis. Es el momento de vender el TQQQ acumulado en zonas de -20% o inferiores y volver a la posición base (QLD 70%, Efectivo 30%).';

  @override
  String get rebalanceActionTitle => 'Acción inmediata';

  @override
  String get rebalanceActionText =>
      'Venda todo el TQQQ acumulado o comprado en zonas de -20% o inferiores. Luego reequilibre sus activos según la asignación de posición base.';

  @override
  String get rebalanceCashTitle => 'Objetivo de efectivo';

  @override
  String get rebalanceCashText =>
      'Tras el reequilibrio, mantener QLD 70% y Efectivo 30%. Guardar el efectivo asegurado como reserva para la próxima caída.';

  @override
  String get rebalanceAvoidTitle => 'Qué evitar';

  @override
  String get rebalanceAvoidText =>
      'No continúe acumulando TQQQ tras la recuperación del máximo histórico. Venda las posiciones acumuladas durante la fase de crisis y vuelva a la posición base.';

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
  String get contentInquirySubtitle =>
      'Envía una consulta anónima y revisa la respuesta.';

  @override
  String get contentInquiryBadge => 'Q&A';

  @override
  String get contentCloseGuess => 'Adivinar cierre';

  @override
  String get contentStockQuote => 'Frases bursatiles';

  @override
  String get contentStockQuoteSubtitle =>
      'Citas cortas para afinar tu instinto inversor.';

  @override
  String get contentStockQuoteBadge => 'Diario';

  @override
  String get contentNumberGuess => 'Adivina el numero';

  @override
  String get contentNumberGuessSubtitle =>
      'Mini juego de probabilidad para disfrutar fácilmente.';

  @override
  String get contentNumberGuessBadge => 'Juego';

  @override
  String get contentBookReader => 'Columna';

  @override
  String get contentBookReaderSubtitle =>
      'Textos de dominio público para leer con calma.';

  @override
  String get contentBookReaderBadge => 'Leer';

  @override
  String get contentStockMeme => 'Meme bursatil';

  @override
  String get contentLottoNumbers => 'Numeros de loteria';

  @override
  String get contentJumpDodge => 'Juego de saltar y esquivar';

  @override
  String get contentJumpDodgeSubtitle =>
      'Mini juego de salto para sesiones cortas y concentradas.';

  @override
  String get contentJumpDodgeBadge => 'Acción';

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
      'Toca la tarjeta de Posición base en la pantalla principal y lee cómo prepararte. También revisa la pestaña Estrategia en la parte inferior derecha.\n\n* Compra QLD con el 70% de tus fondos totales.';

  @override
  String get usageGuideStrategyTitle =>
      '2. Revisa la estrategia automática por caída';

  @override
  String get usageGuideStrategyBody =>
      'La Tarjeta de estrategia en la pantalla principal muestra automáticamente la zona correspondiente cada vez que QLD cae un determinado porcentaje por debajo de su máximo histórico. Toca la tarjeta para realizar la compra o el reequilibrio correspondiente. También llegan alertas cuando se cumplen las condiciones.';

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

  @override
  String get bookReadingTitle => 'Columna';

  @override
  String bookReaderPageNumber(int page) {
    return 'Página $page';
  }

  @override
  String get numGuessPrompt => 'Adivina un número entre 1 y 10000.';

  @override
  String get numGuessInvalidInput =>
      'Por favor, ingresa un número entre 1 y 10000.';

  @override
  String numGuessCorrect(int attempts) {
    return '¡Correcto! Lo lograste en $attempts intentos.';
  }

  @override
  String get numGuessTooLow => 'El número es mayor.';

  @override
  String get numGuessTooHigh => 'El número es menor.';

  @override
  String numGuessAttemptsLabel(int count) {
    return 'Intentos: $count';
  }

  @override
  String numGuessLastGuessLabel(int number) {
    return 'Tu número: $number';
  }

  @override
  String get numGuessInputHint => 'Ingresar número';

  @override
  String get numGuessConfirm => 'Confirmar';

  @override
  String get numGuessNewGame => 'Nuevo juego';

  @override
  String get numGuessRanking => 'Clasificación';

  @override
  String get numGuessNoRecords => 'Aún no hay registros.';

  @override
  String numGuessAttemptCount(int count) {
    return '$count intentos';
  }

  @override
  String get jumpLeaderboard => 'Tabla de líderes';

  @override
  String get jumpScore => 'Puntuación';

  @override
  String get jumpPersonalBest => 'Mejor puntaje personal';

  @override
  String get jumpTapToRestart => 'Toca para reiniciar';

  @override
  String get jumpTapToStart => 'Toca para comenzar';

  @override
  String get jumpInstruction =>
      'Toca la pantalla para saltar y esquivar obstáculos.';

  @override
  String get inquiryLoadError => 'No se pudieron cargar las consultas.';

  @override
  String get inquiryAdminOnlyReply =>
      'Solo los administradores pueden responder.';

  @override
  String get inquiryReplyEmpty => 'Por favor, escribe una respuesta.';

  @override
  String get inquiryReplyError =>
      'Error al enviar la respuesta. Inténtalo más tarde.';

  @override
  String get inquiryAdminOnlyPin => 'Solo los administradores pueden fijar.';

  @override
  String get inquiryPinError => 'No se pudo guardar el estado fijado.';

  @override
  String get inquiryAdminOnlyDelete =>
      'Solo los administradores pueden eliminar.';

  @override
  String get inquiryDeleteTitle => 'Eliminar consulta';

  @override
  String get inquiryDeleteConfirm => '¿Eliminar esta consulta?';

  @override
  String get inquiryCancel => 'Cancelar';

  @override
  String get inquiryDeleteAction => 'Eliminar';

  @override
  String get inquiryDeleteError => 'Error al eliminar. Inténtalo más tarde.';

  @override
  String get inquiryContentEmpty => 'Por favor, escribe tu consulta.';

  @override
  String get inquirySubmitError =>
      'Error al enviar la consulta. Inténtalo más tarde.';

  @override
  String get inquiryAdminLabel => 'Administrador';

  @override
  String get inquiryPasswordLabel => 'Contraseña';

  @override
  String get inquiryPasswordWrong => 'Contraseña incorrecta.';

  @override
  String get inquiryAdminActivatedRegistered =>
      'Modo admin activado (dispositivo registrado)';

  @override
  String get inquiryAdminActivatedFailed =>
      'Modo admin activado (fallo al registrar dispositivo)';

  @override
  String get inquiryContentDetailLabel => 'Consulta';

  @override
  String get inquiryAdminReplyLabel => 'Respuesta del administrador';

  @override
  String get inquiryAdminReplyEdit => 'Editar respuesta';

  @override
  String get inquirySaving => 'Guardando...';

  @override
  String get inquirySubmitReply => 'Enviar respuesta';

  @override
  String get inquiryPrevPage => 'Página anterior';

  @override
  String get inquiryNextPage => 'Página siguiente';

  @override
  String inquiryPageOf(int current, int total) {
    return 'Página $current / $total';
  }

  @override
  String get inquiryUnpin => 'Desfijar';

  @override
  String get inquiryPin => 'Fijar arriba';

  @override
  String get inquiryListTitle => 'Lista de consultas';

  @override
  String get inquiryEmpty => 'No hay consultas aún.';

  @override
  String get inquiryWriteTitle => 'Escribir consulta';

  @override
  String get inquiryContentFieldLabel => 'Contenido';

  @override
  String get inquirySubmitting => 'Enviando...';

  @override
  String get inquirySubmitButton => 'Enviar';

  @override
  String get inquiryUserReplyLabel => 'Agregar un mensaje de seguimiento...';

  @override
  String get indicatorCnnFearGreed => 'CNN Miedo & Codicia';

  @override
  String get indicatorVix => 'VIX Volatilidad';

  @override
  String get indicatorUsSchedule => 'Eventos Importantes EE.UU.';

  @override
  String get indicatorTenYearYield => 'Bono EE.UU. 10 años';

  @override
  String get indicatorUsMarketTime => 'Tiempo Mercado EE.UU.';

  @override
  String get indicatorVixHigh => 'Alta volatilidad';

  @override
  String get indicatorVixStable => 'Zona normal';

  @override
  String get indicatorVixDefault => 'Indicador de ansiedad';

  @override
  String get indicatorVixLow => 'Volatilidad muy baja';

  @override
  String get indicatorVixCaution => 'Zona de precaución';

  @override
  String get indicatorTenYearDesc => 'Tasa bono 10 años EE.UU.';

  @override
  String get marketWeekendLabel => 'Fin de Semana · Para Abrir';

  @override
  String get marketPreOpenLabel => 'Hasta la apertura';

  @override
  String get marketToCloseLabel => 'Hasta el cierre';

  @override
  String get marketClosedLabel => 'Mercado cerrado';

  @override
  String get marketClosedValue => 'Cerrado';

  @override
  String get noData => 'Sin datos';

  @override
  String get rsiOverbought => 'Sobrecomprado';

  @override
  String get rsiOversold => 'Sobrevendido';

  @override
  String get rsiNormal => 'Neutral';

  @override
  String get rsiOverboughtZone => 'Zona sobrecomprada';

  @override
  String get rsiOversoldZone => 'Zona sobrevendida';

  @override
  String get rsiNormalZone => 'Rango normal';

  @override
  String get rsiOverboughtOversold => 'Sobrecomprado / Sobrevendido';

  @override
  String get coverStrategyTab => 'Pestaña de Estrategia';

  @override
  String get coverStrategyHint =>
      'Desliza hacia arriba para ver la Pestaña de Estrategia';

  @override
  String get usScheduleSheetTitle => 'Calendario EE. UU.';

  @override
  String get noScheduleLeft => 'No hay eventos registrados';

  @override
  String get scheduleNameHint => 'Nombre del evento';

  @override
  String get adminPassword => 'Contraseña de administrador';

  @override
  String get addSchedule => 'Agregar evento';

  @override
  String get wrongPassword => 'Contraseña incorrecta.';

  @override
  String get checkScheduleNameAndDate =>
      'Verifique el nombre del evento y la fecha.';

  @override
  String get editSchedule => 'Editar evento';

  @override
  String get rsiDialogTitle => '¿Qué es el RSI(14)?';

  @override
  String get rsiDialogContent =>
      'El RSI (Índice de Fuerza Relativa) compara las ganancias y pérdidas de los últimos 14 días para mostrar si el precio actual de la acción está sobrecomprado o sobrevendido, en una escala de 0 a 100.\n\n• 70 o más → Zona de sobrecompra\n  Alta probabilidad de corrección a corto plazo tras una subida rápida.\n\n• 30 o menos → Zona de sobreventa\n  Posible rebote tras una caída brusca a corto plazo.\n\n• 30–70 → Rango normal\n  Sin señal de sobrecompra o sobreventa.';

  @override
  String get inquiryEditMessageTitle => 'Editar mensaje';

  @override
  String get inquiryEditMessageSave => 'Guardar';

  @override
  String get inquiryTapToEdit => 'Toca para editar';

  @override
  String get stockQuoteList =>
      'Sé temeroso cuando otros son codiciosos, y codicioso cuando otros son temerosos. — Warren Buffett\nEl precio es lo que pagas. El valor es lo que obtienes. — Warren Buffett\nEs mejor comprar una empresa maravillosa a un precio justo. — Warren Buffett\nNunca inviertas en un negocio que no puedas entender. — Warren Buffett\nEl riesgo surge de no saber lo que estás haciendo. — Warren Buffett\nSi compras una buena empresa, cuanto más tiempo la mantengas, mejor. — Warren Buffett\nSe tarda 20 años en construir una reputación y cinco minutos en arruinarla. — Warren Buffett\nLas fluctuaciones del mercado no son una amenaza sino una oportunidad. — Warren Buffett\nSolo cuando baja la marea descubres quién ha estado nadando desnudo. — Warren Buffett\nEl inversor debe enfocarse en evitar grandes errores en lugar de buscar jonrones. — Warren Buffett\nSi te mantienes dentro de tu círculo de competencia, los errores disminuyen. — Warren Buffett\nComprar acciones es comprar parte de una empresa, no un papel. — Warren Buffett\nSolo compra algo que estés feliz de mantener aunque el mercado cerrara 10 años. — Warren Buffett\nMira el poder de ganancias a largo plazo de la empresa, no el precio a corto plazo. — Warren Buffett\nUna estructura empresarial excelente suele importar más que una gestión excelente. — Warren Buffett\nElige lo simple y cierto sobre lo complejo e incierto. — Warren Buffett\nInvertir en uno mismo puede ser la mejor inversión de todas. — Warren Buffett\nEl juicio paciente que puede soportar supera al trading impulsivo. — Warren Buffett\nNo tienes que batear cada lanzamiento. Espera el correcto. — Warren Buffett\nEl temperamento importa más que el coeficiente intelectual en la inversión. — Warren Buffett\nUna gran empresa revela su valor más con el tiempo. — Warren Buffett\nEntender bien un buen negocio importa más que comprarlo barato. — Warren Buffett\nMira el flujo de caja de la empresa, no el ruido del mercado. — Warren Buffett\nInvertir con deuda hace peligroso incluso el buen juicio. — Warren Buffett\nEl efectivo te permite actuar cuando llega la oportunidad. — Warren Buffett\nEl gran dinero no viene del trading frecuente sino de la paciencia. — Charlie Munger\nInvierte, siempre invierte — evita errores tontos en lugar de intentar ser listo. — Charlie Munger\nCuando un problema es difícil de resolver, intenta trabajar hacia atrás. — Charlie Munger\nLa reputación y la integridad pueden desaparecer en un instante. — Charlie Munger\nPoseer un gran negocio durante mucho tiempo es la clave del interés compuesto. — Charlie Munger\nEntender los incentivos te ayuda a entender el comportamiento humano. — Charlie Munger\nCuanto más actúas, más oportunidades creas para cometer errores. — Charlie Munger\nInvertir requiere la capacidad de esperar. — Charlie Munger\nEl buen juicio proviene de conectar el conocimiento de muchos campos. — Charlie Munger\nUn negocio de calidad hace que el tiempo sea tu aliado como inversor. — Charlie Munger\nCuando las oportunidades son raras, la persona preparada tiene ventaja. — Charlie Munger\nIntenta ser un poco menos tonto cada día en lugar de un poco más listo. — Charlie Munger\nEl éxito viene de mantener los fundamentos, no de fórmulas complejas. — Charlie Munger\nLas buenas inversiones se sienten incómodas para los impacientes. — Charlie Munger\nNo necesitas aprender de cada error tú mismo — aprende de los de otros. — Charlie Munger\nLos resultados sobresalientes vienen de actuar con audacia en oportunidades raras. — Charlie Munger\nCuidado con el error de pagar demasiado incluso por un gran negocio. — Charlie Munger\nLas palabras más peligrosas en la inversión son \'más o menos lo sé\'. — Charlie Munger\nMantener la simplicidad ayuda al rendimiento a largo plazo. — Charlie Munger\nPara vencer al mercado, primero vence tus propios impulsos. — Charlie Munger\nEl margen de seguridad es el escudo del inversor. — Benjamin Graham\nA corto plazo, el mercado es una máquina de votar; a largo plazo, una máquina de pesar. — Benjamin Graham\nEl inversor inteligente vende a los optimistas y compra a los pesimistas. — Benjamin Graham\nLos movimientos de precios son sugerencias, no órdenes. — Benjamin Graham\nLa inversión debe basarse en el análisis; la especulación depende de las expectativas. — Benjamin Graham\nNo te dejes dominar por los estados de ánimo del Sr. Mercado — explótalos. — Benjamin Graham\nComprar muy por debajo del valor es cómo te preparas para tus propios errores. — Benjamin Graham\nEl principio de evitar pérdidas viene antes que el principio de obtener beneficios. — Benjamin Graham\nLos mercados son a veces irracionales, pero el valor finalmente se refleja. — Benjamin Graham\nCuanto más incierta es la situación, mayor debe ser el margen de seguridad. — Benjamin Graham\nEl inversor debe calcular el valor antes que el precio. — Benjamin Graham\nEl buen análisis proviene de la calma, no de la emoción. — Benjamin Graham\nEl inversor defensivo evita el exceso de confianza. — Benjamin Graham\nEl rendimiento esperado sin principios se acerca más a la especulación que a la inversión. — Benjamin Graham\nLos caprichos del mercado pueden convertirse en el amigo del inversor a largo plazo. — Benjamin Graham\nSer barato por sí solo no es suficiente — necesitas valor y margen de seguridad. — Benjamin Graham\nConfía en los números y el valor sobre las emociones de la multitud. — Benjamin Graham\nQuienes admiten que pueden equivocarse sobreviven más tiempo. — Benjamin Graham\nLa primera pregunta en la inversión no es cuánto puedo ganar, sino cuánto puedo perder. — Benjamin Graham\nUna buena inversión es una decisión respaldada por análisis suficiente y margen de seguridad suficiente. — Benjamin Graham\nSabe lo que posees y por qué lo posees. — Peter Lynch\nLas acciones no son billetes de lotería — son partes de un negocio. — Peter Lynch\nSi una empresa va bien, la acción eventualmente seguirá. — Peter Lynch\nPuedes encontrar ideas de inversión en lugares que ya entiendes. — Peter Lynch\nInvertir sin investigar es como jugar al póker sin mirar tus cartas. — Peter Lynch\nLas caídas se repiten — la pregunta es si puedes resistirlas. — Peter Lynch\nEl coraje importa tanto como el conocimiento en el mercado de valores. — Peter Lynch\nIncluso una buena acción necesita revisarse cuando su historia cambia. — Peter Lynch\nNo todas las acciones necesitan tener éxito — un gran ganador puede transformar una cartera. — Peter Lynch\nLa historia de la empresa viene antes que el precio de la acción. — Peter Lynch\nIncluso en un negocio que conoces bien, comprueba los números. — Peter Lynch\nEn lugar de predecir el mercado, enfócate en encontrar grandes empresas. — Peter Lynch\nLos inversores individuales pueden descubrir grandes empresas a través de la vida cotidiana. — Peter Lynch\nUna gran empresa impopular puede ofrecer una oportunidad mayor. — Peter Lynch\nSi no estás preparado para una caída brusca, reduce tu exposición a acciones. — Peter Lynch\nNo te enamores de una acción — sigue el rendimiento de la empresa. — Peter Lynch\nEl mayor error es pretender saber lo que no sabes. — Peter Lynch\nUna buena idea de inversión no requiere una explicación compleja. — Peter Lynch\nNo asumas que una acción es barata solo porque el precio ha bajado. — Peter Lynch\nRevisa una acción de crecimiento en el momento en que su historia de crecimiento se rompe. — Peter Lynch\nLa fórmula ganadora en inversión es mantener ampliamente y resistir largo. — John Bogle\nMantén el rumbo — no cambies tu plan por el ruido del mercado. — John Bogle\nNo busques la aguja en el pajar. Solo compra el pajar. — John Bogle\nLos costos son un lastre cierto; los rendimientos son inciertos. — John Bogle\nEl tiempo es tu amigo, el impulso es tu enemigo. — John Bogle\nLa especulación lidera con emoción; la inversión la reduce. — John Bogle\nLos inversores a largo plazo no necesitan predecir el mercado. — John Bogle\nEl bajo costo es la variable más poderosa que un inversor puede controlar. — John Bogle\nPoseer todo el mercado reduce los errores de acciones individuales. — John Bogle\nLa capacidad de no hacer nada es la ventaja competitiva del inversor. — John Bogle\nLos fondos indexados simples sobreviven más que los productos complejos. — John Bogle\nPerseguir rendimientos puede reducir tus rendimientos. — John Bogle\nNo puedes conocer el futuro, pero puedes reducir tus costos. — John Bogle\nDiversificación, bajo costo y mantenimiento prolongado son los básicos. — John Bogle\nCon el tiempo, los mercados reflejan el rendimiento de toda la economía. — John Bogle\nCuanto más a menudo compruebes, más razones encontrarás para ser sacudido. — John Bogle\nMantén tu plan de inversión con principios, no con emociones. — John Bogle\nLa inversión aburrida puede producir los resultados más sólidos. — John Bogle\nObtener consistentemente el promedio del mercado es una estrategia poderosa. — John Bogle\nLos costos y las emociones son los mayores enemigos de la inversión a largo plazo. — John Bogle\nLa inversión superior comienza pensando de manera diferente y más profunda que otros. — Howard Marks\nEl riesgo no es la volatilidad sino la posibilidad de pérdida permanente. — Howard Marks\nNo puedes eliminar el riesgo, pero puedes gestionarlo. — Howard Marks\nCuanto mayor es el precio, menor es el margen de seguridad sobre los rendimientos futuros. — Howard Marks\nLos inversores que ignoran los ciclos se sorprenden repetidamente. — Howard Marks\nIncluso un gran activo se convierte en una mala inversión si se compra demasiado caro. — Howard Marks\nEn la inversión, la asimetría de ganancias y pérdidas importa más que la frecuencia de aciertos. — Howard Marks\nLa defensa debe prepararse antes de que llegue el mercado bajista. — Howard Marks\nCuanto mayor es el consenso, más hay que pensar de manera diferente. — Howard Marks\nLos beneficios surgen cuando entiendes la brecha entre precio y valor. — Howard Marks\nInvertir con éxito es jugar bien al juego de las probabilidades. — Howard Marks\nUn ambiente demasiado cómodo hace que el riesgo parezca barato. — Howard Marks\nLa psicología del mercado puede alejar los precios del valor. — Howard Marks\nInvertir de manera conservadora no es perder oportunidades — es aumentar las probabilidades de supervivencia. — Howard Marks\nLa gestión del riesgo es más necesaria cuando los rendimientos son buenos. — Howard Marks\nEl pensamiento de segundo nivel es la capacidad de interpretar lo que todos ven de manera diferente. — Howard Marks\nLas mejores compras rara vez llegan en los momentos más cómodos. — Howard Marks\nNo ver el riesgo es el mayor riesgo. — Howard Marks\nA medida que el mercado se acerca a los extremos, la cautela se vuelve más importante. — Howard Marks\nInvertir no es un juego de certeza sino de probabilidad. — Howard Marks\nEl momento de máximo pesimismo es el mejor momento para comprar. — John Templeton\nEl momento de máximo optimismo es el mejor momento para vender. — John Templeton\nLos mercados alcistas nacen en el pesimismo, crecen en el escepticismo y maduran en el optimismo. — John Templeton\nCuando la euforia domina el mercado, el mercado alcista se vuelve peligroso. — John Templeton\nLas mejores oportunidades se encuentran donde otros miran hacia otro lado. — John Templeton\nNecesitas valor para comprar cuando otros están vendiendo. — John Templeton\nCuatro de las palabras más peligrosas en la inversión son \'esta vez es diferente\'. — John Templeton\nDondequiera que haya valor barato en el mundo, deberías poder encontrarlo. — John Templeton\nEl pesimismo baja los precios, y los precios más bajos crean oportunidades. — John Templeton\nExamina con calma los activos que no le gustan a la multitud. — John Templeton\nSé optimista, pero mantén la cabeza fría sobre los precios. — John Templeton\nLas grandes oportunidades comienzan fuera de la atención de la multitud. — John Templeton\nLas peores noticias no siempre significan la peor inversión. — John Templeton\nSi el precio es suficientemente bajo, incluso la incertidumbre puede recompensarse. — John Templeton\nQuienes compran en el pesimismo deben estar listos para vender en el optimismo. — John Templeton\nLos mercados cometen sus mayores errores en los extremos de la emoción. — John Templeton\nLas oportunidades vienen más de lugares incómodos que cómodos. — John Templeton\nIr en contra de la multitud requiere tanto evidencia como valor. — John Templeton\nLos rendimientos a largo plazo pueden comenzar desde decisiones tomadas en el momento más impopular. — John Templeton\nEl inversor no es alguien que evita el miedo sino alguien que lo analiza. — John Templeton\nEl gran dinero vino no de acertar sino de resistir hasta el final. — Jesse Livermore\nEl mercado nunca se equivoca; las opiniones sí. — Jesse Livermore\nEl impulso de estar siempre haciendo algo crea muchas pérdidas. — Jesse Livermore\nLas pérdidas deben admitirse mientras son pequeñas. — Jesse Livermore\nSi la tendencia está viva, no hay razón para salir prematuramente. — Jesse Livermore\nTener razón pero no poder resistir significa que el gran dinero sigue fuera de alcance. — Jesse Livermore\nPensar que debes ganar dinero todos los días destruye a un trader. — Jesse Livermore\nAñadir a una posición perdedora es un hábito peligroso. — Jesse Livermore\nNo intentes discutir con el mercado — escúchalo. — Jesse Livermore\nEl ego frente al movimiento de precios se convierte en un costo. — Jesse Livermore\nLo que importa más que cuándo comprar es saber cuándo estás equivocado. — Jesse Livermore\nLas grandes tendencias recompensan a los que resisten. — Jesse Livermore\nIncluso el buen juicio puede colapsar por la liquidación impaciente. — Jesse Livermore\nLos mercados no se preocupan por las esperanzas individuales. — Jesse Livermore\nEl trading frecuente crea más errores que oportunidades. — Jesse Livermore\nEl gran dinero llega a quienes saben sentarse quietamente. — Jesse Livermore\nPara sobrevivir en la especulación, primero limita tus pérdidas. — Jesse Livermore\nNo ignores la dirección que está señalando el precio. — Jesse Livermore\nMás importante que la convicción es la capacidad de salir cuando estás equivocado. — Jesse Livermore\nLa autodisciplina en el trading es tan importante como la capacidad analítica. — Jesse Livermore\nLos mercados de valores se mueven por dinero y psicología. — André Kostolany\nEl dueño camina despacio, el perro corre de un lado a otro, pero llegan juntos. — André Kostolany\nUn inversor debe tener dinero, ideas y paciencia. — André Kostolany\nLo más caro en el mercado de valores es la impaciencia. — André Kostolany\nDa un paso atrás cuando la multitud se emociona. — André Kostolany\nUn buen inversor lee el estado de ánimo del mercado pero no lo sigue. — André Kostolany\nLos precios se agitan por la psicología, pero el valor necesita tiempo. — André Kostolany\nInvertir necesita imaginación, pero necesita paciencia aún más. — André Kostolany\nCuando inviertes con dinero prestado, el tiempo se convierte en tu enemigo. — André Kostolany\nLas acciones transfieren dinero de las personas impacientes a las pacientes. — André Kostolany\nEsperar mejores resultados pensando como todos es poco realista. — André Kostolany\nLa psicología mueve el mercado antes que la lógica en muchos días. — André Kostolany\nInvertir sin esperar se acerca a la especulación. — André Kostolany\nLos inversores con prisa luchan por soportar los caprichos del mercado. — André Kostolany\nLas caídas son dolorosas, pero también son el lenguaje de la oportunidad. — André Kostolany\nMirar el mercado con demasiada frecuencia pone la emoción por delante del pensamiento. — André Kostolany\nLa paciencia es el capital oculto del inversor. — André Kostolany\nIncluso una buena idea puede fracasar sin suficiente tiempo. — André Kostolany\nEl inversor debe confiar en su propio juicio sobre los aplausos de la multitud. — André Kostolany\nQuienes sobreviven largo tiempo en los mercados aprenden en última instancia lo más. — André Kostolany\nEl dolor más la reflexión equivale al progreso. — Ray Dalio\nAdmitir lo que no sabes es el comienzo de la gestión del riesgo. — Ray Dalio\nMezclar activos con baja correlación puede hacer una cartera más estable. — Ray Dalio\nSin principios, las emociones toman las decisiones durante las crisis. — Ray Dalio\nLa capacidad de ver la realidad tal como es es el punto de partida para una buena toma de decisiones. — Ray Dalio\nLos inversores necesitan principios verificables, no mera convicción. — Ray Dalio\nLa diversificación no es ocultar la ignorancia — es reconocer la incertidumbre. — Ray Dalio\nSi no conoces tus debilidades, el mercado te las mostrará. — Ray Dalio\nUn buen sistema aplica el mismo estándar incluso en momentos emocionales. — Ray Dalio\nEntender el panorama general te hace menos sacudido por el ruido a corto plazo. — Ray Dalio\nLo que importa no es si tienes razón o no, sino cuánto ganas cuando tienes razón y cuánto pierdes cuando te equivocas. — George Soros\nLos mercados no solo reflejan la realidad — también la influyen. — George Soros\nLa capacidad de admitir rápidamente que estás equivocado es un arma poderosa. — George Soros\nLa supervivencia primero; las ganancias después. — George Soros\nA medida que crece la convicción, comprueba también el caso contrario. — George Soros\nLas ilusiones del mercado pueden persistir durante mucho tiempo. — George Soros\nLos buenos inversores corrigen sus errores rápidamente. — George Soros\nEl peligro no es equivocarse sino permanecer equivocado. — George Soros\nCuanto mayor es la oportunidad, más importante se vuelve la gestión de posiciones. — George Soros\nInvertir significa tomar decisiones con información imperfecta. — George Soros\nDefensa antes que ataque. — Paul Tudor Jones\nAñadir a una posición perdedora crea un peligro cada vez mayor. — Paul Tudor Jones\nPreserva el capital y la próxima oportunidad llegará. — Paul Tudor Jones\nNo intentes ser un héroe en el mercado. — Paul Tudor Jones\nLa capacidad de mantener las pérdidas pequeñas genera rendimiento a largo plazo. — Paul Tudor Jones\nCuando el precio se mueve en tu contra, reduce el riesgo primero. — Paul Tudor Jones\nEvitar grandes pérdidas viene antes que buscar grandes ganancias. — Paul Tudor Jones\nEl ego en el trading amplifica las pérdidas. — Paul Tudor Jones\nUna mentalidad defensiva no es debilidad — es una estrategia de supervivencia. — Paul Tudor Jones\nLa agresión sin gestión de pérdidas no dura. — Paul Tudor Jones\nCortar las pérdidas cuando son pequeñas es la regla. — William O\'Neil & Mark Minervini\nLas acciones fuertes son fuertes por una razón. — William O\'Neil & Mark Minervini\nNo luches contra la tendencia. — William O\'Neil & Mark Minervini\nLos gráficos pueden mostrar señales de peligro más rápido que las opiniones. — William O\'Neil & Mark Minervini\nPara capturar grandes ganadores, primero evita grandes perdedores. — William O\'Neil & Mark Minervini\nHacer trading sin reglas es solo un registro de emociones. — William O\'Neil & Mark Minervini\nEncuentra a los líderes del mercado pero limita el riesgo con números. — William O\'Neil & Mark Minervini\nLo que importa más que la entrada es lo que haces cuando estás equivocado. — William O\'Neil & Mark Minervini\nIncluso una buena entrada no puede superar malos hábitos de stop-loss. — William O\'Neil & Mark Minervini\nEn un mercado alcista, las acciones más fuertes pueden seguir fortaleciéndose. — William O\'Neil & Mark Minervini\nPoseer todo el mercado reduce la carga de la predicción. — Burton Malkiel\nNo intentes predecir movimientos a corto plazo que son casi aleatorios. — Burton Malkiel\nEl bajo costo y la amplia diversificación son áreas que los inversores pueden controlar. — Burton Malkiel\nLa inversión en índices a largo plazo no es glamorosa, pero es consistente. — Burton Malkiel\nLa participación simple a menudo supera la predicción compleja. — Burton Malkiel\nSubestima el promedio y puedes terminar por debajo de él. — Burton Malkiel\nEl market timing es tentador pero raramente exitoso. — Burton Malkiel\nLos inversores ganan primero reduciendo costos ciertos. — Burton Malkiel\nUna cartera diversificada es una respuesta realista a un futuro incierto. — Burton Malkiel\nUna estrategia simple se vuelve más poderosa cuando se puede mantener. — Burton Malkiel\nUna gran empresa tiene profundidad competitiva más allá de sus ingresos. — Philip Fisher\nAl evaluar acciones de crecimiento, mira la gestión y la oportunidad de mercado juntas. — Philip Fisher\nUna gran empresa revela su valor cuanto más tiempo la mantienes. — Philip Fisher\nPara entender una empresa, investiga cada voz a su alrededor. — Philip Fisher\nVender puede ser una decisión más difícil que comprar. — Philip Fisher\nLas empresas de crecimiento a largo plazo te dan razones para soportar la volatilidad a corto plazo. — Philip Fisher\nUna buena gestión crea valor que los números no muestran. — Philip Fisher\nMira tanto el potencial de crecimiento como el precio juntos. — Philip Fisher\nSi no entiendes la calidad de una empresa, el mantenimiento a largo plazo se vuelve inestable. — Philip Fisher\nUna gran empresa hace que el tiempo sea el amigo del inversor. — Philip Fisher\nEl margen de seguridad es el lenguaje del inversor para reconocer la incertidumbre. — Seth Klarman\nLa inversión en valor mira la brecha entre precio y valor, no la popularidad. — Seth Klarman\nEl riesgo puede crecer precisamente cuando otros sienten que no existe. — Seth Klarman\nLa paciencia es uno de los activos más importantes de un inversor en valor. — Seth Klarman\nIncluso un precio barato necesita una razón — verifícala. — Seth Klarman\nLa disciplina de evitar pérdidas es la base de los rendimientos a largo plazo. — Seth Klarman\nPuede necesitarse efectivo porque las buenas oportunidades no vienen a menudo. — Seth Klarman\nLos inversores deben confiar en su propio análisis, no en la popularidad del mercado. — Seth Klarman\nCuanto mayor es la brecha entre valor y precio, mayor es la oportunidad. — Seth Klarman\nLa convicción sin margen de seguridad es exceso de confianza peligroso. — Seth Klarman\nEl principio de comprar grandes empresas baratas es simple pero no fácil. — Joel Greenblatt\nCuando un negocio de alto rendimiento se encuentra con un precio bajo, se crea oportunidad. — Joel Greenblatt\nIncluso un principio simple falla si no puedes mantenerlo. — Joel Greenblatt\nLa inversión en valor parece aburrida pero necesita tiempo. — Joel Greenblatt\nLa irracionalidad a corto plazo del mercado crea oportunidades. — Joel Greenblatt\nUna buena estrategia debe ser difícil de seguir para todos para durar. — Joel Greenblatt\nCuando el precio está por debajo del valor, aparece la ventaja del inversor. — Joel Greenblatt\nMira tanto la calidad como el precio de la empresa juntos. — Joel Greenblatt\nA largo plazo, los números son más fuertes que las historias. — Joel Greenblatt\nLa inversión en valor es difícil de hacer sin paciencia. — Joel Greenblatt\nBusca situaciones donde cara ganas mucho y cruz pierdes poco. — Mohnish Pabrai\nLas ideas simples pueden generar grandes rendimientos. — Mohnish Pabrai\nUn buen inversor sabe cómo replicar los principios de grandes inversores. — Mohnish Pabrai\nLas mejores inversiones limitan la desventaja mientras dejan abierta la ventaja. — Mohnish Pabrai\nEspera oportunidades claras en lugar de complejas. — Mohnish Pabrai\nLos inversores necesitan menos decisiones pero mejores. — Mohnish Pabrai\nEnfócate en las oportunidades ciertas que vienen raramente. — Mohnish Pabrai\nCalcular primero la posibilidad de pérdida te ayuda a sobrevivir más tiempo. — Mohnish Pabrai\nUna buena inversión debe tener una explicación simple. — Mohnish Pabrai\nEsperar es parte de la inversión en valor. — Mohnish Pabrai\nViajar largo tiempo con una gran empresa puede ser la estrategia más poderosa. — Nick Sleep\nLos inversores deben ser propietarios, no traders. — Nick Sleep\nUna perspectiva a largo plazo es difícil de copiar para los competidores. — Nick Sleep\nUna buena cultura empresarial se capitaliza como el interés compuesto con el tiempo. — Nick Sleep\nUna empresa que piensa en sus clientes a largo plazo también puede recompensar a los inversores. — Nick Sleep\nLa verdadera inversión a largo plazo soporta el ruido de los resultados trimestrales. — Nick Sleep\nEl valor intrínseco de una gran empresa se construye lentamente pero poderosamente. — Nick Sleep\nUna mentalidad de propietario reduce el impulso de hacer trading. — Nick Sleep\nCuanto más tiempo mantienes, más importa la calidad de la empresa. — Nick Sleep\nEncontrar una empresa con la que viajar a largo plazo supera al trading frecuente. — Nick Sleep\nNo intentes atrapar un cuchillo que cae. — Sabiduría de Wall Street\n\'Compra el rumor, vende la noticia\' significa cuidado con la psicología de la multitud. — Sabiduría de Wall Street\nEn un mercado alcista, todos parecen inteligentes. — Sabiduría de Wall Street\nCorta las pérdidas rápido; deja correr los beneficios. — Sabiduría de Wall Street\nLos mercados son más fríos que la esperanza. — Sabiduría de Wall Street\nLa tendencia puede ser tu amiga, pero siempre termina en algún momento. — Sabiduría de Wall Street\nAprende primero cómo no perder dinero. — Sabiduría de Wall Street\nLa diversificación evita que un solo error sea fatal. — Sabiduría de Wall Street\nEl apalancamiento comprime el tiempo pero también comprime los errores. — Sabiduría de Wall Street\nEl mercado siempre está preparando la próxima lección. — Sabiduría de Wall Street\nLas grandes oportunidades de inversión no vienen a menudo — estate listo cuando lo hagan. — Warren Buffett\nSi no estás dispuesto a mantener una acción a largo plazo, piénsatelo dos veces antes de comprarla a corto plazo. — Warren Buffett\nLa etiqueta de precio de una empresa cambia diariamente, pero sus fundamentos no. — Warren Buffett\nLa capacidad de entender un negocio es un arma más fuerte que las previsiones complejas. — Warren Buffett\nUna gran empresa reduce los errores del inversor con el tiempo. — Warren Buffett\nEl miedo público se convierte en una etiqueta de precio con descuento para el inversor preparado. — Warren Buffett\nLa paciencia esperando oportunidades ciertas supera intentar atrapar cada una. — Warren Buffett\nInvertir exige acción racional, no acción brillante. — Warren Buffett\nBusca negocios que puedan ganar a largo plazo, no solo acciones que parezcan baratas. — Warren Buffett\nMantener una gran empresa a largo plazo es tedioso — y ese tedio se convierte en el resultado. — Warren Buffett\nLa mayor ventaja en la inversión es admitir lo que no sabes. — Charlie Munger\nUna vez que encuentras un gran negocio, reducir la acción innecesaria ayuda. — Charlie Munger\nLa paciencia combinada con el conocimiento se convierte en una poderosa herramienta de inversión. — Charlie Munger\nMuchos errores provienen de no ver la complejidad como simplicidad. — Charlie Munger\nLos inversores deben considerar primero por qué podrían estar equivocados. — Charlie Munger\nLos mejores inversores pueden no ser los que hacen trading diariamente sino los que esperan largo tiempo. — Charlie Munger\nInvertir muestra los caminos a evitar primero. — Charlie Munger\nAprender de los errores de otros es la matrícula más barata. — Charlie Munger\nEl interés compuesto se fortalece cuando una gran empresa se encuentra con un largo horizonte temporal. — Charlie Munger\nEl buen temperamento supera a la alta inteligencia en los resultados de inversión. — Charlie Munger\nNo conocer la brecha entre valor y precio arrastra a los inversores con los estados de ánimo del mercado. — Benjamin Graham\nEl mercado ofrece oportunidades cada día, pero no necesitas seguirlas cada día. — Benjamin Graham\nEl inversor debe ser el amo del mercado, no su sirviente. — Benjamin Graham\nEl margen de seguridad es un seguro contra no conocer el futuro. — Benjamin Graham\nUna caída de precio no siempre significa más peligro — pagar demasiado es el verdadero riesgo. — Benjamin Graham\nLa convicción sin análisis convierte a los inversores en especuladores. — Benjamin Graham\nLas fluctuaciones de precios ponen a prueba las emociones del inversor; el valor exige su razón. — Benjamin Graham\nLos precios de mercado son hechos, pero no siempre son la verdad. — Benjamin Graham\nComprar suficientemente barato es una protección más realista que la predicción perfecta del futuro. — Benjamin Graham\nEl inversor inteligente encuentra el margen de seguridad antes que la popularidad. — Benjamin Graham\nAntes de comprar una acción, sé capaz de explicar cómo esa empresa gana dinero. — Peter Lynch\nLas buenas ideas de inversión pueden estar más cerca de la vida diaria de lo que piensas. — Peter Lynch\nComprueba si la historia de la empresa sigue siendo válida, no solo el precio de la acción. — Peter Lynch\nSi no estás preparado para soportar caídas, te costará disfrutar las ganancias. — Peter Lynch\nConoce los beneficios y perspectivas de la empresa, no solo su nombre. — Peter Lynch\nGasta tiempo investigando empresas en lugar de intentar predecir el mercado. — Peter Lynch\nConstruye una estructura para que uno o dos fracasos no destruyan toda la cartera. — Peter Lynch\nLas acciones ganadoras necesitan tiempo; las perdedoras necesitan revisión. — Peter Lynch\nComprar una empresa que no entiendes es encargar tu dinero a la historia de otra persona. — Peter Lynch\nLas acciones requieren comprobar tanto los números como la historia. — Peter Lynch\nObtener consistentemente rendimientos de mercado ordinarios no es nada ordinario. — John Bogle\nLos inversores no necesitan predicciones complejas para obtener los rendimientos de todo el mercado. — John Bogle\nEl bajo costo se pone más del lado del inversor con el tiempo. — John Bogle\nNo hacer nada parece fácil pero es en realidad la estrategia más difícil. — John Bogle\nEl poder de la inversión en índices radica en reducir las elecciones innecesarias, no en la selección genial. — John Bogle\nLos inversores a largo plazo miran décadas de interés compuesto, no las noticias de un día. — John Bogle\nLa base de la inversión no es acertar más — es construir una estructura que gotee menos. — John Bogle\nReducir costos, impuestos y emociones puede mejorar el rendimiento a largo plazo. — John Bogle\nEl tiempo en el mercado supera al timing del mercado. — John Bogle\nUna cartera simple es más fácil de proteger incluso en una crisis. — John Bogle\nUn buen inversor pregunta no solo qué comprar, sino a qué precio. — Howard Marks\nCuando todos son optimistas, duda del precio más que de las buenas noticias. — Howard Marks\nCuando todos tienen miedo, reexamina el precio en lugar de las malas noticias. — Howard Marks\nEl riesgo es más peligroso cuando no se puede ver. — Howard Marks\nLos inversores no predicen el futuro — hacen que las probabilidades sean favorables. — Howard Marks\nAl final de un ciclo, la psicología empuja los precios por delante de la lógica. — Howard Marks\nGestiona bien el riesgo y la oportunidad de beneficiarse vuelve a llegar. — Howard Marks\nPensar igual que todos hace más difícil obtener resultados diferentes. — Howard Marks\nLas mejores oportunidades de compra suelen venir junto con las noticias más incómodas. — Howard Marks\nEl inversor de éxito valora la incertidumbre, no la certeza. — Howard Marks\nIncluso en medio de la desesperación, si el precio es suficientemente bajo, existe la oportunidad. — John Templeton\nUn mercado que a todos les gusta puede ya tener demasiada expectativa en el precio. — John Templeton\nEl pesimismo ciega a los inversores, pero para los inversores en valor puede ser un mapa. — John Templeton\nLos mayores descuentos aparecen donde la multitud ha tirado las cosas. — John Templeton\nCuando los mercados celebran, calcula el riesgo antes que las ganancias. — John Templeton\nEl mercado más impopular puede a veces ser el mejor punto de partida. — John Templeton\nEl pesimismo extremo puede empujar los precios aún más por debajo del valor. — John Templeton\nHay oportunidades en todas partes; la visión de la multitud siempre es limitada. — John Templeton\nComprar con miedo exige no solo valor sino análisis. — John Templeton\nAl final del optimismo, busca margen de seguridad sobre expectativa. — John Templeton\nCuando empiezas a luchar contra el mercado, las pérdidas se convierten en el costo del ego. — Jesse Livermore\nCuando las señales dicen que estás equivocado, sal antes de que lo haga el orgullo. — Jesse Livermore\nTener razón en una gran tendencia pero salir demasiado pronto deja el gran dinero atrás. — Jesse Livermore\nEl deseo de hacer trading todos los días engaña a los traders haciéndoles creer que el mercado es su sueldo. — Jesse Livermore\nCuando el precio no está de tu lado, reduce el riesgo antes de buscar razones. — Jesse Livermore\nEn la especulación, la esperanza no es un plan. — Jesse Livermore\nLimpia una mala posición mientras es pequeña para ver la próxima oportunidad. — Jesse Livermore\nLos mercados pueden moverse más tiempo que la convicción de cualquier individuo. — Jesse Livermore\nTanto la capacidad de quedarse quieto como la de salir son necesarias. — Jesse Livermore\nSigue la tendencia pero limita tus pérdidas. — Jesse Livermore\nLos precios de las acciones a veces reflejan la psicología antes que la economía. — André Kostolany\nEl dinero sin paciencia lucha por sobrevivir en los mercados. — André Kostolany\nLas multitudes suelen emocionarse tarde y tener miedo tarde. — André Kostolany\nEl perro del mercado corre adelante pero siempre regresa a su dueño. — André Kostolany\nIncluso una buena idea no puede convertirse en una buena inversión sin tiempo. — André Kostolany\nLa deuda roba la paciencia del inversor. — André Kostolany\nEn los mercados, lo que necesitas antes que el dinero es tiempo para resistir. — André Kostolany\nLas emociones de la multitud sacuden los precios pero no pueden dominar para siempre. — André Kostolany\nEl inversor debe ser alguien que no pierde la dirección en el ruido. — André Kostolany\nEl mercado de valores exige tanto una calculadora como un libro de psicología. — André Kostolany\nLa diversificación comienza desde la humildad, no desde la convicción. — Ray Dalio\nLos buenos principios son más necesarios en los días malos que en los buenos. — Ray Dalio\nConocer tus debilidades hace tu cartera más realista. — Ray Dalio\nEn un mundo incierto, no apuestes todo a un solo resultado. — Ray Dalio\nIncluso las pérdidas dolorosas, si se revisan correctamente, se convierten en material para el próximo juicio. — Ray Dalio\nAntes que el mercado, sabe qué tipo de persona eres. — Ray Dalio\nMezclar diferentes riesgos es la habilidad de resistir a largo plazo. — Ray Dalio\nLa inversión que niega la realidad eventualmente será corregida por ella. — Ray Dalio\nLa buena toma de decisiones depende de principios y retroalimentación, no de emociones. — Ray Dalio\nLos inversores a menudo necesitan diseñar equilibrio en lugar de convicción. — Ray Dalio\nCorregir un juicio erróneo rápidamente puede terminar la pérdida como matrícula. — George Soros\nEntender las ilusiones del mercado te permite ver la oportunidad y el peligro a la vez. — George Soros\nEl tamaño de la posición es tan importante como la convicción. — George Soros\nLa estructura de ganar mucho cuando tienes razón y perder poco cuando te equivocas importa. — George Soros\nInvertir exige capacidad de corrección de errores sobre predicción perfecta. — George Soros\nLos inversores supervivientes saben cómo cambiar su mente. — George Soros\nLos mercados pueden agitarse aún más por las creencias de los participantes. — George Soros\nIncluso la fuerte convicción es peligrosa sin reglas de limitación de pérdidas. — George Soros\nEl momento en que te das cuenta de que estás equivocado es el momento más importante. — George Soros\nLas oportunidades del mercado suelen aparecer dentro de información imperfecta. — George Soros\nSolo quienes preservan el capital pueden capturar la próxima tendencia. — Paul Tudor Jones\nAdmitir las pérdidas mientras son pequeñas es el hábito del profesional. — Paul Tudor Jones\nReducir el riesgo no es miedo — es estrategia. — Paul Tudor Jones\nTen un plan de limitación de pérdidas listo antes que una razón para comprar. — Paul Tudor Jones\nLos mercados no recompensan el ego. — Paul Tudor Jones\nLos buenos traders sobreviven primero, luego ganan. — Paul Tudor Jones\nLos inversores que defienden bien no pierden su oportunidad de atacar. — Paul Tudor Jones\nMantener una posición errónea durante mucho tiempo es terquedad, no análisis. — Paul Tudor Jones\nControlar el riesgo significa también controlar tu mente. — Paul Tudor Jones\nEvitar grandes pérdidas es el punto de partida del interés compuesto. — Paul Tudor Jones\nLos líderes del mercado a menudo muestran fuerza primero después de un mercado bajista. — William O\'Neil & Mark Minervini\nLas reglas de stop-loss deben establecerse con números, no con emociones. — William O\'Neil & Mark Minervini\nIgnorar la tendencia puede convertir el buen análisis en pérdidas. — William O\'Neil & Mark Minervini\nNo desestimes las acciones fuertes solo porque parecen caras. — William O\'Neil & Mark Minervini\nNo te aferres a las acciones débiles solo porque parecen baratas. — William O\'Neil & Mark Minervini\nLos buenos trades no vienen de insistir en que el mercado está equivocado. — William O\'Neil & Mark Minervini\nLa relación riesgo-recompensa y los límites de pérdidas pueden importar más que la tasa de aciertos. — William O\'Neil & Mark Minervini\nLos gráficos no garantizan el futuro, pero pueden dar señales de advertencia. — William O\'Neil & Mark Minervini\nLas fuertes subidas tienen razones; los rebotes débiles tienen límites. — William O\'Neil & Mark Minervini\nLos inversores que siguen las reglas se sacuden menos en los mercados emocionales. — William O\'Neil & Mark Minervini\nPoseer todo el mercado reduce la carga de la predicción. — Burton Malkiel\nNo te esfuerces en predecir movimientos a corto plazo que son casi aleatorios. — Burton Malkiel\nEl bajo costo y la amplia diversificación son los dominios que el inversor realmente controla. — Burton Malkiel\nLa inversión en índices a largo plazo no es glamorosa, pero es consistente. — Burton Malkiel\nLa participación simple a menudo supera la predicción compleja. — Burton Malkiel\nSubestima el promedio y puedes terminar por debajo de él. — Burton Malkiel\nLa tentación del market timing es grande, pero la tasa de éxito es baja. — Burton Malkiel\nLos inversores ganan primero reduciendo costos ciertos. — Burton Malkiel\nUna cartera diversificada es una respuesta realista a un futuro incierto. — Burton Malkiel\nUna estrategia simple se vuelve más fuerte cuando se puede mantener a largo plazo. — Burton Malkiel\nLas grandes empresas tienen profundidad competitiva más allá de sus ingresos. — Philip Fisher\nAl evaluar empresas de crecimiento, mira a las personas junto con los números. — Philip Fisher\nLa calidad de una empresa puede importar más que el precio de sus acciones a medida que pasa el tiempo. — Philip Fisher\nUna buena gestión es más visible en tiempos difíciles. — Philip Fisher\nPara las acciones de crecimiento a largo plazo, la dirección a largo plazo importa más que la decepción a corto plazo. — Philip Fisher\nLa investigación profunda construye convicción, y la convicción construye paciencia. — Philip Fisher\nVender una gran empresa demasiado pronto es un error común. — Philip Fisher\nCentrarse solo en el crecimiento mientras se ignora el precio puede convertir una gran empresa en una mala inversión. — Philip Fisher\nLa cultura empresarial y la capacidad de I+D pueden ser semillas del crecimiento a largo plazo. — Philip Fisher\nUna vez que encuentras una gran empresa, mira la competitividad a largo plazo sobre los movimientos a corto plazo. — Philip Fisher\nLos inversores en valor deben encontrar comodidad en precios impopulares. — Seth Klarman\nEl margen de seguridad expresa la humildad del inversor en números. — Seth Klarman\nEl efectivo no es un activo inactivo — es opcionalidad. — Seth Klarman\nLos inversores que ven primero el riesgo a la baja pueden esperar más tiempo para la oportunidad al alza. — Seth Klarman\nLos activos baratos tienen razones — distingue el valor de las trampas. — Seth Klarman\nEl valor puede acumularse silenciosamente donde el mercado ignora. — Seth Klarman\nEsperar cuando no hay oportunidades ciertas también es una decisión de inversión. — Seth Klarman\nEvitar pérdidas no es timidez — es cómo preservas el interés compuesto. — Seth Klarman\nCuanto mejor sea el ambiente, más margen de seguridad se necesita. — Seth Klarman\nUna buena inversión debe llevar su defensa desde el momento de la compra. — Seth Klarman\nQue los mercados sean irracionales a corto plazo crea oportunidades a largo plazo. — Joel Greenblatt\nEl principio de comprar grandes empresas baratas es simple pero difícil de practicar. — Joel Greenblatt\nLas estrategias de inversión en valor deben soportar tramos tediosos para ser recompensadas. — Joel Greenblatt\nComprar negocios de alta calidad a precios bajos es el núcleo. — Joel Greenblatt\nIncluso una buena estrategia necesita tramos dolorosos suficientes para que la gente se rinda — eso es lo que la hace durar. — Joel Greenblatt\nMirar precio y calidad juntos reduce la posibilidad de errores. — Joel Greenblatt\nLos mercados ocasionalmente ponen el precio equivocado a una gran empresa. — Joel Greenblatt\nLa disciplina que no se sacude por los resultados a corto plazo completa la estrategia. — Joel Greenblatt\nUna empresa barata y buena supera a una simplemente barata. — Joel Greenblatt\nMás importante que la fórmula es la determinación de seguirla. — Joel Greenblatt\nEncuentra estructuras donde la desventaja es pequeña y la ventaja es grande. — Mohnish Pabrai\nLas buenas ideas de inversión deben ser fáciles de entender para resistir largo tiempo. — Mohnish Pabrai\nEsperar no es tiempo sin oportunidad — es tiempo para seleccionar oportunidad. — Mohnish Pabrai\nReplicar principios probados también es una gran habilidad inversora. — Mohnish Pabrai\nEl atractivo de la inversión en valor es una estructura que pierde poco y gana mucho. — Mohnish Pabrai\nLas inversiones complejas tienen más lugares donde pueden salir mal. — Mohnish Pabrai\nLos inversores necesitan unas pocas buenas ideas, no muchas. — Mohnish Pabrai\nIncluso con incertidumbre, un precio suficientemente bajo puede crear oportunidad. — Mohnish Pabrai\nLas grandes oportunidades no vienen a menudo — ten paciencia en el ínterin. — Mohnish Pabrai\nLa simplicidad en la inversión es una fortaleza, no una debilidad. — Mohnish Pabrai\nLa verdadera inversión a largo plazo es pasar tiempo junto al negocio. — Nick Sleep\nUna gran empresa puede crear valor tanto para clientes como para inversores a medida que pasa el tiempo. — Nick Sleep\nReducir la frecuencia de trading aclara la perspectiva de propiedad. — Nick Sleep\nLa buena cultura empresarial aparece más tarde que los estados financieros, pero dura más. — Nick Sleep\nMantener a largo plazo no es solo mantener cualquier empresa durante mucho tiempo. — Nick Sleep\nSi la dirección de la empresa es correcta, los movimientos a corto plazo están cerca del ruido. — Nick Sleep\nLas empresas con las que vale la pena viajar a largo plazo dan pistas en cómo tratan a sus clientes. — Nick Sleep\nLas grandes empresas amplían sus opciones a medida que pasa el tiempo. — Nick Sleep\nEl trading a corto plazo te hace ver los precios; el mantenimiento a largo plazo te hace ver el negocio. — Nick Sleep\nLos inversores deben observar el valor acumulado del negocio, no solo su etiqueta de precio. — Nick Sleep\nLos mercados pueden sacudirse más tiempo que el que tú puedes resistir. — Sabiduría de Wall Street\nMás importante que comprar barato es comprar de manera que puedas mantener. — Sabiduría de Wall Street\nIncluso la mejor estrategia no es buena si no puedes mantenerla emocionalmente. — Sabiduría de Wall Street\nPara hacer crecer los beneficios, primero asegúrate de que las pérdidas no arruinen la cuenta. — Sabiduría de Wall Street\nEl ruido del mercado es alto, pero proteger la cuenta es un principio silencioso. — Sabiduría de Wall Street\nEl efectivo es frustración para el impaciente y oportunidad para el preparado. — Sabiduría de Wall Street\nCuando todos miran en la misma dirección, comprueba el peligro del otro lado. — Sabiduría de Wall Street\nEl apalancamiento puede hacerte daño si aciertas la dirección pero te equivocas en el momento. — Sabiduría de Wall Street\nLa diversificación puede reducir los grandes aciertos pero también reduce la posibilidad de ruina. — Sabiduría de Wall Street\nLos mercados bajistas ponen a prueba la mente del inversor antes que la cartera. — Sabiduría de Wall Street\nCuanto más urgente sea la noticia, más despacio debes hacer el pedido. — Sabiduría de Wall Street\nQuienes mantienen su cuenta durante más tiempo verán el próximo mercado alcista. — Sabiduría de Wall Street\nLos beneficios son posibilidad; limitar las pérdidas es responsabilidad. — Sabiduría de Wall Street\nAntes de comprar, escribe el peor caso antes que el rendimiento esperado. — Sabiduría de Wall Street\nLa probabilidad encaja mejor en la inversión que la certeza. — Sabiduría de Wall Street';

  @override
  String get intelligentInvestorBookTitle =>
      'Mi visión de la inversión inteligente';

  @override
  String get longFormBookTitle => 'Memorias de un operador de bolsa';

  @override
  String get intelligentInvestorCh1Title => 'Cap1. Inversión vs. Especulación';

  @override
  String get intelligentInvestorCh2Title =>
      'Cap2. Por qué la mayoría de los inversores fracasan';

  @override
  String get intelligentInvestorCh3Title => 'Cap3. El mercado';

  @override
  String get intelligentInvestorCh4Title => 'Cap4. Margen de seguridad';

  @override
  String get intelligentInvestorCh5Title =>
      'Cap5. Psicología de masas e inversión';

  @override
  String get intelligentInvestorCh6Title =>
      'Cap6. Por qué los mercados suben a largo plazo';

  @override
  String get intelligentInvestorCh7Title =>
      'Cap7. Lecciones de la burbuja puntocom';

  @override
  String get intelligentInvestorCh8Title =>
      'Cap8. Lecciones de la crisis financiera';

  @override
  String get intelligentInvestorCh9Title =>
      'Cap9. Lecciones de la caída por COVID';

  @override
  String get intelligentInvestorCh10Title =>
      'Cap10. La revolución de la IA y el mercado actual';
}
