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
  String get holdQLDPlusCash => 'QLD + 現金30%維持';

  @override
  String get basePositionDescription =>
      '[ 戦略ガイド ]\n\nこの戦略は、資産全体を一度にQLDへ投資するものではありません。\n\n初期段階では資産の一部だけを投資し、残りは現金として保有して大きな下落相場に備えます。\n\n現金を保有する力\n\n現金はリターンを高めるためではなく、下落相場でも動揺せず規律を守るための心の余裕です。\n\n最高のリターンより重要なのは、最後まで複利を続けられる投資システムです。\n\n例:\n- 初期資産の70%のみをQLDに投資\n- 残りの30%は現金で保有\n\nQLDはナスダック100指数のおよそ2倍の値動きを追跡するETFです。\n\nそのため初期状態では:\n2倍レバレッジ × 70%投資 = 約1.4倍程度の値動きになります。\n\nつまり:\n- ナスダック +1%\n→ 全体資産は約 +1.4%\n\n大きな下落相場が発生した場合、保有している現金を段階的な追加購入に使用します。\n\n例:\n- QLD -40%付近で追加購入\n\nこの場合、下がった価格でより多くの数量を確保でき、その後市場が回復したときに平均取得単価を大きく下げる効果があります。\n\nそのため、単純な保有戦略よりも回復局面で高いリターンが期待できます。\n\nこの戦略の核心は:\n- 上昇相場では現金比率で変動性を抑える\n- 大きな下落相場では現金で追加購入し、平均単価を下げることです。';

  @override
  String get buySignalMessage => '買いシグナルはここに自動表示されます。';

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
  String get minus20Headline => '少額積立でTQQQ買付開始';

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
  String get minus20ActionText => 'TQQQを小さな単位で少額ずつ積立買いします。大きな金額を一度に入れません。';

  @override
  String get minus20BuyRuleTitle => '買いルール';

  @override
  String get minus20BuyRuleText =>
      '総現金のごく一部だけを使います。目的は大きな投入ではなく、買いのリズムを始めることです。';

  @override
  String get minus20CashTitle => '現金管理';

  @override
  String get minus20CashText => '大部分の現金は必ず残します。-30%、-40%、-50%ゾーンに備えます。';

  @override
  String get minus20AvoidTitle => '避けること';

  @override
  String get minus20AvoidText => 'TQQQを急いで大きく買いません。-20%はまだ序盤です。';

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
}
