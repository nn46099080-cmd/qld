// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Alerta QLD';

  @override
  String get noBuyZone => 'Zona sem compra';

  @override
  String get tapToViewStrategy => 'Ver estratégia';

  @override
  String get buyNow => 'Comprar agora';

  @override
  String get buyingInProgress => 'Compra em andamento';

  @override
  String get hold => 'Manter';

  @override
  String get navHome => 'Início';

  @override
  String get navChart => 'Gráfico';

  @override
  String get navExchange => 'Câmbio';

  @override
  String get navFearGreed => 'Medo';

  @override
  String get fearGreedTitle => 'Medo e Ganância';

  @override
  String get fearGreedInlineLabel => 'CNN Medo e ganância';

  @override
  String get fearGreedSubtitle => 'Sentimento do mercado dos EUA da CNN';

  @override
  String get fearGreedUnavailable =>
      'Não foi possível carregar os dados de medo e ganância.';

  @override
  String get navAlert => 'Alertas';

  @override
  String get navStrategy => 'Estratégia';

  @override
  String get alertRecovery10 => 'QLD recuperou 10%';

  @override
  String get alertMarketOpen => 'O mercado dos EUA abriu';

  @override
  String get alertNewHigh => 'Novo máximo atingido';

  @override
  String get portfolio => 'Carteira';

  @override
  String get portfolioAssetInput => 'Ativos';

  @override
  String get portfolioClose => 'Fechar';

  @override
  String get exitAdDialogBack => 'Voltar';

  @override
  String get exitAdDialogExit => 'Sair';

  @override
  String get portfolioQldShares => 'Quantidade de QLD';

  @override
  String get portfolioTqqqShares => 'Quantidade de TQQQ';

  @override
  String get portfolioQldAveragePrice => 'Preço médio QLD';

  @override
  String get portfolioTqqqAveragePrice => 'Preço médio TQQQ';

  @override
  String get portfolioCashUsd => 'Caixa USD';

  @override
  String get portfolioTotal => 'Total';

  @override
  String get portfolioProfitLoss => 'Lucro/perda';

  @override
  String get portfolioSharesUnit => 'ações';

  @override
  String get portfolioReturnRate => 'Rentabilidade';

  @override
  String get portfolioAveragePriceShort => 'Preço médio';

  @override
  String get portfolioPriceLoading => 'carregando preço';

  @override
  String get portfolioToBreakeven => 'Para empatar';

  @override
  String get portfolioBreakevenCleared => 'Acima do ponto de equilíbrio';

  @override
  String get basePosition => 'Posição base';

  @override
  String get fromPreviousClose => 'vs fechamento anterior';

  @override
  String get from10yHigh => 'vs máxima histórica';

  @override
  String get holdQLDPlusCash => 'Manter QLD + 30% caixa';

  @override
  String get basePositionDescription =>
      '[ Guia da estratégia ]\n\nEsta estratégia não investe todos os ativos em QLD de uma só vez.\n\nNo início, apenas parte dos ativos é investida, enquanto o restante é mantido em caixa para enfrentar grandes quedas do mercado.\n\nO poder de manter caixa\n\nO caixa não é mantido para aumentar o retorno, mas para preservar a tranquilidade e a disciplina mesmo durante uma queda do mercado.\n\nMais importante do que obter o maior retorno possível é ter um sistema de investimento capaz de manter os juros compostos até o fim.\n\nExemplo:\n- Investir apenas 70% dos ativos iniciais em QLD\n- Manter os 30% restantes em caixa\n\nQLD é um ETF que acompanha aproximadamente 2 vezes o movimento diário do índice Nasdaq-100.\n\nPortanto, no estado inicial:\nalavancagem de 2x × investimento de 70% = exposição total aproximada de 1,4x.\n\nPor exemplo:\n- Nasdaq +1%\n→ Ativos totais em torno de +1,4%\n\nQuando ocorre uma grande queda, o caixa disponível é usado gradualmente para compras adicionais.\n\nExemplo:\n- Compra adicional perto da zona de -40% do QLD\n\nIsso permite acumular mais cotas a preços menores e reduzir significativamente o preço médio quando o mercado se recupera.\n\nComo resultado, esta estratégia pode gerar retornos maiores durante a recuperação do que uma estratégia simples de manter a posição.\n\nO núcleo desta estratégia é:\n- Reduzir a volatilidade com caixa durante mercados de alta\n- Usar o caixa para comprar mais durante grandes quedas e reduzir o preço médio.';

  @override
  String get basePositionIntro =>
      'Esta estratégia base não investe tudo de uma vez. Ela mantém QLD junto com caixa, reduz oscilações em mercados de alta e preserva espaço para comprar mais em grandes quedas.';

  @override
  String get basePositionQldAllocationLabel => 'Posição base em QLD';

  @override
  String get basePositionCashAllocationLabel => 'Reserva em caixa';

  @override
  String get basePositionCorePrinciple => 'Princípios centrais';

  @override
  String get basePositionCashTitle =>
      'Caixa não é dinheiro que apenas reduz retorno';

  @override
  String get basePositionCashText =>
      'É margem de segurança para manter disciplina em grandes quedas e comprar mais a preços menores.';

  @override
  String get basePositionInitialLeverageTitle =>
      'O movimento inicial é de cerca de 1,4x';

  @override
  String get basePositionInitialLeverageText =>
      'QLD acompanha aproximadamente 2 vezes o Nasdaq-100. Com apenas 70% dos ativos em QLD, o movimento total da carteira cai para cerca de 1,4x.';

  @override
  String get basePositionStepLeverageTitle =>
      'Nas quedas, a alavancagem sobe por etapas';

  @override
  String get basePositionStepLeverageText =>
      'Das zonas de -20% a -30%, adicionar TQQQ pode elevar o movimento total para cerca de 1,8x. Nas zonas de queda mais profundas, pode se aproximar de 2,3x.';

  @override
  String get basePositionLowAverageTitle =>
      'Quanto maior o medo, menor pode ficar o preço médio';

  @override
  String get basePositionLowAverageText =>
      'O app é estruturado para usar caixa e comprar TQQQ gradualmente conforme a queda se aprofunda. Aumentar a quantidade em zonas baixas pode fortalecer o retorno no rebote posterior.';

  @override
  String get basePositionSummaryTitle => 'Resumo';

  @override
  String get basePositionSummaryText =>
      'O objetivo não é acertar o maior retorno. É manter um plano durante as quedas e permitir que os juros compostos continuem por mais tempo.';

  @override
  String get buySignalMessage => 'Os sinais de compra aparecerão aqui.';

  @override
  String get checkStrategyCard =>
      'Consulte o cartão de estratégia da sua zona atual.';

  @override
  String get currentPrice => 'Preço atual';

  @override
  String get futuresLabel => 'Fora do horário';

  @override
  String get tenYearHigh => 'Máxima histórica';

  @override
  String get buyStrategy => 'Estratégia de compra';

  @override
  String get noBuyZoneTitle => 'Zona sem compra';

  @override
  String get strategyOverview => 'Visão geral';

  @override
  String get corePrinciple => 'Princípio central';

  @override
  String get suggestedAllocation => 'Alocação sugerida';

  @override
  String get riskManagement => 'Gestão de risco';

  @override
  String get actionGuide => 'Guia de ação';

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
  String get minus20Title => '-20% Estratégia';

  @override
  String get minus20Headline =>
      'Iniciar acúmulo semanal de TQQQ com 1% do caixa total';

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
  String get minus30Title => '-30% Estratégia';

  @override
  String get minus30Headline => 'Comprar TQQQ com 20% do caixa';

  @override
  String get minus30OverviewTitle => 'Strategy Overview';

  @override
  String get minus30OverviewText =>
      'This zone represents a high-opportunity accumulation phase.\n\nHistorically, Nasdaq corrections around -30% have often provided strong long-term buying opportunities.\n\nAlthough fear and volatility increase significantly at this stage, disciplined dollar-cost averaging can improve long-term returns.';

  @override
  String get minus30AllocationTitle => 'Suggested Allocation';

  @override
  String get minus30AllocationText =>
      '• Use aproximadamente 20% do caixa disponível\n• Continue a acumulação gradual\n• Evite usar todo o capital rápido demais\n• Mantenha flexibilidade para quedas mais profundas';

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
  String get minus40Title => '-40% Estratégia';

  @override
  String get minus40Headline => 'Usar 30% caixa - entrada TQQQ';

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
  String get minus50Title => '-50% Estratégia';

  @override
  String get minus50Headline => 'Comprar TQQQ com todo o caixa restante';

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
  String get exchangeUsdJpy => 'Dólar/Iene';

  @override
  String get exchangeEurUsd => 'Euro/Dólar';

  @override
  String get exchangeUsdRub => 'Dólar/Rublo';

  @override
  String get exchangeUsdTwd => 'Dólar/Dólar taiwanês';

  @override
  String get exchangeUsdCny => 'Dólar/Yuan';

  @override
  String get fearGreedExtremeFear => 'Medo extremo';

  @override
  String get fearGreedFear => 'Medo';

  @override
  String get fearGreedNeutral => 'Neutro';

  @override
  String get fearGreedGreed => 'Ganância';

  @override
  String get fearGreedExtremeGreed => 'Ganância extrema';

  @override
  String get fearGreedIndicatorsTitle => '7 indicadores de medo e ganância';

  @override
  String get fearGreedFaqTitle => 'Perguntas sobre o índice de medo e ganância';

  @override
  String get fearGreedWhatTitle =>
      'O que é o índice de medo e ganância da CNN?';

  @override
  String get fearGreedWhatBody =>
      'O índice mede o sentimento do mercado acionário e se as ações podem estar justamente precificadas. Medo excessivo tende a pressionar preços para baixo, enquanto ganância excessiva pode elevá-los.';

  @override
  String get fearGreedCalculatedTitle => 'Como ele é calculado?';

  @override
  String get fearGreedCalculatedBody =>
      'Ele combina sete indicadores: momentum do mercado, força dos preços, amplitude, opções put/call, demanda por junk bonds, volatilidade e demanda por ativos de segurança. Todos têm peso igual em uma escala de 0 a 100.';

  @override
  String get fearGreedFrequencyTitle => 'Com que frequência é atualizado?';

  @override
  String get fearGreedFrequencyBody =>
      'Cada componente e o índice geral são atualizados quando novos dados de mercado ficam disponíveis.';

  @override
  String get fearGreedUseTitle => 'Como devo usar?';

  @override
  String get fearGreedUseBody =>
      'Use como uma leitura do humor do mercado. Ele ajuda a perceber extremos emocionais, mas as decisões devem considerar preço, fundamentos, controle de risco e sua própria estratégia.';

  @override
  String get strategyAdLabel => 'Anúncio';

  @override
  String get alertSettingsTitle => 'Configurações de alerta';

  @override
  String get alertSettingsCloseBasisNote =>
      'Os alertas são enviados com base no preço de fechamento.';

  @override
  String get alertHighTitle => 'Alerta de nova máxima';

  @override
  String get alertHighSubtitle =>
      'Avisar quando uma nova máxima for atingida após a instalação';

  @override
  String get alertMarketOpenTitle => 'Alerta de abertura';

  @override
  String get alertMarketOpenSubtitle =>
      'Avisar uma vez ao dia quando o mercado regular dos EUA abrir';

  @override
  String get alertStrategySettingTitle => 'Alerta de estratégia';

  @override
  String get alertStrategySettingSubtitle =>
      'Avisar mudanças nas zonas -20%, -30%, -40% e -50%';

  @override
  String get noBuyHeadline => 'Não comprar mais. Manter 30% em caixa.';

  @override
  String get noBuyActionTitle => 'Ação imediata';

  @override
  String get noBuyActionText =>
      'Não compre novos QLD/TQQQ. Mantenha a posição atual em QLD e proteja 30% em caixa.';

  @override
  String get noBuyCashTitle => 'Regra de caixa';

  @override
  String get noBuyCashText =>
      'O caixa é reserva para a próxima zona de queda. Não reduza mesmo se o mercado subir.';

  @override
  String get noBuyAvoidTitle => 'Evitar';

  @override
  String get noBuyAvoidText =>
      'Não persiga preço só porque está subindo. Espere até a zona de -20%.';

  @override
  String get noBuyNextTitle => 'Próximo passo';

  @override
  String get noBuyNextText =>
      'Ao chegar a -20%, prepare compras fracionadas recorrentes de TQQQ.';

  @override
  String get minus20ActionTitle => 'Ação imediata';

  @override
  String get minus20ActionText =>
      'Compre TQQQ semanalmente com 1% do seu saldo em caixa.\nEx.) \$500 em caixa → compra \$5 por semana';

  @override
  String get minus20BuyRuleTitle => 'Objetivo';

  @override
  String get minus20BuyRuleText =>
      'Esta configuração começa na zona de -20% para que, se o mercado andar de lado, pequenas compras recorrentes reduzam gradualmente o preço médio de TQQQ. O objetivo não é acertar lucro imediato, mas construir uma base de custo menor.';

  @override
  String get minus20CashTitle => 'Gestão de caixa';

  @override
  String get minus20CashText =>
      'A maior parte do caixa deve ficar disponível para as zonas -30%, -40% e -50%. Mesmo após usar todo o caixa planejado em -50%, novo caixa pode continuar reduzindo o preço médio com acúmulo semanal.\n\nMesmo que o mercado fique de lado por 10 semanas ou mais, continue acumulando 1% do caixa total toda semana. Quanto mais dura o movimento lateral, mais cotas você acumula — não há motivo para parar.\n\nQuando a zona -30% for atingida, faça uma compra adicional única usando 20% do caixa restante naquele momento. O acúmulo semanal não para — continua junto com a estratégia -30%. O acúmulo termina somente quando a máxima anterior for recuperada e o rebalanceamento for realizado.';

  @override
  String get minus20AvoidTitle => 'Plano de saída';

  @override
  String get minus20AvoidText =>
      'Não venda essas cotas de TQQQ a cada repique curto. Trate-as como parte da posição a encerrar depois, quando houver nova máxima e a posição em TQQQ for reduzida.';

  @override
  String get minus30ActionTitle => 'Ação imediata';

  @override
  String get minus30ActionText =>
      'Use apenas 20% do caixa disponível para comprar TQQQ. Verifique o caixa total antes da ordem.';

  @override
  String get minus30BuyRuleTitle => 'Regra de compra';

  @override
  String get minus30BuyRuleText =>
      'Se o caixa for \$10,000, use apenas \$2,000 em TQQQ e preserve os 80% restantes.';

  @override
  String get minus30AdditionalTitle => 'Ação adicional';

  @override
  String get minus30AdditionalText =>
      'A acumulação de QLD pode continuar, mas espere a próxima zona para comprar mais TQQQ.';

  @override
  String get minus30AvoidTitle => 'Evitar';

  @override
  String get minus30AvoidText =>
      'Não gaste muito caixa esperando recuperação. Aja como se a zona -40% ainda pudesse chegar.';

  @override
  String get minus40ActionTitle => 'Ação imediata';

  @override
  String get minus40ActionText =>
      'Use 30% do caixa restante para comprar TQQQ. Exclua o valor já usado em -30%.';

  @override
  String get minus40BuyRuleTitle => 'Regra de compra';

  @override
  String get minus40BuyRuleText =>
      'Se o caixa restante for \$8,000, use apenas \$2,400. O ponto principal é não usar tudo de uma vez.';

  @override
  String get minus40HoldTitle => 'Regra de manutenção';

  @override
  String get minus40HoldText =>
      'Mantenha QLD e aumente TQQQ apenas até o valor planejado. Deixe caixa para nova queda.';

  @override
  String get minus40AvoidTitle => 'Evitar';

  @override
  String get minus40AvoidText =>
      'Não venda posições por medo. Também não compre com todo o caixa por ganância.';

  @override
  String get minus50ActionTitle => 'Ação imediata';

  @override
  String get minus50ActionText =>
      'Use todo o caixa restante para comprar TQQQ. Esta é a etapa final planejada de uso de caixa.';

  @override
  String get minus50BuyRuleTitle => 'Regra de compra';

  @override
  String get minus50BuyRuleText =>
      'Use como base apenas o caixa real restante, excluindo o que já foi usado em -30% e -40%.';

  @override
  String get minus50AfterTitle => 'Depois';

  @override
  String get minus50AfterText =>
      'Quando entrar novo caixa, acumule TQQQ ou QLD regularmente e foque em reduzir o preço médio.';

  @override
  String get minus50AvoidTitle => 'Evitar';

  @override
  String get minus50AvoidText =>
      'Não desista apenas por causa da perda. Não use dívida nem dinheiro de curto prazo para comprar mais.';

  @override
  String get alertNasdaq200Title => 'Alerta média 200 dias Nasdaq 100';

  @override
  String get alertNasdaq200Subtitle =>
      'Avisar quando o Nasdaq 100 romper abaixo ou acima da média de 200 dias';

  @override
  String get alertNasdaq200Breakdown =>
      'O Nasdaq 100 rompeu abaixo da média móvel de 200 dias';

  @override
  String get alertNasdaq200Breakout =>
      'O Nasdaq 100 voltou a romper acima da média móvel de 200 dias';

  @override
  String get chartGuideTitle => 'Como ler este gráfico';

  @override
  String get chartMiniTitle => 'Gráfico de 3 meses com médias de 20 e 200 dias';

  @override
  String get chartGuideCandleTitle => 'Candles de 3 meses';

  @override
  String get chartGuideCandleBody =>
      'Mostra rapidamente o movimento recente do QLD. Verde indica fechamento em alta; vermelho indica fechamento em baixa.';

  @override
  String get chartGuideMa200Title => 'Linha de 200 dias';

  @override
  String get chartGuideMa200Body =>
      'Referência de tendência de longo prazo. Acima sugere força; abaixo pede revisão de risco e caixa.';

  @override
  String get chartMa200SheetTitle => 'O que é a média móvel de 200 dias?';

  @override
  String get chartMa200SheetBody =>
      'A média móvel de 200 dias é uma linha de tendência de longo prazo calculada pela média dos preços de fechamento de aproximadamente os últimos 200 pregões.\n\nMuitos investidores a acompanham porque ela reduz o ruído de curto prazo e facilita enxergar a direção principal do mercado. Preço acima da linha costuma indicar uma tendência de longo prazo mais saudável; abaixo dela pode sugerir perda de força ou necessidade de revisar o risco.\n\nEla não deve ser usada sozinha como sinal de compra ou venda. Em um ETF alavancado como QLD, use-a como referência junto com caixa, queda acumulada, preço médio e horizonte de investimento.';

  @override
  String get chartMa20SheetTitle => 'O que é a média móvel de 20 dias?';

  @override
  String get chartMa20SheetBody =>
      'A média móvel de 20 dias é uma linha de tendência de curto prazo calculada pela média dos fechamentos de aproximadamente os últimos 20 pregões.\n\nMuitos investidores a acompanham porque ela reage mais rápido que a linha de 200 dias e ajuda a enxergar o momentum recente. Preço acima dela pode sugerir força de curto prazo; quedas repetidas abaixo podem indicar enfraquecimento da tendência recente.\n\nNo QLD, a linha de 20 dias ajuda a ler velocidade e volatilidade de curto prazo, mas pode gerar muitos sinais falsos. Use junto com a linha de 200 dias, caixa disponível e zonas de compra planejadas.';

  @override
  String get alertPortfolioCashTitle => 'Alerta de rebalanceamento de caixa';

  @override
  String get alertPortfolioCashSubtitle =>
      'Avisar quando o caixa cair abaixo de 20% após altas';

  @override
  String get alertPortfolioCashHigh =>
      'O caixa está abaixo de 20%. Considere rebalancear para recompor caixa.';

  @override
  String get alertPortfolioCashLow =>
      'O caixa está abaixo de 20%. Considere rebalancear para recompor caixa.';

  @override
  String get alertAnnouncementTitle => 'Notificações de avisos';

  @override
  String get alertAnnouncementSubtitle =>
      'Receber avisos enviados pelo QLD DIP ALERT como notificações push';

  @override
  String get alertDetailTitle => 'Detalhes do alerta';

  @override
  String get alertDetailOpenStrategy => 'Ver estratégia';

  @override
  String get alertDetailRecovery =>
      'A zona de queda melhorou. Revise a carteira com calma e evite vender ou comprar por impulso.';

  @override
  String get alertDetailNewHigh =>
      'Uma nova máxima foi registrada após a instalação. Ela será a nova referência para calcular quedas futuras.';

  @override
  String get alertDetailMarketOpen =>
      'O mercado regular dos EUA abriu. Verifique preços e alertas apenas se planejava agir hoje.';

  @override
  String get alertDetailNasdaq200Breakdown =>
      'O Nasdaq 100 caiu abaixo da média móvel de 200 dias. Isso pode indicar tendência mais fraca; revise risco e caixa.';

  @override
  String get alertDetailNasdaq200Breakout =>
      'O Nasdaq 100 voltou acima da média móvel de 200 dias. Pode indicar melhora, mas siga sua estratégia.';

  @override
  String get alertDetailPortfolioCashHigh =>
      'O caixa está abaixo da referência de 20%. Isso geralmente significa que as ações subiram e a reserva de caixa ficou pequena. Considere vender parte da posição e rebalancear para o nível planejado de caixa.';

  @override
  String get alertDetailPortfolioCashLow =>
      'O caixa está abaixo da referência de 20%. Isso geralmente significa que as ações subiram e a reserva de caixa ficou pequena. Considere vender parte da posição e rebalancear para o nível planejado de caixa.';

  @override
  String get alertDetailOpenLink => 'Abrir link';

  @override
  String get appUpdateTitle => 'Atualização disponível';

  @override
  String get appUpdateMessage =>
      'Há uma nova versão disponível. Atualize para usar os recursos e correções mais recentes.';

  @override
  String get appUpdateLater => 'Depois';

  @override
  String get appUpdateNow => 'Atualizar';

  @override
  String get alertTestTitle => 'Teste de notificação';

  @override
  String get alertPermissionHelpTitle => 'Não recebe notificações?';

  @override
  String get alertPermissionHelpBody =>
      'Se a permissão de notificações do dispositivo estiver desativada, as notificações de teste podem não aparecer.';

  @override
  String get alertPermissionRequest => 'Solicitar permissão';

  @override
  String get alertPermissionOpenSettings => 'Abrir configurações';

  @override
  String get holdPageTitle => 'Manter posição';

  @override
  String get holdHeadline =>
      'A compra planejada foi executada. Durante a recuperação, concentre-se em manter a posição.';

  @override
  String get holdPositionTitle => 'Posição atual';

  @override
  String get holdPositionText =>
      'Mantenha as posições de QLD e TQQQ já compradas. Não repita a compra de uma zona anterior apenas porque o preço voltou a uma zona recuperada.';

  @override
  String get holdActionTitle => 'Ação atual';

  @override
  String get holdActionText =>
      'Pause compras adicionais de TQQQ e acompanhe a recuperação. Preserve o caixa restante para uma nova queda.';

  @override
  String get holdAvoidTitle => 'Evitar';

  @override
  String get holdAvoidText =>
      'Não venda às pressas por causa da volatilidade nem compre por impulso por acreditar na recuperação.';

  @override
  String get holdResetTitle => 'Reinício da estratégia';

  @override
  String get holdResetText =>
      'Quando o QLD recuperar totalmente a máxima anterior, este ciclo de queda termina e a estratégia volta à posição inicial sem compras.';

  @override
  String get rebalanceTitle => 'Zona de rebalanceamento';

  @override
  String get rebalanceHeadline => 'Vender TQQQ e voltar à posição base';

  @override
  String get rebalanceOverviewTitle => 'Visão geral da estratégia';

  @override
  String get rebalanceOverviewText =>
      'A recuperação das máximas históricas sinaliza o fim da fase de resposta à crise. É hora de vender o TQQQ acumulado nas zonas de -20% ou abaixo e retornar à posição base (QLD 70%, Caixa 30%).';

  @override
  String get rebalanceActionTitle => 'Ação imediata';

  @override
  String get rebalanceActionText =>
      'Venda todo o TQQQ acumulado ou comprado nas zonas de -20% ou abaixo. Em seguida, rebalanceie seus ativos de acordo com a alocação da posição base.';

  @override
  String get rebalanceCashTitle => 'Meta de caixa';

  @override
  String get rebalanceCashText =>
      'Após o rebalanceamento, manter QLD 70% e Caixa 30%. Guardar o caixa assegurado como reserva para a próxima queda.';

  @override
  String get rebalanceAvoidTitle => 'O que evitar';

  @override
  String get rebalanceAvoidText =>
      'Não continue acumulando TQQQ após a recuperação das máximas históricas. Venda as posições acumuladas durante a fase de crise e retorne à posição base.';

  @override
  String get investmentCalculatorTitle => 'Calculadora de retorno esperado';

  @override
  String get investmentCalculatorSubtitle =>
      'Cálculo composto simples com base na média histórica do QLD';

  @override
  String get investmentCalculatorReturnRate => 'Retorno médio de 10 anos';

  @override
  String get investmentCalculatorLumpSumTitle =>
      'Aporte único + compra na queda';

  @override
  String get investmentCalculatorAmount => 'Valor investido';

  @override
  String get investmentCalculatorYears => 'Período';

  @override
  String get investmentCalculatorExpectedValue => 'Valor estimado';

  @override
  String get investmentCalculatorPrincipalMultiple => 'Múltiplo do principal';

  @override
  String get investmentCalculatorMonthlyTitle => 'Investimento recorrente';

  @override
  String get investmentCalculatorMonthlyAmount => 'Valor mensal';

  @override
  String get investmentCalculatorTotalPrincipal => 'Total aportado';

  @override
  String get investmentCalculatorExpectedProfit => 'Lucro estimado';

  @override
  String get investmentCalculatorDisclaimer =>
      'Este é um cálculo simples baseado em retornos passados e não garante retornos futuros.';

  @override
  String get investmentCalculatorYearsSuffix => 'a';

  @override
  String get investmentCalculatorTimesSuffix => 'x';

  @override
  String get investmentCalculatorChartHint =>
      'Você pode verificar o retorno médio pelo gráfico histórico.';

  @override
  String get investmentCalculatorCurrencySectionTitle => 'Conversão de moeda';

  @override
  String get investmentCalculatorCurrency => 'País/Moeda';

  @override
  String get investmentCalculatorExchangeRate => 'Câmbio de 1 USD';

  @override
  String get investmentCalculatorExchangeRateHint =>
      'Digite quanto vale 1 USD na moeda selecionada.';

  @override
  String get investmentCalculatorConvertedLumpSum =>
      'Valor final do investimento único';

  @override
  String get investmentCalculatorConvertedMonthly =>
      'Valor final do investimento recorrente';

  @override
  String get investmentCurrencyUnitedStatesUsd => 'Estados Unidos USD';

  @override
  String get investmentCurrencyKoreaKrw => 'Coreia KRW';

  @override
  String get investmentCurrencyJapanJpy => 'Japão JPY';

  @override
  String get investmentCurrencyChinaCny => 'China CNY';

  @override
  String get investmentCurrencyTaiwanTwd => 'Taiwan TWD';

  @override
  String get investmentCurrencyGermanyEur => 'Alemanha EUR';

  @override
  String get investmentCurrencyFranceEur => 'França EUR';

  @override
  String get investmentCurrencySpainEur => 'Espanha EUR';

  @override
  String get investmentCurrencyPortugalEur => 'Portugal EUR';

  @override
  String get investmentCurrencyRussiaRub => 'Rússia RUB';

  @override
  String get contentTitle => 'Conteudo';

  @override
  String get contentInquiry => 'Consultas';

  @override
  String get contentInquirySubtitle =>
      'Envie uma consulta anônima e veja a resposta.';

  @override
  String get contentInquiryBadge => 'Q&A';

  @override
  String get contentCloseGuess => 'Adivinhar fechamento';

  @override
  String get contentStockQuote => 'Frases do mercado';

  @override
  String get contentStockQuoteSubtitle =>
      'Citações curtas para aprimorar seu instinto de investimento.';

  @override
  String get contentStockQuoteBadge => 'Diário';

  @override
  String get contentNumberGuess => 'Adivinhe o numero';

  @override
  String get contentNumberGuessSubtitle =>
      'Mini jogo de probabilidade para jogar de forma casual.';

  @override
  String get contentNumberGuessBadge => 'Jogo';

  @override
  String get contentBookReader => 'Coluna';

  @override
  String get contentBookReaderSubtitle =>
      'Textos de domínio público para ler com calma.';

  @override
  String get contentBookReaderBadge => 'Leitura';

  @override
  String get contentStockMeme => 'Meme de acoes';

  @override
  String get contentLottoNumbers => 'Numeros da loteria';

  @override
  String get contentJumpDodge => 'Jogo de pular e desviar';

  @override
  String get contentJumpDodgeSubtitle =>
      'Mini jogo de salto para sessões curtas e focadas.';

  @override
  String get contentJumpDodgeBadge => 'Ação';

  @override
  String get stockQuoteTitle => 'Frases do mercado';

  @override
  String get stockQuoteTapHint => 'Toque para ver outra frase.';

  @override
  String get stockQuoteShuffle => 'Ver outra frase';

  @override
  String get usageGuideTitle => 'Como usar o app';

  @override
  String get usageGuideSubtitle =>
      'Regras para uma estratégia Nasdaq 2x de longo prazo';

  @override
  String get usageGuideCardTitle => 'Como usar o app';

  @override
  String get usageGuideCardSubtitle =>
      'Posição base, zonas de queda, registros, indicadores';

  @override
  String get usageGuideWhatAppTitle => 'O que é este app?';

  @override
  String get usageGuideWhatAppBody =>
      'Este app é um guia de regras para investidores em Nasdaq 2x com visão de longo prazo.\n\nEle calcula automaticamente a queda atual em relação ao topo histórico para mostrar a posição do mercado e oferece uma estratégia para cada zona.\n\nAjuda a manter os princípios de investimento planejados sem se deixar levar pelo medo ou pela ganância do mercado.';

  @override
  String get usageGuideNoBuyTitle =>
      '1. Leia primeiro a posição base e a estratégia';

  @override
  String get usageGuideNoBuyBody =>
      'Toque no cartão de Posição base na tela principal e leia como se preparar. Também veja a aba Estratégia no canto inferior direito.';

  @override
  String get usageGuideStrategyTitle =>
      '2. Confira a estratégia automática por queda';

  @override
  String get usageGuideStrategyBody =>
      'O terceiro cartão calcula automaticamente quanto o QLD está abaixo do topo histórico. A estratégia correspondente aparece e alertas chegam quando as condições são atendidas.';

  @override
  String get usageGuideIndicatorsTitle => 'Quatro indicadores de apoio';

  @override
  String get usageGuideIndicatorsBody =>
      'CNN F&G mostra se o sentimento do mercado está mais perto do medo ou da ganância.\n\nVIX mostra a volatilidade do mercado. Número maior costuma indicar mais ansiedade.\n\nEventos importantes dos EUA incluem NFP, CPI e FOMC. NFP mede emprego, CPI mede inflação e FOMC indica a direção dos juros. Eles podem mover forte Nasdaq e QLD.\n\nO rendimento do título de 10 anos é a taxa do Tesouro dos EUA de 10 anos. Alta rápida pode pressionar ações de crescimento, Nasdaq e QLD.';

  @override
  String get usageGuideQldTitle => '3. Compre e registre no portfólio';

  @override
  String get usageGuideQldBody =>
      'Use a estratégia e o valor como guia, compre na sua corretora e depois registre quantidade, preço médio e caixa no portfólio do app.';

  @override
  String get usageGuideDisclaimer =>
      'Este app é apenas referência de investimento e não garante lucro.';

  @override
  String get usageGuideConfirm => 'OK';

  @override
  String get bookReadingTitle => 'Coluna';

  @override
  String bookReaderPageNumber(int page) {
    return 'Página $page';
  }

  @override
  String get numGuessPrompt => 'Adivinhe um número entre 1 e 1000.';

  @override
  String get numGuessInvalidInput =>
      'Por favor, insira um número entre 1 e 1000.';

  @override
  String numGuessCorrect(int attempts) {
    return 'Correto! Você acertou em $attempts tentativas.';
  }

  @override
  String get numGuessTooLow => 'O número é maior.';

  @override
  String get numGuessTooHigh => 'O número é menor.';

  @override
  String numGuessAttemptsLabel(int count) {
    return 'Tentativas: $count';
  }

  @override
  String get numGuessInputHint => 'Inserir número';

  @override
  String get numGuessConfirm => 'Confirmar';

  @override
  String get numGuessNewGame => 'Novo jogo';

  @override
  String get numGuessRanking => 'Classificação';

  @override
  String get numGuessNoRecords => 'Ainda não há registros.';

  @override
  String numGuessAttemptCount(int count) {
    return '$count tentativas';
  }

  @override
  String get jumpLeaderboard => 'Placar';

  @override
  String get jumpScore => 'Pontuação';

  @override
  String get jumpPersonalBest => 'Melhor pessoal';

  @override
  String get jumpTapToRestart => 'Toque para reiniciar';

  @override
  String get jumpTapToStart => 'Toque para iniciar';

  @override
  String get jumpInstruction =>
      'Toque na tela para pular e desviar dos obstáculos.';

  @override
  String get inquiryLoadError => 'Não foi possível carregar as consultas.';

  @override
  String get inquiryAdminOnlyReply => 'Apenas administradores podem responder.';

  @override
  String get inquiryReplyEmpty => 'Por favor, escreva uma resposta.';

  @override
  String get inquiryReplyError =>
      'Falha ao enviar a resposta. Tente novamente mais tarde.';

  @override
  String get inquiryAdminOnlyPin => 'Apenas administradores podem fixar.';

  @override
  String get inquiryPinError => 'Não foi possível salvar o status fixado.';

  @override
  String get inquiryAdminOnlyDelete => 'Apenas administradores podem excluir.';

  @override
  String get inquiryDeleteTitle => 'Excluir consulta';

  @override
  String get inquiryDeleteConfirm => 'Excluir esta consulta?';

  @override
  String get inquiryCancel => 'Cancelar';

  @override
  String get inquiryDeleteAction => 'Excluir';

  @override
  String get inquiryDeleteError =>
      'Falha ao excluir. Tente novamente mais tarde.';

  @override
  String get inquiryContentEmpty => 'Por favor, escreva sua consulta.';

  @override
  String get inquirySubmitError =>
      'Falha ao enviar a consulta. Tente novamente mais tarde.';

  @override
  String get inquiryAdminLabel => 'Administrador';

  @override
  String get inquiryPasswordLabel => 'Senha';

  @override
  String get inquiryPasswordWrong => 'Senha incorreta.';

  @override
  String get inquiryAdminActivatedRegistered =>
      'Modo admin ativado (dispositivo registrado)';

  @override
  String get inquiryAdminActivatedFailed =>
      'Modo admin ativado (falha no registro do dispositivo)';

  @override
  String get inquiryContentDetailLabel => 'Consulta';

  @override
  String get inquiryAdminReplyLabel => 'Resposta do administrador';

  @override
  String get inquiryAdminReplyEdit => 'Editar resposta';

  @override
  String get inquirySaving => 'Salvando...';

  @override
  String get inquirySubmitReply => 'Enviar resposta';

  @override
  String get inquiryPrevPage => 'Página anterior';

  @override
  String get inquiryNextPage => 'Próxima página';

  @override
  String inquiryPageOf(int current, int total) {
    return 'Página $current / $total';
  }

  @override
  String get inquiryUnpin => 'Desafixar';

  @override
  String get inquiryPin => 'Fixar no topo';

  @override
  String get inquiryListTitle => 'Lista de consultas';

  @override
  String get inquiryEmpty => 'Ainda não há consultas.';

  @override
  String get inquiryWriteTitle => 'Escrever consulta';

  @override
  String get inquiryContentFieldLabel => 'Conteúdo';

  @override
  String get inquirySubmitting => 'Enviando...';

  @override
  String get inquirySubmitButton => 'Enviar';

  @override
  String get inquiryUserReplyLabel => 'Add a follow-up message...';

  @override
  String get indicatorCnnFearGreed => 'CNN Medo & Ganância';

  @override
  String get indicatorVix => 'VIX Volatilidade';

  @override
  String get indicatorUsSchedule => 'Eventos Importantes EUA';

  @override
  String get indicatorTenYearYield => 'Rendimento EUA 10 anos';

  @override
  String get indicatorUsMarketTime => 'Tempo do Mercado EUA';

  @override
  String get indicatorVixHigh => 'Alta volatilidade';

  @override
  String get indicatorVixStable => 'Zona normal';

  @override
  String get indicatorVixDefault => 'Indicador de ansiedade';

  @override
  String get indicatorVixLow => 'Volatilidade muito baixa';

  @override
  String get indicatorVixCaution => 'Zona de cautela';

  @override
  String get indicatorTenYearDesc => 'Taxa título EUA 10 anos';

  @override
  String get marketWeekendLabel => 'Fim de Semana · Para Abrir';

  @override
  String get marketPreOpenLabel => 'Até a abertura';

  @override
  String get marketToCloseLabel => 'Até o fechamento';

  @override
  String get marketClosedLabel => 'Mercado fechado';

  @override
  String get marketClosedValue => 'Fechado';

  @override
  String get noData => 'Sem dados';

  @override
  String get rsiOverbought => 'Sobrecomprado';

  @override
  String get rsiOversold => 'Sobrevendido';

  @override
  String get rsiNormal => 'Neutro';

  @override
  String get rsiOverboughtZone => 'Zona sobrecomprada';

  @override
  String get rsiOversoldZone => 'Zona sobrevendida';

  @override
  String get rsiNormalZone => 'Faixa normal';

  @override
  String get rsiOverboughtOversold => 'Sobrecomprado / Sobrevendido';

  @override
  String get coverStrategyTab => 'Aba de Estratégia';

  @override
  String get coverStrategyHint =>
      'Deslize para cima para ver a Aba de Estratégia';
}
