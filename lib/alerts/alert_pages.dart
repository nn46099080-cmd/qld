part of '../main.dart';

class NotificationHistoryPage extends StatefulWidget {
  const NotificationHistoryPage({
    super.key,
    this.items,
  });

  final List<AlertHistoryItem>? items;

  @override
  State<NotificationHistoryPage> createState() =>
      _NotificationHistoryPageState();
}

class _NotificationHistoryPageState extends State<NotificationHistoryPage> {
  List<AlertHistoryItem> items = [];

  @override
  void initState() {
    super.initState();
    clearAlertBadgeCount();

    final initialItems = widget.items;
    if (initialItems != null) {
      items = sortAlertHistoryItems(initialItems);
    } else {
      loadItems();
    }
  }

  Future<void> loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final savedItems = prefs.getStringList('alertHistory') ?? [];

    if (!mounted) return;

    setState(() {
      items = sortAlertHistoryItems(
        savedItems.map(AlertHistoryItem.fromJson),
      );
    });
  }

  Color colorForType(String type) {
    if (type.startsWith('profitTarget')) {
      return Colors.lightGreenAccent;
    }

    switch (type) {
      case _tradingViewInstallAlertType:
        return _cyan;
      case 'minus20':
        return Colors.green;
      case 'minus30':
        return Colors.orange;
      case 'minus40':
        return Colors.red;
      case 'minus50':
        return Colors.purple;
      case 'recovery20':
      case 'recovery30':
      case 'recovery40':
      case 'recovery50':
        return _cyan;
      case 'high':
        return Colors.lightGreenAccent;
      case 'marketOpen':
        return _blue;
      case 'coreAlert':
        return _commentGreen;
      case 'nasdaq200Breakdown':
      case 'qldMoveDown4':
      case 'portfolioCashLow':
      case 'fearGreedExtremeFear':
        return Colors.redAccent;
      case 'nasdaq200Breakout':
      case 'nasdaq200Recovery':
      case 'qldMoveUp4':
      case 'portfolioCashHigh':
      case 'fearGreedExtremeGreed':
        return _cyan;
      case _announcementAlertType:
      case 'notice':
      case 'push':
        return Colors.amberAccent;
      default:
        return Colors.blueGrey;
    }
  }

  Widget? pageForType(String type) {
    switch (type) {
      case 'minus20':
        return const Minus20Page();
      case 'minus30':
        return const Minus30Page();
      case 'minus40':
        return const Minus40Page();
      case 'minus50':
        return const Minus50Page();
      default:
        return null;
    }
  }

  bool isInquiryAlertType(String type) {
    return type == 'inquiryReply' || type == 'inquiryNew';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : const Color(0xFF0D1117);
    final surface = whiteMode ? _lightSurface : const Color(0xFF151B24);
    final primaryText = whiteMode ? _lightText : Colors.white;
    final secondaryText = whiteMode ? _lightMuted : Colors.white54;
    final faintText = whiteMode ? const Color(0xFF94A3B8) : Colors.white38;

    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        toolbarHeight: 48,
        title: Text(
          l10n.navAlert,
          style: TextStyle(
            color: primaryText,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          buildWhiteModeButton(context, iconSize: 20),
          buildLanguageMenuButton(context, iconSize: 20),
        ],
      ),
      bottomNavigationBar: buildFixedAdBottomBar(
        buildPersistentBottomNav(
          context,
          currentTab: NavTab.alert,
        ),
      ),
      body: items.isEmpty
          ? Center(
              child: Text(
                l10n.buySignalMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 13,
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(18, 6, 18, 144),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final item = items[index];
                final color = colorForType(item.type);
                final isAnnouncement = isAnnouncementAlertType(item.type);
                final isInstallItem = item.type == _tradingViewInstallAlertType;
                final backgroundColor = Color.alphaBlend(
                  color.withValues(alpha: whiteMode ? 0.04 : 0.08),
                  surface,
                );
                final dateText = DateFormat('yyyy.MM.dd HH:mm').format(
                  item.createdAt,
                );

                return InkWell(
                  borderRadius: BorderRadius.circular(9),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (_) => isInquiryAlertType(item.type)
                            ? const InquiryPage()
                            : AlertDetailPage(item: item),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(
                        color: color.withValues(alpha: 0.35),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: isAnnouncement || isInstallItem ? 28 : 3,
                          height: 30,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(
                              isAnnouncement || isInstallItem ? 9 : 6,
                            ),
                          ),
                          child: isAnnouncement || isInstallItem
                              ? Icon(
                                  isInstallItem
                                      ? Icons.install_mobile_rounded
                                      : Icons.campaign_rounded,
                                  color: Color(0xFF0D1117),
                                  size: 17,
                                )
                              : null,
                        ),
                        const SizedBox(width: 9),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.message,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color.alphaBlend(
                                    color.withValues(alpha: whiteMode ? 0.10 : 0.18),
                                    primaryText,
                                  ),
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w600,
                                  height: 1.18,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                isAnnouncement
                                    ? '${l10n.alertAnnouncementTitle} · $dateText'
                                    : isInstallItem
                                        ? 'TradingView · Play Store'
                                        : dateText,
                                style: TextStyle(
                                  color: isAnnouncement || isInstallItem
                                      ? color.withValues(alpha: 0.78)
                                      : secondaryText,
                                  fontSize: 9.5,
                                  fontWeight: isAnnouncement || isInstallItem
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: faintText,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class AlertDetailPage extends StatelessWidget {
  const AlertDetailPage({
    super.key,
    required this.item,
  });

  final AlertHistoryItem item;

  Color colorForType(String type) {
    if (type.startsWith('profitTarget')) {
      return Colors.lightGreenAccent;
    }

    switch (type) {
      case _tradingViewInstallAlertType:
        return _cyan;
      case 'minus20':
        return Colors.green;
      case 'minus30':
        return Colors.orange;
      case 'minus40':
        return Colors.red;
      case 'minus50':
        return Colors.purple;
      case 'recovery20':
      case 'recovery30':
      case 'recovery40':
      case 'recovery50':
        return _cyan;
      case 'high':
        return Colors.lightGreenAccent;
      case 'marketOpen':
        return _blue;
      case 'coreAlert':
        return _commentGreen;
      case 'nasdaq200Breakdown':
      case 'qldMoveDown4':
      case 'portfolioCashLow':
      case 'fearGreedExtremeFear':
        return Colors.redAccent;
      case 'nasdaq200Breakout':
      case 'nasdaq200Recovery':
      case 'qldMoveUp4':
      case 'portfolioCashHigh':
      case 'fearGreedExtremeGreed':
        return _cyan;
      case _announcementAlertType:
      case 'notice':
      case 'push':
        return Colors.amberAccent;
      default:
        return Colors.blueGrey;
    }
  }

  Widget? pageForType(String type) {
    switch (type) {
      case 'minus20':
        return const Minus20Page();
      case 'minus30':
        return const Minus30Page();
      case 'minus40':
        return const Minus40Page();
      case 'minus50':
        return const Minus50Page();
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final color = colorForType(item.type);
    final targetPage = pageForType(item.type);
    final detail = item.detail.trim().isEmpty
        ? localizedAlertDetailForType(l10n, item.type, item.message)
        : item.detail.trim();
    final linkUri = alertLinkUri(item, detail);
    final dateText = DateFormat('yyyy.MM.dd HH:mm').format(item.createdAt);
    final isAnnouncement = isAnnouncementAlertType(item.type);
    final isInstallItem = item.type == _tradingViewInstallAlertType;
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : const Color(0xFF0D1117);
    final surface = whiteMode ? _lightSurface : const Color(0xFF151B24);
    final primaryText = whiteMode ? _lightText : Colors.white;
    final secondaryText = whiteMode ? _lightMuted : Colors.white70;
    final mutedText = whiteMode ? const Color(0xFF94A3B8) : const Color(0x73FFFFFF);

    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        toolbarHeight: 48,
        title: Text(
          l10n.alertDetailTitle,
          style: TextStyle(
            color: primaryText,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          buildWhiteModeButton(context, iconSize: 20),
          buildLanguageMenuButton(context, iconSize: 20),
        ],
      ),
      bottomNavigationBar: buildFixedAdBottomBar(
        buildPersistentBottomNav(
          context,
          currentTab: NavTab.alert,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 144),
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: color.withValues(alpha: 0.42)),
              boxShadow: whiteMode
                  ? [
                      BoxShadow(
                        color: const Color(0xFF0F172A).withValues(alpha: 0.06),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ]
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: isAnnouncement || isInstallItem ? 38 : 4,
                      height: 42,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(
                          isAnnouncement || isInstallItem ? 12 : 99,
                        ),
                      ),
                      child: isAnnouncement || isInstallItem
                          ? Icon(
                              isInstallItem
                                  ? Icons.install_mobile_rounded
                                  : Icons.campaign_rounded,
                              color: Color(0xFF0D1117),
                              size: 22,
                            )
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.message,
                            style: TextStyle(
                              color: color,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.25,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            isAnnouncement
                                ? '${l10n.alertAnnouncementTitle} · $dateText'
                                : isInstallItem
                                    ? 'TradingView · Play Store'
                                    : dateText,
                            style: TextStyle(
                              color: isAnnouncement || isInstallItem
                                  ? color.withValues(alpha: 0.75)
                                  : mutedText,
                              fontSize: 11,
                              fontWeight: isAnnouncement || isInstallItem
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  detail,
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                if (linkUri != null &&
                    linkUri.hasScheme &&
                    (linkUri.scheme == 'http' ||
                        linkUri.scheme == 'https')) ...[
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 42,
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: color,
                        side: BorderSide(color: color.withValues(alpha: 0.45)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        await launchUrl(
                          linkUri,
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      icon: const Icon(Icons.open_in_new_rounded, size: 17),
                      label: Text(
                        l10n.alertDetailOpenLink,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (targetPage != null) ...[
            const SizedBox(height: 10),
            SizedBox(
              height: 44,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color.withValues(alpha: 0.18),
                  foregroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: color.withValues(alpha: 0.35)),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => targetPage,
                    ),
                  );
                },
                icon: const Icon(Icons.rule_rounded, size: 18),
                label: Text(
                  l10n.alertDetailOpenStrategy,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
