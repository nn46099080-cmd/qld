part of '../main.dart';

class _BookChapter {
  const _BookChapter({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
}

class _KoreanBookReaderBase extends StatefulWidget {
  const _KoreanBookReaderBase({
    required this.bookTitle,
    required this.prefsKey,
    required this.chapters,
    this.englishChapters,
    this.englishBookTitle,
    this.japaneseChapters,
    this.japaneseBookTitle,
    this.localizedChapters,
    this.localizedBookTitles,
    this.useAppLocale = false,
  });

  final String bookTitle;
  final String prefsKey;
  final List<_BookChapter> chapters;
  final List<_BookChapter>? englishChapters;
  final String? englishBookTitle;
  final List<_BookChapter>? japaneseChapters;
  final String? japaneseBookTitle;
  // Locale-code → chapters map for locale-driven mode (e.g. 'es', 'zh_TW').
  final Map<String, List<_BookChapter>>? localizedChapters;
  // Locale-code → book title map for locale-driven mode.
  final Map<String, String>? localizedBookTitles;
  // When true, content language follows the app locale instead of manual toggle.
  final bool useAppLocale;

  @override
  State<_KoreanBookReaderBase> createState() => _KoreanBookReaderBaseState();
}

class _KoreanBookReaderBaseState extends State<_KoreanBookReaderBase> {
  final pageController = PageController();
  int currentPage = 0;
  // 0=Korean, 1=English, 2=Japanese
  int _langIndex = 0;

  bool get hasLanguageToggle =>
      widget.englishChapters != null || widget.japaneseChapters != null;

  @override
  void initState() {
    super.initState();
    _loadSavedState();
  }

  Future<void> _loadSavedState() async {
    final prefs = await SharedPreferences.getInstance();
    final pageKey = await userScopedPrefsKey(widget.prefsKey);
    final langKey = await userScopedPrefsKey('${widget.prefsKey}_language');
    final chapters = widget.chapters;
    final saved = (prefs.getInt(pageKey) ?? 0).clamp(0, chapters.length - 1);
    int savedLang = 0;
    if (hasLanguageToggle) {
      final stored = prefs.getInt(langKey);
      if (stored != null) {
        savedLang = stored;
      } else {
        // migrate from old bool storage
        final oldBool = prefs.getBool(langKey) ?? false;
        savedLang = oldBool ? 1 : 0;
      }
    }
    if (!mounted) return;
    setState(() {
      currentPage = saved;
      _langIndex = savedLang;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && pageController.hasClients) {
        pageController.jumpToPage(currentPage);
      }
    });
  }

  Future<void> _saveState() async {
    final prefs = await SharedPreferences.getInstance();
    final pageKey = await userScopedPrefsKey(widget.prefsKey);
    final langKey = await userScopedPrefsKey('${widget.prefsKey}_language');
    await prefs.setInt(pageKey, currentPage);
    if (hasLanguageToggle) await prefs.setInt(langKey, _langIndex);
  }

  void _changeLanguage(int index) {
    if (_langIndex == index) return;
    setState(() {
      _langIndex = index;
      currentPage = 0;
    });
    if (pageController.hasClients) {
      pageController.jumpToPage(0);
    }
    _saveState();
  }

  int _langIndexFromLocale(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    if (lang == 'en' && widget.englishChapters != null) return 1;
    if (lang == 'ja' && widget.japaneseChapters != null) return 2;
    return 0;
  }

  List<_BookChapter> _chaptersForLocale(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final lang = locale.languageCode;
    final country = locale.countryCode;
    if (widget.localizedChapters != null) {
      final key = (lang == 'zh' && country == 'TW') ? 'zh_TW' : lang;
      if (widget.localizedChapters!.containsKey(key)) {
        return widget.localizedChapters![key]!;
      }
    }
    if (lang == 'en' && widget.englishChapters != null)
      return widget.englishChapters!;
    if (lang == 'ja' && widget.japaneseChapters != null)
      return widget.japaneseChapters!;
    return widget.chapters;
  }

  String _bookTitleForLocale(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final lang = locale.languageCode;
    final country = locale.countryCode;
    if (widget.localizedBookTitles != null) {
      final key = (lang == 'zh' && country == 'TW') ? 'zh_TW' : lang;
      if (widget.localizedBookTitles!.containsKey(key)) {
        return widget.localizedBookTitles![key]!;
      }
    }
    if (lang == 'en' && widget.englishBookTitle != null)
      return widget.englishBookTitle!;
    if (lang == 'ja' && widget.japaneseBookTitle != null)
      return widget.japaneseBookTitle!;
    return widget.bookTitle;
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
    final effectiveLangIndex =
        widget.useAppLocale ? _langIndexFromLocale(context) : _langIndex;
    final pages = widget.useAppLocale
        ? _chaptersForLocale(context)
        : (effectiveLangIndex == 2 && widget.japaneseChapters != null
            ? widget.japaneseChapters!
            : effectiveLangIndex == 1 && widget.englishChapters != null
                ? widget.englishChapters!
                : widget.chapters);
    final bookTitle = widget.useAppLocale
        ? _bookTitleForLocale(context)
        : (effectiveLangIndex == 2 && widget.japaneseBookTitle != null
            ? widget.japaneseBookTitle!
            : effectiveLangIndex == 1 && widget.englishBookTitle != null
                ? widget.englishBookTitle!
                : widget.bookTitle);
    final progress = '${currentPage + 1}/${pages.length}';

    Widget languageButton(String label, int value) {
      final selected = _langIndex == value;
      return Expanded(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _changeLanguage(value),
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

    Widget langWidget() {
      if (widget.useAppLocale) return const SizedBox.shrink();
      if (hasLanguageToggle) {
        final hasJa = widget.japaneseChapters != null;
        final hasEn = widget.englishChapters != null;
        return SizedBox(
          width: hasJa && hasEn ? 120 : 88,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: whiteMode ? 0.08 : 0.12),
              borderRadius: BorderRadius.circular(11),
              border: Border.all(color: accent.withValues(alpha: 0.18)),
            ),
            child: Row(
              children: [
                languageButton('한글', 0),
                if (hasEn) ...[
                  const SizedBox(width: 3),
                  languageButton('EN', 1),
                ],
                if (hasJa) ...[
                  const SizedBox(width: 3),
                  languageButton('日本語', 2),
                ],
              ],
            ),
          ),
        );
      }
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: accent.withValues(alpha: whiteMode ? 0.08 : 0.12),
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: accent.withValues(alpha: 0.18)),
        ),
        child: Text(
          '한글',
          style: TextStyle(
            color: accent,
            fontSize: 11,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: pageBg,
      bottomNavigationBar: buildAdOnlyBottomBar(),
      appBar: AppBar(
        title: Text(l10n.bookReadingTitle),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [buildWhiteModeButton(context)],
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: cardLine),
                ),
                child: Row(
                  children: [
                    langWidget(),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        color:
                            accent.withValues(alpha: whiteMode ? 0.08 : 0.12),
                        borderRadius: BorderRadius.circular(999),
                        border:
                            Border.all(color: accent.withValues(alpha: 0.22)),
                      ),
                      child: Text(
                        progress,
                        style: TextStyle(
                          color: accent,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
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
                  setState(() => currentPage = index);
                  _saveState();
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
