part of '../main.dart';

class LongFormBookReaderPage extends StatefulWidget {
  const LongFormBookReaderPage({super.key});

  @override
  State<LongFormBookReaderPage> createState() => _LongFormBookReaderPageState();
}

class _LongFormBookReaderPageState extends State<LongFormBookReaderPage> {
  static const _bookReaderPagePrefsKey = 'long_form_book_reader_page';
  static const _bookReaderLanguagePrefsKey = 'long_form_book_reader_language';

  final pageController = PageController();
  int currentPage = 0;
  bool showEnglish = false;

  static const koreanPages = <_BookChapter>[
    _BookChapter(
      title: '원서 소개',
      body: '''
Reminiscences of a Stock Operator
Edwin Lefevre

이 독서판은 영어 원서의 흐름을 따라 한국어로 읽기 쉽게 옮긴 번역형 본문입니다. 원문을 한 문장씩 그대로 옮긴 완역본은 아니지만, 책의 이야기 전개와 핵심 장면을 따라가며 긴 글로 읽을 수 있도록 구성했습니다.

이 책의 주인공은 어린 시절 증권 중개 사무실에서 시세판을 기록하던 소년으로 시작합니다. 그는 숫자가 움직이는 방식에 매혹되고, 사람들이 왜 사고파는지보다 가격이 어떻게 움직이는지에 먼저 관심을 갖습니다. 누군가는 그를 투기꾼이라 부르고, 누군가는 천재적인 시세 읽기의 소유자라 말합니다. 그러나 이 책이 보여주는 것은 화려한 성공담만이 아닙니다.

그는 여러 번 큰돈을 벌고, 여러 번 거의 모든 것을 잃습니다. 시장을 맞힌 순간에도 사람은 무너질 수 있고, 틀렸다는 사실을 빨리 인정하지 못하면 작은 실수는 순식간에 인생을 흔드는 손실이 됩니다. 그래서 이 책은 돈을 버는 법보다, 시장 앞에서 사람이 어떻게 흔들리는지를 더 오래 보여줍니다.
''',
    ),
    _BookChapter(
      title: '1. 시세판 앞의 소년',
      body: '''
나는 아주 어릴 때부터 숫자가 움직이는 모습을 지켜보았다. 사무실 한쪽에는 시세가 적힌 판이 있었고, 사람들은 그 숫자 하나하나에 얼굴빛이 달라졌다. 어떤 사람은 가격이 조금만 올라가도 세상을 얻은 듯 웃었고, 어떤 사람은 몇 포인트 빠졌다는 말에 금세 말수가 줄었다.

처음에는 그저 일을 빨리 처리하는 소년일 뿐이었다. 누가 무슨 종목을 불러주면 받아 적고, 전신으로 들어오는 가격을 판에 옮겼다. 하지만 같은 일을 매일 반복하다 보니 이상한 것이 보이기 시작했다. 가격은 아무렇게나 움직이는 듯했지만, 어떤 때에는 오르려는 힘이 분명했고, 어떤 때에는 아무리 버티려 해도 아래로 밀리는 힘이 느껴졌다.

나는 사람들이 떠드는 이유보다 숫자의 움직임을 더 믿게 되었다. 사무실 안의 어른들은 늘 이유를 말했다. 회사가 좋다, 소문이 있다, 누군가가 산다, 곧 오른다. 그러나 가격은 그들의 말과 다르게 움직일 때가 많았다. 그때부터 나는 생각했다. 시장에서 중요한 것은 말이 아니라 실제 거래되는 가격이라고.

그 깨달음은 어린 나에게는 놀이처럼 시작되었다. 그러나 시간이 지나면서 그것은 내 인생을 바꾸는 기술이 되었다. 나는 가격이 올라갈 것인지 내려갈 것인지 맞히는 것보다, 가격이 움직이기 시작하는 순간을 알아차리는 일에 빠져들었다.
''',
    ),
    _BookChapter(
      title: '2. 처음 배운 승리',
      body: '''
처음 돈을 걸었을 때 나는 내가 특별한 사람이라고 생각하지 않았다. 다만 시세판을 오래 보았기 때문에 남들보다 조금 더 빨리 알아차릴 수 있다고 믿었다. 가격이 어떤 식으로 움직이는지, 사람들이 흥분할 때 숫자가 어떻게 반응하는지, 조용한 종목이 갑자기 살아날 때 어떤 모습이 나타나는지 눈에 익었다.

초기의 승리는 위험했다. 돈을 벌면 사람은 자신의 판단이 옳았다는 증거를 얻었다고 느낀다. 나 역시 그랬다. 몇 번의 성공은 나에게 자신감을 주었고, 그 자신감은 곧 더 크게 베팅하고 싶은 마음으로 바뀌었다. 시장은 처음에는 친절한 선생처럼 보였다. 내가 맞히면 돈을 주었고, 나는 그 돈이 내 실력의 대가라고 생각했다.

그러나 시장은 사람을 가르칠 때 늘 부드럽게 가르치지 않는다. 처음에 쉽게 번 돈은 사람을 조심스럽게 만들지 않는다. 오히려 더 대담하게 만든다. 대담함은 때로 필요하지만, 준비되지 않은 대담함은 손실을 부르는 지름길이다.

나는 이 사실을 나중에 여러 번 배웠다. 이상하게도 시장에서 가장 비싼 수업료는 항상 같은 교훈을 다시 배우는 데 쓰인다. 사람은 이미 알고 있다고 생각하는 것을 실제로 지키지 못할 때 가장 크게 다친다.
''',
    ),
    _BookChapter(
      title: '3. 시장은 설명을 기다려주지 않는다',
      body: '''
사람들은 가격이 움직인 뒤에 이유를 찾는 것을 좋아한다. 주가가 오르면 좋은 소식 때문이라고 하고, 빠지면 나쁜 소문 때문이라고 말한다. 하지만 내가 시세판 앞에서 배운 것은 달랐다. 가격은 종종 뉴스보다 먼저 움직이고, 설명은 나중에 붙는다.

나는 이유를 모른 채 매수하거나 매도하는 일이 불안하지 않았다. 불안한 것은 오히려 가격이 분명히 말하고 있는데도, 내 생각과 다르다는 이유로 듣지 않는 일이었다. 시장은 친절하게 설명하지 않는다. 다만 움직일 뿐이다. 그 움직임을 인정할 것인지, 아니면 내 의견을 붙잡을 것인지는 투자자의 선택이다.

초보자는 흔히 의견을 거래한다. 좋은 회사니까 오른다, 많이 빠졌으니까 오른다, 누구나 좋다고 하니까 오른다. 그러나 시장은 의견에 보상하지 않는다. 시장이 보상하는 것은 옳은 시점에 옳은 방향으로 서 있는 사람이다. 그리고 틀렸을 때 빨리 물러나는 사람이다.

나는 점점 더 말을 줄이고 가격을 보게 되었다. 누가 무엇을 말했는지보다, 실제로 돈이 어느 방향으로 움직이고 있는지가 중요했다. 시장에서 말은 많고 돈은 조용하다. 그러나 결국 가격을 움직이는 것은 말이 아니라 돈이다.
''',
    ),
    _BookChapter(
      title: '4. 빨리 맞히는 것과 크게 버는 것은 다르다',
      body: '''
나는 어린 시절부터 단기 움직임을 잘 맞히는 편이었다. 가격이 몇 포인트 움직일 방향을 잡아내는 일은 나에게 자연스럽게 느껴졌다. 그러나 시장에서 오래 살아보니, 빨리 맞히는 능력과 크게 버는 능력은 전혀 다른 문제였다.

작은 움직임을 자주 맞히면 사람은 바빠진다. 계속 사고팔고, 작은 이익을 챙기고, 다시 들어간다. 겉보기에는 매우 능숙해 보인다. 하지만 큰 추세가 시작될 때도 같은 방식으로 행동하면, 정작 가장 큰 돈이 걸린 구간을 놓치게 된다.

큰돈은 자주 움직이는 손에서 나오지 않았다. 큰돈은 옳은 자리에 앉은 뒤, 시장이 충분히 움직일 때까지 버티는 데서 나왔다. 이것은 말로는 쉽지만 실제로는 어렵다. 가격은 절대 한 방향으로만 가지 않는다. 좋은 포지션도 중간에 흔들리고, 흔들림은 사람의 마음을 시험한다.

나는 여러 번 너무 일찍 팔았다. 맞혔지만 크게 벌지 못했다. 그때마다 깨달았다. 시장에서 중요한 것은 단지 방향을 맞히는 것이 아니라, 맞았을 때 충분히 얻을 수 있는 마음과 규칙을 갖는 것이다.
''',
    ),
    _BookChapter(
      title: '5. 틀렸을 때 작아지는 기술',
      body: '''
시장에서는 누구나 틀린다. 문제는 틀렸다는 사실 자체가 아니라, 틀렸을 때 어떻게 행동하느냐다. 작은 손실은 투자자에게 보내는 시장의 짧은 경고다. 그 경고를 무시하면 시장은 더 큰 목소리로 말한다. 그때는 이미 손실이 커져 있다.

나는 여러 번 손실을 키웠다. 처음에는 조금만 기다리면 돌아올 것 같았다. 그 다음에는 여기서 팔면 너무 억울하다고 생각했다. 더 지나면 손실이 너무 커져서 판단이 흐려졌다. 그 순간부터 투자자는 시장을 보는 것이 아니라 자신의 손실만 보게 된다.

손실을 작게 자르는 일은 차가운 기술처럼 보이지만, 사실은 가장 감정적인 훈련이다. 자존심을 내려놓아야 하고, 내가 틀렸다는 사실을 인정해야 하며, 방금 전까지 믿었던 생각을 버릴 수 있어야 한다. 많은 사람이 이것을 하지 못해 시장에서 사라진다.

나는 결국 배웠다. 손실은 투자자의 적이 아니라 관리해야 할 비용이다. 작은 손실은 다음 기회를 살려두는 비용이다. 큰 손실은 다음 기회에 참여할 능력 자체를 빼앗아간다.
''',
    ),
    _BookChapter(
      title: '6. 소문은 사람을 움직이고 가격은 돈을 움직인다',
      body: '''
월스트리트에는 늘 소문이 있었다. 어떤 회사가 좋아진다, 누군가 대량으로 산다, 곧 발표가 있다, 큰손이 움직인다. 사람들은 이런 말을 좋아한다. 소문은 이야기가 있고, 이야기는 사람의 마음을 쉽게 붙잡는다.

그러나 소문으로 산 주식은 마음을 약하게 만든다. 내가 왜 샀는지 내 안에 분명한 이유가 없기 때문이다. 남의 말을 믿고 들어간 포지션은 문제가 생겼을 때 다시 그 사람의 말을 기다리게 한다. 시장은 이미 틀렸다고 말하는데, 투자자는 아직 누군가의 안심시키는 말을 기다린다.

나는 정보가 나쁘다고 말하는 것이 아니다. 시장에는 정보가 필요하다. 하지만 정보는 판단의 재료일 뿐, 판단 그 자체가 되어서는 안 된다. 누군가의 확신이 내 확신을 대신하면 안 된다.

시장에서 자기 생각이 없는 사람은 운 좋게 돈을 벌 수는 있다. 하지만 오래 지키기는 어렵다. 왜냐하면 돈을 벌게 해준 이유를 모르기 때문에, 돈을 잃기 시작했을 때 빠져나올 이유도 모르기 때문이다.
''',
    ),
    _BookChapter(
      title: '7. 추세가 시작될 때의 고요함',
      body: '''
큰 움직임은 항상 큰 소리와 함께 시작되지 않는다. 때로는 조용히 시작된다. 사람들은 아직 의심하고, 뉴스는 뚜렷하지 않고, 가격은 천천히 그러나 꾸준히 한쪽으로 기울어진다. 그때 시장은 이미 준비하고 있는 경우가 많다.

나는 시세판을 볼 때 가격 자체보다 가격의 태도를 보려 했다. 오르다가 밀려도 다시 살아나는지, 빠질 듯하다가도 매수가 들어오는지, 사람들이 무관심한 사이에 거래가 쌓이는지. 이런 것들은 말보다 먼저 나타나는 신호였다.

추세를 타는 일은 용기가 필요하다. 그러나 그 용기는 무작정 뛰어드는 용기가 아니다. 시장이 보여주는 증거를 기다리고, 그 증거가 충분할 때 행동하는 용기다. 너무 빨리 들어가면 흔들림에 지치고, 너무 늦게 들어가면 위험이 커진다.

결국 추세 매매는 시장을 앞서가려는 일이 아니라, 시장이 이미 가고 있는 길에 올라타는 일이다. 이 차이를 이해하지 못하면 사람은 늘 예측에 취하고, 예측이 빗나갈 때 크게 다친다.
''',
    ),
    _BookChapter(
      title: '8. 너무 많이 아는 사람의 함정',
      body: '''
시장에는 똑똑한 사람이 많다. 회사의 재무를 잘 아는 사람, 경제를 잘 아는 사람, 정치와 금리를 읽는 사람, 산업을 깊게 파는 사람이 있다. 그러나 많이 안다는 것이 항상 돈을 벌게 해주지는 않는다.

문제는 지식이 많아질수록 자기 생각을 버리기 어려워진다는 데 있다. 어떤 사람이 한 회사에 대해 너무 많이 알면, 가격이 반대로 움직여도 자신이 모르는 무언가가 있다고 생각하기보다 시장이 틀렸다고 믿기 쉽다. 그는 사실을 보고 있다고 생각하지만, 실제로는 자신의 결론을 지키고 있을 수 있다.

나는 시장에서 겸손이 필요하다는 것을 늦게 배웠다. 겸손은 아무것도 모른다고 말하는 태도가 아니다. 겸손은 내가 많이 알고 있어도 틀릴 수 있다는 사실을 인정하는 태도다. 이것이 없으면 지식은 무기가 아니라 짐이 된다.

가격이 내 생각과 다르게 움직일 때는 화를 낼 일이 아니다. 그때는 질문해야 한다. 내가 무엇을 놓쳤는가. 그리고 더 중요한 질문을 해야 한다. 이 포지션을 계속 유지할 이유가 아직 남아 있는가.
''',
    ),
    _BookChapter(
      title: '9. 돈을 벌고 나서 더 위험해지는 이유',
      body: '''
손실 뒤에는 조심스러워지는 사람이 많다. 그러나 큰 수익 뒤에는 오히려 더 위험해지는 사람이 많다. 돈을 벌면 사람은 자신의 판단이 특별하다고 느낀다. 시장이 나를 인정했다고 착각한다.

나 역시 큰 수익을 얻은 뒤에는 마음이 커졌다. 같은 금액을 걸어도 작아 보였고, 전보다 더 큰 포지션을 잡아도 괜찮을 것 같았다. 이전의 성공이 다음 거래의 안전을 보장해주는 것처럼 느껴졌다. 그러나 시장은 과거의 수익을 보고 다음 손실을 줄여주지 않는다.

수익 뒤의 가장 큰 위험은 규칙이 느슨해지는 것이다. 원래는 기다렸을 자리에서 서두르고, 원래는 줄였을 손실을 버티고, 원래는 확인했을 신호를 대충 넘긴다. 자신감이 판단을 대신하기 시작하면 위험은 조용히 커진다.

시장에서 돈을 벌었을 때 가장 먼저 해야 할 일은 축하가 아니라 다시 작아지는 것이다. 마음을 작게 만들고, 규칙을 다시 확인하고, 이번 수익이 다음 거래를 망치지 않도록 해야 한다.
''',
    ),
    _BookChapter(
      title: '10. 쉬는 것도 포지션이다',
      body: '''
사람들은 시장에 참여하지 않는 시간을 낭비라고 생각한다. 그러나 나는 시간이 지나면서 쉬는 것도 하나의 포지션이라는 사실을 알게 되었다. 현금을 들고 기다리는 사람은 아무것도 하지 않는 사람이 아니다. 그는 다음 기회를 살 수 있는 권리를 들고 있는 사람이다.

매일 매매하려는 욕구는 강하다. 시세판은 계속 움직이고, 움직임은 사람을 유혹한다. 그러나 모든 움직임이 기회는 아니다. 어떤 움직임은 그저 소음이고, 어떤 움직임은 사람의 인내심을 빼앗기 위해 존재하는 것처럼 보인다.

좋은 투기자는 늘 행동하는 사람이 아니다. 좋은 투기자는 행동해야 할 때와 하지 말아야 할 때를 구분하는 사람이다. 이 구분이 없으면 에너지는 작은 거래에 흩어지고, 큰 기회가 왔을 때 이미 마음과 돈이 지쳐 있다.

나는 여러 번 쉬지 못해서 손해를 보았다. 시장이 나를 부르는 것 같았지만, 실제로는 내가 시장을 붙잡고 있었을 뿐이었다. 쉬는 법을 배우는 것은 매수와 매도만큼이나 중요한 기술이다.
''',
    ),
    _BookChapter(
      title: '11. 물타기가 위험해지는 순간',
      body: '''
가격이 내려갈수록 더 사면 평균 매입 단가는 낮아진다. 이 계산은 너무 단순해서 사람을 안심시킨다. 그러나 시장에서 단순한 계산이 항상 좋은 판단은 아니다. 가격이 내려가는 데에는 이유가 있을 수 있고, 그 이유를 모른 채 더 사는 것은 손실을 키우는 행동이 될 수 있다.

나는 손실이 난 포지션을 더 키우는 일이 얼마나 위험한지 배웠다. 처음에는 좋은 가격이라고 생각한다. 조금 더 빠지면 더 좋은 가격이라고 생각한다. 하지만 어느 순간부터 그것은 좋은 가격이 아니라 잘못된 판단을 인정하지 않으려는 행동이 된다.

물타기가 항상 나쁜 것은 아니다. 그러나 계획 없는 물타기는 대개 위험하다. 처음부터 어느 구간에서 얼마를 더 살지, 어디까지 틀리면 멈출지 정해두지 않았다면, 추가 매수는 전략이 아니라 감정의 방어가 된다.

시장은 투자자가 억울해하는지 관심이 없다. 평균 단가가 낮아졌다는 사실도 시장에는 중요하지 않다. 중요한 것은 지금 포지션이 여전히 좋은 판단인지, 아니면 손실을 숨기기 위한 변명인지다.
''',
    ),
    _BookChapter(
      title: '12. 군중은 늘 늦게 확신한다',
      body: '''
시장에는 군중의 감정이 있다. 처음에는 아무도 믿지 않는다. 조금 오르면 의심하고, 더 오르면 관심을 갖고, 크게 오르면 확신한다. 그리고 가장 늦게 확신한 사람들이 가장 비싼 가격을 지불하는 경우가 많다.

하락도 비슷하다. 처음에는 일시적인 조정이라고 말한다. 더 빠지면 좋은 매수 기회라고 말한다. 훨씬 더 빠지면 두려움이 퍼지고, 마지막에는 더 이상 견디지 못한 사람들이 팔기 시작한다. 그때가 지나고 나서야 시장은 바닥을 만들기도 한다.

군중을 비웃기는 쉽다. 그러나 누구나 군중의 일부가 될 수 있다. 나 역시 그랬다. 사람은 혼자 있을 때보다 함께 흥분할 때 더 쉽게 판단을 잃는다. 모두가 같은 말을 할 때, 그 말은 더 그럴듯하게 들린다.

그래서 투자자는 시장의 분위기를 보되, 분위기에 휩쓸리지 않아야 한다. 다수가 틀렸다는 뜻이 아니다. 다만 다수의 확신이 너무 뜨거워질 때, 위험도 함께 뜨거워질 수 있다는 사실을 기억해야 한다.
''',
    ),
    _BookChapter(
      title: '13. 레버리지는 마음을 확대한다',
      body: '''
레버리지는 수익과 손실만 키우는 것이 아니다. 사람의 마음도 키운다. 작은 상승은 큰 기쁨이 되고, 작은 하락은 큰 두려움이 된다. 같은 가격 움직임이라도 레버리지를 쓰면 전혀 다른 감정으로 다가온다.

나는 큰 포지션을 들고 있을 때 사람이 얼마나 쉽게 변하는지 보았다. 평소라면 차분히 볼 수 있는 흔들림도 견디기 어려워진다. 잠깐의 반등에 안도하고, 잠깐의 하락에 불안해진다. 결국 투자자는 시장이 아니라 자신의 감정과 싸우게 된다.

레버리지를 쓰는 사람에게 가장 필요한 것은 대담함보다 규율이다. 언제 줄일지, 언제 멈출지, 어느 정도 손실을 감당할지 미리 정하지 않으면 레버리지는 사람을 빠르게 몰아붙인다.

큰돈을 벌고 싶은 마음은 이해할 수 있다. 그러나 시장은 욕심이 큰 사람에게 더 친절하지 않다. 오히려 욕심이 큰 사람일수록 작은 흔들림에도 더 크게 흔들리도록 만든다.
''',
    ),
    _BookChapter(
      title: '14. 기다림은 고통스럽다',
      body: '''
좋은 기회를 기다리는 일은 생각보다 고통스럽다. 사람은 눈앞에서 가격이 움직이면 무언가 해야 할 것 같은 압박을 느낀다. 아무것도 하지 않는 시간은 뒤처지는 시간처럼 느껴지고, 다른 사람이 돈을 벌고 있다는 이야기는 마음을 더욱 조급하게 만든다.

그러나 시장에서 기다림은 빈 시간이 아니다. 기다림은 판단을 아끼는 시간이고, 돈을 지키는 시간이며, 다음 행동의 질을 높이는 시간이다. 아무 때나 들어가는 사람은 늘 빠져나올 이유를 찾게 된다. 기다린 사람은 들어가기 전부터 이유가 분명하다.

나는 좋은 기회를 기다리지 못해 여러 번 손해를 보았다. 대충 괜찮아 보이는 자리에서 들어가면, 시장은 대개 나를 시험했다. 확신이 약한 포지션은 작은 흔들림에도 마음이 흔들린다. 결국 좋은 매매는 좋은 기다림에서 시작된다.

기다림이 어려운 이유는 결과가 즉시 보이지 않기 때문이다. 하지만 시장에서 보이지 않는 준비가 보이는 수익을 만든다. 기다릴 줄 아는 사람은 모든 날을 자신의 날로 만들려 하지 않는다.
''',
    ),
    _BookChapter(
      title: '15. 시장은 복수를 허락하지 않는다',
      body: '''
손실을 본 뒤 바로 되찾고 싶은 마음은 강하다. 사람은 잃은 돈을 숫자로만 보지 않는다. 자존심, 억울함, 분노가 함께 붙는다. 그래서 손실 뒤의 거래는 위험하다. 그 거래는 시장을 보려는 거래가 아니라 마음을 회복하려는 거래가 되기 쉽다.

나는 복수 거래의 위험을 잘 안다. 방금 잃었기 때문에 더 크게 걸고 싶어진다. 이번에는 맞혀야 한다고 생각한다. 그러나 시장은 내가 방금 손실을 보았는지 알지 못하고, 알고 있다 해도 신경 쓰지 않는다.

손실 뒤에는 쉬어야 한다. 적어도 마음이 다시 시장을 볼 수 있을 때까지는 기다려야 한다. 손실을 되찾는 가장 좋은 방법은 곧바로 더 큰 거래를 하는 것이 아니라, 다음에 더 좋은 판단을 하는 것이다.

복수심은 시장에서 가장 비싼 감정 중 하나다. 분노는 방향을 보지 못하게 하고, 조급함은 규모를 키우게 하며, 억울함은 손절을 늦춘다. 시장은 이런 감정을 가진 사람에게서 천천히 돈을 가져간다.
''',
    ),
    _BookChapter(
      title: '16. 좋은 판단은 기록에서 나온다',
      body: '''
기억은 투자자에게 믿을 만한 도구가 아니다. 사람은 자신이 맞힌 거래를 더 선명하게 기억하고, 틀린 거래는 그럴 만한 이유가 있었다고 포장한다. 시간이 지나면 실수는 흐려지고 성공은 커진다.

그래서 기록이 필요하다. 내가 왜 샀는지, 어떤 신호를 보았는지, 어디서 틀렸다고 인정할 것인지, 실제로 어떻게 행동했는지 적어두면 자기 자신을 속이기 어려워진다. 시장에서 가장 어려운 상대는 때로 시장이 아니라 자기 합리화다.

기록은 단순한 일지가 아니다. 기록은 반복되는 실수를 보여준다. 어떤 사람은 늘 너무 빨리 산다. 어떤 사람은 늘 너무 늦게 판다. 어떤 사람은 손실 뒤에 무리한다. 기록이 없으면 이런 습관은 성격처럼 느껴지고, 고치기 어렵다.

나는 시장을 배우는 일이 결국 자신을 배우는 일이라는 사실을 알게 되었다. 숫자는 밖에 있지만, 실수의 뿌리는 안에 있다. 기록은 그 뿌리를 보게 해준다.
''',
    ),
    _BookChapter(
      title: '17. 큰 흐름과 작은 소음',
      body: '''
시장은 매일 흔들린다. 그 흔들림을 모두 의미 있는 신호로 받아들이면 투자자는 금세 지친다. 어떤 움직임은 중요한 변화의 시작이지만, 어떤 움직임은 그저 하루의 소음일 뿐이다.

큰 흐름을 보는 사람은 작은 흔들림에 덜 휘둘린다. 그러나 큰 흐름을 핑계로 명백한 위험 신호를 무시하면 안 된다. 이것이 어렵다. 투자자는 버텨야 할 조정과 피해야 할 전환을 구분해야 한다.

이 구분은 한 번에 배워지지 않는다. 차트를 오래 본다고 자동으로 생기는 것도 아니다. 중요한 것은 미리 기준을 세우는 것이다. 어떤 조건이 유지되면 버틸 것인지, 어떤 조건이 깨지면 나올 것인지 정해두어야 한다.

기준이 없는 사람은 매일 흔들린다. 가격이 오르면 희망을 키우고, 가격이 빠지면 공포에 빠진다. 기준이 있는 사람도 흔들리지만, 돌아갈 자리가 있다. 그 차이가 오래 버티는 힘이 된다.
''',
    ),
    _BookChapter(
      title: '18. 성공한 거래도 다시 검토해야 한다',
      body: '''
사람들은 손실 거래만 복기하려 한다. 그러나 성공한 거래도 다시 보아야 한다. 돈을 벌었다고 해서 판단이 모두 옳았던 것은 아니다. 운이 좋았을 수도 있고, 위험을 과하게 감수했는데 결과만 좋았을 수도 있다.

성공한 거래를 검토하지 않으면 위험한 습관이 강화된다. 무리하게 들어갔는데 돈을 벌면, 다음에도 그렇게 해도 된다고 생각한다. 손절 기준 없이 버텼는데 살아나면, 다음에도 버티면 된다고 믿는다. 시장은 가끔 잘못된 행동에도 보상을 주는데, 그것이 더 큰 위험을 만든다.

좋은 투자자는 결과와 과정을 함께 본다. 돈을 벌었는가도 중요하지만, 그 돈을 버는 과정이 반복 가능한가가 더 중요하다. 반복할 수 없는 수익은 실력이 아니라 사건에 가깝다.

나는 시장에서 오래 살아남으려면 자신에게 엄격해야 한다고 배웠다. 손실 앞에서만 엄격한 것이 아니라, 수익 앞에서도 엄격해야 한다. 그래야 수익이 자만으로 바뀌지 않는다.
''',
    ),
    _BookChapter(
      title: '19. 시장에서 살아남는 사람',
      body: '''
시장에는 한때 크게 번 사람이 많다. 그러나 오래 살아남은 사람은 훨씬 적다. 큰 수익은 사람들의 눈에 잘 보이지만, 오래 버티는 능력은 조용해서 잘 보이지 않는다. 하지만 결국 시장에서 가장 중요한 것은 생존이다.

살아남는 사람은 자신이 언제 약해지는지 안다. 어떤 상황에서 조급해지는지, 어떤 손실을 견디지 못하는지, 어떤 소문에 흔들리는지 알고 있다. 그는 시장만 연구하지 않고 자기 자신도 연구한다.

또한 살아남는 사람은 기회가 없을 때 억지로 기회를 만들지 않는다. 시장이 분명하지 않으면 기다리고, 손실이 커지면 줄이고, 크게 맞았을 때도 다시 규칙으로 돌아온다. 그는 한 번의 거래로 인생을 바꾸려 하지 않는다.

이 책이 오래 읽히는 이유는 시장의 기술보다 인간의 약점을 더 정확하게 보여주기 때문이다. 시대가 바뀌고 도구가 바뀌어도, 탐욕과 공포와 자존심은 크게 달라지지 않는다.
''',
    ),
    _BookChapter(
      title: '20. 마지막 장',
      body: '''
나는 시장에서 수많은 것을 배웠다. 가격은 말보다 정직하고, 손실은 빨리 인정할수록 작아지며, 큰돈은 조급한 손보다 기다릴 줄 아는 마음에 더 자주 온다. 그러나 이 모든 교훈은 알고 있는 것만으로는 부족하다. 실제 돈이 걸렸을 때 지킬 수 있어야 한다.

투자자는 늘 두 가지 싸움을 한다. 하나는 시장과의 싸움이고, 다른 하나는 자기 자신과의 싸움이다. 시장과의 싸움에서는 이길 수도 있고 질 수도 있다. 그러나 자기 자신과의 싸움에서 계속 지면, 시장에서 오래 버틸 수 없다.

좋은 판단은 화려하지 않다. 좋은 판단은 때로 지루하고, 때로 답답하고, 때로 아무것도 하지 않는 모습으로 나타난다. 하지만 그런 판단이 계좌를 지키고, 다음 기회를 가능하게 한다.

시장은 내일도 열린다. 이 단순한 사실을 잊지 않는 사람은 오늘 모든 것을 걸지 않는다. 오늘 살아남아야 내일의 기회를 볼 수 있다. 그것이 이 오래된 책이 지금도 투자자에게 남기는 가장 중요한 문장이다.
''',
    ),
  ];

  static const englishPages = <_BookChapter>[
    _BookChapter(
      title: 'About This Edition',
      body: '''
Reminiscences of a Stock Operator
Edwin Lefevre

This reader follows the flow of the English classic and presents it in a readable app format. It is arranged as a long-form reading edition rather than a short summary, so the reader can move through the story and its lessons page by page.

The story begins with a boy who works near a quotation board and becomes fascinated by the movement of prices. He watches grown men change their faces over a few points of movement. Before he understands the language of finance, he understands that prices speak in their own way.

The book is not only about making money. It is about judgment, discipline, fear, greed, and the strange habit people have of ignoring the market when it disagrees with them. The operator wins, loses, rises again, and learns that the market is a severe teacher.
''',
    ),
    _BookChapter(
      title: '1. The Boy at the Quotation Board',
      body: '''
I was young when I first began watching prices. The office had a board where quotations were written, and men came in with hopes, fears, and opinions. A small change in price could brighten one face and darken another. I did not know much about companies then, but I knew that numbers could command men.

At first I was only a boy doing a job. I wrote down prices as they came in and copied them where others could see them. But after doing the same thing day after day, I began to notice that prices had habits. They did not move exactly as men said they should. Sometimes they rose before the reason was known, and sometimes they fell while everyone still had explanations for why they ought to rise.

I became less interested in what people said and more interested in what prices did. Talk was easy. Buying and selling with real money was different. The tape, as traders called it, seemed to tell a story before the crowd understood the plot.

What began as a boy's curiosity slowly became the center of my life. I wanted to know when a price was ready to move, when a move was false, and when the crowd was late. The market became my classroom, and the cost of tuition would later prove very high.
''',
    ),
    _BookChapter(
      title: '2. The First Taste of Winning',
      body: '''
When I first risked money, I did not think of myself as a great trader. I simply believed I had watched the board long enough to see things that others missed. I knew how prices behaved when interest appeared and how they acted when a move had no strength behind it.

Early success is dangerous. When a man makes money, he is tempted to believe that the money is proof of wisdom. I was no different. A few correct trades gave me confidence, and confidence soon became the desire to trade larger.

At first the market seemed generous. I was right often enough to believe that the game was simple. But the market does not remain gentle with a man who grows careless. It lets him win just enough to become bold, and then it charges him for confusing boldness with skill.

I learned later that the most expensive lessons are often the ones we thought we had already learned. Knowing a rule is easy. Obeying it while money is at risk is the real test.
''',
    ),
    _BookChapter(
      title: '3. The Market Does Not Wait for Explanations',
      body: '''
People enjoy explaining price movements after they happen. If a stock rises, they find a favorable reason. If it falls, they discover a bad rumor. But prices often move before the explanation arrives.

I was not afraid of trading without a perfect explanation. I was more afraid of ignoring a clear movement because it disagreed with my opinion. The market does not explain itself politely. It moves, and the trader must decide whether to listen.

Beginners often trade opinions. They buy because a company is good, because a stock has fallen a great deal, or because someone important is said to be buying. But the market does not pay a man for having an opinion. It pays him for being right in position and right in time.

So I learned to listen less to talk and more to action. Words could be loud, but money was quieter and more decisive. In the end, the price was the record of what money had actually done.
''',
    ),
    _BookChapter(
      title: '4. Being Right Quickly Is Not the Same as Making Big Money',
      body: '''
I was good at catching small movements. A few points up or down often seemed clear to me before others saw it. But catching small movements and making large profits are not the same thing.

A man who trades every small turn becomes busy. He buys, sells, takes a profit, and begins again. He may look skillful, but if he treats a great trend like a small fluctuation, he will leave the largest money on the table.

The big money was not made by constant action. It was made by sitting with a correct position while the market carried it far enough. This sounds simple, but it is difficult because no good position moves in a straight line.

I was right many times and still failed to make what I should have made. I sold too soon. I feared losing a profit more than I respected the trend. In time I learned that being right is only the beginning. Holding correctly is the harder art.
''',
    ),
    _BookChapter(
      title: '5. The Art of Becoming Small When Wrong',
      body: '''
Every trader is wrong. The difference between survival and ruin is what he does after he becomes wrong. A small loss is the market's quiet warning. If ignored, the warning becomes louder and more expensive.

I enlarged losses many times. At first I told myself the price would return. Then I told myself it would be foolish to sell after such a decline. Finally the loss became so large that I no longer watched the market clearly. I watched only my own wound.

Cutting a loss looks like a cold technique, but it is really emotional discipline. A man must give up pride, admit error, and abandon an idea that only a short time earlier felt certain.

A small loss is the price of staying in the game. A large loss can take away the ability to play the next hand. That is why the first loss is usually the best loss.
''',
    ),
    _BookChapter(
      title: '6. Rumors Move People, Prices Move Money',
      body: '''
Wall Street has always been full of rumors. A company is improving, a pool is buying, an announcement is coming, an important man knows something. People love such stories because stories make uncertainty feel manageable.

But a position entered on another man's word is weak. If trouble comes, the trader waits for another man's reassurance instead of reading the market. The price may already be saying that the trade is wrong, but the trader waits for the rumor to save him.

Information has value, but it must not replace judgment. A rumor may be a reason to investigate, but it is not a reason to surrender responsibility. The money at risk belongs to the trader, so the final decision must also belong to him.

A man may make money by accident on another man's tip. Keeping that money is another matter. If he does not know why he entered, he will not know when to leave.
''',
    ),
    _BookChapter(
      title: '7. The Quiet Beginning of a Trend',
      body: '''
Great movements do not always begin with noise. Often they begin quietly. The crowd is uncertain, the news is incomplete, and the price begins to lean in one direction with increasing persistence.

I watched not only the price but the behavior of the price. Did it recover after a decline? Did buying appear when weakness should have continued? Did volume gather before the public became interested? Such signs often appeared before explanations.

Following a trend requires courage, but not blind courage. It requires the patience to wait for evidence and the courage to act when the evidence is sufficient. Enter too early and the ordinary shaking of the market may wear you out. Enter too late and the risk may be too large.

Trend trading is not the art of predicting the future. It is the art of recognizing where the market has already begun to go.
''',
    ),
    _BookChapter(
      title: '8. The Trap of Knowing Too Much',
      body: '''
There are many intelligent people in the market. Some understand balance sheets, some understand economics, some understand politics and interest rates, and some know an industry deeply. But knowledge alone does not guarantee profits.

The danger is that knowledge can make a man stubborn. If he knows too much about a company, he may explain away a falling price because he believes the market has failed to appreciate what he knows. He thinks he is defending facts, but often he is defending his conclusion.

Humility is not ignorance. Humility is the ability to say, even after careful study, that the market may be showing something I have missed. Without that humility, knowledge becomes a burden.

When price moves against an idea, the question is not whether the market has insulted me. The question is whether the reason for the position still exists.
''',
    ),
    _BookChapter(
      title: '9. Why Profit Can Make a Man More Dangerous',
      body: '''
After a loss, many men become careful. After a large profit, many become dangerous. Profit can make a man believe that the market has confirmed his superiority.

I knew that feeling. After making money, the same position size seemed too small. A larger trade seemed natural. Past success appeared to promise future safety, though the market makes no such promise.

The greatest danger after profit is the loosening of rules. A man enters sooner than he should, holds a loss longer than he planned, and ignores signals he would have respected before. Confidence begins to replace discipline.

After a large win, the trader must become small again in his own mind. He must return to rules before profit becomes pride.
''',
    ),
    _BookChapter(
      title: '10. Rest Is Also a Position',
      body: '''
Many traders think that staying out of the market is wasted time. It is not. Cash is a position. It gives a man the right to act when a real opportunity appears.

The market moves every day, and movement tempts men to participate. But not every movement is an opportunity. Some movement is only noise. Some exists only to exhaust attention and capital.

The good speculator is not the man who is always busy. He is the man who knows when action is required and when inaction is wiser. Without that distinction, energy is scattered across mediocre trades.

I lost money many times because I could not rest. I thought the market was calling me, but often I was the one clinging to the market.
''',
    ),
    _BookChapter(
      title: '11. The Danger of Averaging Down',
      body: '''
When a price falls, buying more lowers the average cost. The arithmetic is simple, and that simplicity comforts people. But simple arithmetic is not always good judgment.

A falling price may be falling for a reason. If a man buys more without understanding whether the original judgment remains valid, he may be increasing a mistake rather than improving a position.

Averaging down is not always wrong, but unplanned averaging down is dangerous. If the trader did not decide in advance where to add, how much to add, and where to stop, the additional purchase is often emotional defense.

The market does not care that a man's average cost has improved. It cares only about supply, demand, fear, greed, and money.
''',
    ),
    _BookChapter(
      title: '12. The Crowd Becomes Certain Too Late',
      body: '''
At first the crowd doubts a move. Then it notices. Then it believes. Finally it becomes certain, and often the last certainty comes at the highest price.

Declines work the same way. At first the decline is called temporary. Then it is called an opportunity. Later it becomes frightening. At the end, those who can no longer bear the fear sell in despair.

It is easy to laugh at the crowd, but every trader can become part of it. A man thinks more poorly when he is excited with others. Agreement makes an idea feel safer than it really is.

The trader must observe the mood of the crowd without becoming its servant. The crowd is not always wrong, but when certainty becomes too hot, risk often becomes hot with it.
''',
    ),
    _BookChapter(
      title: '13. Leverage Enlarges the Mind as Well as the Account',
      body: '''
Leverage does not only enlarge profits and losses. It enlarges emotion. A small rise becomes great joy. A small decline becomes great fear.

With a large position, ordinary fluctuation becomes difficult to endure. A movement that would have been harmless at normal size becomes a threat. The trader stops reading the market and begins reading his own anxiety.

The leveraged trader needs discipline more than courage. He must know when to reduce, when to stop, and how much pain he can afford before the trade begins.

The desire to make large money is understandable. But the market is not kinder to large desire. It often uses that desire to make a man overstay, overtrade, and overrisk.
''',
    ),
    _BookChapter(
      title: '14. Waiting Is Painful',
      body: '''
Waiting for a good opportunity is painful. When prices move, a man feels he ought to be doing something. Doing nothing can feel like falling behind.

But waiting is not empty time. It preserves judgment, capital, and emotional strength. A man who enters casually must search for reasons later. A man who waits enters with reasons already formed.

I lost money because I did not wait. A position that is only almost right can become very uncomfortable. Weak conviction cannot survive ordinary market noise.

Good trading begins before the trade. It begins in the waiting.
''',
    ),
    _BookChapter(
      title: '15. The Market Does Not Allow Revenge',
      body: '''
After a loss, the desire to recover quickly is strong. The lost money carries pride, anger, and humiliation with it. That makes the next trade dangerous.

Revenge trading is not really trading the market. It is trading one's own injury. The man increases size because he wants relief, not because the opportunity is better.

The market does not know that a trader has just lost money, and if it knew, it would not care. It gives no special terms to a wounded man.

After a loss, the best first action is often rest. The money will not be recovered by anger. It will be recovered, if at all, by better judgment later.
''',
    ),
    _BookChapter(
      title: '16. Judgment Comes From Records',
      body: '''
Memory is not reliable in speculation. A man remembers his successes clearly and explains away his mistakes. With time, errors become reasonable and wins become larger in the imagination.

Records make self-deception harder. Why did I enter? What did I see? Where was I supposed to admit error? What did I actually do? Written answers reveal patterns that memory hides.

One man always buys too early. Another sells too late. Another becomes reckless after a loss. Without records these habits feel like personality. With records they become visible.

Learning the market is also learning oneself. The numbers are outside, but many mistakes begin inside.
''',
    ),
    _BookChapter(
      title: '17. The Main Movement and the Noise',
      body: '''
The market shakes every day. If every shake is treated as a major signal, the trader soon becomes exhausted. Some movements matter. Others are only noise.

The trader must distinguish a normal reaction from a change in character. This is difficult. Hold too stubbornly and a real reversal becomes ruin. React too quickly and every small shake throws you out.

The answer is not emotion but preparation. Before the market tests him, the trader must decide what conditions keep him in and what conditions take him out.

A man without standards is moved by every price. A man with standards may still feel fear, but he has a place to return.
''',
    ),
    _BookChapter(
      title: '18. Profitable Trades Must Also Be Reviewed',
      body: '''
Many traders review only their losses. But winning trades must also be examined. A profit does not prove that the process was sound.

Sometimes a man makes money after taking foolish risk. If he does not review the trade, the profit teaches him the wrong lesson. The market occasionally rewards bad behavior, and that reward can be dangerous.

The question is not only whether money was made. The question is whether the decision can be repeated without depending on luck.

A trader must be strict with profits as well as losses. Otherwise profit becomes the seed of future carelessness.
''',
    ),
    _BookChapter(
      title: '19. The Man Who Survives',
      body: '''
There are many people who once made large money in the market. There are fewer who survived for a long time. Large profits are visible. Survival is quieter.

The survivor knows his weaknesses. He knows when he becomes impatient, what kind of loss disturbs him, and which stories tempt him. He studies himself as much as he studies prices.

He does not force opportunity when none exists. He waits when the market is unclear, reduces when the trade is wrong, and returns to rules after both wins and losses.

This is why the book remains alive. It is not only about old markets. It is about human nature in markets, and human nature has not changed much.
''',
    ),
    _BookChapter(
      title: '20. Final Page',
      body: '''
The market taught me many things. Price is more honest than talk. Losses are best when they are small. Large profits come less often from restless hands than from patient judgment.

But knowing these things is not enough. They must be obeyed when money is at risk. That is where most men fail.

The trader fights two battles. One is with the market. The other is with himself. He may lose to the market and recover. If he continually loses to himself, he will not last.

The market will open again tomorrow. The man who remembers this does not need to risk everything today. To survive today is to keep the right to meet tomorrow's opportunity.
''',
    ),
  ];

  @override
  void initState() {
    super.initState();
    loadSavedBookPosition();
  }

  Future<void> loadSavedBookPosition() async {
    final prefs = await SharedPreferences.getInstance();
    final pageKey = await userScopedPrefsKey(_bookReaderPagePrefsKey);
    final languageKey = await userScopedPrefsKey(_bookReaderLanguagePrefsKey);
    final savedEnglish = prefs.getBool(languageKey) ?? false;
    final pageCount = savedEnglish ? englishPages.length : koreanPages.length;
    final savedPage = (prefs.getInt(pageKey) ?? 0).clamp(0, pageCount - 1);
    if (!mounted) return;
    setState(() {
      showEnglish = savedEnglish;
      currentPage = savedPage;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && pageController.hasClients) {
        pageController.jumpToPage(currentPage);
      }
    });
  }

  Future<void> saveBookPosition() async {
    final prefs = await SharedPreferences.getInstance();
    final pageKey = await userScopedPrefsKey(_bookReaderPagePrefsKey);
    final languageKey = await userScopedPrefsKey(_bookReaderLanguagePrefsKey);
    await prefs.setInt(pageKey, currentPage);
    await prefs.setBool(languageKey, showEnglish);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : _appBg;
    final cardBg = whiteMode ? _lightSurface : _darkSurface;
    final cardLine = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;
    final accent = whiteMode ? _lightBlue : _cyan;
    final l10n = AppLocalizations.of(context)!;
    final pages = showEnglish ? englishPages : koreanPages;
    final progress = '${currentPage + 1}/${pages.length}';
    final screenTitle = l10n.bookReadingTitle;
    final bookTitle =
        showEnglish ? 'Reminiscences of a Stock Operator' : '어느 주식투자자의 회상';

    void changeBookLanguage(bool next) {
      if (showEnglish == next) return;
      setState(() {
        showEnglish = next;
        currentPage = 0;
      });
      if (pageController.hasClients) {
        pageController.jumpToPage(0);
      }
      saveBookPosition();
    }

    Widget languageButton(String label, bool value) {
      final selected = showEnglish == value;
      return Expanded(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => changeBookLanguage(value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 140),
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected ? accent : Colors.transparent,
              borderRadius: BorderRadius.circular(9),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                maxLines: 1,
                style: TextStyle(
                  color: selected
                      ? (whiteMode ? Colors.white : _appBg)
                      : secondaryText,
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: pageBg,
      bottomNavigationBar: buildAdOnlyBottomBar(),
      appBar: AppBar(
        title: Text(screenTitle),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          buildWhiteModeButton(context),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  bookTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: primaryText,
                    fontSize: 19,
                    height: 1.22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: cardLine),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 88,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: accent.withValues(
                            alpha: whiteMode ? 0.08 : 0.12,
                          ),
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(
                            color: accent.withValues(alpha: 0.18),
                          ),
                        ),
                        child: Row(
                          children: [
                            languageButton('한글', false),
                            const SizedBox(width: 3),
                            languageButton('EN', true),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 62,
                      height: 30,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color:
                              accent.withValues(alpha: whiteMode ? 0.08 : 0.12),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: accent.withValues(alpha: 0.22),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            progress,
                            maxLines: 1,
                            style: TextStyle(
                              color: accent,
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                  saveBookPosition();
                },
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: cardBg,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: cardLine),
                      ),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Text(
                            l10n.bookReaderPageNumber(index + 1),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: accent,
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            page.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 20,
                              height: 1.25,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 14),
                          SelectableText(
                            page.body,
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 15,
                              height: 1.62,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pages.length, (index) {
                  final selected = index == currentPage;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    width: selected ? 18 : 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: selected
                          ? accent
                          : secondaryText.withValues(alpha: 0.28),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
