part of '../main.dart';

class _BookEntry {
  const _BookEntry({
    required this.title,
    required this.author,
    required this.subtitle,
    required this.color,
    required this.destination,
  });

  final String title;
  final String author;
  final String subtitle;
  final Color color;
  final Widget destination;
}

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  bool _showEnglish = false;

  static final _books = <_BookEntry>[
    _BookEntry(
      title: 'My View on Intelligent Investing',
      author: 'DongHwan',
      subtitle: '내가 생각하는 현명한 투자',
      color: const Color(0xFF1D4ED8),
      destination: const IntelligentInvestorBookPage(),
    ),
    _BookEntry(
      title: 'Reminiscences of a Stock Operator',
      author: 'Edwin Lefevre',
      subtitle: '어느 주식투자자의 회상',
      color: const Color(0xFF0F766E),
      destination: const LongFormBookReaderPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final whiteMode = isWhiteModeEnabled(context);
    final pageBg = whiteMode ? _lightAppBg : _appBg;
    final cardBg = whiteMode ? _lightSurface : _darkSurface;
    final cardLine = whiteMode ? _lightLine : _darkLineSoft;
    final primaryText = whiteMode ? _lightText : _darkText;
    final secondaryText = whiteMode ? _lightMuted : _darkMuted;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: pageBg,
      bottomNavigationBar: buildAdOnlyBottomBar(),
      appBar: AppBar(
        title: Text(_showEnglish ? 'Column' : l10n.bookReadingTitle),
        foregroundColor: primaryText,
        backgroundColor: pageBg,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () => setState(() => _showEnglish = !_showEnglish),
            child: Container(
              margin: const EdgeInsets.only(right: 4),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: _showEnglish
                    ? const Color(0xFF0F766E)
                    : (whiteMode ? const Color(0xFFE5E7EB) : const Color(0xFF374151)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _showEnglish ? 'EN' : '한',
                style: TextStyle(
                  color: _showEnglish ? Colors.white : primaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          buildWhiteModeButton(context),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
          itemCount: _books.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final book = _books[index];
            final mainTitle = _showEnglish ? book.title : book.subtitle;
            final subTitle = _showEnglish ? book.subtitle : book.title;
            return Material(
              color: cardBg,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => book.destination),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: cardLine),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 64,
                        decoration: BoxDecoration(
                          color: book.color,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.menu_book_rounded,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mainTitle,
                              style: TextStyle(
                                color: primaryText,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              subTitle,
                              style: TextStyle(
                                color: secondaryText,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              book.author,
                              style: TextStyle(
                                color: secondaryText,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: secondaryText,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
