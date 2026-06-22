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
  String get holdQLDPlusCash => 'QLD + 현금 30% 유지';

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
  String get minus20Headline => '현금 1% 주간 TQQQ 적립 시작';

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
      '전체 현금의 1%만 사용해 일주일에 한 번 TQQQ를 소수점 단위로 적립 매수합니다. 큰 금액을 한 번에 넣지 않습니다.';

  @override
  String get minus20BuyRuleTitle => '목적';

  @override
  String get minus20BuyRuleText =>
      '-20% 구간부터 횡보장이 길어질 때 조금씩 수량을 모아 TQQQ 평단가를 낮추기 위한 설정입니다. 핵심은 수익을 바로 맞히는 것이 아니라 낮은 평균단가를 만드는 것입니다.';

  @override
  String get minus20CashTitle => '현금 관리';

  @override
  String get minus20CashText =>
      '대부분의 현금은 -30%, -40%, -50% 구간을 위해 남깁니다. -50%에서 계획된 현금을 모두 사용한 뒤에도 새로 생기는 현금은 주간 적립으로 평단을 계속 낮춥니다.';

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
  String get holdActionText =>
      'TQQQ 추가 매수를 중단하고 회복 흐름을 관찰합니다. 다시 하락할 가능성에 대비해 남은 현금은 보존합니다.';

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
  String get contentCloseGuess => '종가 맞추기';

  @override
  String get contentStockQuote => '오늘의 주식 명언';

  @override
  String get contentNumberGuess => '숫자 맞추기';

  @override
  String get contentBookReader => '책 읽기';

  @override
  String get contentStockMeme => '주식 짤';

  @override
  String get contentLottoNumbers => '로또번호 추천';

  @override
  String get contentJumpDodge => '점프 장애물 피하기';

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
      '먼저 메인화면의 \"기본 포지션 카드\"를 눌러 어떤 방법으로 준비하는지 설명을 읽어보세요. 또한 오른쪽 최하단의 \"전략\" 탭을 눌러 상세한 전략을 숙지합니다.';

  @override
  String get usageGuideStrategyTitle => '2. 하락구간별 자동 전략 확인';

  @override
  String get usageGuideStrategyBody =>
      '메인 3번째 카드에 \"역대최고가 대비 -몇 %\"가 자동 계산됩니다. 그 구간에 맞는 전략이 자동으로 표시되고, 조건에 맞으면 알림도 옵니다.';

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
}
