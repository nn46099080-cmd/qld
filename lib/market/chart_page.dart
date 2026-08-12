part of '../main.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  static final defaultChartItems = <ChartListItem>[
    ChartListItem(
      id: 'nasdaq100Futures',
      title: 'Nasdaq 100 Futures',
      subtitle: 'CME_MINI:NQ1!',
      symbolPath: 'CME_MINI-NQ1!',
      color: _blue,
      icon: Icons.timeline_rounded,
    ),
    ChartListItem(
      id: 'qld',
      title: 'QLD',
      subtitle: 'AMEX:QLD',
      symbolPath: 'AMEX-QLD',
      color: _purple,
      icon: Icons.stacked_line_chart_rounded,
    ),
    ChartListItem(
      id: 'tqqq',
      title: 'TQQQ',
      subtitle: 'NASDAQ:TQQQ',
      symbolPath: 'NASDAQ-TQQQ',
      color: _cyan,
      icon: Icons.show_chart_rounded,
    ),
    ChartListItem(
      id: 'sp500',
      title: 'S&P 500',
      subtitle: 'SP:SPX',
      symbolPath: 'SP-SPX',
      color: Colors.redAccent,
      icon: Icons.bar_chart_rounded,
    ),
    ChartListItem(
      id: 'kospi',
      title: 'Korea KOSPI',
      subtitle: 'KRX:KOSPI',
      symbolPath: 'KRX-KOSPI',
      color: Colors.lightBlueAccent,
      icon: Icons.show_chart_rounded,
    ),
    ChartListItem(
      id: 'nikkei225',
      title: 'Japan Nikkei 225',
      subtitle: 'TVC:NI225',
      symbolPath: 'TVC-NI225',
      color: Colors.pinkAccent,
      icon: Icons.candlestick_chart_rounded,
    ),
    ChartListItem(
      id: 'ibex35',
      title: 'Spain IBEX 35',
      subtitle: 'TVC:IBEX35',
      symbolPath: 'TVC-IBEX35',
      color: Colors.deepOrangeAccent,
      icon: Icons.insert_chart_rounded,
    ),
    ChartListItem(
      id: 'psi',
      title: 'Portugal PSI',
      subtitle: 'INDEXEURO:PSI20',
      symbolPath: 'INDEXEURO-PSI20',
      color: Colors.greenAccent,
      icon: Icons.query_stats_rounded,
    ),
    ChartListItem(
      id: 'moex',
      title: 'Russia MOEX',
      subtitle: 'MOEX:IMOEX',
      symbolPath: 'MOEX-IMOEX',
      color: Colors.redAccent,
      icon: Icons.stacked_line_chart_rounded,
    ),
    ChartListItem(
      id: 'sseComposite',
      title: 'China SSE Composite',
      subtitle: 'SSE:000001',
      symbolPath: 'SSE-000001',
      color: Colors.amberAccent,
      icon: Icons.area_chart_rounded,
    ),
    ChartListItem(
      id: 'taiex',
      title: 'Taiwan TAIEX',
      subtitle: 'INDEX:TAIEX',
      symbolPath: 'INDEX-TAIEX',
      color: Colors.tealAccent,
      icon: Icons.timeline_rounded,
    ),
    ChartListItem(
      id: 'cac40',
      title: 'France CAC 40',
      subtitle: 'TVC:CAC40',
      symbolPath: 'TVC-CAC40',
      color: Colors.indigoAccent,
      icon: Icons.multiline_chart_rounded,
    ),
    ChartListItem(
      id: 'dax',
      title: 'Germany DAX',
      subtitle: 'XETR:DAX',
      symbolPath: 'XETR-DAX',
      color: Colors.yellowAccent,
      icon: Icons.auto_graph_rounded,
    ),
    popularStockChartItem('AAPL', 'Apple', 'NASDAQ', _blue),
    popularStockChartItem('MSFT', 'Microsoft', 'NASDAQ', _cyan),
    popularStockChartItem('NVDA', 'NVIDIA', 'NASDAQ', _purple),
    popularStockChartItem('AMZN', 'Amazon', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem(
        'GOOGL', 'Alphabet Class A', 'NASDAQ', Colors.orangeAccent),
    popularStockChartItem('META', 'Meta Platforms', 'NASDAQ', Colors.redAccent),
    popularStockChartItem('TSLA', 'Tesla', 'NASDAQ', Colors.amberAccent),
    popularStockChartItem('AVGO', 'Broadcom', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem(
        'BRK.B', 'Berkshire Hathaway', 'NYSE', Colors.pinkAccent),
    popularStockChartItem('LLY', 'Eli Lilly', 'NYSE', Colors.tealAccent),
    popularStockChartItem('JPM', 'JPMorgan Chase', 'NYSE', _blue),
    popularStockChartItem('V', 'Visa', 'NYSE', _cyan),
    popularStockChartItem('UNH', 'UnitedHealth', 'NYSE', _purple),
    popularStockChartItem('XOM', 'Exxon Mobil', 'NYSE', Colors.greenAccent),
    popularStockChartItem('MA', 'Mastercard', 'NYSE', Colors.orangeAccent),
    popularStockChartItem('COST', 'Costco', 'NASDAQ', Colors.redAccent),
    popularStockChartItem('HD', 'Home Depot', 'NYSE', Colors.amberAccent),
    popularStockChartItem('NFLX', 'Netflix', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem('PG', 'Procter & Gamble', 'NYSE', Colors.pinkAccent),
    popularStockChartItem(
        'JNJ', 'Johnson & Johnson', 'NYSE', Colors.tealAccent),
    popularStockChartItem('WMT', 'Walmart', 'NYSE', _blue),
    popularStockChartItem('ABBV', 'AbbVie', 'NYSE', _cyan),
    popularStockChartItem('BAC', 'Bank of America', 'NYSE', _purple),
    popularStockChartItem('CRM', 'Salesforce', 'NYSE', Colors.greenAccent),
    popularStockChartItem('ORCL', 'Oracle', 'NYSE', Colors.orangeAccent),
    popularStockChartItem('KO', 'Coca-Cola', 'NYSE', Colors.redAccent),
    popularStockChartItem('CVX', 'Chevron', 'NYSE', Colors.amberAccent),
    popularStockChartItem('AMD', 'AMD', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem('MRK', 'Merck', 'NYSE', Colors.pinkAccent),
    popularStockChartItem('CSCO', 'Cisco', 'NASDAQ', Colors.tealAccent),
    popularStockChartItem('WFC', 'Wells Fargo', 'NYSE', _blue),
    popularStockChartItem('MCD', 'McDonald\'s', 'NYSE', _cyan),
    popularStockChartItem('PEP', 'PepsiCo', 'NASDAQ', _purple),
    popularStockChartItem('LIN', 'Linde', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem('ADBE', 'Adobe', 'NASDAQ', Colors.orangeAccent),
    popularStockChartItem('TMO', 'Thermo Fisher', 'NYSE', Colors.redAccent),
    popularStockChartItem('GE', 'GE Aerospace', 'NYSE', Colors.amberAccent),
    popularStockChartItem('IBM', 'IBM', 'NYSE', Colors.lightBlueAccent),
    popularStockChartItem('QCOM', 'Qualcomm', 'NASDAQ', Colors.pinkAccent),
    popularStockChartItem('CAT', 'Caterpillar', 'NYSE', Colors.tealAccent),
    popularStockChartItem('INTU', 'Intuit', 'NASDAQ', _blue),
    popularStockChartItem('DIS', 'Disney', 'NYSE', _cyan),
    popularStockChartItem('TXN', 'Texas Instruments', 'NASDAQ', _purple),
    popularStockChartItem(
        'AMAT', 'Applied Materials', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem('GS', 'Goldman Sachs', 'NYSE', Colors.orangeAccent),
    popularStockChartItem('NOW', 'ServiceNow', 'NYSE', Colors.redAccent),
    popularStockChartItem(
        'ISRG', 'Intuitive Surgical', 'NASDAQ', Colors.amberAccent),
    popularStockChartItem('VZ', 'Verizon', 'NYSE', Colors.lightBlueAccent),
    popularStockChartItem('RTX', 'RTX', 'NYSE', Colors.pinkAccent),
    popularStockChartItem(
        'BKNG', 'Booking Holdings', 'NASDAQ', Colors.tealAccent),
    popularStockChartItem('SPGI', 'S&P Global', 'NYSE', _blue),
    popularStockChartItem('LOW', 'Lowe\'s', 'NYSE', _cyan),
    popularStockChartItem('PFE', 'Pfizer', 'NYSE', _purple),
    popularStockChartItem('HON', 'Honeywell', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem('NKE', 'Nike', 'NYSE', Colors.orangeAccent),
    popularStockChartItem('UBER', 'Uber', 'NYSE', Colors.redAccent),
    popularStockChartItem('CMCSA', 'Comcast', 'NASDAQ', Colors.amberAccent),
    popularStockChartItem('AMGN', 'Amgen', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem('BA', 'Boeing', 'NYSE', Colors.pinkAccent),
    popularStockChartItem('UNP', 'Union Pacific', 'NYSE', Colors.tealAccent),
    popularStockChartItem('SBUX', 'Starbucks', 'NASDAQ', _blue),
    popularStockChartItem('PANW', 'Palo Alto Networks', 'NASDAQ', _cyan),
    popularStockChartItem('PLTR', 'Palantir', 'NASDAQ', _purple),
    popularStockChartItem('MU', 'Micron', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem(
        'LRCX', 'Lam Research', 'NASDAQ', Colors.orangeAccent),
    popularStockChartItem('ADP', 'ADP', 'NASDAQ', Colors.redAccent),
    popularStockChartItem('DE', 'Deere', 'NYSE', Colors.amberAccent),
    popularStockChartItem(
        'GILD', 'Gilead Sciences', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem('COP', 'ConocoPhillips', 'NYSE', Colors.pinkAccent),
    popularStockChartItem('TJX', 'TJX Companies', 'NYSE', Colors.tealAccent),
    popularStockChartItem('ADI', 'Analog Devices', 'NASDAQ', _blue),
    popularStockChartItem('C', 'Citigroup', 'NYSE', _cyan),
    popularStockChartItem('APP', 'AppLovin', 'NASDAQ', _purple),
    popularStockChartItem('SCHW', 'Charles Schwab', 'NYSE', Colors.greenAccent),
    popularStockChartItem(
        'ANET', 'Arista Networks', 'NYSE', Colors.orangeAccent),
    popularStockChartItem('MDLZ', 'Mondelez', 'NASDAQ', Colors.redAccent),
    popularStockChartItem('SYK', 'Stryker', 'NYSE', Colors.amberAccent),
    popularStockChartItem('BLK', 'BlackRock', 'NYSE', Colors.lightBlueAccent),
    popularStockChartItem('ETN', 'Eaton', 'NYSE', Colors.pinkAccent),
    popularStockChartItem('MMC', 'Marsh McLennan', 'NYSE', Colors.tealAccent),
    popularStockChartItem('REGN', 'Regeneron', 'NASDAQ', _blue),
    popularStockChartItem('VRTX', 'Vertex Pharma', 'NASDAQ', _cyan),
    popularStockChartItem('LMT', 'Lockheed Martin', 'NYSE', _purple),
    popularStockChartItem('ELV', 'Elevance Health', 'NYSE', Colors.greenAccent),
    popularStockChartItem('UPS', 'UPS', 'NYSE', Colors.orangeAccent),
    popularStockChartItem('PGR', 'Progressive', 'NYSE', Colors.redAccent),
    popularStockChartItem('AMT', 'American Tower', 'NYSE', Colors.amberAccent),
    popularStockChartItem(
        'NEE', 'NextEra Energy', 'NYSE', Colors.lightBlueAccent),
    popularStockChartItem('SO', 'Southern Company', 'NYSE', Colors.pinkAccent),
    popularStockChartItem('KLAC', 'KLA', 'NASDAQ', Colors.tealAccent),
    popularStockChartItem('BX', 'Blackstone', 'NYSE', _blue),
    popularStockChartItem('KKR', 'KKR', 'NYSE', _cyan),
    popularStockChartItem('SHOP', 'Shopify', 'NASDAQ', _purple),
    popularStockChartItem('MELI', 'MercadoLibre', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem('ABNB', 'Airbnb', 'NASDAQ', Colors.orangeAccent),
    popularStockChartItem('RIVN', 'Rivian 리비안 EV', 'NASDAQ', Colors.redAccent),
    popularStockChartItem('SNOW', 'Snowflake', 'NYSE', Colors.amberAccent),
    popularStockChartItem('COIN', 'Coinbase', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem('MSTR', 'MicroStrategy', 'NASDAQ', Colors.pinkAccent),
    popularStockChartItem('HOOD', 'Robinhood', 'NASDAQ', Colors.tealAccent),
    popularStockChartItem('GOOG', 'Alphabet Class C', 'NASDAQ', _blue),
    popularStockChartItem('ASML', 'ASML Holding', 'NASDAQ', _cyan),
    popularStockChartItem('INTC', 'Intel', 'NASDAQ', _purple),
    popularStockChartItem('ARM', 'Arm Holdings', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem('TMUS', 'T-Mobile US', 'NASDAQ', Colors.orangeAccent),
    popularStockChartItem(
        'STX', 'Seagate Technology', 'NASDAQ', Colors.redAccent),
    popularStockChartItem(
        'MRVL', 'Marvell Technology', 'NASDAQ', Colors.amberAccent),
    popularStockChartItem(
        'WDC', 'Western Digital', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem('CRWD', 'CrowdStrike', 'NASDAQ', Colors.pinkAccent),
    popularStockChartItem('PDD', 'PDD Holdings', 'NASDAQ', Colors.tealAccent),
    popularStockChartItem('CEG', 'Constellation Energy', 'NASDAQ', _blue),
    popularStockChartItem('CDNS', 'Cadence Design Systems', 'NASDAQ', _cyan),
    popularStockChartItem('SNPS', 'Synopsys', 'NASDAQ', _purple),
    popularStockChartItem(
        'MAR', 'Marriott International', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem('FTNT', 'Fortinet', 'NASDAQ', Colors.orangeAccent),
    popularStockChartItem('CSX', 'CSX', 'NASDAQ', Colors.redAccent),
    popularStockChartItem(
        'MNST', 'Monster Beverage', 'NASDAQ', Colors.amberAccent),
    popularStockChartItem(
        'NXPI', 'NXP Semiconductors', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem(
        'MPWR', 'Monolithic Power Systems', 'NASDAQ', Colors.pinkAccent),
    popularStockChartItem('DDOG', 'Datadog', 'NASDAQ', Colors.tealAccent),
    popularStockChartItem('ROST', 'Ross Stores', 'NASDAQ', _blue),
    popularStockChartItem('ORLY', 'O\'Reilly Automotive', 'NASDAQ', _cyan),
    popularStockChartItem('AEP', 'American Electric Power', 'NASDAQ', _purple),
    popularStockChartItem('CTAS', 'Cintas', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem(
        'WBD', 'Warner Bros. Discovery', 'NASDAQ', Colors.orangeAccent),
    popularStockChartItem('DASH', 'DoorDash', 'NASDAQ', Colors.redAccent),
    popularStockChartItem('BKR', 'Baker Hughes', 'NASDAQ', Colors.amberAccent),
    popularStockChartItem('PCAR', 'PACCAR', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem(
        'FANG', 'Diamondback Energy', 'NASDAQ', Colors.pinkAccent),
    popularStockChartItem(
        'MCHP', 'Microchip Technology', 'NASDAQ', Colors.tealAccent),
    popularStockChartItem('FAST', 'Fastenal', 'NASDAQ', _blue),
    popularStockChartItem('EA', 'Electronic Arts', 'NASDAQ', _cyan),
    popularStockChartItem('XEL', 'Xcel Energy', 'NASDAQ', _purple),
    popularStockChartItem('ADSK', 'Autodesk', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem('FER', 'Ferrovial', 'NASDAQ', Colors.orangeAccent),
    popularStockChartItem('EXC', 'Exelon', 'NASDAQ', Colors.redAccent),
    popularStockChartItem(
        'ODFL', 'Old Dominion Freight Line', 'NASDAQ', Colors.amberAccent),
    popularStockChartItem(
        'IDXX', 'IDEXX Laboratories', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem(
        'CCEP', 'Coca-Cola Europacific Partners', 'NASDAQ', Colors.pinkAccent),
    popularStockChartItem(
        'TTWO', 'Take-Two Interactive', 'NASDAQ', Colors.tealAccent),
    popularStockChartItem('KDP', 'Keurig Dr Pepper', 'NASDAQ', _blue),
    popularStockChartItem('ALNY', 'Alnylam Pharmaceuticals', 'NASDAQ', _cyan),
    popularStockChartItem('PYPL', 'PayPal', 'NASDAQ', _purple),
    popularStockChartItem(
        'TRI', 'Thomson Reuters', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem('PAYX', 'Paychex', 'NASDAQ', Colors.orangeAccent),
    popularStockChartItem(
        'ROP', 'Roper Technologies', 'NASDAQ', Colors.redAccent),
    popularStockChartItem('CPRT', 'Copart', 'NASDAQ', Colors.amberAccent),
    popularStockChartItem(
        'AXON', 'Axon Enterprise', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem('WDAY', 'Workday', 'NASDAQ', Colors.pinkAccent),
    popularStockChartItem('ZS', 'Zscaler', 'NASDAQ', Colors.tealAccent),
    popularStockChartItem('GEHC', 'GE HealthCare', 'NASDAQ', _blue),
    popularStockChartItem('KHC', 'Kraft Heinz', 'NASDAQ', _cyan),
    popularStockChartItem('DXCM', 'DexCom', 'NASDAQ', _purple),
    popularStockChartItem(
        'CTSH', 'Cognizant Technology Solutions', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem('INSM', 'Insmed', 'NASDAQ', Colors.orangeAccent),
    popularStockChartItem(
        'VRSK', 'Verisk Analytics', 'NASDAQ', Colors.redAccent),
    popularStockChartItem('TEAM', 'Atlassian', 'NASDAQ', Colors.amberAccent),
    popularStockChartItem(
        'CHTR', 'Charter Communications', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem('CSGP', 'CoStar Group', 'NASDAQ', Colors.pinkAccent),
    popularStockChartItem(
        'IONQ', 'IonQ Quantum Computing 퀀텀컴퓨팅', 'NYSE', _cyan),
    popularStockChartItem('RGTI', 'Rigetti Quantum Computing 퀀텀컴퓨팅', 'NASDAQ',
        Colors.deepPurpleAccent),
    popularStockChartItem('QUBT', 'Quantum Computing Inc 퀀텀컴퓨팅', 'NASDAQ',
        Colors.lightGreenAccent),
    popularStockChartItem(
        'QBTS', 'D-Wave Quantum Computing 퀀텀컴퓨팅', 'NYSE', Colors.indigoAccent),
    popularEtfChartItem(
        'QTUM', 'Defiance Quantum ETF 퀀텀컴퓨팅', 'AMEX', Colors.cyanAccent),
    popularEtfChartItem('SPY', 'SPDR S&P 500 ETF Trust', 'AMEX', _blue),
    popularEtfChartItem('QQQ', 'Invesco QQQ Trust', 'NASDAQ', _cyan),
    popularEtfChartItem('VOO', 'Vanguard S&P 500 ETF', 'AMEX', _purple),
    popularEtfChartItem(
        'IVV', 'iShares Core S&P 500 ETF', 'AMEX', Colors.greenAccent),
    popularEtfChartItem(
        'VTI', 'Vanguard Total Stock Market ETF', 'AMEX', Colors.orangeAccent),
    popularEtfChartItem(
        'IWM', 'iShares Russell 2000 ETF', 'AMEX', Colors.redAccent),
    popularEtfChartItem('DIA', 'SPDR Dow Jones Industrial Average ETF', 'AMEX',
        Colors.amberAccent),
    popularEtfChartItem('SCHD', 'Schwab U.S. Dividend Equity ETF', 'AMEX',
        Colors.lightBlueAccent),
    popularEtfChartItem('VGT', 'Vanguard Information Technology ETF', 'AMEX',
        Colors.pinkAccent),
    popularEtfChartItem(
        'XLK', 'Technology Select Sector SPDR Fund', 'AMEX', Colors.tealAccent),
    popularEtfChartItem(
        'XLF', 'Financial Select Sector SPDR Fund', 'AMEX', _blue),
    popularEtfChartItem('XLE', 'Energy Select Sector SPDR Fund', 'AMEX', _cyan),
    popularEtfChartItem(
        'XLV', 'Health Care Select Sector SPDR Fund', 'AMEX', _purple),
    popularEtfChartItem('XLI', 'Industrial Select Sector SPDR Fund', 'AMEX',
        Colors.greenAccent),
    popularEtfChartItem('XLY', 'Consumer Discretionary Select Sector SPDR Fund',
        'AMEX', Colors.orangeAccent),
    popularEtfChartItem('XLP', 'Consumer Staples Select Sector SPDR Fund',
        'AMEX', Colors.redAccent),
    popularEtfChartItem(
        'XLU', 'Utilities Select Sector SPDR Fund', 'AMEX', Colors.amberAccent),
    popularEtfChartItem('XLB', 'Materials Select Sector SPDR Fund', 'AMEX',
        Colors.lightBlueAccent),
    popularEtfChartItem('XLRE', 'Real Estate Select Sector SPDR Fund', 'AMEX',
        Colors.pinkAccent),
    popularEtfChartItem(
        'SMH', 'VanEck Semiconductor ETF', 'NASDAQ', Colors.tealAccent),
    popularEtfChartItem('SOXX', 'iShares Semiconductor ETF', 'NASDAQ', _blue),
    popularEtfChartItem('ARKK', 'ARK Innovation ETF', 'AMEX', _cyan),
    popularEtfChartItem(
        'TLT', 'iShares 20+ Year Treasury Bond ETF', 'NASDAQ', _purple),
    popularEtfChartItem('HYG', 'iShares iBoxx High Yield Corporate Bond ETF',
        'AMEX', Colors.greenAccent),
    popularEtfChartItem(
        'LQD',
        'iShares iBoxx Investment Grade Corporate Bond ETF',
        'AMEX',
        Colors.orangeAccent),
    popularEtfChartItem(
        'BND', 'Vanguard Total Bond Market ETF', 'NASDAQ', Colors.redAccent),
    popularEtfChartItem('AGG', 'iShares Core U.S. Aggregate Bond ETF', 'AMEX',
        Colors.amberAccent),
    popularEtfChartItem('SHY', 'iShares 1-3 Year Treasury Bond ETF', 'NASDAQ',
        Colors.lightBlueAccent),
    popularEtfChartItem('IEF', 'iShares 7-10 Year Treasury Bond ETF', 'NASDAQ',
        Colors.pinkAccent),
    popularEtfChartItem('GLD', 'SPDR Gold Shares', 'AMEX', Colors.tealAccent),
    popularEtfChartItem('SLV', 'iShares Silver Trust', 'AMEX', _blue),
    popularEtfChartItem('USO', 'United States Oil Fund', 'AMEX', _cyan),
    popularEtfChartItem(
        'UNG', 'United States Natural Gas Fund', 'AMEX', _purple),
    popularEtfChartItem(
        'EEM', 'iShares MSCI Emerging Markets ETF', 'AMEX', Colors.greenAccent),
    popularEtfChartItem(
        'EFA', 'iShares MSCI EAFE ETF', 'AMEX', Colors.orangeAccent),
    popularEtfChartItem('VXUS', 'Vanguard Total International Stock ETF',
        'NASDAQ', Colors.redAccent),
    popularEtfChartItem('VEA', 'Vanguard FTSE Developed Markets ETF', 'AMEX',
        Colors.amberAccent),
    popularEtfChartItem(
        'VNQ', 'Vanguard Real Estate ETF', 'AMEX', Colors.lightBlueAccent),
    popularEtfChartItem(
        'QQQM', 'Invesco NASDAQ 100 ETF', 'NASDAQ', Colors.pinkAccent),
    popularEtfChartItem(
        'SQQQ', 'ProShares UltraPro Short QQQ', 'NASDAQ', Colors.tealAccent),
    popularEtfChartItem(
        'SOXL', 'Direxion Daily Semiconductor Bull 3X Shares', 'AMEX', _blue),
    popularEtfChartItem(
        'TECL', 'Direxion Daily Technology Bull 3X Shares', 'AMEX', _cyan),
    popularEtfChartItem(
        'SPXL', 'Direxion Daily S&P 500 Bull 3X Shares', 'AMEX', _purple),
    popularEtfChartItem(
        'UPRO', 'ProShares UltraPro S&P500', 'AMEX', Colors.greenAccent),
    popularEtfChartItem('TNA', 'Direxion Daily Small Cap Bull 3X Shares',
        'AMEX', Colors.orangeAccent),
    popularEtfChartItem(
        'JEPI', 'JPMorgan Equity Premium Income ETF', 'AMEX', Colors.redAccent),
    popularEtfChartItem('JEPQ', 'JPMorgan Nasdaq Equity Premium Income ETF',
        'NASDAQ', Colors.amberAccent),
    popularEtfChartItem('QYLD', 'Global X Nasdaq 100 Covered Call ETF',
        'NASDAQ', Colors.lightBlueAccent),
    popularEtfChartItem(
        'IBIT', 'iShares Bitcoin Trust ETF', 'NASDAQ', Colors.pinkAccent),
    popularEtfChartItem(
        'BITO', 'ProShares Bitcoin Strategy ETF', 'AMEX', Colors.tealAccent),
    commodityChartItem(
        'gold', 'Gold Futures', 'COMEX:GC1!', 'COMEX-GC1!', Colors.amberAccent),
    commodityChartItem('silver', 'Silver Futures', 'COMEX:SI1!', 'COMEX-SI1!',
        Colors.lightBlueAccent),
    commodityChartItem('copper', 'Copper Futures', 'COMEX:HG1!', 'COMEX-HG1!',
        Colors.orangeAccent),
    commodityChartItem('platinum', 'Platinum Futures', 'NYMEX:PL1!',
        'NYMEX-PL1!', Colors.blueGrey),
    commodityChartItem('palladium', 'Palladium Futures', 'NYMEX:PA1!',
        'NYMEX-PA1!', Colors.purpleAccent),
    commodityChartItem('wtiCrude', 'WTI Crude Oil Futures', 'NYMEX:CL1!',
        'NYMEX-CL1!', Colors.greenAccent),
    commodityChartItem('brentCrude', 'Brent Crude Oil Futures', 'NYMEX:BRN1!',
        'NYMEX-BRN1!', Colors.tealAccent),
    commodityChartItem(
        'naturalGas', 'Natural Gas Futures', 'NYMEX:NG1!', 'NYMEX-NG1!', _blue),
    commodityChartItem('gasoline', 'Gasoline RBOB Futures', 'NYMEX:RB1!',
        'NYMEX-RB1!', Colors.redAccent),
    commodityChartItem(
        'heatingOil', 'Heating Oil Futures', 'NYMEX:HO1!', 'NYMEX-HO1!', _cyan),
    commodityChartItem(
        'corn', 'Corn Futures', 'CBOT:ZC1!', 'CBOT-ZC1!', Colors.amberAccent),
    commodityChartItem('wheat', 'Wheat Futures', 'CBOT:ZW1!', 'CBOT-ZW1!',
        Colors.orangeAccent),
    commodityChartItem('soybeans', 'Soybean Futures', 'CBOT:ZS1!', 'CBOT-ZS1!',
        Colors.greenAccent),
    commodityChartItem('soybeanOil', 'Soybean Oil Futures', 'CBOT:ZL1!',
        'CBOT-ZL1!', Colors.tealAccent),
    commodityChartItem('soybeanMeal', 'Soybean Meal Futures', 'CBOT:ZM1!',
        'CBOT-ZM1!', Colors.lightGreenAccent),
    commodityChartItem(
        'oats', 'Oats Futures', 'CBOT:ZO1!', 'CBOT-ZO1!', Colors.brown),
    commodityChartItem('roughRice', 'Rough Rice Futures', 'CBOT:ZR1!',
        'CBOT-ZR1!', Colors.lightBlueAccent),
    commodityChartItem(
        'coffee', 'Coffee C Futures', 'ICEUS:KC1!', 'ICEUS-KC1!', Colors.brown),
    commodityChartItem('sugar', 'Sugar No. 11 Futures', 'ICEUS:SB1!',
        'ICEUS-SB1!', Colors.pinkAccent),
    commodityChartItem('cocoa', 'Cocoa Futures', 'ICEUS:CC1!', 'ICEUS-CC1!',
        Colors.deepOrangeAccent),
    commodityChartItem(
        'cotton', 'Cotton Futures', 'ICEUS:CT1!', 'ICEUS-CT1!', Colors.white70),
    commodityChartItem('orangeJuice', 'Orange Juice Futures', 'ICEUS:OJ1!',
        'ICEUS-OJ1!', Colors.orangeAccent),
    commodityChartItem(
        'lumber', 'Lumber Futures', 'CME:LBR1!', 'CME-LBR1!', Colors.brown),
    commodityChartItem('liveCattle', 'Live Cattle Futures', 'CME:LE1!',
        'CME-LE1!', Colors.redAccent),
    commodityChartItem('feederCattle', 'Feeder Cattle Futures', 'CME:GF1!',
        'CME-GF1!', Colors.deepOrangeAccent),
    commodityChartItem('leanHogs', 'Lean Hogs Futures', 'CME:HE1!', 'CME-HE1!',
        Colors.pinkAccent),
    commodityChartItem('milk', 'Class III Milk Futures', 'CME:DC1!', 'CME-DC1!',
        Colors.white70),
    commodityChartItem('ironOre', 'Iron Ore Futures', 'SGX:FEF1!', 'SGX-FEF1!',
        Colors.redAccent),
    commodityChartItem('aluminum', 'Aluminum Futures', 'COMEX:ALI1!',
        'COMEX-ALI1!', Colors.blueGrey),
    commodityChartItem('zinc', 'Zinc Futures', 'COMEX:ZNC1!', 'COMEX-ZNC1!',
        Colors.lightBlueAccent),
    commodityChartItem('nickel', 'Nickel Futures', 'COMEX:NIC1!', 'COMEX-NIC1!',
        Colors.greenAccent),
    commodityChartItem(
        'lead', 'Lead Futures', 'COMEX:LED1!', 'COMEX-LED1!', Colors.grey),
    commodityChartItem(
        'tin', 'Tin Futures', 'COMEX:TIN1!', 'COMEX-TIN1!', Colors.cyanAccent),
    commodityChartItem(
        'coal', 'Coal Futures', 'NYMEX:QX1!', 'NYMEX-QX1!', Colors.grey),
    commodityChartItem('uranium', 'Uranium Futures', 'NYMEX:UX1!', 'NYMEX-UX1!',
        Colors.lightGreenAccent),
    commodityChartItem('ethanol', 'Ethanol Futures', 'CBOT:EH1!', 'CBOT-EH1!',
        Colors.greenAccent),
    commodityChartItem('canola', 'Canola Futures', 'ICEUS:RS1!', 'ICEUS-RS1!',
        Colors.yellowAccent),
    commodityChartItem('rapeseed', 'Rapeseed Futures', 'EURONEXT:COM1!',
        'EURONEXT-COM1!', Colors.yellowAccent),
    commodityChartItem('palmOil', 'Palm Oil Futures', 'MYX:FCPO1!',
        'MYX-FCPO1!', Colors.orangeAccent),
    commodityChartItem('rubber', 'Rubber Futures', 'OSE:RSS31!', 'OSE-RSS31!',
        Colors.blueGrey),
    commodityChartItem('propane', 'Propane Futures', 'NYMEX:PN1!', 'NYMEX-PN1!',
        Colors.cyanAccent),
    commodityChartItem('diesel', 'Diesel Futures', 'NYMEX:ULSD1!',
        'NYMEX-ULSD1!', Colors.tealAccent),
    commodityChartItem('gasoil', 'Low Sulphur Gasoil Futures', 'ICEEUR:QS1!',
        'ICEEUR-QS1!', Colors.lightBlueAccent),
    commodityChartItem('carbon', 'Carbon Emissions Futures', 'ICEEUR:ECF1!',
        'ICEEUR-ECF1!', Colors.greenAccent),
    commodityChartItem('usDollarIndex', 'US Dollar Index Futures', 'ICEUS:DX1!',
        'ICEUS-DX1!', _cyan),
    commodityChartItem(
        'balticDry', 'Baltic Dry Index', 'INDEX:BDI', 'INDEX-BDI', _blue),
    commodityChartItem(
        'freight', 'Freight Futures', 'CME:FBX1!', 'CME-FBX1!', _purple),
    commodityChartItem(
        'goldSpot', 'Gold Spot', 'TVC:GOLD', 'TVC-GOLD', Colors.amberAccent),
    commodityChartItem('silverSpot', 'Silver Spot', 'TVC:SILVER', 'TVC-SILVER',
        Colors.lightBlueAccent),
    commodityChartItem('copperSpot', 'Copper Spot', 'TVC:COPPER', 'TVC-COPPER',
        Colors.orangeAccent),
    globalMegaCapChartItem('tsmc', 'TSM  TSMC', 'NYSE:TSM', 'NYSE-TSM', _blue),
    globalMegaCapChartItem('samsungElectronics',
        '005930  Samsung Electronics 삼성전자', 'KRX:005930', 'KRX-005930', _cyan),
    globalMegaCapChartItem('saudiAramco', '2222  Saudi Aramco', 'TADAWUL:2222',
        'TADAWUL-2222', _purple),
    globalMegaCapChartItem('tencent', '0700  Tencent Holdings', 'HKEX:0700',
        'HKEX-0700', Colors.greenAccent),
    globalMegaCapChartItem('alibaba', '9988  Alibaba Group', 'HKEX:9988',
        'HKEX-9988', Colors.orangeAccent),
    globalMegaCapChartItem('novoNordisk', 'NOVO_B  Novo Nordisk',
        'OMXCOP:NOVO_B', 'OMXCOP-NOVO_B', Colors.redAccent),
    globalMegaCapChartItem(
        'lvmh', 'MC  LVMH', 'EURONEXT:MC', 'EURONEXT-MC', Colors.amberAccent),
    globalMegaCapChartItem('toyota', '7203  Toyota Motor', 'TSE:7203',
        'TSE-7203', Colors.lightBlueAccent),
    globalMegaCapChartItem(
        'sap', 'SAP  SAP', 'XETR:SAP', 'XETR-SAP', Colors.pinkAccent),
    globalMegaCapChartItem(
        'nestle', 'NESN  Nestle', 'SIX:NESN', 'SIX-NESN', Colors.tealAccent),
    globalMegaCapChartItem('roche', 'ROG  Roche', 'SIX:ROG', 'SIX-ROG', _blue),
    globalMegaCapChartItem(
        'novartis', 'NOVN  Novartis', 'SIX:NOVN', 'SIX-NOVN', _cyan),
    globalMegaCapChartItem(
        'astrazeneca', 'AZN  AstraZeneca', 'LSE:AZN', 'LSE-AZN', _purple),
    globalMegaCapChartItem(
        'shell', 'SHEL  Shell', 'LSE:SHEL', 'LSE-SHEL', Colors.greenAccent),
    globalMegaCapChartItem('hsbc', 'HSBA  HSBC Holdings', 'LSE:HSBA',
        'LSE-HSBA', Colors.orangeAccent),
    globalMegaCapChartItem(
        'bhp', 'BHP  BHP Group', 'ASX:BHP', 'ASX-BHP', Colors.redAccent),
    globalMegaCapChartItem('catl', '300750  CATL', 'SZSE:300750', 'SZSE-300750',
        Colors.amberAccent),
    globalMegaCapChartItem('sony', '6758  Sony Group', 'TSE:6758', 'TSE-6758',
        Colors.lightBlueAccent),
    globalMegaCapChartItem('mufg', '8306  Mitsubishi UFJ', 'TSE:8306',
        'TSE-8306', Colors.pinkAccent),
    globalMegaCapChartItem('reliance', 'RELIANCE  Reliance Industries',
        'NSE:RELIANCE', 'NSE-RELIANCE', Colors.tealAccent),
    globalMegaCapChartItem(
        'icbc', '1398  ICBC', 'HKEX:1398', 'HKEX-1398', _blue),
    globalMegaCapChartItem(
        'chinaMobile', '0941  China Mobile', 'HKEX:0941', 'HKEX-0941', _cyan),
    globalMegaCapChartItem(
        'meituan', '3690  Meituan', 'HKEX:3690', 'HKEX-3690', _purple),
    globalMegaCapChartItem(
        'byd', '1211  BYD', 'HKEX:1211', 'HKEX-1211', Colors.greenAccent),
    globalMegaCapChartItem('hermes', 'RMS  Hermes', 'EURONEXT:RMS',
        'EURONEXT-RMS', Colors.orangeAccent),
    globalMegaCapChartItem(
        'siemens', 'SIE  Siemens', 'XETR:SIE', 'XETR-SIE', Colors.redAccent),
    globalMegaCapChartItem('totalEnergies', 'TTE  TotalEnergies',
        'EURONEXT:TTE', 'EURONEXT-TTE', Colors.amberAccent),
    globalMegaCapChartItem('commonwealthBank', 'CBA  Commonwealth Bank',
        'ASX:CBA', 'ASX-CBA', Colors.lightBlueAccent),
    globalMegaCapChartItem('unilever', 'ULVR  Unilever', 'LSE:ULVR', 'LSE-ULVR',
        Colors.pinkAccent),
    globalMegaCapChartItem(
        'aia', '1299  AIA Group', 'HKEX:1299', 'HKEX-1299', Colors.tealAccent),
    cryptoChartItem('BTC', 'Bitcoin', Colors.amberAccent),
    cryptoChartItem('ETH', 'Ethereum', _blue),
    cryptoChartItem('USDT', 'Tether', Colors.greenAccent),
    cryptoChartItem('XRP', 'XRP', Colors.lightBlueAccent),
    cryptoChartItem('BNB', 'BNB', Colors.orangeAccent),
    cryptoChartItem('SOL', 'Solana', _purple),
    cryptoChartItem('USDC', 'USD Coin', _cyan),
    cryptoChartItem('TRX', 'TRON', Colors.redAccent),
    cryptoChartItem('DOGE', 'Dogecoin', Colors.amberAccent),
    cryptoChartItem('ADA', 'Cardano', Colors.blueAccent),
    cryptoChartItem('HYPE', 'Hyperliquid', Colors.greenAccent),
    cryptoChartItem('SUI', 'Sui', Colors.lightBlueAccent),
    cryptoChartItem('BCH', 'Bitcoin Cash', Colors.orangeAccent),
    cryptoChartItem('LINK', 'Chainlink', _blue),
    cryptoChartItem('XLM', 'Stellar', _cyan),
    cryptoChartItem('AVAX', 'Avalanche', Colors.redAccent),
    cryptoChartItem('LEO', 'UNUS SED LEO', Colors.purpleAccent),
    cryptoChartItem('TON', 'Toncoin', Colors.lightBlueAccent),
    cryptoChartItem('LTC', 'Litecoin', Colors.blueGrey),
    cryptoChartItem('SHIB', 'Shiba Inu', Colors.orangeAccent),
    cryptoChartItem('HBAR', 'Hedera', Colors.white70),
    cryptoChartItem('DOT', 'Polkadot', Colors.pinkAccent),
    cryptoChartItem('UNI', 'Uniswap', _purple),
    cryptoChartItem('XMR', 'Monero', Colors.orangeAccent),
    cryptoChartItem('DAI', 'Dai', Colors.amberAccent),
    cryptoChartItem('APT', 'Aptos', Colors.tealAccent),
    cryptoChartItem('PEPE', 'Pepe', Colors.greenAccent),
    cryptoChartItem('OKB', 'OKB', Colors.blueAccent),
    cryptoChartItem('TAO', 'Bittensor', Colors.purpleAccent),
    cryptoChartItem('ICP', 'Internet Computer', Colors.redAccent),
    cryptoChartItem('ETC', 'Ethereum Classic', Colors.greenAccent),
    cryptoChartItem('NEAR', 'NEAR Protocol', Colors.lightGreenAccent),
    cryptoChartItem('AAVE', 'Aave', _blue),
    cryptoChartItem('ONDO', 'Ondo', Colors.lightBlueAccent),
    cryptoChartItem('POL', 'Polygon Ecosystem Token', _purple),
    cryptoChartItem('KAS', 'Kaspa', Colors.cyanAccent),
    cryptoChartItem('CRO', 'Cronos', Colors.blueAccent),
    cryptoChartItem('ATOM', 'Cosmos', Colors.indigoAccent),
    cryptoChartItem('ALGO', 'Algorand', Colors.grey),
    cryptoChartItem('VET', 'VeChain', Colors.tealAccent),
    cryptoChartItem('FIL', 'Filecoin', Colors.lightBlueAccent),
    cryptoChartItem('ARB', 'Arbitrum', _blue),
    cryptoChartItem('KCS', 'KuCoin Token', Colors.greenAccent),
    cryptoChartItem('OP', 'Optimism', Colors.redAccent),
    cryptoChartItem('WLD', 'Worldcoin', Colors.white70),
    cryptoChartItem('SEI', 'Sei', Colors.redAccent),
    cryptoChartItem('BONK', 'Bonk', Colors.orangeAccent),
    cryptoChartItem('INJ', 'Injective', Colors.cyanAccent),
    cryptoChartItem(
        'FET', 'Artificial Superintelligence Alliance', Colors.greenAccent),
    cryptoChartItem('RENDER', 'Render', Colors.purpleAccent),
    popularEtfChartItem('EWY', 'iShares MSCI South Korea ETF', 'AMEX', _blue),
    popularEtfChartItem('EWJ', 'iShares MSCI Japan ETF', 'AMEX', _cyan),
    popularEtfChartItem('FXI', 'iShares China Large-Cap ETF', 'AMEX', _purple),
    popularEtfChartItem(
        'MCHI', 'iShares MSCI China ETF', 'NASDAQ', Colors.greenAccent),
    popularEtfChartItem(
        'EWT', 'iShares MSCI Taiwan ETF', 'AMEX', Colors.orangeAccent),
    popularEtfChartItem(
        'INDA', 'iShares MSCI India ETF', 'AMEX', Colors.redAccent),
    popularEtfChartItem(
        'VGK', 'Vanguard FTSE Europe ETF', 'AMEX', Colors.amberAccent),
    popularEtfChartItem(
        'EWG', 'iShares MSCI Germany ETF', 'AMEX', Colors.lightBlueAccent),
    popularEtfChartItem(
        'EWQ', 'iShares MSCI France ETF', 'AMEX', Colors.pinkAccent),
    popularEtfChartItem(
        'EWZ', 'iShares MSCI Brazil ETF', 'AMEX', Colors.tealAccent),
    popularEtfChartItem('EWW', 'iShares MSCI Mexico ETF', 'AMEX', _blue),
    macroChartItem(
        'vix', 'VIX  Volatility Index', 'TVC:VIX', 'TVC-VIX', Colors.redAccent),
    popularEtfChartItem('UVXY', 'ProShares Ultra VIX Short-Term Futures ETF',
        'AMEX', Colors.orangeAccent),
    popularEtfChartItem('SVXY', 'ProShares Short VIX Short-Term Futures ETF',
        'AMEX', Colors.greenAccent),
    macroChartItem(
        'move', 'MOVE  Bond Volatility Index', 'TVC:MOVE', 'TVC-MOVE', _purple),
    macroChartItem('vvix', 'VVIX  VIX Volatility Index', 'CBOE:VVIX',
        'CBOE-VVIX', Colors.pinkAccent),
    macroChartItem(
        'us10y', 'US10Y  U.S. 10-Year Yield', 'TVC:US10Y', 'TVC-US10Y', _blue),
    macroChartItem(
        'us02y', 'US02Y  U.S. 2-Year Yield', 'TVC:US02Y', 'TVC-US02Y', _cyan),
    macroChartItem('us30y', 'US30Y  U.S. 30-Year Yield', 'TVC:US30Y',
        'TVC-US30Y', Colors.amberAccent),
    popularStockChartItem(
        'SMCI', 'Super Micro Computer', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem(
        'SOFI', 'SoFi Technologies 소파이 핀테크', 'NASDAQ', Colors.cyanAccent),
    popularStockChartItem(
        'AFRM', 'Affirm 어펌 핀테크 BNPL', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem(
        'UPST', 'Upstart 업스타트 AI lending', 'NASDAQ', Colors.pinkAccent),
    popularStockChartItem(
        'RBLX', 'Roblox 로블록스 gaming metaverse', 'NYSE', Colors.redAccent),
    popularStockChartItem(
        'NET', 'Cloudflare 클라우드플레어 cybersecurity', 'NYSE', Colors.orangeAccent),
    popularStockChartItem(
        'MDB', 'MongoDB 몽고디비 database', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem(
        'RDDT', 'Reddit 레딧 social media', 'NYSE', Colors.deepOrangeAccent),
    popularStockChartItem(
        'HIMS', 'Hims & Hers 힘스 healthcare', 'NYSE', Colors.tealAccent),
    popularStockChartItem(
        'CELH', 'Celsius 셀시어스 energy drink', 'NASDAQ', Colors.amberAccent),
    popularStockChartItem('DUOL', 'Duolingo 듀오링고 education AI', 'NASDAQ',
        Colors.lightGreenAccent),
    popularStockChartItem(
        'CAVA', 'Cava 카바 restaurant', 'NYSE', Colors.yellowAccent),
    popularStockChartItem(
        'SHAK', 'Shake Shack 쉐이크쉑 restaurant', 'NYSE', Colors.greenAccent),
    popularStockChartItem(
        'ELF', 'e.l.f. Beauty 엘프뷰티 cosmetics', 'NYSE', Colors.pinkAccent),
    popularStockChartItem(
        'CART', 'Instacart 인스타카트 delivery', 'NASDAQ', Colors.lightGreenAccent),
    popularStockChartItem(
        'TOST', 'Toast 토스트 restaurant tech', 'NYSE', Colors.orangeAccent),
    popularStockChartItem(
        'U', 'Unity Software 유니티 game engine', 'NYSE', Colors.blueAccent),
    popularStockChartItem(
        'PATH', 'UiPath 유아이패스 automation AI', 'NYSE', Colors.lightBlueAccent),
    popularStockChartItem('AI', 'C3.ai 씨쓰리에이아이 artificial intelligence', 'NYSE',
        Colors.purpleAccent),
    popularStockChartItem(
        'SOUN', 'SoundHound AI 사운드하운드 AI', 'NASDAQ', Colors.deepPurpleAccent),
    popularStockChartItem(
        'BBAI', 'BigBear.ai 빅베어 AI', 'NYSE', Colors.indigoAccent),
    popularStockChartItem(
        'SERV', 'Serve Robotics 서브로보틱스 robot', 'NASDAQ', Colors.cyanAccent),
    popularStockChartItem(
        'SYM', 'Symbotic 심보틱 robotics automation', 'NASDAQ', Colors.tealAccent),
    popularStockChartItem('TER', 'Teradyne 테라다인 robotics semiconductor',
        'NASDAQ', Colors.blueAccent),
    popularStockChartItem(
        'IRBT', 'iRobot 아이로봇 robotics', 'NASDAQ', Colors.grey),
    popularStockChartItem(
        'OKLO', 'Oklo 오클로 nuclear SMR', 'NYSE', Colors.amberAccent),
    popularStockChartItem(
        'SMR', 'NuScale 뉴스케일 SMR nuclear', 'NYSE', Colors.lightBlueAccent),
    popularStockChartItem('LEU', 'Centrus Energy 센트러스 uranium nuclear', 'AMEX',
        Colors.greenAccent),
    popularStockChartItem(
        'CCJ', 'Cameco 카메코 uranium nuclear', 'NYSE', Colors.lightGreenAccent),
    popularStockChartItem(
        'UEC', 'Uranium Energy 우라늄에너지', 'AMEX', Colors.yellowAccent),
    popularStockChartItem(
        'RKLB', 'Rocket Lab 로켓랩 space', 'NASDAQ', Colors.blueAccent),
    popularStockChartItem(
        'ASTS', 'AST SpaceMobile 에이에스티 우주통신', 'NASDAQ', Colors.purpleAccent),
    popularStockChartItem('LUNR', 'Intuitive Machines 인튜이티브머신스 lunar space',
        'NASDAQ', Colors.indigoAccent),
    popularStockChartItem(
        'ACHR', 'Archer Aviation 아처항공 eVTOL', 'NYSE', Colors.cyanAccent),
    popularStockChartItem(
        'JOBY', 'Joby Aviation 조비항공 eVTOL', 'NYSE', Colors.tealAccent),
    popularStockChartItem(
        'EVTL', 'Vertical Aerospace 버티컬 eVTOL', 'NYSE', Colors.lightBlueAccent),
    popularStockChartItem(
        'BLDE', 'Blade Air Mobility 블레이드 항공모빌리티', 'NASDAQ', Colors.pinkAccent),
    popularStockChartItem('LCID', 'Lucid 루시드 EV', 'NASDAQ', Colors.grey),
    popularStockChartItem(
        'NIO', 'NIO 니오 중국 전기차 EV', 'NYSE', Colors.greenAccent),
    popularStockChartItem(
        'LI', 'Li Auto 리오토 중국 전기차 EV', 'NASDAQ', Colors.lightGreenAccent),
    popularStockChartItem(
        'XPEV', 'XPeng 샤오펑 중국 전기차 EV', 'NYSE', Colors.cyanAccent),
    popularStockChartItem(
        'BABA', 'Alibaba 알리바바 중국 ecommerce', 'NYSE', Colors.orangeAccent),
    popularStockChartItem(
        'BIDU', 'Baidu 바이두 중국 AI search', 'NASDAQ', Colors.blueAccent),
    popularStockChartItem(
        'JD', 'JD.com 징동닷컴 중국 ecommerce', 'NASDAQ', Colors.redAccent),
    popularStockChartItem(
        'TME', 'Tencent Music 텐센트뮤직 China music', 'NYSE', Colors.greenAccent),
    popularStockChartItem(
        'BILI', 'Bilibili 빌리빌리 China video', 'NASDAQ', Colors.lightBlueAccent),
    popularStockChartItem(
        'BEKE', 'KE Holdings 베이커 China real estate', 'NYSE', Colors.tealAccent),
    popularStockChartItem(
        'YMM', 'Full Truck Alliance 만방 물류 China', 'NYSE', Colors.amberAccent),
    popularStockChartItem('SE', 'Sea Limited 씨 리미티드 동남아 ecommerce game', 'NYSE',
        Colors.deepPurpleAccent),
    popularStockChartItem(
        'GRAB', 'Grab 그랩 동남아 super app', 'NASDAQ', Colors.greenAccent),
    popularStockChartItem(
        'NU', 'Nu Holdings 누뱅크 fintech Brazil', 'NYSE', Colors.purpleAccent),
    popularStockChartItem(
        'STNE', 'StoneCo 스톤코 Brazil fintech', 'NASDAQ', Colors.blueAccent),
    popularStockChartItem('PAGS', 'PagSeguro 팍세구로 Brazil fintech', 'NYSE',
        Colors.lightBlueAccent),
    popularStockChartItem('CRSP', 'CRISPR Therapeutics 크리스퍼 gene editing',
        'NASDAQ', Colors.greenAccent),
    popularStockChartItem('EDIT', 'Editas Medicine 에디타스 gene editing', 'NASDAQ',
        Colors.orangeAccent),
    popularStockChartItem('BEAM', 'Beam Therapeutics 빔 gene editing', 'NASDAQ',
        Colors.pinkAccent),
    popularStockChartItem('NTLA', 'Intellia Therapeutics 인텔리아 gene editing',
        'NASDAQ', Colors.cyanAccent),
    popularStockChartItem('DNA', 'Ginkgo Bioworks 깅코바이오웍스 biotech', 'NYSE',
        Colors.lightGreenAccent),
    popularStockChartItem('RXRX', 'Recursion Pharmaceuticals 리커전 AI biotech',
        'NASDAQ', Colors.deepPurpleAccent),
    popularStockChartItem(
        'TEM', 'Tempus AI 템퍼스 AI healthcare', 'NASDAQ', Colors.indigoAccent),
    popularStockChartItem(
        'ENVX', 'Enovix 에노빅스 battery', 'NASDAQ', Colors.orangeAccent),
    popularStockChartItem('QS', 'QuantumScape 퀀텀스케이프 solid state battery',
        'NYSE', Colors.amberAccent),
    popularStockChartItem(
        'ALB', 'Albemarle 앨버말 lithium', 'NYSE', Colors.lightGreenAccent),
    popularStockChartItem(
        'LAC', 'Lithium Americas 리튬아메리카스', 'NYSE', Colors.greenAccent),
    popularStockChartItem(
        'PLL', 'Piedmont Lithium 피드몬트 리튬', 'NASDAQ', Colors.tealAccent),
    popularStockChartItem(
        'DELL', 'Dell Technologies', 'NYSE', Colors.lightBlueAccent),
    popularStockChartItem(
        'HPE', 'Hewlett Packard Enterprise', 'NYSE', Colors.tealAccent),
    popularStockChartItem(
        'VRT', 'Vertiv Holdings', 'NYSE', Colors.orangeAccent),
    globalMegaCapChartItem('skHynix', '000660  SK Hynix SK하이닉스 하이닉스',
        'KRX:000660', 'KRX-000660', _purple),
    globalMegaCapChartItem('hyundaiMotor', '005380  Hyundai Motor 현대차 현대자동차',
        'KRX:005380', 'KRX-005380', Colors.greenAccent),
    globalMegaCapChartItem('naver', '035420  NAVER 네이버', 'KRX:035420',
        'KRX-035420', Colors.lightGreenAccent),
    globalMegaCapChartItem('kakao', '035720  Kakao 카카오', 'KRX:035720',
        'KRX-035720', Colors.amberAccent),
    globalMegaCapChartItem('lgChem', '051910  LG Chem LG화학 엘지화학', 'KRX:051910',
        'KRX-051910', Colors.redAccent),
    globalMegaCapChartItem(
        'lgEnergySolution',
        '373220  LG Energy Solution LG에너지솔루션',
        'KRX:373220',
        'KRX-373220',
        Colors.cyanAccent),
    globalMegaCapChartItem(
        'softbank', '9984  SoftBank Group', 'TSE:9984', 'TSE-9984', _blue),
    globalMegaCapChartItem(
        'tokyoElectron', '8035  Tokyo Electron', 'TSE:8035', 'TSE-8035', _cyan),
    globalMegaCapChartItem(
        'keyence', '6861  Keyence', 'TSE:6861', 'TSE-6861', _purple),
    globalMegaCapChartItem('shinEtsu', '4063  Shin-Etsu Chemical', 'TSE:4063',
        'TSE-4063', Colors.greenAccent),
    globalMegaCapChartItem('recruit', '6098  Recruit Holdings', 'TSE:6098',
        'TSE-6098', Colors.orangeAccent),
    popularStockChartItem('NOC', 'Northrop Grumman', 'NYSE', Colors.redAccent),
    popularStockChartItem(
        'GD', 'General Dynamics', 'NYSE', Colors.lightBlueAccent),
    popularStockChartItem(
        'LHX', 'L3Harris Technologies', 'NYSE', Colors.pinkAccent),
    popularStockChartItem('ETR', 'Entergy', 'NYSE', Colors.greenAccent),
    popularStockChartItem('VST', 'Vistra', 'NYSE', Colors.amberAccent),
    popularStockChartItem('PWR', 'Quanta Services', 'NYSE', Colors.tealAccent),
    countryLargeCapChartItem('krKia', '000270  Kia 기아 Korea auto EV 자동차',
        'KRX:000270', 'KRX-000270', Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'krKbFinancial',
        '105560  KB Financial KB금융 Korea bank finance 은행',
        'KRX:105560',
        'KRX-105560',
        _blue),
    countryLargeCapChartItem(
        'krShinhan',
        '055550  Shinhan Financial 신한지주 Korea bank finance 은행',
        'KRX:055550',
        'KRX-055550',
        _cyan),
    countryLargeCapChartItem(
        'krHana',
        '086790  Hana Financial 하나금융지주 Korea bank finance 은행',
        'KRX:086790',
        'KRX-086790',
        _purple),
    countryLargeCapChartItem(
        'krSamsungBio',
        '207940  Samsung Biologics 삼성바이오로직스 Korea biotech pharma 바이오',
        'KRX:207940',
        'KRX-207940',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'krCelltrion',
        '068270  Celltrion 셀트리온 Korea biotech pharma 바이오',
        'KRX:068270',
        'KRX-068270',
        Colors.tealAccent),
    countryLargeCapChartItem(
        'krPosco',
        '005490  POSCO Holdings 포스코홀딩스 Korea steel materials 철강',
        'KRX:005490',
        'KRX-005490',
        Colors.blueGrey),
    countryLargeCapChartItem(
        'krHanwhaAerospace',
        '012450  Hanwha Aerospace 한화에어로스페이스 Korea defense aerospace 방산',
        'KRX:012450',
        'KRX-012450',
        Colors.orangeAccent),
    countryLargeCapChartItem(
        'krLge',
        '066570  LG Electronics LG전자 Korea electronics appliance 전자',
        'KRX:066570',
        'KRX-066570',
        Colors.redAccent),
    countryLargeCapChartItem(
        'krSamsungSdi',
        '006400  Samsung SDI 삼성SDI Korea battery EV 배터리',
        'KRX:006400',
        'KRX-006400',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'krHyundaiMobis',
        '012330  Hyundai Mobis 현대모비스 Korea auto parts 자동차부품',
        'KRX:012330',
        'KRX-012330',
        Colors.lightGreenAccent),
    countryLargeCapChartItem(
        'krKoreaAerospace',
        '047810  Korea Aerospace 한국항공우주 KAI Korea defense aerospace 항공우주',
        'KRX:047810',
        'KRX-047810',
        Colors.indigoAccent),
    countryLargeCapChartItem(
        'krDoosanEnerbility',
        '034020  Doosan Enerbility 두산에너빌리티 Korea nuclear power energy 원전',
        'KRX:034020',
        'KRX-034020',
        Colors.cyanAccent),
    countryLargeCapChartItem(
        'krLgHnh',
        '051900  LG H&H LG생활건강 Korea cosmetics consumer',
        'KRX:051900',
        'KRX-051900',
        Colors.pinkAccent),
    countryLargeCapChartItem(
        'krLgCorp',
        '003550  LG Corp LG Korea holding electronics chemical',
        'KRX:003550',
        'KRX-003550',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'krSkTelecom',
        '017670  SK Telecom SK텔레콤 Korea telecom AI',
        'KRX:017670',
        'KRX-017670',
        Colors.orangeAccent),
    countryLargeCapChartItem(
        'krSkInnovation',
        '096770  SK Innovation SK이노베이션 Korea battery oil energy',
        'KRX:096770',
        'KRX-096770',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'krPoscoFutureM',
        '003670  POSCO Future M 포스코퓨처엠 Korea battery materials',
        'KRX:003670',
        'KRX-003670',
        Colors.tealAccent),
    countryLargeCapChartItem(
        'krSamsungCnt',
        '028260  Samsung C&T 삼성물산 Korea construction trading',
        'KRX:028260',
        'KRX-028260',
        Colors.blueGrey),
    countryLargeCapChartItem(
        'krSamsungLife',
        '032830  Samsung Life 삼성생명 Korea insurance finance',
        'KRX:032830',
        'KRX-032830',
        _blue),
    countryLargeCapChartItem(
        'krSamsungSds',
        '018260  Samsung SDS 삼성에스디에스 Korea software cloud',
        'KRX:018260',
        'KRX-018260',
        _cyan),
    countryLargeCapChartItem(
        'krKoreaZinc',
        '010130  Korea Zinc 고려아연 Korea materials metal zinc',
        'KRX:010130',
        'KRX-010130',
        Colors.blueGrey),
    countryLargeCapChartItem(
        'krSamsungElectro',
        '009150  Samsung Electro-Mechanics 삼성전기 Korea electronics components',
        'KRX:009150',
        'KRX-009150',
        Colors.purpleAccent),
    countryLargeCapChartItem('krSoil', '010950  S-Oil 에쓰오일 Korea oil energy',
        'KRX:010950', 'KRX-010950', Colors.redAccent),
    countryLargeCapChartItem(
        'krHmm',
        '011200  HMM 에이치엠엠 Korea shipping logistics',
        'KRX:011200',
        'KRX-011200',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'krEcopro',
        '086520  EcoPro 에코프로 Korea battery materials',
        'KOSDAQ:086520',
        'KOSDAQ-086520',
        Colors.lightGreenAccent),
    countryLargeCapChartItem(
        'krEcoproBm',
        '247540  EcoPro BM 에코프로비엠 Korea battery materials',
        'KOSDAQ:247540',
        'KOSDAQ-247540',
        Colors.greenAccent),
    countryLargeCapChartItem('krOrion', '271560  Orion 오리온 Korea food consumer',
        'KRX:271560', 'KRX-271560', Colors.amberAccent),
    countryLargeCapChartItem(
        'krAmorepacific',
        '090430  Amorepacific 아모레퍼시픽 Korea cosmetics consumer',
        'KRX:090430',
        'KRX-090430',
        Colors.pinkAccent),
    countryLargeCapChartItem(
        'krSamsungHeavy',
        '010140  Samsung Heavy Industries 삼성중공업 Korea shipbuilding industrial',
        'KRX:010140',
        'KRX-010140',
        Colors.blueAccent),
    countryLargeCapChartItem(
        'krHyundaiElectric',
        '267260  HD Hyundai Electric HD현대일렉트릭 Korea power electric',
        'KRX:267260',
        'KRX-267260',
        Colors.cyanAccent),
    countryLargeCapChartItem(
        'krHyundaiHeavy',
        '329180  HD Hyundai Heavy Industries HD현대중공업 Korea shipbuilding industrial',
        'KRX:329180',
        'KRX-329180',
        Colors.indigoAccent),
    countryLargeCapChartItem(
        'krSkSquare',
        '402340  SK Square SK스퀘어 Korea technology investment',
        'KRX:402340',
        'KRX-402340',
        Colors.purpleAccent),
    countryLargeCapChartItem(
        'jpHitachi',
        '6501  Hitachi 히타치 日立 Japan industrial infrastructure',
        'TSE:6501',
        'TSE-6501',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'jpMitsubishiCorp',
        '8058  Mitsubishi Corporation 미쓰비시상사 三菱商事 Japan trading energy',
        'TSE:8058',
        'TSE-8058',
        Colors.orangeAccent),
    countryLargeCapChartItem(
        'jpItochu',
        '8001  Itochu 이토추 伊藤忠 Japan trading commerce',
        'TSE:8001',
        'TSE-8001',
        Colors.amberAccent),
    countryLargeCapChartItem(
        'jpSumitomoMitsui',
        '8316  Sumitomo Mitsui SMFG 미쓰이스미토모 三井住友 Japan bank finance',
        'TSE:8316',
        'TSE-8316',
        _blue),
    countryLargeCapChartItem(
        'jpMizuho',
        '8411  Mizuho Financial 미즈호 みずほ Japan bank finance',
        'TSE:8411',
        'TSE-8411',
        _cyan),
    countryLargeCapChartItem(
        'jpNintendo',
        '7974  Nintendo 닌텐도 任天堂 Japan gaming game',
        'TSE:7974',
        'TSE-7974',
        Colors.redAccent),
    countryLargeCapChartItem(
        'jpHonda',
        '7267  Honda 혼다 本田 Japan auto EV motorcycle',
        'TSE:7267',
        'TSE-7267',
        Colors.redAccent),
    countryLargeCapChartItem(
        'jpMitsubishiHeavy',
        '7011  Mitsubishi Heavy Industries 미쓰비시중공업 三菱重工 Japan defense industrial',
        'TSE:7011',
        'TSE-7011',
        Colors.blueGrey),
    countryLargeCapChartItem(
        'jpFastRetailing',
        '9983  Fast Retailing Uniqlo 패스트리테일링 유니클로 Japan retail apparel',
        'TSE:9983',
        'TSE-9983',
        Colors.pinkAccent),
    countryLargeCapChartItem(
        'jpDaikin',
        '6367  Daikin 다이킨 ダイキン Japan industrial air conditioning',
        'TSE:6367',
        'TSE-6367',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'jpFanuc',
        '6954  FANUC 화낙 ファナック Japan robotics automation robot',
        'TSE:6954',
        'TSE-6954',
        Colors.yellowAccent),
    countryLargeCapChartItem(
        'jpMurata',
        '6981  Murata 무라타 村田製作所 Japan electronics components',
        'TSE:6981',
        'TSE-6981',
        Colors.tealAccent),
    countryLargeCapChartItem(
        'jpDisco',
        '6146  Disco 디스코 ディスコ Japan semiconductor equipment',
        'TSE:6146',
        'TSE-6146',
        Colors.purpleAccent),
    countryLargeCapChartItem(
        'jpNtt',
        '9432  Nippon Telegraph and Telephone NTT 일본전신전화 Japan telecom',
        'TSE:9432',
        'TSE-9432',
        Colors.blueAccent),
    countryLargeCapChartItem('jpKddi', '9433  KDDI 케이디디아이 Japan telecom',
        'TSE:9433', 'TSE-9433', Colors.orangeAccent),
    countryLargeCapChartItem(
        'jpSoftbankCorp',
        '9434  SoftBank Corp 소프트뱅크 Japan telecom',
        'TSE:9434',
        'TSE-9434',
        Colors.pinkAccent),
    countryLargeCapChartItem(
        'jpSevenI',
        '3382  Seven & i 세븐앤아이 Japan retail convenience',
        'TSE:3382',
        'TSE-3382',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'jpTakeda',
        '4502  Takeda Pharmaceutical 다케다 武田 Japan pharma healthcare',
        'TSE:4502',
        'TSE-4502',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'jpDaiichiSankyo',
        '4568  Daiichi Sankyo 다이이치산쿄 第一三共 Japan pharma healthcare',
        'TSE:4568',
        'TSE-4568',
        Colors.redAccent),
    countryLargeCapChartItem(
        'jpChugai',
        '4519  Chugai Pharmaceutical 주가이 中外製薬 Japan pharma biotech',
        'TSE:4519',
        'TSE-4519',
        Colors.tealAccent),
    countryLargeCapChartItem(
        'jpFujitsu',
        '6702  Fujitsu 후지쯔 富士通 Japan software technology',
        'TSE:6702',
        'TSE-6702',
        _blue),
    countryLargeCapChartItem(
        'jpFujifilm',
        '4901  Fujifilm 후지필름 富士フイルム Japan healthcare materials',
        'TSE:4901',
        'TSE-4901',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'jpPanasonic',
        '6752  Panasonic 파나소닉 Japan electronics battery',
        'TSE:6752',
        'TSE-6752',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'jpCanon',
        '7751  Canon 캐논 キヤノン Japan electronics camera',
        'TSE:7751',
        'TSE-7751',
        Colors.redAccent),
    countryLargeCapChartItem('jpSubaru', '7270  Subaru 스바루 Japan auto',
        'TSE:7270', 'TSE-7270', Colors.blueAccent),
    countryLargeCapChartItem('jpNissan', '7201  Nissan 닛산 日産 Japan auto EV',
        'TSE:7201', 'TSE-7201', Colors.orangeAccent),
    countryLargeCapChartItem(
        'jpKomatsu',
        '6301  Komatsu 고마쓰 小松 Japan construction machinery',
        'TSE:6301',
        'TSE-6301',
        Colors.yellowAccent),
    countryLargeCapChartItem(
        'jpNidec',
        '6594  Nidec 니덱 日本電産 Japan electric motor industrial',
        'TSE:6594',
        'TSE-6594',
        Colors.purpleAccent),
    countryLargeCapChartItem(
        'cnPdd',
        'PDD  PDD Holdings 핀둬둬 拼多多 China ecommerce',
        'NASDAQ:PDD',
        'NASDAQ-PDD',
        Colors.tealAccent),
    countryLargeCapChartItem(
        'cnNetEase',
        '9999  NetEase 넷이즈 网易 網易 China gaming internet',
        'HKEX:9999',
        'HKEX-9999',
        Colors.redAccent),
    countryLargeCapChartItem(
        'cnXiaomi',
        '1810  Xiaomi 샤오미 小米 China electronics EV smartphone',
        'HKEX:1810',
        'HKEX-1810',
        Colors.orangeAccent),
    countryLargeCapChartItem(
        'cnJd',
        '9618  JD.com 징동닷컴 京东 京東 China ecommerce logistics',
        'HKEX:9618',
        'HKEX-9618',
        Colors.redAccent),
    countryLargeCapChartItem(
        'cnBaidu',
        '9888  Baidu 바이두 百度 China AI search internet',
        'HKEX:9888',
        'HKEX-9888',
        Colors.blueAccent),
    countryLargeCapChartItem(
        'cnCnooc',
        '0883  CNOOC 중국해양석유 中国海洋石油 China oil energy',
        'HKEX:0883',
        'HKEX-0883',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'cnPetroChina',
        '0857  PetroChina 페트로차이나 中国石油 China oil energy',
        'HKEX:0857',
        'HKEX-0857',
        Colors.redAccent),
    countryLargeCapChartItem(
        'cnSinopec',
        '0386  Sinopec 시노펙 中国石化 China oil energy',
        'HKEX:0386',
        'HKEX-0386',
        Colors.pinkAccent),
    countryLargeCapChartItem(
        'cnPingAn',
        '2318  Ping An Insurance 핑안보험 中国平安 China insurance finance',
        'HKEX:2318',
        'HKEX-2318',
        Colors.orangeAccent),
    countryLargeCapChartItem(
        'cnCcb',
        '0939  China Construction Bank 건설은행 建设银行 China bank finance',
        'HKEX:0939',
        'HKEX-0939',
        _blue),
    countryLargeCapChartItem(
        'cnBoc',
        '3988  Bank of China 중국은행 中国银行 China bank finance',
        'HKEX:3988',
        'HKEX-3988',
        _cyan),
    countryLargeCapChartItem(
        'cnCmb',
        '3968  China Merchants Bank 초상은행 招商银行 China bank finance',
        'HKEX:3968',
        'HKEX-3968',
        _purple),
    countryLargeCapChartItem(
        'cnKweichowMoutai',
        '600519  Kweichow Moutai 귀주모태 贵州茅台 China beverage liquor',
        'SSE:600519',
        'SSE-600519',
        Colors.amberAccent),
    countryLargeCapChartItem(
        'cnWuliangye',
        '000858  Wuliangye 우량예 五粮液 China beverage liquor',
        'SZSE:000858',
        'SZSE-000858',
        Colors.deepOrangeAccent),
    countryLargeCapChartItem(
        'cnFoxconnIndustrial',
        '601138  Foxconn Industrial Internet 폭스콘산업인터넷 工业富联 China electronics AI',
        'SSE:601138',
        'SSE-601138',
        Colors.blueGrey),
    countryLargeCapChartItem('cnLiAuto', '2015  Li Auto 리오토 理想汽车 China EV auto',
        'HKEX:2015', 'HKEX-2015', Colors.lightGreenAccent),
    countryLargeCapChartItem('cnNio', '9866  NIO 니오 蔚来 China EV auto',
        'HKEX:9866', 'HKEX-9866', Colors.cyanAccent),
    countryLargeCapChartItem(
        'cnSmic',
        '0981  SMIC 중신국제 中芯国际 China semiconductor foundry',
        'HKEX:0981',
        'HKEX-0981',
        Colors.purpleAccent),
    countryLargeCapChartItem(
        'cnTrip',
        '9961  Trip.com 트립닷컴 携程 China travel internet',
        'HKEX:9961',
        'HKEX-9961',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'cnHaier',
        '6690  Haier Smart Home 하이얼 海尔智家 China appliance consumer',
        'HKEX:6690',
        'HKEX-6690',
        Colors.blueAccent),
    countryLargeCapChartItem(
        'cnChinaLife',
        '2628  China Life Insurance 중국생명 中国人寿 China insurance finance',
        'HKEX:2628',
        'HKEX-2628',
        Colors.redAccent),
    countryLargeCapChartItem(
        'cnShenhua',
        '1088  China Shenhua 중국신화 中国神华 China coal energy',
        'HKEX:1088',
        'HKEX-1088',
        Colors.grey),
    countryLargeCapChartItem(
        'cnZijin',
        '2899  Zijin Mining 쯔진광업 紫金矿业 China mining gold copper',
        'HKEX:2899',
        'HKEX-2899',
        Colors.amberAccent),
    countryLargeCapChartItem(
        'cnAnta',
        '2020  Anta Sports 안타 安踏 China sports apparel',
        'HKEX:2020',
        'HKEX-2020',
        Colors.redAccent),
    countryLargeCapChartItem(
        'cnLiNing',
        '2331  Li Ning 리닝 李宁 China sports apparel',
        'HKEX:2331',
        'HKEX-2331',
        Colors.orangeAccent),
    countryLargeCapChartItem(
        'cnNongfu',
        '9633  Nongfu Spring 농푸산취안 农夫山泉 China beverage consumer',
        'HKEX:9633',
        'HKEX-9633',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'cnCrBeer',
        '0291  China Resources Beer 화룬맥주 华润啤酒 China beverage',
        'HKEX:0291',
        'HKEX-0291',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'cnChinaTower',
        '0788  China Tower 중국철탑 中国铁塔 China telecom infrastructure',
        'HKEX:0788',
        'HKEX-0788',
        Colors.blueGrey),
    countryLargeCapChartItem(
        'cnGeely',
        '0175  Geely Auto 지리자동차 吉利汽车 China auto EV',
        'HKEX:0175',
        'HKEX-0175',
        Colors.cyanAccent),
    countryLargeCapChartItem(
        'twHonHai',
        '2317  Hon Hai Foxconn 훙하이 鴻海 Taiwan electronics AI server',
        'TWSE:2317',
        'TWSE-2317',
        Colors.blueAccent),
    countryLargeCapChartItem(
        'twMediatek',
        '2454  MediaTek 미디어텍 聯發科 Taiwan semiconductor chip',
        'TWSE:2454',
        'TWSE-2454',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'twQuanta',
        '2382  Quanta Computer 콴타 廣達 Taiwan AI server electronics',
        'TWSE:2382',
        'TWSE-2382',
        Colors.cyanAccent),
    countryLargeCapChartItem(
        'twDelta',
        '2308  Delta Electronics 델타 台達電 Taiwan power electronics',
        'TWSE:2308',
        'TWSE-2308',
        Colors.lightGreenAccent),
    countryLargeCapChartItem(
        'twFubon',
        '2881  Fubon Financial 푸본 富邦金 Taiwan bank insurance finance',
        'TWSE:2881',
        'TWSE-2881',
        _blue),
    countryLargeCapChartItem(
        'twCathay',
        '2882  Cathay Financial 캐세이 國泰金 Taiwan insurance finance',
        'TWSE:2882',
        'TWSE-2882',
        _cyan),
    countryLargeCapChartItem(
        'twChunghwa',
        '2412  Chunghwa Telecom 중화텔레콤 中華電 Taiwan telecom',
        'TWSE:2412',
        'TWSE-2412',
        Colors.tealAccent),
    countryLargeCapChartItem(
        'twUmc',
        '2303  UMC 유나이티드마이크로 聯電 Taiwan semiconductor foundry',
        'TWSE:2303',
        'TWSE-2303',
        Colors.purpleAccent),
    countryLargeCapChartItem(
        'twAsus',
        '2357  ASUS 에이수스 華碩 Taiwan electronics computer',
        'TWSE:2357',
        'TWSE-2357',
        Colors.indigoAccent),
    countryLargeCapChartItem(
        'twAcer',
        '2353  Acer 에이서 宏碁 Taiwan electronics computer',
        'TWSE:2353',
        'TWSE-2353',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'twEsun',
        '2884  E.SUN Financial 옥산금융 玉山金 Taiwan bank finance',
        'TWSE:2884',
        'TWSE-2884',
        Colors.amberAccent),
    countryLargeCapChartItem(
        'twMega',
        '2886  Mega Financial 메가금융 兆豐金 Taiwan bank finance',
        'TWSE:2886',
        'TWSE-2886',
        Colors.orangeAccent),
    countryLargeCapChartItem(
        'twFirstFinancial',
        '2892  First Financial 제일금융 第一金 Taiwan bank finance',
        'TWSE:2892',
        'TWSE-2892',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'twYuanta',
        '2885  Yuanta Financial 유안타 元大金 Taiwan brokerage finance',
        'TWSE:2885',
        'TWSE-2885',
        Colors.pinkAccent),
    countryLargeCapChartItem(
        'twWistron',
        '3231  Wistron 위스트론 緯創 Taiwan AI server electronics',
        'TWSE:3231',
        'TWSE-3231',
        Colors.blueGrey),
    countryLargeCapChartItem(
        'twLargan',
        '3008  Largan Precision 라간 大立光 Taiwan electronics optics',
        'TWSE:3008',
        'TWSE-3008',
        Colors.pinkAccent),
    countryLargeCapChartItem(
        'twNovatek',
        '3034  Novatek 노바텍 聯詠 Taiwan semiconductor chip',
        'TWSE:3034',
        'TWSE-3034',
        Colors.purpleAccent),
    countryLargeCapChartItem(
        'twRealtek',
        '2379  Realtek 리얼텍 瑞昱 Taiwan semiconductor chip',
        'TWSE:2379',
        'TWSE-2379',
        Colors.indigoAccent),
    countryLargeCapChartItem(
        'twAse',
        '3711  ASE Technology ASE 日月光 Taiwan semiconductor packaging',
        'TWSE:3711',
        'TWSE-3711',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'twLiteon',
        '2301  Lite-On Technology 라이트온 光寶科 Taiwan electronics',
        'TWSE:2301',
        'TWSE-2301',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'twPegatron',
        '4938  Pegatron 페가트론 和碩 Taiwan electronics manufacturing',
        'TWSE:4938',
        'TWSE-4938',
        Colors.blueAccent),
    countryLargeCapChartItem(
        'twCompal',
        '2324  Compal 컴팔 仁寶 Taiwan electronics computer',
        'TWSE:2324',
        'TWSE-2324',
        Colors.orangeAccent),
    countryLargeCapChartItem(
        'twInventec',
        '2356  Inventec 인벤텍 英業達 Taiwan electronics AI server',
        'TWSE:2356',
        'TWSE-2356',
        Colors.tealAccent),
    countryLargeCapChartItem(
        'twAdvantech',
        '2395  Advantech 어드밴텍 研華 Taiwan industrial computer',
        'TWSE:2395',
        'TWSE-2395',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'twEInk',
        '8069  E Ink 이잉크 元太 Taiwan display electronics',
        'TPEX:8069',
        'TPEX-8069',
        Colors.grey),
    countryLargeCapChartItem(
        'twEvergreenMarine',
        '2603  Evergreen Marine 에버그린 長榮 Taiwan shipping logistics',
        'TWSE:2603',
        'TWSE-2603',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'twYangMing',
        '2609  Yang Ming Marine 양밍 陽明 Taiwan shipping logistics',
        'TWSE:2609',
        'TWSE-2609',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'twFormosaPlastics',
        '1301  Formosa Plastics 포모사 台塑 Taiwan chemical materials',
        'TWSE:1301',
        'TWSE-1301',
        Colors.orangeAccent),
    countryLargeCapChartItem(
        'twNanYa',
        '1303  Nan Ya Plastics 난야 南亞 Taiwan chemical materials',
        'TWSE:1303',
        'TWSE-1303',
        Colors.redAccent),
    countryLargeCapChartItem(
        'deAllianz',
        'ALV  Allianz 알리안츠 Germany insurance finance',
        'XETR:ALV',
        'XETR-ALV',
        _blue),
    countryLargeCapChartItem(
        'deSiemensEnergy',
        'ENR  Siemens Energy 지멘스에너지 Germany energy industrial',
        'XETR:ENR',
        'XETR-ENR',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'deDeutscheTelekom',
        'DTE  Deutsche Telekom 도이치텔레콤 Germany telecom',
        'XETR:DTE',
        'XETR-DTE',
        Colors.pinkAccent),
    countryLargeCapChartItem(
        'deMunichRe',
        'MUV2  Munich Re 뮌헨리 Germany insurance reinsurance',
        'XETR:MUV2',
        'XETR-MUV2',
        _cyan),
    countryLargeCapChartItem(
        'deMercedes',
        'MBG  Mercedes-Benz 메르세데스벤츠 Germany auto EV',
        'XETR:MBG',
        'XETR-MBG',
        Colors.lightBlueAccent),
    countryLargeCapChartItem('deBmw', 'BMW  BMW 비엠더블유 Germany auto EV',
        'XETR:BMW', 'XETR-BMW', Colors.blueAccent),
    countryLargeCapChartItem(
        'deVolkswagen',
        'VOW3  Volkswagen 폭스바겐 Germany auto EV',
        'XETR:VOW3',
        'XETR-VOW3',
        Colors.indigoAccent),
    countryLargeCapChartItem(
        'deBayer',
        'BAYN  Bayer 바이엘 Germany pharma chemical',
        'XETR:BAYN',
        'XETR-BAYN',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'deBasf',
        'BAS  BASF 바스프 Germany chemical materials',
        'XETR:BAS',
        'XETR-BAS',
        Colors.orangeAccent),
    countryLargeCapChartItem(
        'deInfineon',
        'IFX  Infineon 인피니언 Germany semiconductor chip',
        'XETR:IFX',
        'XETR-IFX',
        Colors.purpleAccent),
    countryLargeCapChartItem(
        'dePorscheAg',
        'P911  Porsche AG 포르쉐 Germany auto luxury EV',
        'XETR:P911',
        'XETR-P911',
        Colors.amberAccent),
    countryLargeCapChartItem(
        'dePorscheHolding',
        'PAH3  Porsche Holding 포르쉐홀딩 Germany auto investment',
        'XETR:PAH3',
        'XETR-PAH3',
        Colors.orangeAccent),
    countryLargeCapChartItem(
        'deDeutscheBank',
        'DBK  Deutsche Bank 도이체방크 Germany bank finance',
        'XETR:DBK',
        'XETR-DBK',
        _blue),
    countryLargeCapChartItem(
        'deCommerzbank',
        'CBK  Commerzbank 코메르츠방크 Germany bank finance',
        'XETR:CBK',
        'XETR-CBK',
        _cyan),
    countryLargeCapChartItem(
        'deRheinmetall',
        'RHM  Rheinmetall 라인메탈 Germany defense industrial',
        'XETR:RHM',
        'XETR-RHM',
        Colors.redAccent),
    countryLargeCapChartItem(
        'deEon',
        'EOAN  E.ON 이온 Germany utility energy power',
        'XETR:EOAN',
        'XETR-EOAN',
        Colors.pinkAccent),
    countryLargeCapChartItem(
        'deRwe',
        'RWE  RWE Germany utility renewable energy',
        'XETR:RWE',
        'XETR-RWE',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'deHenkel',
        'HEN3  Henkel 헨켈 Germany consumer chemical',
        'XETR:HEN3',
        'XETR-HEN3',
        Colors.purpleAccent),
    countryLargeCapChartItem(
        'deAdidas',
        'ADS  Adidas 아디다스 Germany sports apparel',
        'XETR:ADS',
        'XETR-ADS',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'deDhl',
        'DHL  DHL Group 도이치포스트 Germany logistics delivery',
        'XETR:DHL',
        'XETR-DHL',
        Colors.yellowAccent),
    countryLargeCapChartItem(
        'deHeidelberg',
        'HEI  Heidelberg Materials 하이델베르크 Germany construction materials',
        'XETR:HEI',
        'XETR-HEI',
        Colors.blueGrey),
    countryLargeCapChartItem(
        'deMerckKgaa',
        'MRK  Merck KGaA 머크 Germany pharma chemical',
        'XETR:MRK',
        'XETR-MRK',
        Colors.tealAccent),
    countryLargeCapChartItem(
        'frLoreal',
        'OR  L Oreal 로레알 France cosmetics consumer',
        'EURONEXT:OR',
        'EURONEXT-OR',
        Colors.pinkAccent),
    countryLargeCapChartItem(
        'frSanofi',
        'SAN  Sanofi 사노피 France pharma healthcare',
        'EURONEXT:SAN',
        'EURONEXT-SAN',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'frAirbus',
        'AIR  Airbus 에어버스 France aerospace defense aviation',
        'EURONEXT:AIR',
        'EURONEXT-AIR',
        _blue),
    countryLargeCapChartItem(
        'frSchneider',
        'SU  Schneider Electric 슈나이더 France electric industrial',
        'EURONEXT:SU',
        'EURONEXT-SU',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'frBnp',
        'BNP  BNP Paribas BNP파리바 France bank finance',
        'EURONEXT:BNP',
        'EURONEXT-BNP',
        _cyan),
    countryLargeCapChartItem('frAxa', 'CS  AXA 악사 France insurance finance',
        'EURONEXT:CS', 'EURONEXT-CS', _purple),
    countryLargeCapChartItem(
        'frVinci',
        'DG  Vinci 빈치 France infrastructure construction',
        'EURONEXT:DG',
        'EURONEXT-DG',
        Colors.blueGrey),
    countryLargeCapChartItem(
        'frEssilor',
        'EL  EssilorLuxottica 에실로룩소티카 France healthcare eyewear',
        'EURONEXT:EL',
        'EURONEXT-EL',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'frSafran',
        'SAF  Safran 사프란 France aerospace defense aviation',
        'EURONEXT:SAF',
        'EURONEXT-SAF',
        Colors.blueAccent),
    countryLargeCapChartItem(
        'frDassaultSystemes',
        'DSY  Dassault Systemes 다쏘시스템 France software industrial',
        'EURONEXT:DSY',
        'EURONEXT-DSY',
        Colors.purpleAccent),
    countryLargeCapChartItem(
        'frKering',
        'KER  Kering 케링 France luxury consumer',
        'EURONEXT:KER',
        'EURONEXT-KER',
        Colors.pinkAccent),
    countryLargeCapChartItem('frDanone', 'BN  Danone 다논 France food consumer',
        'EURONEXT:BN', 'EURONEXT-BN', Colors.lightGreenAccent),
    countryLargeCapChartItem(
        'frPernod',
        'RI  Pernod Ricard 페르노리카 France beverage consumer',
        'EURONEXT:RI',
        'EURONEXT-RI',
        Colors.orangeAccent),
    countryLargeCapChartItem('frEngie', 'ENGI  Engie 엔지 France utility energy',
        'EURONEXT:ENGI', 'EURONEXT-ENGI', Colors.greenAccent),
    countryLargeCapChartItem(
        'frLegrand',
        'LR  Legrand 르그랑 France electric industrial',
        'EURONEXT:LR',
        'EURONEXT-LR',
        Colors.cyanAccent),
    countryLargeCapChartItem(
        'frCapgemini',
        'CAP  Capgemini 캡제미니 France IT software consulting',
        'EURONEXT:CAP',
        'EURONEXT-CAP',
        _blue),
    countryLargeCapChartItem(
        'frCreditAgricole',
        'ACA  Credit Agricole 크레디아그리콜 France bank finance',
        'EURONEXT:ACA',
        'EURONEXT-ACA',
        _cyan),
    countryLargeCapChartItem(
        'frSocGen',
        'GLE  Societe Generale 소시에테제네랄 France bank finance',
        'EURONEXT:GLE',
        'EURONEXT-GLE',
        _purple),
    countryLargeCapChartItem('frMichelin', 'ML  Michelin 미쉐린 France auto tire',
        'EURONEXT:ML', 'EURONEXT-ML', Colors.blueGrey),
    countryLargeCapChartItem('frOrange', 'ORA  Orange 오랑주 France telecom',
        'EURONEXT:ORA', 'EURONEXT-ORA', Colors.orangeAccent),
    countryLargeCapChartItem(
        'frVeolia',
        'VIE  Veolia 베올리아 France utility water infrastructure',
        'EURONEXT:VIE',
        'EURONEXT-VIE',
        Colors.tealAccent),
    countryLargeCapChartItem(
        'esInditex',
        'ITX  Inditex 인디텍스 Spain retail apparel Zara',
        'BME:ITX',
        'BME-ITX',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'esIberdrola',
        'IBE  Iberdrola 이베르드롤라 Spain utility energy power',
        'BME:IBE',
        'BME-IBE',
        Colors.lightGreenAccent),
    countryLargeCapChartItem(
        'esSantander',
        'SAN  Banco Santander 산탄데르 Spain bank finance',
        'BME:SAN',
        'BME-SAN',
        Colors.redAccent),
    countryLargeCapChartItem('esBbva', 'BBVA  BBVA 비비바 Spain bank finance',
        'BME:BBVA', 'BME-BBVA', _blue),
    countryLargeCapChartItem(
        'esCaixa',
        'CABK  CaixaBank 카이샤뱅크 Spain bank finance',
        'BME:CABK',
        'BME-CABK',
        _cyan),
    countryLargeCapChartItem(
        'esTelefonica',
        'TEF  Telefonica 텔레포니카 Spain telecom',
        'BME:TEF',
        'BME-TEF',
        Colors.indigoAccent),
    countryLargeCapChartItem(
        'esAmadeus',
        'AMS  Amadeus 아마데우스 Spain travel software',
        'BME:AMS',
        'BME-AMS',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'esFerrovial',
        'FER  Ferrovial 페로비알 Spain infrastructure construction',
        'BME:FER',
        'BME-FER',
        Colors.orangeAccent),
    countryLargeCapChartItem('esRepsol', 'REP  Repsol 렙솔 Spain oil energy',
        'BME:REP', 'BME-REP', Colors.redAccent),
    countryLargeCapChartItem(
        'esAcs',
        'ACS  ACS Spain construction infrastructure',
        'BME:ACS',
        'BME-ACS',
        Colors.blueGrey),
    countryLargeCapChartItem(
        'esAena',
        'AENA  Aena 아에나 Spain airport infrastructure travel',
        'BME:AENA',
        'BME-AENA',
        Colors.lightBlueAccent),
    countryLargeCapChartItem(
        'esNaturgy',
        'NTGY  Naturgy 나투르지 Spain utility gas energy',
        'BME:NTGY',
        'BME-NTGY',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'esRedeia',
        'RED  Redeia 레데이아 Spain utility power grid',
        'BME:RED',
        'BME-RED',
        Colors.pinkAccent),
    countryLargeCapChartItem(
        'esEndesa',
        'ELE  Endesa 엔데사 Spain utility energy power',
        'BME:ELE',
        'BME-ELE',
        Colors.yellowAccent),
    countryLargeCapChartItem(
        'esCellnex',
        'CLNX  Cellnex 셀넥스 Spain telecom infrastructure',
        'BME:CLNX',
        'BME-CLNX',
        Colors.cyanAccent),
    countryLargeCapChartItem(
        'esGrifols',
        'GRF  Grifols 그리폴스 Spain pharma healthcare',
        'BME:GRF',
        'BME-GRF',
        Colors.redAccent),
    countryLargeCapChartItem('esMapfre',
        'MAP  Mapfre 마프레 Spain insurance finance', 'BME:MAP', 'BME-MAP', _blue),
    countryLargeCapChartItem(
        'esAcciona',
        'ANA  Acciona 악시오나 Spain infrastructure renewable energy',
        'BME:ANA',
        'BME-ANA',
        Colors.greenAccent),
    countryLargeCapChartItem('ptEdp', 'EDP  EDP Portugal utility energy power',
        'EURONEXT:EDP', 'EURONEXT-EDP', Colors.greenAccent),
    countryLargeCapChartItem(
        'ptGalp',
        'GALP  Galp Energia 갈프 Portugal oil energy',
        'EURONEXT:GALP',
        'EURONEXT-GALP',
        Colors.orangeAccent),
    countryLargeCapChartItem(
        'ptJeronimo',
        'JMT  Jeronimo Martins 제로니모마르틴스 Portugal retail food',
        'EURONEXT:JMT',
        'EURONEXT-JMT',
        Colors.lightGreenAccent),
    countryLargeCapChartItem(
        'ptBcp',
        'BCP  Millennium BCP 밀레니엄BCP Portugal bank finance',
        'EURONEXT:BCP',
        'EURONEXT-BCP',
        _blue),
    countryLargeCapChartItem(
        'ptEdpRenovaveis',
        'EDPR  EDP Renovaveis EDP리뉴어블 Portugal renewable energy',
        'EURONEXT:EDPR',
        'EURONEXT-EDPR',
        Colors.cyanAccent),
    countryLargeCapChartItem('ptNos', 'NOS  NOS Portugal telecom media',
        'EURONEXT:NOS', 'EURONEXT-NOS', Colors.purpleAccent),
    countryLargeCapChartItem(
        'ruSber',
        'SBER  Sberbank 스베르방크 Сбербанк Russia bank finance',
        'MOEX:SBER',
        'MOEX-SBER',
        Colors.greenAccent),
    countryLargeCapChartItem(
        'ruGazprom',
        'GAZP  Gazprom 가즈프롬 Газпром Russia gas energy',
        'MOEX:GAZP',
        'MOEX-GAZP',
        Colors.blueAccent),
    countryLargeCapChartItem(
        'ruLukoil',
        'LKOH  Lukoil 루코일 Лукойл Russia oil energy',
        'MOEX:LKOH',
        'MOEX-LKOH',
        Colors.redAccent),
    countryLargeCapChartItem(
        'ruRosneft',
        'ROSN  Rosneft 로스네프트 Роснефть Russia oil energy',
        'MOEX:ROSN',
        'MOEX-ROSN',
        Colors.orangeAccent),
    countryLargeCapChartItem(
        'ruNovatek',
        'NVTK  Novatek 노바텍 Новатэк Russia gas energy',
        'MOEX:NVTK',
        'MOEX-NVTK',
        Colors.cyanAccent),
    countryLargeCapChartItem(
        'ruNornickel',
        'GMKN  Nornickel 노르니켈 Норникель Russia mining nickel materials',
        'MOEX:GMKN',
        'MOEX-GMKN',
        Colors.blueGrey),
    countryLargeCapChartItem(
        'ruYandex',
        'YDEX  Yandex 얀덱스 Яндекс Russia internet AI search',
        'MOEX:YDEX',
        'MOEX-YDEX',
        Colors.amberAccent),
    countryLargeCapChartItem(
        'ruTcs',
        'TCSG  TCS Tinkoff 틴코프 Тинькофф Russia fintech bank',
        'MOEX:TCSG',
        'MOEX-TCSG',
        Colors.yellowAccent),
  ];

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  static const _orderKey = 'chartItemOrder';
  static const _favoriteKey = 'favoriteChartItemIds';
  static const _defaultFavoriteChartIds = {
    'nasdaq100Futures',
    'qld',
    'tqqq',
  };
  late List<ChartListItem> chartItems = List.of(ChartPage.defaultChartItems);
  Set<String> favoriteChartIds = {};
  final chartSearchController = TextEditingController();
  final chartListController = ScrollController();
  final chartItemKeys = <String, GlobalKey>{};
  final chartSearchTextCache = <String, String>{};

  @override
  void initState() {
    super.initState();
    loadOrder();
  }

  @override
  void dispose() {
    chartSearchController.dispose();
    chartListController.dispose();
    super.dispose();
  }

  Future<void> loadOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final savedOrder = prefs.getStringList(_orderKey);
    final savedFavorites = prefs.getStringList(_favoriteKey);

    favoriteChartIds = savedFavorites == null
        ? Set<String>.of(_defaultFavoriteChartIds)
        : savedFavorites.toSet();

    if (savedFavorites == null) {
      await prefs.setStringList(
        _favoriteKey,
        _defaultFavoriteChartIds.toList(),
      );
    }

    final byId = {
      for (final item in ChartPage.defaultChartItems) item.id: item,
    };
    final ordered = savedOrder == null || savedOrder.isEmpty
        ? <ChartListItem>[]
        : <ChartListItem>[
            for (final id in savedOrder)
              if (byId.containsKey(id)) byId[id]!,
          ];

    for (final item in ChartPage.defaultChartItems) {
      if (!ordered.any((orderedItem) => orderedItem.id == item.id)) {
        ordered.add(item);
      }
    }

    if (!mounted) return;
    setState(() {
      chartItems = sortedByFavorites(ordered);
      chartSearchTextCache.clear();
    });
    warmChartSearchCache();
  }

  void warmChartSearchCache() {
    Future.delayed(const Duration(milliseconds: 120), () {
      if (!mounted) return;

      for (final item in chartItems) {
        cachedSearchTextForItem(item);
      }
    });
  }

  Future<void> saveOrder() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _orderKey,
      chartItems.map((item) => item.id).toList(),
    );
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favoriteKey, favoriteChartIds.toList());
  }

  List<ChartListItem> sortedByFavorites(List<ChartListItem> items) {
    final favorites =
        items.where((item) => favoriteChartIds.contains(item.id)).toList();
    final others =
        items.where((item) => !favoriteChartIds.contains(item.id)).toList();

    return [
      ...favorites,
      ...others,
    ];
  }

  Future<void> toggleFavorite(ChartListItem item) async {
    setState(() {
      if (favoriteChartIds.contains(item.id)) {
        favoriteChartIds.remove(item.id);
      } else {
        favoriteChartIds.add(item.id);
      }

      chartItems = sortedByFavorites(chartItems);
    });

    await saveFavorites();
    await saveOrder();

    if (favoriteChartIds.contains(item.id) && chartListController.hasClients) {
      chartListController.animateTo(
        0,
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutCubic,
      );
    }
  }

  String badgeForItem(ChartListItem item) {
    switch (item.id) {
      case 'nasdaq100Futures':
        return 'NQ';
      case 'qld':
        return 'QLD';
      case 'tqqq':
        return 'TQQQ';
      case 'sp500':
        return 'SPX';
      case 'kospi':
        return 'KOSPI';
      case 'nikkei225':
        return 'N225';
      case 'ibex35':
        return 'IBEX';
      case 'psi':
        return 'PSI';
      case 'moex':
        return 'MOEX';
      case 'sseComposite':
        return 'SSE';
      case 'taiex':
        return 'TAIEX';
      case 'cac40':
        return 'CAC';
      case 'dax':
        return 'DAX';
      default:
        final symbol = item.subtitle.contains(':')
            ? item.subtitle.split(':').last
            : item.title;

        return symbol.length <= 5
            ? symbol.toUpperCase()
            : symbol.substring(0, 5).toUpperCase();
    }
  }

  GlobalKey keyForItem(String id) {
    return chartItemKeys.putIfAbsent(id, () => GlobalKey());
  }

  void jumpToSearchResult(String value) {
    final query = normalizeChartSearchText(value);

    if (query.isEmpty || !chartListController.hasClients) return;

    final expandedQueries = expandedChartSearchQueries(query);
    var index = chartItems.indexWhere((item) {
      return normalizedSearchTextMatchesExpandedQueries(
        cachedSearchTextForItem(item),
        expandedQueries,
      );
    });

    if (index < 0) {
      index = chartItems.indexWhere((item) {
        return normalizedSearchTextMatchesAnyExpandedQueryToken(
          cachedSearchTextForItem(item),
          expandedQueries,
        );
      });
    }

    if (index < 0) return;

    final maxOffset = chartListController.position.maxScrollExtent;
    final targetOffset = (index * 58.0).clamp(0.0, maxOffset);

    chartListController.jumpTo(targetOffset);
  }

  List<ChartListItem> filteredChartItems() {
    final query = normalizeChartSearchText(chartSearchController.text);

    if (query.isEmpty) return chartItems;

    final expandedQueries = expandedChartSearchQueries(query);
    final exactMatches = chartItems
        .where(
          (item) => normalizedSearchTextMatchesExpandedQueries(
            cachedSearchTextForItem(item),
            expandedQueries,
          ),
        )
        .toList();

    if (exactMatches.isNotEmpty) return exactMatches;

    return chartItems
        .where(
          (item) => normalizedSearchTextMatchesAnyExpandedQueryToken(
            cachedSearchTextForItem(item),
            expandedQueries,
          ),
        )
        .toList();
  }

  String cachedSearchTextForItem(ChartListItem item) {
    return chartSearchTextCache.putIfAbsent(
      item.id,
      () => normalizeChartSearchText(searchTextForItem(item)),
    );
  }

  String searchTextForItem(ChartListItem item) {
    final symbolTicker = item.symbolPath.contains('-')
        ? item.symbolPath.split('-').last
        : item.symbolPath;
    final ticker = item.subtitle.contains(':')
        ? item.subtitle.split(':').last
        : item.title.split(' ').first;
    final aliasKeys = {
      ticker,
      symbolTicker,
      item.id,
      item.symbolPath,
      item.symbolPath.replaceAll('-', ':'),
      item.symbolPath.replaceAll(':', '-'),
    };
    final aliases = aliasKeys
        .map((key) => _chartSearchAliases[key] ?? '')
        .where((alias) => alias.isNotEmpty)
        .join(' ');
    final universalAliases = aliasKeys
        .map((key) => _chartUniversalSearchAliases[key] ?? '')
        .where((alias) => alias.isNotEmpty)
        .join(' ');
    final extraAliases = aliasKeys
        .map((key) => _extraChartSearchAliases[key] ?? '')
        .where((alias) => alias.isNotEmpty)
        .join(' ');
    final commodityAliases = _commoditySearchAliases[item.id] ?? '';
    final localizedKeywordAliases = localizedChartKeywordAliasesForText([
      item.title,
      item.subtitle,
      item.id,
      item.symbolPath,
      symbolTicker,
      ticker,
      aliases,
      universalAliases,
      extraAliases,
      commodityAliases,
    ].join(' '));

    return [
      item.title,
      item.subtitle,
      item.id,
      item.symbolPath,
      symbolTicker,
      ticker,
      aliases,
      universalAliases,
      extraAliases,
      commodityAliases,
      localizedKeywordAliases,
    ].join(' ').toLowerCase();
  }

  void reorderItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    setState(() {
      final item = chartItems.removeAt(oldIndex);
      chartItems.insert(newIndex, item);
      chartItems = sortedByFavorites(chartItems);
    });

    saveOrder();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final visibleChartItems = filteredChartItems();
    final isSearching = chartSearchController.text.trim().isNotEmpty;
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
        title: Text(l10n.navChart),
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
          currentTab: NavTab.chart,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 4, 14, 6),
            child: TextField(
              controller: chartSearchController,
              onChanged: (value) {
                setState(() {});
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
                hintText: 'Search ticker',
                hintStyle: TextStyle(
                  color: faintText,
                  fontSize: 13,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: secondaryText,
                  size: 18,
                ),
                suffixIcon: chartSearchController.text.isEmpty
                    ? null
                    : IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: secondaryText,
                          size: 17,
                        ),
                        onPressed: () {
                          chartSearchController.clear();
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
                    color: (whiteMode ? _lightBlue : _blue)
                        .withValues(alpha: 0.65),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ReorderableListView.builder(
              scrollController: chartListController,
              buildDefaultDragHandles: false,
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 144),
              itemCount: visibleChartItems.length,
              onReorderItem: isSearching ? (_, __) {} : reorderItems,
              itemBuilder: (context, index) {
                final item = visibleChartItems[index];
                final isFavorite = favoriteChartIds.contains(item.id);

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
                                  item.title,
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
                                  item.subtitle,
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
                                color:
                                    isFavorite ? Colors.amberAccent : faintText,
                                size: 20,
                              ),
                              onPressed: () => toggleFavorite(item),
                            ),
                          ),
                          if (!isSearching)
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
                            )
                          else
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.search_rounded,
                                color: whiteMode
                                    ? const Color(0xFFCBD5E1)
                                    : Colors.white24,
                                size: 20,
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
