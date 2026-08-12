part of '../main.dart';

class LongFormBookReaderPage extends StatelessWidget {
  const LongFormBookReaderPage({super.key});

  static const _chapters = <_BookChapter>[
    _BookChapter(
      title: '원서 소개',
      body: '''Reminiscences of a Stock Operator
Edwin Lefevre

이 독서판은 영어 원서의 흐름을 따라 한국어로 읽기 쉽게 옮긴 번역형 본문입니다. 원문을 한 문장씩 그대로 옮긴 완역본은 아니지만, 책의 이야기 전개와 핵심 장면을 따라가며 긴 글로 읽을 수 있도록 구성했습니다.

이 책의 주인공은 어린 시절 증권 중개 사무실에서 시세판을 기록하던 소년으로 시작합니다. 그는 숫자가 움직이는 방식에 매혹되고, 사람들이 왜 사고파는지보다 가격이 어떻게 움직이는지에 먼저 관심을 갖습니다. 누군가는 그를 투기꾼이라 부르고, 누군가는 천재적인 시세 읽기의 소유자라 말합니다. 그러나 이 책이 보여주는 것은 화려한 성공담만이 아닙니다.

그는 여러 번 큰돈을 벌고, 여러 번 거의 모든 것을 잃습니다. 시장을 맞힌 순간에도 사람은 무너질 수 있고, 틀렸다는 사실을 빨리 인정하지 못하면 작은 실수는 순식간에 인생을 흔드는 손실이 됩니다. 그래서 이 책은 돈을 버는 법보다, 시장 앞에서 사람이 어떻게 흔들리는지를 더 오래 보여줍니다.''',
    ),
    _BookChapter(
      title: '1. 시세판 앞의 소년',
      body: '''나는 아주 어릴 때부터 숫자가 움직이는 모습을 지켜보았다. 사무실 한쪽에는 시세가 적힌 판이 있었고, 사람들은 그 숫자 하나하나에 얼굴빛이 달라졌다. 어떤 사람은 가격이 조금만 올라가도 세상을 얻은 듯 웃었고, 어떤 사람은 몇 포인트 빠졌다는 말에 금세 말수가 줄었다.

처음에는 그저 일을 빨리 처리하는 소년일 뿐이었다. 누가 무슨 종목을 불러주면 받아 적고, 전신으로 들어오는 가격을 판에 옮겼다. 하지만 같은 일을 매일 반복하다 보니 이상한 것이 보이기 시작했다. 가격은 아무렇게나 움직이는 듯했지만, 어떤 때에는 오르려는 힘이 분명했고, 어떤 때에는 아무리 버티려 해도 아래로 밀리는 힘이 느껴졌다.

나는 사람들이 떠드는 이유보다 숫자의 움직임을 더 믿게 되었다. 사무실 안의 어른들은 늘 이유를 말했다. 회사가 좋다, 소문이 있다, 누군가가 산다, 곧 오른다. 그러나 가격은 그들의 말과 다르게 움직일 때가 많았다. 그때부터 나는 생각했다. 시장에서 중요한 것은 말이 아니라 실제 거래되는 가격이라고.

그 깨달음은 어린 나에게는 놀이처럼 시작되었다. 그러나 시간이 지나면서 그것은 내 인생을 바꾸는 기술이 되었다. 나는 가격이 올라갈 것인지 내려갈 것인지 맞히는 것보다, 가격이 움직이기 시작하는 순간을 알아차리는 일에 빠져들었다.''',
    ),
    _BookChapter(
      title: '2. 처음 배운 승리',
      body: '''처음 돈을 걸었을 때 나는 내가 특별한 사람이라고 생각하지 않았다. 다만 시세판을 오래 보았기 때문에 남들보다 조금 더 빨리 알아차릴 수 있다고 믿었다. 가격이 어떤 식으로 움직이는지, 사람들이 흥분할 때 숫자가 어떻게 반응하는지, 조용한 종목이 갑자기 살아날 때 어떤 모습이 나타나는지 눈에 익었다.

초기의 승리는 위험했다. 돈을 벌면 사람은 자신의 판단이 옳았다는 증거를 얻었다고 느낀다. 나 역시 그랬다. 몇 번의 성공은 나에게 자신감을 주었고, 그 자신감은 곧 더 크게 베팅하고 싶은 마음으로 바뀌었다. 시장은 처음에는 친절한 선생처럼 보였다. 내가 맞히면 돈을 주었고, 나는 그 돈이 내 실력의 대가라고 생각했다.

그러나 시장은 사람을 가르칠 때 늘 부드럽게 가르치지 않는다. 처음에 쉽게 번 돈은 사람을 조심스럽게 만들지 않는다. 오히려 더 대담하게 만든다. 대담함은 때로 필요하지만, 준비되지 않은 대담함은 손실을 부르는 지름길이다.

나는 이 사실을 나중에 여러 번 배웠다. 이상하게도 시장에서 가장 비싼 수업료는 항상 같은 교훈을 다시 배우는 데 쓰인다. 사람은 이미 알고 있다고 생각하는 것을 실제로 지키지 못할 때 가장 크게 다친다.''',
    ),
    _BookChapter(
      title: '3. 시장은 설명을 기다려주지 않는다',
      body: '''사람들은 가격이 움직인 뒤에 이유를 찾는 것을 좋아한다. 주가가 오르면 좋은 소식 때문이라고 하고, 빠지면 나쁜 소문 때문이라고 말한다. 하지만 내가 시세판 앞에서 배운 것은 달랐다. 가격은 종종 뉴스보다 먼저 움직이고, 설명은 나중에 붙는다.

나는 이유를 모른 채 매수하거나 매도하는 일이 불안하지 않았다. 불안한 것은 오히려 가격이 분명히 말하고 있는데도, 내 생각과 다르다는 이유로 듣지 않는 일이었다. 시장은 친절하게 설명하지 않는다. 다만 움직일 뿐이다. 그 움직임을 인정할 것인지, 아니면 내 의견을 붙잡을 것인지는 투자자의 선택이다.

초보자는 흔히 의견을 거래한다. 좋은 회사니까 오른다, 많이 빠졌으니까 오른다, 누구나 좋다고 하니까 오른다. 그러나 시장은 의견에 보상하지 않는다. 시장이 보상하는 것은 옳은 시점에 옳은 방향으로 서 있는 사람이다. 그리고 틀렸을 때 빨리 물러나는 사람이다.

나는 점점 더 말을 줄이고 가격을 보게 되었다. 누가 무엇을 말했는지보다, 실제로 돈이 어느 방향으로 움직이고 있는지가 중요했다. 시장에서 말은 많고 돈은 조용하다. 그러나 결국 가격을 움직이는 것은 말이 아니라 돈이다.''',
    ),
    _BookChapter(
      title: '4. 빨리 맞히는 것과 크게 버는 것은 다르다',
      body: '''나는 어린 시절부터 단기 움직임을 잘 맞히는 편이었다. 가격이 몇 포인트 움직일 방향을 잡아내는 일은 나에게 자연스럽게 느껴졌다. 그러나 시장에서 오래 살아보니, 빨리 맞히는 능력과 크게 버는 능력은 전혀 다른 문제였다.

작은 움직임을 자주 맞히면 사람은 바빠진다. 계속 사고팔고, 작은 이익을 챙기고, 다시 들어간다. 겉보기에는 매우 능숙해 보인다. 하지만 큰 추세가 시작될 때도 같은 방식으로 행동하면, 정작 가장 큰 돈이 걸린 구간을 놓치게 된다.

큰돈은 자주 움직이는 손에서 나오지 않았다. 큰돈은 옳은 자리에 앉은 뒤, 시장이 충분히 움직일 때까지 버티는 데서 나왔다. 이것은 말로는 쉽지만 실제로는 어렵다. 가격은 절대 한 방향으로만 가지 않는다. 좋은 포지션도 중간에 흔들리고, 흔들림은 사람의 마음을 시험한다.

나는 여러 번 너무 일찍 팔았다. 맞혔지만 크게 벌지 못했다. 그때마다 깨달았다. 시장에서 중요한 것은 단지 방향을 맞히는 것이 아니라, 맞았을 때 충분히 얻을 수 있는 마음과 규칙을 갖는 것이다.''',
    ),
    _BookChapter(
      title: '5. 틀렸을 때 작아지는 기술',
      body: '''시장에서는 누구나 틀린다. 문제는 틀렸다는 사실 자체가 아니라, 틀렸을 때 어떻게 행동하느냐다. 작은 손실은 투자자에게 보내는 시장의 짧은 경고다. 그 경고를 무시하면 시장은 더 큰 목소리로 말한다. 그때는 이미 손실이 커져 있다.

나는 여러 번 손실을 키웠다. 처음에는 조금만 기다리면 돌아올 것 같았다. 그 다음에는 여기서 팔면 너무 억울하다고 생각했다. 더 지나면 손실이 너무 커져서 판단이 흐려졌다. 그 순간부터 투자자는 시장을 보는 것이 아니라 자신의 손실만 보게 된다.

손실을 작게 자르는 일은 차가운 기술처럼 보이지만, 사실은 가장 감정적인 훈련이다. 자존심을 내려놓아야 하고, 내가 틀렸다는 사실을 인정해야 하며, 방금 전까지 믿었던 생각을 버릴 수 있어야 한다. 많은 사람이 이것을 하지 못해 시장에서 사라진다.

나는 결국 배웠다. 손실은 투자자의 적이 아니라 관리해야 할 비용이다. 작은 손실은 다음 기회를 살려두는 비용이다. 큰 손실은 다음 기회에 참여할 능력 자체를 빼앗아간다.''',
    ),
    _BookChapter(
      title: '6. 소문은 사람을 움직이고 가격은 돈을 움직인다',
      body: '''월스트리트에는 늘 소문이 있었다. 어떤 회사가 좋아진다, 누군가 대량으로 산다, 곧 발표가 있다, 큰손이 움직인다. 사람들은 이런 말을 좋아한다. 소문은 이야기가 있고, 이야기는 사람의 마음을 쉽게 붙잡는다.

그러나 소문으로 산 주식은 마음을 약하게 만든다. 내가 왜 샀는지 내 안에 분명한 이유가 없기 때문이다. 남의 말을 믿고 들어간 포지션은 문제가 생겼을 때 다시 그 사람의 말을 기다리게 한다. 시장은 이미 틀렸다고 말하는데, 투자자는 아직 누군가의 안심시키는 말을 기다린다.

나는 정보가 나쁘다고 말하는 것이 아니다. 시장에는 정보가 필요하다. 하지만 정보는 판단의 재료일 뿐, 판단 그 자체가 되어서는 안 된다. 누군가의 확신이 내 확신을 대신하면 안 된다.

시장에서 자기 생각이 없는 사람은 운 좋게 돈을 벌 수는 있다. 하지만 오래 지키기는 어렵다. 왜냐하면 돈을 벌게 해준 이유를 모르기 때문에, 돈을 잃기 시작했을 때 빠져나올 이유도 모르기 때문이다.''',
    ),
    _BookChapter(
      title: '7. 추세가 시작될 때의 고요함',
      body: '''큰 움직임은 항상 큰 소리와 함께 시작되지 않는다. 때로는 조용히 시작된다. 사람들은 아직 의심하고, 뉴스는 뚜렷하지 않고, 가격은 천천히 그러나 꾸준히 한쪽으로 기울어진다. 그때 시장은 이미 준비하고 있는 경우가 많다.

나는 시세판을 볼 때 가격 자체보다 가격의 태도를 보려 했다. 오르다가 밀려도 다시 살아나는지, 빠질 듯하다가도 매수가 들어오는지, 사람들이 무관심한 사이에 거래가 쌓이는지. 이런 것들은 말보다 먼저 나타나는 신호였다.

추세를 타는 일은 용기가 필요하다. 그러나 그 용기는 무작정 뛰어드는 용기가 아니다. 시장이 보여주는 증거를 기다리고, 그 증거가 충분할 때 행동하는 용기다. 너무 빨리 들어가면 흔들림에 지치고, 너무 늦게 들어가면 위험이 커진다.

결국 추세 매매는 시장을 앞서가려는 일이 아니라, 시장이 이미 가고 있는 길에 올라타는 일이다. 이 차이를 이해하지 못하면 사람은 늘 예측에 취하고, 예측이 빗나갈 때 크게 다친다.''',
    ),
    _BookChapter(
      title: '8. 너무 많이 아는 사람의 함정',
      body: '''시장에는 똑똑한 사람이 많다. 회사의 재무를 잘 아는 사람, 경제를 잘 아는 사람, 정치와 금리를 읽는 사람, 산업을 깊게 파는 사람이 있다. 그러나 많이 안다는 것이 항상 돈을 벌게 해주지는 않는다.

문제는 지식이 많아질수록 자기 생각을 버리기 어려워진다는 데 있다. 어떤 사람이 한 회사에 대해 너무 많이 알면, 가격이 반대로 움직여도 자신이 모르는 무언가가 있다고 생각하기보다 시장이 틀렸다고 믿기 쉽다. 그는 사실을 보고 있다고 생각하지만, 실제로는 자신의 결론을 지키고 있을 수 있다.

나는 시장에서 겸손이 필요하다는 것을 늦게 배웠다. 겸손은 아무것도 모른다고 말하는 태도가 아니다. 겸손은 내가 많이 알고 있어도 틀릴 수 있다는 사실을 인정하는 태도다. 이것이 없으면 지식은 무기가 아니라 짐이 된다.

가격이 내 생각과 다르게 움직일 때는 화를 낼 일이 아니다. 그때는 질문해야 한다. 내가 무엇을 놓쳤는가. 그리고 더 중요한 질문을 해야 한다. 이 포지션을 계속 유지할 이유가 아직 남아 있는가.''',
    ),
    _BookChapter(
      title: '9. 돈을 벌고 나서 더 위험해지는 이유',
      body: '''손실 뒤에는 조심스러워지는 사람이 많다. 그러나 큰 수익 뒤에는 오히려 더 위험해지는 사람이 많다. 돈을 벌면 사람은 자신의 판단이 특별하다고 느낀다. 시장이 나를 인정했다고 착각한다.

나 역시 큰 수익을 얻은 뒤에는 마음이 커졌다. 같은 금액을 걸어도 작아 보였고, 전보다 더 큰 포지션을 잡아도 괜찮을 것 같았다. 이전의 성공이 다음 거래의 안전을 보장해주는 것처럼 느껴졌다. 그러나 시장은 과거의 수익을 보고 다음 손실을 줄여주지 않는다.

수익 뒤의 가장 큰 위험은 규칙이 느슨해지는 것이다. 원래는 기다렸을 자리에서 서두르고, 원래는 줄였을 손실을 버티고, 원래는 확인했을 신호를 대충 넘긴다. 자신감이 판단을 대신하기 시작하면 위험은 조용히 커진다.

시장에서 돈을 벌었을 때 가장 먼저 해야 할 일은 축하가 아니라 다시 작아지는 것이다. 마음을 작게 만들고, 규칙을 다시 확인하고, 이번 수익이 다음 거래를 망치지 않도록 해야 한다.''',
    ),
    _BookChapter(
      title: '10. 쉬는 것도 포지션이다',
      body: '''사람들은 시장에 참여하지 않는 시간을 낭비라고 생각한다. 그러나 나는 시간이 지나면서 쉬는 것도 하나의 포지션이라는 사실을 알게 되었다. 현금을 들고 기다리는 사람은 아무것도 하지 않는 사람이 아니다. 그는 다음 기회를 살 수 있는 권리를 들고 있는 사람이다.

매일 매매하려는 욕구는 강하다. 시세판은 계속 움직이고, 움직임은 사람을 유혹한다. 그러나 모든 움직임이 기회는 아니다. 어떤 움직임은 그저 소음이고, 어떤 움직임은 사람의 인내심을 빼앗기 위해 존재하는 것처럼 보인다.

좋은 투기자는 늘 행동하는 사람이 아니다. 좋은 투기자는 행동해야 할 때와 하지 말아야 할 때를 구분하는 사람이다. 이 구분이 없으면 에너지는 작은 거래에 흩어지고, 큰 기회가 왔을 때 이미 마음과 돈이 지쳐 있다.

나는 여러 번 쉬지 못해서 손해를 보았다. 시장이 나를 부르는 것 같았지만, 실제로는 내가 시장을 붙잡고 있었을 뿐이었다. 쉬는 법을 배우는 것은 매수와 매도만큼이나 중요한 기술이다.''',
    ),
    _BookChapter(
      title: '11. 물타기가 위험해지는 순간',
      body: '''가격이 내려갈수록 더 사면 평균 매입 단가는 낮아진다. 이 계산은 너무 단순해서 사람을 안심시킨다. 그러나 시장에서 단순한 계산이 항상 좋은 판단은 아니다. 가격이 내려가는 데에는 이유가 있을 수 있고, 그 이유를 모른 채 더 사는 것은 손실을 키우는 행동이 될 수 있다.

나는 손실이 난 포지션을 더 키우는 일이 얼마나 위험한지 배웠다. 처음에는 좋은 가격이라고 생각한다. 조금 더 빠지면 더 좋은 가격이라고 생각한다. 하지만 어느 순간부터 그것은 좋은 가격이 아니라 잘못된 판단을 인정하지 않으려는 행동이 된다.

물타기가 항상 나쁜 것은 아니다. 그러나 계획 없는 물타기는 대개 위험하다. 처음부터 어느 구간에서 얼마를 더 살지, 어디까지 틀리면 멈출지 정해두지 않았다면, 추가 매수는 전략이 아니라 감정의 방어가 된다.

시장은 투자자가 억울해하는지 관심이 없다. 평균 단가가 낮아졌다는 사실도 시장에는 중요하지 않다. 중요한 것은 지금 포지션이 여전히 좋은 판단인지, 아니면 손실을 숨기기 위한 변명인지다.''',
    ),
    _BookChapter(
      title: '12. 군중은 늘 늦게 확신한다',
      body: '''시장에는 군중의 감정이 있다. 처음에는 아무도 믿지 않는다. 조금 오르면 의심하고, 더 오르면 관심을 갖고, 크게 오르면 확신한다. 그리고 가장 늦게 확신한 사람들이 가장 비싼 가격을 지불하는 경우가 많다.

하락도 비슷하다. 처음에는 일시적인 조정이라고 말한다. 더 빠지면 좋은 매수 기회라고 말한다. 훨씬 더 빠지면 두려움이 퍼지고, 마지막에는 더 이상 견디지 못한 사람들이 팔기 시작한다. 그때가 지나고 나서야 시장은 바닥을 만들기도 한다.

군중을 비웃기는 쉽다. 그러나 누구나 군중의 일부가 될 수 있다. 나 역시 그랬다. 사람은 혼자 있을 때보다 함께 흥분할 때 더 쉽게 판단을 잃는다. 모두가 같은 말을 할 때, 그 말은 더 그럴듯하게 들린다.

그래서 투자자는 시장의 분위기를 보되, 분위기에 휩쓸리지 않아야 한다. 다수가 틀렸다는 뜻이 아니다. 다만 다수의 확신이 너무 뜨거워질 때, 위험도 함께 뜨거워질 수 있다는 사실을 기억해야 한다.''',
    ),
    _BookChapter(
      title: '13. 레버리지는 마음을 확대한다',
      body: '''레버리지는 수익과 손실만 키우는 것이 아니다. 사람의 마음도 키운다. 작은 상승은 큰 기쁨이 되고, 작은 하락은 큰 두려움이 된다. 같은 가격 움직임이라도 레버리지를 쓰면 전혀 다른 감정으로 다가온다.

나는 큰 포지션을 들고 있을 때 사람이 얼마나 쉽게 변하는지 보았다. 평소라면 차분히 볼 수 있는 흔들림도 견디기 어려워진다. 잠깐의 반등에 안도하고, 잠깐의 하락에 불안해진다. 결국 투자자는 시장이 아니라 자신의 감정과 싸우게 된다.

레버리지를 쓰는 사람에게 가장 필요한 것은 대담함보다 규율이다. 언제 줄일지, 언제 멈출지, 어느 정도 손실을 감당할지 미리 정하지 않으면 레버리지는 사람을 빠르게 몰아붙인다.

큰돈을 벌고 싶은 마음은 이해할 수 있다. 그러나 시장은 욕심이 큰 사람에게 더 친절하지 않다. 오히려 욕심이 큰 사람일수록 작은 흔들림에도 더 크게 흔들리도록 만든다.''',
    ),
    _BookChapter(
      title: '14. 기다림은 고통스럽다',
      body: '''좋은 기회를 기다리는 일은 생각보다 고통스럽다. 사람은 눈앞에서 가격이 움직이면 무언가 해야 할 것 같은 압박을 느낀다. 아무것도 하지 않는 시간은 뒤처지는 시간처럼 느껴지고, 다른 사람이 돈을 벌고 있다는 이야기는 마음을 더욱 조급하게 만든다.

그러나 시장에서 기다림은 빈 시간이 아니다. 기다림은 판단을 아끼는 시간이고, 돈을 지키는 시간이며, 다음 행동의 질을 높이는 시간이다. 아무 때나 들어가는 사람은 늘 빠져나올 이유를 찾게 된다. 기다린 사람은 들어가기 전부터 이유가 분명하다.

나는 좋은 기회를 기다리지 못해 여러 번 손해를 보았다. 대충 괜찮아 보이는 자리에서 들어가면, 시장은 대개 나를 시험했다. 확신이 약한 포지션은 작은 흔들림에도 마음이 흔들린다. 결국 좋은 매매는 좋은 기다림에서 시작된다.

기다림이 어려운 이유는 결과가 즉시 보이지 않기 때문이다. 하지만 시장에서 보이지 않는 준비가 보이는 수익을 만든다. 기다릴 줄 아는 사람은 모든 날을 자신의 날로 만들려 하지 않는다.''',
    ),
    _BookChapter(
      title: '15. 시장은 복수를 허락하지 않는다',
      body: '''손실을 본 뒤 바로 되찾고 싶은 마음은 강하다. 사람은 잃은 돈을 숫자로만 보지 않는다. 자존심, 억울함, 분노가 함께 붙는다. 그래서 손실 뒤의 거래는 위험하다. 그 거래는 시장을 보려는 거래가 아니라 마음을 회복하려는 거래가 되기 쉽다.

나는 복수 거래의 위험을 잘 안다. 방금 잃었기 때문에 더 크게 걸고 싶어진다. 이번에는 맞혀야 한다고 생각한다. 그러나 시장은 내가 방금 손실을 보았는지 알지 못하고, 알고 있다 해도 신경 쓰지 않는다.

손실 뒤에는 쉬어야 한다. 적어도 마음이 다시 시장을 볼 수 있을 때까지는 기다려야 한다. 손실을 되찾는 가장 좋은 방법은 곧바로 더 큰 거래를 하는 것이 아니라, 다음에 더 좋은 판단을 하는 것이다.

복수심은 시장에서 가장 비싼 감정 중 하나다. 분노는 방향을 보지 못하게 하고, 조급함은 규모를 키우게 하며, 억울함은 손절을 늦춘다. 시장은 이런 감정을 가진 사람에게서 천천히 돈을 가져간다.''',
    ),
    _BookChapter(
      title: '16. 좋은 판단은 기록에서 나온다',
      body: '''기억은 투자자에게 믿을 만한 도구가 아니다. 사람은 자신이 맞힌 거래를 더 선명하게 기억하고, 틀린 거래는 그럴 만한 이유가 있었다고 포장한다. 시간이 지나면 실수는 흐려지고 성공은 커진다.

그래서 기록이 필요하다. 내가 왜 샀는지, 어떤 신호를 보았는지, 어디서 틀렸다고 인정할 것인지, 실제로 어떻게 행동했는지 적어두면 자기 자신을 속이기 어려워진다. 시장에서 가장 어려운 상대는 때로 시장이 아니라 자기 합리화다.

기록은 단순한 일지가 아니다. 기록은 반복되는 실수를 보여준다. 어떤 사람은 늘 너무 빨리 산다. 어떤 사람은 늘 너무 늦게 판다. 어떤 사람은 손실 뒤에 무리한다. 기록이 없으면 이런 습관은 성격처럼 느껴지고, 고치기 어렵다.

나는 시장을 배우는 일이 결국 자신을 배우는 일이라는 사실을 알게 되었다. 숫자는 밖에 있지만, 실수의 뿌리는 안에 있다. 기록은 그 뿌리를 보게 해준다.''',
    ),
    _BookChapter(
      title: '17. 큰 흐름과 작은 소음',
      body: '''시장은 매일 흔들린다. 그 흔들림을 모두 의미 있는 신호로 받아들이면 투자자는 금세 지친다. 어떤 움직임은 중요한 변화의 시작이지만, 어떤 움직임은 그저 하루의 소음일 뿐이다.

큰 흐름을 보는 사람은 작은 흔들림에 덜 휘둘린다. 그러나 큰 흐름을 핑계로 명백한 위험 신호를 무시하면 안 된다. 이것이 어렵다. 투자자는 버텨야 할 조정과 피해야 할 전환을 구분해야 한다.

이 구분은 한 번에 배워지지 않는다. 차트를 오래 본다고 자동으로 생기는 것도 아니다. 중요한 것은 미리 기준을 세우는 것이다. 어떤 조건이 유지되면 버틸 것인지, 어떤 조건이 깨지면 나올 것인지 정해두어야 한다.

기준이 없는 사람은 매일 흔들린다. 가격이 오르면 희망을 키우고, 가격이 빠지면 공포에 빠진다. 기준이 있는 사람도 흔들리지만, 돌아갈 자리가 있다. 그 차이가 오래 버티는 힘이 된다.''',
    ),
    _BookChapter(
      title: '18. 성공한 거래도 다시 검토해야 한다',
      body: '''사람들은 손실 거래만 복기하려 한다. 그러나 성공한 거래도 다시 보아야 한다. 돈을 벌었다고 해서 판단이 모두 옳았던 것은 아니다. 운이 좋았을 수도 있고, 위험을 과하게 감수했는데 결과만 좋았을 수도 있다.

성공한 거래를 검토하지 않으면 위험한 습관이 강화된다. 무리하게 들어갔는데 돈을 벌면, 다음에도 그렇게 해도 된다고 생각한다. 손절 기준 없이 버텼는데 살아나면, 다음에도 버티면 된다고 믿는다. 시장은 가끔 잘못된 행동에도 보상을 주는데, 그것이 더 큰 위험을 만든다.

좋은 투자자는 결과와 과정을 함께 본다. 돈을 벌었는가도 중요하지만, 그 돈을 버는 과정이 반복 가능한가가 더 중요하다. 반복할 수 없는 수익은 실력이 아니라 사건에 가깝다.

나는 시장에서 오래 살아남으려면 자신에게 엄격해야 한다고 배웠다. 손실 앞에서만 엄격한 것이 아니라, 수익 앞에서도 엄격해야 한다. 그래야 수익이 자만으로 바뀌지 않는다.''',
    ),
    _BookChapter(
      title: '19. 시장에서 살아남는 사람',
      body: '''시장에는 한때 크게 번 사람이 많다. 그러나 오래 살아남은 사람은 훨씬 적다. 큰 수익은 사람들의 눈에 잘 보이지만, 오래 버티는 능력은 조용해서 잘 보이지 않는다. 하지만 결국 시장에서 가장 중요한 것은 생존이다.

살아남는 사람은 자신이 언제 약해지는지 안다. 어떤 상황에서 조급해지는지, 어떤 손실을 견디지 못하는지, 어떤 소문에 흔들리는지 알고 있다. 그는 시장만 연구하지 않고 자기 자신도 연구한다.

또한 살아남는 사람은 기회가 없을 때 억지로 기회를 만들지 않는다. 시장이 분명하지 않으면 기다리고, 손실이 커지면 줄이고, 크게 맞았을 때도 다시 규칙으로 돌아온다. 그는 한 번의 거래로 인생을 바꾸려 하지 않는다.

이 책이 오래 읽히는 이유는 시장의 기술보다 인간의 약점을 더 정확하게 보여주기 때문이다. 시대가 바뀌고 도구가 바뀌어도, 탐욕과 공포와 자존심은 크게 달라지지 않는다.''',
    ),
    _BookChapter(
      title: '20. 마지막 장',
      body: '''나는 시장에서 수많은 것을 배웠다. 가격은 말보다 정직하고, 손실은 빨리 인정할수록 작아지며, 큰돈은 조급한 손보다 기다릴 줄 아는 마음에 더 자주 온다. 그러나 이 모든 교훈은 알고 있는 것만으로는 부족하다. 실제 돈이 걸렸을 때 지킬 수 있어야 한다.

투자자는 늘 두 가지 싸움을 한다. 하나는 시장과의 싸움이고, 다른 하나는 자기 자신과의 싸움이다. 시장과의 싸움에서는 이길 수도 있고 질 수도 있다. 그러나 자기 자신과의 싸움에서 계속 지면, 시장에서 오래 버틸 수 없다.

좋은 판단은 화려하지 않다. 좋은 판단은 때로 지루하고, 때로 답답하고, 때로 아무것도 하지 않는 모습으로 나타난다. 하지만 그런 판단이 계좌를 지키고, 다음 기회를 가능하게 한다.

시장은 내일도 열린다. 이 단순한 사실을 잊지 않는 사람은 오늘 모든 것을 걸지 않는다. 오늘 살아남아야 내일의 기회를 볼 수 있다. 그것이 이 오래된 책이 지금도 투자자에게 남기는 가장 중요한 문장이다.''',
    ),
  ];

  // ── English ───────────────────────────────────────────────────────────────

  static const _englishBodies = <String>[
    // Ch0 intro
    '''Reminiscences of a Stock Operator
Edwin Lefevre

This reader follows the flow of the English classic and presents it in a readable app format. It is arranged as a long-form reading edition rather than a short summary, so the reader can move through the story and its lessons page by page.

The story begins with a boy who works near a quotation board and becomes fascinated by the movement of prices. He watches grown men change their faces over a few points of movement. Before he understands the language of finance, he understands that prices speak in their own way.

The book is not only about making money. It is about judgment, discipline, fear, greed, and the strange habit people have of ignoring the market when it disagrees with them. The operator wins, loses, rises again, and learns that the market is a severe teacher.''',
    // Ch1
    '''I was young when I first began watching prices. The office had a board where quotations were written, and men came in with hopes, fears, and opinions. A small change in price could brighten one face and darken another. I did not know much about companies then, but I knew that numbers could command men.

At first I was only a boy doing a job. I wrote down prices as they came in and copied them where others could see them. But after doing the same thing day after day, I began to notice that prices had habits. They did not move exactly as men said they should. Sometimes they rose before the reason was known, and sometimes they fell while everyone still had explanations for why they ought to rise.

I became less interested in what people said and more interested in what prices did. Talk was easy. Buying and selling with real money was different. The tape seemed to tell a story before the crowd understood the plot.

What began as a boy's curiosity slowly became the center of my life. I wanted to know when a price was ready to move, when a move was false, and when the crowd was late. The market became my classroom, and the cost of tuition would later prove very high.''',
    // Ch2
    '''When I first risked money, I did not think of myself as a great trader. I simply believed I had watched the board long enough to see things that others missed. I knew how prices behaved when interest appeared and how they acted when a move had no strength behind it.

Early success is dangerous. When a man makes money, he is tempted to believe that the money is proof of wisdom. I was no different. A few correct trades gave me confidence, and confidence soon became the desire to trade larger.

At first the market seemed generous. I was right often enough to believe that the game was simple. But the market does not remain gentle with a man who grows careless. It lets him win just enough to become bold, and then it charges him for confusing boldness with skill.

I learned later that the most expensive lessons are often the ones we thought we had already learned. Knowing a rule is easy. Obeying it while money is at risk is the real test.''',
    // Ch3
    '''People enjoy explaining price movements after they happen. If a stock rises, they find a favorable reason. If it falls, they discover a bad rumor. But prices often move before the explanation arrives.

I was not afraid of trading without a perfect explanation. I was more afraid of ignoring a clear movement because it disagreed with my opinion. The market does not explain itself politely. It moves, and the trader must decide whether to listen.

Beginners often trade opinions. They buy because a company is good, because a stock has fallen a great deal, or because someone important is said to be buying. But the market does not pay a man for having an opinion. It pays him for being right in position and right in time.

So I learned to listen less to talk and more to action. Words could be loud, but money was quieter and more decisive. In the end, the price was the record of what money had actually done.''',
    // Ch4
    '''I was good at catching small movements. A few points up or down often seemed clear to me before others saw it. But catching small movements and making large profits are not the same thing.

A man who trades every small turn becomes busy. He buys, sells, takes a profit, and begins again. He may look skillful, but if he treats a great trend like a small fluctuation, he will leave the largest money on the table.

The big money was not made by constant action. It was made by sitting with a correct position while the market carried it far enough. This sounds simple, but it is difficult because no good position moves in a straight line.

I was right many times and still failed to make what I should have made. I sold too soon. I feared losing a profit more than I respected the trend. In time I learned that being right is only the beginning. Holding correctly is the harder art.''',
    // Ch5
    '''Every trader is wrong. The difference between survival and ruin is what he does after he becomes wrong. A small loss is the market's quiet warning. If ignored, the warning becomes louder and more expensive.

I enlarged losses many times. At first I told myself the price would return. Then I told myself it would be foolish to sell after such a decline. Finally the loss became so large that I no longer watched the market clearly. I watched only my own wound.

Cutting a loss looks like a cold technique, but it is really emotional discipline. A man must give up pride, admit error, and abandon an idea that only a short time earlier felt certain.

A small loss is the price of staying in the game. A large loss can take away the ability to play the next hand. That is why the first loss is usually the best loss.''',
    // Ch6
    '''Wall Street has always been full of rumors. A company is improving, a pool is buying, an announcement is coming, an important man knows something. People love such stories because stories make uncertainty feel manageable.

But a position entered on another man's word is weak. If trouble comes, the trader waits for another man's reassurance instead of reading the market. The price may already be saying that the trade is wrong, but the trader waits for the rumor to save him.

Information has value, but it must not replace judgment. A rumor may be a reason to investigate, but it is not a reason to surrender responsibility. The money at risk belongs to the trader, so the final decision must also belong to him.

A man may make money by accident on another man's tip. Keeping that money is another matter. If he does not know why he entered, he will not know when to leave.''',
    // Ch7
    '''Great movements do not always begin with noise. Often they begin quietly. The crowd is uncertain, the news is incomplete, and the price begins to lean in one direction with increasing persistence.

I watched not only the price but the behavior of the price. Did it recover after a decline? Did buying appear when weakness should have continued? Did volume gather before the public became interested? Such signs often appeared before explanations.

Following a trend requires courage, but not blind courage. It requires the patience to wait for evidence and the courage to act when the evidence is sufficient. Enter too early and the ordinary shaking of the market may wear you out. Enter too late and the risk may be too large.

Trend trading is not the art of predicting the future. It is the art of recognizing where the market has already begun to go.''',
    // Ch8
    '''There are many intelligent people in the market. Some understand balance sheets, some understand economics, some understand politics and interest rates, and some know an industry deeply. But knowledge alone does not guarantee profits.

The danger is that knowledge can make a man stubborn. If he knows too much about a company, he may explain away a falling price because he believes the market has failed to appreciate what he knows. He thinks he is defending facts, but often he is defending his conclusion.

Humility is not ignorance. Humility is the ability to say, even after careful study, that the market may be showing something I have missed. Without that humility, knowledge becomes a burden.

When price moves against an idea, the question is not whether the market has insulted me. The question is whether the reason for the position still exists.''',
    // Ch9
    '''After a loss, many men become careful. After a large profit, many become dangerous. Profit can make a man believe that the market has confirmed his superiority.

I knew that feeling. After making money, the same position size seemed too small. A larger trade seemed natural. Past success appeared to promise future safety, though the market makes no such promise.

The greatest danger after profit is the loosening of rules. A man enters sooner than he should, holds a loss longer than he planned, and ignores signals he would have respected before. Confidence begins to replace discipline.

After a large win, the trader must become small again in his own mind. He must return to rules before profit becomes pride.''',
    // Ch10
    '''Many traders think that staying out of the market is wasted time. It is not. Cash is a position. It gives a man the right to act when a real opportunity appears.

The market moves every day, and movement tempts men to participate. But not every movement is an opportunity. Some movement is only noise. Some exists only to exhaust attention and capital.

The good speculator is not the man who is always busy. He is the man who knows when action is required and when inaction is wiser. Without that distinction, energy is scattered across mediocre trades.

I lost money many times because I could not rest. I thought the market was calling me, but often I was the one clinging to the market.''',
    // Ch11
    '''When a price falls, buying more lowers the average cost. The arithmetic is simple, and that simplicity comforts people. But simple arithmetic is not always good judgment.

A falling price may be falling for a reason. If a man buys more without understanding whether the original judgment remains valid, he may be increasing a mistake rather than improving a position.

Averaging down is not always wrong, but unplanned averaging down is dangerous. If the trader did not decide in advance where to add, how much to add, and where to stop, the additional purchase is often emotional defense.

The market does not care that a man's average cost has improved. It cares only about supply, demand, fear, greed, and money.''',
    // Ch12
    '''At first the crowd doubts a move. Then it notices. Then it believes. Finally it becomes certain, and often the last certainty comes at the highest price.

Declines work the same way. At first the decline is called temporary. Then it is called an opportunity. Later it becomes frightening. At the end, those who can no longer bear the fear sell in despair.

It is easy to laugh at the crowd, but every trader can become part of it. A man thinks more poorly when he is excited with others. Agreement makes an idea feel safer than it really is.

The trader must observe the mood of the crowd without becoming its servant. The crowd is not always wrong, but when certainty becomes too hot, risk often becomes hot with it.''',
    // Ch13
    '''Leverage does not only enlarge profits and losses. It enlarges emotion. A small rise becomes great joy. A small decline becomes great fear.

With a large position, ordinary fluctuation becomes difficult to endure. A movement that would have been harmless at normal size becomes a threat. The trader stops reading the market and begins reading his own anxiety.

The leveraged trader needs discipline more than courage. He must know when to reduce, when to stop, and how much pain he can afford before the trade begins.

The desire to make large money is understandable. But the market is not kinder to large desire. It often uses that desire to make a man overstay, overtrade, and overrisk.''',
    // Ch14
    '''Waiting for a good opportunity is painful. When prices move, a man feels he ought to be doing something. Doing nothing can feel like falling behind.

But waiting is not empty time. It preserves judgment, capital, and emotional strength. A man who enters casually must search for reasons later. A man who waits enters with reasons already formed.

I lost money because I did not wait. A position that is only almost right can become very uncomfortable. Weak conviction cannot survive ordinary market noise.

Good trading begins before the trade. It begins in the waiting.''',
    // Ch15
    '''After a loss, the desire to recover quickly is strong. The lost money carries pride, anger, and humiliation with it. That makes the next trade dangerous.

Revenge trading is not really trading the market. It is trading one's own injury. The man increases size because he wants relief, not because the opportunity is better.

The market does not know that a trader has just lost money, and if it knew, it would not care. It gives no special terms to a wounded man.

After a loss, the best first action is often rest. The money will not be recovered by anger. It will be recovered, if at all, by better judgment later.''',
    // Ch16
    '''Memory is not reliable in speculation. A man remembers his successes clearly and explains away his mistakes. With time, errors become reasonable and wins become larger in the imagination.

Records make self-deception harder. Why did I enter? What did I see? Where was I supposed to admit error? What did I actually do? Written answers reveal patterns that memory hides.

One man always buys too early. Another sells too late. Another becomes reckless after a loss. Without records these habits feel like personality. With records they become visible.

Learning the market is also learning oneself. The numbers are outside, but many mistakes begin inside.''',
    // Ch17
    '''The market shakes every day. If every shake is treated as a major signal, the trader soon becomes exhausted. Some movements matter. Others are only noise.

The trader must distinguish a normal reaction from a change in character. This is difficult. Hold too stubbornly and a real reversal becomes ruin. React too quickly and every small shake throws you out.

The answer is not emotion but preparation. Before the market tests him, the trader must decide what conditions keep him in and what conditions take him out.

A man without standards is moved by every price. A man with standards may still feel fear, but he has a place to return.''',
    // Ch18
    '''Many traders review only their losses. But winning trades must also be examined. A profit does not prove that the process was sound.

Sometimes a man makes money after taking foolish risk. If he does not review the trade, the profit teaches him the wrong lesson. The market occasionally rewards bad behavior, and that reward can be dangerous.

The question is not only whether money was made. The question is whether the decision can be repeated without depending on luck.

A trader must be strict with profits as well as losses. Otherwise profit becomes the seed of future carelessness.''',
    // Ch19
    '''There are many people who once made large money in the market. There are fewer who survived for a long time. Large profits are visible. Survival is quieter.

The survivor knows his weaknesses. He knows when he becomes impatient, what kind of loss disturbs him, and which stories tempt him. He studies himself as much as he studies prices.

He does not force opportunity when none exists. He waits when the market is unclear, reduces when the trade is wrong, and returns to rules after both wins and losses.

This is why the book remains alive. It is not only about old markets. It is about human nature in markets, and human nature has not changed much.''',
    // Ch20
    '''The market taught me many things. Price is more honest than talk. Losses are best when they are small. Large profits come less often from restless hands than from patient judgment.

But knowing these things is not enough. They must be obeyed when money is at risk. That is where most men fail.

The trader fights two battles. One is with the market. The other is with himself. He may lose to the market and recover. If he continually loses to himself, he will not last.

The market will open again tomorrow. The man who remembers this does not need to risk everything today. To survive today is to keep the right to meet tomorrow's opportunity.''',
  ];

  static List<_BookChapter> _withEnTitles() {
    const titles = [
      'About This Edition',
      '1. The Boy at the Quotation Board',
      '2. The First Taste of Winning',
      '3. The Market Does Not Wait for Explanations',
      '4. Being Right Quickly Is Not the Same as Making Big Money',
      '5. The Art of Becoming Small When Wrong',
      '6. Rumors Move People, Prices Move Money',
      '7. The Quiet Beginning of a Trend',
      '8. The Trap of Knowing Too Much',
      '9. Why Profit Can Make a Man More Dangerous',
      '10. Rest Is Also a Position',
      '11. The Danger of Averaging Down',
      '12. The Crowd Becomes Certain Too Late',
      '13. Leverage Enlarges the Mind as Well as the Account',
      '14. Waiting Is Painful',
      '15. The Market Does Not Allow Revenge',
      '16. Judgment Comes From Records',
      '17. The Main Movement and the Noise',
      '18. Profitable Trades Must Also Be Reviewed',
      '19. The Man Who Survives',
      '20. Final Page',
    ];
    return List.generate(
      _englishBodies.length,
      (i) => _BookChapter(title: titles[i], body: _englishBodies[i]),
    );
  }

  // ── Japanese ──────────────────────────────────────────────────────────────

  static const _japaneseBodies = <String>[
    // Ch0
    '''株式トレーダーの回想録
エドウィン・ルフェーヴル

この読書版は、英語原書の流れに沿って構成した長編読み物です。完全な逐語訳ではありませんが、物語の展開と重要な場面を追いながら、ページごとに読み進められるよう編集しています。

主人公は、幼い頃に証券ブローカーの事務所で相場板を記録する少年として物語が始まります。彼は数字が動く様子に魅了され、人々がなぜ売買するかよりも、価格がどのように動くかに先に興味を持ちます。

この本が伝えるのは華やかな成功談だけではありません。彼は何度も大金を稼ぎ、何度もほぼすべてを失います。相場を読んだ瞬間でも人は崩れ得ること、そして間違いをすぐに認められなければ小さなミスが人生を揺るがす損失になることを、この本は教えてくれます。''',
    // Ch1
    '''私はごく幼い頃から、数字が動く様子を眺めていた。事務所の一角には相場が書かれた板があり、人々はその一つひとつの数字に顔色を変えた。価格が少し上がっただけで世界を手に入れたように笑う人もいれば、数ポイント下がっただけで口数が減る人もいた。

最初は仕事をてきぱきとこなす少年に過ぎなかった。銘柄を言われれば書き留め、電信で届く価格を板に転記した。しかし毎日同じことを繰り返すうちに、奇妙なことが見えてきた。価格は無秩序に動いているように見えたが、ある時には上昇しようとする力がはっきりと感じられ、ある時にはどう踏ん張っても押し下げられる力があった。

私は人々が語る理由より、数字の動きを信じるようになった。事務所の大人たちは常に理由を語った。会社が良い、噂がある、誰かが買っている、すぐに上がる。しかし価格は彼らの言葉とは違う動きをすることが多かった。その時から私は思った。市場で重要なのは言葉ではなく、実際に取引される価格だと。''',
    // Ch2
    '''初めてお金を賭けた時、私は自分が特別な人間だとは思っていなかった。ただ相場板を長く見てきたので、他の人より少し早く気づけると信じていた。価格がどのように動くか、人々が興奮した時に数字がどう反応するか、静かな銘柄が突然動き出す時にどんな様子が現れるかを目で覚えていた。

初期の成功は危険だった。お金を稼ぐと、人は自分の判断が正しかった証拠を得たと感じる。私も同じだった。いくつかの成功が私に自信を与え、その自信はすぐにもっと大きく賭けたいという気持ちに変わった。市場は最初、親切な先生のように見えた。

しかし市場は人を教える時、常に優しく教えるわけではない。最初に簡単に稼いだお金は、人を慎重にはしない。むしろ大胆にさせる。大胆さは時に必要だが、準備のない大胆さは損失を招く近道だ。

市場での最も高い授業料は、常に同じ教訓を再び学ぶために使われる。人はすでに知っていると思っていることを実際に守れない時に最も大きく傷つく。''',
    // Ch3
    '''人々は価格が動いた後で理由を探すのが好きだ。株価が上がれば良いニュースのせいだと言い、下がれば悪い噂のせいだと言う。しかし私が相場板の前で学んだことは違った。価格はしばしばニュースより先に動き、説明は後からついてくる。

私は理由がわからないまま買ったり売ったりすることが不安ではなかった。不安なのはむしろ、価格がはっきりと語りかけているのに、自分の考えと違うという理由で聞き入れないことだった。市場は親切に説明しない。ただ動くだけだ。

初心者はしばしば意見を取引する。良い会社だから上がる、たくさん下がったから上がる、みんなが良いと言うから上がる。しかし市場は意見に報いない。市場が報いるのは、正しい時に正しい方向にいる人だ。そして間違った時に素早く退く人だ。

市場では言葉は多く、お金は静かだ。しかし結局価格を動かすのは言葉ではなくお金だ。''',
    // Ch4
    '''私は幼い頃から短期的な動きをよく読む方だった。価格が何ポイント動くかを読み取ることは、私には自然に感じられた。しかし市場で長く生きてみると、素早く当てる能力と大きく稼ぐ能力はまったく別の問題だとわかった。

小さな動きをよく当てると、人は忙しくなる。買っては売り、小さな利益を取り、また入る。傍から見ると非常に熟練しているように見える。しかし大きなトレンドが始まった時も同じやり方をすると、最も大きなお金がかかっている局面を逃してしまう。

大きなお金は頻繁に動く手からは来なかった。大きなお金は正しいポジションに着いた後、市場が十分に動くまで耐えるところから来た。

私は何度も早く売りすぎた。当たっていたのに大きく稼げなかった。その度に気づいた。市場で重要なのは方向を当てることだけでなく、当たった時に十分に得られる心と規律を持つことだ。''',
    // Ch5
    '''市場では誰でも間違える。問題は間違ったという事実自体ではなく、間違った時にどう行動するかだ。小さな損失は投資家への市場からの短い警告だ。その警告を無視すると、市場はより大きな声で語る。その時にはすでに損失が膨らんでいる。

私は何度も損失を膨らませた。最初はもう少し待てば戻ると思った。次にはここで売るのはあまりにも悔しいと思った。さらに損失が大きくなると判断が曇った。その瞬間から投資家は市場を見るのではなく、自分の損失だけを見るようになる。

損失を小さく切ることは冷たい技術のように見えるが、実は最も感情的な訓練だ。プライドを捨て、自分が間違っていることを認め、ほんの少し前まで信じていた考えを捨てられなければならない。

損失は投資家の敵ではなく、管理すべきコストだ。小さな損失は次の機会を生かしておくためのコストだ。大きな損失は次の機会に参加する能力そのものを奪ってしまう。''',
    // Ch6
    '''ウォール街には常に噂があった。ある会社が良くなる、誰かが大量に買っている、もうすぐ発表がある、大口が動いている。人々はこういう話が好きだ。噂には物語があり、物語は人の心を掴みやすい。

しかし噂で買った株は心を弱くする。なぜ買ったのか自分の中に明確な理由がないからだ。他人の言葉を信じて入ったポジションは、問題が生じた時に再びその人の言葉を待つことになる。市場はすでに間違いだと言っているのに、投資家はまだ誰かの安心させる言葉を待っている。

情報が悪いと言っているのではない。市場には情報が必要だ。しかし情報は判断の材料に過ぎず、判断そのものになってはならない。誰かの確信が自分の確信に取って代わってはならない。

運良くお金を稼げることはある。しかし守り続けることは難しい。稼いだ理由を知らないため、失い始めた時に撤退する理由もわからないからだ。''',
    // Ch7
    '''大きな動きは常に大きな音とともに始まるわけではない。時には静かに始まる。人々はまだ疑い、ニュースははっきりせず、価格はゆっくりと、しかし着実に一方向に傾いていく。その時市場はすでに準備していることが多い。

私は相場板を見る時、価格そのものより価格の態度を見ようとした。上がって押されてもまた戻るか、下がりそうでも買いが入るか、人々が無関心な間に出来高が積み上がるか。こういったことは言葉より先に現れるシグナルだった。

トレンドに乗ることには勇気が必要だ。しかしそれは無闇に飛び込む勇気ではない。市場が示す証拠を待ち、その証拠が十分な時に行動する勇気だ。早く入りすぎると揺れに疲れ、遅く入りすぎるとリスクが大きくなる。

トレンド売買は市場を先取りしようとすることではなく、市場がすでに進んでいる道に乗ることだ。''',
    // Ch8
    '''市場には賢い人が多い。会社の財務をよく知る人、経済をよく知る人、政治と金利を読む人、産業を深く掘り下げる人がいる。しかし多く知ることが常にお金を稼がせるわけではない。

問題は、知識が増えるほど自分の考えを捨てにくくなることだ。ある人が一つの会社について知りすぎると、価格が逆に動いても市場が間違っていると信じやすくなる。事実を見ていると思っているが、実際には自分の結論を守っているのかもしれない。

市場では謙虚さが必要だということを私は遅く学んだ。謙虚さとは何も知らないと言う態度ではない。謙虚さとは、多く知っていても間違い得るという事実を認める態度だ。これがなければ知識は武器ではなく荷物になる。

価格が自分の考えと違う動きをする時は怒る必要はない。その時は問うべきだ。自分は何を見落としたか。そしてより重要な問いを立てるべきだ。このポジションを維持する理由はまだあるか。''',
    // Ch9
    '''損失の後は慎重になる人が多い。しかし大きな利益の後はむしろ危険になる人が多い。お金を稼ぐと、人は自分の判断が特別だと感じる。市場が自分を認めてくれたと錯覚する。

私も大きな利益を得た後は気が大きくなった。同じ金額を賭けても少なく感じ、以前より大きなポジションを取っても大丈夫そうに思えた。過去の成功が次の取引の安全を保証してくれるように感じた。しかし市場は過去の利益を見て次の損失を減らしてくれない。

利益後の最大の危険はルールが緩くなることだ。本来待つべき場所で急ぎ、本来減らすべき損失を耐え、本来確認すべきシグナルをおろそかにする。自信が判断に取って代わり始めると、危険は静かに大きくなる。

市場でお金を稼いだ時に最初にすべきことは祝福ではなく、再び小さくなることだ。''',
    // Ch10
    '''人々は市場に参加しない時間を無駄だと思う。しかし私は時間が経つにつれ、休むことも一つのポジションだということを知った。現金を持って待っている人は何もしていない人ではない。次の機会を買う権利を持っている人だ。

毎日売買したいという欲求は強い。相場板は動き続け、動きは人を誘惑する。しかしすべての動きが機会ではない。ある動きはただのノイズであり、ある動きは人の忍耐を奪うためだけに存在しているように見える。

良い投機家は常に行動する人ではない。良い投機家は行動すべき時と、すべきでない時を区別できる人だ。この区別がなければエネルギーは小さな取引に散らばり、大きなチャンスが来た時にはすでに心とお金が疲れている。

市場が自分を呼んでいると思ったが、実際には自分が市場にしがみついているだけだったことが多かった。''',
    // Ch11
    '''価格が下がるほど多く買えば平均購入単価は下がる。この計算は単純すぎて人を安心させる。しかし市場で単純な計算が常に良い判断とは限らない。価格が下がるには理由があることがあり、その理由を知らないまま多く買うことは損失を膨らませる行動になりかねない。

私は損失ポジションをさらに大きくすることがいかに危険かを学んだ。最初は良い価格だと思う。もう少し下がればさらに良い価格だと思う。しかしある時点から、それは良い価格ではなく、間違った判断を認めたくないための行動になる。

ナンピンが常に悪いわけではない。しかし計画のないナンピンはたいてい危険だ。最初からどの水準でいくら追加するか、どこまで間違えたら止めるかを決めておかなければ、追加購入は戦略ではなく感情の防衛になる。

市場は投資家が悔しいかどうかに関心がない。平均単価が下がったという事実も市場には重要ではない。重要なのは今のポジションがまだ良い判断かどうかだ。''',
    // Ch12
    '''市場には群衆の感情がある。最初は誰も信じない。少し上がると疑い、さらに上がると関心を持ち、大きく上がると確信する。そして最も遅く確信した人々が最も高い価格を支払うことが多い。

下落も同じだ。最初は一時的な調整だと言う。さらに下がると良い買い場だと言う。もっと下がると恐怖が広がり、最後はもはや耐えられない人たちが売り始める。その後に市場は底を打つこともある。

群衆を笑うのは簡単だ。しかし誰でも群衆の一部になれる。人は一人でいる時よりも一緒に興奮している時に、より簡単に判断を失う。みんなが同じことを言う時、その言葉はより説得力を持って聞こえる。

投資家は市場の雰囲気を見ながらも、雰囲気に流されてはならない。多数が間違っているという意味ではない。ただ、多数の確信があまりにも熱くなる時、リスクも一緒に熱くなり得るという事実を覚えておくべきだ。''',
    // Ch13
    '''レバレッジは利益と損失だけを拡大するのではない。人の心も拡大する。小さな上昇が大きな喜びになり、小さな下落が大きな恐怖になる。

私は大きなポジションを持っている時、人がいかに簡単に変わるかを見た。普段なら冷静に見られる揺れも耐えがたくなる。少しの反発に安堵し、少しの下落に不安になる。結局投資家は市場ではなく、自分の感情と戦うことになる。

レバレッジを使う人に最も必要なのは大胆さよりも規律だ。いつ減らすか、いつ止めるか、どの程度の損失に耐えられるかをあらかじめ決めておかなければ、レバレッジは人を素早く追い詰める。

大きなお金を稼ぎたい気持ちは理解できる。しかし市場は欲張りな人に特別親切ではない。むしろ欲張りな人ほど、小さな揺れにも大きく揺さぶられるようになる。''',
    // Ch14
    '''良い機会を待つことは思ったよりも苦痛だ。人は目の前で価格が動くと、何かしなければならないというプレッシャーを感じる。何もしない時間は遅れをとっているように感じられ、他の人がお金を稼いでいるという話は心をより焦らせる。

しかし市場で待つことは空白の時間ではない。待つことは判断を大切にする時間であり、お金を守る時間であり、次の行動の質を高める時間だ。いつでも入る人は常に出る理由を探さなければならない。待った人は入る前から理由が明確だ。

確信の弱いポジションは小さな揺れにも心が揺れる。結局良い取引は良い待機から始まる。

待つことが難しい理由は結果がすぐに見えないからだ。しかし市場では見えない準備が見える利益を生む。待てる人はすべての日を自分の日にしようとはしない。''',
    // Ch15
    '''損失を出した後にすぐに取り返したいという気持ちは強い。人は失ったお金を数字だけでは見ない。プライド、悔しさ、怒りが一緒についてくる。だから損失後の取引は危険だ。

私は復讐取引の危険をよく知っている。たった今失ったから、もっと大きく賭けたくなる。今度は当てなければならないと思う。しかし市場は自分が損失を出したことを知らず、知っていても気にしない。

損失の後は休むべきだ。少なくとも心が再び市場を見られるまでは待つべきだ。損失を取り返す最良の方法は、すぐにより大きな取引をすることではなく、次により良い判断をすることだ。

復讐心は市場で最も高価な感情の一つだ。怒りは方向を見えなくし、焦りは規模を大きくさせ、悔しさは損切りを遅らせる。市場はこういった感情を持つ人からゆっくりとお金を取っていく。''',
    // Ch16
    '''記憶は投資家にとって信頼できるツールではない。人は当たった取引をより鮮明に記憶し、外れた取引はそれなりの理由があったと包む。時間が経つと失敗は薄れ、成功は大きくなる。

だから記録が必要だ。なぜ買ったか、どんなシグナルを見たか、どこで間違いを認めるか、実際にどう行動したかを書き留めておくと、自分自身を欺くことが難しくなる。市場で最も手強い相手は時に市場ではなく、自己合理化だ。

記録は単なる日誌ではない。記録は繰り返されるミスを見せる。ある人は常に早く買いすぎる。ある人は常に遅く売る。ある人は損失の後に無理をする。記録がなければこういった習慣は性格のように感じられ、修正が難しい。

市場を学ぶことは結局自分を学ぶことだとわかった。数字は外にあるが、ミスの根は内にある。記録はその根を見せてくれる。''',
    // Ch17
    '''市場は毎日揺れる。その揺れをすべて意味のあるシグナルとして受け取ると、投資家はすぐに疲れる。ある動きは重要な変化の始まりだが、ある動きはただ一日のノイズに過ぎない。

大きな流れを見る人は小さな揺れに翻弄されにくい。しかし大きな流れを口実に明らかな危険シグナルを無視してはならない。投資家は耐えるべき調整と避けるべき転換を区別しなければならない。

この区別は一度で学べない。チャートを長く見ても自動的に身につくわけでもない。重要なのはあらかじめ基準を立てることだ。どんな条件が維持されれば耐えるか、どんな条件が崩れれば出るかを決めておく必要がある。

基準のない人は毎日揺れる。基準のある人も揺れるが、戻る場所がある。その差が長く耐える力になる。''',
    // Ch18
    '''人々は損失取引だけを振り返ろうとする。しかし成功した取引も再び見なければならない。お金を稼いだからといって、判断がすべて正しかったわけではない。運が良かっただけかもしれないし、リスクを過剰に取ったのに結果だけが良かっただけかもしれない。

成功した取引を検討しないと、危険な習慣が強化される。無理に入ったのにお金を稼いだら、次もそうしても良いと思う。市場は時に間違った行動に報いるが、それがより大きな危険を生む。

良い投資家は結果と過程を共に見る。お金を稼いだかどうかも重要だが、その過程が繰り返し可能かどうかがより重要だ。繰り返せない利益は実力ではなく出来事に近い。

損失の前だけでなく、利益の前でも自分に厳しくあるべきだ。そうすることで利益が自慢に変わらない。''',
    // Ch19
    '''市場にはかつて大きく稼いだ人が多い。しかし長く生き残った人はずっと少ない。大きな利益は人々の目によく見えるが、長く耐える能力は静かで目立たない。しかし結局市場で最も重要なのは生存だ。

生き残る人は自分がいつ弱くなるかを知っている。どんな状況で焦るか、どんな損失に耐えられないか、どんな噂に揺れるかを知っている。彼は市場だけでなく、自分自身も研究する。

また生き残る人は機会がない時に無理に機会を作らない。市場が不明確な時は待ち、損失が大きくなれば減らし、大きく当たった時も再びルールに戻る。彼は一度の取引で人生を変えようとはしない。

この本が長く読まれる理由は、市場の技術より人間の弱点をより正確に示しているからだ。時代が変わり道具が変わっても、貪欲と恐怖とプライドはあまり変わらない。''',
    // Ch20
    '''私は市場で数多くのことを学んだ。価格は言葉より正直で、損失は早く認めるほど小さくなり、大きなお金は焦った手よりも待てる心に多く来る。しかしこれらすべての教訓は、知っているだけでは不十分だ。実際にお金が賭かっている時に守れなければならない。

投資家は常に二つの戦いをする。一つは市場との戦いで、もう一つは自分自身との戦いだ。市場との戦いでは勝つこともあれば負けることもある。しかし自分自身との戦いに負け続けると、市場で長く耐えられない。

良い判断は華やかではない。良い判断は時に退屈で、時に答えが見えず、時に何もしない姿で現れる。しかしそういった判断が口座を守り、次の機会を可能にする。

市場は明日も開く。この単純な事実を忘れない人は、今日すべてを賭けない。今日生き残ってこそ明日の機会を見られる。それがこの古い本が今も投資家に残す最も重要な言葉だ。''',
  ];

  static List<_BookChapter> _withJaTitles() {
    const titles = [
      '原書紹介',
      '1. 相場板の前の少年',
      '2. 初めて学んだ勝利',
      '3. 市場は説明を待ってくれない',
      '4. 素早く当てることと大きく稼ぐことは違う',
      '5. 間違えた時に小さくなる技術',
      '6. 噂は人を動かし、価格はお金を動かす',
      '7. トレンドが始まる時の静けさ',
      '8. 知りすぎた人の罠',
      '9. 稼いだ後がより危険な理由',
      '10. 休むこともポジションだ',
      '11. ナンピンが危険になる瞬間',
      '12. 群衆はいつも遅く確信する',
      '13. レバレッジは心を拡大する',
      '14. 待つことは苦痛だ',
      '15. 市場は復讐を許さない',
      '16. 良い判断は記録から生まれる',
      '17. 大きな流れと小さなノイズ',
      '18. 成功した取引も再び検討しなければならない',
      '19. 市場で生き残る人',
      '20. 最後のページ',
    ];
    return List.generate(
      _japaneseBodies.length,
      (i) => _BookChapter(title: titles[i], body: _japaneseBodies[i]),
    );
  }

  // ── Spanish ───────────────────────────────────────────────────────────────

  static const _spanishBodies = <String>[
    // Ch0
    '''Memorias de un operador de bolsa
Edwin Lefevre

Esta edición sigue el flujo del clásico en inglés y lo presenta en un formato de lectura extendida. No es una traducción literal palabra por palabra, sino una edición narrativa que permite al lector avanzar por la historia y sus lecciones página a página.

La historia comienza con un chico que trabaja cerca de un tablero de cotizaciones y queda fascinado por el movimiento de los precios. Observa cómo los adultos cambian de expresión ante unos pocos puntos de variación. Antes de entender el lenguaje de las finanzas, comprende que los precios hablan a su manera.

Este libro no trata solo de ganar dinero. Trata del juicio, la disciplina, el miedo, la codicia y el extraño hábito que tienen las personas de ignorar al mercado cuando no está de acuerdo con ellas. El operador gana, pierde, resurge y aprende que el mercado es un maestro severo.''',
    // Ch1
    '''Era muy joven cuando empecé a observar los movimientos de los precios. La oficina tenía un tablero donde se escribían las cotizaciones, y los hombres entraban con esperanzas, miedos y opiniones. Un pequeño cambio de precio podía iluminar un rostro y oscurecer otro. No sabía mucho sobre empresas entonces, pero sabía que los números podían dominar a los hombres.

Al principio era solo un chico haciendo un trabajo. Anotaba los precios según llegaban y los copiaba donde otros pudieran verlos. Pero después de hacer lo mismo día tras día, comencé a notar que los precios tenían hábitos. No se movían exactamente como los hombres decían que deberían. A veces subían antes de que se conociera la razón, y a veces caían mientras todos todavía tenían explicaciones de por qué deberían subir.

Me interesé menos por lo que la gente decía y más por lo que hacían los precios. Hablar era fácil. Comprar y vender con dinero real era diferente. La cinta parecía contar una historia antes de que la multitud entendiera el argumento.

Lo que comenzó como la curiosidad de un chico se convirtió lentamente en el centro de mi vida. Quería saber cuándo un precio estaba listo para moverse, cuándo un movimiento era falso y cuándo la multitud llegaba tarde.''',
    // Ch2
    '''Cuando arriesgué dinero por primera vez, no me consideraba un gran operador. Simplemente creía que había observado el tablero el tiempo suficiente para ver cosas que otros no veían.

El éxito temprano es peligroso. Cuando un hombre gana dinero, se siente tentado a creer que ese dinero es prueba de sabiduría. Yo no era diferente. Unos pocos operaciones correctas me dieron confianza, y la confianza pronto se convirtió en el deseo de operar más grande.

Al principio el mercado parecía generoso. Tenía razón con suficiente frecuencia para creer que el juego era simple. Pero el mercado no permanece amable con un hombre que se vuelve descuidado. Lo deja ganar lo suficiente para volverse audaz, y luego le cobra por confundir la audacia con la habilidad.

Aprendí más tarde que las lecciones más caras suelen ser las que creíamos que ya habíamos aprendido. Conocer una regla es fácil. Obedecerla mientras hay dinero en riesgo es la prueba real.''',
    // Ch3
    '''A la gente le gusta explicar los movimientos de precios después de que ocurren. Si una acción sube, encuentran una razón favorable. Si cae, descubren un mal rumor. Pero los precios a menudo se mueven antes de que llegue la explicación.

No tenía miedo de operar sin una explicación perfecta. Tenía más miedo de ignorar un movimiento claro porque no estaba de acuerdo con mi opinión. El mercado no se explica con cortesía. Se mueve, y el operador debe decidir si escuchar.

Los principiantes a menudo operan opiniones. Compran porque una empresa es buena, porque una acción ha caído mucho, o porque se dice que alguien importante está comprando. Pero el mercado no paga a un hombre por tener una opinión. Le paga por estar en la posición correcta en el momento correcto.

Aprendí a escuchar menos las palabras y más las acciones. Las palabras podían ser ruidosas, pero el dinero era más silencioso y decisivo.''',
    // Ch4
    '''Era bueno captando pequeños movimientos. Unos pocos puntos arriba o abajo a menudo me parecían claros antes de que otros lo vieran. Pero captar pequeños movimientos y obtener grandes ganancias no son lo mismo.

Un hombre que opera cada pequeño giro se vuelve ocupado. Compra, vende, toma una ganancia y comienza de nuevo. Puede parecer hábil, pero si trata una gran tendencia como una pequeña fluctuación, dejará el dinero más grande sobre la mesa.

El gran dinero no se hizo con acción constante. Se hizo sentándose con una posición correcta mientras el mercado la llevaba lo suficientemente lejos.

Tuve razón muchas veces y aun así no gané lo que debería haber ganado. Vendí demasiado pronto. Con el tiempo aprendí que tener razón es solo el comienzo. Mantener correctamente es el arte más difícil.''',
    // Ch5
    '''Todo operador se equivoca. La diferencia entre la supervivencia y la ruina es lo que hace después de equivocarse. Una pequeña pérdida es la advertencia silenciosa del mercado. Si se ignora, la advertencia se vuelve más ruidosa y más cara.

Amplié pérdidas muchas veces. Al principio me decía que el precio volvería. Luego me decía que sería tonto vender después de tal caída. Finalmente la pérdida se volvió tan grande que ya no observaba el mercado con claridad.

Reducir una pérdida parece una técnica fría, pero en realidad es disciplina emocional. Un hombre debe renunciar al orgullo, admitir el error y abandonar una idea que poco antes parecía segura.

Una pequeña pérdida es el precio de seguir en el juego. Una pérdida grande puede quitar la capacidad de jugar la siguiente mano. Por eso la primera pérdida suele ser la mejor pérdida.''',
    // Ch6
    '''Wall Street siempre ha estado lleno de rumores. Una empresa está mejorando, un grupo está comprando, viene un anuncio, un hombre importante sabe algo. A la gente le encantan esas historias porque hacen que la incertidumbre parezca manejable.

Pero una posición entrada con la palabra de otro hombre es débil. Si surge un problema, el operador espera la tranquilidad de otro hombre en lugar de leer el mercado.

La información tiene valor, pero no debe reemplazar el juicio. Un rumor puede ser razón para investigar, pero no razón para renunciar a la responsabilidad.

Un hombre puede ganar dinero por accidente con el consejo de otro. Conservar ese dinero es otro asunto. Si no sabe por qué entró, no sabrá cuándo salir.''',
    // Ch7
    '''Los grandes movimientos no siempre comienzan con ruido. A menudo comienzan en silencio. La multitud es incierta, las noticias están incompletas, y el precio comienza a inclinarse en una dirección con creciente persistencia.

Observaba no solo el precio sino el comportamiento del precio. ¿Se recuperaba después de una caída? ¿Aparecían compradores cuando debería haber continuado la debilidad? Tales señales a menudo aparecían antes que las explicaciones.

Seguir una tendencia requiere valentía, pero no valentía ciega. Requiere la paciencia de esperar evidencia y la valentía de actuar cuando la evidencia es suficiente.

La operación por tendencia no es el arte de predecir el futuro. Es el arte de reconocer hacia dónde el mercado ya ha comenzado a ir.''',
    // Ch8
    '''Hay muchas personas inteligentes en el mercado. Algunas entienden los balances, algunas entienden la economía, algunas conocen profundamente una industria. Pero el conocimiento solo no garantiza ganancias.

El peligro es que el conocimiento puede hacer a un hombre terco. Si sabe demasiado sobre una empresa, puede explicar un precio que cae porque cree que el mercado no ha apreciado lo que él sabe. Cree que está defendiendo hechos, pero a menudo está defendiendo su conclusión.

La humildad no es ignorancia. La humildad es la capacidad de decir, incluso después de un estudio cuidadoso, que el mercado puede estar mostrando algo que no he visto.

Cuando el precio se mueve contra una idea, la pregunta no es si el mercado me ha insultado. La pregunta es si la razón de la posición todavía existe.''',
    // Ch9
    '''Después de una pérdida, muchos hombres se vuelven cuidadosos. Después de una gran ganancia, muchos se vuelven peligrosos. La ganancia puede hacer que un hombre crea que el mercado ha confirmado su superioridad.

Conocía ese sentimiento. Después de ganar dinero, el mismo tamaño de posición parecía demasiado pequeño. El éxito pasado parecía prometer seguridad futura, aunque el mercado no hace tal promesa.

El mayor peligro después de la ganancia es el aflojamiento de las reglas. Un hombre entra antes de lo que debería, mantiene una pérdida más de lo planeado e ignora señales que antes habría respetado.

Después de una gran victoria, el operador debe volverse pequeño de nuevo en su propia mente. Debe regresar a las reglas antes de que la ganancia se convierta en orgullo.''',
    // Ch10
    '''Muchos operadores piensan que quedarse fuera del mercado es tiempo perdido. No lo es. El efectivo es una posición. Le da a un hombre el derecho de actuar cuando aparece una oportunidad real.

El mercado se mueve todos los días, y el movimiento tienta a los hombres a participar. Pero no todo movimiento es una oportunidad. Algunos movimientos son solo ruido.

El buen especulador no es el hombre que siempre está ocupado. Es el hombre que sabe cuándo se requiere acción y cuándo la inacción es más sabia.

Perdí dinero muchas veces porque no podía descansar. Pensaba que el mercado me estaba llamando, pero a menudo era yo quien se aferraba al mercado.''',
    // Ch11
    '''Cuando un precio cae, comprar más reduce el costo promedio. La aritmética es simple, y esa simplicidad consuela a la gente. Pero la aritmética simple no siempre es buen juicio.

Un precio que cae puede estar cayendo por una razón. Si un hombre compra más sin entender si el juicio original sigue siendo válido, puede estar aumentando un error.

Promediar a la baja no siempre está mal, pero promediar a la baja sin planificación es peligroso. Si el operador no decidió de antemano dónde agregar, cuánto agregar y dónde detenerse, la compra adicional suele ser defensa emocional.

El mercado no le importa si el costo promedio de un hombre ha mejorado. Solo le importan la oferta, la demanda, el miedo, la codicia y el dinero.''',
    // Ch12
    '''Al principio la multitud duda de un movimiento. Luego lo nota. Luego lo cree. Finalmente se convence, y a menudo la última convicción llega al precio más alto.

Las caídas funcionan de la misma manera. Al principio la caída se llama temporal. Luego se llama oportunidad. Más tarde se vuelve aterradora. Al final, los que ya no pueden soportar el miedo venden desesperados.

Es fácil reírse de la multitud, pero cualquier operador puede convertirse en parte de ella. Un hombre piensa peor cuando está emocionado con otros.

El operador debe observar el estado de ánimo de la multitud sin convertirse en su sirviente. Cuando la certeza se vuelve demasiado caliente, el riesgo a menudo se calienta con ella.''',
    // Ch13
    '''El apalancamiento no solo amplía las ganancias y las pérdidas. También amplía las emociones. Una pequeña subida se convierte en gran alegría. Una pequeña caída se convierte en gran miedo.

Con una posición grande, la fluctuación ordinaria se vuelve difícil de soportar. El operador deja de leer el mercado y comienza a leer su propia ansiedad.

El operador apalancado necesita disciplina más que valentía. Debe saber cuándo reducir, cuándo detenerse y cuánto dolor puede permitirse antes de comenzar la operación.

El deseo de ganar mucho dinero es comprensible. Pero el mercado no es más amable con el gran deseo. A menudo usa ese deseo para hacer que un hombre se quede demasiado tiempo, opere en exceso y asuma demasiado riesgo.''',
    // Ch14
    '''Esperar una buena oportunidad es doloroso. Cuando los precios se mueven, un hombre siente que debería estar haciendo algo. No hacer nada puede sentirse como quedarse atrás.

Pero esperar no es tiempo vacío. Preserva el juicio, el capital y la fortaleza emocional. Un hombre que entra casualmente debe buscar razones después. Un hombre que espera entra con razones ya formadas.

Perdí dinero porque no esperé. Una posición que solo es casi correcta puede volverse muy incómoda. La convicción débil no puede sobrevivir al ruido ordinario del mercado.

La buena operación comienza antes de la operación. Comienza en la espera.''',
    // Ch15
    '''Después de una pérdida, el deseo de recuperarse rápidamente es fuerte. El dinero perdido lleva consigo orgullo, ira y humillación. Eso hace peligrosa la siguiente operación.

La operación de venganza no es realmente operar el mercado. Es operar la propia herida. El hombre aumenta el tamaño porque quiere alivio, no porque la oportunidad sea mejor.

El mercado no sabe que un operador acaba de perder dinero, y si lo supiera, no le importaría.

Después de una pérdida, la mejor primera acción suele ser descansar. El dinero no se recuperará con la ira. Se recuperará, si acaso, con mejor juicio más adelante.''',
    // Ch16
    '''La memoria no es confiable en la especulación. Un hombre recuerda sus éxitos claramente y explica sus errores. Con el tiempo, los errores se vuelven razonables y las victorias se vuelven más grandes en la imaginación.

Los registros hacen más difícil el autoengaño. ¿Por qué entré? ¿Qué vi? ¿Dónde debería haber admitido el error? Las respuestas escritas revelan patrones que la memoria oculta.

Un hombre siempre compra demasiado temprano. Otro vende demasiado tarde. Otro se vuelve imprudente después de una pérdida. Sin registros, estos hábitos se sienten como personalidad. Con registros se vuelven visibles.

Aprender el mercado también es aprenderse a uno mismo. Los números están afuera, pero muchos errores comienzan adentro.''',
    // Ch17
    '''El mercado se agita todos los días. Si cada agitación se trata como una señal importante, el operador pronto se agota. Algunos movimientos importan. Otros son solo ruido.

El operador debe distinguir una reacción normal de un cambio de carácter. Esto es difícil. Mantener con demasiada terquedad y una reversión real se convierte en ruina. Reaccionar demasiado rápido y cada pequeña agitación lo saca.

La respuesta no es la emoción sino la preparación. Antes de que el mercado lo ponga a prueba, el operador debe decidir qué condiciones lo mantienen dentro y qué condiciones lo sacan.

Un hombre sin estándares es movido por cada precio. Un hombre con estándares puede seguir sintiendo miedo, pero tiene un lugar al que regresar.''',
    // Ch18
    '''Muchos operadores revisan solo sus pérdidas. Pero las operaciones ganadoras también deben examinarse. Una ganancia no prueba que el proceso fue sólido.

A veces un hombre gana dinero después de asumir un riesgo tonto. Si no revisa la operación, la ganancia le enseña la lección equivocada. El mercado ocasionalmente recompensa el mal comportamiento, y esa recompensa puede ser peligrosa.

La pregunta no es solo si se ganó dinero. La pregunta es si la decisión puede repetirse sin depender de la suerte.

Un operador debe ser estricto con las ganancias al igual que con las pérdidas. De lo contrario, la ganancia se convierte en la semilla del descuido futuro.''',
    // Ch19
    '''Hay muchas personas que alguna vez ganaron mucho dinero en el mercado. Hay menos que sobrevivieron durante mucho tiempo. Las grandes ganancias son visibles. La supervivencia es más silenciosa.

El superviviente conoce sus debilidades. Sabe cuándo se vuelve impaciente, qué tipo de pérdida lo perturba y qué historias lo tientan. Se estudia a sí mismo tanto como estudia los precios.

No fuerza la oportunidad cuando no existe. Espera cuando el mercado no está claro, reduce cuando la operación está mal, y regresa a las reglas después de victorias y pérdidas.

Por eso el libro sigue vivo. No trata solo de los mercados de antaño. Trata de la naturaleza humana en los mercados, y la naturaleza humana no ha cambiado mucho.''',
    // Ch20
    '''El mercado me enseñó muchas cosas. El precio es más honesto que las palabras. Las pérdidas son mejores cuando son pequeñas. Las grandes ganancias vienen con menos frecuencia de las manos inquietas que del juicio paciente.

Pero conocer estas cosas no es suficiente. Deben obedecerse cuando hay dinero en riesgo. Ahí es donde fallan la mayoría de los hombres.

El operador libra dos batallas. Una es con el mercado. La otra es consigo mismo. Puede perder ante el mercado y recuperarse. Si pierde continuamente ante sí mismo, no durará.

El mercado abrirá mañana otra vez. El hombre que recuerda esto no necesita arriesgar todo hoy. Sobrevivir hoy es conservar el derecho de encontrar la oportunidad de mañana.''',
  ];

  static List<_BookChapter> _withEsTitles() {
    const titles = [
      'Introducción a la obra',
      '1. El chico ante el tablero de cotizaciones',
      '2. El primer sabor de la victoria',
      '3. El mercado no espera explicaciones',
      '4. Acertar rápido no es lo mismo que ganar mucho',
      '5. El arte de hacerse pequeño cuando uno se equivoca',
      '6. Los rumores mueven personas, los precios mueven dinero',
      '7. El silencioso inicio de una tendencia',
      '8. La trampa de saber demasiado',
      '9. Por qué las ganancias pueden hacer a un hombre más peligroso',
      '10. El descanso también es una posición',
      '11. El peligro de promediar a la baja',
      '12. La multitud se convence siempre tarde',
      '13. El apalancamiento también amplía la mente',
      '14. Esperar es doloroso',
      '15. El mercado no permite la venganza',
      '16. El buen juicio viene de los registros',
      '17. El movimiento principal y el ruido',
      '18. Las operaciones exitosas también deben revisarse',
      '19. El hombre que sobrevive',
      '20. Página final',
    ];
    return List.generate(
      _spanishBodies.length,
      (i) => _BookChapter(title: titles[i], body: _spanishBodies[i]),
    );
  }

  // ── Portuguese ────────────────────────────────────────────────────────────

  static const _portugueseBodies = <String>[
    // Ch0
    '''Memórias de um operador da bolsa
Edwin Lefevre

Esta edição segue o fluxo do clássico em inglês e o apresenta em formato de leitura estendida. Não é uma tradução literal palavra por palavra, mas uma edição narrativa que permite ao leitor avançar pela história e suas lições página a página.

A história começa com um garoto que trabalha perto de um quadro de cotações e fica fascinado pelo movimento dos preços. Ele observa como os adultos mudam de expressão com apenas alguns pontos de variação. Antes de entender a linguagem das finanças, ele entende que os preços falam à sua maneira.

Este livro não é apenas sobre ganhar dinheiro. É sobre julgamento, disciplina, medo, ganância e o estranho hábito que as pessoas têm de ignorar o mercado quando ele discorda delas. O operador ganha, perde, resurge e aprende que o mercado é um mestre severo.''',
    // Ch1
    '''Era muito jovem quando comecei a observar os movimentos dos preços. O escritório tinha um quadro onde as cotações eram escritas, e os homens entravam com esperanças, medos e opiniões. Uma pequena mudança de preço podia iluminar um rosto e escurecer outro.

No começo eu era apenas um garoto fazendo um trabalho. Anotava os preços à medida que chegavam. Mas depois de fazer a mesma coisa dia após dia, comecei a notar que os preços tinham hábitos. Eles não se moviam exatamente como os homens diziam que deveriam. Às vezes subiam antes que a razão fosse conhecida, e às vezes caíam enquanto todos ainda tinham explicações para o motivo de deverem subir.

Tornei-me menos interessado no que as pessoas diziam e mais interessado no que os preços faziam. Falar era fácil. Comprar e vender com dinheiro real era diferente.

O que começou como a curiosidade de um garoto lentamente se tornou o centro da minha vida. Queria saber quando um preço estava pronto para se mover, quando um movimento era falso e quando a multidão chegava tarde.''',
    // Ch2
    '''Quando arrisquei dinheiro pela primeira vez, não me considerava um grande operador. Simplesmente acreditava que tinha observado o quadro tempo suficiente para ver coisas que outros perdiam.

O sucesso inicial é perigoso. Quando um homem ganha dinheiro, fica tentado a acreditar que esse dinheiro é prova de sabedoria. Eu não era diferente. Algumas operações corretas me deram confiança, e a confiança logo se tornou o desejo de operar maiores volumes.

No início o mercado pareceu generoso. Mas o mercado não permanece gentil com um homem que se torna descuidado. Ele o deixa ganhar o suficiente para se tornar audacioso, e então o cobra por confundir audácia com habilidade.

Aprendi mais tarde que as lições mais caras costumam ser as que pensávamos já ter aprendido. Conhecer uma regra é fácil. Obedecê-la enquanto há dinheiro em risco é o teste real.''',
    // Ch3
    '''As pessoas gostam de explicar os movimentos de preços depois que acontecem. Se uma ação sobe, encontram uma razão favorável. Se cai, descobrem um mau rumor. Mas os preços frequentemente se movem antes que a explicação chegue.

Não tinha medo de operar sem uma explicação perfeita. Tinha mais medo de ignorar um movimento claro porque não concordava com minha opinião. O mercado não se explica com cortesia. Ele se move, e o operador deve decidir se vai ouvir.

Os iniciantes frequentemente operam opiniões. Eles compram porque uma empresa é boa, porque uma ação caiu muito, ou porque se diz que alguém importante está comprando. Mas o mercado não paga um homem por ter uma opinião. Ele paga por estar na posição certa na hora certa.

Aprendi a ouvir menos as palavras e mais as ações. As palavras podiam ser barulhentas, mas o dinheiro era mais silencioso e decisivo.''',
    // Ch4
    '''Era bom em captar pequenos movimentos. Mas captar pequenos movimentos e obter grandes lucros não são a mesma coisa.

Um homem que opera cada pequena virada fica ocupado. Ele compra, vende, tira um lucro e começa de novo. Pode parecer habilidoso, mas se tratar uma grande tendência como uma pequena flutuação, deixará o maior dinheiro na mesa.

O grande dinheiro não foi feito com ação constante. Foi feito sentando com uma posição correta enquanto o mercado a carregava longe o suficiente.

Tive razão muitas vezes e ainda assim não ganhei o que deveria ter ganhado. Vendi cedo demais. Com o tempo aprendi que ter razão é apenas o começo. Manter corretamente é a arte mais difícil.''',
    // Ch5
    '''Todo operador está errado em algum momento. A diferença entre a sobrevivência e a ruína é o que ele faz depois de estar errado. Uma pequena perda é o aviso silencioso do mercado. Se ignorado, o aviso fica mais alto e mais caro.

Amplifiquei perdas muitas vezes. No início me dizia que o preço voltaria. Depois me dizia que seria tolo vender após tal queda. Por fim a perda ficou tão grande que não observava mais o mercado com clareza.

Cortar uma perda parece uma técnica fria, mas é realmente disciplina emocional. Um homem deve abrir mão do orgulho, admitir o erro e abandonar uma ideia que pouco antes parecia certa.

Uma pequena perda é o preço de ficar no jogo. Uma grande perda pode tirar a capacidade de jogar a próxima mão. Por isso a primeira perda costuma ser a melhor perda.''',
    // Ch6
    '''Wall Street sempre esteve cheia de rumores. Uma empresa está melhorando, um grupo está comprando, vem um anúncio, um homem importante sabe algo. As pessoas adoram essas histórias porque fazem a incerteza parecer gerenciável.

Mas uma posição entrada com a palavra de outro homem é fraca. Se surgir um problema, o operador espera o consolo de outro homem em vez de ler o mercado.

A informação tem valor, mas não deve substituir o julgamento. Um rumor pode ser razão para investigar, mas não é razão para abrir mão da responsabilidade.

Um homem pode ganhar dinheiro por acidente com a dica de outro. Manter esse dinheiro é outra questão. Se não sabe por que entrou, não saberá quando sair.''',
    // Ch7
    '''Os grandes movimentos nem sempre começam com barulho. Frequentemente começam em silêncio. A multidão está incerta, as notícias estão incompletas, e o preço começa a se inclinar em uma direção com crescente persistência.

Observava não apenas o preço, mas o comportamento do preço. Ele se recuperava após uma queda? Apareciam compradores quando a fraqueza deveria ter continuado? Tais sinais frequentemente apareciam antes das explicações.

Seguir uma tendência requer coragem, mas não coragem cega. Requer a paciência de esperar por evidências e a coragem de agir quando a evidência é suficiente.

A operação por tendência não é a arte de prever o futuro. É a arte de reconhecer para onde o mercado já começou a ir.''',
    // Ch8
    '''Há muitas pessoas inteligentes no mercado. Algumas entendem balanços, algumas entendem economia, algumas conhecem profundamente um setor. Mas o conhecimento sozinho não garante lucros.

O perigo é que o conhecimento pode tornar um homem teimoso. Se ele sabe demais sobre uma empresa, pode explicar um preço que cai porque acredita que o mercado falhou em apreciar o que ele sabe.

A humildade não é ignorância. A humildade é a capacidade de dizer, mesmo após um estudo cuidadoso, que o mercado pode estar mostrando algo que não vi.

Quando o preço se move contra uma ideia, a pergunta não é se o mercado me insultou. A pergunta é se a razão da posição ainda existe.''',
    // Ch9
    '''Após uma perda, muitos homens se tornam cuidadosos. Após um grande lucro, muitos se tornam perigosos. O lucro pode fazer um homem acreditar que o mercado confirmou sua superioridade.

Conhecia esse sentimento. Após ganhar dinheiro, o mesmo tamanho de posição parecia pequeno demais. O sucesso passado parecia prometer segurança futura, embora o mercado não faça tal promessa.

O maior perigo após o lucro é o afrouxamento das regras. Um homem entra antes do que deveria, mantém uma perda por mais tempo do que planejou e ignora sinais que antes teria respeitado.

Após uma grande vitória, o operador deve se tornar pequeno novamente em sua própria mente. Deve retornar às regras antes que o lucro se torne orgulho.''',
    // Ch10
    '''Muitos operadores pensam que ficar fora do mercado é tempo desperdiçado. Não é. O dinheiro em caixa é uma posição. Dá a um homem o direito de agir quando aparece uma oportunidade real.

O mercado se move todos os dias, e o movimento tenta os homens a participar. Mas nem todo movimento é uma oportunidade. Alguns movimentos são apenas ruído.

O bom especulador não é o homem que está sempre ocupado. É o homem que sabe quando a ação é necessária e quando a inação é mais sábia.

Perdi dinheiro muitas vezes porque não conseguia descansar. Pensava que o mercado estava me chamando, mas frequentemente era eu quem estava se agarrando ao mercado.''',
    // Ch11
    '''Quando um preço cai, comprar mais reduz o custo médio. A aritmética é simples, e essa simplicidade conforta as pessoas. Mas aritmética simples nem sempre é bom julgamento.

Um preço que cai pode estar caindo por uma razão. Se um homem compra mais sem entender se o julgamento original ainda é válido, pode estar aumentando um erro.

Fazer média para baixo nem sempre está errado, mas fazer média para baixo sem planejamento é perigoso. Se o operador não decidiu com antecedência onde adicionar, quanto adicionar e onde parar, a compra adicional costuma ser defesa emocional.

O mercado não se importa se o custo médio de um homem melhorou. Importa apenas com oferta, demanda, medo, ganância e dinheiro.''',
    // Ch12
    '''No início a multidão duvida de um movimento. Depois percebe. Depois acredita. Finalmente se convence, e frequentemente a última convicção vem ao preço mais alto.

As quedas funcionam da mesma forma. No início a queda é chamada de temporária. Depois é chamada de oportunidade. Mais tarde fica assustadora. No final, os que não aguentam mais o medo vendem em desespero.

É fácil rir da multidão, mas qualquer operador pode se tornar parte dela. Um homem pensa pior quando está animado com os outros.

O operador deve observar o humor da multidão sem se tornar seu servo. Quando a certeza fica quente demais, o risco frequentemente fica quente com ela.''',
    // Ch13
    '''A alavancagem não apenas amplia os lucros e as perdas. Também amplia as emoções. Uma pequena alta se torna grande alegria. Uma pequena queda se torna grande medo.

Com uma posição grande, a flutuação ordinária se torna difícil de suportar. O operador para de ler o mercado e começa a ler sua própria ansiedade.

O operador alavancado precisa de disciplina mais do que coragem. Ele deve saber quando reduzir, quando parar e quanta dor pode suportar antes de começar a operação.

O desejo de ganhar muito dinheiro é compreensível. Mas o mercado não é mais gentil com o grande desejo. Frequentemente usa esse desejo para fazer um homem ficar tempo demais, operar em excesso e assumir risco demais.''',
    // Ch14
    '''Esperar uma boa oportunidade é doloroso. Quando os preços se movem, um homem sente que deveria estar fazendo algo. Não fazer nada pode parecer ficar para trás.

Mas esperar não é tempo vazio. Preserva o julgamento, o capital e a força emocional. Um homem que entra casualmente deve procurar razões depois. Um homem que espera entra com razões já formadas.

Perdi dinheiro porque não esperei. Uma posição que é apenas quase certa pode se tornar muito desconfortável. A convicção fraca não consegue sobreviver ao ruído ordinário do mercado.

A boa operação começa antes da operação. Começa na espera.''',
    // Ch15
    '''Após uma perda, o desejo de recuperar rapidamente é forte. O dinheiro perdido carrega consigo orgulho, raiva e humilhação. Isso torna a próxima operação perigosa.

A operação de vingança não é realmente operar o mercado. É operar a própria ferida. O homem aumenta o tamanho porque quer alívio, não porque a oportunidade é melhor.

O mercado não sabe que um operador acabou de perder dinheiro, e se soubesse, não se importaria.

Após uma perda, a melhor primeira ação costuma ser descansar. O dinheiro não será recuperado pela raiva. Será recuperado, se for o caso, com melhor julgamento mais tarde.''',
    // Ch16
    '''A memória não é confiável na especulação. Um homem se lembra de seus sucessos claramente e explica seus erros. Com o tempo, os erros se tornam razoáveis e as vitórias ficam maiores na imaginação.

Os registros dificultam a autoenganação. Por que entrei? O que vi? Onde deveria ter admitido o erro? As respostas escritas revelam padrões que a memória esconde.

Um homem sempre compra cedo demais. Outro vende tarde demais. Outro se torna imprudente após uma perda. Sem registros, esses hábitos parecem personalidade. Com registros, tornam-se visíveis.

Aprender o mercado também é aprender a si mesmo. Os números estão fora, mas muitos erros começam dentro.''',
    // Ch17
    '''O mercado treme todos os dias. Se cada tremor for tratado como um sinal importante, o operador logo fica exausto. Alguns movimentos importam. Outros são apenas ruído.

O operador deve distinguir uma reação normal de uma mudança de caráter. Isso é difícil. Manter com teimosia demais e uma reversão real se torna ruína. Reagir rápido demais e cada pequeno tremor o joga fora.

A resposta não é emoção, mas preparação. Antes de o mercado testá-lo, o operador deve decidir quais condições o mantêm dentro e quais o tiram.

Um homem sem padrões é movido por cada preço. Um homem com padrões ainda pode sentir medo, mas tem um lugar para onde retornar.''',
    // Ch18
    '''Muitos operadores revisam apenas suas perdas. Mas as operações vencedoras também devem ser examinadas. Um lucro não prova que o processo foi sólido.

Às vezes um homem ganha dinheiro após assumir um risco tolo. Se não revisar a operação, o lucro lhe ensina a lição errada. O mercado ocasionalmente recompensa o mau comportamento, e essa recompensa pode ser perigosa.

A pergunta não é apenas se o dinheiro foi ganho. A pergunta é se a decisão pode ser repetida sem depender da sorte.

Um operador deve ser rigoroso com os lucros assim como com as perdas. Caso contrário, o lucro se torna a semente do descuido futuro.''',
    // Ch19
    '''Há muitas pessoas que um dia ganharam muito dinheiro no mercado. Há menos que sobreviveram por muito tempo. Os grandes lucros são visíveis. A sobrevivência é mais silenciosa.

O sobrevivente conhece suas fraquezas. Sabe quando fica impaciente, que tipo de perda o perturba e quais histórias o tentam. Ele se estuda tanto quanto estuda os preços.

Ele não força a oportunidade quando não existe. Espera quando o mercado não está claro, reduz quando a operação está errada e retorna às regras após vitórias e perdas.

É por isso que o livro continua vivo. Não é apenas sobre mercados antigos. É sobre a natureza humana nos mercados, e a natureza humana não mudou muito.''',
    // Ch20
    '''O mercado me ensinou muitas coisas. O preço é mais honesto do que as palavras. As perdas são melhores quando são pequenas. Os grandes lucros vêm com menos frequência de mãos inquietas do que do julgamento paciente.

Mas conhecer essas coisas não é suficiente. Elas devem ser obedecidas quando há dinheiro em risco. É aí que a maioria dos homens falha.

O operador trava duas batalhas. Uma é com o mercado. A outra é consigo mesmo. Ele pode perder para o mercado e se recuperar. Se perder continuamente para si mesmo, não vai durar.

O mercado abrirá novamente amanhã. O homem que se lembra disso não precisa arriscar tudo hoje. Sobreviver hoje é manter o direito de encontrar a oportunidade de amanhã.''',
  ];

  static List<_BookChapter> _withPtTitles() {
    const titles = [
      'Introdução à obra',
      '1. O garoto diante do quadro de cotações',
      '2. O primeiro gosto da vitória',
      '3. O mercado não espera por explicações',
      '4. Acertar rápido não é o mesmo que ganhar muito',
      '5. A arte de se tornar pequeno quando se está errado',
      '6. Rumores movem pessoas, preços movem dinheiro',
      '7. O início silencioso de uma tendência',
      '8. A armadilha de saber demais',
      '9. Por que o lucro pode tornar um homem mais perigoso',
      '10. O descanso também é uma posição',
      '11. O perigo de fazer média para baixo',
      '12. A multidão se convence sempre tarde',
      '13. A alavancagem também amplia a mente',
      '14. Esperar é doloroso',
      '15. O mercado não permite a vingança',
      '16. O bom julgamento vem dos registros',
      '17. O movimento principal e o ruído',
      '18. As operações bem-sucedidas também devem ser revisadas',
      '19. O homem que sobrevive',
      '20. Página final',
    ];
    return List.generate(
      _portugueseBodies.length,
      (i) => _BookChapter(title: titles[i], body: _portugueseBodies[i]),
    );
  }

  // ── Russian ───────────────────────────────────────────────────────────────

  static const _russianBodies = <String>[
    // Ch0
    '''Воспоминания биржевого спекулянта
Эдвин Лефевр

Это издание следует сюжету английского классика и представлено в формате расширенного чтения. Это не дословный перевод, а нарративное издание, позволяющее читателю двигаться по истории и её урокам страница за страницей.

История начинается с мальчика, работающего у доски котировок и очарованного движением цен. Он наблюдает, как взрослые мужчины меняются в лице при небольших колебаниях. До того как он понял язык финансов, он понял, что цены говорят по-своему.

Эта книга не только о зарабатывании денег. Она о суждении, дисциплине, страхе, жадности и странной привычке людей игнорировать рынок, когда он с ними не согласен. Оператор выигрывает, проигрывает, снова поднимается и узнаёт, что рынок — суровый учитель.''',
    // Ch1
    '''Я был совсем молод, когда начал наблюдать за движением цен. В офисе была доска, где записывались котировки, и мужчины входили с надеждами, страхами и мнениями. Небольшое изменение цены могло осветить одно лицо и омрачить другое.

Сначала я был просто мальчиком, выполняющим работу. Я записывал цены по мере их поступления. Но после того как день за днём делал одно и то же, начал замечать, что цены имеют свои привычки. Они двигались не совсем так, как говорили люди. Иногда они росли прежде, чем становилась известна причина.

Меня стало меньше интересовать, что говорят люди, и больше — что делают цены. Говорить было легко. Покупать и продавать на реальные деньги — это другое.

То, что началось как любопытство мальчика, медленно стало центром моей жизни. Я хотел знать, когда цена готова двигаться, когда движение ложное и когда толпа опаздывает.''',
    // Ch2
    '''Когда я впервые рискнул деньгами, я не считал себя великим трейдером. Я просто верил, что достаточно долго наблюдал за доской, чтобы замечать то, что упускают другие.

Ранний успех опасен. Когда человек зарабатывает деньги, у него возникает искушение поверить, что эти деньги — доказательство мудрости. Я не был исключением. Несколько правильных сделок дали мне уверенность, а уверенность быстро переросла в желание торговать большими объёмами.

Поначалу рынок казался щедрым. Но рынок не остаётся добрым к человеку, который становится небрежным. Он позволяет ему выиграть ровно столько, чтобы стать смелым, а затем взимает плату за то, что тот перепутал смелость с мастерством.

Самые дорогие уроки — часто те, которые мы думали, что уже выучили. Знать правило легко. Соблюдать его, пока на кону стоят деньги, — настоящее испытание.''',
    // Ch3
    '''Люди любят объяснять движения цен после того, как они произошли. Но цены часто движутся раньше, чем появляется объяснение.

Я не боялся торговать без идеального объяснения. Я больше боялся игнорировать очевидное движение, потому что оно не согласовывалось с моим мнением. Рынок не объясняет себя вежливо. Он движется, и трейдер должен решить, слушать ли его.

Начинающие часто торгуют мнениями. Они покупают, потому что компания хорошая, потому что акция сильно упала или потому что говорят, что кто-то важный покупает. Но рынок не платит человеку за то, что у него есть мнение. Он платит за то, что он в правильной позиции в правильное время.

В конечном счёте цена — это запись того, что деньги реально сделали.''',
    // Ch4
    '''Я хорошо улавливал небольшие движения. Но улавливать небольшие движения и получать большую прибыль — это не одно и то же.

Человек, торгующий каждым небольшим разворотом, становится занятым. Он покупает, продаёт, берёт прибыль и начинает снова. Он может выглядеть умело, но если он обращается с великим трендом как с небольшим колебанием, он оставит наибольшие деньги на столе.

Большие деньги делаются не постоянными действиями. Они делаются тем, что сидишь с правильной позицией, пока рынок несёт её достаточно далеко.

Я был прав много раз и всё равно не заработал столько, сколько должен был. Я продавал слишком рано. Со временем я понял: быть правым — это только начало. Удерживать правильно — более сложное искусство.''',
    // Ch5
    '''Каждый трейдер ошибается. Разница между выживанием и гибелью — в том, что он делает после того, как ошибся. Небольшой убыток — это тихое предупреждение рынка. Если проигнорировать, предупреждение становится громче и дороже.

Я много раз увеличивал убытки. Сначала говорил себе, что цена вернётся. Затем — что было бы глупо продавать после такого падения. В конце убыток стал настолько большим, что я уже не наблюдал за рынком ясно.

Срезать убыток выглядит как холодная техника, но на самом деле это эмоциональная дисциплина. Нужно отказаться от гордости, признать ошибку и отказаться от идеи, которая ещё недавно казалась верной.

Небольшой убыток — цена оставаться в игре. Большой убыток может лишить способности сыграть следующую руку. Поэтому первый убыток обычно является лучшим убытком.''',
    // Ch6
    '''Уолл-стрит всегда была полна слухов. Люди любят такие истории, потому что они делают неопределённость управляемой.

Но позиция, открытая по словам другого человека, слаба. Если возникает проблема, трейдер ждёт успокоения от другого человека вместо того, чтобы читать рынок.

Информация ценна, но она не должна заменять суждение. Слух может быть поводом для расследования, но не поводом отказаться от ответственности.

Человек может случайно заработать деньги на чужом совете. Сохранить эти деньги — другое дело. Если он не знает, почему вошёл, он не будет знать, когда выйти.''',
    // Ch7
    '''Великие движения не всегда начинаются с шума. Часто они начинаются тихо. Толпа неуверена, новости неполны, и цена начинает наклоняться в одну сторону с растущей настойчивостью.

Я наблюдал не только за ценой, но и за поведением цены. Восстанавливается ли она после падения? Появляются ли покупатели, когда слабость должна была продолжаться? Такие признаки часто появлялись раньше объяснений.

Следование тренду требует смелости, но не слепой смелости. Трендовая торговля — это не искусство предсказывать будущее. Это искусство распознавать, куда рынок уже начал двигаться.''',
    // Ch8
    '''На рынке много умных людей. Но одних знаний недостаточно для прибыли.

Опасность в том, что знания могут сделать человека упрямым. Если он слишком много знает о компании, он может объяснять падающую цену тем, что рынок не оценил того, что знает он. Он думает, что защищает факты, но часто защищает свой вывод.

Смирение — это не невежество. Смирение — это способность сказать, даже после тщательного изучения, что рынок может показывать что-то, что я пропустил.

Когда цена движется против идеи, вопрос не в том, оскорбил ли меня рынок. Вопрос в том, существует ли ещё причина позиции.''',
    // Ch9
    '''После убытка многие мужчины становятся осторожными. После большой прибыли многие становятся опасными. Прибыль может заставить человека поверить, что рынок подтвердил его превосходство.

Я знал это чувство. После того как зарабатывал деньги, тот же размер позиции казался слишком маленьким. Прошлые успехи казались обещанием будущей безопасности, хотя рынок не даёт таких обещаний.

Наибольшая опасность после прибыли — ослабление правил. Человек входит раньше, чем следует, удерживает убыток дольше, чем планировал, и игнорирует сигналы, которые раньше уважал.

После большой победы трейдер должен снова стать маленьким в своём уме. Он должен вернуться к правилам, прежде чем прибыль превратится в гордость.''',
    // Ch10
    '''Многие трейдеры думают, что находиться вне рынка — это потерянное время. Это не так. Наличные — это позиция. Они дают человеку право действовать, когда появляется реальная возможность.

Рынок движется каждый день, и движение соблазняет людей участвовать. Но не каждое движение является возможностью. Некоторые движения — просто шум.

Хороший спекулянт — не тот, кто всегда занят. Это человек, который знает, когда нужно действовать, а когда бездействие мудрее.

Я много раз терял деньги, потому что не мог отдохнуть. Я думал, что рынок зовёт меня, но часто именно я цеплялся за рынок.''',
    // Ch11
    '''Когда цена падает, покупка большего количества снижает среднюю стоимость. Арифметика проста, и эта простота успокаивает людей. Но простая арифметика не всегда является хорошим суждением.

Падающая цена может падать по причине. Если человек покупает больше, не понимая, остаётся ли исходное суждение действительным, он может увеличивать ошибку.

Усреднение вниз не всегда неправильно, но незапланированное усреднение вниз опасно. Дополнительная покупка часто является эмоциональной защитой.

Рынку не важно, улучшилась ли средняя стоимость человека. Ему важны только спрос, предложение, страх, жадность и деньги.''',
    // Ch12
    '''Сначала толпа сомневается в движении. Затем замечает его. Затем верит. Наконец убеждается, и часто последняя уверенность приходит по самой высокой цене.

Падения работают так же. Сначала падение называют временным. Затем — возможностью. Позже оно становится пугающим. В конце те, кто больше не может терпеть страх, продают в отчаянии.

Легко смеяться над толпой, но любой трейдер может стать её частью. Человек думает хуже, когда возбуждён вместе с другими.

Трейдер должен наблюдать за настроением толпы, не становясь её слугой. Когда уверенность становится слишком горячей, риск часто нагревается вместе с ней.''',
    // Ch13
    '''Кредитное плечо не только увеличивает прибыль и убытки. Оно увеличивает и эмоции. Небольшой рост становится большой радостью. Небольшое падение становится большим страхом.

С большой позицией обычные колебания становятся труднопереносимыми. Трейдер перестаёт читать рынок и начинает читать собственную тревогу.

Трейдеру с кредитным плечом нужна дисциплина больше, чем смелость. Он должен знать, когда уменьшать, когда останавливаться и сколько боли он может позволить себе.

Желание заработать много денег понятно. Но рынок не добрее к большому желанию.''',
    // Ch14
    '''Ждать хорошей возможности болезненно. Когда цены движутся, человек чувствует, что должен что-то делать. Ничегонеделание может казаться отставанием.

Но ожидание — это не пустое время. Оно сохраняет суждение, капитал и эмоциональные силы. Человек, который входит небрежно, должен искать причины позже. Человек, который ждёт, входит с уже сформированными причинами.

Я терял деньги, потому что не ждал. Позиция, которая только почти правильна, может стать очень неудобной.

Хорошая торговля начинается до сделки. Она начинается в ожидании.''',
    // Ch15
    '''После убытка желание быстро восстановиться сильно. Потерянные деньги несут с собой гордость, злость и унижение. Это делает следующую сделку опасной.

Мстительная торговля — это не торговля рынком. Это торговля собственной раной. Человек увеличивает размер, потому что хочет облегчения, а не потому, что возможность лучше.

Рынок не знает, что трейдер только что потерял деньги, и если бы знал, ему было бы всё равно.

После убытка лучшим первым действием часто является отдых. Деньги не будут возвращены гневом. Они будут возвращены, если вообще будут, лучшим суждением позже.''',
    // Ch16
    '''Память ненадёжна в спекуляции. Человек ясно помнит свои успехи и объясняет свои ошибки. Со временем ошибки становятся разумными, а победы увеличиваются в воображении.

Записи затрудняют самообман. Почему я вошёл? Что я видел? Где должен был признать ошибку? Письменные ответы раскрывают закономерности, которые скрывает память.

Один человек всегда покупает слишком рано. Другой продаёт слишком поздно. Без записей эти привычки ощущаются как личность. С записями они становятся видимыми.

Изучать рынок — значит также изучать себя. Числа снаружи, но многие ошибки начинаются внутри.''',
    // Ch17
    '''Рынок колышется каждый день. Если каждое колебание воспринимать как важный сигнал, трейдер быстро истощается. Некоторые движения важны. Другие — просто шум.

Трейдер должен отличать нормальную реакцию от изменения характера. Это сложно. Держать слишком упрямо — и реальный разворот становится гибелью. Реагировать слишком быстро — и каждое небольшое колебание выбрасывает вас.

Ответ — не эмоции, а подготовка. Прежде чем рынок испытает его, трейдер должен решить, какие условия удерживают его внутри, а какие выводят.

Человек без стандартов движется с каждой ценой. Человек со стандартами может всё ещё чувствовать страх, но у него есть место, куда вернуться.''',
    // Ch18
    '''Многие трейдеры пересматривают только свои убытки. Но выигрышные сделки тоже нужно изучать. Прибыль не доказывает, что процесс был правильным.

Иногда человек зарабатывает деньги после принятия глупого риска. Если он не пересмотрит сделку, прибыль учит его неправильному уроку. Рынок иногда вознаграждает плохое поведение, и эта награда может быть опасной.

Вопрос не только в том, были ли заработаны деньги. Вопрос в том, можно ли повторить решение, не завися от удачи.

Трейдер должен быть строгим к прибыли так же, как к убыткам. Иначе прибыль становится семенем будущей небрежности.''',
    // Ch19
    '''Есть много людей, которые когда-то заработали большие деньги на рынке. Выживших надолго меньше. Большие прибыли видны. Выживание более тихое.

Выживший знает свои слабости. Он знает, когда становится нетерпеливым, какой вид убытка беспокоит его и какие истории искушают его. Он изучает себя так же, как изучает цены.

Он не форсирует возможности, когда их нет. Ждёт, когда рынок неясен, уменьшает, когда сделка идёт не так, и возвращается к правилам после побед и поражений.

Именно поэтому книга остаётся живой. Она не только о старых рынках. Она о природе человека на рынках, а природа человека мало изменилась.''',
    // Ch20
    '''Рынок научил меня многому. Цена честнее слов. Убытки лучше, когда они небольшие. Большая прибыль приходит реже от беспокойных рук, чем от терпеливого суждения.

Но знать всё это недостаточно. Это нужно соблюдать, когда деньги на кону. Именно здесь большинство людей терпят поражение.

Трейдер ведёт две битвы. Одна — с рынком. Другая — с самим собой. Он может проиграть рынку и восстановиться. Если он постоянно проигрывает себе, он не продержится.

Рынок снова откроется завтра. Человек, который помнит это, не нуждается в том, чтобы рисковать всем сегодня. Выжить сегодня — значит сохранить право встретить завтрашнюю возможность.''',
  ];

  static List<_BookChapter> _withRuTitles() {
    const titles = [
      'О книге',
      '1. Мальчик у доски котировок',
      '2. Первый вкус победы',
      '3. Рынок не ждёт объяснений',
      '4. Быстро угадать — не то же самое, что много заработать',
      '5. Искусство уменьшаться, когда ошибаешься',
      '6. Слухи движут людьми, цены движут деньгами',
      '7. Тихое начало тренда',
      '8. Ловушка слишком большого знания',
      '9. Почему прибыль может сделать человека опаснее',
      '10. Отдых тоже является позицией',
      '11. Опасность усреднения вниз',
      '12. Толпа убеждается всегда поздно',
      '13. Кредитное плечо увеличивает и разум',
      '14. Ждать — это больно',
      '15. Рынок не позволяет мести',
      '16. Хорошее суждение приходит из записей',
      '17. Главное движение и шум',
      '18. Успешные сделки тоже нужно пересматривать',
      '19. Человек, который выживает',
      '20. Последняя страница',
    ];
    return List.generate(
      _russianBodies.length,
      (i) => _BookChapter(title: titles[i], body: _russianBodies[i]),
    );
  }

  // ── French ────────────────────────────────────────────────────────────────

  static const _frenchBodies = <String>[
    // Ch0
    '''Mémoires d'un opérateur de bourse
Edwin Lefevre

Cette édition suit le fil du classique anglais et le présente dans un format de lecture longue. Ce n'est pas une traduction littérale mot à mot, mais une édition narrative qui permet au lecteur d'avancer dans l'histoire et ses leçons page après page.

L'histoire commence avec un garçon qui travaille près d'un tableau de cotations et est fasciné par le mouvement des prix. Il observe comment les adultes changent d'expression pour quelques points de variation. Avant de comprendre le langage de la finance, il comprend que les prix parlent à leur manière.

Ce livre ne parle pas seulement de gagner de l'argent. Il parle du jugement, de la discipline, de la peur, de la cupidité et de l'étrange habitude qu'ont les gens d'ignorer le marché quand il n'est pas d'accord avec eux. L'opérateur gagne, perd, remonte et apprend que le marché est un maître sévère.''',
    // Ch1
    '''J'étais très jeune quand j'ai commencé à observer les mouvements des prix. Le bureau avait un tableau où les cotations étaient inscrites, et les hommes entraient avec des espoirs, des peurs et des opinions. Un petit changement de prix pouvait illuminer un visage et en assombrir un autre.

Au début j'étais juste un garçon faisant un travail. Je notais les prix à mesure qu'ils arrivaient. Mais après avoir fait la même chose jour après jour, j'ai commencé à remarquer que les prix avaient des habitudes. Ils ne se déplaçaient pas exactement comme les hommes disaient qu'ils devraient. Parfois ils montaient avant que la raison soit connue.

Je suis devenu moins intéressé par ce que les gens disaient et plus intéressé par ce que faisaient les prix. Parler était facile. Acheter et vendre avec de l'argent réel était différent.

Ce qui a commencé comme la curiosité d'un garçon est lentement devenu le centre de ma vie. Je voulais savoir quand un prix était prêt à bouger, quand un mouvement était faux et quand la foule arrivait en retard.''',
    // Ch2
    '''Quand j'ai risqué de l'argent pour la première fois, je ne me considérais pas comme un grand opérateur. Je croyais simplement avoir observé le tableau assez longtemps pour voir des choses que les autres manquaient.

Le succès précoce est dangereux. Quand un homme gagne de l'argent, il est tenté de croire que cet argent est la preuve de sa sagesse. Je n'étais pas différent.

Au début le marché semblait généreux. Mais le marché ne reste pas aimable avec un homme qui devient négligent. Il le laisse gagner juste assez pour devenir audacieux, puis lui fait payer pour avoir confondu l'audace avec la compétence.

J'ai appris plus tard que les leçons les plus chères sont souvent celles qu'on croyait avoir déjà apprises. Connaître une règle est facile. L'obéir quand de l'argent est en jeu est le vrai test.''',
    // Ch3
    '''Les gens aiment expliquer les mouvements de prix après qu'ils se produisent. Mais les prix bougent souvent avant que l'explication arrive.

Je n'avais pas peur d'opérer sans une explication parfaite. J'avais plus peur d'ignorer un mouvement clair parce qu'il n'était pas d'accord avec mon opinion. Le marché ne s'explique pas poliment. Il bouge, et l'opérateur doit décider d'écouter ou non.

Les débutants opèrent souvent leurs opinions. Ils achètent parce qu'une entreprise est bonne, parce qu'une action a beaucoup baissé. Mais le marché ne paie pas un homme pour avoir une opinion. Il paie pour être dans la bonne position au bon moment.

J'ai appris à moins écouter les mots et plus les actions. Les mots pouvaient être bruyants, mais l'argent était plus silencieux et décisif.''',
    // Ch4
    '''J'étais doué pour saisir les petits mouvements. Mais saisir les petits mouvements et obtenir de gros bénéfices ne sont pas la même chose.

Un homme qui opère chaque petit retournement devient occupé. Il achète, vend, prend un profit et recommence. Il peut sembler habile, mais s'il traite une grande tendance comme une petite fluctuation, il laissera le plus gros argent sur la table.

Le gros argent ne s'est pas fait par une action constante. Il s'est fait en restant dans une position correcte pendant que le marché la portait assez loin.

J'ai eu raison plusieurs fois et n'ai toujours pas gagné ce que j'aurais dû gagner. J'ai vendu trop tôt. Avec le temps j'ai appris qu'avoir raison n'est que le début. Tenir correctement est l'art plus difficile.''',
    // Ch5
    '''Tout opérateur se trompe. La différence entre la survie et la ruine est ce qu'il fait après s'être trompé. Une petite perte est l'avertissement silencieux du marché. Si ignoré, l'avertissement devient plus fort et plus coûteux.

J'ai amplifié les pertes plusieurs fois. Au début je me disais que le prix reviendrait. Ensuite la perte est devenue si grande que je ne regardais plus clairement le marché.

Couper une perte ressemble à une technique froide, mais c'est en réalité une discipline émotionnelle. Il faut abandonner l'orgueil, admettre l'erreur et abandonner une idée qui peu avant semblait certaine.

Une petite perte est le prix de rester dans le jeu. Une grande perte peut ôter la capacité de jouer la prochaine main.''',
    // Ch6
    '''Wall Street a toujours été pleine de rumeurs. Les gens adorent ces histoires parce qu'elles font paraître l'incertitude gérable.

Mais une position prise sur la parole d'un autre homme est faible. Si un problème survient, l'opérateur attend la réassurance d'un autre homme au lieu de lire le marché.

L'information a de la valeur, mais elle ne doit pas remplacer le jugement. Une rumeur peut être une raison d'enquêter, mais pas une raison de renoncer à la responsabilité.

Un homme peut gagner de l'argent par hasard sur le conseil d'un autre. Garder cet argent est une autre affaire. S'il ne sait pas pourquoi il est entré, il ne saura pas quand sortir.''',
    // Ch7
    '''Les grands mouvements ne commencent pas toujours avec du bruit. Souvent ils commencent silencieusement. La foule est incertaine, les nouvelles sont incomplètes, et le prix commence à pencher dans une direction avec une persistance croissante.

J'observais non seulement le prix mais le comportement du prix. Se redressait-il après une baisse ? De tels signes apparaissaient souvent avant les explications.

Suivre une tendance demande du courage, mais pas un courage aveugle. La négociation par tendance n'est pas l'art de prédire l'avenir. C'est l'art de reconnaître là où le marché a déjà commencé à aller.''',
    // Ch8
    '''Il y a beaucoup de gens intelligents sur le marché. Mais la connaissance seule ne garantit pas les bénéfices.

Le danger est que la connaissance peut rendre un homme têtu. S'il en sait trop sur une entreprise, il peut expliquer un prix qui baisse parce qu'il croit que le marché n'a pas apprécié ce qu'il sait.

L'humilité n'est pas l'ignorance. L'humilité est la capacité de dire, même après une étude minutieuse, que le marché peut montrer quelque chose que je n'ai pas vu.

Quand le prix se déplace contre une idée, la question n'est pas de savoir si le marché m'a insulté. La question est de savoir si la raison de la position existe encore.''',
    // Ch9
    '''Après une perte, beaucoup d'hommes deviennent prudents. Après un gros profit, beaucoup deviennent dangereux. Le profit peut faire croire à un homme que le marché a confirmé sa supériorité.

Le plus grand danger après le profit est le relâchement des règles. Un homme entre plus tôt qu'il ne devrait, maintient une perte plus longtemps que prévu et ignore des signaux qu'il aurait respectés auparavant.

Après une grande victoire, l'opérateur doit redevenir petit dans son propre esprit. Il doit revenir aux règles avant que le profit ne devienne de l'orgueil.''',
    // Ch10
    '''Beaucoup d'opérateurs pensent que rester hors du marché est du temps perdu. Ce n'est pas le cas. Les liquidités sont une position. Elles donnent à un homme le droit d'agir quand une vraie opportunité apparaît.

Le bon spéculateur n'est pas l'homme qui est toujours occupé. C'est l'homme qui sait quand l'action est requise et quand l'inaction est plus sage.

J'ai perdu de l'argent plusieurs fois parce que je ne pouvais pas me reposer. Je pensais que le marché m'appelait, mais souvent c'était moi qui m'accrochais au marché.''',
    // Ch11
    '''Quand un prix baisse, acheter davantage réduit le coût moyen. L'arithmétique est simple, et cette simplicité réconforte les gens. Mais l'arithmétique simple n'est pas toujours un bon jugement.

Un prix qui baisse peut baisser pour une raison. Si un homme achète plus sans comprendre si le jugement original est toujours valide, il peut augmenter une erreur.

Faire la moyenne à la baisse n'est pas toujours faux, mais faire la moyenne à la baisse sans planification est dangereux. L'achat supplémentaire est souvent une défense émotionnelle.

Le marché ne se soucie pas si le coût moyen d'un homme s'est amélioré. Il ne se soucie que de l'offre, de la demande, de la peur, de la cupidité et de l'argent.''',
    // Ch12
    '''Au début la foule doute d'un mouvement. Puis elle le remarque. Puis elle y croit. Finalement elle en est convaincue, et souvent la dernière conviction vient au prix le plus élevé.

Les baisses fonctionnent de la même façon. Au début la baisse est appelée temporaire. Plus tard elle devient effrayante. À la fin, ceux qui ne peuvent plus supporter la peur vendent dans le désespoir.

Il est facile de se moquer de la foule, mais tout opérateur peut en faire partie. L'opérateur doit observer l'humeur de la foule sans en devenir le serviteur.''',
    // Ch13
    '''L'effet de levier n'amplifie pas seulement les profits et les pertes. Il amplifie aussi les émotions. Une petite hausse devient une grande joie. Une petite baisse devient une grande peur.

L'opérateur à effet de levier a besoin de discipline plus que de courage. Il doit savoir quand réduire, quand s'arrêter et combien de douleur il peut se permettre.

Le marché n'est pas plus aimable avec le grand désir. Il utilise souvent ce désir pour faire rester un homme trop longtemps, opérer en excès et prendre trop de risques.''',
    // Ch14
    '''Attendre une bonne opportunité est douloureux. Quand les prix bougent, un homme sent qu'il devrait faire quelque chose. Ne rien faire peut sembler être en retard.

Mais attendre n'est pas du temps vide. Cela préserve le jugement, le capital et la force émotionnelle. Un homme qui attend entre avec des raisons déjà formées.

La bonne négociation commence avant la négociation. Elle commence dans l'attente.''',
    // Ch15
    '''Après une perte, le désir de récupérer rapidement est fort. L'argent perdu porte avec lui orgueil, colère et humiliation. Cela rend la prochaine opération dangereuse.

La négociation de vengeance n'est pas vraiment négocier le marché. C'est négocier sa propre blessure. Le marché ne sait pas qu'un opérateur vient de perdre de l'argent, et s'il le savait, il ne s'en soucierait pas.

Après une perte, la meilleure première action est souvent de se reposer. L'argent ne sera pas récupéré par la colère. Il sera récupéré, le cas échéant, par un meilleur jugement plus tard.''',
    // Ch16
    '''La mémoire n'est pas fiable dans la spéculation. Un homme se souvient clairement de ses succès et explique ses erreurs. Avec le temps, les erreurs deviennent raisonnables et les victoires deviennent plus grandes dans l'imagination.

Les registres rendent l'autotromperie plus difficile. Pourquoi suis-je entré ? Qu'ai-je vu ? Les réponses écrites révèlent des modèles que la mémoire cache.

Apprendre le marché c'est aussi s'apprendre soi-même. Les chiffres sont à l'extérieur, mais beaucoup d'erreurs commencent à l'intérieur.''',
    // Ch17
    '''Le marché tremble tous les jours. Si chaque tremblement est traité comme un signal majeur, l'opérateur s'épuise vite. Certains mouvements comptent. D'autres ne sont que du bruit.

L'opérateur doit distinguer une réaction normale d'un changement de caractère. Avant que le marché ne le teste, l'opérateur doit décider quelles conditions le maintiennent à l'intérieur et lesquelles l'en font sortir.

Un homme sans normes est mû par chaque prix. Un homme avec des normes peut encore ressentir la peur, mais il a un endroit où retourner.''',
    // Ch18
    '''Beaucoup d'opérateurs ne révisent que leurs pertes. Mais les opérations gagnantes doivent aussi être examinées. Un profit ne prouve pas que le processus était sain.

Parfois un homme gagne de l'argent après avoir pris un risque insensé. Le marché récompense parfois les mauvais comportements, et cette récompense peut être dangereuse.

La question n'est pas seulement de savoir si de l'argent a été gagné. La question est de savoir si la décision peut être répétée sans dépendre de la chance.''',
    // Ch19
    '''Il y a beaucoup de gens qui ont un jour gagné beaucoup d'argent sur le marché. Il y en a moins qui ont survécu longtemps. Les grandes prises sont visibles. La survie est plus silencieuse.

Le survivant connaît ses faiblesses. Il sait quand il devient impatient, quel type de perte le dérange et quelles histoires le tentent. Il s'étudie lui-même autant qu'il étudie les prix.

C'est pourquoi le livre reste vivant. Il ne parle pas seulement des marchés d'autrefois. Il parle de la nature humaine sur les marchés, et la nature humaine n'a pas beaucoup changé.''',
    // Ch20
    '''Le marché m'a appris beaucoup de choses. Le prix est plus honnête que les mots. Les pertes sont meilleures quand elles sont petites. Les grands profits viennent moins souvent des mains agitées que du jugement patient.

Mais connaître ces choses n'est pas suffisant. Elles doivent être obéies quand de l'argent est en jeu. C'est là que la plupart des hommes échouent.

L'opérateur mène deux batailles. L'une est avec le marché. L'autre est avec lui-même. Le marché ouvrira encore demain. L'homme qui s'en souvient n'a pas besoin de tout risquer aujourd'hui. Survivre aujourd'hui c'est conserver le droit de rencontrer l'opportunité de demain.''',
  ];

  static List<_BookChapter> _withFrTitles() {
    const titles = [
      "Présentation de l'œuvre",
      '1. Le garçon devant le tableau de cotations',
      '2. Le premier goût de la victoire',
      '3. Le marché n\'attend pas les explications',
      '4. Avoir raison vite n\'est pas la même chose que gagner gros',
      '5. L\'art de rapetisser quand on a tort',
      '6. Les rumeurs font bouger les gens, les prix font bouger l\'argent',
      '7. Le début silencieux d\'une tendance',
      '8. Le piège d\'en savoir trop',
      '9. Pourquoi le profit peut rendre un homme plus dangereux',
      '10. Le repos est aussi une position',
      '11. Le danger de faire la moyenne à la baisse',
      '12. La foule se convainc toujours tard',
      '13. L\'effet de levier agrandit aussi l\'esprit',
      '14. Attendre est douloureux',
      '15. Le marché ne permet pas la vengeance',
      '16. Le bon jugement vient des registres',
      '17. Le mouvement principal et le bruit',
      '18. Les opérations réussies doivent aussi être révisées',
      '19. L\'homme qui survit',
      '20. Dernière page',
    ];
    return List.generate(
      _frenchBodies.length,
      (i) => _BookChapter(title: titles[i], body: _frenchBodies[i]),
    );
  }

  // ── German ────────────────────────────────────────────────────────────────

  static const _germanBodies = <String>[
    // Ch0
    '''Erinnerungen eines Börsenspekulanten
Edwin Lefevre

Diese Ausgabe folgt dem Fluss des englischen Klassikers und präsentiert ihn in einem erweiterten Leseformat. Es ist keine wörtliche Übersetzung, sondern eine narrative Ausgabe, die es dem Leser ermöglicht, Seite für Seite durch die Geschichte und ihre Lektionen zu gehen.

Die Geschichte beginnt mit einem Jungen, der in der Nähe einer Kursanzeigetafel arbeitet und vom Kursbewegungen fasziniert ist. Er beobachtet, wie Erwachsene bei ein paar Punkten Veränderung das Gesicht wechseln. Bevor er die Sprache der Finanzen versteht, versteht er, dass Kurse auf ihre eigene Weise sprechen.

Dieses Buch handelt nicht nur davon, Geld zu verdienen. Es handelt von Urteilsvermögen, Disziplin, Angst, Gier und der seltsamen Gewohnheit der Menschen, den Markt zu ignorieren, wenn er nicht mit ihnen übereinstimmt. Der Operator gewinnt, verliert, steigt wieder auf und lernt, dass der Markt ein strenger Lehrer ist.''',
    // Ch1
    '''Ich war sehr jung, als ich anfing, die Kursbewegungen zu beobachten. Das Büro hatte eine Tafel, auf der Kurse geschrieben wurden, und Männer kamen mit Hoffnungen, Ängsten und Meinungen herein. Eine kleine Kursänderung konnte ein Gesicht erhellen und ein anderes verdunkeln.

Zuerst war ich nur ein Junge, der einen Job machte. Ich schrieb Kurse auf, als sie eintrafen. Aber nachdem ich Tag für Tag dasselbe getan hatte, begann ich zu bemerken, dass Kurse Gewohnheiten hatten. Sie bewegten sich nicht genau so, wie die Männer sagten, dass sie sollten.

Ich wurde weniger an dem interessiert, was die Leute sagten, und mehr an dem, was die Kurse taten. Reden war einfach. Mit echtem Geld kaufen und verkaufen war anders.

Was als Neugier eines Jungen begann, wurde langsam zum Mittelpunkt meines Lebens. Ich wollte wissen, wann ein Kurs bereit war sich zu bewegen, wann eine Bewegung falsch war und wann die Menge zu spät kam.''',
    // Ch2
    '''Als ich zum ersten Mal Geld riskierte, hielt ich mich nicht für einen großen Händler. Ich glaubte einfach, dass ich die Tafel lange genug beobachtet hatte, um Dinge zu sehen, die andere übersahen.

Früher Erfolg ist gefährlich. Wenn ein Mann Geld verdient, ist er versucht zu glauben, dass das Geld ein Beweis für Weisheit ist.

Anfangs schien der Markt großzügig. Aber der Markt bleibt nicht freundlich zu einem Mann, der nachlässig wird. Er lässt ihn gerade genug gewinnen, um kühn zu werden, und berechnet ihm dann, Kühnheit mit Geschick verwechselt zu haben.

Ich lernte später, dass die teuersten Lektionen oft die sind, von denen wir dachten, wir hätten sie bereits gelernt. Eine Regel zu kennen ist einfach. Sie zu befolgen, während Geld auf dem Spiel steht, ist der eigentliche Test.''',
    // Ch3
    '''Die Leute erklären gerne Kursbewegungen, nachdem sie passiert sind. Aber die Kurse bewegen sich oft, bevor die Erklärung eintrifft.

Ich hatte keine Angst davor, ohne eine perfekte Erklärung zu handeln. Ich hatte mehr Angst davor, eine klare Bewegung zu ignorieren, weil sie nicht mit meiner Meinung übereinstimmte. Der Markt erklärt sich nicht höflich. Er bewegt sich, und der Händler muss entscheiden, ob er zuhört.

Anfänger handeln oft Meinungen. Sie kaufen, weil ein Unternehmen gut ist, weil eine Aktie stark gefallen ist. Aber der Markt bezahlt einen Mann nicht dafür, eine Meinung zu haben. Er bezahlt dafür, zur richtigen Zeit an der richtigen Position zu sein.

Am Ende war der Kurs die Aufzeichnung dessen, was das Geld tatsächlich getan hatte.''',
    // Ch4
    '''Ich war gut darin, kleine Bewegungen zu erfassen. Aber kleine Bewegungen zu erfassen und große Gewinne zu erzielen ist nicht dasselbe.

Ein Mann, der jeden kleinen Dreh handelt, wird beschäftigt. Er kauft, verkauft, nimmt einen Gewinn und beginnt wieder. Er mag geschickt aussehen, aber wenn er einen großen Trend wie eine kleine Fluktuation behandelt, lässt er das meiste Geld auf dem Tisch liegen.

Das große Geld wurde nicht durch ständiges Handeln gemacht. Es wurde gemacht, indem man mit einer richtigen Position saß, während der Markt sie weit genug trug.

Ich hatte viele Male recht und verdiente trotzdem nicht das, was ich hätte verdienen sollen. Ich verkaufte zu früh. Mit der Zeit lernte ich, dass recht haben nur der Anfang ist. Richtig zu halten ist die schwierigere Kunst.''',
    // Ch5
    '''Jeder Händler liegt falsch. Der Unterschied zwischen Überleben und Ruin ist, was er tut, nachdem er falsch liegt. Ein kleiner Verlust ist die stille Warnung des Marktes. Wenn er ignoriert wird, wird die Warnung lauter und teurer.

Ich vergrößerte Verluste viele Male. Zunächst sagte ich mir, dass der Kurs zurückkehren würde. Schließlich wurde der Verlust so groß, dass ich den Markt nicht mehr klar beobachtete.

Einen Verlust zu schneiden sieht wie eine kalte Technik aus, ist aber wirklich emotionale Disziplin. Ein Mann muss den Stolz aufgeben, den Fehler zugeben und eine Idee aufgeben, die kurz zuvor sicher schien.

Ein kleiner Verlust ist der Preis, im Spiel zu bleiben. Ein großer Verlust kann die Fähigkeit nehmen, die nächste Hand zu spielen.''',
    // Ch6
    '''Die Wall Street war schon immer voller Gerüchte. Die Leute lieben solche Geschichten, weil sie Unsicherheit beherrschbar erscheinen lassen.

Aber eine Position, die auf einem anderen Wort eingegangen wurde, ist schwach. Wenn ein Problem auftritt, wartet der Händler auf die Beruhigung eines anderen Mannes, anstatt den Markt zu lesen.

Informationen haben einen Wert, dürfen aber das Urteilsvermögen nicht ersetzen. Ein Gerücht kann ein Grund zur Untersuchung sein, aber kein Grund, die Verantwortung aufzugeben.

Ein Mann kann zufällig Geld mit dem Tipp eines anderen verdienen. Dieses Geld zu behalten ist eine andere Sache. Wenn er nicht weiß, warum er eingetreten ist, wird er nicht wissen, wann er aussteigen soll.''',
    // Ch7
    '''Große Bewegungen beginnen nicht immer mit Lärm. Oft beginnen sie still. Die Menge ist unsicher, die Nachrichten sind unvollständig, und der Kurs beginnt sich mit zunehmender Beharrlichkeit in eine Richtung zu neigen.

Ich beobachtete nicht nur den Kurs, sondern das Verhalten des Kurses. Erholte er sich nach einem Rückgang? Solche Zeichen erschienen oft vor Erklärungen.

Das Trendhandeln ist nicht die Kunst, die Zukunft vorherzusagen. Es ist die Kunst zu erkennen, wohin der Markt bereits begonnen hat zu gehen.''',
    // Ch8
    '''Es gibt viele intelligente Menschen auf dem Markt. Aber Wissen allein garantiert keine Gewinne.

Die Gefahr ist, dass Wissen einen Mann stur machen kann. Wenn er zu viel über ein Unternehmen weiß, kann er einen fallenden Kurs erklären, weil er glaubt, dass der Markt das, was er weiß, nicht gewürdigt hat.

Demut ist nicht Unwissenheit. Demut ist die Fähigkeit zu sagen, auch nach sorgfältigem Studium, dass der Markt etwas zeigen könnte, das ich übersehen habe.

Wenn sich der Kurs gegen eine Idee bewegt, ist die Frage nicht, ob der Markt mich beleidigt hat. Die Frage ist, ob der Grund für die Position noch existiert.''',
    // Ch9
    '''Nach einem Verlust werden viele Männer vorsichtig. Nach einem großen Gewinn werden viele gefährlich. Der Gewinn kann einen Mann glauben lassen, dass der Markt seine Überlegenheit bestätigt hat.

Die größte Gefahr nach dem Gewinn ist die Lockerung der Regeln. Ein Mann tritt früher ein, als er sollte, hält einen Verlust länger als geplant und ignoriert Signale, die er vorher respektiert hätte.

Nach einem großen Sieg muss der Händler in seinem eigenen Kopf wieder klein werden. Er muss zu Regeln zurückkehren, bevor der Gewinn zu Stolz wird.''',
    // Ch10
    '''Viele Händler denken, dass außerhalb des Marktes zu bleiben verschwendete Zeit ist. Das ist es nicht. Bargeld ist eine Position. Es gibt einem Mann das Recht zu handeln, wenn eine echte Gelegenheit erscheint.

Der gute Spekulant ist nicht der Mann, der immer beschäftigt ist. Er ist der Mann, der weiß, wann Aktion erforderlich ist und wann Untätigkeit klüger ist.

Ich verlor viele Male Geld, weil ich nicht ausruhen konnte. Ich dachte, der Markt rufe mich, aber oft war ich derjenige, der sich an den Markt klammerte.''',
    // Ch11
    '''Wenn ein Kurs fällt, senkt das Kaufen von mehr den durchschnittlichen Einstandspreis. Die Arithmetik ist einfach, und diese Einfachheit tröstet die Menschen. Aber einfache Arithmetik ist nicht immer gutes Urteilsvermögen.

Ein fallender Kurs kann aus einem Grund fallen. Wenn ein Mann mehr kauft, ohne zu verstehen, ob das ursprüngliche Urteil noch gültig ist, kann er einen Fehler vergrößern.

Nach unten zu mitteln ist nicht immer falsch, aber ungeplantes Mitteln nach unten ist gefährlich. Der Markt kümmert sich nicht darum, ob sich die Durchschnittskosten eines Mannes verbessert haben.''',
    // Ch12
    '''Zunächst zweifelt die Menge an einer Bewegung. Dann bemerkt sie. Dann glaubt sie. Schließlich ist sie überzeugt, und oft kommt die letzte Überzeugung beim höchsten Preis.

Rückgänge funktionieren genauso. Am Ende verkaufen diejenigen, die die Angst nicht mehr ertragen können, in der Verzweiflung.

Es ist leicht, über die Menge zu lachen, aber jeder Händler kann Teil davon werden. Ein Mann denkt schlechter, wenn er mit anderen aufgeregt ist.''',
    // Ch13
    '''Der Hebel vergrößert nicht nur Gewinne und Verluste. Er vergrößert auch Emotionen. Ein kleiner Anstieg wird zu großer Freude. Ein kleiner Rückgang wird zu großer Angst.

Der gehebelte Händler braucht Disziplin mehr als Mut. Er muss wissen, wann er reduzieren, wann er stoppen und wie viel Schmerz er sich leisten kann.

Der Markt ist nicht freundlicher gegenüber großem Begehren. Er nutzt dieses Begehren oft, um einen Mann zu lange zu halten, zu viel zu handeln und zu viel Risiko einzugehen.''',
    // Ch14
    '''Auf eine gute Gelegenheit zu warten ist schmerzhaft. Wenn sich die Kurse bewegen, fühlt ein Mann, dass er etwas tun sollte. Nichts tun kann sich anfühlen wie Zurückliegen.

Aber Warten ist keine leere Zeit. Es bewahrt Urteilsvermögen, Kapital und emotionale Stärke. Ein Mann, der wartet, tritt mit bereits geformten Gründen ein.

Gutes Handeln beginnt vor dem Handel. Es beginnt im Warten.''',
    // Ch15
    '''Nach einem Verlust ist der Wunsch nach schneller Erholung stark. Das verlorene Geld trägt Stolz, Wut und Demütigung mit sich. Das macht den nächsten Handel gefährlich.

Vergeltungshandel ist nicht wirklich den Markt handeln. Es ist die eigene Wunde zu handeln. Der Markt weiß nicht, dass ein Händler gerade Geld verloren hat, und wenn er es wüsste, würde es ihm egal sein.

Nach einem Verlust ist die beste erste Aktion oft Ruhe. Das Geld wird nicht durch Wut zurückgewonnen. Es wird, wenn überhaupt, durch besseres Urteilsvermögen später zurückgewonnen.''',
    // Ch16
    '''Das Gedächtnis ist bei der Spekulation nicht zuverlässig. Ein Mann erinnert sich klar an seine Erfolge und erklärt seine Fehler. Mit der Zeit werden Fehler vernünftig und Siege werden in der Vorstellung größer.

Aufzeichnungen machen Selbsttäuschung schwieriger. Warum bin ich eingetreten? Was habe ich gesehen? Schriftliche Antworten enthüllen Muster, die das Gedächtnis verbirgt.

Den Markt zu lernen bedeutet auch, sich selbst zu lernen. Die Zahlen sind draußen, aber viele Fehler beginnen drinnen.''',
    // Ch17
    '''Der Markt schüttelt sich jeden Tag. Wenn jedes Schütteln als ein wichtiges Signal behandelt wird, erschöpft sich der Händler bald. Einige Bewegungen sind wichtig. Andere sind nur Lärm.

Bevor der Markt ihn testet, muss der Händler entscheiden, welche Bedingungen ihn drin halten und welche ihn herausnehmen.

Ein Mann ohne Standards wird von jedem Kurs bewegt. Ein Mann mit Standards kann immer noch Angst fühlen, aber er hat einen Ort, zu dem er zurückkehren kann.''',
    // Ch18
    '''Viele Händler überprüfen nur ihre Verluste. Aber Gewinntrades müssen auch untersucht werden. Ein Gewinn beweist nicht, dass der Prozess solide war.

Manchmal verdient ein Mann Geld, nachdem er ein törichtes Risiko eingegangen ist. Der Markt belohnt gelegentlich schlechtes Verhalten, und diese Belohnung kann gefährlich sein.

Die Frage ist nicht nur, ob Geld verdient wurde. Die Frage ist, ob die Entscheidung wiederholt werden kann, ohne von Glück abhängig zu sein.''',
    // Ch19
    '''Es gibt viele Menschen, die einmal viel Geld an der Börse verdient haben. Es gibt weniger, die lange überlebt haben. Große Gewinne sind sichtbar. Überleben ist stiller.

Der Überlebende kennt seine Schwächen. Er studiert sich selbst genauso wie er die Kurse studiert.

Er erzwingt keine Gelegenheit, wenn es keine gibt. Er wartet, wenn der Markt unklar ist, und kehrt nach Siegen und Verlusten zu Regeln zurück.

Deshalb lebt das Buch weiter. Es handelt nicht nur von alten Märkten. Es handelt von der menschlichen Natur auf den Märkten, und die menschliche Natur hat sich nicht viel verändert.''',
    // Ch20
    '''Der Markt lehrte mich viele Dinge. Der Kurs ist ehrlicher als Worte. Verluste sind am besten, wenn sie klein sind. Große Gewinne kommen seltener von unruhigen Händen als vom geduldigen Urteilsvermögen.

Aber diese Dinge zu kennen ist nicht genug. Sie müssen befolgt werden, wenn Geld auf dem Spiel steht. Dort scheitern die meisten Männer.

Der Händler kämpft zwei Schlachten. Eine ist mit dem Markt. Die andere ist mit sich selbst. Den Markt morgen wieder zu öffnen. Der Mann, der sich daran erinnert, muss heute nicht alles riskieren. Heute zu überleben bedeutet, das Recht zu behalten, der Gelegenheit von morgen zu begegnen.''',
  ];

  static List<_BookChapter> _withDeTitles() {
    const titles = [
      'Einführung ins Werk',
      '1. Der Junge an der Kursanzeigetafel',
      '2. Der erste Geschmack des Sieges',
      '3. Der Markt wartet nicht auf Erklärungen',
      '4. Schnell richtig liegen ist nicht dasselbe wie viel verdienen',
      '5. Die Kunst, klein zu werden, wenn man falsch liegt',
      '6. Gerüchte bewegen Menschen, Kurse bewegen Geld',
      '7. Der stille Beginn eines Trends',
      '8. Die Falle des Zuviel-Wissens',
      '9. Warum Gewinn einen Mann gefährlicher machen kann',
      '10. Ruhe ist auch eine Position',
      '11. Die Gefahr des Nachkaufens',
      '12. Die Menge überzeugt sich immer spät',
      '13. Der Hebel vergrößert auch den Geist',
      '14. Warten ist schmerzhaft',
      '15. Der Markt erlaubt keine Rache',
      '16. Gutes Urteilsvermögen kommt aus Aufzeichnungen',
      '17. Die Hauptbewegung und das Rauschen',
      '18. Erfolgreiche Trades müssen auch überprüft werden',
      '19. Der Mann, der überlebt',
      '20. Letzte Seite',
    ];
    return List.generate(
      _germanBodies.length,
      (i) => _BookChapter(title: titles[i], body: _germanBodies[i]),
    );
  }

  // ── Chinese Simplified ────────────────────────────────────────────────────

  static const _chineseBodies = <String>[
    // Ch0
    '''股票作手回忆录
埃德温·勒菲弗

本版本遵循英文经典的叙事脉络，以长篇阅读的形式呈现。这并非逐字翻译，而是一个叙事版本，让读者能够逐页跟随故事及其中的智慧。

故事从一个在报价板旁工作的男孩开始，他对价格的波动着迷。他观察到大人们因为几个点的变化而面色各异。在他理解金融语言之前，他已经明白，价格有着自己的语言。

这本书不只是关于赚钱。它关乎判断力、纪律、恐惧、贪婪，以及人们在市场与自己意见相左时选择无视市场的奇怪习惯。操盘手赢了、输了、重新崛起，并领悟到市场是一位严厉的老师。''',
    // Ch1
    '''我很小的时候就开始观察价格的变动。办公室有一块黑板，记录着行情报价，人们带着希望、恐惧和判断走进来。价格的微小变动，能让一张脸焕发光彩，也能让另一张脸阴云密布。

起初，我只是一个打工的男孩。行情报进来，我就记录下来。但日复一日做着同样的事，我开始注意到价格有自己的规律。它们的运动方式，并不完全像人们说的那样。有时，在原因尚未为人所知之前，价格就已经上涨了。

我对别人说什么越来越不感兴趣，对价格在做什么越来越着迷。说说而已很容易。用真金白银买卖，是另一回事。

从一个男孩的好奇心开始，这件事慢慢成了我生命的中心。我想知道价格何时准备好移动，哪些动作是假的，以及人群何时来得太晚。''',
    // Ch2
    '''第一次拿真钱冒险时，我并不认为自己是什么了不起的交易员。我只是相信，自己盯着那块黑板足够久了，能看到别人看不到的东西。

早期的成功是危险的。一个人赚了钱，就会忍不住相信，那钱是智慧的证明。我也不例外。几笔赢利让我建立了信心，而信心很快变成了想做更大仓位的欲望。

最初，市场似乎慷慨大方。但市场对于变得粗心的人，不会一直友善。它会让你赢得刚好足够让你变得大胆的数额，然后让你为把大胆误当成能力而付出代价。

我后来才明白，最昂贵的教训往往是那些你以为早已学会的教训。知道一条规则很容易。当钱真正在桌上的时候还能遵守，才是真正的考验。''',
    // Ch3
    '''人们喜欢在价格移动之后解释为什么。但价格往往在解释到来之前就已经动了。

我并不害怕在没有完美解释的情况下操作。我更害怕的是因为价格的走势与我的看法不符，就无视一个明确的信号。市场不会礼貌地解释自己。它只是动，交易员要决定要不要听。

新手常常交易的是"观点"。他们买入，因为公司很好，因为股票跌了很多，或者因为据说某个大人物在买。但市场不为有观点的人付钱。它为处在正确位置、处于正确时机的人付钱。

归根结底，价格是金钱真正行动的记录。''',
    // Ch4
    '''我很擅长捕捉小幅波动。但捕捉小幅波动和获得大收益，是两码事。

一个交易每一个小转折的人会变得很忙碌。他买、卖、拿利润、再开始。他看起来或许很熟练，但如果他把一个大趋势当成小波动来操作，他就会把最多的钱留在桌上。

大钱不是靠不停地动手赚来的。它是靠持有正确的仓位、让市场把它带得足够远而赚来的。

我很多次是对的，却仍然没有赚到本应赚到的钱。我卖得太早了。随着时间推移，我明白了：判断对了只是开始。正确地持有，才是更难的艺术。''',
    // Ch5
    '''每个交易员都会犯错。生存与毁灭的区别，在于他犯错之后做了什么。小亏损是市场无声的警告。如果被忽视，警告会变得更响亮、代价更大。

我不止一次地扩大了亏损。一开始我告诉自己价格会回来。最后，亏损变得如此之大，以至于我已经无法清晰地看待市场。

止损看起来像一种冷静的技巧，但实际上是一种情绪纪律。它要求你放下自尊，承认错误，并且放弃一个不久前还感觉确定无疑的想法。

小亏损是留在游戏中的代价。大亏损可能让你失去打下一手牌的能力。所以，第一次的亏损通常是最好的亏损。''',
    // Ch6
    '''华尔街一直充满小道消息。人们喜欢这些故事，因为它们让不确定性看起来可以管理。

但建立在别人一句话上的仓位是脆弱的。如果出了问题，交易员会等着别人来安抚，而不是自己读市场。

信息有价值，但不能取代判断。小道消息可以是调查的理由，但不是放弃责任的理由。

一个人可能碰巧靠别人的建议赚了钱。守住那笔钱是另一回事。如果他不知道为什么进入，他就不会知道什么时候退出。''',
    // Ch7
    '''大行情并不总是伴随着喧嚣开始。往往是悄无声息地开始。人群犹豫不决，消息不完整，而价格开始以越来越坚定的姿态向一个方向倾斜。

我观察的不只是价格，而是价格的行为。下跌后能反弹吗？这样的迹象往往在解释到来之前就已显现。

顺势而为需要勇气，但不是盲目的勇气。趋势交易不是预测未来的艺术。它是识别市场已经开始往哪里走的艺术。''',
    // Ch8
    '''市场上有很多聪明的人。但光靠知识并不能保证盈利。

危险在于，知识可能让一个人变得固执。如果他对一家公司了解太多，他可能会用"市场没有认识到他所知道的东西"来解释下跌的价格。他以为自己在捍卫事实，但往往只是在捍卫自己的结论。

谦逊不是无知。谦逊是即便经过仔细研究，也能说出"市场可能在展示我没有看到的东西"的能力。

当价格与想法背道而驰时，问题不是市场有没有冒犯我。问题是持仓的理由是否还存在。''',
    // Ch9
    '''亏损之后，很多人变得谨慎。大赚之后，很多人变得危险。盈利会让一个人相信，市场认可了他的优越性。

盈利之后最大的危险，是对规则的松懈。他提前入场，亏损比计划持有更久，并且忽视了他以前会遵守的信号。

大胜之后，交易员必须在自己心里重新变小。他必须在盈利变成骄傲之前，回归规则。''',
    // Ch10
    '''很多交易员认为不在市场中是浪费时间。事实并非如此。现金也是一种仓位。它给了一个人在真正的机会出现时采取行动的权利。

好的投机者不是那个总是很忙碌的人。他是那个知道何时需要行动、何时不动更明智的人。

我很多次因为无法停下来而亏钱。我以为是市场在召唤我，但往往是我自己抓着市场不放。''',
    // Ch11
    '''当价格下跌，买入更多可以降低平均成本。算术很简单，而这种简单让人感到安慰。但简单的算术并不总是好的判断。

下跌的价格可能有其原因。如果一个人在不理解最初判断是否仍然成立的情况下继续买入，他可能只是在放大错误。

向下摊平并不总是错的，但没有计划的向下摊平是危险的。额外的买入往往是情绪上的自我保护。

市场不在乎一个人的平均成本有没有改善。它只关心供求、恐惧、贪婪和资金。''',
    // Ch12
    '''起初，人群对一个行情持怀疑态度。然后注意到了。然后相信了。最后确信了，而最后的确信往往发生在最高价位。

下跌也是如此。起初，下跌被称为暂时的。后来变得令人恐惧。最终，那些再也承受不了恐惧的人，在绝望中卖出。

嘲笑人群很容易，但任何交易员都可能成为其中一员。当一个人与他人一同兴奋时，他的思考往往会变差。

交易员需要观察人群的情绪，而不是成为它的奴隶。当信心变得过热，风险往往也随之升温。''',
    // Ch13
    '''杠杆不仅放大盈亏，也放大情绪。小幅上涨变成巨大的喜悦。小幅下跌变成巨大的恐惧。

用了杠杆的交易员需要的是纪律，而不仅仅是勇气。他必须知道何时减仓、何时停手，以及自己能承受多少痛苦。

市场对巨大的欲望并不会更仁慈。它往往利用这种欲望，让人待得太久、交易过度、冒险过多。''',
    // Ch14
    '''等待一个好机会是痛苦的。当价格在动，人就会觉得自己该做点什么。什么都不做，感觉像是落后了。

但等待不是空白的时间。它保存了判断力、资本和情绪能量。一个等待的人，进场时已经有了理由。

好的交易从交易之前就开始了。它从等待中开始。''',
    // Ch15
    '''亏损之后，快速挽回的欲望很强烈。失去的钱带着自尊、愤怒和屈辱。这让下一笔交易变得危险。

报复性交易不是在和市场交易，而是在和自己的伤口交易。市场不知道一个交易员刚刚亏了钱，即便知道，它也不在乎。

亏损之后，最好的第一步往往是休息。钱不会因愤怒而回来。如果能回来的话，是靠之后更好的判断力。''',
    // Ch16
    '''在投机中，记忆是不可靠的。一个人清楚地记得自己的成功，而对失误有各种解释。随着时间推移，错误变得合理，胜利在想象中越来越大。

记录让自我欺骗变得更难。我为什么进场？我看到了什么？书面答案揭示了记忆所隐藏的模式。

学习市场也是学习自己。数字在外面，但很多错误从内部开始。''',
    // Ch17
    '''市场每天都在波动。如果把每一次波动都当成重要信号，交易员很快就会精疲力竭。有些动作很重要，其他的只是噪音。

交易员必须区分正常反应和性质变化。在市场考验他之前，交易员就必须决定，什么条件让他留在仓位里，什么条件让他出来。

没有标准的人，随着每一个价格而动。有标准的人，仍然可以感受到恐惧，但他有一个可以回归的地方。''',
    // Ch18
    '''很多交易员只复盘亏损。但赢利的交易也需要审视。盈利并不证明过程是正确的。

有时一个人承担了愚蠢的风险却赚了钱。市场有时会奖励不好的行为，而这种奖励可能是危险的。

问题不只是钱赚到了没有，而是这个决策能否在不依赖运气的情况下重复。

交易员对待盈利，应该和对待亏损一样严格。否则，盈利会成为未来粗心大意的种子。''',
    // Ch19
    '''有很多人曾经在市场上赚过大钱。长期存活下来的，更少。大收益显而易见。存活更为低调。

存活者了解自己的弱点。他知道什么时候自己变得不耐烦，哪种亏损会困扰他，哪类故事会诱惑他。他研究自己，就像研究价格一样。

这就是为什么这本书还活着。它不只是关于旧日的市场，而是关于人在市场上的本性，而人的本性没有太大变化。''',
    // Ch20
    '''市场教了我很多。价格比话语更诚实。亏损小了好。大利润更多来自耐心的判断，而非不停翻动的手。

但知道这些还不够。当钱真正在桌上时，这些都要做到。大多数人在这里失败。

交易员打两场仗。一场对抗市场，一场对抗自己。市场明天还会开。记住这一点的人，今天不需要把一切都押上。今天活下去，就是保留了明天迎接机会的权利。''',
  ];

  static List<_BookChapter> _withZhTitles() {
    const titles = [
      '关于本书',
      '1. 黑板前的男孩',
      '2. 初尝胜利的滋味',
      '3. 市场不等待解释',
      '4. 猜对得快，不等于赚得多',
      '5. 判断错了就缩小的艺术',
      '6. 谣言驱动人，价格驱动钱',
      '7. 趋势的无声开始',
      '8. 知道太多的陷阱',
      '9. 为什么盈利可以让人变得更危险',
      '10. 休息也是一种仓位',
      '11. 向下摊平的危险',
      '12. 人群总是最后才确信',
      '13. 杠杆也放大了人心',
      '14. 等待是痛苦的',
      '15. 市场不允许报复',
      '16. 好的判断来自记录',
      '17. 主要走势与噪音',
      '18. 成功的交易也需要复盘',
      '19. 能存活的人',
      '20. 最后一页',
    ];
    return List.generate(
      _chineseBodies.length,
      (i) => _BookChapter(title: titles[i], body: _chineseBodies[i]),
    );
  }

  // ── Chinese Traditional ───────────────────────────────────────────────────

  static const _chineseTwBodies = <String>[
    // Ch0
    '''股票作手回憶錄
埃德溫·勒菲弗

本版本遵循英文經典的敘事脈絡，以長篇閱讀的形式呈現。這並非逐字翻譯，而是一個敘事版本，讓讀者能夠逐頁跟隨故事及其中的智慧。

故事從一個在報價板旁工作的男孩開始，他對價格的波動著迷。他觀察到大人們因為幾個點的變化而面色各異。在他理解金融語言之前，他已經明白，價格有著自己的語言。

這本書不只是關於賺錢。它關乎判斷力、紀律、恐懼、貪婪，以及人們在市場與自己意見相左時選擇無視市場的奇怪習慣。操盤手贏了、輸了、重新崛起，並領悟到市場是一位嚴厲的老師。''',
    // Ch1
    '''我很小的時候就開始觀察價格的變動。辦公室有一塊黑板，記錄著行情報價，人們帶著希望、恐懼和判斷走進來。價格的微小變動，能讓一張臉煥發光彩，也能讓另一張臉陰雲密佈。

起初，我只是一個打工的男孩。行情報進來，我就記錄下來。但日復一日做著同樣的事，我開始注意到價格有自己的規律。它們的運動方式，並不完全像人們說的那樣。有時，在原因尚未為人所知之前，價格就已經上漲了。

我對別人說什麼越來越不感興趣，對價格在做什麼越來越著迷。說說而已很容易。用真金白銀買賣，是另一回事。

從一個男孩的好奇心開始，這件事慢慢成了我生命的中心。我想知道價格何時準備好移動，哪些動作是假的，以及人群何時來得太晚。''',
    // Ch2
    '''第一次拿真錢冒險時，我並不認為自己是什麼了不起的交易員。我只是相信，自己盯著那塊黑板足夠久了，能看到別人看不到的東西。

早期的成功是危險的。一個人賺了錢，就會忍不住相信，那錢是智慧的證明。我也不例外。幾筆贏利讓我建立了信心，而信心很快變成了想做更大倉位的慾望。

最初，市場似乎慷慨大方。但市場對於變得粗心的人，不會一直友善。它會讓你贏得剛好足夠讓你變得大膽的數額，然後讓你為把大膽誤當成能力而付出代價。

我後來才明白，最昂貴的教訓往往是那些你以為早已學會的教訓。知道一條規則很容易。當錢真正在桌上的時候還能遵守，才是真正的考驗。''',
    // Ch3
    '''人們喜歡在價格移動之後解釋為什麼。但價格往往在解釋到來之前就已經動了。

我並不害怕在沒有完美解釋的情況下操作。我更害怕的是因為價格的走勢與我的看法不符，就無視一個明確的訊號。市場不會禮貌地解釋自己。它只是動，交易員要決定要不要聽。

新手常常交易的是「觀點」。但市場不為有觀點的人付錢。它為處在正確位置、處於正確時機的人付錢。

歸根結底，價格是金錢真正行動的記錄。''',
    // Ch4
    '''我很擅長捕捉小幅波動。但捕捉小幅波動和獲得大收益，是兩碼事。

一個交易每一個小轉折的人會變得很忙碌。他買、賣、拿利潤、再開始。他看起來或許很熟練，但如果他把一個大趨勢當成小波動來操作，他就會把最多的錢留在桌上。

大錢不是靠不停地動手賺來的。它是靠持有正確的倉位、讓市場把它帶得足夠遠而賺來的。

我很多次是對的，卻仍然沒有賺到本應賺到的錢。我賣得太早了。隨著時間推移，我明白了：判斷對了只是開始。正確地持有，才是更難的藝術。''',
    // Ch5
    '''每個交易員都會犯錯。生存與毀滅的區別，在於他犯錯之後做了什麼。小虧損是市場無聲的警告。如果被忽視，警告會變得更響亮、代價更大。

我不止一次地擴大了虧損。一開始我告訴自己價格會回來。最後，虧損變得如此之大，以至於我已經無法清晰地看待市場。

止損看起來像一種冷靜的技巧，但實際上是一種情緒紀律。它要求你放下自尊，承認錯誤，並且放棄一個不久前還感覺確定無疑的想法。

小虧損是留在遊戲中的代價。大虧損可能讓你失去打下一手牌的能力。所以，第一次的虧損通常是最好的虧損。''',
    // Ch6
    '''華爾街一直充滿小道消息。人們喜歡這些故事，因為它們讓不確定性看起來可以管理。

但建立在別人一句話上的倉位是脆弱的。如果出了問題，交易員會等著別人來安撫，而不是自己讀市場。

資訊有價值，但不能取代判斷。小道消息可以是調查的理由，但不是放棄責任的理由。

一個人可能碰巧靠別人的建議賺了錢。守住那筆錢是另一回事。如果他不知道為什麼進入，他就不會知道什麼時候退出。''',
    // Ch7
    '''大行情並不總是伴隨著喧囂開始。往往是悄無聲息地開始。人群猶豫不決，消息不完整，而價格開始以越來越堅定的姿態向一個方向傾斜。

我觀察的不只是價格，而是價格的行為。下跌後能反彈嗎？這樣的跡象往往在解釋到來之前就已顯現。

順勢而為需要勇氣，但不是盲目的勇氣。趨勢交易不是預測未來的藝術。它是識別市場已經開始往哪裡走的藝術。''',
    // Ch8
    '''市場上有很多聰明的人。但光靠知識並不能保證獲利。

危險在於，知識可能讓一個人變得固執。如果他對一家公司了解太多，他可能會用「市場沒有認識到他所知道的東西」來解釋下跌的價格。

謙遜不是無知。謙遜是即便經過仔細研究，也能說出「市場可能在展示我沒有看到的東西」的能力。

當價格與想法背道而馳時，問題不是市場有沒有冒犯我。問題是持倉的理由是否還存在。''',
    // Ch9
    '''虧損之後，很多人變得謹慎。大賺之後，很多人變得危險。獲利之後最大的危險，是對規則的鬆懈。

大勝之後，交易員必須在自己心裡重新變小。他必須在獲利變成驕傲之前，回歸規則。''',
    // Ch10
    '''很多交易員認為不在市場中是浪費時間。事實並非如此。現金也是一種倉位。它給了一個人在真正的機會出現時採取行動的權利。

好的投機者不是那個總是很忙碌的人。他是那個知道何時需要行動、何時不動更明智的人。

我很多次因為無法停下來而虧錢。我以為是市場在召喚我，但往往是我自己抓著市場不放。''',
    // Ch11
    '''當價格下跌，買入更多可以降低平均成本。算術很簡單，而這種簡單讓人感到安慰。但簡單的算術並不總是好的判斷。

下跌的價格可能有其原因。如果一個人在不理解最初判斷是否仍然成立的情況下繼續買入，他可能只是在放大錯誤。

向下攤平並不總是錯的，但沒有計劃的向下攤平是危險的。

市場不在乎一個人的平均成本有沒有改善。它只關心供求、恐懼、貪婪和資金。''',
    // Ch12
    '''起初，人群對一個行情持懷疑態度。然後注意到了。然後相信了。最後確信了，而最後的確信往往發生在最高價位。

下跌也是如此。起初，下跌被稱為暫時的。後來變得令人恐懼。最終，那些再也承受不了恐懼的人，在絕望中賣出。

嘲笑人群很容易，但任何交易員都可能成為其中一員。交易員需要觀察人群的情緒，而不是成為它的奴隸。''',
    // Ch13
    '''槓桿不僅放大盈虧，也放大情緒。小幅上漲變成巨大的喜悅。小幅下跌變成巨大的恐懼。

用了槓桿的交易員需要的是紀律，而不僅僅是勇氣。他必須知道何時減倉、何時停手，以及自己能承受多少痛苦。

市場對巨大的慾望並不會更仁慈。它往往利用這種慾望，讓人待得太久、交易過度、冒險過多。''',
    // Ch14
    '''等待一個好機會是痛苦的。當價格在動，人就會覺得自己該做點什麼。什麼都不做，感覺像是落後了。

但等待不是空白的時間。它保存了判斷力、資本和情緒能量。一個等待的人，進場時已經有了理由。

好的交易從交易之前就開始了。它從等待中開始。''',
    // Ch15
    '''虧損之後，快速挽回的慾望很強烈。失去的錢帶著自尊、憤怒和屈辱。這讓下一筆交易變得危險。

報復性交易不是在和市場交易，而是在和自己的傷口交易。市場不知道一個交易員剛剛虧了錢，即便知道，它也不在乎。

虧損之後，最好的第一步往往是休息。錢不會因憤怒而回來。如果能回來的話，是靠之後更好的判斷力。''',
    // Ch16
    '''在投機中，記憶是不可靠的。一個人清楚地記得自己的成功，而對失誤有各種解釋。隨著時間推移，錯誤變得合理，勝利在想象中越來越大。

記錄讓自我欺騙變得更難。我為什麼進場？我看到了什麼？書面答案揭示了記憶所隱藏的模式。

學習市場也是學習自己。數字在外面，但很多錯誤從內部開始。''',
    // Ch17
    '''市場每天都在波動。如果把每一次波動都當成重要訊號，交易員很快就會精疲力竭。有些動作很重要，其他的只是雜音。

在市場考驗他之前，交易員就必須決定，什麼條件讓他留在倉位裡，什麼條件讓他出來。

沒有標準的人，隨著每一個價格而動。有標準的人，仍然可以感受到恐懼，但他有一個可以回歸的地方。''',
    // Ch18
    '''很多交易員只複盤虧損。但獲利的交易也需要審視。獲利並不證明過程是正確的。

有時一個人承擔了愚蠢的風險卻賺了錢。市場有時會獎勵不好的行為，而這種獎勵可能是危險的。

問題不只是錢賺到了沒有，而是這個決策能否在不依賴運氣的情況下重複。

交易員對待獲利，應該和對待虧損一樣嚴格。否則，獲利會成為未來粗心大意的種子。''',
    // Ch19
    '''有很多人曾經在市場上賺過大錢。長期存活下來的，更少。大收益顯而易見。存活更為低調。

存活者了解自己的弱點。他知道什麼時候自己變得不耐煩，哪種虧損會困擾他，哪類故事會誘惑他。他研究自己，就像研究價格一樣。

這就是為什麼這本書還活著。它不只是關於舊日的市場，而是關於人在市場上的本性，而人的本性沒有太大變化。''',
    // Ch20
    '''市場教了我很多。價格比話語更誠實。虧損小了好。大利潤更多來自耐心的判斷，而非不停翻動的手。

但知道這些還不夠。當錢真正在桌上時，這些都要做到。大多數人在這裡失敗。

交易員打兩場仗。一場對抗市場，一場對抗自己。市場明天還會開。記住這一點的人，今天不需要把一切都押上。今天活下去，就是保留了明天迎接機會的權利。''',
  ];

  static List<_BookChapter> _withZhTwTitles() {
    const titles = [
      '關於本書',
      '1. 黑板前的男孩',
      '2. 初嘗勝利的滋味',
      '3. 市場不等待解釋',
      '4. 猜對得快，不等於賺得多',
      '5. 判斷錯了就縮小的藝術',
      '6. 謠言驅動人，價格驅動錢',
      '7. 趨勢的無聲開始',
      '8. 知道太多的陷阱',
      '9. 為什麼獲利可以讓人變得更危險',
      '10. 休息也是一種倉位',
      '11. 向下攤平的危險',
      '12. 人群總是最後才確信',
      '13. 槓桿也放大了人心',
      '14. 等待是痛苦的',
      '15. 市場不允許報復',
      '16. 好的判斷來自記錄',
      '17. 主要走勢與雜音',
      '18. 成功的交易也需要複盤',
      '19. 能存活的人',
      '20. 最後一頁',
    ];
    return List.generate(
      _chineseTwBodies.length,
      (i) => _BookChapter(title: titles[i], body: _chineseTwBodies[i]),
    );
  }

  @override
  Widget build(BuildContext context) => _KoreanBookReaderBase(
        bookTitle: '어느 주식투자자의 회상',
        prefsKey: 'long_form_book_reader_page',
        chapters: _chapters,
        localizedChapters: {
          'en': _withEnTitles(),
          'ja': _withJaTitles(),
          'es': _withEsTitles(),
          'pt': _withPtTitles(),
          'ru': _withRuTitles(),
          'fr': _withFrTitles(),
          'de': _withDeTitles(),
          'zh': _withZhTitles(),
          'zh_TW': _withZhTwTitles(),
        },
        localizedBookTitles: const {
          'en': 'Reminiscences of a Stock Operator',
          'ja': '株式トレーダーの回想録',
          'es': 'Memorias de un operador de bolsa',
          'pt': 'Memórias de um operador da bolsa',
          'ru': 'Воспоминания биржевого спекулянта',
          'fr': "Mémoires d'un opérateur de bourse",
          'de': 'Erinnerungen eines Börsenspekulanten',
          'zh': '股票作手回忆录',
          'zh_TW': '股票作手回憶錄',
        },
        useAppLocale: true,
      );
}
