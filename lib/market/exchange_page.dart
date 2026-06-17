part of '../main.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  static final defaultExchangeItems = [
    ExchangeListItem(
      id: 'usdIndex',
      symbolPath: 'TVC-DXY',
      color: _cyan,
      icon: Icons.attach_money_rounded,
    ),
    ExchangeListItem(
      id: 'usdKrw',
      symbolPath: 'FX_IDC-USDKRW',
      color: Colors.greenAccent,
      icon: Icons.attach_money_rounded,
    ),
    ExchangeListItem(
      id: 'usdJpy',
      symbolPath: 'FX-USDJPY',
      color: Colors.orangeAccent,
      icon: Icons.currency_yen_rounded,
    ),
    ExchangeListItem(
      id: 'eurUsd',
      symbolPath: 'FX-EURUSD',
      color: _blue,
      icon: Icons.euro_rounded,
    ),
    ExchangeListItem(
      id: 'usdRub',
      symbolPath: 'FX_IDC-USDRUB',
      color: Colors.redAccent,
      icon: Icons.currency_ruble_rounded,
    ),
    ExchangeListItem(
      id: 'usdTwd',
      symbolPath: 'FX_IDC-USDTWD',
      color: _purple,
      icon: Icons.paid_rounded,
    ),
    ExchangeListItem(
      id: 'usdCny',
      symbolPath: 'FX_IDC-USDCNY',
      color: Colors.amberAccent,
      icon: Icons.currency_yuan_rounded,
    ),
    ExchangeListItem(
      id: 'btcUsd',
      symbolPath: 'BITSTAMP-BTCUSD',
      color: Colors.amberAccent,
      icon: Icons.currency_bitcoin_rounded,
    ),
    exchangeCurrencyItem('usdGbp', 'GBP', Colors.lightBlueAccent),
    exchangeCurrencyItem('usdCad', 'CAD', Colors.redAccent),
    exchangeCurrencyItem('usdAud', 'AUD', Colors.greenAccent),
    exchangeCurrencyItem('usdNzd', 'NZD', Colors.tealAccent),
    exchangeCurrencyItem('usdChf', 'CHF', Colors.pinkAccent),
    exchangeCurrencyItem('usdSek', 'SEK', _blue),
    exchangeCurrencyItem('usdNok', 'NOK', _cyan),
    exchangeCurrencyItem('usdDkk', 'DKK', _purple),
    exchangeCurrencyItem('usdPln', 'PLN', Colors.orangeAccent),
    exchangeCurrencyItem('usdCzk', 'CZK', Colors.amberAccent),
    exchangeCurrencyItem('usdHuf', 'HUF', Colors.lightBlueAccent),
    exchangeCurrencyItem('usdTry', 'TRY', Colors.redAccent),
    exchangeCurrencyItem('usdMxn', 'MXN', Colors.greenAccent),
    exchangeCurrencyItem('usdBrl', 'BRL', Colors.tealAccent),
    exchangeCurrencyItem('usdArs', 'ARS', Colors.pinkAccent),
    exchangeCurrencyItem('usdClp', 'CLP', _blue),
    exchangeCurrencyItem('usdCop', 'COP', _cyan),
    exchangeCurrencyItem('usdPen', 'PEN', _purple),
    exchangeCurrencyItem('usdZar', 'ZAR', Colors.orangeAccent),
    exchangeCurrencyItem('usdEgp', 'EGP', Colors.amberAccent),
    exchangeCurrencyItem('usdSar', 'SAR', Colors.lightBlueAccent),
    exchangeCurrencyItem('usdAed', 'AED', Colors.redAccent),
    exchangeCurrencyItem('usdQar', 'QAR', Colors.greenAccent),
    exchangeCurrencyItem('usdKwd', 'KWD', Colors.tealAccent),
    exchangeCurrencyItem('usdIls', 'ILS', Colors.pinkAccent),
    exchangeCurrencyItem('usdInr', 'INR', _blue),
    exchangeCurrencyItem('usdIdr', 'IDR', _cyan),
    exchangeCurrencyItem('usdThb', 'THB', _purple),
    exchangeCurrencyItem('usdVnd', 'VND', Colors.orangeAccent),
    exchangeCurrencyItem('usdPhp', 'PHP', Colors.amberAccent),
    exchangeCurrencyItem('usdMyr', 'MYR', Colors.lightBlueAccent),
    exchangeCurrencyItem('usdSgd', 'SGD', Colors.redAccent),
    exchangeCurrencyItem('usdHkd', 'HKD', Colors.greenAccent),
    exchangeCurrencyItem('usdPkr', 'PKR', Colors.tealAccent),
    exchangeCurrencyItem('usdBdt', 'BDT', Colors.pinkAccent),
    exchangeCurrencyItem('usdLkr', 'LKR', _blue),
    exchangeCurrencyItem('usdKzt', 'KZT', _cyan),
    exchangeCurrencyItem('usdUah', 'UAH', _purple),
    exchangeCurrencyItem('usdRon', 'RON', Colors.orangeAccent),
    exchangeCurrencyItem('usdBgn', 'BGN', Colors.amberAccent),
    exchangeCurrencyItem('usdIsk', 'ISK', Colors.lightBlueAccent),
    exchangeCurrencyItem('usdMad', 'MAD', Colors.redAccent),
    exchangeCurrencyItem('usdNgn', 'NGN', Colors.greenAccent),
    exchangeCurrencyItem('usdKes', 'KES', Colors.tealAccent),
  ];

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  static const _orderKey = 'exchangeItemOrder';
  static const _favoriteKey = 'favoriteExchangeItemIds';
  late List<ExchangeListItem> exchangeItems =
      List.of(ExchangePage.defaultExchangeItems);
  Set<String> favoriteExchangeIds = {};
  final exchangeSearchController = TextEditingController();
  final exchangeListController = ScrollController();
  final exchangeItemKeys = <String, GlobalKey>{};
  Timer? exchangeSearchDebounce;

  @override
  void initState() {
    super.initState();
    loadOrder();
  }

  @override
  void dispose() {
    exchangeSearchDebounce?.cancel();
    exchangeSearchController.dispose();
    exchangeListController.dispose();
    super.dispose();
  }

  Future<void> loadOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final savedOrder = prefs.getStringList(_orderKey);
    favoriteExchangeIds = (prefs.getStringList(_favoriteKey) ?? []).toSet();

    final byId = {
      for (final item in ExchangePage.defaultExchangeItems) item.id: item,
    };
    final ordered = savedOrder == null || savedOrder.isEmpty
        ? <ExchangeListItem>[]
        : <ExchangeListItem>[
            for (final id in savedOrder)
              if (byId.containsKey(id)) byId[id]!,
          ];

    for (final item in ExchangePage.defaultExchangeItems) {
      if (!ordered.any((orderedItem) => orderedItem.id == item.id)) {
        ordered.add(item);
      }
    }

    if (!mounted) return;
    setState(() {
      exchangeItems = sortedByFavorites(ordered);
    });
  }

  Future<void> saveOrder() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _orderKey,
      exchangeItems.map((item) => item.id).toList(),
    );
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favoriteKey, favoriteExchangeIds.toList());
  }

  List<ExchangeListItem> sortedByFavorites(List<ExchangeListItem> items) {
    final favorites =
        items.where((item) => favoriteExchangeIds.contains(item.id)).toList();
    final others =
        items.where((item) => !favoriteExchangeIds.contains(item.id)).toList();

    return [
      ...favorites,
      ...others,
    ];
  }

  Future<void> toggleFavorite(ExchangeListItem item) async {
    setState(() {
      if (favoriteExchangeIds.contains(item.id)) {
        favoriteExchangeIds.remove(item.id);
      } else {
        favoriteExchangeIds.add(item.id);
      }

      exchangeItems = sortedByFavorites(exchangeItems);
    });

    await saveFavorites();
    await saveOrder();

    if (favoriteExchangeIds.contains(item.id) &&
        exchangeListController.hasClients) {
      exchangeListController.animateTo(
        0,
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void reorderItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    setState(() {
      final item = exchangeItems.removeAt(oldIndex);
      exchangeItems.insert(newIndex, item);
      exchangeItems = sortedByFavorites(exchangeItems);
    });

    saveOrder();
  }

  String titleForKey(AppLocalizations l10n, String key) {
    switch (key) {
      case 'usdIndex':
        return 'US Dollar Index';
      case 'usdKrw':
        return l10n.exchangeUsdKrw;
      case 'usdJpy':
        return l10n.exchangeUsdJpy;
      case 'eurUsd':
        return '${l10n.exchangeEurUsd} (EU)';
      case 'usdRub':
        return l10n.exchangeUsdRub;
      case 'usdTwd':
        return l10n.exchangeUsdTwd;
      case 'usdCny':
        return l10n.exchangeUsdCny;
      case 'btcUsd':
        return 'Bitcoin';
      default:
        final info = _exchangeSearchInfo[key];
        if (info == null) return key;

        return 'USD/${info[0]}  ${info[1]}';
    }
  }

  String symbolTextForKey(String key) {
    switch (key) {
      case 'usdIndex':
        return 'DXY - United States';
      case 'usdKrw':
        return 'USD/KRW - Korea';
      case 'usdJpy':
        return 'USD/JPY - Japan';
      case 'eurUsd':
        return 'EUR/USD - Spain / Portugal / France / Germany';
      case 'usdRub':
        return 'USD/RUB - Russia';
      case 'usdTwd':
        return 'USD/TWD - Taiwan';
      case 'usdCny':
        return 'USD/CNY - China';
      case 'btcUsd':
        return 'BTC/USD';
      default:
        final info = _exchangeSearchInfo[key];
        if (info == null) return key;

        return 'USD/${info[0]} - ${info[1]}';
    }
  }

  String badgeForItem(ExchangeListItem item) {
    switch (item.id) {
      case 'usdIndex':
        return 'DXY';
      case 'usdKrw':
        return 'KRW';
      case 'usdJpy':
        return 'JPY';
      case 'eurUsd':
        return 'EUR';
      case 'usdRub':
        return 'RUB';
      case 'usdTwd':
        return 'TWD';
      case 'usdCny':
        return 'CNY';
      case 'btcUsd':
        return 'BTC';
      default:
        return _exchangeSearchInfo[item.id]?[0] ?? item.id.toUpperCase();
    }
  }

  GlobalKey keyForItem(String id) {
    return exchangeItemKeys.putIfAbsent(id, () => GlobalKey());
  }

  String searchTextForItem(
    AppLocalizations l10n,
    ExchangeListItem item,
  ) {
    final info = _exchangeSearchInfo[item.id];

    return [
      titleForKey(l10n, item.id),
      symbolTextForKey(item.id),
      item.id,
      item.symbolPath,
      if (info != null) ...info,
    ].join(' ').toLowerCase();
  }

  void scheduleSearchJump(String value) {
    exchangeSearchDebounce?.cancel();

    if (value.trim().isEmpty) return;

    exchangeSearchDebounce = Timer(
      const Duration(milliseconds: 260),
      () => jumpToSearchResult(value),
    );
  }

  void jumpToSearchResult(String value) {
    final query = value.trim().toLowerCase();
    final l10n = AppLocalizations.of(context)!;

    if (query.isEmpty || !exchangeListController.hasClients) return;

    final index = exchangeItems.indexWhere((item) {
      return matchesSearchQuery(searchTextForItem(l10n, item), query);
    });

    if (index < 0) return;

    final maxOffset = exchangeListController.position.maxScrollExtent;
    final targetOffset = (index * 58.0).clamp(0.0, maxOffset);

    exchangeListController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );

    Future.delayed(const Duration(milliseconds: 320), () {
      if (!mounted) return;
      final context = exchangeItemKeys[exchangeItems[index].id]?.currentContext;

      if (context == null || !context.mounted) return;

      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        alignment: 0.12,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : const Color(0xFF0D1117);
    final surface = whiteMode ? _lightSurface : const Color(0xFF151B24);
    final line = whiteMode ? _lightLine : Colors.white.withValues(alpha: 0.08);
    final primaryText = whiteMode ? _lightText : Colors.white;
    final secondaryText = whiteMode ? _lightMuted : Colors.white54;
    final faintText = whiteMode ? const Color(0xFF94A3B8) : Colors.white38;

    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        title: Text(l10n.navExchange),
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
          currentTab: NavTab.exchange,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 4, 14, 6),
            child: TextField(
              controller: exchangeSearchController,
              onChanged: (value) {
                setState(() {});
                scheduleSearchJump(value);
              },
              onSubmitted: jumpToSearchResult,
              textInputAction: TextInputAction.search,
              style: TextStyle(
                color: primaryText,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Search FX',
                hintStyle: TextStyle(
                  color: faintText,
                  fontSize: 13,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: secondaryText,
                  size: 18,
                ),
                suffixIcon: exchangeSearchController.text.isEmpty
                    ? null
                    : IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: secondaryText,
                          size: 17,
                        ),
                        onPressed: () {
                          exchangeSearchController.clear();
                          setState(() {});
                        },
                      ),
                filled: true,
                fillColor: surface,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 9,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: line,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: (whiteMode ? _lightBlue : _blue).withValues(alpha: 0.65),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ReorderableListView.builder(
              scrollController: exchangeListController,
              buildDefaultDragHandles: false,
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 144),
              itemCount: exchangeItems.length,
              onReorderItem: reorderItems,
              itemBuilder: (context, index) {
                final item = exchangeItems[index];
                final title = titleForKey(l10n, item.id);
                final subtitle = symbolTextForKey(item.id);
                final isFavorite = favoriteExchangeIds.contains(item.id);

                return Container(
                  key: ValueKey(item.id),
                  margin: const EdgeInsets.only(bottom: 6),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => launchTradingViewPage(item.symbolPath),
                    child: Container(
                      key: keyForItem(item.id),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: surface,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: line,
                        ),
                      ),
                      child: Row(
                        children: [
                          buildTickerBadge(
                            badgeForItem(item),
                            item.color,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: primaryText,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  subtitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: secondaryText,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 34,
                            height: 32,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: Icon(
                                isFavorite
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: isFavorite
                                    ? Colors.amberAccent
                                    : faintText,
                                size: 20,
                              ),
                              onPressed: () => toggleFavorite(item),
                            ),
                          ),
                          ReorderableDelayedDragStartListener(
                            index: index,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.drag_handle_rounded,
                                color: faintText,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
