part of '../main.dart';

class StrategyPage extends StatelessWidget {
  const StrategyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : const Color(0xFF0D1117);
    final primaryText = whiteMode ? _lightText : Colors.white;

    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.buyStrategy,
        ),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          buildWhiteModeButton(context),
          buildLanguageMenuButton(context),
        ],
      ),
      bottomNavigationBar: buildFixedAdBottomBar(
        buildPersistentBottomNav(
          context,
          currentTab: NavTab.strategy,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 144),
        children: [
          buildStrategyCard(
            context: context,
            color: Colors.blueGrey,
            percent: '0% ~ -20%',
            text: AppLocalizations.of(context)!.noBuyZone,
            page: const NoBuyZonePage(),
          ),
          buildStrategyCard(
            context: context,
            color: Colors.green,
            percent: '-20%',
            text: AppLocalizations.of(context)!.minus20Headline,
            page: const Minus20Page(),
          ),
          buildStrategyCard(
            context: context,
            color: Colors.orange,
            percent: '-30%',
            text: AppLocalizations.of(context)!.minus30Headline,
            page: const Minus30Page(),
          ),
          buildStrategyCard(
            context: context,
            color: Colors.red,
            percent: '-40%',
            text: AppLocalizations.of(context)!.minus40Headline,
            page: const Minus40Page(),
          ),
          buildStrategyCard(
            context: context,
            color: Colors.purple,
            percent: '-50%',
            text: AppLocalizations.of(context)!.minus50Headline,
            page: const Minus50Page(),
          ),
        ],
      ),
    );
  }

  Widget buildStrategyCard({
    required BuildContext context,
    required Color color,
    required String percent,
    required String text,
    required Widget page,
  }) {
    final whiteMode = isWhiteModeEnabled(context);
    final surface = whiteMode ? _lightSurface : const Color(0xFF151B24);
    final line = whiteMode ? _lightLine : Colors.white.withValues(alpha: 0.08);
    final primaryText = whiteMode ? _lightText : Colors.white;
    final faintText = whiteMode ? const Color(0xFF94A3B8) : Colors.white38;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => page,
            ),
          );
        },
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 76,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: line,
            ),
            boxShadow: whiteMode
                ? [
                    BoxShadow(
                      color: const Color(0xFF0F172A).withValues(alpha: 0.05),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              Container(
                width: 5,
                height: 44,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 88,
                child: Text(
                  percent,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.35,
                    color: primaryText,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                Icons.chevron_right_rounded,
                color: faintText,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget strategyDetailCard({
  required BuildContext context,
  required Color accent,
  required String title,
  required String text,
}) {
  final whiteMode = isWhiteModeEnabled(context);

  return Container(
    margin: const EdgeInsets.only(bottom: 14),
    padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
    decoration: BoxDecoration(
      color: whiteMode ? _lightSurface : const Color(0xFF151B24),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: whiteMode ? _lightLine : Colors.white.withValues(alpha: 0.08),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 4,
              height: 22,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: accent,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          text,
          style: TextStyle(
            color: whiteMode ? _lightMuted : Colors.white70,
            fontSize: 14,
            height: 1.55,
          ),
        ),
      ],
    ),
  );
}

String localizedStrategyHeadline(
  AppLocalizations l10n,
  String zone,
  String fallback,
) {
  switch (zone) {
    case '0% ~ -20%':
      return l10n.noBuyHeadline;
    case '-20%':
      return l10n.minus20Headline;
    case '-30%':
      return l10n.minus30Headline;
    case '-40%':
      return l10n.minus40Headline;
    case '-50%':
      return l10n.minus50Headline;
    default:
      return fallback;
  }
}

List<({String title, String text})> localizedStrategyActions(
  AppLocalizations l10n,
  String zone,
  List<({String title, String text})> fallback,
) {
  switch (zone) {
    case '0% ~ -20%':
      return [
        (title: l10n.noBuyActionTitle, text: l10n.noBuyActionText),
        (title: l10n.noBuyCashTitle, text: l10n.noBuyCashText),
        (title: l10n.noBuyAvoidTitle, text: l10n.noBuyAvoidText),
        (title: l10n.noBuyNextTitle, text: l10n.noBuyNextText),
      ];
    case '-20%':
      return [
        (title: l10n.minus20ActionTitle, text: l10n.minus20ActionText),
        (title: l10n.minus20BuyRuleTitle, text: l10n.minus20BuyRuleText),
        (title: l10n.minus20CashTitle, text: l10n.minus20CashText),
        (title: l10n.minus20AvoidTitle, text: l10n.minus20AvoidText),
      ];
    case '-30%':
      return [
        (title: l10n.minus30ActionTitle, text: l10n.minus30ActionText),
        (title: l10n.minus30BuyRuleTitle, text: l10n.minus30BuyRuleText),
        (
          title: l10n.minus30AdditionalTitle,
          text: l10n.minus30AdditionalText,
        ),
        (title: l10n.minus30AvoidTitle, text: l10n.minus30AvoidText),
      ];
    case '-40%':
      return [
        (title: l10n.minus40ActionTitle, text: l10n.minus40ActionText),
        (title: l10n.minus40BuyRuleTitle, text: l10n.minus40BuyRuleText),
        (title: l10n.minus40HoldTitle, text: l10n.minus40HoldText),
        (title: l10n.minus40AvoidTitle, text: l10n.minus40AvoidText),
      ];
    case '-50%':
      return [
        (title: l10n.minus50ActionTitle, text: l10n.minus50ActionText),
        (title: l10n.minus50BuyRuleTitle, text: l10n.minus50BuyRuleText),
        (title: l10n.minus50AfterTitle, text: l10n.minus50AfterText),
        (title: l10n.minus50AvoidTitle, text: l10n.minus50AvoidText),
      ];
    default:
      return fallback;
  }
}

Widget strategyActionPage({
  required BuildContext context,
  required String appBarTitle,
  required String zone,
  required String headline,
  required Color accent,
  required IconData icon,
  required List<({String title, String text})> actions,
}) {
  final l10n = AppLocalizations.of(context)!;
  final displayedHeadline = localizedStrategyHeadline(
    l10n,
    zone,
    headline,
  );
  final displayedActions = localizedStrategyActions(
    l10n,
    zone,
    actions,
  );
  final whiteMode = isWhiteModeEnabled(context);
  final pageBg = whiteMode ? _lightAppBg : const Color(0xFF0D1117);
  final surface = whiteMode ? _lightSurface : const Color(0xFF151B24);
  final primaryText = whiteMode ? _lightText : Colors.white;

  return Scaffold(
    backgroundColor: pageBg,
    appBar: AppBar(
      title: Text(appBarTitle),
      foregroundColor: primaryText,
      backgroundColor: pageBg,
      elevation: 0,
      actions: [
        buildWhiteModeButton(context),
        buildLanguageMenuButton(context),
      ],
    ),
    bottomNavigationBar: buildFixedAdBottomBar(
      buildPersistentBottomNav(
        context,
        currentTab: NavTab.strategy,
      ),
    ),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 144),
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
          decoration: BoxDecoration(
            color: surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: accent.withValues(alpha: 0.55)),
            boxShadow: whiteMode
                ? [
                    BoxShadow(
                      color: const Color(0xFF0F172A).withValues(alpha: 0.05),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accent.withValues(alpha: 0.14),
                  border: Border.all(color: accent.withValues(alpha: 0.45)),
                ),
                child: Icon(icon, color: accent, size: 25),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      zone,
                      style: TextStyle(
                        color: accent,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      displayedHeadline,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: primaryText,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        for (final action in displayedActions)
          strategyDetailCard(
            context: context,
            accent: accent,
            title: action.title,
            text: action.text,
          ),
      ],
    ),
  );
}

class NoBuyZonePage extends StatelessWidget {
  const NoBuyZonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return strategyActionPage(
      context: context,
      appBarTitle: AppLocalizations.of(context)!.noBuyZone,
      zone: '0% ~ -20%',
      headline: '?곕떽? 筌띲끉??疫뀀뜆?, ?袁㏉닊 30% ?醫?',
      accent: Colors.blueAccent,
      icon: Icons.lock_outline_rounded,
      actions: const [
        (
          title: '筌앸맩????곕짗',
          text:
              '?醫됲뇣 QLD/TQQQ 筌띲끉?????? ??녿뮸??덈뼄. 疫꿸퀣??QLD ??쑴夷???醫???랁??袁㏉닊 30%??筌왖??щ빍??',
        ),
        (
          title: '?袁㏉닊 疫꿸퀣?',
          text:
              '?袁㏉닊?? ??쇱벉 ??롮뵭 ?닌덉퍢???袁る립 ?袁⑸튋??낅빍?? ?怨몃뱟?關??遺얠뵬???袁㏉닊??餓κ쑴?좑쭪? ??녿뮸??덈뼄.',
        ),
        (
          title: '疫뀀뜆? ??곕짗',
          text:
              '揶쎛野꺿뫗????삘뀲??블??곕떽爰?筌띲끉???? ??녿뮸??덈뼄. -20% ?닌덉퍢????븍┛ ?袁㏉돱筌왖??疫꿸퀡?롧뵳?덈빍??',
        ),
        (
          title: '?ㅼ쓬 以鍮?',
          text:
              '-20%???袁⑤뼎??롢늺 ???땾????μ맄嚥?TQQQ ?怨룐뵲 筌띲끉?붺몴???뽰삂??餓Β??쑬? ??몃빍??',
        ),
      ],
    );
  }
}

class Minus20Page extends StatelessWidget {
  const Minus20Page({super.key});

  @override
  Widget build(BuildContext context) {
    return strategyActionPage(
      context: context,
      appBarTitle: AppLocalizations.of(context)!.minus20Title,
      zone: '-20%',
      headline: AppLocalizations.of(context)!.minus20Headline,
      accent: Colors.greenAccent,
      icon: Icons.savings_outlined,
      actions: const [
        (
          title: '筌앸맩????곕짗',
          text:
              'TQQQ?????땾????μ맄嚥??袁⑼폒 ?臾롮쓺 ?怨룐뵲 筌띲끉???몃빍?? ??疫뀀뜆釉????甕곕뜆肉??節? ??녿뮸??덈뼄.',
        ),
        (
          title: '筌띲끉??疫꿸퀣?',
          text:
              '?袁⑷퍥 ?袁㏉닊 餓??袁⑼폒 ???筌??????몃빍?? ???뼎?? 筌욊쑴????袁⑤빍???귐됰쾳????뽰삂??롫뮉 野껉퍔???덈뼄.',
        ),
        (
          title: '?꾧툑 愿由?',
          text:
              '???봔?브쑴???袁㏉닊?? 獄쏆꼶諭????ｍ돥??덈뼄. -30%, -40%, -50% ?닌덉퍢??????쑵鍮????몃빍??',
        ),
        (
          title: '疫뀀뜆? ??곕짗',
          text: 'TQQQ???源껎닋??띿쓺 ??苡???? ??녿뮸??덈뼄. -20%???袁⑹춦 ?λ뜆???닌덉퍢??낅빍??',
        ),
      ],
    );
  }
}

class Minus30Page extends StatelessWidget {
  const Minus30Page({super.key});

  @override
  Widget build(BuildContext context) {
    return strategyActionPage(
      context: context,
      appBarTitle: AppLocalizations.of(context)!.minus30Title,
      zone: '-30%',
      headline: AppLocalizations.of(context)!.minus30Headline,
      accent: Colors.orangeAccent,
      icon: Icons.trending_down_rounded,
      actions: const [
        (
          title: '筌앸맩????곕짗',
          text:
              '癰귣똻? ?袁㏉닊??20%筌??????곴퐣 TQQQ??筌띲끉???몃빍?? 雅뚯눖揆 ???袁㏉닊 ?μ빘釉???믪눘? ?類ㅼ뵥??몃빍??',
        ),
        (
          title: '筌띲끉??疫꿸퀣?',
          text:
              '?袁㏉닊??\$10,000????\$2,000筌?TQQQ???????몃빍?? ??? 80% ?袁㏉닊?? 獄쏆꼶諭??癰귣똻???몃빍??',
        ),
        (
          title: '?곕떽? ??곕짗',
          text:
              'QLD ?怨룐뵲 筌띲끉????醫????????筌? TQQQ ?곕떽? 筌띲끉?????쇱벉 ?닌덉퍢繹먮슣? 疫꿸퀡?롧뵳?덈빍??',
        ),
        (
          title: '疫뀀뜆? ??곕짗',
          text:
              '獄쏆꼶踰???類ㅻ뻿??랁??袁㏉닊????苡??怨? ??녿뮸??덈뼄. -40% ?닌덉퍢????????덈뼄???袁⑹젫嚥???筌욊낯???덈뼄.',
        ),
      ],
    );
  }
}

class Minus40Page extends StatelessWidget {
  const Minus40Page({super.key});

  @override
  Widget build(BuildContext context) {
    return strategyActionPage(
      context: context,
      appBarTitle: AppLocalizations.of(context)!.minus40Title,
      zone: '-40%',
      headline: AppLocalizations.of(context)!.minus40Headline,
      accent: Colors.redAccent,
      icon: Icons.warning_amber_rounded,
      actions: const [
        (
          title: '筌앸맩????곕짗',
          text:
              '??? ?袁㏉닊 餓?30%??TQQQ 筌띲끉????????몃빍?? ??? -30%?癒?퐣 ?????疫뀀뜆釉?? ??뽰뇚??랁??④쑴沅??몃빍??',
        ),
        (
          title: '筌띲끉??疫꿸퀣?',
          text:
              '??? ?袁㏉닊??\$8,000????\$2,400筌??????몃빍?? ??甕곕뜆肉?筌뤴뫀紐??怨? ??낅뮉 野껉퍔?????뼎??낅빍??',
        ),
        (
          title: '癰귣똻? 疫꿸퀣?',
          text:
              'QLD???醫???랁? TQQQ???④쑵?????쑴夷룡틦??筌???롡뵲??덈뼄. ?곕떽? ??롮뵭???袁⑹젫嚥??袁㏉닊????ｍ돥??덈뼄.',
        ),
        (
          title: '疫뀀뜆? ??곕짗',
          text:
              '?⑤벏猷??????疫꿸퀣??癰귣똻??브쑴?????筌왖 ??녿뮸??덈뼄. ??덈뻻???類ㅻ뼎 ??????袁⑸만 筌띲끉????????녿뮸??덈뼄.',
        ),
      ],
    );
  }
}

class Minus50Page extends StatelessWidget {
  const Minus50Page({super.key});

  @override
  Widget build(BuildContext context) {
    return strategyActionPage(
      context: context,
      appBarTitle: AppLocalizations.of(context)!.minus50Title,
      zone: '-50%',
      headline: AppLocalizations.of(context)!.minus50Headline,
      accent: Colors.purpleAccent,
      icon: Icons.bolt_rounded,
      actions: const [
        (
          title: '筌앸맩????곕짗',
          text:
              '癰귣똻?????? ?袁㏉닊 ?袁⑷퍥??TQQQ 筌띲끉????????몃빍?? ???닌덉퍢?? ?袁㏉닊 ?????筌띾뜆?筌???ｍ??낅빍??',
        ),
        (
          title: '筌띲끉??疫꿸퀣?',
          text:
              '-30%, -40%?癒?퐣 ??? ?????疫뀀뜆釉????뽰뇚??랁???쇱젫 ??λ툡 ??덈뮉 ?袁㏉닊筌?疫꿸퀣???곗쨮 ??몃빍??',
        ),
        (
          title: '??꾩뜎 ??곕짗',
          text:
              '?곕떽? ?袁㏉닊????룸┛筌??類?┛?怨몄몵嚥?TQQQ ?癒?뮉 QLD???怨룐뵲??몃빍?? ???뇧 ????????????筌욌쵐夷??몃빍??',
        ),
        (
          title: '疫뀀뜆? ??곕짗',
          text:
              '?癒?뼄?쒖쥓彛?癰귣떯????由??? ??녿뮸??덈뼄. ??살춸 ??떝?????ｋ┛ ??븐넞?癒?닊??곗쨮 ?곕떽? 筌띲끉???? ??녿뮸??덈뼄.',
        ),
      ],
    );
  }
}

class HoldPositionPage extends StatelessWidget {
  const HoldPositionPage({
    required this.lastZone,
    required this.accent,
    super.key,
  });

  final String lastZone;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return strategyActionPage(
      context: context,
      appBarTitle: l10n.holdPageTitle,
      zone: '$lastZone ${l10n.hold}',
      headline: l10n.holdHeadline,
      accent: accent,
      icon: Icons.check_circle_outline_rounded,
      actions: [
        (
          title: l10n.holdPositionTitle,
          text: l10n.holdPositionText,
        ),
        (
          title: l10n.holdActionTitle,
          text: l10n.holdActionText,
        ),
        (
          title: l10n.holdAvoidTitle,
          text: l10n.holdAvoidText,
        ),
        (
          title: l10n.holdResetTitle,
          text: l10n.holdResetText,
        ),
      ],
    );
  }
}

class BottomBannerAdCache extends ChangeNotifier {
  BottomBannerAdCache._();

  static final BottomBannerAdCache instance = BottomBannerAdCache._();

  final List<BannerAd> _readyAds = <BannerAd>[];
  bool _loading = false;
  Timer? _retryTimer;

  BannerAd? takeReadyAd() {
    if (_readyAds.isEmpty) {
      preload();
      return null;
    }
    final bannerAd = _readyAds.removeAt(0);
    preload();
    return bannerAd;
  }

  void preload() {
    if (!canRequestAds || _loading || _readyAds.isNotEmpty) return;

    _retryTimer?.cancel();
    _retryTimer = null;
    _loading = true;
    final bannerAd = BannerAd(
      adUnitId: _adMobBottomBannerUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _loading = false;
          _readyAds.add(ad as BannerAd);
          notifyListeners();
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Bottom AdMob failed to load: $error');
          _loading = false;
          ad.dispose();
          _retryTimer?.cancel();
          _retryTimer = Timer(const Duration(seconds: 12), preload);
          notifyListeners();
        },
      ),
    );
    unawaited(bannerAd.load());
  }
}

class StrategyBannerAd extends StatefulWidget {
  const StrategyBannerAd({super.key});

  @override
  State<StrategyBannerAd> createState() => _StrategyBannerAdState();
}

class _StrategyBannerAdState extends State<StrategyBannerAd> {
  BannerAd? _bannerAd;
  bool _loading = false;
  Timer? _retryTimer;

  @override
  void initState() {
    super.initState();
    if (!canRequestAds) return;

    BottomBannerAdCache.instance.preload();
    _loadBannerAd();
  }

  @override
  void dispose() {
    _retryTimer?.cancel();
    _bannerAd?.dispose();
    super.dispose();
  }

  void _loadBannerAd() {
    if (!canRequestAds || _loading || _bannerAd != null) return;

    _retryTimer?.cancel();
    _retryTimer = null;
    _loading = true;

    final bannerAd = BannerAd(
      adUnitId: _adMobBottomBannerUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }

          setState(() {
            _loading = false;
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Bottom AdMob failed to load: $error');
          ad.dispose();
          if (!mounted) return;

          setState(() {
            _loading = false;
            _bannerAd = null;
          });
          _retryTimer = Timer(const Duration(seconds: 12), _loadBannerAd);
        },
      ),
    );
    unawaited(bannerAd.load());
  }

  @override
  Widget build(BuildContext context) {
    if (!canRequestAds || _bannerAd == null) {
      return Container(
        height: AdSize.banner.height.toDouble(),
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.transparent,
      );
    }

    return Center(
      child: SizedBox(
        height: _bannerAd!.size.height.toDouble(),
        width: _bannerAd!.size.width.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      ),
    );
  }
}

class ExitDialogBannerAd extends StatelessWidget {
  const ExitDialogBannerAd({
    super.key,
    this.ad,
  });

  final BannerAd? ad;

  @override
  Widget build(BuildContext context) {
    final bannerAd = ad;
    if (!canRequestAds || bannerAd == null) {
      return SizedBox(
        height: AdSize.mediumRectangle.height.toDouble(),
        width: AdSize.mediumRectangle.width.toDouble(),
      );
    }

    return SizedBox(
      height: bannerAd.size.height.toDouble(),
      width: bannerAd.size.width.toDouble(),
      child: AdWidget(ad: bannerAd),
    );
  }
}
