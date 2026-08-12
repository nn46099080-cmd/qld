// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'QLD 알림';

  @override
  String get menuThemeTitle => '테마';

  @override
  String get menuLanguageTitle => '언어';

  @override
  String get menuThemeLight => '화이트';

  @override
  String get menuThemeDark => '다크';

  @override
  String get noBuyZone => '매수 금지 구간';

  @override
  String get tapToViewStrategy => '전략 보기';

  @override
  String get buyNow => '지금 매수';

  @override
  String get buyingInProgress => '매수 진행 중';

  @override
  String get hold => '보유 유지';

  @override
  String get navHome => '홈';

  @override
  String get navChart => '차트';

  @override
  String get navExchange => '환율';

  @override
  String get navFearGreed => '공포';

  @override
  String get fearGreedTitle => '공포탐욕지수';

  @override
  String get fearGreedInlineLabel => 'CNN 공포탐욕지수';

  @override
  String get fearGreedSubtitle => 'CNN 미국 시장 심리지수';

  @override
  String get fearGreedUnavailable => '공포탐욕 데이터를 불러올 수 없습니다.';

  @override
  String get navAlert => '알림';

  @override
  String get navStrategy => '전략';

  @override
  String get alertRecovery10 => 'QLD 10% 회복';

  @override
  String get alertMarketOpen => '미국 증시가 시작되었습니다';

  @override
  String get alertNewHigh => '신고가 갱신';

  @override
  String get portfolio => '포트폴리오';

  @override
  String get portfolioAssetInput => '자산입력';

  @override
  String get portfolioClose => '닫기';

  @override
  String get exitAdDialogBack => '돌아가기';

  @override
  String get exitAdDialogExit => '종료';

  @override
  String get exitAdDialogMessage =>
      '앱 종료 시 전면 광고가 최대 3시간에 1회 표시될 수 있습니다. 광고 수익은 앱 운영과 기능 개선에 사용됩니다. 감사합니다.';

  @override
  String get portfolioQldShares => 'QLD 수량';

  @override
  String get portfolioTqqqShares => 'TQQQ 수량';

  @override
  String get portfolioQldAveragePrice => 'QLD 평균단가';

  @override
  String get portfolioTqqqAveragePrice => 'TQQQ 평균단가';

  @override
  String get portfolioCashUsd => '현금 USD';

  @override
  String get portfolioTotal => '총자산';

  @override
  String get portfolioProfitLoss => '평가손익';

  @override
  String get portfolioSharesUnit => '주';

  @override
  String get portfolioReturnRate => '수익률';

  @override
  String get portfolioAveragePriceShort => '평균단가';

  @override
  String get portfolioPriceLoading => '가격 불러오는 중';

  @override
  String get portfolioToBreakeven => '본전까지';

  @override
  String get portfolioBreakevenCleared => '본전 이상';

  @override
  String get basePosition => '기본 포지션';

  @override
  String get fromPreviousClose => '전일 종가대비';

  @override
  String get from10yHigh => '역대 최고가 대비';

  @override
  String get holdQLDPlusCash => 'QLD 70% + 현금 30% 유지';

  @override
  String get basePositionDescription =>
      '[ 전략 안내 ]\n\n이 전략은 자산 전체를 한 번에 QLD에 투자하지 않습니다.\n\n초기에는 자산의 일부만 투자하고, 나머지는 현금으로 보유해 큰 하락장에 대비합니다.\n\n현금 보유의 힘\n\n현금은 수익을 높이기 위한 것이 아니라, 하락장에서도 흔들리지 않기 위한 심리적 여유입니다.\n\n최고 수익률보다 중요한 것은 끝까지 복리를 지속할 수 있는 투자 시스템입니다.\n\n예시:\n- 초기 자산의 70%만 QLD 투자\n- 나머지 30%는 현금 보유\n\nQLD는 나스닥100 지수의 약 2배 움직임을 추종하는 ETF입니다.\n\n따라서 초기 상태에서는:\n2배 레버리지 × 70% 투자 = 약 1.4배 수준의 움직임이 됩니다.\n\n즉:\n- 나스닥 +1%\n→ 전체 자산 약 +1.4%\n\n그리고 큰 하락장이 발생하면 보유 중인 현금을 단계적으로 추가 매수에 사용합니다.\n\n예:\n- QLD -40% 구간에서 추가 매수\n\n이 경우 낮아진 가격에서 더 많은 수량을 확보하게 되며, 이후 시장 회복 시 평균 단가가 크게 낮아지는 효과가 발생합니다.\n\n따라서 단순 보유 전략보다 회복 구간에서 더 높은 수익률이 발생할 수 있습니다.\n\n이 전략의 핵심은:\n- 상승장에서는 현금 비중으로 변동성을 낮추고\n- 큰 하락장에서는 현금으로 추가 매수해 평균 단가를 낮추는 것입니다.';

  @override
  String get basePositionIntro =>
      '전부를 한 번에 투자하지 않고, QLD와 현금을 함께 보유하는 기본 전략입니다. 상승장에서는 흔들림을 줄이고, 큰 하락장에서는 현금으로 추가 매수할 여지를 남깁니다.';

  @override
  String get basePositionQldAllocationLabel => 'QLD 기본 보유';

  @override
  String get basePositionCashAllocationLabel => '현금 대기';

  @override
  String get basePositionCorePrinciple => '핵심 원칙';

  @override
  String get basePositionCashTitle => '현금은 수익률을 낮추는 돈이 아닙니다';

  @override
  String get basePositionCashText => '큰 하락장에서 버티고, 낮은 가격에 추가 매수하기 위한 안전 여유입니다.';

  @override
  String get basePositionInitialLeverageTitle => '초기 움직임은 약 1.4배 수준';

  @override
  String get basePositionInitialLeverageText =>
      'QLD는 나스닥100의 약 2배를 추종합니다. 자산의 70%만 QLD에 두면 전체 자산 변동은 약 1.4배로 낮아집니다.';

  @override
  String get basePositionStepLeverageTitle => '하락 구간에서는 배율을 단계적으로 높입니다';

  @override
  String get basePositionStepLeverageText =>
      '-20%~-30% 구간부터 TQQQ를 섞어 물타기를 시작하면 전체 움직임은 약 1.8배 수준으로 올라갑니다. 가장 깊은 하락 구간에서는 약 2.3배까지 높아질 수 있습니다.';

  @override
  String get basePositionLowAverageTitle => '공포가 클수록 낮은 평단가를 만듭니다';

  @override
  String get basePositionLowAverageText =>
      '이 앱의 구조는 하락이 깊어질수록 대기 현금으로 TQQQ를 단계적으로 추가 매수하는 방식입니다. 저점 구간에서 수량을 늘려두면, 이후 큰 반등 때 수익률을 더 강하게 끌어올릴 수 있습니다.';

  @override
  String get basePositionSummaryTitle => '정리';

  @override
  String get basePositionSummaryText =>
      '목표는 최고 수익률을 맞히는 것이 아니라, 하락장에서도 계획을 유지해 복리를 오래 지속하는 것입니다.';

  @override
  String get buySignalMessage => '매수 신호는 이곳에 자동으로 표시됩니다.';

  @override
  String get checkStrategyCard => '현재구간 전략 카드를 확인하세요.';

  @override
  String get strategyCardLabel => '전략 카드';

  @override
  String get currentPrice => '현재 가격';

  @override
  String get futuresLabel => '시간 외';

  @override
  String get tenYearHigh => '역대 최고가';

  @override
  String get buyStrategy => '매수 전략';

  @override
  String get noBuyZoneTitle => '매수 금지 구간';

  @override
  String get strategyOverview => '전략 개요';

  @override
  String get corePrinciple => '핵심 원칙';

  @override
  String get suggestedAllocation => '추천 자산 배분';

  @override
  String get riskManagement => '리스크 관리';

  @override
  String get actionGuide => '행동 가이드';

  @override
  String get marketStable =>
      '나스닥 시장은 미국의 기술 혁신과 글로벌 성장 기업들을 중심으로 장기적인 우상향 구조를 형성해 왔습니다. 이러한 성장성을 기반으로 하는 ProShares Ultra QQQ (QLD) 는 나스닥100 지수의 일일 수익률을 2배로 추종하는 레버리지 ETF로, 장기 상승 국면에서 높은 자본 효율성을 기대할 수 있는 투자 수단으로 평가받습니다.\n\n다만 레버리지 ETF 특성상 시장 하락 구간에서는 변동성과 손실 폭이 크게 확대될 수 있기 때문에, 단순 보유 전략보다는 체계적인 리스크 관리가 중요합니다. 특히 전체 자산의 약 30% 수준을 현금으로 유지하면서 급락 구간에서 분할 매수를 병행하는 전략은 평균 매입 단가를 효과적으로 낮추고, 장기 복리 수익률을 극대화하는 데 유리할 수 있습니다.\n\n즉, 상승장에서는 레버리지의 효율을 활용하고, 하락장에서는 충분한 현금 비중을 통해 유연하게 대응하는 것이 QLD 투자 전략의 핵심이라고 볼 수 있습니다.';

  @override
  String get noPanicSignals =>
      '나스닥 시장은 단순한 기업 집합이 아니라, 지속적인 리밸런싱(Rebalancing)과 종목 교체 메커니즘을 통해 경쟁력을 유지하는 구조를 가지고 있습니다. 성장성과 수익성이 뛰어난 혁신 기업들은 지수에 편입되는 반면, 시장 경쟁력을 잃거나 성장성이 둔화된 기업들은 자연스럽게 비중이 축소되거나 퇴출됩니다.\n\n이러한 구조는 자본이 지속적으로 생산성과 성장성이 높은 기업으로 재배분되는 효과를 만들어내며, 결과적으로 시장 전체의 장기 성장 가능성을 강화합니다. 특히 미국의 기술 혁신, 글로벌 플랫폼 기업의 확장, 그리고 달러 중심의 통화 공급 확대 환경 속에서 나스닥은 글로벌 유동성을 흡수하는 대표적인 성장 자산 시장으로 자리잡아 왔습니다.\n\n즉, 나스닥은 단순히 “오르는 시장”이 아니라, 혁신 기업으로 끊임없이 세대교체가 이루어지는 구조적 성장 시스템에 가깝습니다. 이러한 특성 때문에 장기적으로 통화량 증가와 기술 발전의 수혜를 동시에 반영하며 우상향할 가능성이 높은 시장으로 평가받고 있습니다.';

  @override
  String get maintainBalanced =>
      '균형 잡힌 포지션과 충분한 현금 보유는 향후 시장 조정 시 유연한 대응을 가능하게 합니다.';

  @override
  String get cashReserveRule => '항상 최소 30% 이상의 현금을 유지하세요.';

  @override
  String get cashPsychology =>
      '현금 보유는 심리적 안정감을 제공하며 향후 하락장에서 규칙적인 매수를 가능하게 합니다.';

  @override
  String get allocation1 => '• 핵심 QLD 포지션 유지';

  @override
  String get allocation2 => '• 상승분이 있다면 매도해서 최소 30% 현금 확보';

  @override
  String get allocation3 => '• 단기 급등 추격 매수 절대 금지';

  @override
  String get allocation4 => '• 향후 매수 기회 대비';

  @override
  String get risk1 => '강한 상승장도 언제든 급격히 반전될 수 있습니다.';

  @override
  String get risk2 => '현금이 없으면 조정 시 대응력을 약화시킬 수 있습니다.';

  @override
  String get guide1 => '✅ 원칙 유지';

  @override
  String get guide2 => '✅ 전략적 현금 보유';

  @override
  String get guide3 => '✅ 장기 포지션 중심 유지';

  @override
  String get guide4 => '❌ 감정적 과매수 금지';

  @override
  String get minus20Title => '-20% 전략';

  @override
  String get minus20Headline => '전체 현금 1% 주간 TQQQ 적립 시작';

  @override
  String get minus20OverviewTitle => '전략 개요';

  @override
  String get minus20OverviewText =>
      '이 구간은 QQQ 기준 10% 조정된 구간입니다.\n\n하락폭이 크지 않기 때문에 되도록 현금 보유를 해야 하는 구간입니다.';

  @override
  String get minus20AllocationTitle => '추천 자산 배분';

  @override
  String get minus20AllocationText =>
      '• 아주 작은 비중으로 모으기 시작하거나 홀딩\n• 소량 천천히 분할매수 진행\n• 초기 과도한 진입 절대 금지\n• 더 큰 하락을 대비해 현금 유지';

  @override
  String get minus20HistoryTitle => '과거 회복 데이터';

  @override
  String get minus20HistoryText =>
      '• 평균 회복 기간: 약 1~2개월\n• 나스닥은 -20% 조정 후 반등 사례가 많았음\n• 대폭락 대비 심리적 압박은 상대적으로 낮은 편';

  @override
  String get minus20RiskTitle => '위험 경고';

  @override
  String get minus20RiskText =>
      '-20% 이후 추가 하락 가능성 존재\n\n초기에 과도한 진입은 급락 시 현금이 부족해서 위험할 수 있습니다.';

  @override
  String get minus20GuideTitle => '행동 가이드';

  @override
  String get minus20GuideText =>
      '✅ 천천히 시작\n✅ 꼭 매수하지 않아도 되는 시점\n✅ 충분한 현금 유지\n❌ 감정적 매수 금지';

  @override
  String get minus30Title => '-30% 전략';

  @override
  String get minus30Headline => '현금 20%로 TQQQ 매수';

  @override
  String get minus30OverviewTitle => '전략 개요';

  @override
  String get minus30OverviewText =>
      '이 구간은 높은 기회의 분할 매수 구간입니다.\n\n역사적으로 -30% 수준의 나스닥 조정은 강력한 장기 매수 기회를 제공한 경우가 많았습니다.\n\n이 단계에서는 공포와 변동성이 크게 증가하지만, 규칙적인 분할 매수는 장기 수익률 개선에 도움이 될 수 있습니다.';

  @override
  String get minus30AllocationTitle => '추천 자산 배분';

  @override
  String get minus30AllocationText =>
      '• 사용 가능한 현금의 약 20% 투입\n• 점진적 적립 지속\n• 전체 자금을 너무 빠르게 투입하지 않기\n• 더 깊은 하락에 대응할 유연성 유지';

  @override
  String get minus30HistoryTitle => '과거 회복 데이터';

  @override
  String get minus30HistoryText =>
      '• 평균 회복 기간은 약 6개월~1년 이상\n• 역사적으로 -30% 조정 이후 강한 반등 사례가 많았음\n• 이 구간에서는 변동성과 심리적 압박이 크게 증가함';

  @override
  String get minus30RiskTitle => '위험 경고';

  @override
  String get minus30RiskText =>
      '-30% 이후에도 시장은 높은 변동성을 유지할 수 있습니다.\n\n현금 없이 과도한 진입은 심리적·재정적 위험을 증가시킬 수 있습니다.';

  @override
  String get minus30GuideTitle => '행동 가이드';

  @override
  String get minus30GuideText =>
      '✅ 규칙적인 분할매수 유지\n✅ 감정 통제 유지\n✅ 남은 현금 보존\n❌ 공포 매수 및 과도한 레버리지 금지';

  @override
  String get minus40Title => '-40% 전략';

  @override
  String get minus40Headline => '현금 30% - TQQQ 매수 진입시점';

  @override
  String get minus40OverviewTitle => '전략 개요';

  @override
  String get minus40OverviewText =>
      '-40% 구간은 시장 공포가 커지는 시점이지만 장기 투자자에게는 중요한 분할매수 기회가 될 수 있습니다. 감정적인 대응보다 계획된 전략 유지가 중요합니다.';

  @override
  String get minus40AllocationTitle => '자금 배분';

  @override
  String get minus40AllocationText =>
      '전체 자금을 한 번에 투입하지 말고 여러 단계로 나누어 접근하세요. 추가 하락 가능성을 고려해 현금 비중도 반드시 유지해야 합니다.';

  @override
  String get minus40HistoryTitle => '폭락 역사';

  @override
  String get minus40HistoryText =>
      '과거의 대형 하락장에서도 시장은 장기적으로 회복해왔습니다. 극심한 공포 구간은 장기 투자자에게 기회가 되기도 했습니다.';

  @override
  String get minus40RiskTitle => '심리적 위험';

  @override
  String get minus40RiskText =>
      '하락이 커질수록 공포와 불안도 강해집니다. 뉴스와 단기 변동성에 흔들리지 않고 미리 정한 원칙을 유지하는 것이 중요합니다.';

  @override
  String get minus40GuideTitle => '생존 가이드';

  @override
  String get minus40GuideText =>
      '단기 반등 예측보다 장기 생존에 집중하세요. 레버리지 과다 사용과 감정적 몰빵은 피하고 꾸준한 분할 전략을 유지하세요.';

  @override
  String get minus50Title => '-50% 전략';

  @override
  String get minus50Headline => '보유현금 전체 TQQQ 매수';

  @override
  String get minus50OverviewTitle => '나머지 현금 전부 TQQQ 매수 진입 시점';

  @override
  String get minus50OverviewText =>
      '-50% 수준은 시장의 극단적 공포를 의미합니다. 대부분의 투자자가 패닉 상태에 빠지는 시기이며 높은 변동성이 동반될 수 있습니다.';

  @override
  String get minus50AllocationTitle => '자금 배분';

  @override
  String get minus50AllocationText =>
      '남은 현금으로 TQQQ를 매수하세요. 이후 적립식 자동매수으로 평단가를 낮추세요.';

  @override
  String get minus50HistoryTitle => '폭락 이후';

  @override
  String get minus50HistoryText =>
      '역사적으로 대폭락 이후 시장은 시간이 지나며 회복해왔습니다. 나스닥은 반드시 상승하는 구조입니다. 공포보다는 기회로 접근해야 합니다.';

  @override
  String get minus50RiskTitle => '심리적 압박';

  @override
  String get minus50RiskText => '심리적으로 압박 보다는 저가매수 기회라고 인식해야 합니다.';

  @override
  String get minus50GuideTitle => '생존 전략';

  @override
  String get minus50GuideText => 'TQQQ를 최대한 매입 후 적립식으로 평단가를 낮춰가며 대응합니다.';

  @override
  String get exchangeUsdKrw => '달러/원';

  @override
  String get exchangeUsdJpy => '달러/엔';

  @override
  String get exchangeEurUsd => '유로/달러';

  @override
  String get exchangeUsdRub => '달러/루블';

  @override
  String get exchangeUsdTwd => '달러/대만달러';

  @override
  String get exchangeUsdCny => '달러/위안';

  @override
  String get fearGreedExtremeFear => '극단적 공포';

  @override
  String get fearGreedFear => '공포';

  @override
  String get fearGreedNeutral => '중립';

  @override
  String get fearGreedGreed => '탐욕';

  @override
  String get fearGreedExtremeGreed => '극단적 탐욕';

  @override
  String get fearGreedIndicatorsTitle => '7가지 공포탐욕 지표';

  @override
  String get fearGreedFaqTitle => '공포탐욕지수 설명';

  @override
  String get fearGreedWhatTitle => 'CNN 공포탐욕지수란?';

  @override
  String get fearGreedWhatBody =>
      '공포탐욕지수는 주식시장의 심리와 가격이 과열 또는 위축되어 있는지를 보는 지표입니다. 과도한 공포는 주가를 낮추는 경향이 있고, 과도한 탐욕은 반대로 가격을 밀어 올릴 수 있습니다.';

  @override
  String get fearGreedCalculatedTitle => '공포탐욕지수는 어떻게 계산되나요?';

  @override
  String get fearGreedCalculatedBody =>
      '시장 모멘텀, 주가 강도, 시장 폭, 풋/콜 옵션, 정크본드 수요, 변동성, 안전자산 수요 등 7개 지표를 합산합니다. 각 지표는 동일한 비중으로 반영되어 0점부터 100점까지의 점수로 표시됩니다.';

  @override
  String get fearGreedFrequencyTitle => '얼마나 자주 계산되나요?';

  @override
  String get fearGreedFrequencyBody =>
      '각 구성 지표와 전체 지수는 새로운 시장 데이터가 들어올 때마다 갱신됩니다.';

  @override
  String get fearGreedUseTitle => '어떻게 활용하면 좋나요?';

  @override
  String get fearGreedUseBody =>
      '시장 분위기를 확인하는 보조 지표로 사용하세요. 투자자의 감정적 과열이나 공포를 점검하는 데 도움이 되지만, 실제 판단은 가격, 펀더멘털, 리스크 관리, 본인의 전략과 함께 확인하는 것이 좋습니다.';

  @override
  String get strategyAdLabel => '광고';

  @override
  String get alertSettingsTitle => '알림 설정';

  @override
  String get alertSettingsCloseBasisNote => '알림은 종가 기준으로 발송됩니다.';

  @override
  String get alertHighTitle => '신고가 알림';

  @override
  String get alertHighSubtitle => '앱 설치 후 새 최고가를 갱신하면 알림';

  @override
  String get alertMarketOpenTitle => '장시작 알림';

  @override
  String get alertMarketOpenSubtitle => '미국 정규장이 시작될 때 하루 한 번 알림';

  @override
  String get alertStrategySettingTitle => '전략 알림';

  @override
  String get alertStrategySettingSubtitle => '-20%, -30%, -40%, -50% 구간 변화 알림';

  @override
  String get noBuyHeadline => '추가 매수 금지, 현금 30% 유지';

  @override
  String get noBuyActionTitle => '즉시 행동';

  @override
  String get noBuyActionText =>
      '신규 QLD/TQQQ 매수는 하지 않습니다. 기존 QLD 비중을 유지하고 현금 30%를 지킵니다.';

  @override
  String get noBuyCashTitle => '현금 기준';

  @override
  String get noBuyCashText =>
      '현금은 다음 하락 구간을 위한 예비 자금입니다. 상승장이더라도 현금을 줄이지 않습니다.';

  @override
  String get noBuyAvoidTitle => '금지 행동';

  @override
  String get noBuyAvoidText => '가격이 오른다고 추격 매수하지 않습니다. -20% 구간이 오기 전까지는 기다립니다.';

  @override
  String get noBuyNextTitle => '다음 준비';

  @override
  String get noBuyNextText => '-20%에 도달하면 소수점 단위로 TQQQ 적립 매수를 시작할 준비를 합니다.';

  @override
  String get minus20ActionTitle => '즉시 행동';

  @override
  String get minus20ActionText =>
      '보유 현금의 1%씩 매주 TQQQ 적립 매수를 시작합니다.\n예) 현금 500달러 → 매주 5달러 매수';

  @override
  String get minus20BuyRuleTitle => '목적';

  @override
  String get minus20BuyRuleText =>
      '-20% 구간부터 횡보장이 길어질 때 조금씩 수량을 모아 TQQQ 평단가를 낮추기 위한 설정입니다. 핵심은 수익을 바로 맞히는 것이 아니라 낮은 평균단가를 만드는 것입니다.';

  @override
  String get minus20CashTitle => '현금 관리';

  @override
  String get minus20CashText =>
      '대부분의 현금은 -30%, -40%, -50% 구간을 위해 남깁니다. -50%에서 계획된 현금을 모두 사용한 뒤에도 새로 생기는 현금은 주간 적립으로 평단을 계속 낮춥니다.\n\n10주 이상 횡보가 이어지더라도 매주 1%씩 적립은 계속합니다. 횡보가 길어질수록 수량을 조금씩 늘려두는 것이 목적이며, 적립을 멈출 이유가 없습니다.\n\n이후 -30% 구간에 도달하면 그 시점에 남아 있는 현금의 20%를 한 번에 추가 매수합니다. 주간 적립은 중단하지 않고 -30% 전략과 함께 계속 이어갑니다. 적립 중단은 전고점을 회복하고 리밸런싱할 때 합니다.';

  @override
  String get minus20AvoidTitle => '정리 기준';

  @override
  String get minus20AvoidText =>
      '이 구간에서 모은 TQQQ는 단기 반등마다 정리하지 않습니다. 이후 신고가를 경신하고 TQQQ를 정리하는 시점에 함께 정리하는 전략으로 봅니다.';

  @override
  String get minus30ActionTitle => '즉시 행동';

  @override
  String get minus30ActionText =>
      '사용 가능한 현금의 20%만 TQQQ 매수에 사용합니다. 주문 전 현금 총액을 먼저 확인합니다.';

  @override
  String get minus30BuyRuleTitle => '매수 기준';

  @override
  String get minus30BuyRuleText =>
      '현금이 \$10,000이면 \$2,000만 TQQQ에 사용하고 남은 80%는 보존합니다.';

  @override
  String get minus30AdditionalTitle => '추가 행동';

  @override
  String get minus30AdditionalText =>
      'QLD 적립 매수는 유지할 수 있지만, TQQQ 추가 매수는 다음 구간까지 기다립니다.';

  @override
  String get minus30AvoidTitle => '금지 행동';

  @override
  String get minus30AvoidText =>
      '반등을 확신하고 현금을 크게 쓰지 않습니다. -40% 구간이 올 수 있다는 전제로 움직입니다.';

  @override
  String get minus40ActionTitle => '즉시 행동';

  @override
  String get minus40ActionText =>
      '남은 현금 중 30%를 TQQQ 매수에 사용합니다. 이미 -30%에서 사용한 금액은 제외하고 계산합니다.';

  @override
  String get minus40BuyRuleTitle => '매수 기준';

  @override
  String get minus40BuyRuleText =>
      '남은 현금이 \$8,000이면 \$2,400만 사용합니다. 한 번에 모두 쓰지 않는 것이 핵심입니다.';

  @override
  String get minus40HoldTitle => '보유 기준';

  @override
  String get minus40HoldText =>
      'QLD는 유지하고 TQQQ는 계획된 비중까지만 늘립니다. 추가 하락을 전제로 현금을 남깁니다.';

  @override
  String get minus40AvoidTitle => '금지 행동';

  @override
  String get minus40AvoidText =>
      '공포 때문에 기존 보유분을 던지지 않습니다. 동시에 욕심 때문에 전액 매수하지도 않습니다.';

  @override
  String get minus50ActionTitle => '즉시 행동';

  @override
  String get minus50ActionText =>
      '보유한 남은 현금 전체를 TQQQ 매수에 사용합니다. 이 구간은 현금 투입의 마지막 단계입니다.';

  @override
  String get minus50BuyRuleTitle => '매수 기준';

  @override
  String get minus50BuyRuleText =>
      '-30%, -40%에서 이미 사용한 금액을 제외하고 실제 남아 있는 현금만 기준으로 합니다.';

  @override
  String get minus50AfterTitle => '이후 행동';

  @override
  String get minus50AfterText =>
      '추가 현금이 생기면 정기적으로 TQQQ 또는 QLD를 적립합니다. 평균 단가를 낮추는 데 집중합니다.';

  @override
  String get minus50AvoidTitle => '금지 행동';

  @override
  String get minus50AvoidText =>
      '손실률만 보고 포기하지 않습니다. 다만 빚이나 단기 생활자금으로 추가 매수하지 않습니다.';

  @override
  String get alertNasdaq200Title => '나스닥 100의 200일 이동평균선';

  @override
  String get alertNasdaq200Subtitle => '나스닥100이 200일선을 붕괴/돌파하면 알림';

  @override
  String get alertNasdaq200Breakdown => '나스닥100이 200일선을 붕괴했습니다';

  @override
  String get alertNasdaq200Breakout => '나스닥100이 200일선을 돌파했습니다';

  @override
  String get chartGuideTitle => '차트 간단히 보는 법';

  @override
  String get chartMiniTitle => '3개월 차트와 20일·200일 평균이동선';

  @override
  String get chartGuideCandleTitle => '3개월 캔들봉';

  @override
  String get chartGuideCandleBody =>
      '최근 3개월 QLD 가격 흐름을 한눈에 보여줍니다. 초록은 상승 마감, 빨강은 하락 마감을 뜻합니다.';

  @override
  String get chartGuideMa200Title => '200일선';

  @override
  String get chartGuideMa200Body =>
      '장기 추세를 보는 기준선입니다. 가격이 위에 있으면 강세, 아래에 있으면 리스크와 현금 비중을 점검합니다.';

  @override
  String get chartMa200SheetTitle => '200일 평균이동선이란?';

  @override
  String get chartMa200SheetBody =>
      '200일 평균이동선은 최근 약 200거래일의 종가를 평균낸 장기 추세선입니다.\n\n많은 투자자들이 이 선을 참고하는 이유는 단기 변동보다 시장의 큰 방향을 보기 쉽기 때문입니다. 가격이 200일선 위에 있으면 장기 추세가 비교적 강하다고 해석하고, 아래에 있으면 추세가 약해졌거나 리스크 관리가 필요하다고 봅니다.\n\n다만 200일선은 매수·매도 신호를 단독으로 결정하는 도구가 아닙니다. QLD처럼 변동성이 큰 레버리지 ETF에서는 현금 비중, 하락률, 평균단가, 투자 기간을 함께 확인하는 참고 지표로 쓰는 것이 좋습니다.';

  @override
  String get chartMa20SheetTitle => '20일 평균이동선이란?';

  @override
  String get chartMa20SheetBody =>
      '20일 평균이동선은 최근 약 20거래일의 종가를 평균낸 단기 추세선입니다.\n\n많은 투자자들이 이 선을 보는 이유는 200일선보다 빠르게 움직여 최근 매수세와 단기 흐름을 확인하기 쉽기 때문입니다. 가격이 20일선 위에 머물면 단기 흐름이 강하다고 해석할 수 있고, 반복적으로 아래로 내려가면 최근 추세가 약해지고 있다고 볼 수 있습니다.\n\nQLD처럼 변동성이 큰 레버리지 ETF에서는 20일선이 단기 속도와 과열 여부를 보는 데 도움이 됩니다. 다만 신호가 자주 바뀔 수 있으므로 200일선, 현금 비중, 매수 구간과 함께 참고하는 것이 좋습니다.';

  @override
  String get alertPortfolioCashTitle => '현금 리밸런싱 알림';

  @override
  String get alertPortfolioCashSubtitle => '주가 상승 등으로 현금비중이 20% 이하가 되면 알림';

  @override
  String get alertPortfolioCashHigh => '현금비중이 20% 이하입니다. 리밸런싱으로 현금 확보를 검토하세요.';

  @override
  String get alertPortfolioCashLow => '현금비중이 20% 이하입니다. 리밸런싱으로 현금 확보를 검토하세요.';

  @override
  String get alertAnnouncementTitle => '공지사항 알림';

  @override
  String get alertAnnouncementSubtitle => 'QLD DIP ALERT에서 보낸 공지사항을 푸시 알림으로 받기';

  @override
  String get alertDetailTitle => '알림 상세';

  @override
  String get alertDetailOpenStrategy => '전략 보기';

  @override
  String get alertDetailRecovery =>
      '하락 구간이 회복되었습니다. 포트폴리오를 차분히 확인하고 급한 매도나 충동 매수는 피하세요.';

  @override
  String get alertDetailNewHigh =>
      '앱 설치 이후 새로운 최고가가 기록되었습니다. 앞으로 하락률 계산의 기준점으로 사용됩니다.';

  @override
  String get alertDetailMarketOpen =>
      '미국 정규장이 시작되었습니다. 오늘 행동할 계획이 있을 때만 가격과 전략 알림을 확인하세요.';

  @override
  String get alertDetailNasdaq200Breakdown =>
      '나스닥100이 200일 이동평균선 아래로 내려갔습니다. 장기 추세가 약해질 수 있으니 리스크와 현금 비중을 점검하세요.';

  @override
  String get alertDetailNasdaq200Breakout =>
      '나스닥100이 200일 이동평균선 위로 회복했습니다. 추세 개선 신호일 수 있지만 계획한 전략을 계속 기준으로 삼으세요.';

  @override
  String get alertDetailPortfolioCashHigh =>
      '현금 비중이 20% 기준 아래로 내려갔습니다. 주가 상승으로 보유주식 비중이 커졌을 가능성이 큽니다. 일부 보유주식을 줄이고 계획한 현금 비중까지 리밸런싱하는 것을 검토하세요.';

  @override
  String get alertDetailPortfolioCashLow =>
      '현금 비중이 20% 기준 아래로 내려갔습니다. 주가 상승으로 보유주식 비중이 커졌을 가능성이 큽니다. 일부 보유주식을 줄이고 계획한 현금 비중까지 리밸런싱하는 것을 검토하세요.';

  @override
  String get alertDetailOpenLink => '링크 열기';

  @override
  String get appUpdateTitle => '업데이트 안내';

  @override
  String get appUpdateMessage => '새 버전이 있습니다. 최신 기능과 수정사항을 사용하려면 업데이트해 주세요.';

  @override
  String get appUpdateLater => '나중에';

  @override
  String get appUpdateNow => '업데이트';

  @override
  String get alertTestTitle => '알림 테스트';

  @override
  String get alertPermissionHelpTitle => '알림이 오지 않나요?';

  @override
  String get alertPermissionHelpBody =>
      '기기 알림 권한이 꺼져 있으면 테스트 알림도 표시되지 않을 수 있습니다.';

  @override
  String get alertPermissionRequest => '권한 요청';

  @override
  String get alertPermissionOpenSettings => '설정 열기';

  @override
  String get holdPageTitle => '보유 유지';

  @override
  String get holdHeadline => '계획된 매수는 실행되었습니다. 회복 구간에서는 보유 유지에 집중합니다.';

  @override
  String get holdPositionTitle => '현재 보유 기준';

  @override
  String get holdPositionText =>
      '이미 매수한 QLD와 TQQQ를 그대로 유지합니다. 가격이 회복했던 구간에 다시 진입했다는 이유로 이전 구간 매수를 반복하지 않습니다.';

  @override
  String get holdActionTitle => '현재 행동';

  @override
  String get holdActionText => 'TQQQ 소수점 적립식 매수는 유지하고 회복 흐름을 관찰합니다.';

  @override
  String get holdAvoidTitle => '금지 행동';

  @override
  String get holdAvoidText => '변동성 때문에 급하게 매도하거나, 회복을 확신해 충동적으로 추가 매수하지 않습니다.';

  @override
  String get holdResetTitle => '전략 초기화';

  @override
  String get holdResetText =>
      'QLD가 전 고점까지 완전히 회복하면 이번 하락 사이클이 종료되고 전략은 첫 번째 매수 금지 상태로 돌아갑니다.';

  @override
  String get rebalanceTitle => '리밸런싱 구간';

  @override
  String get rebalanceHeadline => 'TQQQ 정리 후 기본 포지션으로 복귀';

  @override
  String get rebalanceOverviewTitle => '전략 개요';

  @override
  String get rebalanceOverviewText =>
      '전고점 회복은 위기 대응 단계가 종료되었음을 의미합니다. -20% 이하 구간에서 모은 TQQQ를 정리하고 기본 포지션(QLD 70%, 현금 30%)으로 복귀하기 위한 단계입니다.';

  @override
  String get rebalanceActionTitle => '즉시 행동';

  @override
  String get rebalanceActionText =>
      '-20% 이하 구간에서 적립하거나 매수한 TQQQ를 정리합니다. 이후 보유 자산을 기본 포지션 비중에 맞게 조정합니다.';

  @override
  String get rebalanceCashTitle => '현금 기준';

  @override
  String get rebalanceCashText =>
      '리밸런싱 후에는 QLD 70%, 현금 30% 비중을 유지합니다. 확보한 현금은 다음 하락 구간을 대비한 대기 자금으로 보관합니다.';

  @override
  String get rebalanceAvoidTitle => '금지 행동';

  @override
  String get rebalanceAvoidText =>
      '전고점 회복 이후에도 TQQQ 적립을 계속 이어가지 않습니다. 위기 구간 대응을 위해 모은 물량은 이 단계에서 정리하고 기본 포지션으로 복귀합니다.';

  @override
  String get investmentCalculatorTitle => '예상 수익률 계산기';

  @override
  String get investmentCalculatorSubtitle => 'QLD 과거 평균 기준 단순 복리 계산';

  @override
  String get investmentCalculatorReturnRate => '10년 평균 수익률';

  @override
  String get investmentCalculatorLumpSumTitle => '거치식 + 웅덩이 매수';

  @override
  String get investmentCalculatorAmount => '투자금액';

  @override
  String get investmentCalculatorYears => '기간';

  @override
  String get investmentCalculatorExpectedValue => '예상 평가금액';

  @override
  String get investmentCalculatorPrincipalMultiple => '원금 대비';

  @override
  String get investmentCalculatorMonthlyTitle => '적립식 투자';

  @override
  String get investmentCalculatorMonthlyAmount => '월 적립금';

  @override
  String get investmentCalculatorTotalPrincipal => '총 납입금';

  @override
  String get investmentCalculatorExpectedProfit => '예상 수익';

  @override
  String get investmentCalculatorDisclaimer =>
      '과거 수익률을 기준으로 한 단순 계산이며, 미래 수익률을 보장하지 않습니다.';

  @override
  String get investmentCalculatorYearsSuffix => '년';

  @override
  String get investmentCalculatorTimesSuffix => '배';

  @override
  String get investmentCalculatorChartHint =>
      '평균 수익률은 과거 차트를 통해 직접 검증해볼 수 있습니다.';

  @override
  String get investmentCalculatorCurrencySectionTitle => '환율 환산';

  @override
  String get investmentCalculatorCurrency => '국가/통화';

  @override
  String get investmentCalculatorExchangeRate => '1 USD 환율';

  @override
  String get investmentCalculatorExchangeRateHint =>
      '선택한 통화 기준으로 1달러가 얼마인지 직접 입력하세요.';

  @override
  String get investmentCalculatorConvertedLumpSum => '거치식 최종 금액';

  @override
  String get investmentCalculatorConvertedMonthly => '적립식 최종 금액';

  @override
  String get investmentCurrencyUnitedStatesUsd => '미국 USD';

  @override
  String get investmentCurrencyKoreaKrw => '한국 KRW';

  @override
  String get investmentCurrencyJapanJpy => '일본 JPY';

  @override
  String get investmentCurrencyChinaCny => '중국 CNY';

  @override
  String get investmentCurrencyTaiwanTwd => '대만 TWD';

  @override
  String get investmentCurrencyGermanyEur => '독일 EUR';

  @override
  String get investmentCurrencyFranceEur => '프랑스 EUR';

  @override
  String get investmentCurrencySpainEur => '스페인 EUR';

  @override
  String get investmentCurrencyPortugalEur => '포르투갈 EUR';

  @override
  String get investmentCurrencyRussiaRub => '러시아 RUB';

  @override
  String get contentTitle => '콘텐츠';

  @override
  String get contentInquiry => '문의사항';

  @override
  String get contentInquirySubtitle => '익명 문의를 남기고 답변을 확인합니다.';

  @override
  String get contentInquiryBadge => 'Q&A';

  @override
  String get contentCloseGuess => '종가 맞추기';

  @override
  String get contentStockQuote => '오늘의 주식 명언';

  @override
  String get contentStockQuoteSubtitle => '투자 감각을 다듬는 짧은 문장을 확인합니다.';

  @override
  String get contentStockQuoteBadge => '매일';

  @override
  String get contentNumberGuess => '숫자 맞추기';

  @override
  String get contentNumberGuessSubtitle => '가볍게 즐기는 확률형 미니게임입니다.';

  @override
  String get contentNumberGuessBadge => '게임';

  @override
  String get contentBookReader => '칼럼';

  @override
  String get contentBookReaderSubtitle => '차분히 읽을 수 있는 공개 도메인 텍스트입니다.';

  @override
  String get contentBookReaderBadge => '읽기';

  @override
  String get contentStockMeme => '주식 짤';

  @override
  String get contentLottoNumbers => '로또번호 추천';

  @override
  String get contentJumpDodge => '점프 장애물 피하기';

  @override
  String get contentJumpDodgeSubtitle => '짧게 집중해서 즐기는 점프 미니게임입니다.';

  @override
  String get contentJumpDodgeBadge => '액션';

  @override
  String get stockQuoteTitle => '오늘의 주식 명언';

  @override
  String get stockQuoteTapHint => '터치하면 다른 문구가 나옵니다.';

  @override
  String get stockQuoteShuffle => '다른 명언 보기';

  @override
  String get usageGuideTitle => '앱 사용방법';

  @override
  String get usageGuideSubtitle => '장기 우상향 나스닥 2배 레버리지 행동규칙';

  @override
  String get usageGuideCardTitle => '앱 사용방법';

  @override
  String get usageGuideCardSubtitle => '기본 포지션, 하락구간, 매수 기록, 보조지표';

  @override
  String get usageGuideWhatAppTitle => '이 앱은 어떤 앱인가요?';

  @override
  String get usageGuideWhatAppBody =>
      '이 앱은 장기 우상향하는 나스닥 2배 레버리지 투자자를 위한 행동규칙 안내 앱입니다.\n\n역대 최고가 대비 현재 하락률을 자동 계산하여 현재 위치를 확인하고, 각 구간에 맞는 투자 전략을 제공합니다.\n\n시장의 공포와 탐욕에 흔들리지 않고, 계획된 투자 원칙을 꾸준히 실천할 수 있도록 돕습니다.';

  @override
  String get usageGuideNoBuyTitle => '1. 기본 포지션과 전략을 먼저 읽기';

  @override
  String get usageGuideNoBuyBody =>
      '먼저 메인화면의 \"기본 포지션 카드\"를 눌러 어떤 방법으로 준비하는지 설명을 읽어보세요. 또한 오른쪽 최하단의 \"전략\" 탭을 눌러 상세한 전략을 숙지합니다.\n\n* 총 보유자금의 70%만큼 QLD를 매수하세요.';

  @override
  String get usageGuideStrategyTitle => '2. 하락구간별 자동 전략 확인';

  @override
  String get usageGuideStrategyBody =>
      '메인화면의 \"전략 카드\"에 역대최고가 대비 마이너스 몇%가 될 때마다 해당 구간의 전략 카드가 자동으로 표시되며, 그 카드를 클릭해 해당되는 매수나 리밸런싱을 하시면 됩니다. 또, 조건에 맞는 알림도 옵니다.';

  @override
  String get usageGuideIndicatorsTitle => '보조지표 4가지';

  @override
  String get usageGuideIndicatorsBody =>
      'CNN F&G는 시장이 공포 쪽인지 탐욕 쪽인지 보여주는 투자심리 지표입니다.\n\nVIX는 시장이 얼마나 불안한지 보여주는 변동성 지표입니다. 숫자가 높을수록 시장 불안이 크다고 볼 수 있습니다.\n\n미국 주요 일정에는 NFP, CPI, FOMC가 있습니다. NFP는 고용, CPI는 물가, FOMC는 금리 방향을 확인하는 일정입니다. 발표 결과에 따라 나스닥과 QLD가 크게 흔들릴 수 있어 확인합니다.\n\n10년 국채 수익률은 미국 10년물 금리입니다. 금리가 빠르게 오르면 성장주와 나스닥, QLD에는 부담이 될 수 있습니다.';

  @override
  String get usageGuideQldTitle => '3. 매수 후 포트폴리오에 기록';

  @override
  String get usageGuideQldBody =>
      '표시된 전략과 금액을 참고해 개인이 사용하는 거래소에서 직접 매수합니다. 매수 후에는 앱의 포트폴리오에 수량, 평균단가, 현금을 기록해 다음 전략 기준을 확인합니다.';

  @override
  String get usageGuideDisclaimer => '이 앱의 내용은 투자 참고용이며 수익을 보장하지 않습니다.';

  @override
  String get usageGuideConfirm => '확인';

  @override
  String get bookReadingTitle => '칼럼';

  @override
  String bookReaderPageNumber(int page) {
    return '$page페이지';
  }

  @override
  String get numGuessPrompt => '1부터 1000 사이 숫자를 맞춰보세요.';

  @override
  String get numGuessInvalidInput => '1부터 1000 사이 숫자를 입력해 주세요.';

  @override
  String numGuessCorrect(int attempts) {
    return '정답입니다. $attempts번 만에 맞췄어요.';
  }

  @override
  String get numGuessTooLow => '더 큰 숫자입니다.';

  @override
  String get numGuessTooHigh => '더 작은 숫자입니다.';

  @override
  String numGuessAttemptsLabel(int count) {
    return '시도 횟수 $count';
  }

  @override
  String numGuessLastGuessLabel(int number) {
    return '입력값: $number';
  }

  @override
  String get numGuessInputHint => '숫자 입력';

  @override
  String get numGuessConfirm => '확인';

  @override
  String get numGuessNewGame => '새 게임';

  @override
  String get numGuessRanking => '랭킹';

  @override
  String get numGuessNoRecords => '아직 기록이 없습니다.';

  @override
  String numGuessAttemptCount(int count) {
    return '$count회';
  }

  @override
  String get jumpLeaderboard => '전체 신기록';

  @override
  String get jumpScore => '점수';

  @override
  String get jumpPersonalBest => '내 신기록';

  @override
  String get jumpTapToRestart => '다시 시작하려면 탭';

  @override
  String get jumpTapToStart => '탭해서 시작';

  @override
  String get jumpInstruction => '화면을 탭해서 점프하고 장애물을 피하세요.';

  @override
  String get inquiryLoadError => '문의 목록을 불러오지 못했습니다.';

  @override
  String get inquiryAdminOnlyReply => '관리자만 답변을 등록할 수 있습니다.';

  @override
  String get inquiryReplyEmpty => '답변 내용을 입력해 주세요.';

  @override
  String get inquiryReplyError => '답변 등록에 실패했습니다. 잠시 후 다시 시도해 주세요.';

  @override
  String get inquiryAdminOnlyPin => '관리자만 고정할 수 있습니다.';

  @override
  String get inquiryPinError => '고정 상태를 저장하지 못했습니다.';

  @override
  String get inquiryAdminOnlyDelete => '관리자만 삭제할 수 있습니다.';

  @override
  String get inquiryDeleteTitle => '문의 삭제';

  @override
  String get inquiryDeleteConfirm => '이 문의를 삭제할까요?';

  @override
  String get inquiryCancel => '취소';

  @override
  String get inquiryDeleteAction => '삭제';

  @override
  String get inquiryDeleteError => '삭제에 실패했습니다. 잠시 후 다시 시도해 주세요.';

  @override
  String get inquiryContentEmpty => '문의 내용을 입력해 주세요.';

  @override
  String get inquirySubmitError => '문의 등록에 실패했습니다. 잠시 후 다시 시도해 주세요.';

  @override
  String get inquiryAdminLabel => '관리자';

  @override
  String get inquiryPasswordLabel => '비밀번호';

  @override
  String get inquiryPasswordWrong => '비밀번호가 맞지 않습니다.';

  @override
  String get inquiryAdminActivatedRegistered => '관리자 전환 완료 (기기 등록됨)';

  @override
  String get inquiryAdminActivatedFailed => '관리자 전환 완료 (기기 등록 실패)';

  @override
  String get inquiryContentDetailLabel => '문의 내용';

  @override
  String get inquiryAdminReplyLabel => '관리자 답변';

  @override
  String get inquiryAdminReplyEdit => '답변 수정';

  @override
  String get inquirySaving => '저장 중';

  @override
  String get inquirySubmitReply => '답변 등록';

  @override
  String get inquiryPrevPage => '이전 페이지';

  @override
  String get inquiryNextPage => '다음 페이지';

  @override
  String inquiryPageOf(int current, int total) {
    return '$current페이지 / $total페이지';
  }

  @override
  String get inquiryUnpin => '상단 고정 해제';

  @override
  String get inquiryPin => '상단 고정';

  @override
  String get inquiryListTitle => '문의 리스트';

  @override
  String get inquiryEmpty => '아직 등록된 문의가 없습니다.';

  @override
  String get inquiryWriteTitle => '문의 작성';

  @override
  String get inquiryContentFieldLabel => '내용';

  @override
  String get inquirySubmitting => '등록 중';

  @override
  String get inquirySubmitButton => '등록';

  @override
  String get inquiryUserReplyLabel => '추가 메시지 입력...';

  @override
  String get indicatorCnnFearGreed => 'CNN 공포탐욕';

  @override
  String get indicatorVix => 'VIX 변동성';

  @override
  String get indicatorUsSchedule => '미국 중요 발표 일정';

  @override
  String get indicatorTenYearYield => '미국 10년 국채수익률';

  @override
  String get indicatorUsMarketTime => '미국장 남은시간';

  @override
  String get indicatorVixHigh => '높은 변동성 구간';

  @override
  String get indicatorVixStable => '보통 구간';

  @override
  String get indicatorVixDefault => '시장 불안 심리 지표';

  @override
  String get indicatorVixLow => '변동성 매우 낮은 구간';

  @override
  String get indicatorVixCaution => '주의 구간';

  @override
  String get indicatorTenYearDesc => '미국 10년물 금리 지표';

  @override
  String get marketWeekendLabel => '주말 휴장 · 개장까지';

  @override
  String get marketPreOpenLabel => '개장까지';

  @override
  String get marketToCloseLabel => '마감까지';

  @override
  String get marketClosedLabel => '장 마감';

  @override
  String get marketClosedValue => '휴장중';

  @override
  String get noData => '데이터 없음';

  @override
  String get rsiOverbought => '과매수';

  @override
  String get rsiOversold => '과매도';

  @override
  String get rsiNormal => '중립';

  @override
  String get rsiOverboughtZone => '과매수 구간';

  @override
  String get rsiOversoldZone => '과매도 구간';

  @override
  String get rsiNormalZone => '정상 범위';

  @override
  String get rsiOverboughtOversold => '과매수 / 과매도';

  @override
  String get coverStrategyTab => '전략 탭';

  @override
  String get coverStrategyHint => '위로 올리면 전략탭이 표시됩니다';

  @override
  String get usScheduleSheetTitle => '미국 주요일정';

  @override
  String get noScheduleLeft => '등록된 일정이 없습니다';

  @override
  String get scheduleNameHint => '일정명';

  @override
  String get adminPassword => '관리자 비밀번호';

  @override
  String get addSchedule => '일정 추가';

  @override
  String get wrongPassword => '비밀번호가 틀렸습니다.';

  @override
  String get checkScheduleNameAndDate => '일정명과 날짜를 확인해주세요.';

  @override
  String get editSchedule => '일정 수정';

  @override
  String get rsiDialogTitle => 'RSI(14)란?';

  @override
  String get rsiDialogContent =>
      'RSI(Relative Strength Index)는 최근 14일간의 상승폭과 하락폭을 비교해 현재 주가의 과열·침체 여부를 0~100으로 나타내는 지표입니다.\n\n• 70 이상 → 과매수 구간\n  단기 급등으로 조정 가능성이 높습니다.\n\n• 30 이하 → 과매도 구간\n  단기 급락으로 반등 가능성이 있습니다.\n\n• 30~70 → 정상 범위\n  과열·침체 신호 없음.';

  @override
  String get inquiryEditMessageTitle => '메시지 수정';

  @override
  String get inquiryEditMessageSave => '수정 완료';

  @override
  String get inquiryTapToEdit => '탭하여 수정';

  @override
  String get stockQuoteList =>
      '다른 사람이 탐욕스러울 때는 조심하고, 모두가 두려워할 때는 기회를 보라. — 워런 버핏\n가격은 지불하는 것이고, 가치는 얻는 것이다. — 워런 버핏\n훌륭한 회사를 적당한 가격에 사는 편이 낫다. — 워런 버핏\n이해하지 못하는 사업에는 투자하지 마라. — 워런 버핏\n위험은 자신이 무엇을 하는지 모를 때 커진다. — 워런 버핏\n좋은 기업을 샀다면 보유 기간은 길수록 좋다. — 워런 버핏\n평판을 쌓는 데는 오래 걸리지만 잃는 데는 짧은 순간이면 충분하다. — 워런 버핏\n시장 변동은 적이 아니라 기회가 될 수 있다. — 워런 버핏\n비가 온 뒤에야 누가 무리하게 헤엄쳤는지 보인다. — 워런 버핏\n투자자는 홈런보다 큰 실수를 피하는 데 집중해야 한다. — 워런 버핏\n능력 범위 안에서만 움직이면 실수는 줄어든다. — 워런 버핏\n주식을 사는 것은 종이 조각이 아니라 기업 일부를 사는 일이다. — 워런 버핏\n시장이 10년 닫혀도 보유할 종목만 사라. — 워런 버핏\n단기 가격보다 기업의 장기 수익력을 보라. — 워런 버핏\n훌륭한 경영진보다 훌륭한 사업 구조가 더 중요할 때가 많다. — 워런 버핏\n복잡한 것보다 단순하고 확실한 것을 선택하라. — 워런 버핏\n자신에게 투자하는 것이 가장 좋은 투자일 수 있다. — 워런 버핏\n조급한 매매보다 오래 버틸 수 있는 판단이 중요하다. — 워런 버핏\n모든 공을 칠 필요는 없다. 좋은 공이 올 때까지 기다려라. — 워런 버핏\n투자는 IQ보다 기질이 더 중요하다. — 워런 버핏\n훌륭한 기업은 시간이 지날수록 가치를 드러낸다. — 워런 버핏\n싼 가격보다 중요한 것은 좋은 사업을 제대로 이해하는 것이다. — 워런 버핏\n시장의 소음보다 기업의 현금흐름을 보라. — 워런 버핏\n빚에 기대는 투자는 좋은 판단도 위험하게 만든다. — 워런 버핏\n현금은 기회가 왔을 때 행동할 수 있게 해 준다. — 워런 버핏\n큰돈은 잦은 매매가 아니라 기다림에서 나온다. — 찰리 멍거\n똑똑해지려 애쓰기보다 어리석은 행동을 피하라. — 찰리 멍거\n문제를 풀기 어렵다면 거꾸로 생각해 보라. — 찰리 멍거\n평판과 정직함은 한순간에 사라질 수 있는 자산이다. — 찰리 멍거\n좋은 사업을 오래 보유하는 것이 복리의 핵심이다. — 찰리 멍거\n인센티브를 이해하면 사람의 행동을 더 잘 이해할 수 있다. — 찰리 멍거\n자주 움직일수록 실수할 기회도 늘어난다. — 찰리 멍거\n투자는 기다리는 능력을 요구한다. — 찰리 멍거\n좋은 판단은 여러 분야의 지식을 연결할 때 나온다. — 찰리 멍거\n질 좋은 사업은 시간이 투자자의 편이 되게 만든다. — 찰리 멍거\n기회가 드물다면 준비된 사람이 유리하다. — 찰리 멍거\n매일 똑똑해지기보다 매일 덜 어리석어져라. — 찰리 멍거\n성공은 복잡한 공식보다 기본기를 지키는 데서 온다. — 찰리 멍거\n좋은 투자는 인내심 없는 사람에게 불편하게 느껴진다. — 찰리 멍거\n세상 모든 실수를 직접 경험할 필요는 없다. 남의 실수에서 배워라. — 찰리 멍거\n탁월한 결과는 드문 기회에 크게 행동할 때 나온다. — 찰리 멍거\n좋은 사업을 비싸게 사는 실수를 경계하라. — 찰리 멍거\n투자에서 가장 위험한 말은 대충 안다는 착각이다. — 찰리 멍거\n단순함을 유지하는 것이 장기 성과에 도움이 된다. — 찰리 멍거\n시장을 이기려면 먼저 자신의 충동을 이겨야 한다. — 찰리 멍거\n안전마진은 투자자의 방어막이다. — 벤저민 그레이엄\n단기 시장은 인기투표지만 장기 시장은 저울이다. — 벤저민 그레이엄\n현명한 투자자는 낙관론자에게 팔고 비관론자에게 산다. — 벤저민 그레이엄\n가격 변동은 명령이 아니라 제안일 뿐이다. — 벤저민 그레이엄\n투자는 분석에 근거해야 하고 투기는 기대에 의존한다. — 벤저민 그레이엄\nMr. Market의 기분에 휘둘리지 말고 이용하라. — 벤저민 그레이엄\n가치보다 충분히 싸게 사는 것이 실수에 대비하는 방법이다. — 벤저민 그레이엄\n손실을 막는 원칙이 수익을 만드는 원칙보다 먼저다. — 벤저민 그레이엄\n시장은 때로 비이성적이지만 가치는 결국 반영된다. — 벤저민 그레이엄\n확실하지 않을수록 안전마진은 더 커야 한다. — 벤저민 그레이엄\n투자자는 가격보다 가치를 먼저 계산해야 한다. — 벤저민 그레이엄\n좋은 분석은 흥분보다 차분함에서 나온다. — 벤저민 그레이엄\n방어적인 투자자는 과도한 자신감을 피한다. — 벤저민 그레이엄\n원칙 없는 기대수익은 투자라기보다 투기에 가깝다. — 벤저민 그레이엄\n시장의 변덕은 장기 투자자의 친구가 될 수 있다. — 벤저민 그레이엄\n싸다는 이유만으로 충분하지 않다. 가치와 안전마진이 필요하다. — 벤저민 그레이엄\n대중의 감정보다 숫자와 가치를 믿어라. — 벤저민 그레이엄\n실수할 가능성을 인정하는 사람이 더 오래 살아남는다. — 벤저민 그레이엄\n투자에서 첫 번째 질문은 얼마나 벌 수 있느냐가 아니라 얼마나 잃을 수 있느냐다. — 벤저민 그레이엄\n좋은 투자란 충분한 근거와 충분한 안전마진을 함께 가진 결정이다. — 벤저민 그레이엄\n무엇을 보유했는지, 왜 보유했는지 알아야 한다. — 피터 린치\n주식은 복권이 아니라 기업의 일부다. — 피터 린치\n기업이 잘하면 장기적으로 주가도 따라간다. — 피터 린치\n자신이 이해하는 곳에서 투자 아이디어를 찾을 수 있다. — 피터 린치\n조사를 하지 않은 투자는 희망에 가깝다. — 피터 린치\n하락장은 반복된다. 중요한 것은 견딜 수 있는가다. — 피터 린치\n주식시장에서 배짱은 지식만큼 중요하다. — 피터 린치\n좋은 종목도 스토리가 변하면 다시 점검해야 한다. — 피터 린치\n모든 종목이 성공할 필요는 없다. 큰 승자가 포트폴리오를 바꾼다. — 피터 린치\n주가보다 기업의 이야기가 먼저다. — 피터 린치\n잘 아는 사업이라도 숫자를 확인해야 한다. — 피터 린치\n시장을 맞히려 하기보다 좋은 회사를 찾는 데 집중하라. — 피터 린치\n개인 투자자는 일상 속에서 좋은 기업을 먼저 발견할 수 있다. — 피터 린치\n인기 없는 좋은 기업이 더 큰 기회를 줄 때가 있다. — 피터 린치\n급락을 견딜 배짱이 없다면 주식 비중을 낮춰야 한다. — 피터 린치\n종목을 사랑하지 말고 기업의 실적을 확인하라. — 피터 린치\n가장 큰 실수는 모르는 것을 아는 척하는 것이다. — 피터 린치\n좋은 투자 아이디어는 복잡한 설명을 필요로 하지 않는다. — 피터 린치\n주가가 내렸다는 이유만으로 싸다고 착각하지 마라. — 피터 린치\n성장주는 성장 스토리가 깨지는 순간 다시 봐야 한다. — 피터 린치\n투자의 승리 공식은 넓게 보유하고 오래 버티는 것이다. — 존 보글\n코스를 지켜라. 시장의 소음 때문에 계획을 바꾸지 마라. — 존 보글\n건초더미에서 바늘을 찾지 말고 건초더미 전체를 사라. — 존 보글\n비용은 확실한 손실이고 수익은 불확실하다. — 존 보글\n시간은 친구이고 충동은 적이다. — 존 보글\n투기에는 감정이 앞서고 투자는 감정을 줄인다. — 존 보글\n장기 투자자는 시장을 예측하지 않아도 된다. — 존 보글\n낮은 비용은 투자자가 통제할 수 있는 가장 강력한 변수다. — 존 보글\n시장 전체를 보유하면 개별 종목 실수를 줄일 수 있다. — 존 보글\n가만히 있는 능력은 투자자의 경쟁력이다. — 존 보글\n복잡한 상품보다 단순한 인덱스가 더 오래 살아남는다. — 존 보글\n수익률을 쫓는 행동이 수익률을 낮출 수 있다. — 존 보글\n투자자는 미래를 알 수 없지만 비용은 줄일 수 있다. — 존 보글\n분산과 낮은 비용, 장기 보유가 기본이다. — 존 보글\n시장은 장기적으로 기업 전체의 성과를 반영한다. — 존 보글\n자주 확인할수록 흔들릴 이유만 늘어난다. — 존 보글\n투자 계획은 감정이 아니라 원칙으로 유지해야 한다. — 존 보글\n지루한 투자가 가장 강한 결과를 만들 수 있다. — 존 보글\n시장의 평균을 꾸준히 받는 것도 강한 전략이다. — 존 보글\n장기 투자에서 가장 큰 적은 비용과 감정이다. — 존 보글\n뛰어난 투자는 남들과 다르게, 더 깊게 생각하는 데서 시작된다. — 하워드 막스\n위험은 변동성이 아니라 영구 손실 가능성에 가깝다. — 하워드 막스\n리스크를 없앨 수는 없지만 통제할 수는 있다. — 하워드 막스\n가격이 높을수록 미래 수익률의 안전마진은 줄어든다. — 하워드 막스\n사이클을 무시하는 투자자는 반복해서 놀라게 된다. — 하워드 막스\n좋은 자산도 너무 비싸게 사면 나쁜 투자가 된다. — 하워드 막스\n투자에서 중요한 것은 맞히는 빈도보다 손익의 비대칭이다. — 하워드 막스\n방어는 약세장이 오기 전에 준비해야 한다. — 하워드 막스\n대중이 확신할수록 반대로 생각할 필요가 커진다. — 하워드 막스\n수익은 가격과 가치의 차이를 이해할 때 생긴다. — 하워드 막스\n성공한 투자는 확률 게임을 잘하는 것이다. — 하워드 막스\n너무 좋은 분위기는 위험을 싸게 보이게 만든다. — 하워드 막스\n시장의 심리는 가격을 가치에서 멀어지게 만들 수 있다. — 하워드 막스\n보수적인 투자는 기회를 포기하는 것이 아니라 생존 확률을 높이는 것이다. — 하워드 막스\n리스크 관리는 수익률이 좋을 때 가장 필요하다. — 하워드 막스\n2차적 사고는 모두가 보는 것을 다르게 해석하는 능력이다. — 하워드 막스\n최고의 매수는 대개 가장 편안한 순간에 오지 않는다. — 하워드 막스\n위험을 인식하지 못하는 것이 가장 큰 위험이다. — 하워드 막스\n시장이 극단에 가까워질수록 신중함은 더 중요하다. — 하워드 막스\n투자는 확실성의 게임이 아니라 확률의 게임이다. — 하워드 막스\n최대 비관의 시기는 최고의 매수 기회가 될 수 있다. — 존 템플턴\n최대 낙관의 시기는 매도를 고민할 때다. — 존 템플턴\n강세장은 비관에서 태어나 회의 속에 자라고 낙관 속에 성숙한다. — 존 템플턴\n환희가 시장을 지배할 때 강세장은 위험해진다. — 존 템플턴\n가장 좋은 기회는 사람들이 외면하는 곳에 있다. — 존 템플턴\n남들이 팔 때 살 수 있는 용기가 필요하다. — 존 템플턴\n이번에는 다르다는 말은 대개 가장 위험하다. — 존 템플턴\n세계 어디든 싼 가치가 있다면 찾아볼 수 있어야 한다. — 존 템플턴\n비관론은 가격을 낮추고, 낮은 가격은 기회를 만든다. — 존 템플턴\n군중이 싫어하는 자산을 차분히 살펴보라. — 존 템플턴\n투자자는 낙관주의자이되 가격에는 냉정해야 한다. — 존 템플턴\n위대한 기회는 대중의 관심 밖에서 시작된다. — 존 템플턴\n최악의 뉴스가 항상 최악의 투자를 의미하지는 않는다. — 존 템플턴\n가격이 충분히 낮다면 불확실성도 보상받을 수 있다. — 존 템플턴\n비관 속에서 산 사람은 낙관 속에서 팔 준비를 해야 한다. — 존 템플턴\n시장은 감정의 극단에서 가장 큰 실수를 만든다. — 존 템플턴\n기회는 편안한 곳보다 불편한 곳에서 자주 나온다. — 존 템플턴\n군중과 반대로 가려면 근거와 용기가 함께 필요하다. — 존 템플턴\n장기 수익은 가장 인기 없는 순간의 판단에서 시작될 수 있다. — 존 템플턴\n투자자는 공포를 피하는 사람이 아니라 공포를 분석하는 사람이다. — 존 템플턴\n큰돈은 맞히는 것보다 끝까지 버티는 데서 나왔다. — 제시 리버모어\n시장은 틀리지 않는다. 의견이 틀릴 뿐이다. — 제시 리버모어\n계속 행동하려는 욕구가 많은 손실을 만든다. — 제시 리버모어\n손실은 작을 때 인정해야 한다. — 제시 리버모어\n추세가 살아 있다면 조급하게 내릴 필요가 없다. — 제시 리버모어\n맞고도 버티지 못하면 큰돈은 벌기 어렵다. — 제시 리버모어\n매일 돈을 벌어야 한다는 생각은 트레이더를 망친다. — 제시 리버모어\n손실 포지션에 물타기하는 것은 위험한 습관이다. — 제시 리버모어\n시장을 설득하려 하지 말고 시장의 말을 들어라. — 제시 리버모어\n가격 움직임 앞에서 자존심은 비용이 된다. — 제시 리버모어\n매수보다 중요한 것은 언제 틀렸는지 아는 것이다. — 제시 리버모어\n큰 추세는 인내한 사람에게 보상한다. — 제시 리버모어\n좋은 판단도 조급한 청산으로 무너질 수 있다. — 제시 리버모어\n시장은 개인의 희망을 신경 쓰지 않는다. — 제시 리버모어\n잦은 매매는 기회보다 실수를 더 많이 만든다. — 제시 리버모어\n큰돈은 조용히 앉아 있을 줄 아는 사람에게 간다. — 제시 리버모어\n투기에서 살아남으려면 먼저 손실을 제한해야 한다. — 제시 리버모어\n가격이 말하는 방향을 무시하지 마라. — 제시 리버모어\n확신보다 중요한 것은 틀렸을 때 빠져나오는 능력이다. — 제시 리버모어\n트레이딩에서 자제력은 분석력만큼 중요하다. — 제시 리버모어\n주식시장은 돈과 심리로 움직인다. — 앙드레 코스톨라니\n주인은 천천히 걷고 개는 앞뒤로 뛰지만 결국 함께 간다. — 앙드레 코스톨라니\n투자자는 돈, 생각, 인내를 가져야 한다. — 앙드레 코스톨라니\n주식시장에서 가장 비싼 것은 조급함이다. — 앙드레 코스톨라니\n대중이 흥분할 때는 한 걸음 물러나라. — 앙드레 코스톨라니\n좋은 투자자는 시장의 기분을 읽되 따라가지 않는다. — 앙드레 코스톨라니\n가격은 심리에 흔들리지만 가치는 시간이 필요하다. — 앙드레 코스톨라니\n투자에는 상상력도 필요하지만 인내가 더 필요하다. — 앙드레 코스톨라니\n빚으로 투자하면 시간이 적이 된다. — 앙드레 코스톨라니\n주식은 인내심 없는 사람의 돈을 인내심 있는 사람에게 옮긴다. — 앙드레 코스톨라니\n대중과 같은 생각을 하면서 대중보다 나은 결과를 기대하기 어렵다. — 앙드레 코스톨라니\n시장에는 논리보다 심리가 먼저 움직이는 날이 많다. — 앙드레 코스톨라니\n기다림 없는 투자는 투기와 가까워진다. — 앙드레 코스톨라니\n돈이 급한 투자자는 시장의 변덕을 견디기 어렵다. — 앙드레 코스톨라니\n하락은 고통스럽지만 기회의 언어이기도 하다. — 앙드레 코스톨라니\n시장을 너무 자주 보면 생각보다 감정이 앞선다. — 앙드레 코스톨라니\n인내심은 투자자의 숨은 자본이다. — 앙드레 코스톨라니\n좋은 아이디어도 시간이 없으면 실패할 수 있다. — 앙드레 코스톨라니\n투자자는 군중의 환호보다 자신의 판단을 믿어야 한다. — 앙드레 코스톨라니\n시장에서 오래 살아남는 사람이 결국 많은 것을 배운다. — 앙드레 코스톨라니\n고통은 성찰을 만나야 진보가 된다. — 레이 달리오\n모르는 것을 인정하는 것이 리스크 관리의 시작이다. — 레이 달리오\n상관관계가 낮은 자산을 섞으면 포트폴리오가 더 안정될 수 있다. — 레이 달리오\n원칙이 없으면 위기 때 감정이 결정을 대신한다. — 레이 달리오\n현실을 있는 그대로 보는 능력이 좋은 의사결정의 출발점이다. — 레이 달리오\n투자자는 확신보다 검증 가능한 원칙을 가져야 한다. — 레이 달리오\n분산은 무지를 숨기는 것이 아니라 불확실성을 인정하는 방법이다. — 레이 달리오\n자신의 약점을 모르면 시장이 대신 알려준다. — 레이 달리오\n좋은 시스템은 감정적인 순간에도 같은 기준을 적용한다. — 레이 달리오\n큰 그림을 이해하면 단기 소음에 덜 흔들린다. — 레이 달리오\n중요한 것은 맞고 틀림이 아니라 맞을 때 얼마나 벌고 틀릴 때 얼마나 잃느냐다. — 조지 소로스\n시장은 현실을 반영할 뿐 아니라 현실에 영향을 주기도 한다. — 조지 소로스\n틀렸다는 것을 빨리 인정하는 능력은 강한 무기다. — 조지 소로스\n생존이 먼저이고 수익은 그다음이다. — 조지 소로스\n확신이 커질수록 반대 가능성도 점검해야 한다. — 조지 소로스\n시장의 착각은 오래 지속될 수 있다. — 조지 소로스\n좋은 투자자는 자신의 오류를 빠르게 수정한다. — 조지 소로스\n위험한 것은 틀리는 것이 아니라 틀린 채 버티는 것이다. — 조지 소로스\n기회가 클수록 포지션 관리가 더 중요하다. — 조지 소로스\n투자는 불완전한 정보 속에서 결정을 내리는 일이다. — 조지 소로스\n공격보다 방어가 먼저다. — 폴 튜더 존스\n손실 포지션에 물타기하는 사람은 결국 더 큰 위험을 만든다. — 폴 튜더 존스\n자본을 지키면 다음 기회가 온다. — 폴 튜더 존스\n시장에서 영웅이 되려 하지 마라. — 폴 튜더 존스\n손실을 작게 만드는 능력이 장기 성과를 만든다. — 폴 튜더 존스\n가격이 자신의 생각과 다르게 움직이면 먼저 리스크를 줄여라. — 폴 튜더 존스\n큰 수익보다 큰 손실을 피하는 것이 먼저다. — 폴 튜더 존스\n트레이딩에서 자존심은 손실을 키운다. — 폴 튜더 존스\n방어적인 마음가짐은 약함이 아니라 생존 전략이다. — 폴 튜더 존스\n손실 관리 없는 공격은 오래가지 못한다. — 폴 튜더 존스\n손실은 작을 때 자르는 것이 원칙이다. — 윌리엄 오닐·마크 미너비니\n강한 주식은 강한 이유가 있다. — 윌리엄 오닐·마크 미너비니\n추세와 싸우지 마라. — 윌리엄 오닐·마크 미너비니\n차트는 의견보다 빠르게 위험을 보여줄 때가 있다. — 윌리엄 오닐·마크 미너비니\n큰 승자를 잡으려면 먼저 큰 패자를 피해야 한다. — 윌리엄 오닐·마크 미너비니\n규칙 없는 매매는 감정의 기록일 뿐이다. — 윌리엄 오닐·마크 미너비니\n시장의 리더를 찾되 리스크는 숫자로 제한하라. — 윌리엄 오닐·마크 미너비니\n매수보다 중요한 것은 틀렸을 때의 행동이다. — 윌리엄 오닐·마크 미너비니\n좋은 진입도 나쁜 손절 습관을 이기지 못한다. — 윌리엄 오닐·마크 미너비니\n강세장에서는 강한 종목이 더 강해질 수 있다. — 윌리엄 오닐·마크 미너비니\n대부분의 투자자에게 시장 전체를 보유하는 것이 합리적이다. — 버턴 말킬\n시장을 맞히기 어렵다면 낮은 비용으로 오래 참여하라. — 버턴 말킬\n무작위처럼 보이는 가격 움직임에 과도한 의미를 붙이지 마라. — 버턴 말킬\n인덱스 투자는 단순하지만 강력한 선택이다. — 버턴 말킬\n예측이 어렵다면 비용과 분산을 통제하라. — 버턴 말킬\n투자자는 자신이 통제할 수 있는 것에 집중해야 한다. — 버턴 말킬\n장기적으로 시장에 머무는 것이 시장을 맞히는 것보다 현실적이다. — 버턴 말킬\n유행하는 전략보다 검증된 단순함이 오래간다. — 버턴 말킬\n복잡한 예측은 낮은 비용의 힘을 자주 이기지 못한다. — 버턴 말킬\n평균을 꾸준히 얻는 전략은 생각보다 강하다. — 버턴 말킬\n훌륭한 기업은 숫자 너머의 질적 요소가 있다. — 필립 피셔\n성장주는 경영진과 시장 기회를 함께 봐야 한다. — 필립 피셔\n좋은 기업은 오래 보유할수록 진가가 드러날 수 있다. — 필립 피셔\n기업을 이해하려면 주변의 목소리까지 조사하라. — 필립 피셔\n매도는 매수보다 더 어려운 결정일 수 있다. — 필립 피셔\n장기 성장 기업은 단기 변동을 견딜 이유를 제공한다. — 필립 피셔\n좋은 경영진은 숫자에 보이지 않는 가치를 만든다. — 필립 피셔\n성장 가능성과 가격을 함께 보라. — 필립 피셔\n기업의 질을 모르면 장기 보유도 흔들린다. — 필립 피셔\n훌륭한 기업은 시간이 투자자의 친구가 되게 한다. — 필립 피셔\n안전마진은 불확실성을 인정하는 투자자의 언어다. — 세스 클라만\n가치투자는 인기보다 가격과 가치의 차이를 본다. — 세스 클라만\n위험은 남들이 위험하지 않다고 느낄 때 커질 수 있다. — 세스 클라만\n인내심은 가치투자자의 가장 중요한 자산 중 하나다. — 세스 클라만\n싼 가격에도 이유가 있는지 확인해야 한다. — 세스 클라만\n손실을 피하려는 태도가 장기 수익의 기반이 된다. — 세스 클라만\n좋은 기회는 자주 오지 않기 때문에 현금이 필요할 수 있다. — 세스 클라만\n투자자는 시장의 인기가 아니라 자신의 분석에 의존해야 한다. — 세스 클라만\n가치와 가격의 괴리가 클수록 기회도 커질 수 있다. — 세스 클라만\n안전마진 없는 확신은 위험한 자신감이다. — 세스 클라만\n좋은 회사를 싸게 사는 원칙은 단순하지만 쉽지 않다. — 조엘 그린블라트\n수익률이 높은 사업과 낮은 가격이 만나면 기회가 된다. — 조엘 그린블라트\n단순한 원칙도 지키지 못하면 성과가 나지 않는다. — 조엘 그린블라트\n가치투자는 지루해 보여도 시간이 필요하다. — 조엘 그린블라트\n시장이 단기적으로 틀릴 수 있다는 사실이 기회를 만든다. — 조엘 그린블라트\n좋은 전략은 모두가 따라 하기 어려워야 오래간다. — 조엘 그린블라트\n가격이 가치보다 낮을 때 투자자의 우위가 생긴다. — 조엘 그린블라트\n기업의 질과 가격을 함께 봐야 한다. — 조엘 그린블라트\n장기적으로 숫자는 이야기보다 강하다. — 조엘 그린블라트\n인내 없이 가치투자를 하기는 어렵다. — 조엘 그린블라트\n동전 던지기에서 앞면이면 크게 벌고 뒷면이면 적게 잃는 구조를 찾아라. — 모니시 파브라이\n단순한 아이디어가 큰 수익을 만들 수 있다. — 모니시 파브라이\n좋은 투자자는 훌륭한 투자자의 원칙을 복제할 줄 안다. — 모니시 파브라이\n하방은 제한하고 상방은 열어 두는 투자가 좋다. — 모니시 파브라이\n복잡한 문제보다 명확한 기회를 기다려라. — 모니시 파브라이\n투자자는 많은 결정보다 좋은 결정을 해야 한다. — 모니시 파브라이\n가끔 오는 확실한 기회에 집중하라. — 모니시 파브라이\n잃을 가능성을 먼저 계산하면 더 오래 살아남는다. — 모니시 파브라이\n좋은 투자는 설명이 단순해야 한다. — 모니시 파브라이\n기다림은 가치투자의 일부다. — 모니시 파브라이\n훌륭한 기업과 오래 동행하는 것이 가장 강한 전략이 될 수 있다. — 닉 슬립\n투자자는 거래자가 아니라 소유자가 되어야 한다. — 닉 슬립\n장기 관점은 경쟁자가 쉽게 따라 하기 어렵다. — 닉 슬립\n좋은 기업 문화는 시간이 지날수록 복리처럼 작동한다. — 닉 슬립\n고객을 오래 생각하는 기업은 투자자에게도 보상할 수 있다. — 닉 슬립\n진정한 장기 투자는 분기 실적의 소음을 견딘다. — 닉 슬립\n훌륭한 기업의 내재가치는 느리지만 강하게 쌓인다. — 닉 슬립\n소유자의 관점은 매매 충동을 줄여 준다. — 닉 슬립\n오래 보유할수록 기업의 질이 중요해진다. — 닉 슬립\n장기 동행할 기업을 찾는 것이 잦은 매매보다 낫다. — 닉 슬립\n떨어지는 칼날을 무조건 잡으려 하지 마라. — 월가 격언\n소문에 사고 뉴스에 팔라는 말은 군중 심리를 경계하라는 뜻이다. — 월가 격언\n강세장에서는 모두가 똑똑해 보인다. — 월가 격언\n손실은 빠르게 자르고 이익은 오래 키워라. — 월가 격언\n시장은 희망보다 냉정하다. — 월가 격언\n추세는 친구일 수 있지만 끝나는 순간도 있다. — 월가 격언\n돈을 잃지 않는 법을 먼저 배워라. — 월가 격언\n분산은 한 번의 실수를 치명상으로 만들지 않게 한다. — 월가 격언\n레버리지는 시간을 압축하지만 실수도 압축한다. — 월가 격언\n시장은 언제나 다음 교훈을 준비하고 있다. — 월가 격언\n훌륭한 투자 기회는 자주 오지 않으니, 왔을 때 준비되어 있어야 한다. — 워런 버핏\n장기적으로 보유할 마음이 없다면 단기 매수도 신중해야 한다. — 워런 버핏\n시장의 가격표가 매일 바뀐다고 기업의 본질이 매일 바뀌지는 않는다. — 워런 버핏\n사업을 이해하는 능력은 복잡한 예측보다 더 강한 무기다. — 워런 버핏\n좋은 기업은 시간이 지날수록 투자자의 실수를 줄여 준다. — 워런 버핏\n대중의 공포는 준비된 투자자에게 할인된 가격표가 될 수 있다. — 워런 버핏\n모든 기회를 잡으려는 욕심보다 확실한 기회를 기다리는 인내가 낫다. — 워런 버핏\n투자는 멋진 행동보다 합리적인 행동을 요구한다. — 워런 버핏\n싸게 보이는 주식보다 오래 벌 수 있는 사업을 먼저 보라. — 워런 버핏\n좋은 기업을 오래 보유하는 일은 생각보다 지루하고, 그 지루함이 성과가 된다. — 워런 버핏\n투자에서 가장 큰 우위는 자신이 모르는 것을 인정하는 태도다. — 찰리 멍거\n좋은 사업을 찾았다면 불필요한 행동을 줄이는 것이 도움이 된다. — 찰리 멍거\n인내심은 지식과 함께할 때 강력한 투자 도구가 된다. — 찰리 멍거\n많은 실수는 복잡한 것을 단순하게 보지 못해서 생긴다. — 찰리 멍거\n투자자는 자신이 왜 틀릴 수 있는지 먼저 생각해야 한다. — 찰리 멍거\n최고의 투자자는 매일 거래하는 사람이 아니라 오래 기다리는 사람일 수 있다. — 찰리 멍거\n거꾸로 생각하면 피해야 할 길이 먼저 보인다. — 찰리 멍거\n남의 실수를 배우는 것은 가장 저렴한 수업료다. — 찰리 멍거\n복리는 좋은 기업과 긴 시간이 만날 때 강해진다. — 찰리 멍거\n좋은 기질은 뛰어난 지능보다 투자 성과에 더 오래 남는다. — 찰리 멍거\n가치와 가격의 차이를 모르면 투자자는 시장의 기분에 끌려간다. — 벤저민 그레이엄\n시장은 매일 기회를 주지만 매일 따를 필요는 없다. — 벤저민 그레이엄\n투자자는 시장의 하인이 아니라 시장의 주인이 되어야 한다. — 벤저민 그레이엄\n안전마진은 미래를 모른다는 사실에 대한 보험이다. — 벤저민 그레이엄\n주가가 떨어진다고 항상 위험해지는 것은 아니며, 비싸게 사는 것이 더 위험할 수 있다. — 벤저민 그레이엄\n분석 없는 확신은 투자자를 투기꾼으로 만든다. — 벤저민 그레이엄\n가격 변동은 투자자의 감정을 시험하지만, 가치는 투자자의 이성을 요구한다. — 벤저민 그레이엄\n시장 가격은 사실이지만 항상 진실은 아니다. — 벤저민 그레이엄\n충분히 싸게 사는 것은 완벽한 미래 예측보다 현실적인 방어다. — 벤저민 그레이엄\n현명한 투자자는 인기보다 안전마진을 먼저 찾는다. — 벤저민 그레이엄\n주식을 사기 전에는 그 회사가 어떻게 돈을 버는지 설명할 수 있어야 한다. — 피터 린치\n좋은 투자 아이디어는 먼 곳보다 일상 가까이에 있을 수 있다. — 피터 린치\n주가가 아니라 기업의 스토리가 계속 유지되는지 확인하라. — 피터 린치\n하락을 견딜 마음이 없다면 상승의 열매도 오래 누리기 어렵다. — 피터 린치\n종목 이름보다 그 기업의 실적과 전망을 알아야 한다. — 피터 린치\n시장을 예측하는 데 시간을 쓰기보다 기업을 연구하는 데 시간을 써라. — 피터 린치\n한두 번의 실패가 전체 투자를 망치지 않도록 구조를 만들어라. — 피터 린치\n성공하는 종목은 시간이 필요하고, 실패하는 종목은 점검이 필요하다. — 피터 린치\n모르는 기업을 사는 것은 남의 이야기에 돈을 맡기는 것이다. — 피터 린치\n주식은 숫자와 이야기, 둘 다 확인해야 한다. — 피터 린치\n평범한 시장수익률을 꾸준히 얻는 것은 결코 평범한 일이 아니다. — 존 보글\n투자자는 시장 전체의 성과를 얻기 위해 복잡한 예측을 할 필요가 없다. — 존 보글\n낮은 비용은 시간이 지날수록 투자자의 편에 선다. — 존 보글\n가만히 있는 전략은 쉬워 보이지만 실제로는 가장 어렵다. — 존 보글\n인덱스 투자의 힘은 천재적인 선택이 아니라 불필요한 선택을 줄이는 데 있다. — 존 보글\n장기 투자자는 하루의 뉴스보다 수십 년의 복리를 본다. — 존 보글\n투자의 기본은 더 많이 맞히는 것이 아니라 덜 새는 구조를 만드는 것이다. — 존 보글\n비용과 세금, 감정을 낮추면 장기 성과는 더 좋아질 수 있다. — 존 보글\n시장에 남아 있는 시간이 시장 타이밍보다 중요하다. — 존 보글\n단순한 포트폴리오는 위기 때도 지키기 쉽다. — 존 보글\n좋은 투자자는 무엇을 살지뿐 아니라 얼마에 살지를 묻는다. — 하워드 막스\n모두가 낙관할 때는 좋은 뉴스보다 가격을 의심해야 한다. — 하워드 막스\n모두가 두려워할 때는 나쁜 뉴스보다 가격을 다시 봐야 한다. — 하워드 막스\n리스크는 보이지 않을 때 가장 위험하다. — 하워드 막스\n투자자는 미래를 맞히는 사람이 아니라 확률을 유리하게 만드는 사람이다. — 하워드 막스\n싸이클의 끝에서는 논리보다 심리가 가격을 밀어 올린다. — 하워드 막스\n위험을 잘 관리하면 수익을 얻을 기회가 다시 온다. — 하워드 막스\n남들과 같은 생각으로는 남들과 다른 결과를 얻기 어렵다. — 하워드 막스\n최고의 매수 기회는 대개 가장 불편한 뉴스와 함께 온다. — 하워드 막스\n성공한 투자자는 확실성보다 불확실성의 가격을 본다. — 하워드 막스\n절망적인 분위기 속에서도 가격이 충분히 낮다면 기회는 존재한다. — 존 템플턴\n모두가 좋아하는 시장은 이미 많은 기대를 가격에 담고 있을 수 있다. — 존 템플턴\n비관은 투자자의 눈을 가리지만 가치투자자에게는 지도일 수 있다. — 존 템플턴\n대중이 버린 곳에서 가장 큰 할인율이 나타날 수 있다. — 존 템플턴\n시장이 환호할 때는 수익보다 위험을 먼저 계산하라. — 존 템플턴\n가장 인기 없는 시장이 가장 좋은 출발점이 될 때가 있다. — 존 템플턴\n비관이 지나치면 가격은 가치보다 더 멀리 내려갈 수 있다. — 존 템플턴\n세계 어디든 기회는 있고, 군중의 시야는 늘 제한적이다. — 존 템플턴\n두려움 속에서 산다는 것은 용기만이 아니라 분석을 요구한다. — 존 템플턴\n낙관의 끝에서는 기대보다 안전마진을 봐야 한다. — 존 템플턴\n시장과 싸우기 시작하면 손실은 자존심의 비용이 된다. — 제시 리버모어\n틀렸다는 신호가 나오면 고집보다 퇴장이 먼저다. — 제시 리버모어\n큰 추세를 맞히고도 너무 일찍 내리면 큰돈은 남지 않는다. — 제시 리버모어\n매일 거래하려는 욕심은 시장을 월급처럼 착각하게 만든다. — 제시 리버모어\n가격이 내 편이 아닐 때는 이유보다 리스크를 먼저 줄여라. — 제시 리버모어\n투기에서 희망은 계획이 아니다. — 제시 리버모어\n잘못된 포지션은 작을 때 정리해야 다시 기회를 볼 수 있다. — 제시 리버모어\n시장은 개인의 확신보다 더 오래 움직일 수 있다. — 제시 리버모어\n앉아 있는 능력과 빠져나오는 능력은 둘 다 필요하다. — 제시 리버모어\n추세를 따르되 손실은 제한하라. — 제시 리버모어\n주가는 때로 경제보다 심리를 먼저 반영한다. — 앙드레 코스톨라니\n인내가 없는 돈은 시장에서 오래 살아남기 어렵다. — 앙드레 코스톨라니\n군중은 대개 늦게 흥분하고 늦게 두려워한다. — 앙드레 코스톨라니\n시장의 개는 앞서 뛰지만 결국 주인에게 돌아온다. — 앙드레 코스톨라니\n좋은 아이디어도 시간이 없으면 좋은 투자가 되기 어렵다. — 앙드레 코스톨라니\n빚은 투자자의 인내심을 빼앗는다. — 앙드레 코스톨라니\n시장에서 돈보다 먼저 필요한 것은 버틸 수 있는 시간이다. — 앙드레 코스톨라니\n대중의 감정은 가격을 흔들지만 영원히 지배하지는 못한다. — 앙드레 코스톨라니\n투자자는 소음 속에서 방향을 잃지 않는 사람이 되어야 한다. — 앙드레 코스톨라니\n주식시장은 계산기와 심리학 책을 함께 요구한다. — 앙드레 코스톨라니\n분산은 확신이 아니라 겸손에서 출발한다. — 레이 달리오\n좋은 원칙은 좋은 날보다 나쁜 날에 더 필요하다. — 레이 달리오\n자신의 약점을 알면 포트폴리오도 더 현실적으로 만들 수 있다. — 레이 달리오\n불확실한 세상에서는 한 가지 결과에 모든 것을 걸지 말아야 한다. — 레이 달리오\n고통스러운 손실도 제대로 복기하면 다음 판단의 재료가 된다. — 레이 달리오\n시장보다 먼저 자신이 어떤 사람인지 알아야 한다. — 레이 달리오\n서로 다른 위험을 섞는 것은 오래 버티기 위한 기술이다. — 레이 달리오\n현실을 부정하는 투자는 언젠가 현실에 의해 조정된다. — 레이 달리오\n좋은 의사결정은 감정보다 원칙과 피드백에 의존한다. — 레이 달리오\n투자자는 확신이 아니라 균형을 설계해야 할 때가 많다. — 레이 달리오\n틀린 판단을 빨리 고치면 손실은 수업료로 끝날 수 있다. — 조지 소로스\n시장의 착각을 이해하면 기회와 위험을 동시에 볼 수 있다. — 조지 소로스\n포지션 크기는 확신만큼이나 중요하다. — 조지 소로스\n맞았을 때 크게 벌고 틀렸을 때 작게 잃는 구조가 중요하다. — 조지 소로스\n투자는 완벽한 예측보다 오류 수정 능력을 요구한다. — 조지 소로스\n살아남는 투자자는 자신의 생각을 바꿀 줄 안다. — 조지 소로스\n시장은 참여자의 믿음에 의해 더 크게 흔들릴 수 있다. — 조지 소로스\n강한 확신도 손실 제한 규칙 없이는 위험하다. — 조지 소로스\n자신이 틀렸음을 알게 되는 순간이 가장 중요한 순간이다. — 조지 소로스\n시장의 기회는 대개 불완전한 정보 속에서 나타난다. — 조지 소로스\n자본을 지키는 사람만 다음 추세를 잡을 수 있다. — 폴 튜더 존스\n손실이 커지기 전에 작게 인정하는 것이 프로의 습관이다. — 폴 튜더 존스\n위험을 줄이는 것은 겁이 아니라 전략이다. — 폴 튜더 존스\n매수 이유보다 손실 제한 계획이 먼저 준비되어야 한다. — 폴 튜더 존스\n시장은 자존심을 보상하지 않는다. — 폴 튜더 존스\n좋은 트레이더는 먼저 살아남고 그다음에 번다. — 폴 튜더 존스\n방어를 잘하는 투자자는 공격할 기회를 잃지 않는다. — 폴 튜더 존스\n틀린 포지션을 오래 들고 있는 것은 분석이 아니라 고집이다. — 폴 튜더 존스\n리스크를 통제하면 마음도 통제된다. — 폴 튜더 존스\n큰 손실을 피하는 것이 복리의 출발점이다. — 폴 튜더 존스\n시장의 리더는 약세장 이후 먼저 힘을 보일 때가 많다. — 윌리엄 오닐·마크 미너비니\n손절 규칙은 감정이 아니라 숫자로 정해야 한다. — 윌리엄 오닐·마크 미너비니\n추세를 무시하면 좋은 분석도 손실로 끝날 수 있다. — 윌리엄 오닐·마크 미너비니\n강한 종목을 비싸다는 이유만으로 무시하지 마라. — 윌리엄 오닐·마크 미너비니\n약한 종목을 싸다는 이유만으로 붙잡지 마라. — 윌리엄 오닐·마크 미너비니\n좋은 매매는 시장이 틀렸다고 우기는 데서 나오지 않는다. — 윌리엄 오닐·마크 미너비니\n승률보다 손익비와 손실 제한이 더 중요할 수 있다. — 윌리엄 오닐·마크 미너비니\n차트는 미래를 보장하지 않지만 위험 신호를 줄 수 있다. — 윌리엄 오닐·마크 미너비니\n강한 상승에는 이유가 있고, 약한 반등에는 한계가 있다. — 윌리엄 오닐·마크 미너비니\n규칙을 지키는 투자자는 감정적인 시장에서도 흔들림이 줄어든다. — 윌리엄 오닐·마크 미너비니\n시장 전체를 보유하는 전략은 예측의 부담을 줄여 준다. — 버턴 말킬\n무작위에 가까운 단기 움직임을 예언하려 애쓰지 마라. — 버턴 말킬\n낮은 비용과 넓은 분산은 투자자가 실제로 통제할 수 있는 영역이다. — 버턴 말킬\n장기 인덱스 투자는 화려하지 않지만 꾸준하다. — 버턴 말킬\n복잡한 예측보다 단순한 참여가 더 나을 때가 많다. — 버턴 말킬\n평균을 우습게 보면 평균에도 못 미칠 수 있다. — 버턴 말킬\n시장 타이밍의 유혹은 크지만 성공 확률은 낮다. — 버턴 말킬\n투자자는 확실한 비용을 줄이는 데서 먼저 이긴다. — 버턴 말킬\n분산된 포트폴리오는 모르는 미래에 대한 현실적인 답이다. — 버턴 말킬\n단순한 전략은 오래 유지할 수 있을 때 더 강해진다. — 버턴 말킬\n위대한 기업은 매출보다 더 깊은 경쟁력을 가진다. — 필립 피셔\n성장 기업을 볼 때는 숫자와 사람을 함께 봐야 한다. — 필립 피셔\n기업의 품질은 시간이 지날수록 주가보다 더 중요해질 수 있다. — 필립 피셔\n좋은 경영진은 어려운 시기에 더 잘 드러난다. — 필립 피셔\n장기 성장주는 단기 실망보다 장기 방향성이 중요하다. — 필립 피셔\n깊은 조사는 확신을 만들고 확신은 인내를 만든다. — 필립 피셔\n좋은 기업을 너무 빨리 파는 것은 흔한 실수다. — 필립 피셔\n성장성만 보고 가격을 무시하면 좋은 기업도 나쁜 투자가 된다. — 필립 피셔\n기업 문화와 연구개발 능력은 장기 성장의 씨앗이 될 수 있다. — 필립 피셔\n훌륭한 회사를 찾았다면 단기 변동보다 장기 경쟁력을 보라. — 필립 피셔\n가치투자자는 인기 없는 가격에서 편안함을 찾아야 한다. — 세스 클라만\n안전마진은 투자자의 겸손을 숫자로 표현한 것이다. — 세스 클라만\n현금은 아무것도 하지 않는 자산이 아니라 선택권일 수 있다. — 세스 클라만\n하락 위험을 먼저 본 투자자는 상승 기회도 더 오래 기다릴 수 있다. — 세스 클라만\n싼 자산에는 이유가 있으니 가치와 함정을 구분해야 한다. — 세스 클라만\n시장이 무시하는 곳에서 가치는 조용히 쌓일 수 있다. — 세스 클라만\n확실한 기회가 없을 때 기다리는 것도 투자 결정이다. — 세스 클라만\n손실 회피는 소심함이 아니라 복리를 지키는 방법이다. — 세스 클라만\n분위기가 좋을수록 안전마진은 더 필요하다. — 세스 클라만\n좋은 투자는 매수 순간부터 방어력을 갖고 있어야 한다. — 세스 클라만\n시장이 단기적으로 비합리적이기 때문에 장기 기회가 생긴다. — 조엘 그린블라트\n좋은 회사를 싼 가격에 사는 원칙은 단순하지만 실천은 어렵다. — 조엘 그린블라트\n가치투자 전략은 지루한 기간을 견뎌야 보상받는다. — 조엘 그린블라트\n수익성 높은 기업을 낮은 가격에 사는 것이 핵심이다. — 조엘 그린블라트\n좋은 전략도 사람들이 포기할 만큼 힘든 구간이 있어야 오래 작동한다. — 조엘 그린블라트\n가격과 품질을 함께 보면 실수 확률을 줄일 수 있다. — 조엘 그린블라트\n시장은 가끔 훌륭한 기업에 잘못된 가격을 붙인다. — 조엘 그린블라트\n단기 성과에 흔들리지 않는 규율이 전략을 완성한다. — 조엘 그린블라트\n싸기만 한 기업보다 싸고 좋은 기업이 낫다. — 조엘 그린블라트\n투자 공식보다 중요한 것은 그 공식을 버티는 마음이다. — 조엘 그린블라트\n하방이 작고 상방이 큰 구조를 찾는 것이 핵심이다. — 모니시 파브라이\n좋은 투자 아이디어는 이해하기 쉬워야 오래 버틸 수 있다. — 모니시 파브라이\n기다림은 기회가 없는 시간이 아니라 기회를 고르는 시간이다. — 모니시 파브라이\n검증된 원칙을 따라 하는 것도 훌륭한 투자 능력이다. — 모니시 파브라이\n적게 잃고 크게 벌 수 있는 구조가 가치투자의 매력이다. — 모니시 파브라이\n복잡한 투자는 실수할 부분도 많다. — 모니시 파브라이\n투자자는 많은 아이디어보다 좋은 몇 개의 아이디어가 필요하다. — 모니시 파브라이\n불확실성이 있어도 가격이 충분히 낮다면 기회가 될 수 있다. — 모니시 파브라이\n큰 기회는 자주 오지 않으니 평소에는 참아야 한다. — 모니시 파브라이\n투자에서 단순함은 약점이 아니라 장점이 될 수 있다. — 모니시 파브라이\n진짜 장기 투자는 기업과 함께 시간을 보내는 일이다. — 닉 슬립\n훌륭한 기업은 시간이 지날수록 고객과 투자자 모두에게 가치를 줄 수 있다. — 닉 슬립\n거래 빈도를 줄이면 소유자의 관점이 더 선명해진다. — 닉 슬립\n좋은 기업 문화는 재무제표보다 늦게 보이지만 오래 남는다. — 닉 슬립\n장기 보유는 아무 기업이나 오래 들고 있는 것이 아니다. — 닉 슬립\n기업의 방향성이 맞다면 단기 변동은 소음에 가까울 수 있다. — 닉 슬립\n오래 동행할 기업은 고객을 대하는 방식에서 힌트를 준다. — 닉 슬립\n좋은 기업은 시간이 지날수록 선택지를 넓힌다. — 닉 슬립\n단기 매매는 가격을 보게 하고 장기 보유는 사업을 보게 한다. — 닉 슬립\n투자자는 가격표보다 사업의 누적 가치를 관찰해야 한다. — 닉 슬립\n시장은 당신이 버틸 수 있는 시간보다 더 오래 흔들릴 수 있다. — 월가 격언\n싸게 사는 것보다 더 중요한 것은 버틸 수 있게 사는 것이다. — 월가 격언\n최고의 전략도 감정적으로 지킬 수 없다면 좋은 전략이 아니다. — 월가 격언\n수익을 키우려면 먼저 손실이 계좌를 망치지 않게 해야 한다. — 월가 격언\n시장의 소음은 크지만 계좌를 지키는 것은 조용한 원칙이다. — 월가 격언\n현금은 조급한 사람에게 답답함이고 준비된 사람에게 기회다. — 월가 격언\n모두가 같은 방향을 볼 때 반대편 위험을 확인하라. — 월가 격언\n레버리지는 방향을 맞혀도 시간을 틀리면 위험해진다. — 월가 격언\n분산은 대박을 줄일 수 있지만 파산 가능성도 줄인다. — 월가 격언\n하락장은 포트폴리오보다 먼저 투자자의 마음을 테스트한다. — 월가 격언\n뉴스가 급할수록 주문은 천천히 내야 한다. — 월가 격언\n계좌를 오래 유지하는 사람이 다음 상승장을 볼 수 있다. — 월가 격언\n이익은 가능성이고 손실 제한은 책임이다. — 월가 격언\n매수 전에는 기대수익보다 최악의 경우를 먼저 적어 보라. — 월가 격언\n시장에는 확신보다 확률이 더 잘 어울린다. — 월가 격언';

  @override
  String get intelligentInvestorBookTitle => '내가 생각하는 현명한 투자';

  @override
  String get longFormBookTitle => '어느 주식투자자의 회상';

  @override
  String get intelligentInvestorCh1Title => 'Ch1. 투자와 투기의 차이';

  @override
  String get intelligentInvestorCh2Title => 'Ch2. 왜 대부분의 투자자는 실패하는가';

  @override
  String get intelligentInvestorCh3Title => 'Ch3. 시장';

  @override
  String get intelligentInvestorCh4Title => 'Ch4. 안전마진';

  @override
  String get intelligentInvestorCh5Title => 'Ch5. 군중심리와 투자';

  @override
  String get intelligentInvestorCh6Title => 'Ch6. 시장은 왜 장기적으로 오르는가';

  @override
  String get intelligentInvestorCh7Title => 'Ch7. 닷컴버블의 교훈';

  @override
  String get intelligentInvestorCh8Title => 'Ch8. 금융위기의 교훈';

  @override
  String get intelligentInvestorCh9Title => 'Ch9. 코로나 폭락의 교훈';

  @override
  String get intelligentInvestorCh10Title => 'Ch10. AI 혁명과 현재 시장';
}
