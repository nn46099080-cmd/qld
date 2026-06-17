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
  String get holdQLDPlusCash => 'QLD + 30% Cash halten';

  @override
  String get basePositionDescription =>
      '[ Strategieleitfaden ]\n\nDiese Strategie investiert nicht das gesamte Vermögen auf einmal in QLD.\n\nZu Beginn wird nur ein Teil des Vermögens investiert. Der Rest bleibt als Cashreserve verfügbar, um auf starke Marktrückgänge vorbereitet zu sein.\n\nDie Stärke einer Cashreserve\n\nCash wird nicht gehalten, um die Rendite zu erhöhen, sondern um auch in fallenden Märkten ruhig und diszipliniert zu bleiben.\n\nWichtiger als die höchstmögliche Rendite ist ein Anlagesystem, das den Zinseszinseffekt bis zum Ende fortsetzen kann.\n\nBeispiel:\n- Nur 70 % des Anfangsvermögens in QLD investieren\n- Die übrigen 30 % als Cash halten\n\nQLD ist ein ETF, der ungefähr die doppelte tägliche Bewegung des Nasdaq-100-Index abbildet.\n\nDaher gilt für die Ausgangsposition:\n2x Hebel × 70 % Investitionsquote = ungefähr 1,4x Gesamtmarktexposure.\n\nZum Beispiel:\n- Nasdaq +1 %\n→ Gesamtvermögen etwa +1,4 %\n\nBei einem starken Marktrückgang wird die Cashreserve schrittweise für zusätzliche Käufe eingesetzt.\n\nBeispiel:\n- Zusätzlicher Kauf im Bereich eines QLD-Rückgangs von etwa 40 %\n\nSo können zu niedrigeren Preisen mehr Anteile aufgebaut und bei einer Markterholung die durchschnittlichen Einstiegskosten deutlich gesenkt werden.\n\nDadurch kann diese Strategie in Erholungsphasen eine höhere Rendite erzielen als eine einfache Haltestrategie.\n\nDer Kern dieser Strategie ist:\n- In steigenden Märkten die Schwankungen mit Cash reduzieren\n- Bei starken Rückgängen mit Cash nachkaufen und die Durchschnittskosten senken.';

  @override
  String get buySignalMessage => 'Kaufsignale erscheinen hier.';

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
      'Mit fraktionalen TQQQ-Sparplan-Käufen beginnen';

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
      'Sehr kleine regelmäßige TQQQ-Teilkaufe starten. Keinen großen Betrag auf einmal einsetzen.';

  @override
  String get minus20BuyRuleTitle => 'Kaufregel';

  @override
  String get minus20BuyRuleText =>
      'Nur einen winzigen Teil des Cashbestands nutzen. Ziel ist der Rhythmus, nicht ein großer Einstieg.';

  @override
  String get minus20CashTitle => 'Cash-Management';

  @override
  String get minus20CashText =>
      'Der größte Teil des Cashs muss für -30 %, -40 % und -50 % verfügbar bleiben.';

  @override
  String get minus20AvoidTitle => 'Vermeiden';

  @override
  String get minus20AvoidText =>
      'TQQQ nicht aggressiv kaufen. -20 % ist noch eine frühe Phase.';

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
}
