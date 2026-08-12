// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'QLD Alarm';

  @override
  String get menuThemeTitle => 'Thema';

  @override
  String get menuLanguageTitle => 'Sprache';

  @override
  String get menuThemeLight => 'Hell';

  @override
  String get menuThemeDark => 'Dunkel';

  @override
  String get noBuyZone => 'Keine-Kauf-Zone';

  @override
  String get tapToViewStrategy => 'Strategie anzeigen';

  @override
  String get buyNow => 'Jetzt kaufen';

  @override
  String get buyingInProgress => 'Kauf läuft';

  @override
  String get hold => 'Halten';

  @override
  String get navHome => 'Home';

  @override
  String get navChart => 'Chart';

  @override
  String get navExchange => 'FX';

  @override
  String get navFearGreed => 'Angst';

  @override
  String get fearGreedTitle => 'Angst und Gier';

  @override
  String get fearGreedInlineLabel => 'CNN Angst & Gier';

  @override
  String get fearGreedSubtitle => 'CNN US-Marktsentiment';

  @override
  String get fearGreedUnavailable =>
      'Angst-und-Gier-Daten konnten nicht geladen werden.';

  @override
  String get navAlert => 'Alarm';

  @override
  String get navStrategy => 'Strategie';

  @override
  String get alertRecovery10 => 'QLD hat sich um 10 % erholt';

  @override
  String get alertMarketOpen => 'Der US-Markt ist geöffnet';

  @override
  String get alertNewHigh => 'Neues Hoch erreicht';

  @override
  String get portfolio => 'Portfolio';

  @override
  String get portfolioAssetInput => 'Vermögen';

  @override
  String get portfolioClose => 'Schließen';

  @override
  String get exitAdDialogBack => 'Zurück';

  @override
  String get exitAdDialogExit => 'Beenden';

  @override
  String get exitAdDialogMessage =>
      'Beim Beenden der App kann höchstens einmal alle 3 Stunden eine Vollbildanzeige erscheinen. Die Werbeeinnahmen werden für den Betrieb der App und die Verbesserung ihrer Funktionen verwendet. Vielen Dank.';

  @override
  String get portfolioQldShares => 'QLD Stückzahl';

  @override
  String get portfolioTqqqShares => 'TQQQ Stückzahl';

  @override
  String get portfolioQldAveragePrice => 'QLD Durchschnittspreis';

  @override
  String get portfolioTqqqAveragePrice => 'TQQQ Durchschnittspreis';

  @override
  String get portfolioCashUsd => 'Cash USD';

  @override
  String get portfolioTotal => 'Gesamt';

  @override
  String get portfolioProfitLoss => 'Gewinn/Verlust';

  @override
  String get portfolioSharesUnit => 'Anteile';

  @override
  String get portfolioReturnRate => 'Rendite';

  @override
  String get portfolioAveragePriceShort => 'Durchschnittspreis';

  @override
  String get portfolioPriceLoading => 'Preis wird geladen';

  @override
  String get portfolioToBreakeven => 'Bis Break-even';

  @override
  String get portfolioBreakevenCleared => 'Über Break-even';

  @override
  String get basePosition => 'Basisposition';

  @override
  String get fromPreviousClose => 'zum Vortagesschluss';

  @override
  String get from10yHigh => 'vs Allzeithoch';

  @override
  String get holdQLDPlusCash => 'QLD 70% + 30% Cash';

  @override
  String get basePositionDescription =>
      '[ Strategieleitfaden ]\n\nDiese Strategie investiert nicht das gesamte Vermögen auf einmal in QLD.\n\nZu Beginn wird nur ein Teil des Vermögens investiert. Der Rest bleibt als Cashreserve verfügbar, um auf starke Marktrückgänge vorbereitet zu sein.\n\nDie Stärke einer Cashreserve\n\nCash wird nicht gehalten, um die Rendite zu erhöhen, sondern um auch in fallenden Märkten ruhig und diszipliniert zu bleiben.\n\nWichtiger als die höchstmögliche Rendite ist ein Anlagesystem, das den Zinseszinseffekt bis zum Ende fortsetzen kann.\n\nBeispiel:\n- Nur 70 % des Anfangsvermögens in QLD investieren\n- Die übrigen 30 % als Cash halten\n\nQLD ist ein ETF, der ungefähr die doppelte tägliche Bewegung des Nasdaq-100-Index abbildet.\n\nDaher gilt für die Ausgangsposition:\n2x Hebel × 70 % Investitionsquote = ungefähr 1,4x Gesamtmarktexposure.\n\nZum Beispiel:\n- Nasdaq +1 %\n→ Gesamtvermögen etwa +1,4 %\n\nBei einem starken Marktrückgang wird die Cashreserve schrittweise für zusätzliche Käufe eingesetzt.\n\nBeispiel:\n- Zusätzlicher Kauf im Bereich eines QLD-Rückgangs von etwa 40 %\n\nSo können zu niedrigeren Preisen mehr Anteile aufgebaut und bei einer Markterholung die durchschnittlichen Einstiegskosten deutlich gesenkt werden.\n\nDadurch kann diese Strategie in Erholungsphasen eine höhere Rendite erzielen als eine einfache Haltestrategie.\n\nDer Kern dieser Strategie ist:\n- In steigenden Märkten die Schwankungen mit Cash reduzieren\n- Bei starken Rückgängen mit Cash nachkaufen und die Durchschnittskosten senken.';

  @override
  String get basePositionIntro =>
      'Diese Basisstrategie investiert nicht alles auf einmal. Sie hält QLD zusammen mit Cash, senkt Schwankungen in steigenden Märkten und lässt Spielraum für Nachkäufe bei starken Rückgängen.';

  @override
  String get basePositionQldAllocationLabel => 'QLD-Basisposition';

  @override
  String get basePositionCashAllocationLabel => 'Cashreserve';

  @override
  String get basePositionCorePrinciple => 'Kernprinzipien';

  @override
  String get basePositionCashTitle =>
      'Cash ist kein Geld, das nur Rendite senkt';

  @override
  String get basePositionCashText =>
      'Es ist Sicherheitsreserve, um bei starken Rückgängen diszipliniert zu bleiben und zu niedrigeren Preisen nachzukaufen.';

  @override
  String get basePositionInitialLeverageTitle =>
      'Die Anfangsbewegung liegt bei etwa 1,4x';

  @override
  String get basePositionInitialLeverageText =>
      'QLD bildet ungefähr die 2-fache Bewegung des Nasdaq-100 ab. Wenn nur 70 % des Vermögens in QLD liegen, sinkt die Gesamtbewegung des Portfolios auf etwa 1,4x.';

  @override
  String get basePositionStepLeverageTitle =>
      'In Rückgängen steigt der Hebel schrittweise';

  @override
  String get basePositionStepLeverageText =>
      'Ab den Zonen -20 % bis -30 % kann das Beimischen von TQQQ die Gesamtbewegung auf etwa 1,8x erhöhen. In den tiefsten Rückgangszonen kann sie sich etwa 2,3x annähern.';

  @override
  String get basePositionLowAverageTitle =>
      'Je größer die Angst, desto niedriger der Durchschnittskurs';

  @override
  String get basePositionLowAverageText =>
      'Diese App ist so aufgebaut, dass bei tieferen Rückgängen Cash schrittweise zum Nachkaufen von TQQQ eingesetzt wird. Mehr Anteile in niedrigen Zonen können die spätere Erholung stärker in Rendite übersetzen.';

  @override
  String get basePositionSummaryTitle => 'Zusammenfassung';

  @override
  String get basePositionSummaryText =>
      'Das Ziel ist nicht, die höchste Rendite zu erraten. Es geht darum, den Plan auch in Rückgängen beizubehalten und den Zinseszinseffekt länger wirken zu lassen.';

  @override
  String get buySignalMessage => 'Kaufsignale erscheinen hier.';

  @override
  String get checkStrategyCard =>
      'Sehen Sie die Strategiekarte für Ihre aktuelle Zone.';

  @override
  String get strategyCardLabel => 'Strategiekarte';

  @override
  String get currentPrice => 'Aktueller Preis';

  @override
  String get futuresLabel => 'Nachbörslich';

  @override
  String get tenYearHigh => 'Allzeithoch';

  @override
  String get buyStrategy => 'Kaufstrategie';

  @override
  String get noBuyZoneTitle => 'Keine-Kauf-Zone';

  @override
  String get strategyOverview => 'Überblick';

  @override
  String get corePrinciple => 'Kernprinzip';

  @override
  String get suggestedAllocation => 'Empfohlene Allokation';

  @override
  String get riskManagement => 'Risikomanagement';

  @override
  String get actionGuide => 'Handlungsleitfaden';

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
  String get minus20Title => '-20% Strategie';

  @override
  String get minus20Headline =>
      'Wöchentliche TQQQ-Akkumulation mit 1% des Gesamtcashs starten';

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
  String get minus30Title => '-30% Strategie';

  @override
  String get minus30Headline => 'TQQQ mit 20% Cash kaufen';

  @override
  String get minus30OverviewTitle => 'Strategy Overview';

  @override
  String get minus30OverviewText =>
      'This zone represents a high-opportunity accumulation phase.\n\nHistorically, Nasdaq corrections around -30% have often provided strong long-term buying opportunities.\n\nAlthough fear and volatility increase significantly at this stage, disciplined dollar-cost averaging can improve long-term returns.';

  @override
  String get minus30AllocationTitle => 'Suggested Allocation';

  @override
  String get minus30AllocationText =>
      '• Etwa 20% des verfügbaren Cashs einsetzen\n• Weiter schrittweise akkumulieren\n• Nicht zu schnell das gesamte Kapital einsetzen\n• Flexibilität für tiefere Rückgänge behalten';

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
  String get minus40Title => '-40% Strategie';

  @override
  String get minus40Headline => '30% Cash einsetzen - TQQQ Einstieg';

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
  String get minus50Title => '-50% Strategie';

  @override
  String get minus50Headline => 'TQQQ mit allem restlichen Cash kaufen';

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
  String get exchangeUsdRub => 'Dollar/Rubel';

  @override
  String get exchangeUsdTwd => 'Dollar/Taiwan-Dollar';

  @override
  String get exchangeUsdCny => 'Dollar/Yuan';

  @override
  String get fearGreedExtremeFear => 'Extreme Angst';

  @override
  String get fearGreedFear => 'Angst';

  @override
  String get fearGreedNeutral => 'Neutral';

  @override
  String get fearGreedGreed => 'Gier';

  @override
  String get fearGreedExtremeGreed => 'Extreme Gier';

  @override
  String get fearGreedIndicatorsTitle => '7 Angst-und-Gier-Indikatoren';

  @override
  String get fearGreedFaqTitle => 'Fragen zum Angst-und-Gier-Index';

  @override
  String get fearGreedWhatTitle => 'Was ist der CNN Fear & Greed Index?';

  @override
  String get fearGreedWhatBody =>
      'Der Index misst die Stimmung am Aktienmarkt und ob Aktien fair bewertet sein könnten. Übermäßige Angst drückt Kurse oft nach unten, während übermäßige Gier Kurse nach oben treiben kann.';

  @override
  String get fearGreedCalculatedTitle => 'Wie wird er berechnet?';

  @override
  String get fearGreedCalculatedBody =>
      'Er kombiniert sieben Indikatoren: Marktmomentum, Kursstärke, Marktbreite, Put/Call-Optionen, Nachfrage nach Hochzinsanleihen, Volatilität und Nachfrage nach sicheren Häfen. Alle Indikatoren fließen gleichgewichtet in eine Skala von 0 bis 100 ein.';

  @override
  String get fearGreedFrequencyTitle => 'Wie oft wird er aktualisiert?';

  @override
  String get fearGreedFrequencyBody =>
      'Jede Komponente und der Gesamtindex werden aktualisiert, sobald neue Marktdaten verfügbar sind.';

  @override
  String get fearGreedUseTitle => 'Wie sollte ich ihn nutzen?';

  @override
  String get fearGreedUseBody =>
      'Nutzen Sie ihn als Stimmungsindikator. Er hilft, emotionale Extreme zu erkennen, sollte aber mit Kursen, Fundamentaldaten, Risikokontrolle und der eigenen Strategie kombiniert werden.';

  @override
  String get strategyAdLabel => 'Anzeige';

  @override
  String get alertSettingsTitle => 'Benachrichtigungseinstellungen';

  @override
  String get alertSettingsCloseBasisNote =>
      'Benachrichtigungen werden auf Basis des Schlusskurses gesendet.';

  @override
  String get alertHighTitle => 'Neues-Hoch-Alarm';

  @override
  String get alertHighSubtitle =>
      'Benachrichtigen, wenn nach der Installation ein neues Hoch erreicht wird';

  @override
  String get alertMarketOpenTitle => 'Markteröffnung-Alarm';

  @override
  String get alertMarketOpenSubtitle =>
      'Einmal täglich benachrichtigen, wenn der reguläre US-Markt öffnet';

  @override
  String get alertStrategySettingTitle => 'Strategie-Alarm';

  @override
  String get alertStrategySettingSubtitle =>
      'Bei Änderungen der Zonen -20 %, -30 %, -40 % und -50 % benachrichtigen';

  @override
  String get noBuyHeadline => 'Keine Zusatzkäufe. 30 % Cash halten.';

  @override
  String get noBuyActionTitle => 'Sofortige Aktion';

  @override
  String get noBuyActionText =>
      'Keine neuen QLD/TQQQ-Käufe. Bestehende QLD-Position halten und 30 % Cash schützen.';

  @override
  String get noBuyCashTitle => 'Cash-Regel';

  @override
  String get noBuyCashText =>
      'Cash ist Reservekapital für die nächste Rückgangszone. Auch bei steigenden Märkten nicht reduzieren.';

  @override
  String get noBuyAvoidTitle => 'Vermeiden';

  @override
  String get noBuyAvoidText =>
      'Kaufen Sie nicht hinterher, nur weil der Preis steigt. Warten Sie auf die -20 %-Zone.';

  @override
  String get noBuyNextTitle => 'Nächster Schritt';

  @override
  String get noBuyNextText =>
      'Bei -20 % auf kleine regelmäßige TQQQ-Teilkaufe vorbereiten.';

  @override
  String get minus20ActionTitle => 'Sofortige Aktion';

  @override
  String get minus20ActionText =>
      'Kaufen Sie wöchentlich TQQQ mit 1% Ihres Bargeldbestands.\nBsp.) 500 \$ Bargeld → 5 \$ pro Woche kaufen';

  @override
  String get minus20BuyRuleTitle => 'Zweck';

  @override
  String get minus20BuyRuleText =>
      'Diese Einstellung beginnt in der -20%-Zone, damit kleine regelmäßige Käufe bei Seitwärtsphasen den TQQQ-Durchschnittspreis schrittweise senken. Ziel ist nicht der sofortige Gewinn, sondern eine niedrigere Kostenbasis.';

  @override
  String get minus20CashTitle => 'Cash-Management';

  @override
  String get minus20CashText =>
      'Der größte Teil des Cashs bleibt für -30%, -40% und -50% verfügbar. Selbst wenn das geplante Cash bei -50% vollständig eingesetzt ist, kann neues Cash über wöchentliche Akkumulation den Durchschnitt weiter senken.\n\nSelbst wenn der Markt 10 oder mehr Wochen seitwärts läuft, wird wöchentlich 1% des gesamten Cashs weiter angesammelt. Je länger die Seitwärtsphase, desto mehr Anteile werden aufgebaut — es gibt keinen Grund aufzuhören.\n\nSobald die -30%-Zone erreicht ist, wird einmalig 20% des zu diesem Zeitpunkt verbleibenden Cashs zusätzlich investiert. Die wöchentliche Akkumulation wird nicht gestoppt — sie läuft parallel zur -30%-Strategie weiter. Die Akkumulation endet erst, wenn das vorherige Hoch zurückerobert und ein Rebalancing durchgeführt wird.';

  @override
  String get minus20AvoidTitle => 'Ausstiegsplan';

  @override
  String get minus20AvoidText =>
      'Diese TQQQ-Anteile nicht bei jeder kurzen Erholung verkaufen. Sie gehören zur Position, die später bei einem neuen Hoch zusammen mit dem TQQQ-Abbau reduziert wird.';

  @override
  String get minus30ActionTitle => 'Sofortige Aktion';

  @override
  String get minus30ActionText =>
      'Nutze nur 20% des verfügbaren Cashs, um TQQQ zu kaufen. Prüfe vor der Order den gesamten Cash-Bestand.';

  @override
  String get minus30BuyRuleTitle => 'Kaufregel';

  @override
  String get minus30BuyRuleText =>
      'Wenn \$10,000 Cash vorhanden sind, nutze nur \$2,000 für TQQQ und bewahre die restlichen 80%.';

  @override
  String get minus30AdditionalTitle => 'Zusätzliche Aktion';

  @override
  String get minus30AdditionalText =>
      'QLD kann weiter gesammelt werden, zusätzliche TQQQ-Käufe warten bis zur nächsten Zone.';

  @override
  String get minus30AvoidTitle => 'Vermeiden';

  @override
  String get minus30AvoidText =>
      'Nicht zu viel Cash ausgeben, nur weil Sie eine Erholung erwarten. Handeln Sie so, als könne -40 % noch kommen.';

  @override
  String get minus40ActionTitle => 'Sofortige Aktion';

  @override
  String get minus40ActionText =>
      '30 % des restlichen Cashs für TQQQ verwenden. Beträge aus der -30 %-Zone abziehen.';

  @override
  String get minus40BuyRuleTitle => 'Kaufregel';

  @override
  String get minus40BuyRuleText =>
      'Wenn noch \$8,000 Cash übrig sind, nutze nur \$2,400. Entscheidend ist, nicht alles auf einmal einzusetzen.';

  @override
  String get minus40HoldTitle => 'Halte-Regel';

  @override
  String get minus40HoldText =>
      'QLD halten und TQQQ nur bis zur geplanten Höhe erhöhen. Cash für weiteren Rückgang behalten.';

  @override
  String get minus40AvoidTitle => 'Vermeiden';

  @override
  String get minus40AvoidText =>
      'Nicht aus Angst verkaufen. Nicht aus Gier mit allem Cash kaufen.';

  @override
  String get minus50ActionTitle => 'Sofortige Aktion';

  @override
  String get minus50ActionText =>
      'Das gesamte verbleibende Cash für TQQQ verwenden. Dies ist die letzte geplante Cash-Einsatzstufe.';

  @override
  String get minus50BuyRuleTitle => 'Kaufregel';

  @override
  String get minus50BuyRuleText =>
      'Nur das tatsächlich verbleibende Cash nach -30 % und -40 % als Basis nehmen.';

  @override
  String get minus50AfterTitle => 'Danach';

  @override
  String get minus50AfterText =>
      'Bei neuem Cash regelmäßig TQQQ oder QLD sammeln und den Durchschnittspreis senken.';

  @override
  String get minus50AvoidTitle => 'Vermeiden';

  @override
  String get minus50AvoidText =>
      'Nicht wegen hoher Verluste aufgeben. Keine Schulden oder kurzfristigen Lebenshaltungsmittel für Nachkäufe nutzen.';

  @override
  String get alertNasdaq200Title => 'Nasdaq 100 200-Tage-Alarm';

  @override
  String get alertNasdaq200Subtitle =>
      'Benachrichtigen, wenn der Nasdaq 100 die 200-Tage-Linie unter- oder überschreitet';

  @override
  String get alertNasdaq200Breakdown =>
      'Der Nasdaq 100 ist unter die 200-Tage-Linie gefallen';

  @override
  String get alertNasdaq200Breakout =>
      'Der Nasdaq 100 ist wieder über die 200-Tage-Linie gestiegen';

  @override
  String get chartGuideTitle => 'So liest du diesen Chart';

  @override
  String get chartMiniTitle =>
      '3-Monats-Chart mit 20- und 200-Tage-Durchschnitt';

  @override
  String get chartGuideCandleTitle => '3-Monats-Kerzen';

  @override
  String get chartGuideCandleBody =>
      'Zeigt die jüngste QLD-Kursbewegung auf einen Blick. Grün bedeutet höherer Schluss, Rot niedrigerer Schluss.';

  @override
  String get chartGuideMa200Title => '200-Tage-Linie';

  @override
  String get chartGuideMa200Body =>
      'Eine langfristige Trendlinie. Kurse darüber deuten Stärke an; darunter solltest du Risiko und Cash prüfen.';

  @override
  String get chartMa200SheetTitle => 'Was ist der 200-Tage-Durchschnitt?';

  @override
  String get chartMa200SheetBody =>
      'Der 200-Tage-Durchschnitt ist eine langfristige Trendlinie, die aus dem durchschnittlichen Schlusskurs der letzten rund 200 Handelstage berechnet wird.\n\nViele Anleger nutzen ihn, weil er kurzfristige Schwankungen glättet und die grobe Marktrichtung leichter erkennbar macht. Liegt der Preis darüber, wird das oft als stabilerer langfristiger Trend gelesen; liegt er darunter, kann das schwächere Dynamik oder einen Anlass zur Risikoprüfung bedeuten.\n\nEr sollte nicht allein als Kauf- oder Verkaufssignal dienen. Bei einem gehebelten ETF wie QLD ist er vor allem ein Referenzwert zusammen mit Cashquote, Drawdown, Durchschnittskurs und Anlagehorizont.';

  @override
  String get chartMa20SheetTitle => 'Was ist der 20-Tage-Durchschnitt?';

  @override
  String get chartMa20SheetBody =>
      'Der 20-Tage-Durchschnitt ist eine kurzfristige Trendlinie, die aus dem durchschnittlichen Schlusskurs der letzten rund 20 Handelstage berechnet wird.\n\nViele Anleger beachten ihn, weil er schneller reagiert als die 200-Tage-Linie und die jüngste Dynamik besser sichtbar macht. Kurse darüber können kurzfristige Stärke zeigen; wiederholte Brüche darunter können auf eine schwächere jüngste Tendenz hindeuten.\n\nBei QLD hilft die 20-Tage-Linie, kurzfristige Geschwindigkeit und Volatilität zu lesen. Sie erzeugt aber häufiger Fehlsignale, daher sollte sie zusammen mit der 200-Tage-Linie, Cashquote und geplanten Kaufzonen genutzt werden.';

  @override
  String get alertPortfolioCashTitle => 'Cash-Rebalancing-Alarm';

  @override
  String get alertPortfolioCashSubtitle =>
      'Benachrichtigen, wenn Cash nach Kursanstiegen unter 20 % fällt';

  @override
  String get alertPortfolioCashHigh =>
      'Die Cashquote liegt unter 20 %. Rebalancing zum Wiederaufbau von Cash prüfen.';

  @override
  String get alertPortfolioCashLow =>
      'Die Cashquote liegt unter 20 %. Rebalancing zum Wiederaufbau von Cash prüfen.';

  @override
  String get alertAnnouncementTitle => 'Ankündigungsbenachrichtigungen';

  @override
  String get alertAnnouncementSubtitle =>
      'Ankündigungen von QLD DIP ALERT als Push-Benachrichtigungen erhalten';

  @override
  String get alertDetailTitle => 'Alarmdetails';

  @override
  String get alertDetailOpenStrategy => 'Strategie öffnen';

  @override
  String get alertDetailRecovery =>
      'Die Rückgangszone hat sich verbessert. Prüfen Sie das Portfolio ruhig und vermeiden Sie impulsive Käufe oder Verkäufe.';

  @override
  String get alertDetailNewHigh =>
      'Nach der Installation wurde ein neues Hoch gespeichert. Es dient als neue Basis für künftige Rückgangsberechnungen.';

  @override
  String get alertDetailMarketOpen =>
      'Der reguläre US-Markt ist geöffnet. Prüfen Sie Preise nur, wenn Sie heute handeln wollten.';

  @override
  String get alertDetailNasdaq200Breakdown =>
      'Der Nasdaq 100 fiel unter die 200-Tage-Linie. Das kann auf schwächeren Trend hindeuten; prüfen Sie Risiko und Cash.';

  @override
  String get alertDetailNasdaq200Breakout =>
      'Der Nasdaq 100 stieg wieder über die 200-Tage-Linie. Das kann auf Verbesserung hindeuten, dennoch Strategie einhalten.';

  @override
  String get alertDetailPortfolioCashHigh =>
      'Die Cashquote liegt unter dem 20-%-Richtwert. Das bedeutet oft, dass Aktien gestiegen sind und der Cash-Puffer zu klein wurde. Prüfen Sie, ob Sie einen Teil der Position reduzieren und auf die geplante Cashquote rebalancieren.';

  @override
  String get alertDetailPortfolioCashLow =>
      'Die Cashquote liegt unter dem 20-%-Richtwert. Das bedeutet oft, dass Aktien gestiegen sind und der Cash-Puffer zu klein wurde. Prüfen Sie, ob Sie einen Teil der Position reduzieren und auf die geplante Cashquote rebalancieren.';

  @override
  String get alertDetailOpenLink => 'Link öffnen';

  @override
  String get appUpdateTitle => 'Update verfügbar';

  @override
  String get appUpdateMessage =>
      'Eine neue Version ist verfügbar. Aktualisieren Sie, um die neuesten Funktionen und Korrekturen zu nutzen.';

  @override
  String get appUpdateLater => 'Später';

  @override
  String get appUpdateNow => 'Aktualisieren';

  @override
  String get alertTestTitle => 'Benachrichtigungstest';

  @override
  String get alertPermissionHelpTitle => 'Keine Benachrichtigungen?';

  @override
  String get alertPermissionHelpBody =>
      'Wenn die Benachrichtigungsberechtigung des Geräts deaktiviert ist, werden Testbenachrichtigungen möglicherweise nicht angezeigt.';

  @override
  String get alertPermissionRequest => 'Berechtigung anfordern';

  @override
  String get alertPermissionOpenSettings => 'Einstellungen öffnen';

  @override
  String get holdPageTitle => 'Position halten';

  @override
  String get holdHeadline =>
      'Der geplante Kauf wurde ausgeführt. Konzentriere dich während der Erholung auf das Halten der Position.';

  @override
  String get holdPositionTitle => 'Aktuelle Position';

  @override
  String get holdPositionText =>
      'Halte die bereits gekauften QLD- und TQQQ-Positionen. Wiederhole einen früheren Zonenkauf nicht nur deshalb, weil der Kurs erneut eine bereits erholte Zone erreicht.';

  @override
  String get holdActionTitle => 'Aktuelle Handlung';

  @override
  String get holdActionText =>
      'Pausiere weitere TQQQ-Käufe und beobachte die Erholung. Bewahre verbleibendes Cash für einen erneuten Rückgang auf.';

  @override
  String get holdAvoidTitle => 'Vermeiden';

  @override
  String get holdAvoidText =>
      'Verkaufe nicht überstürzt wegen der Volatilität und kaufe nicht impulsiv nach, nur weil die Erholung sicher erscheint.';

  @override
  String get holdResetTitle => 'Strategie zurücksetzen';

  @override
  String get holdResetText =>
      'Wenn sich QLD vollständig bis zum vorherigen Hoch erholt, endet dieser Rückgangszyklus und die Strategie kehrt zur anfänglichen Kaufverbotsposition zurück.';

  @override
  String get rebalanceTitle => 'Rebalancing-Zone';

  @override
  String get rebalanceHeadline =>
      'TQQQ verkaufen und zur Basisposition zurückkehren';

  @override
  String get rebalanceOverviewTitle => 'Strategieübersicht';

  @override
  String get rebalanceOverviewText =>
      'Die Erholung auf ein Allzeithoch signalisiert das Ende der Krisenreaktionsphase. Jetzt ist es Zeit, das in den -20%-Zonen oder darunter angesammelte TQQQ zu verkaufen und zur Basisposition (QLD 70%, Cash 30%) zurückzukehren.';

  @override
  String get rebalanceActionTitle => 'Sofortmaßnahme';

  @override
  String get rebalanceActionText =>
      'Verkaufen Sie alle TQQQ, die in den -20%-Zonen oder darunter angesammelt oder gekauft wurden. Passen Sie dann Ihre Vermögenswerte gemäß der Basispositionsaufteilung an.';

  @override
  String get rebalanceCashTitle => 'Cash-Ziel';

  @override
  String get rebalanceCashText =>
      'Nach dem Rebalancing QLD 70% und Cash 30% halten. Das gesicherte Cash als Reserve für den nächsten Abschwung aufbewahren.';

  @override
  String get rebalanceAvoidTitle => 'Was zu vermeiden ist';

  @override
  String get rebalanceAvoidText =>
      'Setzen Sie die TQQQ-Akkumulation nach der Allzeithoch-Erholung nicht fort. Verkaufen Sie die in der Krisenphase angesammelten Positionen in dieser Phase und kehren Sie zur Basisposition zurück.';

  @override
  String get investmentCalculatorTitle => 'Rechner für erwartete Rendite';

  @override
  String get investmentCalculatorSubtitle =>
      'Einfache Zinseszinsrechnung auf Basis des QLD-Durchschnitts';

  @override
  String get investmentCalculatorReturnRate => '10-Jahres-Durchschnittsrendite';

  @override
  String get investmentCalculatorLumpSumTitle =>
      'Einmalanlage + Kauf bei Rücksetzern';

  @override
  String get investmentCalculatorAmount => 'Anlagebetrag';

  @override
  String get investmentCalculatorYears => 'Zeitraum';

  @override
  String get investmentCalculatorExpectedValue => 'Geschätzter Wert';

  @override
  String get investmentCalculatorPrincipalMultiple => 'Vielfaches des Kapitals';

  @override
  String get investmentCalculatorMonthlyTitle => 'Sparplan-Investition';

  @override
  String get investmentCalculatorMonthlyAmount => 'Monatsbetrag';

  @override
  String get investmentCalculatorTotalPrincipal => 'Gesamteinzahlung';

  @override
  String get investmentCalculatorExpectedProfit => 'Geschätzter Gewinn';

  @override
  String get investmentCalculatorDisclaimer =>
      'Dies ist eine einfache Berechnung auf Basis vergangener Renditen und garantiert keine zukünftigen Renditen.';

  @override
  String get investmentCalculatorYearsSuffix => 'J.';

  @override
  String get investmentCalculatorTimesSuffix => 'x';

  @override
  String get investmentCalculatorChartHint =>
      'Die durchschnittliche Rendite kann anhand des historischen Charts überprüft werden.';

  @override
  String get investmentCalculatorCurrencySectionTitle => 'Währungsumrechnung';

  @override
  String get investmentCalculatorCurrency => 'Land/Währung';

  @override
  String get investmentCalculatorExchangeRate => 'Kurs für 1 USD';

  @override
  String get investmentCalculatorExchangeRateHint =>
      'Gib ein, wie viel 1 USD in der gewählten Währung wert ist.';

  @override
  String get investmentCalculatorConvertedLumpSum =>
      'Umgerechneter Einmalanlagewert';

  @override
  String get investmentCalculatorConvertedMonthly =>
      'Umgerechneter Sparplanwert';

  @override
  String get investmentCurrencyUnitedStatesUsd => 'USA USD';

  @override
  String get investmentCurrencyKoreaKrw => 'Korea KRW';

  @override
  String get investmentCurrencyJapanJpy => 'Japan JPY';

  @override
  String get investmentCurrencyChinaCny => 'China CNY';

  @override
  String get investmentCurrencyTaiwanTwd => 'Taiwan TWD';

  @override
  String get investmentCurrencyGermanyEur => 'Deutschland EUR';

  @override
  String get investmentCurrencyFranceEur => 'Frankreich EUR';

  @override
  String get investmentCurrencySpainEur => 'Spanien EUR';

  @override
  String get investmentCurrencyPortugalEur => 'Portugal EUR';

  @override
  String get investmentCurrencyRussiaRub => 'Russland RUB';

  @override
  String get contentTitle => 'Inhalte';

  @override
  String get contentInquiry => 'Anfragen';

  @override
  String get contentInquirySubtitle =>
      'Anonyme Anfrage stellen und Antwort prüfen.';

  @override
  String get contentInquiryBadge => 'Q&A';

  @override
  String get contentCloseGuess => 'Schlusskurs raten';

  @override
  String get contentStockQuote => 'Boersenzitate';

  @override
  String get contentStockQuoteSubtitle =>
      'Kurze Zitate zum Schärfen des Investmentgespürs.';

  @override
  String get contentStockQuoteBadge => 'Täglich';

  @override
  String get contentNumberGuess => 'Zahl erraten';

  @override
  String get contentNumberGuessSubtitle =>
      'Leichtes Wahrscheinlichkeits-Minispiel.';

  @override
  String get contentNumberGuessBadge => 'Spiel';

  @override
  String get contentBookReader => 'Kolumne';

  @override
  String get contentBookReaderSubtitle =>
      'Texte aus dem öffentlichen Bereich zum ruhigen Lesen.';

  @override
  String get contentBookReaderBadge => 'Lesen';

  @override
  String get contentStockMeme => 'Aktien-Meme';

  @override
  String get contentLottoNumbers => 'Lottozahlen';

  @override
  String get contentJumpDodge => 'Sprung-Ausweichspiel';

  @override
  String get contentJumpDodgeSubtitle =>
      'Kurzes Sprung-Minispiel für konzentrierte Sessions.';

  @override
  String get contentJumpDodgeBadge => 'Aktion';

  @override
  String get stockQuoteTitle => 'Boersenzitate';

  @override
  String get stockQuoteTapHint => 'Tippen, um ein anderes Zitat zu sehen.';

  @override
  String get stockQuoteShuffle => 'Anderes Zitat';

  @override
  String get usageGuideTitle => 'App-Anleitung';

  @override
  String get usageGuideSubtitle =>
      'Regeln für eine langfristige Nasdaq-2x-Strategie';

  @override
  String get usageGuideCardTitle => 'App-Anleitung';

  @override
  String get usageGuideCardSubtitle =>
      'Basisposition, Rückgangszonen, Einträge, Indikatoren';

  @override
  String get usageGuideWhatAppTitle => 'Was ist diese App?';

  @override
  String get usageGuideWhatAppBody =>
      'Diese App ist ein regelbasierter Leitfaden für Anleger mit langfristigem Nasdaq-2x-Leverage.\n\nSie berechnet automatisch den aktuellen Rückgang vom Allzeithoch, damit Sie die aktuelle Position einschätzen können, und zeigt für jede Zone eine passende Strategie.\n\nSie hilft dabei, geplante Anlageprinzipien beizubehalten, ohne sich von Angst oder Gier am Markt treiben zu lassen.';

  @override
  String get usageGuideNoBuyTitle =>
      '1. Zuerst Basisposition und Strategie lesen';

  @override
  String get usageGuideNoBuyBody =>
      'Tippen Sie auf dem Startbildschirm auf die Basispositionskarte und lesen Sie, wie Sie sich vorbereiten. Lesen Sie außerdem den Strategie-Tab unten rechts.\n\n* Kaufen Sie QLD mit 70% Ihres gesamten Kapitals.';

  @override
  String get usageGuideStrategyTitle =>
      '2. Automatische Strategie je Rückgang prüfen';

  @override
  String get usageGuideStrategyBody =>
      'Die Strategiekarte auf dem Startbildschirm zeigt automatisch die passende Zone an, sobald QLD um einen bestimmten Prozentsatz unter das Allzeithoch fällt. Tippen Sie auf die Karte, um den entsprechenden Kauf oder das Rebalancing durchzuführen. Benachrichtigungen kommen ebenfalls, wenn die Bedingungen erfüllt sind.';

  @override
  String get usageGuideIndicatorsTitle => 'Vier Hilfsindikatoren';

  @override
  String get usageGuideIndicatorsBody =>
      'CNN F&G zeigt, ob die Marktstimmung eher Angst oder Gier ist.\n\nVIX zeigt die Marktvolatilität. Ein höherer Wert bedeutet meist mehr Unsicherheit.\n\nWichtige US-Termine sind NFP, CPI und FOMC. NFP steht für Beschäftigung, CPI für Inflation und FOMC für die Zinsrichtung. Diese Termine können Nasdaq und QLD stark bewegen.\n\nDie 10-jährige Rendite ist der Zinssatz der US-Staatsanleihe mit 10 Jahren Laufzeit. Ein schneller Anstieg kann Wachstumswerte, Nasdaq und QLD belasten.';

  @override
  String get usageGuideQldTitle => '3. Kaufen und im Portfolio erfassen';

  @override
  String get usageGuideQldBody =>
      'Nutzen Sie Strategie und Betrag als Orientierung, kaufen Sie bei Ihrem Broker und erfassen Sie danach Stückzahl, Durchschnittspreis und Cash im App-Portfolio.';

  @override
  String get usageGuideDisclaimer =>
      'Diese App dient nur als Investment-Referenz und garantiert keinen Gewinn.';

  @override
  String get usageGuideConfirm => 'OK';

  @override
  String get bookReadingTitle => 'Kolumne';

  @override
  String bookReaderPageNumber(int page) {
    return 'Seite $page';
  }

  @override
  String get numGuessPrompt => 'Raten Sie eine Zahl zwischen 1 und 10000.';

  @override
  String get numGuessInvalidInput =>
      'Bitte geben Sie eine Zahl zwischen 1 und 10000 ein.';

  @override
  String numGuessCorrect(int attempts) {
    return 'Richtig! Sie haben es in $attempts Versuchen erraten.';
  }

  @override
  String get numGuessTooLow => 'Die Zahl ist höher.';

  @override
  String get numGuessTooHigh => 'Die Zahl ist niedriger.';

  @override
  String numGuessAttemptsLabel(int count) {
    return 'Versuche: $count';
  }

  @override
  String numGuessLastGuessLabel(int number) {
    return 'Ihre Eingabe: $number';
  }

  @override
  String get numGuessInputHint => 'Zahl eingeben';

  @override
  String get numGuessConfirm => 'Bestätigen';

  @override
  String get numGuessNewGame => 'Neues Spiel';

  @override
  String get numGuessRanking => 'Rangliste';

  @override
  String get numGuessNoRecords => 'Noch keine Einträge.';

  @override
  String numGuessAttemptCount(int count) {
    return '$count Versuche';
  }

  @override
  String get jumpLeaderboard => 'Bestenliste';

  @override
  String get jumpScore => 'Punktzahl';

  @override
  String get jumpPersonalBest => 'Persönlicher Rekord';

  @override
  String get jumpTapToRestart => 'Tippen zum Neustart';

  @override
  String get jumpTapToStart => 'Tippen zum Starten';

  @override
  String get jumpInstruction =>
      'Tippen Sie, um zu springen und Hindernissen auszuweichen.';

  @override
  String get inquiryLoadError => 'Anfragen konnten nicht geladen werden.';

  @override
  String get inquiryAdminOnlyReply => 'Nur Admins können antworten.';

  @override
  String get inquiryReplyEmpty => 'Bitte geben Sie eine Antwort ein.';

  @override
  String get inquiryReplyError =>
      'Antwort konnte nicht übermittelt werden. Bitte später erneut versuchen.';

  @override
  String get inquiryAdminOnlyPin => 'Nur Admins können anheften.';

  @override
  String get inquiryPinError => 'Pin-Status konnte nicht gespeichert werden.';

  @override
  String get inquiryAdminOnlyDelete => 'Nur Admins können löschen.';

  @override
  String get inquiryDeleteTitle => 'Anfrage löschen';

  @override
  String get inquiryDeleteConfirm => 'Diese Anfrage löschen?';

  @override
  String get inquiryCancel => 'Abbrechen';

  @override
  String get inquiryDeleteAction => 'Löschen';

  @override
  String get inquiryDeleteError =>
      'Löschen fehlgeschlagen. Bitte später erneut versuchen.';

  @override
  String get inquiryContentEmpty => 'Bitte geben Sie Ihre Anfrage ein.';

  @override
  String get inquirySubmitError =>
      'Anfrage konnte nicht übermittelt werden. Bitte später erneut versuchen.';

  @override
  String get inquiryAdminLabel => 'Admin';

  @override
  String get inquiryPasswordLabel => 'Passwort';

  @override
  String get inquiryPasswordWrong => 'Falsches Passwort.';

  @override
  String get inquiryAdminActivatedRegistered =>
      'Admin-Modus aktiviert (Gerät registriert)';

  @override
  String get inquiryAdminActivatedFailed =>
      'Admin-Modus aktiviert (Geräteregistrierung fehlgeschlagen)';

  @override
  String get inquiryContentDetailLabel => 'Anfrage';

  @override
  String get inquiryAdminReplyLabel => 'Admin-Antwort';

  @override
  String get inquiryAdminReplyEdit => 'Antwort bearbeiten';

  @override
  String get inquirySaving => 'Speichern...';

  @override
  String get inquirySubmitReply => 'Antwort senden';

  @override
  String get inquiryPrevPage => 'Vorherige Seite';

  @override
  String get inquiryNextPage => 'Nächste Seite';

  @override
  String inquiryPageOf(int current, int total) {
    return 'Seite $current / $total';
  }

  @override
  String get inquiryUnpin => 'Anheftung aufheben';

  @override
  String get inquiryPin => 'Oben anheften';

  @override
  String get inquiryListTitle => 'Anfragenliste';

  @override
  String get inquiryEmpty => 'Noch keine Anfragen.';

  @override
  String get inquiryWriteTitle => 'Anfrage schreiben';

  @override
  String get inquiryContentFieldLabel => 'Inhalt';

  @override
  String get inquirySubmitting => 'Senden...';

  @override
  String get inquirySubmitButton => 'Senden';

  @override
  String get inquiryUserReplyLabel => 'Nachfolgenachricht hinzufügen...';

  @override
  String get indicatorCnnFearGreed => 'CNN Angst & Gier';

  @override
  String get indicatorVix => 'VIX Volatilität';

  @override
  String get indicatorUsSchedule => 'US-Wichtige Termine';

  @override
  String get indicatorTenYearYield => 'US 10J Rendite';

  @override
  String get indicatorUsMarketTime => 'US-Marktzeit';

  @override
  String get indicatorVixHigh => 'Hohe Volatilität';

  @override
  String get indicatorVixStable => 'Normale Zone';

  @override
  String get indicatorVixDefault => 'Marktangst-Indikator';

  @override
  String get indicatorVixLow => 'Sehr geringe Volatilität';

  @override
  String get indicatorVixCaution => 'Vorsichtszone';

  @override
  String get indicatorTenYearDesc => 'US 10J Anleihezins';

  @override
  String get marketWeekendLabel => 'Wochenende · Bis Öffnung';

  @override
  String get marketPreOpenLabel => 'Bis zur Eröffnung';

  @override
  String get marketToCloseLabel => 'Bis zum Schluss';

  @override
  String get marketClosedLabel => 'Markt geschlossen';

  @override
  String get marketClosedValue => 'Geschlossen';

  @override
  String get noData => 'Keine Daten';

  @override
  String get rsiOverbought => 'Überkauft';

  @override
  String get rsiOversold => 'Überverkauft';

  @override
  String get rsiNormal => 'Neutral';

  @override
  String get rsiOverboughtZone => 'Überkaufte Zone';

  @override
  String get rsiOversoldZone => 'Überverkaufte Zone';

  @override
  String get rsiNormalZone => 'Normaler Bereich';

  @override
  String get rsiOverboughtOversold => 'Überkauft / Überverkauft';

  @override
  String get coverStrategyTab => 'Strategie-Tab';

  @override
  String get coverStrategyHint =>
      'Nach oben wischen, um den Strategie-Tab anzuzeigen';

  @override
  String get usScheduleSheetTitle => 'US-Haupttermine';

  @override
  String get noScheduleLeft => 'Keine Termine vorhanden';

  @override
  String get scheduleNameHint => 'Veranstaltungsname';

  @override
  String get adminPassword => 'Admin-Passwort';

  @override
  String get addSchedule => 'Termin hinzufügen';

  @override
  String get wrongPassword => 'Falsches Passwort.';

  @override
  String get checkScheduleNameAndDate =>
      'Bitte Veranstaltungsname und Datum prüfen.';

  @override
  String get editSchedule => 'Termin bearbeiten';

  @override
  String get rsiDialogTitle => 'Was ist RSI(14)?';

  @override
  String get rsiDialogContent =>
      'Der RSI (Relative Strength Index) vergleicht Kursgewinne und -verluste der letzten 14 Tage und zeigt auf einer Skala von 0–100 an, ob der aktuelle Kurs überkauft oder überverkauft ist.\n\n• 70 oder mehr → Überkaufter Bereich\n  Hohe Wahrscheinlichkeit einer kurzfristigen Korrektur nach einem starken Anstieg.\n\n• 30 oder weniger → Überverkaufter Bereich\n  Mögliche Erholung nach einem starken kurzfristigen Rückgang.\n\n• 30–70 → Normaler Bereich\n  Kein Überkauft- oder Überverkauft-Signal.';

  @override
  String get inquiryEditMessageTitle => 'Nachricht bearbeiten';

  @override
  String get inquiryEditMessageSave => 'Speichern';

  @override
  String get inquiryTapToEdit => 'Zum Bearbeiten tippen';

  @override
  String get stockQuoteList =>
      'Sei ängstlich, wenn andere gierig sind, und gierig, wenn andere ängstlich sind. — Warren Buffett\nDer Preis ist das, was du zahlst. Der Wert ist das, was du bekommst. — Warren Buffett\nEs ist viel besser, ein wunderbares Unternehmen zu einem fairen Preis zu kaufen. — Warren Buffett\nInvestiere niemals in ein Unternehmen, das du nicht verstehst. — Warren Buffett\nRisiko entsteht, wenn man nicht weiß, was man tut. — Warren Buffett\nWenn du ein gutes Unternehmen kaufst, gilt: je länger du hältst, desto besser. — Warren Buffett\nEs braucht 20 Jahre, um einen Ruf aufzubauen, und fünf Minuten, um ihn zu ruinieren. — Warren Buffett\nMarktschwankungen sind keine Bedrohung, sondern eine Chance. — Warren Buffett\nErst wenn die Flut zurückgeht, sieht man, wer nackt geschwommen ist. — Warren Buffett\nDer Investor sollte sich darauf konzentrieren, große Fehler zu vermeiden, statt Homeruns zu jagen. — Warren Buffett\nBleibt man innerhalb seines Kompetenzkreises, werden Fehler weniger. — Warren Buffett\nAktien zu kaufen bedeutet, einen Teil eines Unternehmens zu kaufen, kein Stück Papier. — Warren Buffett\nKaufe nur etwas, das du auch dann gerne hältst, wenn der Markt 10 Jahre lang geschlossen wäre. — Warren Buffett\nBlicke auf die langfristige Ertragskraft des Unternehmens, nicht auf den kurzfristigen Kurs. — Warren Buffett\nEine exzellente Unternehmensstruktur ist meist wichtiger als exzellentes Management. — Warren Buffett\nWähle das Einfache und Sichere gegenüber dem Komplexen und Ungewissen. — Warren Buffett\nIn sich selbst zu investieren kann die beste Investition von allen sein. — Warren Buffett\nGeduldiges Urteilsvermögen, das standhält, übertrifft impulsives Trading. — Warren Buffett\nDu musst nicht jeden Pitch schlagen. Warte auf den richtigen. — Warren Buffett\nTemperament ist wichtiger als IQ beim Investieren. — Warren Buffett\nEin großes Unternehmen offenbart seinen Wert mehr mit der Zeit. — Warren Buffett\nEin gutes Unternehmen gut zu verstehen ist wichtiger, als es billig zu kaufen. — Warren Buffett\nBlicke auf den Cashflow des Unternehmens, nicht auf den Marktlärm. — Warren Buffett\nMit Schulden zu investieren macht auch gutes Urteilsvermögen gefährlich. — Warren Buffett\nBarmittel erlauben dir zu handeln, wenn eine Gelegenheit kommt. — Warren Buffett\nDas große Geld kommt nicht vom häufigen Trading, sondern von Geduld. — Charlie Munger\nInvestiere, investiere immer — vermeide törichte Fehler, statt zu versuchen, klug zu sein. — Charlie Munger\nWenn ein Problem schwer zu lösen ist, versuche rückwärts zu denken. — Charlie Munger\nRuf und Integrität können in einem Augenblick verschwinden. — Charlie Munger\nEin großes Unternehmen lange zu besitzen ist der Schlüssel zu Zinseszinsen. — Charlie Munger\nAnreize zu verstehen hilft, menschliches Verhalten zu verstehen. — Charlie Munger\nJe öfter du handelst, desto mehr Möglichkeiten schaffst du, Fehler zu machen. — Charlie Munger\nInvestieren erfordert die Fähigkeit zu warten. — Charlie Munger\nGutes Urteilsvermögen entsteht durch die Verbindung von Wissen aus vielen Bereichen. — Charlie Munger\nEin qualitatives Unternehmen macht die Zeit zu deinem Verbündeten als Investor. — Charlie Munger\nWenn Gelegenheiten selten sind, hat die vorbereitete Person einen Vorteil. — Charlie Munger\nVersuche jeden Tag etwas weniger dumm zu sein, statt etwas klüger. — Charlie Munger\nErfolg kommt vom Festhalten an Grundlagen, nicht von komplexen Formeln. — Charlie Munger\nGute Investitionen fühlen sich für Ungeduldige unbequem an. — Charlie Munger\nDu musst nicht aus jedem Fehler selbst lernen — lerne von den Fehlern anderer. — Charlie Munger\nAußergewöhnliche Ergebnisse kommen vom beherzten Handeln bei seltenen Gelegenheiten. — Charlie Munger\nHüte dich vor dem Fehler, selbst für ein großartiges Unternehmen zu viel zu zahlen. — Charlie Munger\nDie gefährlichsten Worte beim Investieren sind \'ich weiß es mehr oder weniger\'. — Charlie Munger\nEinfachheit zu bewahren hilft der langfristigen Leistung. — Charlie Munger\nUm den Markt zu schlagen, besiege zunächst deine eigenen Impulse. — Charlie Munger\nDie Sicherheitsmarge ist das Schutzschild des Investors. — Benjamin Graham\nKurzfristig ist der Markt eine Abstimmungsmaschine; langfristig eine Waage. — Benjamin Graham\nDer kluge Investor verkauft an Optimisten und kauft von Pessimisten. — Benjamin Graham\nPreisbewegungen sind Vorschläge, keine Befehle. — Benjamin Graham\nInvestition muss auf Analyse basieren; Spekulation hängt von Erwartungen ab. — Benjamin Graham\nLass dich nicht von den Stimmungen von Herrn Markt beherrschen — nutze sie. — Benjamin Graham\nDeutlich unter dem Wert zu kaufen ist, wie man sich auf eigene Fehler vorbereitet. — Benjamin Graham\nDas Prinzip, Verluste zu vermeiden, kommt vor dem Prinzip, Gewinne zu erzielen. — Benjamin Graham\nMärkte sind manchmal irrational, aber der Wert spiegelt sich schließlich wider. — Benjamin Graham\nJe unsicherer die Situation, desto größer muss die Sicherheitsmarge sein. — Benjamin Graham\nDer Investor muss den Wert vor dem Preis berechnen. — Benjamin Graham\nGute Analyse kommt aus Ruhe, nicht aus Emotionen. — Benjamin Graham\nDer defensive Investor vermeidet Selbstüberschätzung. — Benjamin Graham\nDie erwartete Rendite ohne Prinzipien nähert sich eher der Spekulation als der Investition. — Benjamin Graham\nDie Launen des Marktes können der Freund des langfristigen Investors werden. — Benjamin Graham\nBillig zu sein allein reicht nicht — man braucht Wert und Sicherheitsmarge. — Benjamin Graham\nVertraue Zahlen und Wert über die Emotionen der Masse. — Benjamin Graham\nDiejenigen, die zugeben, dass sie falsch liegen können, überleben länger. — Benjamin Graham\nDie erste Frage beim Investieren ist nicht wie viel kann ich gewinnen, sondern wie viel kann ich verlieren. — Benjamin Graham\nEine gute Investition ist eine Entscheidung, die durch ausreichende Analyse und ausreichende Sicherheitsmarge gestützt wird. — Benjamin Graham\nWeißt du, was du besitzt und warum du es besitzt. — Peter Lynch\nAktien sind keine Lotterielose — sie sind Teile eines Unternehmens. — Peter Lynch\nWenn ein Unternehmen gut läuft, wird die Aktie irgendwann folgen. — Peter Lynch\nInvestitionsideen kann man an Orten finden, die man bereits versteht. — Peter Lynch\nOhne Recherche zu investieren ist wie Poker zu spielen, ohne seine Karten anzuschauen. — Peter Lynch\nKursrückgänge wiederholen sich — die Frage ist, ob man sie aushalten kann. — Peter Lynch\nMut ist genauso wichtig wie Wissen an der Börse. — Peter Lynch\nSelbst eine gute Aktie muss neu bewertet werden, wenn sich ihre Geschichte ändert. — Peter Lynch\nNicht alle Aktien müssen erfolgreich sein — ein großer Gewinner kann ein Portfolio verwandeln. — Peter Lynch\nDie Geschichte des Unternehmens geht vor dem Aktienkurs. — Peter Lynch\nSelbst bei einem Unternehmen, das du gut kennst, überprüfe die Zahlen. — Peter Lynch\nStatt den Markt vorherzusagen, konzentriere dich darauf, große Unternehmen zu finden. — Peter Lynch\nEinzelne Investoren können großartige Unternehmen im Alltag entdecken. — Peter Lynch\nEin unpopuläres großartiges Unternehmen kann eine größere Chance bieten. — Peter Lynch\nWenn du nicht auf einen starken Kursrückgang vorbereitet bist, reduziere dein Aktienengagement. — Peter Lynch\nVerliebe dich nicht in eine Aktie — verfolge die Unternehmensleistung. — Peter Lynch\nDer größte Fehler ist so zu tun, als ob man wüsste, was man nicht weiß. — Peter Lynch\nEine gute Investitionsidee braucht keine komplexe Erklärung. — Peter Lynch\nGehe nicht davon aus, dass eine Aktie billig ist, nur weil der Kurs gefallen ist. — Peter Lynch\nBewerte eine Wachstumsaktie neu, wenn ihre Wachstumsgeschichte sich ändert. — Peter Lynch\nDie Gewinnformel beim Investieren lautet: breit halten und lange standhalten. — John Bogle\nHalte Kurs — ändere deinen Plan nicht wegen des Marktlärms. — John Bogle\nSuche nicht die Nadel im Heuhaufen. Kauf einfach den Heuhaufen. — John Bogle\nKosten sind eine sichere Bremse; Renditen sind ungewiss. — John Bogle\nZeit ist dein Freund, Impuls ist dein Feind. — John Bogle\nSpekulation wird von Emotionen geleitet; Investieren reduziert sie. — John Bogle\nLangfristige Investoren müssen den Markt nicht vorhersagen. — John Bogle\nNiedrige Kosten sind die mächtigste Variable, die ein Investor kontrollieren kann. — John Bogle\nDen gesamten Markt zu besitzen reduziert Einzelaktien-Fehler. — John Bogle\nDie Fähigkeit, nichts zu tun, ist der Wettbewerbsvorteil des Investors. — John Bogle\nEinfache Indexfonds überleben komplexe Produkte. — John Bogle\nRenditen zu jagen kann deine Renditen reduzieren. — John Bogle\nDu kannst die Zukunft nicht kennen, aber du kannst deine Kosten senken. — John Bogle\nDiversifikation, niedrige Kosten und langes Halten sind die Grundlagen. — John Bogle\nMit der Zeit spiegeln Märkte die Leistung der gesamten Wirtschaft wider. — John Bogle\nJe öfter du prüfst, desto mehr Gründe findest du, erschüttert zu werden. — John Bogle\nHalte deinen Investitionsplan mit Prinzipien aufrecht, nicht mit Emotionen. — John Bogle\nLangweiliges Investieren kann die solidesten Ergebnisse liefern. — John Bogle\nKonsequent den Marktdurchschnitt zu erzielen ist eine mächtige Strategie. — John Bogle\nKosten und Emotionen sind die größten Feinde des langfristigen Investierens. — John Bogle\nÜberlegenes Investieren beginnt damit, anders und tiefer als andere zu denken. — Howard Marks\nRisiko ist nicht Volatilität, sondern die Möglichkeit dauerhafter Verluste. — Howard Marks\nDu kannst Risiko nicht eliminieren, aber du kannst es managen. — Howard Marks\nJe höher der Preis, desto geringer die Sicherheitsmarge für künftige Renditen. — Howard Marks\nInvestoren, die Zyklen ignorieren, werden wiederholt überrascht. — Howard Marks\nSelbst ein großartiger Vermögenswert wird zu einer schlechten Investition, wenn er zu teuer gekauft wird. — Howard Marks\nBeim Investieren ist die Asymmetrie von Gewinnen und Verlusten wichtiger als die Häufigkeit richtiger Entscheidungen. — Howard Marks\nDie Verteidigung muss vorbereitet sein, bevor der Bärenmarkt kommt. — Howard Marks\nJe größer der Konsens, desto wichtiger ist es, anders zu denken. — Howard Marks\nGewinne entstehen, wenn man die Lücke zwischen Preis und Wert versteht. — Howard Marks\nErfolgreich investieren heißt, das Wahrscheinlichkeitsspiel gut zu spielen. — Howard Marks\nEine zu komfortable Umgebung lässt Risiko billig erscheinen. — Howard Marks\nDie Marktpsychologie kann Preise vom Wert entfernen. — Howard Marks\nKonservativ zu investieren bedeutet nicht, Chancen zu verpassen — es erhöht die Überlebenswahrscheinlichkeit. — Howard Marks\nRisikomanagement ist am nötigsten, wenn die Renditen gut sind. — Howard Marks\nZweitgradiges Denken ist die Fähigkeit, das, was alle sehen, anders zu interpretieren. — Howard Marks\nDie besten Käufe kommen selten in den bequemsten Momenten. — Howard Marks\nRisiko nicht zu sehen ist das größte Risiko. — Howard Marks\nWenn der Markt sich Extremen nähert, wird Vorsicht wichtiger. — Howard Marks\nInvestieren ist kein Spiel der Gewissheit, sondern der Wahrscheinlichkeit. — Howard Marks\nDer Moment maximalen Pessimismus ist der beste Zeitpunkt zum Kaufen. — John Templeton\nDer Moment maximalen Optimismus ist der beste Zeitpunkt zum Verkaufen. — John Templeton\nBullenmärkte werden im Pessimismus geboren, wachsen im Skeptizismus und reifen im Optimismus. — John Templeton\nWenn Euphorie den Markt beherrscht, wird der Bullenmarkt gefährlich. — John Templeton\nDie besten Gelegenheiten findet man dort, wo andere wegsehen. — John Templeton\nMut ist gefragt, um zu kaufen, wenn andere verkaufen. — John Templeton\nVier der gefährlichsten Wörter beim Investieren sind \'diesmal ist es anders\'. — John Templeton\nWo auch immer auf der Welt günstiger Wert zu finden ist, sollte man ihn finden können. — John Templeton\nPessimismus drückt Preise, und niedrigere Preise schaffen Chancen. — John Templeton\nUntersuche ruhig Vermögenswerte, die die Masse nicht mag. — John Templeton\nSei optimistisch, aber behalte einen kühlen Kopf bei den Preisen. — John Templeton\nGroße Gelegenheiten beginnen außerhalb der Aufmerksamkeit der Masse. — John Templeton\nDie schlechtesten Nachrichten bedeuten nicht immer die schlechteste Investition. — John Templeton\nWenn der Preis niedrig genug ist, kann selbst Unsicherheit belohnt werden. — John Templeton\nWer im Pessimismus kauft, muss bereit sein, im Optimismus zu verkaufen. — John Templeton\nMärkte machen ihre größten Fehler in den Extremen der Emotion. — John Templeton\nGelegenheiten kommen öfter aus unbequemen als aus bequemen Orten. — John Templeton\nGegen die Masse zu gehen erfordert sowohl Beweise als auch Mut. — John Templeton\nLangfristige Renditen können aus Entscheidungen entstehen, die im unbeliebtesten Moment getroffen wurden. — John Templeton\nDer Investor ist nicht jemand, der Angst vermeidet, sondern jemand, der sie analysiert. — John Templeton\nDas große Geld kam nicht vom Rechthaben, sondern davon, bis zum Ende durchzuhalten. — Jesse Livermore\nDer Markt hat nie Unrecht; Meinungen schon. — Jesse Livermore\nDer Drang, immer etwas zu tun, erzeugt viele Verluste. — Jesse Livermore\nVerluste müssen anerkannt werden, solange sie klein sind. — Jesse Livermore\nWenn der Trend lebt, gibt es keinen Grund, vorzeitig auszusteigen. — Jesse Livermore\nRecht zu haben, aber nicht standhalten zu können, bedeutet, das große Geld bleibt unerreichbar. — Jesse Livermore\nZu denken, man müsse jeden Tag Geld verdienen, ruiniert einen Trader. — Jesse Livermore\nZu einer Verlustposition hinzuzufügen ist eine gefährliche Gewohnheit. — Jesse Livermore\nVersuche nicht, mit dem Markt zu streiten — höre auf ihn. — Jesse Livermore\nEgo angesichts von Preisbewegungen wird zu Kosten. — Jesse Livermore\nWichtiger als das Wissen, wann man kauft, ist das Wissen, wann man falsch liegt. — Jesse Livermore\nGroße Trends belohnen diejenigen, die standhalten. — Jesse Livermore\nSelbst gutes Urteilsvermögen kann durch ungeduldige Liquidation zusammenbrechen. — Jesse Livermore\nMärkte kümmern sich nicht um individuelle Hoffnungen. — Jesse Livermore\nHäufiges Trading erzeugt mehr Fehler als Gelegenheiten. — Jesse Livermore\nDas große Geld kommt zu denen, die stillzusitzen wissen. — Jesse Livermore\nUm in der Spekulation zu überleben, begrenze zuerst deine Verluste. — Jesse Livermore\nIgnoriere nicht die Richtung, die der Preis anzeigt. — Jesse Livermore\nWichtiger als Überzeugung ist die Fähigkeit auszusteigen, wenn man falsch liegt. — Jesse Livermore\nSelbstdisziplin beim Trading ist genauso wichtig wie analytische Fähigkeit. — Jesse Livermore\nAktienmärkte bewegen sich durch Geld und Psychologie. — André Kostolany\nDer Herr geht langsam, der Hund läuft hin und her, aber sie kommen zusammen an. — André Kostolany\nEin Investor muss Geld, Ideen und Geduld haben. — André Kostolany\nDas Teuerste an der Börse ist die Ungeduld. — André Kostolany\nTrete einen Schritt zurück, wenn die Masse sich aufgeregt. — André Kostolany\nEin guter Investor liest die Stimmung des Marktes, folgt ihr aber nicht. — André Kostolany\nPreise werden durch Psychologie aufgewühlt, aber Wert braucht Zeit. — André Kostolany\nInvestieren braucht Vorstellungskraft, aber noch mehr Geduld. — André Kostolany\nWenn du mit geliehenem Geld investierst, wird Zeit zu deinem Feind. — André Kostolany\nAktien übertragen Geld von ungeduldigen zu geduldigen Menschen. — André Kostolany\nBessere Ergebnisse zu erwarten, indem man wie alle denkt, ist unrealistisch. — André Kostolany\nPsychologie bewegt den Markt an vielen Tagen vor der Logik. — André Kostolany\nOhne Warten zu investieren nähert sich der Spekulation. — André Kostolany\nEilige Investoren haben Mühe, die Launen des Marktes auszuhalten. — André Kostolany\nKursrückgänge sind schmerzhaft, aber auch die Sprache der Gelegenheit. — André Kostolany\nZu oft auf den Markt zu schauen stellt Emotion vor Denken. — André Kostolany\nGeduld ist das verborgene Kapital des Investors. — André Kostolany\nSelbst eine gute Idee kann ohne genügend Zeit scheitern. — André Kostolany\nDer Investor muss seinem eigenen Urteil vertrauen, nicht dem Applaus der Masse. — André Kostolany\nDiejenigen, die lange an Märkten überleben, lernen letztendlich am meisten. — André Kostolany\nSchmerz plus Reflexion ergibt Fortschritt. — Ray Dalio\nZuzugeben, was man nicht weiß, ist der Anfang des Risikomanagements. — Ray Dalio\nAssets mit geringer Korrelation zu mischen kann ein Portfolio stabiler machen. — Ray Dalio\nOhne Prinzipien treffen Emotionen in Krisen die Entscheidungen. — Ray Dalio\nDie Fähigkeit, die Realität so zu sehen, wie sie ist, ist der Ausgangspunkt guter Entscheidungsfindung. — Ray Dalio\nInvestoren brauchen überprüfbare Prinzipien, nicht bloße Überzeugung. — Ray Dalio\nDiversifikation verbirgt keine Unwissenheit — sie erkennt Unsicherheit an. — Ray Dalio\nKennst du deine Schwächen nicht, wird dir der Markt sie zeigen. — Ray Dalio\nEin gutes System wendet denselben Standard selbst in emotionalen Momenten an. — Ray Dalio\nDas Gesamtbild zu verstehen macht einen weniger anfällig für kurzfristigen Lärm. — Ray Dalio\nEs kommt nicht darauf an, ob man recht hat oder nicht, sondern wie viel man verdient, wenn man recht hat und wie viel man verliert, wenn man falsch liegt. — George Soros\nMärkte spiegeln nicht nur die Realität wider — sie beeinflussen sie auch. — George Soros\nDie Fähigkeit, schnell zuzugeben, dass man falsch liegt, ist eine mächtige Waffe. — George Soros\nErst überleben; dann Gewinne. — George Soros\nWenn die Überzeugung wächst, prüfe auch den Gegenfall. — George Soros\nMarktillusionen können lange bestehen. — George Soros\nGute Investoren korrigieren ihre Fehler schnell. — George Soros\nDie Gefahr liegt nicht darin, falsch zu liegen, sondern falsch zu bleiben. — George Soros\nJe größer die Gelegenheit, desto wichtiger wird das Positionsmanagement. — George Soros\nInvestieren bedeutet, Entscheidungen mit unvollständigen Informationen zu treffen. — George Soros\nVerteidigung vor Angriff. — Paul Tudor Jones\nZu einer Verlustposition hinzuzufügen schafft wachsende Gefahr. — Paul Tudor Jones\nBewahre Kapital und die nächste Gelegenheit kommt. — Paul Tudor Jones\nVersuche nicht, ein Held am Markt zu sein. — Paul Tudor Jones\nDie Fähigkeit, Verluste klein zu halten, erzeugt langfristige Renditen. — Paul Tudor Jones\nWenn sich der Preis gegen dich bewegt, reduziere zunächst das Risiko. — Paul Tudor Jones\nGroße Verluste zu vermeiden kommt vor der Suche nach großen Gewinnen. — Paul Tudor Jones\nEgo beim Trading vergrößert Verluste. — Paul Tudor Jones\nEine defensive Denkweise ist keine Schwäche — sie ist eine Überlebensstrategie. — Paul Tudor Jones\nAggressivität ohne Verlustmanagement hält nicht an. — Paul Tudor Jones\nVerluste zu schneiden, solange sie klein sind, ist die Regel. — William O\'Neil & Mark Minervini\nStarke Aktien sind aus einem Grund stark. — William O\'Neil & Mark Minervini\nKämpfe nicht gegen den Trend. — William O\'Neil & Mark Minervini\nCharts können Gefahrensignale schneller zeigen als Meinungen. — William O\'Neil & Mark Minervini\nUm große Gewinner zu erfassen, vermeide zunächst große Verlierer. — William O\'Neil & Mark Minervini\nOhne Regeln zu traden ist nur ein Protokoll von Emotionen. — William O\'Neil & Mark Minervini\nFinde Marktführer, aber begrenze das Risiko durch Zahlen. — William O\'Neil & Mark Minervini\nWichtiger als der Einstieg ist, was man tut, wenn man falsch liegt. — William O\'Neil & Mark Minervini\nSelbst ein guter Einstieg kann schlechte Stop-Loss-Gewohnheiten nicht überwinden. — William O\'Neil & Mark Minervini\nIn einem Bullenmarkt können die stärksten Aktien weiter stärker werden. — William O\'Neil & Mark Minervini\nDen gesamten Markt zu besitzen reduziert die Last der Vorhersage. — Burton Malkiel\nVersuche nicht, kurzfristige Bewegungen vorherzusagen, die fast zufällig sind. — Burton Malkiel\nNiedrige Kosten und breite Diversifikation sind Bereiche, die Investoren kontrollieren können. — Burton Malkiel\nLangfristiges Index-Investieren ist nicht glamourös, aber beständig. — Burton Malkiel\nEinfache Beteiligung übertrifft oft komplexe Vorhersage. — Burton Malkiel\nUnterschätze den Durchschnitt und du kannst darunter enden. — Burton Malkiel\nMarkt-Timing ist verlockend, aber selten erfolgreich. — Burton Malkiel\nInvestoren gewinnen zuerst durch Reduzierung sicherer Kosten. — Burton Malkiel\nEin diversifiziertes Portfolio ist eine realistische Antwort auf eine ungewisse Zukunft. — Burton Malkiel\nEine einfache Strategie wird mächtiger, wenn man sie beibehalten kann. — Burton Malkiel\nEin großartiges Unternehmen hat Wettbewerbstiefe jenseits seiner Erträge. — Philip Fisher\nBei der Bewertung von Wachstumsaktien schaue gemeinsam auf Management und Marktchance. — Philip Fisher\nEin großartiges Unternehmen offenbart seinen Wert, je länger man es hält. — Philip Fisher\nUm ein Unternehmen zu verstehen, befrage jede Stimme um es herum. — Philip Fisher\nVerkaufen kann eine schwierigere Entscheidung sein als Kaufen. — Philip Fisher\nLangfristige Wachstumsunternehmen geben Gründe, kurzfristige Volatilität auszuhalten. — Philip Fisher\nGutes Management schafft Wert, den Zahlen nicht zeigen. — Philip Fisher\nBlicke sowohl auf Wachstumspotenzial als auch auf den Preis zusammen. — Philip Fisher\nVerstehst du die Qualität eines Unternehmens nicht, wird langfristiges Halten instabil. — Philip Fisher\nEin großartiges Unternehmen macht Zeit zum Freund des Investors. — Philip Fisher\nDie Sicherheitsmarge ist die Sprache des Investors zur Anerkennung von Unsicherheit. — Seth Klarman\nValue-Investing blickt auf die Lücke zwischen Preis und Wert, nicht auf Popularität. — Seth Klarman\nRisiko kann genau dann wachsen, wenn andere fühlen, dass es nicht existiert. — Seth Klarman\nGeduld ist eines der wichtigsten Assets eines Value-Investors. — Seth Klarman\nSelbst ein niedriger Preis braucht einen Grund — überprüfe ihn. — Seth Klarman\nDie Disziplin, Verluste zu vermeiden, ist die Grundlage langfristiger Renditen. — Seth Klarman\nBarmittel können nötig sein, weil gute Gelegenheiten nicht oft kommen. — Seth Klarman\nInvestoren sollten ihrer eigenen Analyse vertrauen, nicht der Marktpopularität. — Seth Klarman\nJe größer die Lücke zwischen Wert und Preis, desto größer die Gelegenheit. — Seth Klarman\nÜberzeugung ohne Sicherheitsmarge ist gefährliche Überheblichkeit. — Seth Klarman\nDas Prinzip, großartige Unternehmen günstig zu kaufen, ist einfach, aber nicht leicht. — Joel Greenblatt\nWenn ein ertragreiches Unternehmen auf einen niedrigen Preis trifft, entsteht Gelegenheit. — Joel Greenblatt\nSelbst ein einfaches Prinzip scheitert, wenn man es nicht beibehalten kann. — Joel Greenblatt\nValue-Investing scheint langweilig, braucht aber Zeit. — Joel Greenblatt\nKurzfristige Irrationalität des Marktes schafft Gelegenheiten. — Joel Greenblatt\nEine gute Strategie muss für alle schwer zu befolgen sein, damit sie anhält. — Joel Greenblatt\nWenn der Preis unter dem Wert liegt, erscheint der Vorteil des Investors. — Joel Greenblatt\nBlicke sowohl auf Qualität als auch auf den Preis des Unternehmens zusammen. — Joel Greenblatt\nLangfristig sind Zahlen stärker als Geschichten. — Joel Greenblatt\nValue-Investing ist ohne Geduld schwer zu betreiben. — Joel Greenblatt\nSuche nach Situationen, wo Kopf viel gewinnst und Zahl wenig verlierst. — Mohnish Pabrai\nEinfache Ideen können große Renditen erzielen. — Mohnish Pabrai\nEin guter Investor weiß, wie man die Prinzipien großer Investoren reproduziert. — Mohnish Pabrai\nDie besten Investitionen begrenzen den Nachteil, während der Vorteil offen bleibt. — Mohnish Pabrai\nWarte auf klare statt auf komplexe Gelegenheiten. — Mohnish Pabrai\nInvestoren brauchen weniger Entscheidungen, aber bessere. — Mohnish Pabrai\nKonzentriere dich auf sichere Gelegenheiten, die selten kommen. — Mohnish Pabrai\nZunächst die Verlustwahrscheinlichkeit zu berechnen hilft, länger zu überleben. — Mohnish Pabrai\nEine gute Investition muss eine einfache Erklärung haben. — Mohnish Pabrai\nWarten ist Teil des Value-Investings. — Mohnish Pabrai\nLange mit einem großartigen Unternehmen zu reisen kann die mächtigste Strategie sein. — Nick Sleep\nInvestoren sollten Eigentümer sein, keine Trader. — Nick Sleep\nEine langfristige Perspektive ist für Wettbewerber schwer zu kopieren. — Nick Sleep\nEine gute Unternehmenskultur kapitalisiert sich wie Zinseszinsen mit der Zeit. — Nick Sleep\nEin Unternehmen, das langfristig an seine Kunden denkt, kann auch Investoren belohnen. — Nick Sleep\nEchtes langfristiges Investieren erträgt das Rauschen der Quartalsergebnisse. — Nick Sleep\nDer innere Wert eines großartigen Unternehmens baut sich langsam, aber mächtig auf. — Nick Sleep\nEine Eigentümermentalität reduziert den Impuls zum Trading. — Nick Sleep\nJe länger man hält, desto wichtiger wird die Qualität des Unternehmens. — Nick Sleep\nEin Unternehmen zu finden, mit dem man lange reisen kann, übertrifft häufiges Trading. — Nick Sleep\nVersuche nicht, ein fallendes Messer zu fangen. — Wall-Street-Weisheit\n\'Kauf das Gerücht, verkauf die Nachricht\' bedeutet Vorsicht vor der Massenpsychologie. — Wall-Street-Weisheit\nIn einem Bullenmarkt scheinen alle klug zu sein. — Wall-Street-Weisheit\nVerluste schnell schneiden; Gewinne laufen lassen. — Wall-Street-Weisheit\nMärkte sind kühler als Hoffnung. — Wall-Street-Weisheit\nDer Trend kann dein Freund sein, endet aber immer irgendwann. — Wall-Street-Weisheit\nLerne zuerst, kein Geld zu verlieren. — Wall-Street-Weisheit\nDiversifikation verhindert, dass ein einzelner Fehler fatal wird. — Wall-Street-Weisheit\nHebel komprimiert Zeit, komprimiert aber auch Fehler. — Wall-Street-Weisheit\nDer Markt bereitet immer die nächste Lektion vor. — Wall-Street-Weisheit\nGroße Investitionsgelegenheiten kommen nicht oft — sei bereit, wenn sie kommen. — Warren Buffett\nWenn du nicht bereit bist, eine Aktie lange zu halten, denke zweimal, bevor du sie kurz kaufst. — Warren Buffett\nDas Preisschild eines Unternehmens ändert sich täglich, aber seine Fundamentaldaten nicht. — Warren Buffett\nDie Fähigkeit, ein Geschäft zu verstehen, ist eine stärkere Waffe als komplexe Prognosen. — Warren Buffett\nEin großartiges Unternehmen reduziert die Fehler des Investors mit der Zeit. — Warren Buffett\nÖffentliche Angst wird zum Rabatt-Preisschild für den vorbereiteten Investor. — Warren Buffett\nGeduld beim Warten auf sichere Gelegenheiten übertrifft den Versuch, jede zu erfassen. — Warren Buffett\nInvestieren erfordert rationales Handeln, kein brillantes. — Warren Buffett\nSuche Unternehmen, die langfristig gewinnen können, nicht nur Aktien, die billig erscheinen. — Warren Buffett\nEin großartiges Unternehmen lange zu halten ist langweilig — und diese Langeweile wird zum Ergebnis. — Warren Buffett\nDer größte Vorteil beim Investieren ist zuzugeben, was man nicht weiß. — Charlie Munger\nHat man ein großartiges Unternehmen gefunden, hilft es, unnötige Aktionen zu reduzieren. — Charlie Munger\nGeduld kombiniert mit Wissen wird zu einem mächtigen Investitionswerkzeug. — Charlie Munger\nViele Fehler entstehen daraus, Komplexes nicht als Einfaches zu sehen. — Charlie Munger\nInvestoren sollten zunächst bedenken, warum sie falsch liegen könnten. — Charlie Munger\nDie besten Investoren sind vielleicht nicht diejenigen, die täglich traden, sondern diejenigen, die lange warten. — Charlie Munger\nInvestieren zeigt zuerst die Wege, die zu vermeiden sind. — Charlie Munger\nVon den Fehlern anderer zu lernen ist das günstigste Schulgeld. — Charlie Munger\nZinseszinsen verstärken sich, wenn ein großartiges Unternehmen auf einen langen Zeithorizont trifft. — Charlie Munger\nGutes Temperament übertrifft hohe Intelligenz bei Investitionsergebnissen. — Charlie Munger\nDie Lücke zwischen Wert und Preis nicht zu kennen treibt Investoren mit den Marktstimmungen mit. — Benjamin Graham\nDer Markt bietet jeden Tag Gelegenheiten, aber man muss ihnen nicht jeden Tag folgen. — Benjamin Graham\nDer Investor muss der Herr des Marktes sein, nicht sein Diener. — Benjamin Graham\nDie Sicherheitsmarge ist eine Versicherung gegen Unkenntnis der Zukunft. — Benjamin Graham\nEin Preisrückgang bedeutet nicht immer mehr Gefahr — zu viel zu zahlen ist das wahre Risiko. — Benjamin Graham\nÜberzeugung ohne Analyse verwandelt Investoren in Spekulanten. — Benjamin Graham\nPreisschwankungen testen die Emotionen des Investors; Wert verlangt seine Vernunft. — Benjamin Graham\nMarktpreise sind Fakten, aber nicht immer die Wahrheit. — Benjamin Graham\nGünstig genug zu kaufen ist ein realistischerer Schutz als die perfekte Zukunftsvorhersage. — Benjamin Graham\nDer kluge Investor findet die Sicherheitsmarge vor der Popularität. — Benjamin Graham\nBevor du eine Aktie kaufst, sei in der Lage zu erklären, wie dieses Unternehmen Geld verdient. — Peter Lynch\nGute Investitionsideen können näher am Alltag liegen, als man denkt. — Peter Lynch\nÜberprüfe, ob die Geschichte des Unternehmens noch gilt, nicht nur den Aktienkurs. — Peter Lynch\nBist du nicht vorbereitet, Kursrückgänge auszuhalten, wird es schwer, von Gewinnen zu profitieren. — Peter Lynch\nKenne die Gewinne und Aussichten des Unternehmens, nicht nur seinen Namen. — Peter Lynch\nVerbring Zeit damit, Unternehmen zu recherchieren, statt zu versuchen, den Markt vorherzusagen. — Peter Lynch\nBaue eine Struktur, sodass ein oder zwei Misserfolge nicht das gesamte Portfolio zerstören. — Peter Lynch\nGewinneraktien brauchen Zeit; Verliereraktien brauchen Neubewertung. — Peter Lynch\nEin Unternehmen zu kaufen, das man nicht versteht, bedeutet sein Geld der Geschichte eines anderen anzuvertrauen. — Peter Lynch\nAktien erfordern sowohl Zahlen als auch Geschichte zu prüfen. — Peter Lynch\nKonsequent gewöhnliche Marktrenditen zu erzielen ist nichts Gewöhnliches. — John Bogle\nInvestoren brauchen keine komplexen Prognosen, um die Renditen des gesamten Marktes zu erzielen. — John Bogle\nNiedrige Kosten stellen mit der Zeit mehr auf die Seite des Investors. — John Bogle\nNichts zu tun erscheint einfach, ist aber eigentlich die schwierigste Strategie. — John Bogle\nDie Stärke des Index-Investierens liegt in der Reduzierung unnötiger Auswahl, nicht in brillanter Selektion. — John Bogle\nLangfristige Investoren schauen auf Jahrzehnte von Zinseszinsen, nicht auf die Nachrichten eines Tages. — John Bogle\nDie Grundlage des Investierens ist nicht öfter richtig zu liegen — es ist eine Struktur zu bauen, die weniger leckt. — John Bogle\nKosten, Steuern und Emotionen zu reduzieren kann die langfristige Rendite verbessern. — John Bogle\nZeit im Markt übertrifft das Timing des Marktes. — John Bogle\nEin einfaches Portfolio ist selbst in einer Krise leichter zu schützen. — John Bogle\nEin guter Investor fragt nicht nur was zu kaufen ist, sondern zu welchem Preis. — Howard Marks\nWenn alle optimistisch sind, zweifle am Preis mehr als an den guten Nachrichten. — Howard Marks\nWenn alle Angst haben, untersuche den Preis statt die schlechten Nachrichten. — Howard Marks\nRisiko ist am gefährlichsten, wenn man es nicht sehen kann. — Howard Marks\nInvestoren sagen die Zukunft nicht vorher — sie machen Wahrscheinlichkeiten günstig. — Howard Marks\nAm Ende eines Zyklus treibt Psychologie die Preise vor der Logik. — Howard Marks\nVerwalte Risiko gut und die Gelegenheit zu profitieren kommt wieder. — Howard Marks\nWie alle zu denken macht es schwieriger, andere Ergebnisse zu erzielen. — Howard Marks\nDie besten Kaufgelegenheiten kommen oft zusammen mit den unbequemsten Nachrichten. — Howard Marks\nDer erfolgreiche Investor schätzt Unsicherheit, nicht Gewissheit. — Howard Marks\nSelbst im Herzen der Verzweiflung gibt es eine Gelegenheit, wenn der Preis niedrig genug ist. — John Templeton\nEin Markt, den alle mögen, kann schon zu viel Erwartung im Preis haben. — John Templeton\nPessimismus blendet Investoren, aber für Value-Investoren kann er eine Karte sein. — John Templeton\nDie größten Rabatte erscheinen dort, wo die Masse die Dinge weggeworfen hat. — John Templeton\nWenn Märkte feiern, berechne das Risiko vor den Gewinnen. — John Templeton\nDer unbeliebteste Markt kann manchmal der beste Ausgangspunkt sein. — John Templeton\nExtremaler Pessimismus kann Preise noch weiter unter den Wert drücken. — John Templeton\nEs gibt überall Gelegenheiten; der Blick der Masse ist immer begrenzt. — John Templeton\nIm Angst zu kaufen erfordert nicht nur Mut, sondern Analyse. — John Templeton\nAm Ende des Optimismus suche Sicherheitsmarge statt Erwartung. — John Templeton\nWenn du anfängst, gegen den Markt zu kämpfen, werden Verluste zum Preis des Egos. — Jesse Livermore\nWenn Signale sagen, dass du falsch liegst, steige aus, bevor der Stolz es tut. — Jesse Livermore\nIn einem großen Trend recht zu haben, aber zu früh auszusteigen, lässt das große Geld zurück. — Jesse Livermore\nDer Wunsch, täglich zu traden, täuscht Trader, den Markt für ihr Gehalt zu halten. — Jesse Livermore\nWenn der Preis nicht auf deiner Seite ist, reduziere das Risiko, bevor du nach Gründen suchst. — Jesse Livermore\nIn der Spekulation ist Hoffnung kein Plan. — Jesse Livermore\nBereinige eine schlechte Position, solange sie klein ist, um die nächste Gelegenheit zu sehen. — Jesse Livermore\nMärkte können sich länger bewegen als die Überzeugung eines Einzelnen. — Jesse Livermore\nSowohl die Fähigkeit stillzusitzen als auch die Fähigkeit auszusteigen sind notwendig. — Jesse Livermore\nFolge dem Trend, aber begrenze deine Verluste. — Jesse Livermore\nAktienkurse spiegeln manchmal Psychologie vor der Wirtschaft wider. — André Kostolany\nGeld ohne Geduld hat Mühe, an Märkten zu überleben. — André Kostolany\nMassen begeistern sich in der Regel spät und fürchten sich spät. — André Kostolany\nDer Markthund läuft voraus, kehrt aber immer zum Herren zurück. — André Kostolany\nSelbst eine gute Idee kann ohne Zeit keine gute Investition werden. — André Kostolany\nSchulden stehlen die Geduld des Investors. — André Kostolany\nAn Märkten brauchst du Zeit zum Standhalten vor Geld. — André Kostolany\nMassenemotionen schütteln Preise, können aber nicht für immer dominieren. — André Kostolany\nDer Investor muss jemand sein, der im Lärm die Richtung nicht verliert. — André Kostolany\nDie Börse braucht sowohl einen Taschenrechner als auch ein Psychologiebuch. — André Kostolany\nDiversifikation beginnt aus Demut, nicht aus Überzeugung. — Ray Dalio\nGute Prinzipien sind an schlechten Tagen nötiger als an guten. — Ray Dalio\nDeine Schwächen zu kennen macht dein Portfolio realistischer. — Ray Dalio\nIn einer unsicheren Welt setze nicht alles auf ein einziges Ergebnis. — Ray Dalio\nSelbst schmerzhafte Verluste werden, richtig reflektiert, zum Material für das nächste Urteil. — Ray Dalio\nVor dem Markt wisse, was für ein Mensch du bist. — Ray Dalio\nVerschiedene Risiken zu mischen ist die Fähigkeit, langfristig standzuhalten. — Ray Dalio\nEine Investition, die die Realität leugnet, wird schließlich von ihr korrigiert. — Ray Dalio\nGute Entscheidungsfindung hängt von Prinzipien und Feedback ab, nicht von Emotionen. — Ray Dalio\nInvestoren müssen oft Balance statt Überzeugung entwerfen. — Ray Dalio\nEin fehlerhaftes Urteil schnell zu korrigieren kann den Verlust als Schulgeld beenden. — George Soros\nMarktillusionen zu verstehen erlaubt es, gleichzeitig Gelegenheit und Gefahr zu sehen. — George Soros\nDie Positionsgröße ist genauso wichtig wie die Überzeugung. — George Soros\nDie Struktur, viel zu gewinnen wenn man recht hat und wenig zu verlieren wenn man falsch liegt, zählt. — George Soros\nInvestieren erfordert Fehlerkorrektur-Fähigkeit mehr als perfekte Vorhersage. — George Soros\nÜberlebende Investoren wissen, wie man seine Meinung ändert. — George Soros\nMärkte können durch die Überzeugungen der Teilnehmer noch mehr aufgewühlt werden. — George Soros\nSelbst starke Überzeugung ist ohne Verlustbegrenzungsregeln gefährlich. — George Soros\nDer Moment, in dem du erkennst, dass du falsch liegst, ist der wichtigste Moment. — George Soros\nMarktgelegenheiten tauchen oft innerhalb unvollständiger Informationen auf. — George Soros\nNur wer Kapital erhält, kann den nächsten Trend erfassen. — Paul Tudor Jones\nVerluste anzuerkennen, solange sie klein sind, ist die Gewohnheit des Profis. — Paul Tudor Jones\nRisiko zu reduzieren ist keine Angst — es ist Strategie. — Paul Tudor Jones\nHabe einen Verlustbegrenzungsplan bereit, bevor du einen Kaufgrund hast. — Paul Tudor Jones\nMärkte belohnen kein Ego. — Paul Tudor Jones\nGute Trader überleben zuerst, dann gewinnen sie. — Paul Tudor Jones\nInvestoren, die gut verteidigen, verpassen ihre Angriffschance nicht. — Paul Tudor Jones\nEine falsche Position lange zu halten ist Sturheit, keine Analyse. — Paul Tudor Jones\nRisiko zu kontrollieren bedeutet auch den eigenen Geist zu kontrollieren. — Paul Tudor Jones\nGroße Verluste zu vermeiden ist der Ausgangspunkt des Zinseszinses. — Paul Tudor Jones\nMarktführer zeigen nach einem Bärenmarkt oft zuerst Stärke. — William O\'Neil & Mark Minervini\nStop-Loss-Regeln müssen durch Zahlen festgelegt werden, nicht durch Emotionen. — William O\'Neil & Mark Minervini\nDen Trend zu ignorieren kann gute Analyse in Verluste verwandeln. — William O\'Neil & Mark Minervini\nUnterschätze starke Aktien nicht, nur weil sie teuer erscheinen. — William O\'Neil & Mark Minervini\nHalte nicht an schwachen Aktien fest, nur weil sie billig erscheinen. — William O\'Neil & Mark Minervini\nGute Trades kommen nicht davon, darauf zu bestehen, dass der Markt falsch liegt. — William O\'Neil & Mark Minervini\nRisiko-Ertrags-Verhältnis und Verlustobergrenzen können wichtiger sein als die Trefferquote. — William O\'Neil & Mark Minervini\nCharts garantieren nicht die Zukunft, können aber Warnsignale geben. — William O\'Neil & Mark Minervini\nStarke Rallyes haben Gründe; schwache Rebounds haben Grenzen. — William O\'Neil & Mark Minervini\nInvestoren, die Regeln befolgen, werden auf emotionalen Märkten weniger erschüttert. — William O\'Neil & Mark Minervini\nDen gesamten Markt zu besitzen reduziert die Last der Vorhersage. — Burton Malkiel\nBemühe dich nicht, kurzfristige Bewegungen vorherzusagen, die fast zufällig sind. — Burton Malkiel\nNiedrige Kosten und breite Diversifikation sind die Bereiche, die der Investor wirklich kontrolliert. — Burton Malkiel\nLangfristiges Index-Investieren ist nicht glamourös, aber beständig. — Burton Malkiel\nEinfache Beteiligung übertrifft oft komplexe Vorhersage. — Burton Malkiel\nUnterschätze den Durchschnitt und du kannst darunter enden. — Burton Malkiel\nDie Versuchung des Markt-Timings ist groß, aber die Erfolgsquote ist niedrig. — Burton Malkiel\nInvestoren gewinnen zuerst durch Reduzierung sicherer Kosten. — Burton Malkiel\nEin diversifiziertes Portfolio ist eine realistische Antwort auf eine ungewisse Zukunft. — Burton Malkiel\nEine einfache Strategie wird stärker, wenn man sie langfristig beibehalten kann. — Burton Malkiel\nGroße Unternehmen haben Wettbewerbstiefe jenseits ihrer Erträge. — Philip Fisher\nBei der Bewertung von Wachstumsunternehmen schaue auf Menschen neben Zahlen. — Philip Fisher\nDie Qualität eines Unternehmens kann mit der Zeit wichtiger sein als der Kurs seiner Aktien. — Philip Fisher\nGutes Management ist in schwierigen Zeiten sichtbarer. — Philip Fisher\nBei langfristigen Wachstumsaktien zählt die langfristige Richtung mehr als kurzfristige Enttäuschung. — Philip Fisher\nGründliche Recherche baut Überzeugung auf, und Überzeugung baut Geduld auf. — Philip Fisher\nEin großartiges Unternehmen zu früh zu verkaufen ist ein häufiger Fehler. — Philip Fisher\nNur auf Wachstum zu fokussieren und den Preis zu ignorieren kann ein großartiges Unternehmen zu einer schlechten Investition machen. — Philip Fisher\nUnternehmenskultur und F&E-Fähigkeiten können Samen des langfristigen Wachstums sein. — Philip Fisher\nHat man ein großartiges Unternehmen gefunden, schaue auf langfristige Wettbewerbsfähigkeit über kurzfristige Bewegungen. — Philip Fisher\nValue-Investoren müssen in unpopulären Preisen Komfort finden. — Seth Klarman\nDie Sicherheitsmarge drückt die Bescheidenheit des Investors in Zahlen aus. — Seth Klarman\nBarmittel sind kein untätiges Asset — sie sind Optionalität. — Seth Klarman\nInvestoren, die zuerst das Abwärtsrisiko sehen, können länger auf die Aufwärtschance warten. — Seth Klarman\nGünstige Assets haben Gründe — unterscheide Wert von Fallen. — Seth Klarman\nWert kann still dort akkumulieren, wo der Markt ignoriert. — Seth Klarman\nZu warten, wenn es keine sicheren Gelegenheiten gibt, ist auch eine Investitionsentscheidung. — Seth Klarman\nVerluste zu vermeiden ist keine Schüchternheit — so erhältst du Zinseszinsen. — Seth Klarman\nJe besser das Umfeld, desto mehr Sicherheitsmarge ist nötig. — Seth Klarman\nEine gute Investition muss ihre Verteidigung vom Kaufzeitpunkt an tragen. — Seth Klarman\nDass Märkte kurzfristig irrational sind, schafft langfristige Gelegenheiten. — Joel Greenblatt\nDas Prinzip, große Unternehmen günstig zu kaufen, ist einfach, aber schwer zu praktizieren. — Joel Greenblatt\nValue-Investing-Strategien müssen langweilige Perioden aushalten, um belohnt zu werden. — Joel Greenblatt\nHochqualitative Unternehmen zu niedrigen Preisen zu kaufen ist der Kern. — Joel Greenblatt\nSelbst eine gute Strategie braucht genug schmerzhafte Perioden, damit Menschen aufgeben — das macht sie dauerhaft. — Joel Greenblatt\nPreis und Qualität zusammen zu betrachten reduziert die Fehlermöglichkeit. — Joel Greenblatt\nMärkte bepreisen gelegentlich ein großartiges Unternehmen falsch. — Joel Greenblatt\nDisziplin, die durch kurzfristige Ergebnisse nicht erschüttert wird, vervollständigt die Strategie. — Joel Greenblatt\nEin günstiges und gutes Unternehmen übertrifft ein nur günstiges. — Joel Greenblatt\nWichtiger als die Formel ist die Entschlossenheit, ihr zu folgen. — Joel Greenblatt\nFinde Strukturen, wo der Nachteil klein und der Vorteil groß ist. — Mohnish Pabrai\nGute Investitionsideen müssen leicht zu verstehen sein, um lange standzuhalten. — Mohnish Pabrai\nWarten ist keine Zeit ohne Gelegenheit — es ist Zeit zur Auswahl von Gelegenheiten. — Mohnish Pabrai\nBewährte Prinzipien zu reproduzieren ist auch eine großartige Investitionsfähigkeit. — Mohnish Pabrai\nDer Reiz des Value-Investings ist eine Struktur, die wenig verliert und viel gewinnt. — Mohnish Pabrai\nKomplexe Investitionen haben mehr Stellen, wo sie schiefgehen können. — Mohnish Pabrai\nInvestoren brauchen einige gute Ideen, nicht viele. — Mohnish Pabrai\nSelbst bei Unsicherheit kann ein ausreichend niedriger Preis eine Gelegenheit schaffen. — Mohnish Pabrai\nGroße Gelegenheiten kommen nicht oft — habe in der Zwischenzeit Geduld. — Mohnish Pabrai\nEinfachheit beim Investieren ist eine Stärke, keine Schwäche. — Mohnish Pabrai\nEchtes langfristiges Investieren ist Zeit mit dem Unternehmen zu verbringen. — Nick Sleep\nEin großartiges Unternehmen kann sowohl für Kunden als auch für Investoren mit der Zeit Wert schaffen. — Nick Sleep\nDie Trading-Frequenz zu reduzieren klärt die Eigentümerperspektive. — Nick Sleep\nGute Unternehmenskultur taucht später als Jahresabschlüsse auf, hält aber länger. — Nick Sleep\nLangfristig zu halten bedeutet nicht, nur irgendein Unternehmen lange zu halten. — Nick Sleep\nWenn die Richtung des Unternehmens stimmt, liegen kurzfristige Bewegungen nahe am Lärm. — Nick Sleep\nUnternehmen, mit denen es sich lohnt, langfristig zu reisen, geben Hinweise darin, wie sie mit Kunden umgehen. — Nick Sleep\nGroße Unternehmen erweitern ihre Optionen mit der Zeit. — Nick Sleep\nKurzfristiges Trading lässt dich Preise sehen; langfristiges Halten lässt dich das Unternehmen sehen. — Nick Sleep\nInvestoren sollten den akkumulierten Wert des Unternehmens beobachten, nicht nur sein Preisschild. — Nick Sleep\nMärkte können länger schütteln, als du standhalten kannst. — Wall-Street-Weisheit\nWichtiger als günstig zu kaufen ist so zu kaufen, dass man halten kann. — Wall-Street-Weisheit\nSelbst die beste Strategie ist nicht gut, wenn man sie emotional nicht aufrechterhalten kann. — Wall-Street-Weisheit\nUm Gewinne wachsen zu lassen, stelle zunächst sicher, dass Verluste das Konto nicht ruinieren. — Wall-Street-Weisheit\nDer Marktlärm ist laut, aber das Konto zu schützen ist ein stilles Prinzip. — Wall-Street-Weisheit\nBarmittel sind Frustration für den Ungeduldigen und Gelegenheit für den Vorbereiteten. — Wall-Street-Weisheit\nWenn alle in dieselbe Richtung schauen, prüfe die Gefahr von der anderen Seite. — Wall-Street-Weisheit\nHebel kann dir schaden, wenn du die Richtung richtig triffst, aber den Zeitpunkt verfehlst. — Wall-Street-Weisheit\nDiversifikation kann große Treffer reduzieren, reduziert aber auch die Ruinwahrscheinlichkeit. — Wall-Street-Weisheit\nBärenmärkte testen den Geist des Investors vor dem Portfolio. — Wall-Street-Weisheit\nJe dringender die Nachricht, desto langsamer solltest du deine Bestellung aufgeben. — Wall-Street-Weisheit\nWer sein Konto länger hält, wird den nächsten Bullenmarkt sehen. — Wall-Street-Weisheit\nGewinne sind Möglichkeit; Verluste zu begrenzen ist Verantwortung. — Wall-Street-Weisheit\nBevor du kaufst, schreibe den schlimmsten Fall vor der erwarteten Rendite auf. — Wall-Street-Weisheit\nWahrscheinlichkeit passt besser zum Investieren als Gewissheit. — Wall-Street-Weisheit';

  @override
  String get intelligentInvestorBookTitle =>
      'Meine Sicht auf intelligentes Investieren';

  @override
  String get longFormBookTitle => 'Erinnerungen eines Börsenspekulanten';

  @override
  String get intelligentInvestorCh1Title => 'Kap1. Investieren vs. Spekulieren';

  @override
  String get intelligentInvestorCh2Title =>
      'Kap2. Warum die meisten Anleger scheitern';

  @override
  String get intelligentInvestorCh3Title => 'Kap3. Der Markt';

  @override
  String get intelligentInvestorCh4Title => 'Kap4. Sicherheitsmarge';

  @override
  String get intelligentInvestorCh5Title =>
      'Kap5. Herdenpsychologie und Investieren';

  @override
  String get intelligentInvestorCh6Title =>
      'Kap6. Warum Märkte langfristig steigen';

  @override
  String get intelligentInvestorCh7Title =>
      'Kap7. Lektionen aus der Dotcom-Blase';

  @override
  String get intelligentInvestorCh8Title =>
      'Kap8. Lektionen aus der Finanzkrise';

  @override
  String get intelligentInvestorCh9Title =>
      'Kap9. Lektionen aus dem COVID-Crash';

  @override
  String get intelligentInvestorCh10Title =>
      'Kap10. Die KI-Revolution und der heutige Markt';
}
