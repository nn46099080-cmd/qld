// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'QLDアラート';

  @override
  String get menuThemeTitle => 'テーマ';

  @override
  String get menuLanguageTitle => '言語';

  @override
  String get menuThemeLight => 'ホワイト';

  @override
  String get menuThemeDark => 'ダーク';

  @override
  String get noBuyZone => '買付禁止ゾーン';

  @override
  String get tapToViewStrategy => '戦略を見る';

  @override
  String get buyNow => '今すぐ購入';

  @override
  String get buyingInProgress => '買付進行中';

  @override
  String get hold => '保有維持';

  @override
  String get navHome => 'ホーム';

  @override
  String get navChart => 'チャート';

  @override
  String get navExchange => '為替';

  @override
  String get navFearGreed => '恐怖';

  @override
  String get fearGreedTitle => '恐怖と強欲指数';

  @override
  String get fearGreedInlineLabel => 'CNN恐怖と強欲';

  @override
  String get fearGreedSubtitle => 'CNN米国市場センチメント';

  @override
  String get fearGreedUnavailable => '恐怖と強欲データを読み込めません。';

  @override
  String get navAlert => '通知';

  @override
  String get navStrategy => '戦略';

  @override
  String get alertRecovery10 => 'QLDが10%回復';

  @override
  String get alertMarketOpen => '米国市場が始まりました';

  @override
  String get alertNewHigh => '高値を更新しました';

  @override
  String get portfolio => 'ポートフォリオ';

  @override
  String get portfolioAssetInput => '資産入力';

  @override
  String get portfolioClose => '閉じる';

  @override
  String get exitAdDialogBack => '戻る';

  @override
  String get exitAdDialogExit => '終了';

  @override
  String get exitAdDialogMessage =>
      'アプリ終了時に、最大3時間に1回、全画面広告が表示される場合があります。広告収益はアプリの運営と機能改善に使用されます。ありがとうございます。';

  @override
  String get portfolioQldShares => 'QLD 数量';

  @override
  String get portfolioTqqqShares => 'TQQQ 数量';

  @override
  String get portfolioQldAveragePrice => 'QLD 平均取得単価';

  @override
  String get portfolioTqqqAveragePrice => 'TQQQ 平均取得単価';

  @override
  String get portfolioCashUsd => '現金 USD';

  @override
  String get portfolioTotal => '総資産';

  @override
  String get portfolioProfitLoss => '評価損益';

  @override
  String get portfolioSharesUnit => '株';

  @override
  String get portfolioReturnRate => '利益率';

  @override
  String get portfolioAveragePriceShort => '平均取得単価';

  @override
  String get portfolioPriceLoading => '価格を読み込み中';

  @override
  String get portfolioToBreakeven => '損益分岐まで';

  @override
  String get portfolioBreakevenCleared => '損益分岐を上回っています';

  @override
  String get basePosition => '基本ポジション';

  @override
  String get fromPreviousClose => '前日終値比';

  @override
  String get from10yHigh => '過去最高値比';

  @override
  String get holdQLDPlusCash => 'QLD 70% + 現金30%維持';

  @override
  String get basePositionDescription =>
      '[ 戦略ガイド ]\n\nこの戦略は、資産全体を一度にQLDへ投資するものではありません。\n\n初期段階では資産の一部だけを投資し、残りは現金として保有して大きな下落相場に備えます。\n\n現金を保有する力\n\n現金はリターンを高めるためではなく、下落相場でも動揺せず規律を守るための心の余裕です。\n\n最高のリターンより重要なのは、最後まで複利を続けられる投資システムです。\n\n例:\n- 初期資産の70%のみをQLDに投資\n- 残りの30%は現金で保有\n\nQLDはナスダック100指数のおよそ2倍の値動きを追跡するETFです。\n\nそのため初期状態では:\n2倍レバレッジ × 70%投資 = 約1.4倍程度の値動きになります。\n\nつまり:\n- ナスダック +1%\n→ 全体資産は約 +1.4%\n\n大きな下落相場が発生した場合、保有している現金を段階的な追加購入に使用します。\n\n例:\n- QLD -40%付近で追加購入\n\nこの場合、下がった価格でより多くの数量を確保でき、その後市場が回復したときに平均取得単価を大きく下げる効果があります。\n\nそのため、単純な保有戦略よりも回復局面で高いリターンが期待できます。\n\nこの戦略の核心は:\n- 上昇相場では現金比率で変動性を抑える\n- 大きな下落相場では現金で追加購入し、平均単価を下げることです。';

  @override
  String get basePositionIntro =>
      'すべてを一度に投資せず、QLDと現金を一緒に持つ基本戦略です。上昇相場では揺れを抑え、大きな下落相場では追加購入の余地を残します。';

  @override
  String get basePositionQldAllocationLabel => 'QLDの基本保有';

  @override
  String get basePositionCashAllocationLabel => '待機現金';

  @override
  String get basePositionCorePrinciple => '核心原則';

  @override
  String get basePositionCashTitle => '現金はリターンを下げるだけの資金ではありません';

  @override
  String get basePositionCashText => '大きな下落相場で規律を保ち、低い価格で追加購入するための安全余力です。';

  @override
  String get basePositionInitialLeverageTitle => '初期の値動きは約1.4倍';

  @override
  String get basePositionInitialLeverageText =>
      'QLDはナスダック100のおよそ2倍を追跡します。資産の70%だけをQLDに置くと、全体の値動きは約1.4倍に抑えられます。';

  @override
  String get basePositionStepLeverageTitle => '下落局面では倍率を段階的に高めます';

  @override
  String get basePositionStepLeverageText =>
      '-20%〜-30%の局面からTQQQを加えて平均取得単価を下げると、全体の値動きは約1.8倍まで上がります。最も深い下落局面では約2.3倍まで高まる可能性があります。';

  @override
  String get basePositionLowAverageTitle => '恐怖が強いほど低い平均単価を作ります';

  @override
  String get basePositionLowAverageText =>
      'このアプリは、下落が深まるほど待機現金でTQQQを段階的に追加購入する構造です。安値圏で数量を増やしておくことで、その後の大きな反発時にリターンを強く押し上げられます。';

  @override
  String get basePositionSummaryTitle => 'まとめ';

  @override
  String get basePositionSummaryText =>
      '目的は最高リターンを当てることではなく、下落相場でも計画を守り、複利を長く続けることです。';

  @override
  String get buySignalMessage => '買いシグナルはここに自動表示されます。';

  @override
  String get checkStrategyCard => '現在のゾーンの戦略カードを確認してください。';

  @override
  String get strategyCardLabel => '戦略カード';

  @override
  String get currentPrice => '現在価格';

  @override
  String get futuresLabel => '時間外';

  @override
  String get tenYearHigh => '過去最高値';

  @override
  String get buyStrategy => '買付戦略';

  @override
  String get noBuyZoneTitle => '買付禁止ゾーン';

  @override
  String get strategyOverview => '戦略概要';

  @override
  String get corePrinciple => '核心原則';

  @override
  String get suggestedAllocation => '推奨資産配分';

  @override
  String get riskManagement => 'リスク管理';

  @override
  String get actionGuide => '行動ガイド';

  @override
  String get marketStable =>
      'ナスダック市場は、米国の技術革新とグローバル成長企業を中心に、長期的な上昇トレンドを形成してきました。この成長性を基盤とするProShares Ultra QQQ (QLD) は、NASDAQ100指数の日次リターンを2倍で追跡するレバレッジETFであり、長期的な強気相場において高い資本効率が期待できる投資商品として評価されています。\n\nただし、レバレッジETFの特性上、市場下落局面ではボラティリティと損失リスクが大きく拡大する可能性があります。そのため、単純な保有戦略よりも、体系的なリスク管理が重要です。総資産の約30%を現金で維持しながら、急落局面で分割買いを行うことで、平均取得単価を下げ、長期複利リターンを最大化することが可能です。\n\nつまり、上昇相場ではレバレッジ効率を活用し、下落相場では十分な現金比率によって柔軟に対応することがQLD戦略の核心です。';

  @override
  String get noPanicSignals =>
      'ナスダック市場は単なる企業の集合体ではありません。継続的なリバランスと銘柄入れ替えメカニズムによって競争力を維持しています。成長性と収益性に優れた革新的企業は指数に組み入れられ、一方で競争力を失った企業は徐々に比率が縮小され、最終的には除外されます。\n\nこの構造により、資本は継続的に生産性と成長性の高い企業へ再配分され、市場全体の長期成長力が強化されます。米国の技術革新、グローバルプラットフォーム企業の拡大、そして継続的な流動性拡大環境に支えられ、ナスダックは世界の資本を吸収する代表的な成長市場となっています。\n\nつまり、ナスダックは単に上昇する市場ではなく、絶え間ないイノベーションと企業進化によって成長し続ける構造的な成長システムです。この特性により、技術進歩と通貨供給拡大の恩恵を受けながら、長期的な上昇可能性が高い市場として評価されています。';

  @override
  String get maintainBalanced =>
      'バランスの取れたポジションと十分な現金保有は、将来の市場調整時に柔軟な対応を可能にします。';

  @override
  String get cashReserveRule => '常に最低30%以上の現金を維持してください。';

  @override
  String get cashPsychology => '現金保有は心理的安定を提供し、将来の下落局面で継続的な買付を可能にします。';

  @override
  String get allocation1 => '• QLDのコアポジションを維持';

  @override
  String get allocation2 => '• 利益確定によって最低30%の現金を確保';

  @override
  String get allocation3 => '• 短期急騰への追随買いは禁止';

  @override
  String get allocation4 => '• 将来の買付機会に備える';

  @override
  String get risk1 => '強い上昇相場でも、いつでも急反転する可能性があります。';

  @override
  String get risk2 => '現金不足は市場調整時の対応力を低下させる可能性があります。';

  @override
  String get guide1 => '✅ 原則を維持';

  @override
  String get guide2 => '✅ 戦略的な現金保有';

  @override
  String get guide3 => '✅ 長期ポジション重視';

  @override
  String get guide4 => '❌ 感情的な過剰買付禁止';

  @override
  String get minus20Title => '-20%戦略';

  @override
  String get minus20Headline => '総現金の1%で週1回TQQQ積立開始';

  @override
  String get minus20OverviewTitle => '戦略概要';

  @override
  String get minus20OverviewText =>
      'このゾーンはQQQ基準で約10%の調整局面です。\n\nまだ下落幅は比較的小さいため、現金保有を優先する段階です。';

  @override
  String get minus20AllocationTitle => '推奨資産配分';

  @override
  String get minus20AllocationText =>
      '• 小さい比率で徐々に買い始める、または保有維持\n• 少量ずつ分割買いを進行\n• 初期段階での過剰エントリー禁止\n• より大きな下落に備えて現金維持';

  @override
  String get minus20HistoryTitle => '過去の回復データ';

  @override
  String get minus20HistoryText =>
      '• 平均回復期間：約1〜2か月\n• ナスダックは-20%調整後に反発したケースが多い\n• 大暴落と比較して心理的圧迫は比較的小さい';

  @override
  String get minus20RiskTitle => 'リスク警告';

  @override
  String get minus20RiskText =>
      '-20%以降もさらなる下落の可能性があります。\n\n初期段階での過剰エントリーは、急落時の資金不足リスクを高めます。';

  @override
  String get minus20GuideTitle => '行動ガイド';

  @override
  String get minus20GuideText =>
      '✅ ゆっくり始める\n✅ この段階で無理に買う必要はない\n✅ 十分な現金維持\n❌ 感情的な買付禁止';

  @override
  String get minus30Title => '-30%戦略';

  @override
  String get minus30Headline => '現金の20%でTQQQを購入';

  @override
  String get minus30OverviewTitle => '戦略概要';

  @override
  String get minus30OverviewText =>
      'このゾーンは高い機会を持つ分割買付エリアです。\n\n歴史的に、ナスダックの-30%調整は強力な長期買付機会となるケースが多くありました。\n\nこの段階では恐怖とボラティリティが大きく増加しますが、規律ある分割買いは長期リターン改善に役立つ可能性があります。';

  @override
  String get minus30AllocationTitle => '推奨資産配分';

  @override
  String get minus30AllocationText =>
      '• 利用可能な現金の約20%を投入\n• 段階的な積み立てを継続\n• 資金を急いで投入しすぎない\n• さらなる下落に備えて柔軟性を残す';

  @override
  String get minus30HistoryTitle => '過去の回復データ';

  @override
  String get minus30HistoryText =>
      '• 平均回復期間：約6か月〜1年以上\n• 歴史的に-30%調整後には強い反発が多かった\n• このゾーンではボラティリティと心理的圧迫が大きく増加';

  @override
  String get minus30RiskTitle => 'リスク警告';

  @override
  String get minus30RiskText =>
      '-30%以降も市場は高いボラティリティを維持する可能性があります。\n\n現金なしで過度に投入すると、心理的・財務的リスクが増加する可能性があります。';

  @override
  String get minus30GuideTitle => '行動ガイド';

  @override
  String get minus30GuideText =>
      '✅ 規律ある分割買付を維持\n✅ 感情コントロールを維持\n✅ 残り現金を保全\n❌ パニック買いと過度なレバレッジ禁止';

  @override
  String get minus40Title => '-40%戦略';

  @override
  String get minus40Headline => '現金30% - TQQQ買付エントリーゾーン';

  @override
  String get minus40OverviewTitle => '戦略概要';

  @override
  String get minus40OverviewText =>
      '-40%ゾーンは市場恐怖が極端に高まる局面ですが、長期投資家にとって重要な分割買付機会となる可能性があります。感情的な対応より、計画された戦略維持が重要です。';

  @override
  String get minus40AllocationTitle => '資金配分';

  @override
  String get minus40AllocationText =>
      '全資金を一度に投入せず、複数段階に分けてアプローチしてください。追加下落に備えて現金比率も維持する必要があります。';

  @override
  String get minus40HistoryTitle => '暴落の歴史';

  @override
  String get minus40HistoryText =>
      '過去の大規模暴落後も市場は長期的に回復してきました。極端な恐怖ゾーンは長期投資家にとって機会となる場合があります。';

  @override
  String get minus40RiskTitle => '心理的リスク';

  @override
  String get minus40RiskText =>
      '下落が深まるほど恐怖と不安も強まります。短期ニュースやボラティリティに振り回されず、事前に決めた原則を維持することが重要です。';

  @override
  String get minus40GuideTitle => '生存ガイド';

  @override
  String get minus40GuideText =>
      '短期反発予測より長期生存に集中してください。過度なレバレッジと感情的な全力投資を避け、一貫した分割戦略を維持しましょう。';

  @override
  String get minus50Title => '-50%戦略';

  @override
  String get minus50Headline => '保有現金すべてでTQQQ買付';

  @override
  String get minus50OverviewTitle => '残り現金すべてでTQQQ買付開始';

  @override
  String get minus50OverviewText =>
      '-50%水準は市場の極端な恐怖を意味します。多くの投資家がパニック状態に陥る時期であり、高いボラティリティが伴う可能性があります。';

  @override
  String get minus50AllocationTitle => '資金配分';

  @override
  String get minus50AllocationText =>
      '残り現金でTQQQを購入してください。その後は積立式の自動買付で平均取得単価を下げていきます。';

  @override
  String get minus50HistoryTitle => '暴落後';

  @override
  String get minus50HistoryText =>
      '歴史的に大暴落後、市場は時間をかけて回復してきました。ナスダックは長期的に成長する構造を持っています。恐怖ではなく機会として捉えるべきです。';

  @override
  String get minus50RiskTitle => '心理的圧迫';

  @override
  String get minus50RiskText => '心理的な圧迫ではなく、割安買付機会として認識する必要があります。';

  @override
  String get minus50GuideTitle => '生存戦略';

  @override
  String get minus50GuideText => 'TQQQを最大限買付し、その後は積立方式で平均取得単価を下げながら対応します。';

  @override
  String get exchangeUsdKrw => 'ドル/ウォン';

  @override
  String get exchangeUsdJpy => 'ドル/円';

  @override
  String get exchangeEurUsd => 'ユーロ/ドル';

  @override
  String get exchangeUsdRub => 'ドル/ルーブル';

  @override
  String get exchangeUsdTwd => 'ドル/台湾ドル';

  @override
  String get exchangeUsdCny => 'ドル/人民元';

  @override
  String get fearGreedExtremeFear => '極度の恐怖';

  @override
  String get fearGreedFear => '恐怖';

  @override
  String get fearGreedNeutral => '中立';

  @override
  String get fearGreedGreed => '強欲';

  @override
  String get fearGreedExtremeGreed => '極度の強欲';

  @override
  String get fearGreedIndicatorsTitle => '7つの恐怖と強欲指標';

  @override
  String get fearGreedFaqTitle => '恐怖と強欲指数の説明';

  @override
  String get fearGreedWhatTitle => 'CNNの恐怖と強欲指数とは？';

  @override
  String get fearGreedWhatBody =>
      '恐怖と強欲指数は、株式市場の心理や株価が妥当かどうかを測る指標です。過度な恐怖は株価を押し下げ、過度な強欲は株価を押し上げる傾向があります。';

  @override
  String get fearGreedCalculatedTitle => 'どのように計算されますか？';

  @override
  String get fearGreedCalculatedBody =>
      '市場モメンタム、株価の強さ、市場の広がり、プット/コールオプション、ジャンク債需要、ボラティリティ、安全資産需要の7項目を組み合わせます。各項目は同じ比重で0から100のスコアに反映されます。';

  @override
  String get fearGreedFrequencyTitle => 'どのくらいの頻度で更新されますか？';

  @override
  String get fearGreedFrequencyBody => '各構成要素と指数全体は、新しい市場データが利用可能になるたびに更新されます。';

  @override
  String get fearGreedUseTitle => 'どう使えばよいですか？';

  @override
  String get fearGreedUseBody =>
      '市場心理を確認する補助指標として使います。感情的な偏りに気づく助けになりますが、価格、ファンダメンタルズ、リスク管理、自分の戦略と合わせて判断してください。';

  @override
  String get strategyAdLabel => '広告';

  @override
  String get alertSettingsTitle => '通知設定';

  @override
  String get alertSettingsCloseBasisNote => '通知は終値を基準に送信されます。';

  @override
  String get alertHighTitle => '新高値通知';

  @override
  String get alertHighSubtitle => 'インストール後に新高値を更新したら通知';

  @override
  String get alertMarketOpenTitle => '市場開始通知';

  @override
  String get alertMarketOpenSubtitle => '米国通常市場が始まる時に1日1回通知';

  @override
  String get alertStrategySettingTitle => '戦略通知';

  @override
  String get alertStrategySettingSubtitle => '-20%、-30%、-40%、-50%ゾーンの変化を通知';

  @override
  String get noBuyHeadline => '追加買い禁止、現金30%を維持';

  @override
  String get noBuyActionTitle => 'すぐに行うこと';

  @override
  String get noBuyActionText => '新規のQLD/TQQQ買いは行いません。既存のQLD比率を維持し、現金30%を守ります。';

  @override
  String get noBuyCashTitle => '現金ルール';

  @override
  String get noBuyCashText => '現金は次の下落ゾーンのための予備資金です。上昇相場でも減らしません。';

  @override
  String get noBuyAvoidTitle => '避けること';

  @override
  String get noBuyAvoidText => '価格が上がっているからといって追い買いしません。-20%ゾーンまで待ちます。';

  @override
  String get noBuyNextTitle => '次の準備';

  @override
  String get noBuyNextText => '-20%に到達したら、TQQQの少額積立買いを始める準備をします。';

  @override
  String get minus20ActionTitle => 'すぐに行うこと';

  @override
  String get minus20ActionText =>
      '保有現金の1%ずつ、毎週TQQQを積立買いします。\n例）現金500ドル → 毎週5ドル購入';

  @override
  String get minus20BuyRuleTitle => '目的';

  @override
  String get minus20BuyRuleText =>
      '-20%ゾーンから始めることで、横ばいが続く場合でも少しずつ数量を増やし、TQQQの平均取得単価を下げるための設定です。すぐ利益を当てることではなく、低い平均単価を作ることが目的です。';

  @override
  String get minus20CashTitle => '現金管理';

  @override
  String get minus20CashText =>
      '大半の現金は-30%、-40%、-50%ゾーンに備えて残します。-50%で計画した現金を使い切った後も、新しい現金は週次積立で平均単価を下げ続けます。\n\n10週以上横ばいが続いても、毎週総現金の1%ずつ積立を続けます。横ばいが長引くほど数量が増え、積立を止める理由はありません。\n\n-30%ゾーンに到達したら、その時点で残っている現金の20%を一度に追加買い付けします。週次積立は止めずに-30%戦略と並行して続けます。積立の終了は前高値を回復してリバランスするときです。';

  @override
  String get minus20AvoidTitle => '整理基準';

  @override
  String get minus20AvoidText =>
      'このゾーンで集めたTQQQは短期反発のたびに売りません。後に新高値を更新し、TQQQを整理するタイミングで一緒に整理する戦略として扱います。';

  @override
  String get minus30ActionTitle => 'すぐに行うこと';

  @override
  String get minus30ActionText =>
      '利用可能な現金の20%だけをTQQQ購入に使います。注文前に現金総額を確認してください。';

  @override
  String get minus30BuyRuleTitle => '買いルール';

  @override
  String get minus30BuyRuleText =>
      '現金が\$10,000なら、TQQQには\$2,000だけを使い、残り80%を保全します。';

  @override
  String get minus30AdditionalTitle => '追加行動';

  @override
  String get minus30AdditionalText => 'QLDの積立は続けてもよいですが、TQQQの追加買いは次のゾーンまで待ちます。';

  @override
  String get minus30AvoidTitle => '避けること';

  @override
  String get minus30AvoidText => '反発を確信して現金を大きく使いません。-40%ゾーンが来る前提で動きます。';

  @override
  String get minus40ActionTitle => 'すぐに行うこと';

  @override
  String get minus40ActionText => '残り現金の30%をTQQQ買いに使います。-30%で使った金額は除いて計算します。';

  @override
  String get minus40BuyRuleTitle => '買いルール';

  @override
  String get minus40BuyRuleText =>
      '残り現金が\$8,000なら、\$2,400だけを使います。一度にすべて使わないことが重要です。';

  @override
  String get minus40HoldTitle => '保有ルール';

  @override
  String get minus40HoldText =>
      'QLDは維持し、TQQQは計画した比率までだけ増やします。さらに下がる前提で現金を残します。';

  @override
  String get minus40AvoidTitle => '避けること';

  @override
  String get minus40AvoidText => '恐怖で既存保有分を売りません。同時に欲で全額買いもしません。';

  @override
  String get minus50ActionTitle => 'すぐに行うこと';

  @override
  String get minus50ActionText =>
      '残っている現金すべてをTQQQ買いに使います。このゾーンは計画上の最後の現金投入段階です。';

  @override
  String get minus50BuyRuleTitle => '買いルール';

  @override
  String get minus50BuyRuleText => '-30%、-40%ですでに使った金額を除き、実際に残っている現金だけを基準にします。';

  @override
  String get minus50AfterTitle => 'その後';

  @override
  String get minus50AfterText =>
      '追加現金が入ったら、TQQQまたはQLDを定期的に積み立て、平均単価を下げることに集中します。';

  @override
  String get minus50AvoidTitle => '避けること';

  @override
  String get minus50AvoidText => '損失率だけを見て諦めません。ただし借金や短期生活資金で追加買いはしません。';

  @override
  String get alertNasdaq200Title => 'ナスダック100 200日線通知';

  @override
  String get alertNasdaq200Subtitle => 'ナスダック100が200日線を下抜け/上抜けしたら通知';

  @override
  String get alertNasdaq200Breakdown => 'ナスダック100が200日移動平均線を下抜けました';

  @override
  String get alertNasdaq200Breakout => 'ナスダック100が200日移動平均線を上抜けました';

  @override
  String get chartGuideTitle => 'チャートの見方';

  @override
  String get chartMiniTitle => '3か月チャートと20日・200日移動平均線';

  @override
  String get chartGuideCandleTitle => '3か月ローソク足';

  @override
  String get chartGuideCandleBody =>
      '直近3か月のQLDの値動きをひと目で示します。緑は上昇で終了、赤は下落で終了を意味します。';

  @override
  String get chartGuideMa200Title => '200日線';

  @override
  String get chartGuideMa200Body =>
      '長期トレンドを見る基準線です。価格が上なら強さ、下ならリスクと現金比率を確認します。';

  @override
  String get chartMa200SheetTitle => '200日移動平均線とは？';

  @override
  String get chartMa200SheetBody =>
      '200日移動平均線は、直近約200取引日の終値を平均して作る長期トレンドラインです。\n\n多くの投資家が参考にするのは、短期的なノイズをならし、市場の大きな方向を見やすくするためです。価格が200日線の上にある場合は長期トレンドが比較的強いと見られ、下にある場合は勢いの弱まりやリスク確認のサインとして扱われます。\n\nただし、単独で売買を決める指標ではありません。QLDのようなレバレッジETFでは、現金比率、下落率、平均取得単価、投資期間とあわせて確認する参考指標として使うのが適切です。';

  @override
  String get chartMa20SheetTitle => '20日移動平均線とは？';

  @override
  String get chartMa20SheetBody =>
      '20日移動平均線は、直近約20取引日の終値を平均して作る短期トレンドラインです。\n\n多くの投資家が見るのは、200日線より速く反応し、直近の勢いや短期的な流れを確認しやすいためです。価格が20日線の上にある状態が続くと短期的な強さ、何度も下回ると直近トレンドの弱まりとして見られます。\n\nQLDのような変動の大きいレバレッジETFでは、20日線は短期のスピードや過熱感を見る参考になります。ただしダマシも多いため、200日線、現金比率、買い増しゾーンとあわせて確認するのがよいです。';

  @override
  String get alertPortfolioCashTitle => '現金リバランス通知';

  @override
  String get alertPortfolioCashSubtitle => '株価上昇などで現金比率が20%以下になったら通知';

  @override
  String get alertPortfolioCashHigh => '現金比率が20%以下です。リバランスで現金確保を検討してください。';

  @override
  String get alertPortfolioCashLow => '現金比率が20%以下です。リバランスで現金確保を検討してください。';

  @override
  String get alertAnnouncementTitle => 'お知らせ通知';

  @override
  String get alertAnnouncementSubtitle =>
      'QLD DIP ALERTから送信されたお知らせをプッシュ通知で受け取る';

  @override
  String get alertDetailTitle => '通知詳細';

  @override
  String get alertDetailOpenStrategy => '戦略を見る';

  @override
  String get alertDetailRecovery =>
      '下落ゾーンが改善しました。ポートフォリオを落ち着いて確認し、急な売買は避けてください。';

  @override
  String get alertDetailNewHigh => 'インストール後の新高値が記録されました。今後の下落率計算の基準になります。';

  @override
  String get alertDetailMarketOpen =>
      '米国通常市場が始まりました。今日行動する予定がある場合だけ価格と戦略を確認してください。';

  @override
  String get alertDetailNasdaq200Breakdown =>
      'ナスダック100が200日移動平均線を下回りました。長期トレンドが弱まる可能性があるため、リスクと現金比率を確認してください。';

  @override
  String get alertDetailNasdaq200Breakout =>
      'ナスダック100が200日移動平均線を上回りました。改善の兆候かもしれませんが、計画した戦略を基準にしてください。';

  @override
  String get alertDetailPortfolioCashHigh =>
      '現金比率が20%を下回りました。株価上昇で保有株の比率が大きくなった可能性があります。一部を売却し、計画した現金比率までリバランスすることを検討してください。';

  @override
  String get alertDetailPortfolioCashLow =>
      '現金比率が20%を下回りました。株価上昇で保有株の比率が大きくなった可能性があります。一部を売却し、計画した現金比率までリバランスすることを検討してください。';

  @override
  String get alertDetailOpenLink => 'リンクを開く';

  @override
  String get appUpdateTitle => 'アップデートがあります';

  @override
  String get appUpdateMessage => '新しいバージョンがあります。最新機能と修正を利用するにはアップデートしてください。';

  @override
  String get appUpdateLater => '後で';

  @override
  String get appUpdateNow => '更新';

  @override
  String get alertTestTitle => '通知テスト';

  @override
  String get alertPermissionHelpTitle => '通知が届きませんか？';

  @override
  String get alertPermissionHelpBody => '端末の通知権限がオフの場合、テスト通知も表示されないことがあります。';

  @override
  String get alertPermissionRequest => '権限をリクエスト';

  @override
  String get alertPermissionOpenSettings => '設定を開く';

  @override
  String get holdPageTitle => '保有を継続';

  @override
  String get holdHeadline => '計画した購入は完了しました。回復局面では保有の継続に集中します。';

  @override
  String get holdPositionTitle => '現在の保有方針';

  @override
  String get holdPositionText =>
      'すでに購入したQLDとTQQQをそのまま保有します。価格が回復したゾーンに再び入っただけで、以前のゾーン購入を繰り返さないでください。';

  @override
  String get holdActionTitle => '現在の行動';

  @override
  String get holdActionText => 'TQQQの追加購入を停止し、回復の流れを観察します。再下落に備えて残りの現金を維持します。';

  @override
  String get holdAvoidTitle => '避ける行動';

  @override
  String get holdAvoidText => '変動性を理由に急いで売却したり、回復を確信して衝動的に追加購入したりしないでください。';

  @override
  String get holdResetTitle => '戦略のリセット';

  @override
  String get holdResetText =>
      'QLDが前回高値まで完全に回復すると、今回の下落サイクルは終了し、戦略は最初の購入禁止状態に戻ります。';

  @override
  String get rebalanceTitle => 'リバランスゾーン';

  @override
  String get rebalanceHeadline => 'TQQQを売却して基本ポジションに戻る';

  @override
  String get rebalanceOverviewTitle => '戦略概要';

  @override
  String get rebalanceOverviewText =>
      '過去最高値の回復は危機対応フェーズの終了を意味します。-20%以下のゾーンで積み立てたTQQQを売却し、基本ポジション（QLD 70%、現金 30%）に戻る段階です。';

  @override
  String get rebalanceActionTitle => '即時行動';

  @override
  String get rebalanceActionText =>
      '-20%以下のゾーンで積み立てまたは購入したTQQQをすべて売却します。その後、基本ポジションの配分に合わせて資産を調整します。';

  @override
  String get rebalanceCashTitle => '現金目標';

  @override
  String get rebalanceCashText =>
      'リバランス後はQLD 70%、現金 30%の比率を維持します。確保した現金は次の下落局面に備えた待機資金として保管します。';

  @override
  String get rebalanceAvoidTitle => '避けるべきこと';

  @override
  String get rebalanceAvoidText =>
      '過去最高値回復後もTQQQの積み立てを続けないでください。危機フェーズで積み立てたポジションはこの段階で売却し、基本ポジションに戻ります。';

  @override
  String get investmentCalculatorTitle => '予想リターン計算機';

  @override
  String get investmentCalculatorSubtitle => 'QLDの過去平均に基づく単純な複利計算';

  @override
  String get investmentCalculatorReturnRate => '10年平均リターン';

  @override
  String get investmentCalculatorLumpSumTitle => '一括投資＋押し目買い';

  @override
  String get investmentCalculatorAmount => '投資金額';

  @override
  String get investmentCalculatorYears => '期間';

  @override
  String get investmentCalculatorExpectedValue => '予想評価額';

  @override
  String get investmentCalculatorPrincipalMultiple => '元本比';

  @override
  String get investmentCalculatorMonthlyTitle => '積立投資';

  @override
  String get investmentCalculatorMonthlyAmount => '月額積立';

  @override
  String get investmentCalculatorTotalPrincipal => '総拠出額';

  @override
  String get investmentCalculatorExpectedProfit => '予想利益';

  @override
  String get investmentCalculatorDisclaimer =>
      '過去のリターンに基づく単純計算であり、将来のリターンを保証するものではありません。';

  @override
  String get investmentCalculatorYearsSuffix => '年';

  @override
  String get investmentCalculatorTimesSuffix => '倍';

  @override
  String get investmentCalculatorChartHint => '平均リターンは過去チャートで確認できます。';

  @override
  String get investmentCalculatorCurrencySectionTitle => '為替換算';

  @override
  String get investmentCalculatorCurrency => '国/通貨';

  @override
  String get investmentCalculatorExchangeRate => '1 USDの為替レート';

  @override
  String get investmentCalculatorExchangeRateHint =>
      '選択した通貨で1 USDがいくらかを直接入力してください。';

  @override
  String get investmentCalculatorConvertedLumpSum => '据置投資の最終金額';

  @override
  String get investmentCalculatorConvertedMonthly => '積立投資の最終金額';

  @override
  String get investmentCurrencyUnitedStatesUsd => '米国 USD';

  @override
  String get investmentCurrencyKoreaKrw => '韓国 KRW';

  @override
  String get investmentCurrencyJapanJpy => '日本 JPY';

  @override
  String get investmentCurrencyChinaCny => '中国 CNY';

  @override
  String get investmentCurrencyTaiwanTwd => '台湾 TWD';

  @override
  String get investmentCurrencyGermanyEur => 'ドイツ EUR';

  @override
  String get investmentCurrencyFranceEur => 'フランス EUR';

  @override
  String get investmentCurrencySpainEur => 'スペイン EUR';

  @override
  String get investmentCurrencyPortugalEur => 'ポルトガル EUR';

  @override
  String get investmentCurrencyRussiaRub => 'ロシア RUB';

  @override
  String get contentTitle => 'コンテンツ';

  @override
  String get contentInquiry => 'お問い合わせ';

  @override
  String get contentInquirySubtitle => '匿名でお問い合わせを送り、返答を確認します。';

  @override
  String get contentInquiryBadge => 'Q&A';

  @override
  String get contentCloseGuess => '終値予想';

  @override
  String get contentStockQuote => '今日の投資格言';

  @override
  String get contentStockQuoteSubtitle => '投資感覚を磨く短い名言を確認します。';

  @override
  String get contentStockQuoteBadge => '毎日';

  @override
  String get contentNumberGuess => '数字当て';

  @override
  String get contentNumberGuessSubtitle => '気軽に楽しめる確率型ミニゲームです。';

  @override
  String get contentNumberGuessBadge => 'ゲーム';

  @override
  String get contentBookReader => 'コラム';

  @override
  String get contentBookReaderSubtitle => 'ゆっくり読めるパブリックドメインのテキストです。';

  @override
  String get contentBookReaderBadge => '読書';

  @override
  String get contentStockMeme => '株式ミーム';

  @override
  String get contentLottoNumbers => 'ロト番号おすすめ';

  @override
  String get contentJumpDodge => 'ジャンプ回避ゲーム';

  @override
  String get contentJumpDodgeSubtitle => '短時間集中して楽しむジャンプミニゲームです。';

  @override
  String get contentJumpDodgeBadge => 'アクション';

  @override
  String get stockQuoteTitle => '今日の投資格言';

  @override
  String get stockQuoteTapHint => 'タップすると別の言葉が表示されます。';

  @override
  String get stockQuoteShuffle => '別の格言を見る';

  @override
  String get usageGuideTitle => 'アプリの使い方';

  @override
  String get usageGuideSubtitle => '長期Nasdaq 2倍レバレッジの行動ルール';

  @override
  String get usageGuideCardTitle => 'アプリの使い方';

  @override
  String get usageGuideCardSubtitle => '基本ポジション、下落ゾーン、購入記録、補助指標';

  @override
  String get usageGuideWhatAppTitle => 'このアプリは何ですか？';

  @override
  String get usageGuideWhatAppBody =>
      'このアプリは、長期的なNasdaq 2倍レバレッジ投資家のための行動ルール案内アプリです。\n\n過去最高値からの現在の下落率を自動計算し、今の位置を確認できるようにして、各ゾーンに合った投資戦略を提示します。\n\n市場の恐怖や欲に振り回されず、計画した投資原則を続けられるようにサポートします。';

  @override
  String get usageGuideNoBuyTitle => '1. 基本ポジションと戦略を先に読む';

  @override
  String get usageGuideNoBuyBody =>
      'まずメイン画面の「基本ポジションカード」をタップし、どのように準備するかを読んでください。右下の「戦略」タブでも詳しい戦略を確認します。\n\n※ 保有資金全体の70%でQLDを購入してください。';

  @override
  String get usageGuideStrategyTitle => '2. 下落ゾーン別の自動戦略を確認';

  @override
  String get usageGuideStrategyBody =>
      'メイン画面の「戦略カード」は、過去最高値から一定の%下落するたびに該当区間の戦略が自動表示されます。そのカードをタップして該当する買付やリバランスを行ってください。また、条件に合えば通知も届きます。';

  @override
  String get usageGuideIndicatorsTitle => '補助指標4つ';

  @override
  String get usageGuideIndicatorsBody =>
      'CNN F&Gは市場心理が恐怖寄りか欲張り寄りかを見る指標です。\n\nVIXは市場の不安度を見る変動性指標です。数値が高いほど市場不安が大きいと見られます。\n\n米国主要予定にはNFP、CPI、FOMCがあります。NFPは雇用、CPIは物価、FOMCは金利方針を確認する予定です。結果によってNasdaqとQLDが大きく動くことがあります。\n\n10年国債利回りは米国10年債の金利です。急上昇すると成長株、Nasdaq、QLDの負担になることがあります。';

  @override
  String get usageGuideQldTitle => '3. 購入後はポートフォリオに記録';

  @override
  String get usageGuideQldBody =>
      '表示された戦略と金額を参考に、自分が使う証券会社で直接購入します。購入後はアプリのポートフォリオに数量、平均単価、現金を記録します。';

  @override
  String get usageGuideDisclaimer => 'このアプリの内容は投資の参考用であり、利益を保証するものではありません。';

  @override
  String get usageGuideConfirm => 'OK';

  @override
  String get bookReadingTitle => 'コラム';

  @override
  String bookReaderPageNumber(int page) {
    return '$pageページ';
  }

  @override
  String get numGuessPrompt => '1から1000の数字を当ててください。';

  @override
  String get numGuessInvalidInput => '1から1000の数字を入力してください。';

  @override
  String numGuessCorrect(int attempts) {
    return '正解！$attempts回で当てました。';
  }

  @override
  String get numGuessTooLow => 'もっと大きい数字です。';

  @override
  String get numGuessTooHigh => 'もっと小さい数字です。';

  @override
  String numGuessAttemptsLabel(int count) {
    return '試行回数: $count';
  }

  @override
  String numGuessLastGuessLabel(int number) {
    return '入力値: $number';
  }

  @override
  String get numGuessInputHint => '数字を入力';

  @override
  String get numGuessConfirm => '確認';

  @override
  String get numGuessNewGame => '新しいゲーム';

  @override
  String get numGuessRanking => 'ランキング';

  @override
  String get numGuessNoRecords => 'まだ記録がありません。';

  @override
  String numGuessAttemptCount(int count) {
    return '$count回';
  }

  @override
  String get jumpLeaderboard => 'リーダーボード';

  @override
  String get jumpScore => 'スコア';

  @override
  String get jumpPersonalBest => '自己ベスト';

  @override
  String get jumpTapToRestart => 'タップして再開';

  @override
  String get jumpTapToStart => 'タップして開始';

  @override
  String get jumpInstruction => '画面をタップしてジャンプし、障害物を避けてください。';

  @override
  String get inquiryLoadError => 'お問い合わせの読み込みに失敗しました。';

  @override
  String get inquiryAdminOnlyReply => '管理者のみ返信できます。';

  @override
  String get inquiryReplyEmpty => '返信を入力してください。';

  @override
  String get inquiryReplyError => '返信の登録に失敗しました。しばらくしてから再試行してください。';

  @override
  String get inquiryAdminOnlyPin => '管理者のみ固定できます。';

  @override
  String get inquiryPinError => '固定状態の保存に失敗しました。';

  @override
  String get inquiryAdminOnlyDelete => '管理者のみ削除できます。';

  @override
  String get inquiryDeleteTitle => '問い合わせを削除';

  @override
  String get inquiryDeleteConfirm => 'この問い合わせを削除しますか？';

  @override
  String get inquiryCancel => 'キャンセル';

  @override
  String get inquiryDeleteAction => '削除';

  @override
  String get inquiryDeleteError => '削除に失敗しました。しばらくしてから再試行してください。';

  @override
  String get inquiryContentEmpty => 'お問い合わせ内容を入力してください。';

  @override
  String get inquirySubmitError => '問い合わせの登録に失敗しました。しばらくしてから再試行してください。';

  @override
  String get inquiryAdminLabel => '管理者';

  @override
  String get inquiryPasswordLabel => 'パスワード';

  @override
  String get inquiryPasswordWrong => 'パスワードが正しくありません。';

  @override
  String get inquiryAdminActivatedRegistered => '管理者モード有効 (デバイス登録済み)';

  @override
  String get inquiryAdminActivatedFailed => '管理者モード有効 (デバイス登録失敗)';

  @override
  String get inquiryContentDetailLabel => '問い合わせ内容';

  @override
  String get inquiryAdminReplyLabel => '管理者の返信';

  @override
  String get inquiryAdminReplyEdit => '返信を編集';

  @override
  String get inquirySaving => '保存中...';

  @override
  String get inquirySubmitReply => '返信を登録';

  @override
  String get inquiryPrevPage => '前のページ';

  @override
  String get inquiryNextPage => '次のページ';

  @override
  String inquiryPageOf(int current, int total) {
    return '$currentページ / $totalページ';
  }

  @override
  String get inquiryUnpin => '固定を解除';

  @override
  String get inquiryPin => '上部に固定';

  @override
  String get inquiryListTitle => 'お問い合わせ一覧';

  @override
  String get inquiryEmpty => 'まだ問い合わせがありません。';

  @override
  String get inquiryWriteTitle => '問い合わせを書く';

  @override
  String get inquiryContentFieldLabel => '内容';

  @override
  String get inquirySubmitting => '登録中...';

  @override
  String get inquirySubmitButton => '登録';

  @override
  String get inquiryUserReplyLabel => '追加メッセージを入力...';

  @override
  String get indicatorCnnFearGreed => 'CNN 恐怖貪欲';

  @override
  String get indicatorVix => 'VIX ボラティリティ';

  @override
  String get indicatorUsSchedule => '米国重要イベント';

  @override
  String get indicatorTenYearYield => '米国10年国債利回り';

  @override
  String get indicatorUsMarketTime => '米国市場残り時間';

  @override
  String get indicatorVixHigh => '高ボラティリティ圏';

  @override
  String get indicatorVixStable => '通常ゾーン';

  @override
  String get indicatorVixDefault => '市場不安心理指標';

  @override
  String get indicatorVixLow => '非常に低いボラティリティ';

  @override
  String get indicatorVixCaution => '注意ゾーン';

  @override
  String get indicatorTenYearDesc => '米国10年債金利';

  @override
  String get marketWeekendLabel => '週末休場・開場まで';

  @override
  String get marketPreOpenLabel => '開場まで';

  @override
  String get marketToCloseLabel => '引けまで';

  @override
  String get marketClosedLabel => '閉場';

  @override
  String get marketClosedValue => '休場中';

  @override
  String get noData => 'データなし';

  @override
  String get rsiOverbought => '過買い';

  @override
  String get rsiOversold => '過売り';

  @override
  String get rsiNormal => '中立';

  @override
  String get rsiOverboughtZone => '過買い圏';

  @override
  String get rsiOversoldZone => '過売り圏';

  @override
  String get rsiNormalZone => '正常範囲';

  @override
  String get rsiOverboughtOversold => '過買い / 過売り';

  @override
  String get coverStrategyTab => '戦略タブ';

  @override
  String get coverStrategyHint => '上にスワイプすると戦略タブが表示されます';

  @override
  String get usScheduleSheetTitle => '米国主要日程';

  @override
  String get noScheduleLeft => '登録された日程はありません';

  @override
  String get scheduleNameHint => 'イベント名';

  @override
  String get adminPassword => '管理者パスワード';

  @override
  String get addSchedule => '日程を追加';

  @override
  String get wrongPassword => 'パスワードが間違っています。';

  @override
  String get checkScheduleNameAndDate => 'イベント名と日付を確認してください。';

  @override
  String get editSchedule => '予定を編集';

  @override
  String get rsiDialogTitle => 'RSI(14)とは？';

  @override
  String get rsiDialogContent =>
      'RSI（相対力指数）は、過去14日間の値上がり幅と値下がり幅を比較し、現在の株価の過熱・低迷状態を0〜100で示す指標です。\n\n• 70以上 → 買われすぎゾーン\n  短期急騰により調整の可能性が高いです。\n\n• 30以下 → 売られすぎゾーン\n  短期急落により反発の可能性があります。\n\n• 30〜70 → 通常範囲\n  過熱・低迷のシグナルなし。';

  @override
  String get inquiryEditMessageTitle => 'メッセージを編集';

  @override
  String get inquiryEditMessageSave => '保存';

  @override
  String get inquiryTapToEdit => 'タップして編集';

  @override
  String get stockQuoteList =>
      '他人が強欲なときは慎重に、皆が恐れているときはチャンスを見よ。 — ウォーレン・バフェット\n価格は支払うもの、価値は得るものだ。 — ウォーレン・バフェット\n素晴らしい会社を適正価格で買う方が良い。 — ウォーレン・バフェット\n理解できない事業には投資するな。 — ウォーレン・バフェット\nリスクは自分が何をしているか分からないときに大きくなる。 — ウォーレン・バフェット\n良い企業を買ったなら、保有期間は長ければ長いほど良い。 — ウォーレン・バフェット\n評判を築くには長い年月がかかるが、失うのは一瞬だ。 — ウォーレン・バフェット\n市場の変動は敵ではなく機会となりうる。 — ウォーレン・バフェット\n潮が引いて初めて、誰が裸で泳いでいたかが分かる。 — ウォーレン・バフェット\n投資家はホームランより大きなミスを避けることに集中すべきだ。 — ウォーレン・バフェット\n能力の範囲内で動けばミスは減る。 — ウォーレン・バフェット\n株を買うとは紙切れではなく企業の一部を買うことだ。 — ウォーレン・バフェット\n市場が10年閉まっても保有できる銘柄だけ買え。 — ウォーレン・バフェット\n短期的な価格より企業の長期的な収益力を見よ。 — ウォーレン・バフェット\n優れた経営者より優れた事業構造の方が重要なことが多い。 — ウォーレン・バフェット\n複雑なものより単純で確実なものを選べ。 — ウォーレン・バフェット\n自分自身への投資が最良の投資かもしれない。 — ウォーレン・バフェット\n焦った売買より長く耐えられる判断が重要だ。 — ウォーレン・バフェット\nすべての球を打つ必要はない。良い球が来るまで待て。 — ウォーレン・バフェット\n投資はIQより気質の方が重要だ。 — ウォーレン・バフェット\n優れた企業は時間が経つほどその価値を現す。 — ウォーレン・バフェット\n安い価格より良い事業をきちんと理解することの方が重要だ。 — ウォーレン・バフェット\n市場のノイズより企業のキャッシュフローを見よ。 — ウォーレン・バフェット\n借金に頼る投資は良い判断も危険にする。 — ウォーレン・バフェット\n現金はチャンスが来たとき行動できるようにしてくれる。 — ウォーレン・バフェット\n大金は頻繁な売買からではなく待つことから生まれる。 — チャーリー・マンガー\n賢くなろうとするより愚かな行動を避けろ。 — チャーリー・マンガー\n問題が解きにくければ逆から考えてみよ。 — チャーリー・マンガー\n評判と誠実さは一瞬で消える財産だ。 — チャーリー・マンガー\n良い事業を長く保有することが複利の核心だ。 — チャーリー・マンガー\nインセンティブを理解すると人の行動をより理解できる。 — チャーリー・マンガー\n頻繁に動くほどミスをする機会も増える。 — チャーリー・マンガー\n投資は待つ能力を要求する。 — チャーリー・マンガー\n良い判断は複数の分野の知識を結びつけるときに生まれる。 — チャーリー・マンガー\n質の良い事業は時間を投資家の味方にする。 — チャーリー・マンガー\nチャンスがまれなら準備された人が有利だ。 — チャーリー・マンガー\n毎日賢くなるより毎日少し愚かさを減らせ。 — チャーリー・マンガー\n成功は複雑な公式よりも基本を守ることから来る。 — チャーリー・マンガー\n良い投資は忍耐のない人には不快に感じられる。 — チャーリー・マンガー\n世の中のすべてのミスを自分で経験する必要はない。他人のミスから学べ。 — チャーリー・マンガー\n卓越した結果はまれなチャンスに大きく行動するときに生まれる。 — チャーリー・マンガー\n良い事業を高く買うミスに注意せよ。 — チャーリー・マンガー\n投資で最も危険な言葉は「だいたい知っている」という錯覚だ。 — チャーリー・マンガー\n単純さを維持することが長期的な成果に役立つ。 — チャーリー・マンガー\n市場に勝つにはまず自分の衝動に勝たなければならない。 — チャーリー・マンガー\n安全マージンは投資家の盾だ。 — ベンジャミン・グレアム\n短期市場は人気投票だが、長期市場は体重計だ。 — ベンジャミン・グレアム\n賢明な投資家は楽観論者に売り、悲観論者から買う。 — ベンジャミン・グレアム\n価格変動は命令ではなく提案に過ぎない。 — ベンジャミン・グレアム\n投資は分析に基づき、投機は期待に依存する。 — ベンジャミン・グレアム\nミスター・マーケットの気分に振り回されず利用せよ。 — ベンジャミン・グレアム\n価値より十分安く買うことがミスに備える方法だ。 — ベンジャミン・グレアム\n損失を防ぐ原則が利益を生む原則より先だ。 — ベンジャミン・グレアム\n市場は時に非合理的だが、価値は最終的に反映される。 — ベンジャミン・グレアム\n不確実なほど安全マージンは大きくなければならない。 — ベンジャミン・グレアム\n投資家は価格より価値を先に計算すべきだ。 — ベンジャミン・グレアム\n良い分析は興奮より冷静さから生まれる。 — ベンジャミン・グレアム\n防御的な投資家は過度な自信を避ける。 — ベンジャミン・グレアム\n原則のない期待収益は投資より投機に近い。 — ベンジャミン・グレアム\n市場の気まぐれは長期投資家の友になりうる。 — ベンジャミン・グレアム\n安いだけでは十分ではない。価値と安全マージンが必要だ。 — ベンジャミン・グレアム\n大衆の感情より数字と価値を信じよ。 — ベンジャミン・グレアム\nミスの可能性を認める人が長く生き残る。 — ベンジャミン・グレアム\n投資での最初の問いはいくら稼げるかではなくいくら失えるかだ。 — ベンジャミン・グレアム\n良い投資とは十分な根拠と十分な安全マージンを共に持つ決断だ。 — ベンジャミン・グレアム\n何を保有し、なぜ保有しているか分かっていなければならない。 — ピーター・リンチ\n株は宝くじではなく企業の一部だ。 — ピーター・リンチ\n企業が好調なら長期的に株価もついてくる。 — ピーター・リンチ\n自分が理解するところで投資アイデアを見つけられる。 — ピーター・リンチ\n調査なしの投資は希望に近い。 — ピーター・リンチ\n下落相場は繰り返す。重要なのは耐えられるかどうかだ。 — ピーター・リンチ\n株式市場では度胸は知識と同じくらい重要だ。 — ピーター・リンチ\n良い銘柄もストーリーが変われば再点検すべきだ。 — ピーター・リンチ\nすべての銘柄が成功する必要はない。大きな勝者がポートフォリオを変える。 — ピーター・リンチ\n株価より企業のストーリーが先だ。 — ピーター・リンチ\nよく知る事業でも数字を確認すべきだ。 — ピーター・リンチ\n市場を当てようとするより良い会社を探すことに集中せよ。 — ピーター・リンチ\n個人投資家は日常生活の中で良い企業を先に発見できる。 — ピーター・リンチ\n人気のない良い企業がより大きなチャンスを与えることがある。 — ピーター・リンチ\n急落に耐える度胸がなければ株の比率を下げるべきだ。 — ピーター・リンチ\n銘柄を愛するな。企業の実績を確認せよ。 — ピーター・リンチ\n最大のミスは知らないことを知っているふりをすることだ。 — ピーター・リンチ\n良い投資アイデアは複雑な説明を必要としない。 — ピーター・リンチ\n株価が下がったという理由だけで安いと錯覚するな。 — ピーター・リンチ\n成長株はその成長ストーリーが崩れた瞬間に再点検すべきだ。 — ピーター・リンチ\n投資の勝利公式は幅広く保有して長く耐えることだ。 — ジョン・ボーグル\nコースを守れ。市場のノイズで計画を変えるな。 — ジョン・ボーグル\n干し草の山から針を探すな。干し草の山全体を買え。 — ジョン・ボーグル\nコストは確実な損失であり、リターンは不確実だ。 — ジョン・ボーグル\n時間は友であり、衝動は敵だ。 — ジョン・ボーグル\n投機は感情が先行し、投資は感情を減らす。 — ジョン・ボーグル\n長期投資家は市場を予測する必要がない。 — ジョン・ボーグル\n低コストは投資家がコントロールできる最も強力な変数だ。 — ジョン・ボーグル\n市場全体を保有すれば個別銘柄のミスを減らせる。 — ジョン・ボーグル\n何もしない能力は投資家の競争力だ。 — ジョン・ボーグル\n複雑な商品より単純なインデックスの方が長く生き残る。 — ジョン・ボーグル\nリターンを追う行動がリターンを下げることがある。 — ジョン・ボーグル\n投資家は未来を知ることはできないがコストは下げられる。 — ジョン・ボーグル\n分散と低コスト、長期保有が基本だ。 — ジョン・ボーグル\n市場は長期的に企業全体の成果を反映する。 — ジョン・ボーグル\n頻繁に確認するほど動揺する理由が増える。 — ジョン・ボーグル\n投資計画は感情ではなく原則で維持すべきだ。 — ジョン・ボーグル\n退屈な投資が最も強い結果を生みうる。 — ジョン・ボーグル\n市場平均を継続して得ることも強い戦略だ。 — ジョン・ボーグル\n長期投資での最大の敵はコストと感情だ。 — ジョン・ボーグル\n優れた投資は他と違う、より深く考えることから始まる。 — ハワード・マークス\nリスクは変動性ではなく永久損失の可能性に近い。 — ハワード・マークス\nリスクをなくすことはできないが、コントロールはできる。 — ハワード・マークス\n価格が高いほど将来リターンの安全マージンは縮まる。 — ハワード・マークス\nサイクルを無視する投資家は繰り返し驚かされる。 — ハワード・マークス\n良い資産も高く買いすぎれば悪い投資になる。 — ハワード・マークス\n投資で重要なのは正解の頻度より損益の非対称性だ。 — ハワード・マークス\n防御は弱気相場が来る前に準備すべきだ。 — ハワード・マークス\n大衆が確信するほど反対に考える必要が増す。 — ハワード・マークス\n利益は価格と価値の差を理解するときに生まれる。 — ハワード・マークス\n成功した投資は確率ゲームをうまくやることだ。 — ハワード・マークス\n良すぎる雰囲気はリスクを安く見せる。 — ハワード・マークス\n市場心理は価格を価値から遠ざけることがある。 — ハワード・マークス\n保守的な投資はチャンスをあきらめることではなく生存確率を高めることだ。 — ハワード・マークス\nリスク管理はリターンが良いときに最も必要だ。 — ハワード・マークス\n二次的思考は皆が見るものを違う視点で解釈する能力だ。 — ハワード・マークス\n最良の買いは大抵最も安心できる瞬間には来ない。 — ハワード・マークス\nリスクを認識できないことが最大のリスクだ。 — ハワード・マークス\n市場が極端に近づくほど慎重さはより重要になる。 — ハワード・マークス\n投資は確実性のゲームではなく確率のゲームだ。 — ハワード・マークス\n最大の悲観の時期が最良の買い時になりうる。 — ジョン・テンプルトン\n最大の楽観の時期は売りを考えるときだ。 — ジョン・テンプルトン\n強気相場は悲観から生まれ、懐疑の中で育ち、楽観の中で成熟する。 — ジョン・テンプルトン\n歓喜が市場を支配するとき、強気相場は危険になる。 — ジョン・テンプルトン\n最良のチャンスは人々が外面するところにある。 — ジョン・テンプルトン\n他が売るときに買える勇気が必要だ。 — ジョン・テンプルトン\n「今回は違う」という言葉は大抵最も危険だ。 — ジョン・テンプルトン\n世界のどこにでも安い価値があれば探せるようにすべきだ。 — ジョン・テンプルトン\n悲観論は価格を下げ、低い価格はチャンスを生む。 — ジョン・テンプルトン\n群衆が嫌う資産を落ち着いて調べよ。 — ジョン・テンプルトン\n投資家は楽観主義者であっても価格には冷静であるべきだ。 — ジョン・テンプルトン\n偉大なチャンスは大衆の関心外から始まる。 — ジョン・テンプルトン\n最悪のニュースが常に最悪の投資を意味するわけではない。 — ジョン・テンプルトン\n価格が十分低ければ不確実性も報われうる。 — ジョン・テンプルトン\n悲観の中で買った人は楽観の中で売る準備をすべきだ。 — ジョン・テンプルトン\n市場は感情の極端で最大のミスを犯す。 — ジョン・テンプルトン\nチャンスは安心できる場所より不快な場所からよく来る。 — ジョン・テンプルトン\n群衆と反対に行くには根拠と勇気が共に必要だ。 — ジョン・テンプルトン\n長期リターンは最も不人気な瞬間の判断から始まりうる。 — ジョン・テンプルトン\n投資家は恐怖を避ける人ではなく恐怖を分析する人だ。 — ジョン・テンプルトン\n大金は当てることより最後まで耐えることから来た。 — ジェシー・リバモア\n市場は間違わない。意見が間違うだけだ。 — ジェシー・リバモア\n常に行動しようとする欲求が多くの損失を生む。 — ジェシー・リバモア\n損失は小さいうちに認めなければならない。 — ジェシー・リバモア\nトレンドが生きているなら急いで降りる必要はない。 — ジェシー・リバモア\n正しくても耐えられなければ大金は稼ぎにくい。 — ジェシー・リバモア\n毎日稼がなければならないという考えがトレーダーを駄目にする。 — ジェシー・リバモア\n損失ポジションに追加投資するのは危険な習慣だ。 — ジェシー・リバモア\n市場を説得しようとせず、市場の言葉を聞け。 — ジェシー・リバモア\n価格動向の前で自尊心はコストになる。 — ジェシー・リバモア\n買いより重要なのはいつ間違ったか知ることだ。 — ジェシー・リバモア\n大きなトレンドは耐えた人に報酬を与える。 — ジェシー・リバモア\n良い判断も焦った清算で崩れることがある。 — ジェシー・リバモア\n市場は個人の希望を気にしない。 — ジェシー・リバモア\n頻繁な売買はチャンスよりミスを多く生む。 — ジェシー・リバモア\n大金は静かに座っていられる人のところへ行く。 — ジェシー・リバモア\n投機で生き残るにはまず損失を制限しなければならない。 — ジェシー・リバモア\n価格が示す方向を無視するな。 — ジェシー・リバモア\n確信より重要なのは間違ったときに抜け出す能力だ。 — ジェシー・リバモア\nトレーディングでの自制心は分析力と同じくらい重要だ。 — ジェシー・リバモア\n株式市場はお金と心理で動く。 — アンドレ・コストラニー\n主人はゆっくり歩き、犬は前後に走るが最終的に一緒に到着する。 — アンドレ・コストラニー\n投資家はお金、考え、忍耐を持たなければならない。 — アンドレ・コストラニー\n株式市場で最も高価なものは焦りだ。 — アンドレ・コストラニー\n大衆が興奮するときは一歩引け。 — アンドレ・コストラニー\n良い投資家は市場の気分を読むが、それに従わない。 — アンドレ・コストラニー\n価格は心理に揺れるが価値には時間が必要だ。 — アンドレ・コストラニー\n投資には想像力も必要だが、忍耐がより必要だ。 — アンドレ・コストラニー\n借金で投資すると時間が敵になる。 — アンドレ・コストラニー\n株式は忍耐のない人のお金を忍耐ある人に移す。 — アンドレ・コストラニー\n大衆と同じ考えをしながら大衆より良い結果を期待するのは難しい。 — アンドレ・コストラニー\n市場では論理より心理が先に動く日が多い。 — アンドレ・コストラニー\n待つことのない投資は投機に近づく。 — アンドレ・コストラニー\nお金が急な投資家は市場の気まぐれに耐えにくい。 — アンドレ・コストラニー\n下落は苦痛だがチャンスの言語でもある。 — アンドレ・コストラニー\n市場を頻繁に見ると感情が思考より先に出る。 — アンドレ・コストラニー\n忍耐は投資家の隠れた資本だ。 — アンドレ・コストラニー\n良いアイデアも時間がなければ失敗することがある。 — アンドレ・コストラニー\n投資家は群衆の喝采より自分の判断を信じなければならない。 — アンドレ・コストラニー\n市場で長く生き残る人が結局多くを学ぶ。 — アンドレ・コストラニー\n痛みと内省が出会うとき進歩が生まれる。 — レイ・ダリオ\n知らないことを認めることがリスク管理の始まりだ。 — レイ・ダリオ\n相関の低い資産を混ぜるとポートフォリオはより安定しうる。 — レイ・ダリオ\n原則がなければ危機のとき感情が決断を代わりにする。 — レイ・ダリオ\n現実をありのままに見る能力が良い意思決定の出発点だ。 — レイ・ダリオ\n投資家は確信より検証可能な原則を持つべきだ。 — レイ・ダリオ\n分散は無知を隠すことではなく不確実性を認める方法だ。 — レイ・ダリオ\n自分の弱点を知らなければ市場が代わりに教えてくれる。 — レイ・ダリオ\n良いシステムは感情的な瞬間にも同じ基準を適用する。 — レイ・ダリオ\n大きな絵を理解すると短期ノイズに揺れにくくなる。 — レイ・ダリオ\n重要なのは正否ではなく、正しいときにいくら稼ぎ、間違いのときにいくら失うかだ。 — ジョージ・ソロス\n市場は現実を反映するだけでなく現実に影響を与えもする。 — ジョージ・ソロス\n間違いをすぐに認める能力は強力な武器だ。 — ジョージ・ソロス\n生存が先で利益は次だ。 — ジョージ・ソロス\n確信が増すほど反対の可能性も点検すべきだ。 — ジョージ・ソロス\n市場の幻想は長く続くことがある。 — ジョージ・ソロス\n良い投資家は自分のエラーを素早く修正する。 — ジョージ・ソロス\n危険なのは間違えることではなく間違ったまま耐えることだ。 — ジョージ・ソロス\nチャンスが大きいほどポジション管理がより重要になる。 — ジョージ・ソロス\n投資は不完全な情報の中で決断を下すことだ。 — ジョージ・ソロス\n攻撃より防御が先だ。 — ポール・テューダー・ジョーンズ\n損失ポジションに追加投資する人は結局より大きな危険を作る。 — ポール・テューダー・ジョーンズ\n資本を守れば次のチャンスが来る。 — ポール・テューダー・ジョーンズ\n市場でヒーローになろうとするな。 — ポール・テューダー・ジョーンズ\n損失を小さく保つ能力が長期的な成果を生む。 — ポール・テューダー・ジョーンズ\n価格が自分の考えと違う方向に動いたらリスクを先に減らせ。 — ポール・テューダー・ジョーンズ\n大きな利益より大きな損失を避けることが先だ。 — ポール・テューダー・ジョーンズ\nトレーディングでの自尊心は損失を膨らませる。 — ポール・テューダー・ジョーンズ\n防御的な心構えは弱さではなく生存戦略だ。 — ポール・テューダー・ジョーンズ\n損失管理なしの攻撃は長続きしない。 — ポール・テューダー・ジョーンズ\n損失は小さいうちに切るのが原則だ。 — ウィリアム・オニール・マーク・ミナービニ\n強い株には強い理由がある。 — ウィリアム・オニール・マーク・ミナービニ\nトレンドと戦うな。 — ウィリアム・オニール・マーク・ミナービニ\nチャートは意見より早くリスクを示すことがある。 — ウィリアム・オニール・マーク・ミナービニ\n大きな勝者を掴むにはまず大きな敗者を避けなければならない。 — ウィリアム・オニール・マーク・ミナービニ\nルールなしの売買は感情の記録に過ぎない。 — ウィリアム・オニール・マーク・ミナービニ\n市場のリーダーを探しつつリスクは数字で制限せよ。 — ウィリアム・オニール・マーク・ミナービニ\n買いより重要なのは間違ったときの行動だ。 — ウィリアム・オニール・マーク・ミナービニ\n良い進入も悪い損切り習慣には勝てない。 — ウィリアム・オニール・マーク・ミナービニ\n強気相場では強い銘柄がより強くなりうる。 — ウィリアム・オニール・マーク・ミナービニ\nほとんどの投資家にとって市場全体を保有することは合理的だ。 — バートン・マルキール\n市場を当てにくければ低コストで長く参加せよ。 — バートン・マルキール\nランダムに見える価格動向に過度な意味を付けるな。 — バートン・マルキール\nインデックス投資は単純だが強力な選択だ。 — バートン・マルキール\n予測が難しければコストと分散をコントロールせよ。 — バートン・マルキール\n投資家は自分がコントロールできることに集中すべきだ。 — バートン・マルキール\n長期的に市場に留まることが市場を当てることより現実的だ。 — バートン・マルキール\n流行の戦略より実証された単純さが長続きする。 — バートン・マルキール\n複雑な予測は低コストの力にしばしば勝てない。 — バートン・マルキール\n平均を継続して得る戦略は思ったより強い。 — バートン・マルキール\n優れた企業は数字を超えた質的要素がある。 — フィリップ・フィッシャー\n成長株は経営陣と市場機会を共に見なければならない。 — フィリップ・フィッシャー\n良い企業は長く保有するほどその真価が現れうる。 — フィリップ・フィッシャー\n企業を理解するには周囲の声まで調査せよ。 — フィリップ・フィッシャー\n売りは買いより難しい決断かもしれない。 — フィリップ・フィッシャー\n長期成長企業は短期変動に耐える理由を提供する。 — フィリップ・フィッシャー\n良い経営陣は数字に見えない価値を生む。 — フィリップ・フィッシャー\n成長可能性と価格を共に見よ。 — フィリップ・フィッシャー\n企業の質を知らなければ長期保有も揺らぐ。 — フィリップ・フィッシャー\n優れた企業は時間を投資家の友にする。 — フィリップ・フィッシャー\n安全マージンは不確実性を認める投資家の言語だ。 — セス・クラーマン\n価値投資は人気より価格と価値の差を見る。 — セス・クラーマン\nリスクは他者がリスクでないと感じるときに大きくなりうる。 — セス・クラーマン\n忍耐は価値投資家の最も重要な資産の一つだ。 — セス・クラーマン\n安い価格にも理由があるか確認すべきだ。 — セス・クラーマン\n損失を避けようとする姿勢が長期リターンの基盤になる。 — セス・クラーマン\n良いチャンスはあまり来ないため現金が必要かもしれない。 — セス・クラーマン\n投資家は市場の人気ではなく自分の分析に頼るべきだ。 — セス・クラーマン\n価値と価格の乖離が大きいほどチャンスも大きくなりうる。 — セス・クラーマン\n安全マージンなしの確信は危険な自信だ。 — セス・クラーマン\n良い会社を安く買う原則は単純だが易しくはない。 — ジョエル・グリーンブラット\n収益率の高い事業と低い価格が出会うとチャンスになる。 — ジョエル・グリーンブラット\n単純な原則も守れなければ成果は出ない。 — ジョエル・グリーンブラット\n価値投資は退屈に見えても時間が必要だ。 — ジョエル・グリーンブラット\n市場が短期的に間違いうるという事実がチャンスを生む。 — ジョエル・グリーンブラット\n良い戦略は誰もが真似しにくくなければ長続きしない。 — ジョエル・グリーンブラット\n価格が価値より低いとき投資家の優位が生まれる。 — ジョエル・グリーンブラット\n企業の質と価格を共に見なければならない。 — ジョエル・グリーンブラット\n長期的に数字はストーリーより強い。 — ジョエル・グリーンブラット\n忍耐なしに価値投資をするのは難しい。 — ジョエル・グリーンブラット\nコイン投げで表なら大きく稼ぎ、裏なら少なく失う構造を探せ。 — モニッシュ・パブライ\n単純なアイデアが大きなリターンを生みうる。 — モニッシュ・パブライ\n良い投資家は優れた投資家の原則を模倣できる。 — モニッシュ・パブライ\n下方は制限し上方は開いておく投資が良い。 — モニッシュ・パブライ\n複雑な問題より明確なチャンスを待て。 — モニッシュ・パブライ\n投資家は多くの決断より良い決断をすべきだ。 — モニッシュ・パブライ\nたまに来る確実なチャンスに集中せよ。 — モニッシュ・パブライ\n失う可能性を先に計算すると長く生き残れる。 — モニッシュ・パブライ\n良い投資は説明が単純でなければならない。 — モニッシュ・パブライ\n待つことは価値投資の一部だ。 — モニッシュ・パブライ\n優れた企業と長く歩むことが最も強い戦略になりうる。 — ニック・スリープ\n投資家はトレーダーではなくオーナーになるべきだ。 — ニック・スリープ\n長期的な視点は競合他社が簡単に追随できない。 — ニック・スリープ\n良い企業文化は時間が経つほど複利のように機能する。 — ニック・スリープ\n顧客のことを長く考える企業は投資家にも報いることができる。 — ニック・スリープ\n真の長期投資は四半期業績のノイズに耐える。 — ニック・スリープ\n優れた企業の内在価値はゆっくりだが力強く積み上がる。 — ニック・スリープ\nオーナーの視点は売買衝動を減らす。 — ニック・スリープ\n長く保有するほど企業の質が重要になる。 — ニック・スリープ\n長期同行できる企業を探すことが頻繁な売買より良い。 — ニック・スリープ\n落ちるナイフを無理に掴もうとするな。 — ウォール街の格言\n「噂で買って、ニュースで売れ」は群衆心理を警戒せよという意味だ。 — ウォール街の格言\n強気相場では皆が賢く見える。 — ウォール街の格言\n損失は素早く切り、利益は長く育てよ。 — ウォール街の格言\n市場は希望より冷酷だ。 — ウォール街の格言\nトレンドは友かもしれないが終わる瞬間もある。 — ウォール街の格言\nまずお金を失わない方法を学べ。 — ウォール街の格言\n分散は一度のミスを致命傷にしないようにする。 — ウォール街の格言\nレバレッジは時間を圧縮するがミスも圧縮する。 — ウォール街の格言\n市場は常に次の教訓を準備している。 — ウォール街の格言\n優れた投資機会はあまり来ないので、来たとき準備できていなければならない。 — ウォーレン・バフェット\n長期保有の気持ちがなければ短期買いも慎重にすべきだ。 — ウォーレン・バフェット\n市場の値札が毎日変わっても企業の本質は毎日変わらない。 — ウォーレン・バフェット\n事業を理解する能力は複雑な予測より強い武器だ。 — ウォーレン・バフェット\n良い企業は時間が経つほど投資家のミスを減らす。 — ウォーレン・バフェット\n大衆の恐怖は準備された投資家に割引された値札になりうる。 — ウォーレン・バフェット\nすべてのチャンスを掴もうとする欲より確実なチャンスを待つ忍耐が勝る。 — ウォーレン・バフェット\n投資はかっこいい行動より合理的な行動を要求する。 — ウォーレン・バフェット\n安く見える株より長く稼げる事業を先に見よ。 — ウォーレン・バフェット\n良い企業を長く保有することは思ったより退屈で、その退屈さが成果になる。 — ウォーレン・バフェット\n投資での最大の優位は自分が知らないことを認める姿勢だ。 — チャーリー・マンガー\n良い事業を見つけたなら不必要な行動を減らすことが助けになる。 — チャーリー・マンガー\n忍耐は知識と共にあるとき強力な投資ツールになる。 — チャーリー・マンガー\n多くのミスは複雑なものを単純に見られないことから来る。 — チャーリー・マンガー\n投資家はまず自分がなぜ間違いうるかを考えるべきだ。 — チャーリー・マンガー\n最良の投資家は毎日取引する人ではなく長く待つ人かもしれない。 — チャーリー・マンガー\n逆から考えると避けるべき道が先に見える。 — チャーリー・マンガー\n他人のミスから学ぶことが最も安い授業料だ。 — チャーリー・マンガー\n複利は良い企業と長い時間が出会うとき強くなる。 — チャーリー・マンガー\n良い気質は優れた知性より投資成果に長く残る。 — チャーリー・マンガー\n価値と価格の差を知らなければ投資家は市場の気分に引っ張られる。 — ベンジャミン・グレアム\n市場は毎日チャンスを与えるが毎日従う必要はない。 — ベンジャミン・グレアム\n投資家は市場の僕ではなく市場の主人になるべきだ。 — ベンジャミン・グレアム\n安全マージンは未来を知らないという事実への保険だ。 — ベンジャミン・グレアム\n株価が下がっても常に危険になるわけではなく、高く買うことの方が危険かもしれない。 — ベンジャミン・グレアム\n分析なしの確信は投資家を投機師にする。 — ベンジャミン・グレアム\n価格変動は投資家の感情をテストするが価値は理性を要求する。 — ベンジャミン・グレアム\n市場価格は事実だが常に真実ではない。 — ベンジャミン・グレアム\n十分安く買うことは完璧な未来予測より現実的な防御だ。 — ベンジャミン・グレアム\n賢明な投資家は人気より先に安全マージンを探す。 — ベンジャミン・グレアム\n株を買う前にその会社がどうやってお金を稼ぐか説明できなければならない。 — ピーター・リンチ\n良い投資アイデアは遠いところより日常の近くにあるかもしれない。 — ピーター・リンチ\n株価ではなく企業のストーリーが続いているか確認せよ。 — ピーター・リンチ\n下落に耐える気持ちがなければ上昇の果実も長く享受しにくい。 — ピーター・リンチ\n銘柄名よりその企業の業績と見通しを知るべきだ。 — ピーター・リンチ\n市場を予測する時間を使うより企業を研究する時間を使え。 — ピーター・リンチ\n一二度の失敗が全体の投資を壊さないような構造を作れ。 — ピーター・リンチ\n成功する銘柄は時間が必要で失敗する銘柄は点検が必要だ。 — ピーター・リンチ\n知らない企業を買うことは他人の話にお金を任せることだ。 — ピーター・リンチ\n株は数字とストーリー、両方確認すべきだ。 — ピーター・リンチ\n平凡な市場収益率を継続して得ることは決して平凡なことではない。 — ジョン・ボーグル\n投資家は市場全体の成果を得るために複雑な予測をする必要がない。 — ジョン・ボーグル\n低コストは時間が経つほど投資家の味方になる。 — ジョン・ボーグル\n何もしない戦略は簡単に見えるが実際には最も難しい。 — ジョン・ボーグル\nインデックス投資の力は天才的な選択ではなく不必要な選択を減らすことにある。 — ジョン・ボーグル\n長期投資家は一日のニュースより数十年の複利を見る。 — ジョン・ボーグル\n投資の基本はより多く当てることではなく漏れの少ない構造を作ることだ。 — ジョン・ボーグル\nコストと税金、感情を下げると長期的な成果は良くなりうる。 — ジョン・ボーグル\n市場に残っている時間が市場タイミングより重要だ。 — ジョン・ボーグル\n単純なポートフォリオは危機のときも守りやすい。 — ジョン・ボーグル\n良い投資家は何を買うかだけでなくいくらで買うかを問う。 — ハワード・マークス\n皆が楽観するときは良いニュースより価格を疑うべきだ。 — ハワード・マークス\n皆が恐れているときは悪いニュースより価格を見直すべきだ。 — ハワード・マークス\nリスクは見えないときが最も危険だ。 — ハワード・マークス\n投資家は未来を当てる人ではなく確率を有利にする人だ。 — ハワード・マークス\nサイクルの終わりでは論理より心理が価格を押し上げる。 — ハワード・マークス\nリスクをうまく管理すると利益を得るチャンスが再来する。 — ハワード・マークス\n他と同じ考えでは他と違う結果を得にくい。 — ハワード・マークス\n最良の買いのチャンスは大抵最も不快なニュースと共に来る。 — ハワード・マークス\n成功した投資家は確実性より不確実性の価格を見る。 — ハワード・マークス\n絶望的な雰囲気の中でも価格が十分低ければチャンスはある。 — ジョン・テンプルトン\n皆が好む市場はすでに多くの期待を価格に込めているかもしれない。 — ジョン・テンプルトン\n悲観は投資家の目を曇らせるが価値投資家には地図になりうる。 — ジョン・テンプルトン\n大衆が捨てたところで最大の割引率が現れうる。 — ジョン・テンプルトン\n市場が歓声を上げるときはリターンより危険を先に計算せよ。 — ジョン・テンプルトン\n最も不人気な市場が最良の出発点になることがある。 — ジョン・テンプルトン\n悲観が行き過ぎると価格は価値よりさらに下落しうる。 — ジョン・テンプルトン\n世界のどこにでもチャンスはあり、群衆の視野は常に限られている。 — ジョン・テンプルトン\n恐怖の中で買うことは勇気だけでなく分析を要求する。 — ジョン・テンプルトン\n楽観の終わりでは期待より安全マージンを見るべきだ。 — ジョン・テンプルトン\n市場と戦い始めると損失は自尊心のコストになる。 — ジェシー・リバモア\n間違いのサインが出たら意地より退場が先だ。 — ジェシー・リバモア\n大きなトレンドに乗っても早く降りすぎると大金は残らない。 — ジェシー・リバモア\n毎日取引しようとする欲が市場を給料のように錯覚させる。 — ジェシー・リバモア\n価格が自分の味方でないときは理由よりリスクを先に減らせ。 — ジェシー・リバモア\n投機において希望は計画ではない。 — ジェシー・リバモア\n間違ったポジションは小さいうちに清算すると次のチャンスが見える。 — ジェシー・リバモア\n市場は個人の確信より長く動きうる。 — ジェシー・リバモア\n座っている能力と抜け出す能力は両方必要だ。 — ジェシー・リバモア\nトレンドに従いつつ損失は制限せよ。 — ジェシー・リバモア\n株価は時に経済より先に心理を反映する。 — アンドレ・コストラニー\n忍耐のないお金は市場で長く生き残りにくい。 — アンドレ・コストラニー\n群衆は大抵遅く興奮し遅く恐れる。 — アンドレ・コストラニー\n市場の犬は先に走るが結局主人に戻る。 — アンドレ・コストラニー\n良いアイデアも時間がなければ良い投資になりにくい。 — アンドレ・コストラニー\n借金は投資家の忍耐を奪う。 — アンドレ・コストラニー\n市場でお金より先に必要なのは耐えられる時間だ。 — アンドレ・コストラニー\n群衆の感情は価格を揺らすが永遠に支配はできない。 — アンドレ・コストラニー\n投資家はノイズの中で方向を失わない人になるべきだ。 — アンドレ・コストラニー\n株式市場は計算機と心理学の本を共に要求する。 — アンドレ・コストラニー\n分散は確信ではなく謙虚さから始まる。 — レイ・ダリオ\n良い原則は良い日より悪い日により必要だ。 — レイ・ダリオ\n自分の弱点を知ればポートフォリオもより現実的に作れる。 — レイ・ダリオ\n不確実な世界では一つの結果にすべてを賭けてはならない。 — レイ・ダリオ\n痛ましい損失も正しく振り返ると次の判断の材料になる。 — レイ・ダリオ\n市場より先に自分がどんな人間かを知るべきだ。 — レイ・ダリオ\n異なるリスクを混ぜることは長く耐えるための技術だ。 — レイ・ダリオ\n現実を否定する投資はいつか現実によって調整される。 — レイ・ダリオ\n良い意思決定は感情より原則とフィードバックに依存する。 — レイ・ダリオ\n投資家は確信ではなくバランスを設計すべきことが多い。 — レイ・ダリオ\n間違った判断を早く修正すれば損失は授業料で終わりうる。 — ジョージ・ソロス\n市場の幻想を理解するとチャンスと危険を同時に見られる。 — ジョージ・ソロス\nポジションサイズは確信と同じくらい重要だ。 — ジョージ・ソロス\n正しいときに大きく稼ぎ間違ったときに少なく失う構造が重要だ。 — ジョージ・ソロス\n投資は完璧な予測よりエラー修正能力を要求する。 — ジョージ・ソロス\n生き残る投資家は自分の考えを変えられる。 — ジョージ・ソロス\n市場は参加者の信念によってより大きく揺れうる。 — ジョージ・ソロス\n強い確信も損失制限ルールなしでは危険だ。 — ジョージ・ソロス\n自分が間違いだったと知る瞬間が最も重要な瞬間だ。 — ジョージ・ソロス\n市場のチャンスは大抵不完全な情報の中に現れる。 — ジョージ・ソロス\n資本を守る人だけが次のトレンドを掴める。 — ポール・テューダー・ジョーンズ\n損失が大きくなる前に小さく認めることがプロの習慣だ。 — ポール・テューダー・ジョーンズ\nリスクを減らすことは臆病ではなく戦略だ。 — ポール・テューダー・ジョーンズ\n買う理由より損失制限計画が先に準備されるべきだ。 — ポール・テューダー・ジョーンズ\n市場は自尊心に報酬を与えない。 — ポール・テューダー・ジョーンズ\n良いトレーダーはまず生き残りその後に稼ぐ。 — ポール・テューダー・ジョーンズ\n防御がうまい投資家は攻撃のチャンスを失わない。 — ポール・テューダー・ジョーンズ\n間違ったポジションを長く持つことは分析ではなく意地だ。 — ポール・テューダー・ジョーンズ\nリスクをコントロールすると心もコントロールされる。 — ポール・テューダー・ジョーンズ\n大きな損失を避けることが複利の出発点だ。 — ポール・テューダー・ジョーンズ\n市場のリーダーは弱気相場後に先に力を見せることが多い。 — ウィリアム・オニール・マーク・ミナービニ\n損切りルールは感情ではなく数字で決めるべきだ。 — ウィリアム・オニール・マーク・ミナービニ\nトレンドを無視すると良い分析も損失で終わりうる。 — ウィリアム・オニール・マーク・ミナービニ\n強い銘柄を高いという理由だけで無視するな。 — ウィリアム・オニール・マーク・ミナービニ\n弱い銘柄を安いという理由だけで掴むな。 — ウィリアム・オニール・マーク・ミナービニ\n良い売買は市場が間違いだと言い張ることからは来ない。 — ウィリアム・オニール・マーク・ミナービニ\n勝率より損益比と損失制限がより重要かもしれない。 — ウィリアム・オニール・マーク・ミナービニ\nチャートは未来を保証しないがリスクシグナルを与えうる。 — ウィリアム・オニール・マーク・ミナービニ\n強い上昇には理由があり、弱い反発には限界がある。 — ウィリアム・オニール・マーク・ミナービニ\nルールを守る投資家は感情的な市場でも揺れが減る。 — ウィリアム・オニール・マーク・ミナービニ\n市場全体を保有する戦略は予測の負担を減らす。 — バートン・マルキール\nランダムに近い短期動向を予言しようと苦心するな。 — バートン・マルキール\n低コストと広い分散は投資家が実際にコントロールできる領域だ。 — バートン・マルキール\n長期インデックス投資は華やかではないが着実だ。 — バートン・マルキール\n複雑な予測より単純な参加の方が良いことが多い。 — バートン・マルキール\n平均を侮ると平均にも届かないかもしれない。 — バートン・マルキール\n市場タイミングの誘惑は大きいが成功確率は低い。 — バートン・マルキール\n投資家は確実なコストを減らすことで先に勝つ。 — バートン・マルキール\n分散されたポートフォリオは未知の未来への現実的な答えだ。 — バートン・マルキール\n単純な戦略は長く維持できるときより強くなる。 — バートン・マルキール\n偉大な企業は売上より深い競争力を持つ。 — フィリップ・フィッシャー\n成長企業を見るときは数字と人を共に見なければならない。 — フィリップ・フィッシャー\n企業の品質は時間が経つほど株価より重要になりうる。 — フィリップ・フィッシャー\n良い経営陣は難しい時期により良く現れる。 — フィリップ・フィッシャー\n長期成長株は短期失望より長期方向性が重要だ。 — フィリップ・フィッシャー\n深い調査は確信を生み、確信は忍耐を生む。 — フィリップ・フィッシャー\n良い企業を早く売りすぎることはよくあるミスだ。 — フィリップ・フィッシャー\n成長性だけ見て価格を無視すると良い企業も悪い投資になる。 — フィリップ・フィッシャー\n企業文化と研究開発能力は長期成長の種になりうる。 — フィリップ・フィッシャー\n優れた会社を見つけたなら短期変動より長期競争力を見よ。 — フィリップ・フィッシャー\n価値投資家は人気のない価格に安心感を見つけるべきだ。 — セス・クラーマン\n安全マージンは投資家の謙虚さを数字で表したものだ。 — セス・クラーマン\n現金は何もしない資産ではなく選択権かもしれない。 — セス・クラーマン\n下落リスクを先に見た投資家は上昇機会もより長く待てる。 — セス・クラーマン\n安い資産には理由があるので価値と罠を区別すべきだ。 — セス・クラーマン\n市場が無視するところで価値は静かに積まれうる。 — セス・クラーマン\n確実なチャンスがないとき待つことも投資決定だ。 — セス・クラーマン\n損失回避は小心ではなく複利を守る方法だ。 — セス・クラーマン\n雰囲気が良いほど安全マージンはより必要だ。 — セス・クラーマン\n良い投資は買いの瞬間から防御力を持っていなければならない。 — セス・クラーマン\n市場が短期的に非合理的なので長期機会が生まれる。 — ジョエル・グリーンブラット\n良い会社を安く買う原則は単純だが実践は難しい。 — ジョエル・グリーンブラット\n価値投資戦略は退屈な期間を耐えてこそ報われる。 — ジョエル・グリーンブラット\n収益性の高い企業を低価格で買うことが核心だ。 — ジョエル・グリーンブラット\n良い戦略も人が諦めるほど辛い区間がなければ長く機能しない。 — ジョエル・グリーンブラット\n価格と品質を共に見るとミスの確率を減らせる。 — ジョエル・グリーンブラット\n市場は時に優れた企業に誤った価格を付ける。 — ジョエル・グリーンブラット\n短期成果に揺れない規律が戦略を完成させる。 — ジョエル・グリーンブラット\n安いだけの企業より安くて良い企業がより良い。 — ジョエル・グリーンブラット\n投資公式より重要なのはその公式に耐える心だ。 — ジョエル・グリーンブラット\n下方が小さく上方が大きい構造を探すことが核心だ。 — モニッシュ・パブライ\n良い投資アイデアは理解しやすくなければ長く耐えられない。 — モニッシュ・パブライ\n待つことはチャンスのない時間ではなくチャンスを選ぶ時間だ。 — モニッシュ・パブライ\n実証された原則を真似することも優れた投資能力だ。 — モニッシュ・パブライ\n少なく失って大きく稼げる構造が価値投資の魅力だ。 — モニッシュ・パブライ\n複雑な投資はミスする箇所も多い。 — モニッシュ・パブライ\n投資家は多くのアイデアより良いいくつかのアイデアが必要だ。 — モニッシュ・パブライ\n不確実性があっても価格が十分低ければチャンスになりうる。 — モニッシュ・パブライ\n大きなチャンスはあまり来ないので普段は耐えなければならない。 — モニッシュ・パブライ\n投資での単純さは弱点ではなく強みになりうる。 — モニッシュ・パブライ\n本当の長期投資は企業と共に時間を過ごすことだ。 — ニック・スリープ\n優れた企業は時間が経つほど顧客と投資家双方に価値を与えられる。 — ニック・スリープ\n取引頻度を減らすとオーナーの視点がより鮮明になる。 — ニック・スリープ\n良い企業文化は財務諸表より遅く現れるが長く残る。 — ニック・スリープ\n長期保有はどんな企業でも長く持つことではない。 — ニック・スリープ\n企業の方向性が正しければ短期変動はノイズに近いかもしれない。 — ニック・スリープ\n長く同行できる企業は顧客への接し方にヒントを与える。 — ニック・スリープ\n良い企業は時間が経つほど選択肢を広げる。 — ニック・スリープ\n短期売買は価格を見させ、長期保有は事業を見させる。 — ニック・スリープ\n投資家は値札より事業の累積価値を観察すべきだ。 — ニック・スリープ\n市場はあなたが耐えられる時間より長く揺れうる。 — ウォール街の格言\n安く買うことより大切なのは耐えられるように買うことだ。 — ウォール街の格言\n最高の戦略も感情的に守れなければ良い戦略ではない。 — ウォール街の格言\n利益を増やすにはまず損失が口座を壊さないようにしなければならない。 — ウォール街の格言\n市場のノイズは大きいが口座を守ることは静かな原則だ。 — ウォール街の格言\n現金は焦る人には答答しさで準備された人にはチャンスだ。 — ウォール街の格言\n皆が同じ方向を向くとき反対側の危険を確認せよ。 — ウォール街の格言\nレバレッジは方向を当てても時間を間違えると危険になる。 — ウォール街の格言\n分散は大当たりを減らしうるが破産の可能性も減らす。 — ウォール街の格言\n下落相場はポートフォリオより先に投資家の心をテストする。 — ウォール街の格言\nニュースが急なほど注文はゆっくり出すべきだ。 — ウォール街の格言\n口座を長く維持する人が次の強気相場を見られる。 — ウォール街の格言\n利益は可能性で損失制限は責任だ。 — ウォール街の格言\n買う前に期待収益より最悪の場合を先に書いてみよ。 — ウォール街の格言\n市場には確信より確率の方がよく似合う。 — ウォール街の格言';

  @override
  String get intelligentInvestorBookTitle => '私が考える賢い投資';

  @override
  String get longFormBookTitle => '株式トレーダーの回想録';

  @override
  String get intelligentInvestorCh1Title => 'Ch1. 投資と投機の違い';

  @override
  String get intelligentInvestorCh2Title => 'Ch2. なぜほとんどの投資家は失敗するのか';

  @override
  String get intelligentInvestorCh3Title => 'Ch3. 市場';

  @override
  String get intelligentInvestorCh4Title => 'Ch4. 安全マージン';

  @override
  String get intelligentInvestorCh5Title => 'Ch5. 群集心理と投資';

  @override
  String get intelligentInvestorCh6Title => 'Ch6. 市場はなぜ長期的に上昇するのか';

  @override
  String get intelligentInvestorCh7Title => 'Ch7. ドットコムバブルの教訓';

  @override
  String get intelligentInvestorCh8Title => 'Ch8. 金融危機の教訓';

  @override
  String get intelligentInvestorCh9Title => 'Ch9. コロナ暴落の教訓';

  @override
  String get intelligentInvestorCh10Title => 'Ch10. AI革命と現在の市場';
}
