// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Alerte QLD';

  @override
  String get noBuyZone => 'Zone sans achat';

  @override
  String get tapToViewStrategy => 'Voir la stratégie';

  @override
  String get buyNow => 'Acheter maintenant';

  @override
  String get buyingInProgress => 'Achat en cours';

  @override
  String get hold => 'Conserver';

  @override
  String get navHome => 'Accueil';

  @override
  String get navChart => 'Graphique';

  @override
  String get navExchange => 'Devises';

  @override
  String get navFearGreed => 'Peur';

  @override
  String get fearGreedTitle => 'Peur et Avidité';

  @override
  String get fearGreedInlineLabel => 'CNN Peur & avidité';

  @override
  String get fearGreedSubtitle => 'Sentiment du marché américain CNN';

  @override
  String get fearGreedUnavailable =>
      'Impossible de charger les données de peur et avidité.';

  @override
  String get navAlert => 'Alertes';

  @override
  String get navStrategy => 'Stratégie';

  @override
  String get alertRecovery10 => 'QLD a récupéré 10 %';

  @override
  String get alertMarketOpen => 'Le marché américain a ouvert';

  @override
  String get alertNewHigh => 'Nouveau plus haut atteint';

  @override
  String get portfolio => 'Portefeuille';

  @override
  String get portfolioAssetInput => 'Actifs';

  @override
  String get portfolioClose => 'Fermer';

  @override
  String get exitAdDialogBack => 'Retour';

  @override
  String get exitAdDialogExit => 'Quitter';

  @override
  String get portfolioQldShares => 'Quantité QLD';

  @override
  String get portfolioTqqqShares => 'Quantité TQQQ';

  @override
  String get portfolioQldAveragePrice => 'Prix moyen QLD';

  @override
  String get portfolioTqqqAveragePrice => 'Prix moyen TQQQ';

  @override
  String get portfolioCashUsd => 'Cash USD';

  @override
  String get portfolioTotal => 'Total';

  @override
  String get portfolioProfitLoss => 'Gain/perte';

  @override
  String get portfolioSharesUnit => 'actions';

  @override
  String get portfolioReturnRate => 'Rendement';

  @override
  String get portfolioAveragePriceShort => 'Prix moyen';

  @override
  String get portfolioPriceLoading => 'chargement du prix';

  @override
  String get portfolioToBreakeven => 'Pour revenir à l’équilibre';

  @override
  String get portfolioBreakevenCleared => 'Au-dessus du point d’équilibre';

  @override
  String get basePosition => 'Position de base';

  @override
  String get fromPreviousClose => 'vs clôture précédente';

  @override
  String get from10yHigh => 'vs plus haut historique';

  @override
  String get holdQLDPlusCash => 'Conserver QLD + 30% cash';

  @override
  String get basePositionDescription =>
      '[ Guide de stratégie ]\n\nCette stratégie n\'investit pas tous les actifs dans QLD en une seule fois.\n\nAu départ, seule une partie des actifs est investie, tandis que le reste est conservé en liquidités pour faire face aux fortes baisses du marché.\n\nLa force de conserver des liquidités\n\nLes liquidités ne sont pas conservées pour augmenter le rendement, mais pour garder son calme et sa discipline même pendant une baisse du marché.\n\nPlus important que le rendement maximal est un système d\'investissement capable de maintenir la capitalisation jusqu\'au bout.\n\nExemple :\n- Investir seulement 70 % des actifs initiaux dans QLD\n- Conserver les 30 % restants en liquidités\n\nQLD est un ETF qui suit environ deux fois le mouvement quotidien de l\'indice Nasdaq-100.\n\nAinsi, dans la position initiale :\neffet de levier 2x × investissement de 70 % = exposition globale d\'environ 1,4x.\n\nPar exemple :\n- Nasdaq +1 %\n→ Actifs totaux environ +1,4 %\n\nLorsqu\'une forte baisse survient, les liquidités disponibles sont utilisées progressivement pour effectuer des achats supplémentaires.\n\nExemple :\n- Achat supplémentaire près de la zone de baisse de 40 % de QLD\n\nCela permet d\'accumuler davantage de parts à des prix plus bas et de réduire nettement le prix moyen lorsque le marché se redresse.\n\nCette stratégie peut ainsi produire un rendement supérieur pendant la reprise par rapport à une simple stratégie de conservation.\n\nLe cœur de cette stratégie est de :\n- Réduire la volatilité avec des liquidités pendant les marchés haussiers\n- Utiliser les liquidités pour acheter davantage pendant les fortes baisses et réduire le prix moyen.';

  @override
  String get basePositionIntro =>
      'Cette stratégie de base n\'investit pas tout en une seule fois. Elle conserve QLD avec du cash, réduit les variations en marché haussier et garde une marge pour acheter davantage lors des fortes baisses.';

  @override
  String get basePositionQldAllocationLabel => 'Position QLD de base';

  @override
  String get basePositionCashAllocationLabel => 'Réserve de cash';

  @override
  String get basePositionCorePrinciple => 'Principes clés';

  @override
  String get basePositionCashTitle =>
      'Le cash n\'est pas seulement un frein au rendement';

  @override
  String get basePositionCashText =>
      'C\'est une marge de sécurité pour rester discipliné lors des fortes baisses et acheter plus bas.';

  @override
  String get basePositionInitialLeverageTitle =>
      'Le mouvement initial est d\'environ 1,4x';

  @override
  String get basePositionInitialLeverageText =>
      'QLD suit environ 2 fois le Nasdaq-100. Avec seulement 70 % des actifs dans QLD, le mouvement total du portefeuille descend à environ 1,4x.';

  @override
  String get basePositionStepLeverageTitle =>
      'Pendant les baisses, le levier augmente par étapes';

  @override
  String get basePositionStepLeverageText =>
      'À partir des zones -20 % à -30 %, ajouter du TQQQ peut porter le mouvement total à environ 1,8x. Dans les zones de baisse les plus profondes, il peut approcher 2,3x.';

  @override
  String get basePositionLowAverageTitle =>
      'Plus la peur est forte, plus le prix moyen peut baisser';

  @override
  String get basePositionLowAverageText =>
      'L\'app est conçue pour utiliser le cash afin de renforcer progressivement TQQQ quand la baisse s\'approfondit. Accumuler plus de parts en zone basse peut amplifier le rendement lors du rebond suivant.';

  @override
  String get basePositionSummaryTitle => 'Résumé';

  @override
  String get basePositionSummaryText =>
      'Le but n\'est pas de deviner le rendement maximal. Il est de garder un plan pendant les baisses et de laisser la capitalisation agir plus longtemps.';

  @override
  String get buySignalMessage => 'Les signaux d’achat apparaîtront ici.';

  @override
  String get currentPrice => 'Prix actuel';

  @override
  String get futuresLabel => 'Hors séance';

  @override
  String get tenYearHigh => 'Plus haut historique';

  @override
  String get buyStrategy => 'Stratégie d’achat';

  @override
  String get noBuyZoneTitle => 'Zone sans achat';

  @override
  String get strategyOverview => 'Aperçu';

  @override
  String get corePrinciple => 'Principe clé';

  @override
  String get suggestedAllocation => 'Allocation suggérée';

  @override
  String get riskManagement => 'Gestion du risque';

  @override
  String get actionGuide => 'Guide d’action';

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
  String get minus20Title => 'Stratégie -20%';

  @override
  String get minus20Headline =>
      'Commencer l’accumulation hebdomadaire de TQQQ avec 1 % du cash';

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
  String get minus30Title => 'Stratégie -30%';

  @override
  String get minus30Headline => 'Acheter TQQQ avec 20% du cash';

  @override
  String get minus30OverviewTitle => 'Strategy Overview';

  @override
  String get minus30OverviewText =>
      'This zone represents a high-opportunity accumulation phase.\n\nHistorically, Nasdaq corrections around -30% have often provided strong long-term buying opportunities.\n\nAlthough fear and volatility increase significantly at this stage, disciplined dollar-cost averaging can improve long-term returns.';

  @override
  String get minus30AllocationTitle => 'Suggested Allocation';

  @override
  String get minus30AllocationText =>
      '• Déployer environ 20% du cash disponible\n• Continuer l’accumulation graduelle\n• Éviter de déployer tout le capital trop vite\n• Garder de la flexibilité pour des baisses plus profondes';

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
  String get minus40Title => 'Stratégie -40%';

  @override
  String get minus40Headline => 'Utiliser 30% cash - entrée TQQQ';

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
  String get minus50Title => 'Stratégie -50%';

  @override
  String get minus50Headline => 'Acheter TQQQ avec tout le cash restant';

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
  String get exchangeUsdRub => 'Dollar/Rouble';

  @override
  String get exchangeUsdTwd => 'Dollar/Dollar taïwanais';

  @override
  String get exchangeUsdCny => 'Dollar/Yuan';

  @override
  String get fearGreedExtremeFear => 'Peur extrême';

  @override
  String get fearGreedFear => 'Peur';

  @override
  String get fearGreedNeutral => 'Neutre';

  @override
  String get fearGreedGreed => 'Cupidité';

  @override
  String get fearGreedExtremeGreed => 'Cupidité extrême';

  @override
  String get fearGreedIndicatorsTitle => '7 indicateurs de peur et cupidité';

  @override
  String get fearGreedFaqTitle => 'Questions sur l’indice peur et cupidité';

  @override
  String get fearGreedWhatTitle => 'Qu’est-ce que l’indice CNN Fear & Greed ?';

  @override
  String get fearGreedWhatBody =>
      'L’indice mesure le sentiment du marché actions et aide à juger si les actions semblent correctement valorisées. Une peur excessive tend à faire baisser les prix, tandis qu’une cupidité excessive peut les pousser à la hausse.';

  @override
  String get fearGreedCalculatedTitle => 'Comment est-il calculé ?';

  @override
  String get fearGreedCalculatedBody =>
      'Il combine sept indicateurs : momentum du marché, force des prix, largeur du marché, options put/call, demande d’obligations à haut risque, volatilité et demande d’actifs refuges. Chaque indicateur a le même poids sur une échelle de 0 à 100.';

  @override
  String get fearGreedFrequencyTitle =>
      'À quelle fréquence est-il mis à jour ?';

  @override
  String get fearGreedFrequencyBody =>
      'Chaque composant et l’indice global sont mis à jour lorsque de nouvelles données de marché sont disponibles.';

  @override
  String get fearGreedUseTitle => 'Comment l’utiliser ?';

  @override
  String get fearGreedUseBody =>
      'Utilisez-le comme indicateur d’humeur du marché. Il aide à repérer les excès émotionnels, mais les décisions doivent aussi tenir compte du prix, des fondamentaux, du risque et de votre stratégie.';

  @override
  String get strategyAdLabel => 'Annonce';

  @override
  String get alertSettingsTitle => 'Paramètres d’alerte';

  @override
  String get alertSettingsCloseBasisNote =>
      'Les alertes sont envoyées selon le cours de clôture.';

  @override
  String get alertHighTitle => 'Alerte nouveau plus haut';

  @override
  String get alertHighSubtitle =>
      'Prévenir quand un nouveau plus haut est atteint après installation';

  @override
  String get alertMarketOpenTitle => 'Alerte ouverture du marché';

  @override
  String get alertMarketOpenSubtitle =>
      'Prévenir une fois par jour à l’ouverture du marché régulier américain';

  @override
  String get alertStrategySettingTitle => 'Alerte stratégie';

  @override
  String get alertStrategySettingSubtitle =>
      'Prévenir lors des changements de zones -20 %, -30 %, -40 % et -50 %';

  @override
  String get noBuyHeadline => 'Ne pas acheter plus. Garder 30 % de liquidités.';

  @override
  String get noBuyActionTitle => 'Action immédiate';

  @override
  String get noBuyActionText =>
      'N’achetez pas de nouveaux QLD/TQQQ. Gardez la position QLD actuelle et protégez 30 % de liquidités.';

  @override
  String get noBuyCashTitle => 'Règle de liquidités';

  @override
  String get noBuyCashText =>
      'Les liquidités servent de réserve pour la prochaine zone de baisse. Ne les réduisez pas même si le marché monte.';

  @override
  String get noBuyAvoidTitle => 'À éviter';

  @override
  String get noBuyAvoidText =>
      'Ne poursuivez pas le prix parce qu’il monte. Attendez la zone de -20 %.';

  @override
  String get noBuyNextTitle => 'Étape suivante';

  @override
  String get noBuyNextText =>
      'À -20 %, préparez des achats fractionnés réguliers de TQQQ.';

  @override
  String get minus20ActionTitle => 'Action immédiate';

  @override
  String get minus20ActionText =>
      'Utilisez seulement 1 % du cash total une fois par semaine pour accumuler des fractions de TQQQ. N’investissez pas une grosse somme d’un coup.';

  @override
  String get minus20BuyRuleTitle => 'Objectif';

  @override
  String get minus20BuyRuleText =>
      'Ce réglage commence en zone -20 % afin que, si le marché évolue latéralement, de petits achats réguliers abaissent progressivement le prix moyen de TQQQ. L’objectif n’est pas de viser un gain immédiat, mais de construire un coût moyen plus bas.';

  @override
  String get minus20CashTitle => 'Gestion des liquidités';

  @override
  String get minus20CashText =>
      'La majorité des liquidités doit rester disponible pour les zones -30 %, -40 % et -50 %. Même après l’utilisation du cash prévu à -50 %, le nouveau cash peut continuer à abaisser le prix moyen par accumulation hebdomadaire.';

  @override
  String get minus20AvoidTitle => 'Plan de sortie';

  @override
  String get minus20AvoidText =>
      'Ne vendez pas ces parts de TQQQ à chaque petit rebond. Traitez-les comme une position à clôturer plus tard, quand un nouveau plus haut est atteint et que TQQQ est allégé.';

  @override
  String get minus30ActionTitle => 'Action immédiate';

  @override
  String get minus30ActionText =>
      'Utilisez seulement 20% des liquidités disponibles pour acheter TQQQ. Vérifiez le total avant l’ordre.';

  @override
  String get minus30BuyRuleTitle => 'Règle d’achat';

  @override
  String get minus30BuyRuleText =>
      'Avec \$10,000 de liquidités, utilisez seulement \$2,000 pour TQQQ et gardez les 80% restants.';

  @override
  String get minus30AdditionalTitle => 'Action supplémentaire';

  @override
  String get minus30AdditionalText =>
      'L’accumulation de QLD peut continuer, mais attendez la prochaine zone pour racheter TQQQ.';

  @override
  String get minus30AvoidTitle => 'À éviter';

  @override
  String get minus30AvoidText =>
      'Ne dépensez pas trop de liquidités en anticipant un rebond. Agissez comme si la zone -40 % pouvait encore arriver.';

  @override
  String get minus40ActionTitle => 'Action immédiate';

  @override
  String get minus40ActionText =>
      'Utilisez 30 % des liquidités restantes pour acheter TQQQ. Excluez le montant déjà utilisé à -30 %.';

  @override
  String get minus40BuyRuleTitle => 'Règle d’achat';

  @override
  String get minus40BuyRuleText =>
      'Si le cash restant est de \$8,000, utilisez seulement \$2,400. L’essentiel est de ne pas tout utiliser d’un coup.';

  @override
  String get minus40HoldTitle => 'Règle de conservation';

  @override
  String get minus40HoldText =>
      'Gardez QLD et augmentez TQQQ seulement jusqu’au montant prévu. Gardez du cash pour une baisse supplémentaire.';

  @override
  String get minus40AvoidTitle => 'À éviter';

  @override
  String get minus40AvoidText =>
      'Ne vendez pas par peur. N’achetez pas non plus avec tout le cash par avidité.';

  @override
  String get minus50ActionTitle => 'Action immédiate';

  @override
  String get minus50ActionText =>
      'Utilisez toutes les liquidités restantes pour acheter TQQQ. C’est la dernière étape prévue de déploiement du cash.';

  @override
  String get minus50BuyRuleTitle => 'Règle d’achat';

  @override
  String get minus50BuyRuleText =>
      'Basez l’ordre uniquement sur le cash réellement restant après les achats à -30 % et -40 %.';

  @override
  String get minus50AfterTitle => 'Ensuite';

  @override
  String get minus50AfterText =>
      'Quand de nouvelles liquidités arrivent, accumulez régulièrement TQQQ ou QLD et concentrez-vous sur la baisse du prix moyen.';

  @override
  String get minus50AvoidTitle => 'À éviter';

  @override
  String get minus50AvoidText =>
      'N’abandonnez pas seulement parce que la perte est forte. N’utilisez ni dette ni argent de court terme pour racheter.';

  @override
  String get alertNasdaq200Title => 'Alerte moyenne 200 jours Nasdaq 100';

  @override
  String get alertNasdaq200Subtitle =>
      'Prévenir quand le Nasdaq 100 passe sous ou au-dessus de la moyenne 200 jours';

  @override
  String get alertNasdaq200Breakdown =>
      'Le Nasdaq 100 est passé sous sa moyenne mobile 200 jours';

  @override
  String get alertNasdaq200Breakout =>
      'Le Nasdaq 100 est repassé au-dessus de sa moyenne mobile 200 jours';

  @override
  String get chartGuideTitle => 'Lire ce graphique';

  @override
  String get chartMiniTitle => 'Graphique 3 mois avec moyennes 20 et 200 jours';

  @override
  String get chartGuideCandleTitle => 'Bougies 3 mois';

  @override
  String get chartGuideCandleBody =>
      'Affiche d\'un coup d\'oeil l\'évolution récente de QLD. Vert signifie une clôture en hausse; rouge une clôture en baisse.';

  @override
  String get chartGuideMa200Title => 'Ligne 200 jours';

  @override
  String get chartGuideMa200Body =>
      'Repère de tendance long terme. Au-dessus, le marché paraît plus fort; en dessous, vérifiez risque et liquidités.';

  @override
  String get chartMa200SheetTitle =>
      'Qu\'est-ce que la moyenne mobile à 200 jours ?';

  @override
  String get chartMa200SheetBody =>
      'La moyenne mobile à 200 jours est une ligne de tendance de long terme calculée à partir du prix de clôture moyen des quelque 200 dernières séances.\n\nBeaucoup d\'investisseurs la suivent parce qu\'elle réduit le bruit de court terme et rend la grande direction du marché plus lisible. Un prix au-dessus de cette ligne est souvent vu comme une tendance long terme plus saine; en dessous, il peut signaler une dynamique plus faible ou un besoin de revoir le risque.\n\nElle ne doit pas servir seule de signal d\'achat ou de vente. Pour un ETF à effet de levier comme QLD, utilisez-la avec le niveau de liquidités, le drawdown, le prix moyen et votre horizon d\'investissement.';

  @override
  String get chartMa20SheetTitle =>
      'Qu\'est-ce que la moyenne mobile à 20 jours ?';

  @override
  String get chartMa20SheetBody =>
      'La moyenne mobile à 20 jours est une ligne de tendance court terme calculée à partir du prix de clôture moyen des quelque 20 dernières séances.\n\nBeaucoup d\'investisseurs la suivent parce qu\'elle réagit plus vite que la ligne 200 jours et montre mieux l\'élan récent. Un prix durablement au-dessus peut indiquer une force court terme; des passages répétés en dessous peuvent signaler un affaiblissement de la tendance récente.\n\nPour QLD, la ligne 20 jours aide à lire la vitesse et la volatilité de court terme, mais elle peut donner beaucoup de faux signaux. Comparez-la avec la ligne 200 jours, les liquidités et vos zones d\'achat prévues.';

  @override
  String get alertPortfolioCashTitle => 'Alerte de rééquilibrage du cash';

  @override
  String get alertPortfolioCashSubtitle =>
      'Prévenir si le cash passe sous 20 % après une hausse';

  @override
  String get alertPortfolioCashHigh =>
      'Le cash est sous 20 %. Envisagez un rééquilibrage pour reconstituer du cash.';

  @override
  String get alertPortfolioCashLow =>
      'Le cash est sous 20 %. Envisagez un rééquilibrage pour reconstituer du cash.';

  @override
  String get alertAnnouncementTitle => 'Notifications d\'annonces';

  @override
  String get alertAnnouncementSubtitle =>
      'Recevoir les annonces envoyées par QLD DIP ALERT en notifications push';

  @override
  String get alertDetailTitle => 'Détail de l’alerte';

  @override
  String get alertDetailOpenStrategy => 'Voir la stratégie';

  @override
  String get alertDetailRecovery =>
      'La zone de baisse s’est améliorée. Vérifiez le portefeuille calmement et évitez les décisions impulsives.';

  @override
  String get alertDetailNewHigh =>
      'Un nouveau plus haut a été enregistré après installation. Il sert de nouvelle référence pour les futures baisses.';

  @override
  String get alertDetailMarketOpen =>
      'Le marché régulier américain a ouvert. Vérifiez les prix seulement si vous aviez prévu d’agir.';

  @override
  String get alertDetailNasdaq200Breakdown =>
      'Le Nasdaq 100 est passé sous sa moyenne 200 jours. La tendance peut s’affaiblir; vérifiez risque et liquidités.';

  @override
  String get alertDetailNasdaq200Breakout =>
      'Le Nasdaq 100 est repassé au-dessus de sa moyenne 200 jours. La tendance peut s’améliorer, mais suivez votre stratégie.';

  @override
  String get alertDetailPortfolioCashHigh =>
      'Le cash est sous le repère de 20 %. Cela signifie souvent que les actions ont monté et que la réserve de cash est trop faible. Envisagez d’alléger une partie de la position et de rééquilibrer vers le niveau de cash prévu.';

  @override
  String get alertDetailPortfolioCashLow =>
      'Le cash est sous le repère de 20 %. Cela signifie souvent que les actions ont monté et que la réserve de cash est trop faible. Envisagez d’alléger une partie de la position et de rééquilibrer vers le niveau de cash prévu.';

  @override
  String get alertDetailOpenLink => 'Ouvrir le lien';

  @override
  String get appUpdateTitle => 'Mise à jour disponible';

  @override
  String get appUpdateMessage =>
      'Une nouvelle version est disponible. Mettez à jour pour utiliser les dernières fonctions et corrections.';

  @override
  String get appUpdateLater => 'Plus tard';

  @override
  String get appUpdateNow => 'Mettre à jour';

  @override
  String get alertTestTitle => 'Test de notification';

  @override
  String get alertPermissionHelpTitle =>
      'Vous ne recevez pas les notifications ?';

  @override
  String get alertPermissionHelpBody =>
      'Si l\'autorisation de notification de l\'appareil est désactivée, les notifications de test peuvent ne pas s\'afficher.';

  @override
  String get alertPermissionRequest => 'Demander l\'autorisation';

  @override
  String get alertPermissionOpenSettings => 'Ouvrir les réglages';

  @override
  String get holdPageTitle => 'Conserver la position';

  @override
  String get holdHeadline =>
      'L\'achat planifié a été exécuté. Pendant la reprise, concentrez-vous sur la conservation de la position.';

  @override
  String get holdPositionTitle => 'Position actuelle';

  @override
  String get holdPositionText =>
      'Conservez les positions QLD et TQQQ déjà achetées. Ne répétez pas l\'achat d\'une zone précédente simplement parce que le prix revient dans une zone récupérée.';

  @override
  String get holdActionTitle => 'Action actuelle';

  @override
  String get holdActionText =>
      'Suspendez les achats supplémentaires de TQQQ et observez la reprise. Conservez les liquidités restantes en cas de nouvelle baisse.';

  @override
  String get holdAvoidTitle => 'À éviter';

  @override
  String get holdAvoidText =>
      'Ne vendez pas précipitamment à cause de la volatilité et n\'achetez pas impulsivement en étant certain de la reprise.';

  @override
  String get holdResetTitle => 'Réinitialisation de la stratégie';

  @override
  String get holdResetText =>
      'Lorsque QLD retrouve complètement son précédent sommet, ce cycle de baisse se termine et la stratégie revient à la position initiale sans achat.';

  @override
  String get investmentCalculatorTitle => 'Calculateur de rendement attendu';

  @override
  String get investmentCalculatorSubtitle =>
      'Calcul composé simple basé sur la moyenne passée de QLD';

  @override
  String get investmentCalculatorReturnRate => 'Rendement moyen sur 10 ans';

  @override
  String get investmentCalculatorLumpSumTitle =>
      'Investissement unique + achat sur repli';

  @override
  String get investmentCalculatorAmount => 'Montant investi';

  @override
  String get investmentCalculatorYears => 'Durée';

  @override
  String get investmentCalculatorExpectedValue => 'Valeur estimée';

  @override
  String get investmentCalculatorPrincipalMultiple => 'Multiple du capital';

  @override
  String get investmentCalculatorMonthlyTitle => 'Investissement programmé';

  @override
  String get investmentCalculatorMonthlyAmount => 'Montant mensuel';

  @override
  String get investmentCalculatorTotalPrincipal => 'Total versé';

  @override
  String get investmentCalculatorExpectedProfit => 'Gain estimé';

  @override
  String get investmentCalculatorDisclaimer =>
      'Il s\'agit d\'un calcul simple basé sur les rendements passés et ne garantit pas les rendements futurs.';

  @override
  String get investmentCalculatorYearsSuffix => 'an';

  @override
  String get investmentCalculatorTimesSuffix => 'x';

  @override
  String get investmentCalculatorChartHint =>
      'Vous pouvez vérifier le rendement moyen avec le graphique historique.';

  @override
  String get investmentCalculatorCurrencySectionTitle => 'Conversion de devise';

  @override
  String get investmentCalculatorCurrency => 'Pays/Devise';

  @override
  String get investmentCalculatorExchangeRate => 'Taux pour 1 USD';

  @override
  String get investmentCalculatorExchangeRateHint =>
      'Saisissez la valeur de 1 USD dans la devise sélectionnée.';

  @override
  String get investmentCalculatorConvertedLumpSum => 'Valeur finale placée';

  @override
  String get investmentCalculatorConvertedMonthly => 'Valeur finale programmée';

  @override
  String get investmentCurrencyUnitedStatesUsd => 'États-Unis USD';

  @override
  String get investmentCurrencyKoreaKrw => 'Corée KRW';

  @override
  String get investmentCurrencyJapanJpy => 'Japon JPY';

  @override
  String get investmentCurrencyChinaCny => 'Chine CNY';

  @override
  String get investmentCurrencyTaiwanTwd => 'Taïwan TWD';

  @override
  String get investmentCurrencyGermanyEur => 'Allemagne EUR';

  @override
  String get investmentCurrencyFranceEur => 'France EUR';

  @override
  String get investmentCurrencySpainEur => 'Espagne EUR';

  @override
  String get investmentCurrencyPortugalEur => 'Portugal EUR';

  @override
  String get investmentCurrencyRussiaRub => 'Russie RUB';

  @override
  String get contentTitle => 'Contenus';

  @override
  String get contentInquiry => 'Demandes';

  @override
  String get contentCloseGuess => 'Deviner la cloture';

  @override
  String get contentStockQuote => 'Citations boursieres';

  @override
  String get contentNumberGuess => 'Deviner le nombre';

  @override
  String get contentBookReader => 'Lecteur de livres';

  @override
  String get contentStockMeme => 'Meme boursier';

  @override
  String get contentLottoNumbers => 'Numeros de loto';

  @override
  String get contentJumpDodge => 'Jeu de saut et esquive';

  @override
  String get stockQuoteTitle => 'Citations boursieres';

  @override
  String get stockQuoteTapHint => 'Touchez pour voir une autre citation.';

  @override
  String get stockQuoteShuffle => 'Voir une autre citation';

  @override
  String get usageGuideTitle => 'Mode d’emploi de l’app';

  @override
  String get usageGuideSubtitle =>
      'Règles pour une stratégie Nasdaq 2x de long terme';

  @override
  String get usageGuideCardTitle => 'Mode d’emploi de l’app';

  @override
  String get usageGuideCardSubtitle =>
      'Position de base, zones de baisse, suivi, indicateurs';

  @override
  String get usageGuideWhatAppTitle => 'À quoi sert cette app ?';

  @override
  String get usageGuideWhatAppBody =>
      'Cette app est un guide de règles pour les investisseurs utilisant le Nasdaq 2x dans une approche de long terme.\n\nElle calcule automatiquement la baisse actuelle par rapport au plus haut historique afin de situer le marché, puis propose une stratégie pour chaque zone.\n\nElle aide à suivre des principes d’investissement planifiés sans se laisser emporter par la peur ou l’avidité du marché.';

  @override
  String get usageGuideNoBuyTitle =>
      '1. Lire d’abord la position de base et la stratégie';

  @override
  String get usageGuideNoBuyBody =>
      'Touchez la carte Position de base sur l’écran principal et lisez comment vous préparer. Consultez aussi l’onglet Stratégie en bas à droite.';

  @override
  String get usageGuideStrategyTitle =>
      '2. Vérifier la stratégie automatique par zone';

  @override
  String get usageGuideStrategyBody =>
      'La troisième carte calcule automatiquement la baisse de QLD par rapport à son plus haut historique. La stratégie adaptée s’affiche et des alertes arrivent si les conditions sont remplies.';

  @override
  String get usageGuideIndicatorsTitle => 'Quatre indicateurs d’aide';

  @override
  String get usageGuideIndicatorsBody =>
      'CNN F&G montre si le sentiment du marché est plutôt peur ou avidité.\n\nLe VIX montre la volatilité du marché. Plus il est élevé, plus l’inquiétude est forte.\n\nLes grands événements US incluent NFP, CPI et FOMC. NFP suit l’emploi, CPI l’inflation et FOMC la direction des taux. Ils peuvent fortement faire bouger Nasdaq et QLD.\n\nLe rendement à 10 ans est le taux de l’obligation américaine à 10 ans. Une hausse rapide peut peser sur les valeurs de croissance, Nasdaq et QLD.';

  @override
  String get usageGuideQldTitle =>
      '3. Acheter puis enregistrer le portefeuille';

  @override
  String get usageGuideQldBody =>
      'Utilisez la stratégie et le montant comme repère, achetez avec votre courtier, puis enregistrez quantité, prix moyen et cash dans le portefeuille de l’app.';

  @override
  String get usageGuideDisclaimer =>
      'Cette app est uniquement une référence d’investissement et ne garantit aucun profit.';

  @override
  String get usageGuideConfirm => 'OK';
}
