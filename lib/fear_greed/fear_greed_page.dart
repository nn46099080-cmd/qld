part of '../main.dart';

class FearGreedPage extends StatefulWidget {
  const FearGreedPage({super.key});

  @override
  State<FearGreedPage> createState() => _FearGreedPageState();
}

class _FearGreedPageState extends State<FearGreedPage> {
  FearGreedData? data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFearGreed();
  }

  Future<void> fetchFearGreed() async {
    setState(() {
      isLoading = true;
    });

    try {
      final parsed = await fetchFearGreedData();
      await saveCachedFearGreedData(parsed);

      if (!mounted) return;

      setState(() {
        data = parsed;
        isLoading = false;
      });
    } catch (_) {
      final cachedData = await loadCachedFearGreedData();
      if (!mounted) return;

      setState(() {
        data = cachedData;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final score = data?.score ?? 0;
    final color = fearGreedColorForScore(score);
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : const Color(0xFF0D1117);
    final surface = whiteMode ? _lightSurface : const Color(0xFF151B24);
    final surfaceAlt =
        whiteMode ? const Color(0xFFF8FAFC) : const Color(0xFF111923);
    final line = whiteMode ? _lightLine : Colors.white.withValues(alpha: 0.08);
    final primaryText = whiteMode ? _lightText : Colors.white;
    final mutedText = whiteMode ? const Color(0xFF94A3B8) : Colors.white54;

    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        title: Text(l10n.fearGreedTitle),
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
          currentTab: NavTab.fearGreed,
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : data == null
              ? Center(
                  child: Text(
                    l10n.fearGreedUnavailable,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: mutedText,
                      fontSize: 14,
                    ),
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 144),
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                      decoration: BoxDecoration(
                        color: surface,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: color.withValues(alpha: 0.45),
                        ),
                        boxShadow: whiteMode
                            ? [
                                BoxShadow(
                                  color: const Color(0xFF0F172A)
                                      .withValues(alpha: 0.06),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ]
                            : null,
                      ),
                      child: Column(
                        children: [
                          Text(
                            l10n.fearGreedSubtitle,
                            style: TextStyle(
                              color: whiteMode ? _lightMuted : Colors.white60,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          FearGreedGauge(
                            score: score,
                            color: color,
                            labels: [
                              l10n.fearGreedExtremeFear,
                              l10n.fearGreedFear,
                              l10n.fearGreedNeutral,
                              l10n.fearGreedGreed,
                              l10n.fearGreedExtremeGreed,
                            ],
                            trackColor: whiteMode
                                ? const Color(0xFFE2E8F0)
                                : Colors.white.withValues(alpha: 0.075),
                            labelColor:
                                whiteMode ? _lightMuted : Colors.white60,
                            tickLabelColor: whiteMode
                                ? const Color(0xFF64748B)
                                : Colors.white54,
                            scoreSubTextColor: whiteMode
                                ? const Color(0xFF64748B)
                                : Colors.white54,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            localizedFearGreedRating(
                              l10n,
                              score,
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: color,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (data!.updatedAt != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                DateFormat('yyyy.MM.dd HH:mm')
                                    .format(data!.updatedAt!),
                                style: TextStyle(
                                  color: whiteMode
                                      ? const Color(0xFF94A3B8)
                                      : Colors.white38,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                      decoration: BoxDecoration(
                        color: surfaceAlt,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: line,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 4,
                            height: 18,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(99),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              l10n.fearGreedIndicatorsTitle,
                              style: TextStyle(
                                color: primaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      l10n.fearGreedFaqTitle,
                      style: TextStyle(
                        color: primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    buildFearGreedInfoCard(
                      l10n.fearGreedWhatTitle,
                      l10n.fearGreedWhatBody,
                    ),
                    buildFearGreedInfoCard(
                      l10n.fearGreedCalculatedTitle,
                      l10n.fearGreedCalculatedBody,
                    ),
                    buildFearGreedInfoCard(
                      l10n.fearGreedFrequencyTitle,
                      l10n.fearGreedFrequencyBody,
                    ),
                    buildFearGreedInfoCard(
                      l10n.fearGreedUseTitle,
                      l10n.fearGreedUseBody,
                    ),
                  ],
                ),
    );
  }

  Widget buildFearGreedInfoCard(
    String title,
    String body,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: isWhiteModeEnabled(context)
            ? _lightSurface
            : const Color(0xFF151B24),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isWhiteModeEnabled(context)
              ? _lightLine
              : Colors.white.withValues(alpha: 0.07),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isWhiteModeEnabled(context) ? _lightText : Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            body,
            style: TextStyle(
              color: isWhiteModeEnabled(context) ? _lightMuted : Colors.white70,
              fontSize: 12,
              height: 1.42,
            ),
          ),
        ],
      ),
    );
  }
}

String localizedFearGreedRating(
  AppLocalizations l10n,
  double score,
) {
  if (score <= 25) return l10n.fearGreedExtremeFear;
  if (score <= 45) return l10n.fearGreedFear;
  if (score <= 55) return l10n.fearGreedNeutral;
  if (score <= 75) return l10n.fearGreedGreed;
  return l10n.fearGreedExtremeGreed;
}

String localizedAlertDetailForType(
  AppLocalizations l10n,
  String type,
  String fallback,
) {
  if (type.startsWith('profitTarget')) {
    return fallback;
  }

  switch (type) {
    case 'minus20':
      return '${l10n.minus20ActionText}\n\n${l10n.minus20CashText}';
    case 'minus30':
      return '${l10n.minus30ActionText}\n\n${l10n.minus30BuyRuleText}';
    case 'minus40':
      return '${l10n.minus40ActionText}\n\n${l10n.minus40HoldText}';
    case 'minus50':
      return '${l10n.minus50ActionText}\n\n${l10n.minus50AfterText}';
    case 'recovery20':
    case 'recovery30':
    case 'recovery40':
    case 'recovery50':
      return l10n.alertDetailRecovery;
    case 'high':
      return l10n.alertDetailNewHigh;
    case 'marketOpen':
      return l10n.alertDetailMarketOpen;
    case 'nasdaq200Breakdown':
      return l10n.alertDetailNasdaq200Breakdown;
    case 'nasdaq200Breakout':
    case 'nasdaq200Recovery':
      return l10n.alertDetailNasdaq200Breakout;
    case 'qldMoveUp4':
    case 'qldMoveDown4':
      return localizedSimpleQldMoveAlertDetail(Locale(l10n.localeName));
    case 'portfolioCashHigh':
      return l10n.alertDetailPortfolioCashHigh;
    case 'portfolioCashLow':
      return l10n.alertDetailPortfolioCashLow;
    case 'fearGreedExtremeFear':
    case 'fearGreedExtremeGreed':
      return l10n.fearGreedUseBody;
    case 'coreAlert':
      return localizedCoreAlertSubtitle(Locale(l10n.localeName));
    case _announcementAlertType:
    case 'notice':
    case 'push':
      return fallback;
    default:
      return fallback;
  }
}

class FearGreedGauge extends StatelessWidget {
  const FearGreedGauge({
    super.key,
    required this.score,
    required this.color,
    required this.labels,
    required this.trackColor,
    required this.labelColor,
    required this.tickLabelColor,
    required this.scoreSubTextColor,
  });

  final double score;
  final Color color;
  final List<String> labels;
  final Color trackColor;
  final Color labelColor;
  final Color tickLabelColor;
  final Color scoreSubTextColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 164,
      child: CustomPaint(
        painter: _FearGreedGaugePainter(
          score: score,
          color: color,
          labels: labels,
          trackColor: trackColor,
          labelColor: labelColor,
          tickLabelColor: tickLabelColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 58),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  score.toStringAsFixed(0),
                  style: TextStyle(
                    color: color,
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '/ 100',
                  style: TextStyle(
                    color: scoreSubTextColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FearGreedGaugePainter extends CustomPainter {
  const _FearGreedGaugePainter({
    required this.score,
    required this.color,
    required this.labels,
    required this.trackColor,
    required this.labelColor,
    required this.tickLabelColor,
  });

  final double score;
  final Color color;
  final List<String> labels;
  final Color trackColor;
  final Color labelColor;
  final Color tickLabelColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height - 10);
    final radius = math.min(size.width * 0.46, size.height * 0.92);
    final strokeWidth = math.max(26.0, radius * 0.22);
    final rect = Rect.fromCircle(
      center: center,
      radius: radius,
    );
    const startAngle = math.pi;
    const totalAngle = math.pi;
    final bgPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    for (var i = 0; i < 5; i++) {
      final startValue = _fearGreedZoneBounds[i];
      final endValue = _fearGreedZoneBounds[i + 1];
      final segmentStartAngle = startAngle + totalAngle * (startValue / 100);
      final segmentSweep = totalAngle * ((endValue - startValue) / 100);

      bgPaint.color =
          i == scoreSegment ? color.withValues(alpha: 0.35) : trackColor;
      canvas.drawArc(
        rect,
        segmentStartAngle + 0.015,
        segmentSweep - 0.03,
        false,
        bgPaint,
      );
    }

    for (final value in [0, 25, 50, 75, 100]) {
      final angle = startAngle + totalAngle * (value / 100);
      _drawText(
        canvas,
        '$value',
        Offset(
          center.dx + math.cos(angle) * (radius - strokeWidth * 1.05),
          center.dy + math.sin(angle) * (radius - strokeWidth * 1.05),
        ),
        11,
        tickLabelColor,
        FontWeight.w600,
      );
    }

    for (var i = 0; i < labels.length && i < 5; i++) {
      final midpoint =
          (_fearGreedZoneBounds[i] + _fearGreedZoneBounds[i + 1]) / 2;
      final angle = startAngle + totalAngle * (midpoint / 100);
      _drawText(
        canvas,
        labels[i],
        Offset(
          center.dx + math.cos(angle) * (radius + strokeWidth * 0.05),
          center.dy + math.sin(angle) * (radius + strokeWidth * 0.05),
        ),
        labels[i].length > 9 ? 8.5 : 10,
        i == scoreSegment ? color : labelColor,
        FontWeight.w600,
      );
    }

    final clampedScore = score.clamp(0, 100).toDouble();
    final needleAngle = startAngle + totalAngle * (clampedScore / 100);
    final needleEnd = Offset(
      center.dx + math.cos(needleAngle) * (radius - strokeWidth * 0.55),
      center.dy + math.sin(needleAngle) * (radius - strokeWidth * 0.55),
    );
    final needlePaint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(center, needleEnd, needlePaint);
    canvas.drawCircle(
      center,
      8,
      Paint()..color = color,
    );
  }

  int get scoreSegment {
    return fearGreedSegmentForScore(score);
  }

  void _drawText(
    Canvas canvas,
    String text,
    Offset center,
    double fontSize,
    Color color,
    FontWeight weight,
  ) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: weight,
          height: 1.05,
        ),
      ),
      maxLines: 2,
      textAlign: TextAlign.center,
      textDirection: ui.TextDirection.ltr,
    )..layout(maxWidth: 58);

    painter.paint(
      canvas,
      Offset(
        center.dx - painter.width / 2,
        center.dy - painter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant _FearGreedGaugePainter oldDelegate) {
    return oldDelegate.score != score ||
        oldDelegate.color != color ||
        oldDelegate.labels != labels ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.labelColor != labelColor ||
        oldDelegate.tickLabelColor != tickLabelColor;
  }
}
