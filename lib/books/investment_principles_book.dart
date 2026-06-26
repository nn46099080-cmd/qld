part of '../main.dart';

class InvestmentPrinciplesBookPage extends StatelessWidget {
  const InvestmentPrinciplesBookPage({super.key});

  static const _chapters = <_BookChapter>[
    _BookChapter(
      title: 'Chapter 1. 투자의 출발점',
      body: '''투자의 목적은 시장을 이기는 것이 아니라 미래의 구매력을 지키고 성장시키는 것이다. 많은 사람들은 단기간에 큰 수익을 얻는 것에 집중하지만, 장기 투자자는 수십 년 뒤의 결과를 생각한다.''',
    ),
    _BookChapter(
      title: 'Chapter 2. 시장은 왜 오르는가',
      body: '''주식시장은 기업의 이익 성장과 생산성 향상을 반영한다. 기술 발전, 인구 증가, 혁신은 장기적으로 기업 가치를 높여 왔다. 따라서 시장은 수많은 위기를 겪으면서도 장기적으로 우상향하는 경향을 보였다.''',
    ),
    _BookChapter(
      title: 'Chapter 3. 인간 심리와 투자',
      body: '''사람들은 공포와 탐욕에 지배된다. 상승장에서는 위험을 과소평가하고, 하락장에서는 위험을 과대평가한다. 투자의 성패는 종목 선택보다 심리 관리에서 결정되는 경우가 많다.''',
    ),
    _BookChapter(
      title: 'Chapter 4. 미스터 마켓',
      body: '''시장은 매일 가격을 제시한다. 하지만 그 가격이 항상 합리적인 것은 아니다. 투자자는 시장의 기분에 휘둘리는 사람이 아니라 시장의 비효율을 이용하는 사람이 되어야 한다.''',
    ),
    _BookChapter(
      title: 'Chapter 5. 안전마진',
      body: '''미래는 불확실하다. 따라서 투자자는 자신의 예상이 틀릴 수 있음을 인정해야 한다. 안전마진은 생존을 위한 장치다.''',
    ),
    _BookChapter(
      title: 'Chapter 6. 현금의 역할',
      body: '''현금은 수익률을 낮추는 요소처럼 보일 수 있다. 하지만 위기 상황에서는 가장 강력한 무기가 된다. 현금은 선택권이다.''',
    ),
    _BookChapter(
      title: 'Chapter 7. 폭락장의 본질',
      body: '''폭락은 예외가 아니라 시장의 일부다. 역사적으로 모든 강세장은 여러 차례 큰 조정을 동반했다. 중요한 것은 폭락을 예측하는 것이 아니라 대비하는 것이다.''',
    ),
    _BookChapter(
      title: 'Chapter 8. 닷컴버블의 교훈',
      body: '''2000년 닷컴버블 당시 많은 투자자들은 기술주가 영원히 오를 것이라 믿었다. 그러나 결국 시장은 현실을 반영했다. 과도한 낙관은 언제나 위험하다.''',
    ),
    _BookChapter(
      title: 'Chapter 9. 금융위기의 교훈',
      body: '''2008년 금융위기는 전 세계 금융 시스템에 대한 신뢰를 흔들었다. 당시에도 많은 사람들은 시장이 끝났다고 생각했다. 그러나 시장은 회복했고 새로운 고점을 만들었다.''',
    ),
    _BookChapter(
      title: 'Chapter 10. 코로나 폭락의 교훈',
      body: '''2020년 코로나 사태는 불과 몇 주 만에 시장을 급락시켰다. 하지만 회복 역시 매우 빨랐다. 공포에 매도한 투자자보다 원칙을 지킨 투자자가 더 좋은 결과를 얻었다.''',
    ),
    _BookChapter(
      title: 'Chapter 11. 복리의 힘',
      body: '''복리는 투자자의 가장 강력한 무기다. 작은 차이가 오랜 시간 누적되면 엄청난 결과를 만든다. 장기 투자자는 시간을 자신의 편으로 만든다.''',
    ),
    _BookChapter(
      title: 'Chapter 12. 자산 배분',
      body: '''좋은 자산 배분은 투자자를 시장에 오래 남게 만든다. 수익률보다 생존이 먼저다.''',
    ),
    _BookChapter(
      title: 'Chapter 13. 장기 계획 세우기',
      body: '''투자는 이벤트가 아니라 과정이다. 10년, 20년 단위로 생각해야 한다.''',
    ),
    _BookChapter(
      title: 'Chapter 14. 손실을 바라보는 시각',
      body: '''손실은 투자 과정의 일부다. 중요한 것은 손실을 피하는 것이 아니라 감당 가능한 수준으로 관리하는 것이다.''',
    ),
    _BookChapter(
      title: 'Chapter 15. 뉴스 소비 줄이기',
      body: '''매일 쏟아지는 뉴스는 투자자에게 도움보다 혼란을 주는 경우가 많다. 장기 투자자는 정보보다 원칙에 집중한다.''',
    ),
    _BookChapter(
      title: 'Chapter 16. 예측의 함정',
      body: '''전문가들도 미래를 정확히 예측하지 못한다. 따라서 예측보다 대응이 중요하다.''',
    ),
    _BookChapter(
      title: 'Chapter 17. 규칙 기반 투자',
      body: '''감정은 변하지만 규칙은 변하지 않는다. 매수와 매도 원칙을 미리 정하면 실수를 줄일 수 있다.''',
    ),
    _BookChapter(
      title: 'Chapter 18. QLD와 장기투자',
      body: '''레버리지 ETF는 변동성이 크다. 따라서 투자자는 더욱 명확한 원칙과 자금 관리가 필요하다.''',
    ),
    _BookChapter(
      title: 'Chapter 19. 현금 30% 전략의 의미',
      body: '''현금은 기회비용이 있지만 위기 대응 능력을 제공한다. 일부 투자자에게는 심리적 안정이 더 큰 가치가 될 수 있다.''',
    ),
    _BookChapter(
      title: 'Chapter 20. 폭락 대응 계획',
      body: '''평상시에 계획을 세워야 한다. 위기 상황에서는 감정이 판단을 흐린다.''',
    ),
    _BookChapter(
      title: 'Chapter 21. 장기 투자자의 체크리스트',
      body: '''원칙을 기록하라. 자산 배분을 정하라. 현금을 보유하라. 과도한 예측을 피하라. 복리를 믿어라.''',
    ),
    _BookChapter(
      title: 'Chapter 22. 성공적인 투자자의 특징',
      body: '''성공적인 투자자는 가장 똑똑한 사람이 아니다. 가장 오래 살아남는 사람이다.''',
    ),
    _BookChapter(
      title: 'Chapter 23. 시장과의 거리두기',
      body: '''시장을 매분 확인할 필요는 없다. 장기 투자자는 기업과 경제를 본다.''',
    ),
    _BookChapter(
      title: 'Chapter 24. 위기를 기회로 바꾸는 법',
      body: '''위기 때 행동할 수 있는 사람은 평소에 준비한 사람뿐이다.''',
    ),
    _BookChapter(
      title: 'Chapter 25. 최종 결론',
      body: '''장기 투자의 핵심은 단순하다. 좋은 자산, 적절한 현금, 감정 통제, 꾸준한 실행.

시장은 앞으로도 수많은 위기를 겪겠지만 원칙을 가진 투자자는 흔들리지 않는다.

장기 투자자는 단기 변동보다 장기 방향성에 집중한다. 시장의 소음보다 자신의 원칙을 신뢰해야 한다. 위기는 반복되지만 역사적으로 시장은 회복해 왔다. 투자자는 미래를 예언하기보다 대비해야 한다.''',
    ),
  ];

  @override
  Widget build(BuildContext context) => _KoreanBookReaderBase(
        bookTitle: '장기투자 원칙서',
        prefsKey: 'investment_principles_book_page',
        chapters: _chapters,
      );
}
