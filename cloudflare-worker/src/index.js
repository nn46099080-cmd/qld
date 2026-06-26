import { DurableObject } from 'cloudflare:workers';

const YAHOO_CHART_BASE =
  'https://query1.finance.yahoo.com/v8/finance/chart';
const FINNHUB_QUOTE_URL = 'https://finnhub.io/api/v1/quote';
const GOOGLE_OAUTH_TOKEN_URL = 'https://oauth2.googleapis.com/token';
const GOOGLE_ANDROID_PUBLISHER_SCOPE =
  'https://www.googleapis.com/auth/androidpublisher';
const ANDROID_PACKAGE_NAME = 'com.qldalert.app';
const CORE_ALERT_PRODUCT_ID = 'core_alert';
const PAID_DEVICE_PREFIX = 'paid-device:';
const PAID_PURCHASE_PREFIX = 'paid-purchase:';
const USER_DEVICE_PREFIX = 'user-device:';
const OWNER_ADMIN_UID = 'qld-admin-179204';
const PAID_VOIDED_SCAN_STATE_KEY = 'paid-voided-scan';
const FINNHUB_API_KEY = '';

const ALLOWED_SYMBOLS = new Set(['QLD', 'TQQQ', '^NDX']);
const ALLOWED_QUOTE_SYMBOLS = new Set(['QLD', 'TQQQ', 'NQ=F', '^VIX', '^TNX']);

// In-memory cache per Worker isolate (per edge PoP).
// Many users share one Yahoo fetch while the entry is fresh.
const CACHE_TTL_MS = 60 * 60 * 1000;
const QUOTE_CACHE_TTL_MS = 30 * 1000;
const WIDGET_CACHE_TTL_MS = 60 * 1000;
const QUOTE_STREAM_INTERVAL_MS = 30 * 1000;
const QUOTE_STREAM_MAX_SNAPSHOT_AGE_MS = 45 * 1000;
const QUOTE_STREAM_SHARDS = 10;
const MAX_CONNECTIONS_PER_SHARD = 5000;
const VOIDED_PURCHASE_LOOKBACK_MS = 30 * 24 * 60 * 60 * 1000;
const VOIDED_PURCHASE_SCAN_OVERLAP_MS = 24 * 60 * 60 * 1000;
const FEAR_GREED_CACHE_TTL_MS = 60 * 60 * 1000;
const CLOSE_GUESS_PREFIX = 'close-guess:';
const CLOSE_GUESS_MAX_ENTRIES = 200;
const CLOSE_GUESS_MAX_ATTEMPTS = 3;
const CLOSE_GUESS_MAX_MESSAGE_LENGTH = 100;
const INQUIRIES_KEY = 'inquiries';
const INQUIRY_MAX_ENTRIES = 200;
const INQUIRY_MAX_CONTENT_LENGTH = 1000;
const MAJOR_US_SCHEDULES_KEY = 'major-us-schedules';
const MAJOR_US_SCHEDULE_MAX_ENTRIES = 80;
const DEFAULT_MAJOR_US_SCHEDULES = [
  { title: 'FOMC', date: '2026-06-17' },
  { title: 'NFP', date: '2026-07-02' },
  { title: 'CPI', date: '2026-07-14' },
  { title: 'FOMC', date: '2026-07-29' },
  { title: 'NFP', date: '2026-08-07' },
  { title: 'CPI', date: '2026-08-12' },
  { title: 'NFP', date: '2026-09-04' },
  { title: 'CPI', date: '2026-09-11' },
  { title: 'FOMC', date: '2026-09-16' },
  { title: 'NFP', date: '2026-10-02' },
  { title: 'CPI', date: '2026-10-14' },
  { title: 'FOMC', date: '2026-10-28' },
  { title: 'NFP', date: '2026-11-06' },
  { title: 'CPI', date: '2026-11-10' },
  { title: 'NFP', date: '2026-12-04' },
  { title: 'FOMC', date: '2026-12-09' },
  { title: 'CPI', date: '2026-12-10' },
];
const ADMIN_PERMISSIONS = [
  'inquiries:moderate',
  'closeGuess:moderate',
  'games:moderate',
  'content:moderate',
  'schedules:moderate',
  'notifications:test',
];
const cache = new Map();
const inflight = new Map();
const quoteCache = new Map();
const quoteInflight = new Map();
let widgetCache = null;
let widgetInflight = null;
let fearGreedCache = null;
let fearGreedInflight = null;

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type',
};
const securityHeaders = {
  'X-Content-Type-Options': 'nosniff',
  'Referrer-Policy': 'no-referrer',
  'X-Frame-Options': 'DENY',
};

const yahooHeaders = {
  'User-Agent':
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
  Accept: 'application/json',
};

const INTRADAY_QUERY = 'range=1d&interval=1m&includePrePost=true';
const ALERT_TOPIC = 'qld_alerts';
const ALERT_STATE_PREFIX = 'alert:';
const LAST_QUOTE_PREFIX = 'quote:last:';
const ALERT_LANGUAGES = ['en', 'ko', 'ja', 'es', 'pt', 'ru', 'zh', 'zh_TW', 'fr', 'de'];
const TEST_ALERT_TYPES = new Set([
  'coreAlert',
  'marketOpen',
  'minus20',
  'minus30',
  'minus40',
  'minus50',
  'recovery20',
  'recovery30',
  'recovery40',
  'recovery50',
  'high',
  'qldMoveUp4',
  'qldMoveDown4',
  'nasdaq200Breakdown',
  'nasdaq200Breakout',
  'nasdaq200Recovery',
  'portfolioCashLow',
  'portfolioCashHigh',
  'fearGreedExtremeFear',
  'fearGreedExtremeGreed',
  'profitTargetQld50',
  'profitTargetQld100',
  'profitTargetQld200',
  'profitTargetQld300',
  'profitTargetTqqq50',
  'profitTargetTqqq100',
  'profitTargetTqqq200',
  'profitTargetTqqq300',
]);

const MARKET_CALENDAR_START_YEAR = 2026;
const MARKET_CALENDAR_END_YEAR = 2030;
const marketCalendarCache = new Map();

const ALERT_MESSAGES = {
  coreAlert: {
    title: {
      en: 'Core Alert',
      ko: '\uD0C0\uC774\uBC0D \uCF54\uBA58\uD2B8',
    },
    body: {
      en: 'A paid member message has arrived.',
      ko: '\uACB0\uC81C\uC790 \uC804\uC6A9 \uBA54\uC2DC\uC9C0\uAC00 \uB3C4\uCC29\uD588\uC2B5\uB2C8\uB2E4.',
    },
  },
  marketOpen: {
    title: {
      en: 'U.S. market is open',
      ko: '미국 증시가 시작되었습니다',
      ja: '米国市場が始まりました',
      es: 'El mercado de EE. UU. está abierto',
      pt: 'O mercado dos EUA abriu',
      ru: 'Рынок США открыт',
      zh: '美国股市已开盘',
      zh_TW: '美國股市已開盤',
      fr: 'Le marché américain est ouvert',
      de: 'Der US-Markt ist geöffnet',
    },
    body: {
      en: 'Regular trading has started. Check your plan only if action is needed today.',
      ko: '정규장이 시작되었습니다. 오늘 행동할 계획이 있을 때만 가격과 전략을 확인하세요.',
      ja: '通常取引が始まりました。今日行動する予定がある場合のみ価格と戦略を確認してください。',
      es: 'La sesión regular ha comenzado. Revisa tu plan solo si necesitas actuar hoy.',
      pt: 'A sessão regular começou. Verifique seu plano apenas se precisar agir hoje.',
      ru: 'Основная сессия началась. Проверяйте план только если сегодня нужны действия.',
      zh: '常规交易已开始。只有今天需要操作时再检查计划。',
      zh_TW: '常規交易已開始。只有今天需要操作時再檢查計畫。',
      fr: 'La séance régulière a commencé. Vérifiez votre plan seulement si une action est nécessaire.',
      de: 'Der reguläre Handel hat begonnen. Prüfe deinen Plan nur, wenn heute Handlungsbedarf besteht.',
    },
  },
  high: {
    title: {
      en: 'QLD reached a new high',
      ko: 'QLD 신고가를 갱신했습니다',
      ja: 'QLDが新高値を更新しました',
      es: 'QLD marcó un nuevo máximo',
      pt: 'QLD renovou a máxima',
      ru: 'QLD обновил максимум',
      zh: 'QLD 创出新高',
      zh_TW: 'QLD 創下新高',
      fr: 'QLD a atteint un nouveau plus haut',
      de: 'QLD hat ein neues Hoch erreicht',
    },
    body: {
      en: 'The shared server high has been updated and will be used as the next drawdown reference.',
      ko: '서버 공통 최고가가 갱신되어 다음 하락률 기준으로 사용됩니다.',
      ja: 'サーバー共通の高値が更新され、次の下落率基準になります。',
      es: 'El máximo común del servidor se actualizó y será la nueva referencia de caída.',
      pt: 'A máxima comum do servidor foi atualizada e será a nova referência de queda.',
      ru: 'Общий серверный максимум обновлен и станет новой базой для просадки.',
      zh: '服务器共用最高价已更新，将作为新的回撤基准。',
      zh_TW: '伺服器共用最高價已更新，將作為新的回撤基準。',
      fr: 'Le plus haut commun du serveur a été mis à jour comme nouvelle référence de baisse.',
      de: 'Das gemeinsame Server-Hoch wurde aktualisiert und dient als neue Rückgangsbasis.',
    },
  },
  qldMoveUp4: {
    title: {
      en: 'QLD up 4%+',
      ko: 'QLD 4% 이상 큰 상승',
      ja: 'QLD 4%以上の大幅上昇',
      es: 'QLD sube 4%+',
      pt: 'QLD sobe 4%+',
      ru: 'QLD вырос на 4%+',
      zh: 'QLD上涨4%以上',
      zh_TW: 'QLD上漲4%以上',
      fr: 'QLD monte de 4%+',
      de: 'QLD steigt um 4%+',
    },
    body: {
      en: 'QLD moved up 4% or more from the previous close. Check whether today changes your plan.',
      ko: 'QLD가 전일 종가 대비 4% 이상 상승했습니다. 오늘 움직임이 계획에 영향을 주는지 확인하세요.',
      ja: 'QLDが前日終値比で4%以上上昇しました。今日の動きが計画に影響するか確認してください。',
      es: 'QLD subio 4% o mas frente al cierre anterior. Revisa si el movimiento cambia tu plan.',
      pt: 'QLD subiu 4% ou mais contra o fechamento anterior. Verifique se o movimento muda seu plano.',
      ru: 'QLD вырос на 4% или больше от предыдущего закрытия. Проверьте, меняет ли это ваш план.',
      zh: 'QLD较前收盘价上涨4%以上。请确认今天的走势是否影响你的计划。',
      zh_TW: 'QLD較前收盤價上漲4%以上。請確認今天的走勢是否影響你的計畫。',
      fr: 'QLD a monte de 4% ou plus face a la cloture precedente. Verifiez si cela change votre plan.',
      de: 'QLD ist gegenueber dem Vortagesschluss um 4% oder mehr gestiegen. Pruefe, ob das deinen Plan aendert.',
    },
  },
  qldMoveDown4: {
    title: {
      en: 'QLD down 4%+',
      ko: 'QLD 4% 이상 큰 하락',
      ja: 'QLD 4%以上の大幅下落',
      es: 'QLD cae 4%+',
      pt: 'QLD cai 4%+',
      ru: 'QLD упал на 4%+',
      zh: 'QLD下跌4%以上',
      zh_TW: 'QLD下跌4%以上',
      fr: 'QLD baisse de 4%+',
      de: 'QLD faellt um 4%+',
    },
    body: {
      en: 'QLD moved down 4% or more from the previous close. Check risk and cash before acting.',
      ko: 'QLD가 전일 종가 대비 4% 이상 하락했습니다. 행동하기 전에 리스크와 현금 비중을 확인하세요.',
      ja: 'QLDが前日終値比で4%以上下落しました。行動する前にリスクと現金比率を確認してください。',
      es: 'QLD cayo 4% o mas frente al cierre anterior. Revisa riesgo y efectivo antes de actuar.',
      pt: 'QLD caiu 4% ou mais contra o fechamento anterior. Verifique risco e caixa antes de agir.',
      ru: 'QLD упал на 4% или больше от предыдущего закрытия. Перед действием проверьте риск и кэш.',
      zh: 'QLD较前收盘价下跌4%以上。行动前请确认风险和现金比例。',
      zh_TW: 'QLD較前收盤價下跌4%以上。行動前請確認風險和現金比例。',
      fr: 'QLD a baisse de 4% ou plus face a la cloture precedente. Verifiez le risque et le cash avant d agir.',
      de: 'QLD ist gegenueber dem Vortagesschluss um 4% oder mehr gefallen. Pruefe Risiko und Cash vor einer Aktion.',
    },
  },
  minus20: {
    title: {
      en: '-20% zone: start small TQQQ accumulation',
      ko: '-20% 구간: 소액 TQQQ 적립 시작',
      ja: '-20%ゾーン: 少額のTQQQ積立を開始',
      es: 'Zona -20%: iniciar compras pequeñas de TQQQ',
      pt: 'Zona -20%: iniciar compras pequenas de TQQQ',
      ru: 'Зона -20%: начать небольшое накопление TQQQ',
      zh: '-20% 区间：开始小额定投 TQQQ',
      zh_TW: '-20% 區間：開始小額定投 TQQQ',
      fr: 'Zone -20% : commencer une petite accumulation de TQQQ',
      de: '-20%-Zone: kleine TQQQ-Käufe starten',
    },
    body: {
      en: 'The drawdown reached the first buy zone. Start small recurring TQQQ buys and keep most cash for deeper levels.',
      ko: '첫 매수 구간에 도달했습니다. TQQQ 소액 적립 매수를 시작하고 대부분의 현금은 더 깊은 구간을 위해 남겨두세요.',
      ja: '最初の買いゾーンに到達しました。TQQQの少額積立買いを始め、現金の大部分はさらに深い下落に備えて残してください。',
      es: 'La caída llegó a la primera zona de compra. Inicia pequeñas compras recurrentes de TQQQ y conserva la mayor parte del efectivo para niveles más profundos.',
      pt: 'A queda chegou à primeira zona de compra. Inicie pequenas compras recorrentes de TQQQ e preserve a maior parte do caixa para níveis mais profundos.',
      ru: 'Просадка достигла первой зоны покупки. Начните небольшие регулярные покупки TQQQ и сохраните большую часть кэша для более глубоких уровней.',
      zh: '回撤已到达第一买入区间。开始小额定投TQQQ，并保留大部分现金应对更深跌幅。',
      zh_TW: '回撤已到達第一買入區間。開始小額定投TQQQ，並保留大部分現金應對更深跌幅。',
      fr: 'La baisse atteint la première zone d’achat. Commencez de petits achats récurrents de TQQQ et gardez la plupart du cash pour des niveaux plus bas.',
      de: 'Der Rückgang hat die erste Kaufzone erreicht. Starte kleine regelmäßige TQQQ-Käufe und halte den Großteil des Cashs für tiefere Zonen zurück.',
    },
  },
  minus30: {
    title: {
      en: '-30% zone: buy TQQQ with 20% of cash',
      ko: '-30% 구간: 현금 20%로 TQQQ 매수',
      ja: '-30%ゾーン: 現金20%でTQQQ購入',
      es: 'Zona -30%: comprar TQQQ con 20% del efectivo',
      pt: 'Zona -30%: comprar TQQQ com 20% do caixa',
      ru: 'Зона -30%: купить TQQQ на 20% кэша',
      zh: '-30% 区间：用20%现金买入TQQQ',
      zh_TW: '-30% 區間：用20%現金買入TQQQ',
      fr: 'Zone -30% : acheter TQQQ avec 20% du cash',
      de: '-30%-Zone: TQQQ mit 20% des Cashs kaufen',
    },
    body: {
      en: 'Use only 20% of available cash for TQQQ. Preserve the rest for the -40% and -50% zones.',
      ko: '사용 가능한 현금의 20%만 TQQQ에 사용하세요. 나머지는 -40%, -50% 구간을 위해 보존하세요.',
      ja: '利用可能な現金の20%だけをTQQQに使ってください。残りは-40%と-50%ゾーンに備えて保全します。',
      es: 'Usa solo el 20% del efectivo disponible para TQQQ. Conserva el resto para las zonas -40% y -50%.',
      pt: 'Use apenas 20% do caixa disponível em TQQQ. Preserve o restante para as zonas -40% e -50%.',
      ru: 'Используйте только 20% доступного кэша для TQQQ. Остальное сохраните для зон -40% и -50%.',
      zh: '仅使用可用现金的20%买入TQQQ。其余现金保留给-40%和-50%区间。',
      zh_TW: '僅使用可用現金的20%買入TQQQ。其餘現金保留給-40%和-50%區間。',
      fr: 'Utilisez seulement 20% du cash disponible pour TQQQ. Gardez le reste pour les zones -40% et -50%.',
      de: 'Nutze nur 20% des verfügbaren Cashs für TQQQ. Bewahre den Rest für die -40%- und -50%-Zonen auf.',
    },
  },
  minus40: {
    title: {
      en: '-40% zone: deploy 30% of remaining cash into TQQQ',
      ko: '-40% 구간: 남은 현금 30%로 TQQQ 매수',
      ja: '-40%ゾーン: 残り現金30%でTQQQ購入',
      es: 'Zona -40%: usar 30% del efectivo restante en TQQQ',
      pt: 'Zona -40%: usar 30% do caixa restante em TQQQ',
      ru: 'Зона -40%: вложить 30% оставшегося кэша в TQQQ',
      zh: '-40% 区间：用剩余现金的30%买入TQQQ',
      zh_TW: '-40% 區間：用剩餘現金的30%買入TQQQ',
      fr: 'Zone -40% : investir 30% du cash restant dans TQQQ',
      de: '-40%-Zone: 30% des verbleibenden Cashs in TQQQ einsetzen',
    },
    body: {
      en: 'Use 30% of the remaining cash for TQQQ. Keep enough cash for a possible final capitulation zone.',
      ko: '남은 현금의 30%를 TQQQ에 사용하세요. 마지막 급락 구간 가능성에 대비해 현금을 남겨두세요.',
      ja: '残り現金の30%をTQQQに使ってください。最後の急落ゾーンに備えて現金を残します。',
      es: 'Usa el 30% del efectivo restante en TQQQ. Mantén efectivo para una posible zona final de capitulación.',
      pt: 'Use 30% do caixa restante em TQQQ. Mantenha caixa para uma possível zona final de capitulação.',
      ru: 'Используйте 30% оставшегося кэша для TQQQ. Оставьте запас на возможную финальную зону капитуляции.',
      zh: '使用剩余现金的30%买入TQQQ。保留现金以应对可能的最终恐慌区间。',
      zh_TW: '使用剩餘現金的30%買入TQQQ。保留現金以應對可能的最終恐慌區間。',
      fr: 'Utilisez 30% du cash restant pour TQQQ. Gardez du cash pour une possible zone finale de capitulation.',
      de: 'Nutze 30% des verbleibenden Cashs für TQQQ. Halte Cash für eine mögliche finale Kapitulationszone zurück.',
    },
  },
  minus50: {
    title: {
      en: '-50% zone: deploy remaining cash into TQQQ',
      ko: '-50% 구간: 보유현금 전체 TQQQ 매수',
      ja: '-50%ゾーン: 残り現金をTQQQに投入',
      es: 'Zona -50%: usar el efectivo restante en TQQQ',
      pt: 'Zona -50%: usar o caixa restante em TQQQ',
      ru: 'Зона -50%: вложить оставшийся кэш в TQQQ',
      zh: '-50% 区间：将剩余现金投入 TQQQ',
      zh_TW: '-50% 區間：將剩餘現金投入 TQQQ',
      fr: 'Zone -50% : investir le cash restant dans TQQQ',
      de: '-50%-Zone: verbleibenden Cash in TQQQ einsetzen',
    },
    body: {
      en: 'This is the final planned cash deployment zone. Use only the cash that remains after earlier steps.',
      ko: '계획된 마지막 현금 투입 구간입니다. 이전 단계 후 실제 남아 있는 현금만 기준으로 하세요.',
      ja: '計画上の最後の現金投入ゾーンです。前の段階の後に実際に残っている現金だけを基準にしてください。',
      es: 'Esta es la última zona planificada para usar efectivo. Usa solo el efectivo que queda tras los pasos anteriores.',
      pt: 'Esta é a zona final planejada para usar caixa. Use apenas o caixa restante após as etapas anteriores.',
      ru: 'Это финальная плановая зона использования кэша. Используйте только кэш, оставшийся после предыдущих шагов.',
      zh: '这是计划中的最后现金投入区间。只使用前面步骤后实际剩余的现金。',
      zh_TW: '這是計畫中的最後現金投入區間。只使用前面步驟後實際剩餘的現金。',
      fr: 'C’est la dernière zone prévue d’utilisation du cash. Utilisez uniquement le cash restant après les étapes précédentes.',
      de: 'Dies ist die letzte geplante Cash-Einsatz-Zone. Nutze nur den Cash, der nach den vorherigen Schritten übrig ist.',
    },
  },
  recovery20: {
    title: {
      en: 'QLD recovered above the -20% zone',
      ko: 'QLD -20% 구간 회복',
      ja: 'QLDが-20%ゾーンを回復',
      es: 'QLD recupero la zona -20%',
      pt: 'QLD recuperou a zona -20%',
      ru: 'QLD восстановился выше зоны -20%',
      zh: 'QLD收复-20%区间',
      zh_TW: 'QLD收復-20%區間',
      fr: 'QLD repasse au-dessus de la zone -20%',
      de: 'QLD erholt sich ueber die -20%-Zone',
    },
    body: {
      en: 'QLD moved back above the -20% drawdown zone. Review whether the recovery changes your risk plan.',
      ko: 'QLD가 -20% 하락 구간 위로 회복했습니다. 회복 흐름이 리스크 계획을 바꾸는지 확인하세요.',
      ja: 'QLDが-20%下落ゾーンを回復しました。リスク計画を見直す必要があるか確認してください。',
      es: 'QLD volvio por encima de la zona de caida -20%. Revisa si la recuperacion cambia tu plan de riesgo.',
      pt: 'QLD voltou acima da zona de queda de -20%. Verifique se a recuperacao muda seu plano de risco.',
      ru: 'QLD поднялся выше зоны просадки -20%. Проверьте, меняет ли восстановление ваш риск-план.',
      zh: 'QLD回到-20%回撤区间上方。请确认复苏是否改变你的风险计划。',
      zh_TW: 'QLD回到-20%回撤區間上方。請確認復甦是否改變你的風險計畫。',
      fr: 'QLD repasse au-dessus de la zone de baisse -20%. Verifiez si la reprise change votre plan de risque.',
      de: 'QLD liegt wieder ueber der -20%-Rueckgangszone. Pruefe, ob die Erholung deinen Risikoplan aendert.',
    },
  },
  recovery30: {
    title: {
      en: 'QLD recovered above the -30% zone',
      ko: 'QLD -30% 구간 회복',
      ja: 'QLDが-30%ゾーンを回復',
      es: 'QLD recupero la zona -30%',
      pt: 'QLD recuperou a zona -30%',
      ru: 'QLD восстановился выше зоны -30%',
      zh: 'QLD收复-30%区间',
      zh_TW: 'QLD收復-30%區間',
      fr: 'QLD repasse au-dessus de la zone -30%',
      de: 'QLD erholt sich ueber die -30%-Zone',
    },
    body: {
      en: 'QLD moved back above the -30% drawdown zone. Review whether to normalize risk gradually.',
      ko: 'QLD가 -30% 하락 구간 위로 회복했습니다. 리스크를 단계적으로 정상화할지 확인하세요.',
      ja: 'QLDが-30%下落ゾーンを回復しました。リスクを段階的に通常へ戻すか確認してください。',
      es: 'QLD volvio por encima de la zona de caida -30%. Revisa si conviene normalizar riesgo gradualmente.',
      pt: 'QLD voltou acima da zona de queda de -30%. Verifique se deve normalizar risco gradualmente.',
      ru: 'QLD поднялся выше зоны просадки -30%. Проверьте, стоит ли постепенно нормализовать риск.',
      zh: 'QLD回到-30%回撤区间上方。请确认是否逐步恢复风险配置。',
      zh_TW: 'QLD回到-30%回撤區間上方。請確認是否逐步恢復風險配置。',
      fr: 'QLD repasse au-dessus de la zone de baisse -30%. Verifiez si le risque doit etre normalise progressivement.',
      de: 'QLD liegt wieder ueber der -30%-Rueckgangszone. Pruefe, ob Risiko schrittweise normalisiert werden sollte.',
    },
  },
  recovery40: {
    title: {
      en: 'QLD recovered above the -40% zone',
      ko: 'QLD -40% 구간 회복',
      ja: 'QLDが-40%ゾーンを回復',
      es: 'QLD recupero la zona -40%',
      pt: 'QLD recuperou a zona -40%',
      ru: 'QLD восстановился выше зоны -40%',
      zh: 'QLD收复-40%区间',
      zh_TW: 'QLD收復-40%區間',
      fr: 'QLD repasse au-dessus de la zone -40%',
      de: 'QLD erholt sich ueber die -40%-Zone',
    },
    body: {
      en: 'QLD moved back above the -40% drawdown zone. Review recovery progress and cash allocation.',
      ko: 'QLD가 -40% 하락 구간 위로 회복했습니다. 회복 진행과 현금 비중을 확인하세요.',
      ja: 'QLDが-40%下落ゾーンを回復しました。回復の進行と現金比率を確認してください。',
      es: 'QLD volvio por encima de la zona de caida -40%. Revisa recuperacion y asignacion de efectivo.',
      pt: 'QLD voltou acima da zona de queda de -40%. Verifique recuperacao e alocacao de caixa.',
      ru: 'QLD поднялся выше зоны просадки -40%. Проверьте ход восстановления и долю кэша.',
      zh: 'QLD回到-40%回撤区间上方。请确认复苏进度和现金配置。',
      zh_TW: 'QLD回到-40%回撤區間上方。請確認復甦進度和現金配置。',
      fr: 'QLD repasse au-dessus de la zone de baisse -40%. Verifiez la reprise et la part de cash.',
      de: 'QLD liegt wieder ueber der -40%-Rueckgangszone. Pruefe Erholung und Cash-Anteil.',
    },
  },
  recovery50: {
    title: {
      en: 'QLD recovered above the -50% zone',
      ko: 'QLD -50% 구간 회복',
      ja: 'QLDが-50%ゾーンを回復',
      es: 'QLD recupero la zona -50%',
      pt: 'QLD recuperou a zona -50%',
      ru: 'QLD восстановился выше зоны -50%',
      zh: 'QLD收复-50%区间',
      zh_TW: 'QLD收復-50%區間',
      fr: 'QLD repasse au-dessus de la zone -50%',
      de: 'QLD erholt sich ueber die -50%-Zone',
    },
    body: {
      en: 'QLD moved back above the -50% drawdown zone. Review whether the capitulation phase is easing.',
      ko: 'QLD가 -50% 하락 구간 위로 회복했습니다. 투매 국면이 완화되는지 확인하세요.',
      ja: 'QLDが-50%下落ゾーンを回復しました。投げ売り局面が落ち着くか確認してください。',
      es: 'QLD volvio por encima de la zona de caida -50%. Revisa si la capitulacion se esta aliviando.',
      pt: 'QLD voltou acima da zona de queda de -50%. Verifique se a capitulacao esta aliviando.',
      ru: 'QLD поднялся выше зоны просадки -50%. Проверьте, ослабевает ли фаза капитуляции.',
      zh: 'QLD回到-50%回撤区间上方。请确认恐慌抛售阶段是否缓和。',
      zh_TW: 'QLD回到-50%回撤區間上方。請確認恐慌拋售階段是否緩和。',
      fr: 'QLD repasse au-dessus de la zone de baisse -50%. Verifiez si la capitulation se calme.',
      de: 'QLD liegt wieder ueber der -50%-Rueckgangszone. Pruefe, ob die Kapitulationsphase nachlaesst.',
    },
  },
  nasdaq200Breakdown: {
    title: {
      en: 'Nasdaq 100 closed below the 200-day average',
      ko: '나스닥100이 200일선을 종가 기준 이탈했습니다',
      ja: 'ナスダック100が終値で200日線を下回りました',
      es: 'Nasdaq 100 cerró por debajo de la media de 200 días',
      pt: 'Nasdaq 100 fechou abaixo da média de 200 dias',
      ru: 'Nasdaq 100 закрылся ниже 200-дневной средней',
      zh: '纳斯达克100收盘跌破200日均线',
      zh_TW: '納斯達克100收盤跌破200日均線',
      fr: 'Le Nasdaq 100 a clôturé sous la moyenne à 200 jours',
      de: 'Nasdaq 100 schloss unter dem 200-Tage-Durchschnitt',
    },
    body: {
      en: 'Momentum weakened on a closing basis. Review risk before adding exposure.',
      ko: '종가 기준 모멘텀이 약해졌습니다. 추가 매수 전 리스크를 확인하세요.',
      ja: '終値ベースでモメンタムが弱まりました。追加投資の前にリスクを確認してください。',
      es: 'El impulso se debilitó al cierre. Revisa el riesgo antes de aumentar exposición.',
      pt: 'O momento enfraqueceu no fechamento. Revise o risco antes de aumentar exposição.',
      ru: 'Импульс ослаб по итогам закрытия. Проверьте риск перед увеличением позиции.',
      zh: '收盘动能转弱。增加仓位前请先检查风险。',
      zh_TW: '收盤動能轉弱。增加倉位前請先檢查風險。',
      fr: 'La dynamique s’est affaiblie en clôture. Vérifiez le risque avant d’augmenter l’exposition.',
      de: 'Das Momentum hat auf Schlusskursbasis nachgelassen. Prüfe das Risiko vor zusätzlichem Exposure.',
    },
  },
  nasdaq200Recovery: {
    title: {
      en: 'Nasdaq 100 recovered above the 200-day average',
      ko: '나스닥100이 200일선을 종가 기준 회복했습니다',
      ja: 'ナスダック100が終値で200日線を回復しました',
      es: 'Nasdaq 100 recuperó la media de 200 días al cierre',
      pt: 'Nasdaq 100 recuperou a média de 200 dias no fechamento',
      ru: 'Nasdaq 100 восстановился выше 200-дневной средней',
      zh: '纳斯达克100收盘重新站上200日均线',
      zh_TW: '納斯達克100收盤重新站上200日均線',
      fr: 'Le Nasdaq 100 a récupéré la moyenne à 200 jours en clôture',
      de: 'Nasdaq 100 erholte sich über den 200-Tage-Durchschnitt',
    },
    body: {
      en: 'The index recovered its 200-day average on a closing basis. Review whether your risk plan should normalize.',
      ko: '종가 기준 200일선을 회복했습니다. 리스크 계획을 정상화할지 확인하세요.',
      ja: '終値ベースで200日線を回復しました。リスク計画を通常運用に戻すか確認してください。',
      es: 'El índice recuperó su media de 200 días al cierre. Revisa si tu plan de riesgo debe normalizarse.',
      pt: 'O índice recuperou a média de 200 dias no fechamento. Verifique se o plano de risco deve normalizar.',
      ru: 'Индекс восстановился выше 200-дневной средней по закрытию. Проверьте, стоит ли нормализовать риск-план.',
      zh: '指数收盘重新站上200日均线。请检查风险计划是否应恢复正常。',
      zh_TW: '指數收盤重新站上200日均線。請檢查風險計畫是否應恢復正常。',
      fr: 'L’indice a récupéré sa moyenne à 200 jours en clôture. Vérifiez si votre plan de risque doit se normaliser.',
      de: 'Der Index hat den 200-Tage-Durchschnitt auf Schlusskursbasis zurückerobert. Prüfe, ob dein Risikoplan normalisiert werden sollte.',
    },
  },
  nasdaq200Breakout: {
    title: {
      en: 'Nasdaq 100 recovered above the 200-day average',
      ko: '나스닥100 200일선 회복',
      ja: 'Nasdaq 100が200日平均を回復',
      es: 'Nasdaq 100 recupero la media de 200 dias',
      pt: 'Nasdaq 100 recuperou a media de 200 dias',
      ru: 'Nasdaq 100 восстановился выше 200-дневной средней',
      zh: '纳斯达克100收复200日均线',
      zh_TW: '納斯達克100收復200日均線',
      fr: 'Nasdaq 100 repasse au-dessus de la moyenne 200 jours',
      de: 'Nasdaq 100 erholt sich ueber den 200-Tage-Durchschnitt',
    },
    body: {
      en: 'The index recovered its 200-day average on a closing basis. Review whether your risk plan should normalize.',
      ko: '종가 기준 200일선을 회복했습니다. 리스크 계획을 정상화할지 확인하세요.',
      ja: '終値ベースで200日平均を回復しました。リスク計画を通常に戻すか確認してください。',
      es: 'El indice recupero su media de 200 dias al cierre. Revisa si tu plan de riesgo debe normalizarse.',
      pt: 'O indice recuperou a media de 200 dias no fechamento. Verifique se o plano de risco deve normalizar.',
      ru: 'Индекс восстановился выше 200-дневной средней по закрытию. Проверьте, стоит ли нормализовать риск-план.',
      zh: '指数按收盘价收复200日均线。请确认风险计划是否应恢复正常。',
      zh_TW: '指數按收盤價收復200日均線。請確認風險計畫是否應恢復正常。',
      fr: 'L indice a recupere sa moyenne 200 jours en cloture. Verifiez si votre plan de risque doit se normaliser.',
      de: 'Der Index hat den 200-Tage-Durchschnitt auf Schlusskursbasis zurueckerobert. Pruefe, ob dein Risikoplan normalisiert werden sollte.',
    },
  },
  fearGreedExtremeFear: {
    title: {
      en: 'Fear & Greed: Extreme Fear',
      ko: '공포탐욕: 극단적 공포',
      ja: 'Fear & Greed: 極端な恐怖',
      es: 'Miedo y codicia: miedo extremo',
      pt: 'Medo e ganancia: medo extremo',
      ru: 'Fear & Greed: крайний страх',
      zh: '恐惧与贪婪：极度恐惧',
      zh_TW: '恐懼與貪婪：極度恐懼',
      fr: 'Peur et avidite : peur extreme',
      de: 'Fear & Greed: extreme Angst',
    },
    body: {
      en: 'The Fear & Greed Index entered Extreme Fear. Check whether market stress changes your plan.',
      ko: '공포탐욕 지수가 극단적 공포 구간에 진입했습니다. 시장 스트레스가 계획에 영향을 주는지 확인하세요.',
      ja: 'Fear & Greed指数が極端な恐怖ゾーンに入りました。市場ストレスが計画に影響するか確認してください。',
      es: 'El indice Fear & Greed entro en miedo extremo. Revisa si el estres del mercado cambia tu plan.',
      pt: 'O indice Fear & Greed entrou em medo extremo. Verifique se o estresse do mercado muda seu plano.',
      ru: 'Индекс Fear & Greed вошел в зону крайнего страха. Проверьте, меняет ли стресс рынка ваш план.',
      zh: '恐惧与贪婪指数进入极度恐惧区间。请确认市场压力是否影响你的计划。',
      zh_TW: '恐懼與貪婪指數進入極度恐懼區間。請確認市場壓力是否影響你的計畫。',
      fr: 'L indice Fear & Greed entre en peur extreme. Verifiez si le stress du marche change votre plan.',
      de: 'Der Fear-&-Greed-Index ist in extreme Angst gefallen. Pruefe, ob Marktstress deinen Plan aendert.',
    },
  },
  fearGreedExtremeGreed: {
    title: {
      en: 'Fear & Greed: Extreme Greed',
      ko: '공포탐욕: 극단적 탐욕',
      ja: 'Fear & Greed: 極端な強欲',
      es: 'Miedo y codicia: codicia extrema',
      pt: 'Medo e ganancia: ganancia extrema',
      ru: 'Fear & Greed: крайняя жадность',
      zh: '恐惧与贪婪：极度贪婪',
      zh_TW: '恐懼與貪婪：極度貪婪',
      fr: 'Peur et avidite : avidite extreme',
      de: 'Fear & Greed: extreme Gier',
    },
    body: {
      en: 'The Fear & Greed Index entered Extreme Greed. Check whether risk is getting crowded.',
      ko: '공포탐욕 지수가 극단적 탐욕 구간에 진입했습니다. 리스크가 과열되고 있는지 확인하세요.',
      ja: 'Fear & Greed指数が極端な強欲ゾーンに入りました。リスクが過熱していないか確認してください。',
      es: 'El indice Fear & Greed entro en codicia extrema. Revisa si el riesgo se esta saturando.',
      pt: 'O indice Fear & Greed entrou em ganancia extrema. Verifique se o risco esta ficando excessivo.',
      ru: 'Индекс Fear & Greed вошел в зону крайней жадности. Проверьте, не становится ли риск перегретым.',
      zh: '恐惧与贪婪指数进入极度贪婪区间。请确认风险是否过热。',
      zh_TW: '恐懼與貪婪指數進入極度貪婪區間。請確認風險是否過熱。',
      fr: 'L indice Fear & Greed entre en avidite extreme. Verifiez si le risque devient excessif.',
      de: 'Der Fear-&-Greed-Index ist in extreme Gier gestiegen. Pruefe, ob Risiko ueberhitzt.',
    },
  },
  portfolioCashLow: {
    title: {
      en: 'Cash rebalancing alert',
      ko: '현금 리밸런싱 알림',
      ja: '現金リバランス通知',
      es: 'Alerta de rebalanceo de efectivo',
      pt: 'Alerta de rebalanceamento de caixa',
      ru: 'Уведомление о ребалансировке кэша',
      zh: '现金再平衡提醒',
      zh_TW: '現金再平衡提醒',
      fr: 'Alerte de rééquilibrage du cash',
      de: 'Cash-Rebalancing-Alarm',
    },
    body: {
      en: 'Your cash ratio is below the target range. Consider trimming gains and restoring cash.',
      ko: '현금 비중이 목표보다 낮습니다. 일부 수익 실현 후 현금을 다시 확보하는 것을 검토하세요.',
      ja: '現金比率が目標より低くなっています。一部利益確定を行い、現金を回復することを検討してください。',
      es: 'Tu proporción de efectivo está por debajo del objetivo. Considera tomar algunas ganancias y recuperar efectivo.',
      pt: 'Sua proporção de caixa está abaixo da meta. Considere realizar parte dos ganhos e recompor caixa.',
      ru: 'Доля кэша ниже целевого диапазона. Рассмотрите фиксацию части прибыли и восстановление кэша.',
      zh: '现金比例低于目标区间。可考虑部分止盈并恢复现金。',
      zh_TW: '現金比例低於目標區間。可考慮部分止盈並恢復現金。',
      fr: 'Votre part de cash est sous la zone cible. Envisagez de prendre une partie des gains et de reconstituer du cash.',
      de: 'Dein Cash-Anteil liegt unter dem Zielbereich. Erwäge, einen Teil der Gewinne mitzunehmen und Cash wieder aufzubauen.',
    },
  },
  portfolioCashHigh: {
    title: {
      en: 'Cash ratio alert',
      ko: '현금 비중 알림',
      ja: '現金比率通知',
      es: 'Alerta de proporción de efectivo',
      pt: 'Alerta de proporção de caixa',
      ru: 'Уведомление о доле кэша',
      zh: '现金比例提醒',
      zh_TW: '現金比例提醒',
      fr: 'Alerte de part de cash',
      de: 'Cash-Anteil-Alarm',
    },
    body: {
      en: 'Your cash ratio is above the target range. Check whether the portfolio needs rebalancing.',
      ko: '현금 비중이 목표보다 높습니다. 포트폴리오 리밸런싱이 필요한지 확인하세요.',
      ja: '現金比率が目標より高くなっています。ポートフォリオのリバランスが必要か確認してください。',
      es: 'Tu proporción de efectivo está por encima del objetivo. Revisa si la cartera necesita rebalanceo.',
      pt: 'Sua proporção de caixa está acima da meta. Verifique se a carteira precisa de rebalanceamento.',
      ru: 'Доля кэша выше целевого диапазона. Проверьте, нужна ли ребалансировка портфеля.',
      zh: '现金比例高于目标区间。请检查组合是否需要再平衡。',
      zh_TW: '現金比例高於目標區間。請檢查組合是否需要再平衡。',
      fr: 'Votre part de cash est au-dessus de la zone cible. Vérifiez si le portefeuille doit être rééquilibré.',
      de: 'Dein Cash-Anteil liegt über dem Zielbereich. Prüfe, ob das Portfolio rebalanciert werden sollte.',
    },
  },
};

function numberOrZero(value) {
  const next = Number(value);
  return Number.isFinite(next) ? next : 0;
}

function fearGreedAlertStateForScore(score) {
  if (score <= 25) return -1;
  if (score > 75) return 1;
  return 0;
}

function fearGreedRatingForScore(score) {
  if (score <= 25) return 'Extreme Fear';
  if (score <= 45) return 'Fear';
  if (score <= 55) return 'Neutral';
  if (score <= 75) return 'Greed';
  return 'Extreme Greed';
}

function findFearGreedScore(value) {
  if (value && typeof value === 'object' && !Array.isArray(value)) {
    if (Object.prototype.hasOwnProperty.call(value, 'score')) {
      const score = Number(value.score);
      if (Number.isFinite(score)) return score;
    }

    for (const child of Object.values(value)) {
      const found = findFearGreedScore(child);
      if (found != null) return found;
    }
  }

  if (Array.isArray(value)) {
    for (const child of value) {
      const found = findFearGreedScore(child);
      if (found != null) return found;
    }
  }

  return null;
}

function parseFearGreedData(json) {
  const now = json?.fear_and_greed;

  if (now && typeof now === 'object') {
    const score = Number(now.score);
    if (Number.isFinite(score)) {
      const timestamp = Number(now.timestamp);
      return {
        score,
        rating: String(now.rating || fearGreedRatingForScore(score)),
        updatedAt: Number.isFinite(timestamp)
          ? new Date(timestamp < 10000000000 ? timestamp * 1000 : timestamp)
              .toISOString()
          : '',
      };
    }
  }

  const score = findFearGreedScore(json);
  if (score == null) {
    throw new Error('Fear & Greed score not found');
  }

  return {
    score,
    rating: fearGreedRatingForScore(score),
    updatedAt: '',
  };
}

async function fetchFearGreedData(scheduledTime = Date.now()) {
  const now = new Date(scheduledTime);
  const today = now.toISOString().slice(0, 10);
  const yesterday = new Date(now.getTime() - 24 * 60 * 60 * 1000)
    .toISOString()
    .slice(0, 10);
  const urls = [
    'https://production.dataviz.cnn.io/index/fearandgreed/graphdata',
    `https://production.dataviz.cnn.io/index/fearandgreed/graphdata/${today}`,
    `https://production.dataviz.cnn.io/index/fearandgreed/graphdata/${yesterday}`,
  ];
  const headers = {
    Accept: 'application/json,text/plain,*/*',
    'Accept-Language': 'en-US,en;q=0.9',
    'User-Agent':
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36',
    Origin: 'https://www.cnn.com',
    Referer: 'https://www.cnn.com/markets/fear-and-greed',
  };

  let lastError = null;
  for (const url of urls) {
    try {
      const response = await fetch(url, {
        headers,
        cf: {
          cacheTtl: 0,
          cacheEverything: false,
        },
      });

      if (!response.ok) {
        lastError = `CNN returned ${response.status}`;
        continue;
      }

      return parseFearGreedData(await response.json());
    } catch (error) {
      lastError = error?.message ?? String(error);
    }
  }

  throw new Error(`Fear & Greed unavailable: ${lastError}`);
}

async function getFearGreedData() {
  const now = Date.now();
  if (fearGreedCache?.expiresAt > now) {
    return { body: fearGreedCache.body, cacheStatus: 'HIT' };
  }

  if (fearGreedInflight) {
    return { body: await fearGreedInflight, cacheStatus: 'HIT' };
  }

  fearGreedInflight = fetchFearGreedData()
    .then((body) => {
      fearGreedCache = {
        body,
        expiresAt: Date.now() + FEAR_GREED_CACHE_TTL_MS,
      };
      fearGreedInflight = null;
      return body;
    })
    .catch((error) => {
      fearGreedInflight = null;
      throw error;
    });

  return { body: await fearGreedInflight, cacheStatus: 'MISS' };
}

function base64UrlEncode(input) {
  const bytes =
    typeof input === 'string' ? new TextEncoder().encode(input) : input;
  let binary = '';

  for (const byte of bytes) {
    binary += String.fromCharCode(byte);
  }

  return btoa(binary)
    .replace(/\+/g, '-')
    .replace(/\//g, '_')
    .replace(/=+$/g, '');
}

function timingSafeSecretEqual(provided, expected) {
  const encoder = new TextEncoder();
  const providedBytes = encoder.encode(provided);
  const expectedBytes = encoder.encode(expected);

  if (providedBytes.byteLength !== expectedBytes.byteLength) {
    return false;
  }

  return crypto.subtle.timingSafeEqual(providedBytes, expectedBytes);
}

function pemToArrayBuffer(pem) {
  const normalized = pem
    .replace(/\\n/g, '\n')
    .replace('-----BEGIN PRIVATE KEY-----', '')
    .replace('-----END PRIVATE KEY-----', '')
    .replace(/\s+/g, '');
  const binary = atob(normalized);
  const bytes = new Uint8Array(binary.length);

  for (let i = 0; i < binary.length; i += 1) {
    bytes[i] = binary.charCodeAt(i);
  }

  return bytes.buffer;
}

function stateKey(key) {
  return `${ALERT_STATE_PREFIX}${key}`;
}

async function getState(env, key, fallback = null) {
  const raw = await env.ALERT_STATE?.get(stateKey(key));

  if (raw == null) return fallback;

  try {
    return JSON.parse(raw);
  } catch (_) {
    return raw;
  }
}

async function putState(env, key, value) {
  await env.ALERT_STATE?.put(stateKey(key), JSON.stringify(value));
}

async function deleteState(env, key) {
  await env.ALERT_STATE?.delete(stateKey(key));
}

function nthWeekdayOfMonth(year, month, weekday, n) {
  const first = new Date(Date.UTC(year, month - 1, 1));
  const firstWeekday = first.getUTCDay();
  const delta = (weekday - firstWeekday + 7) % 7;
  return 1 + delta + (n - 1) * 7;
}

function dateString(year, month, day) {
  return `${year}-${String(month).padStart(2, '0')}-${String(day).padStart(
    2,
    '0',
  )}`;
}

function addDays(year, month, day, delta) {
  const date = new Date(Date.UTC(year, month - 1, day + delta));
  return {
    year: date.getUTCFullYear(),
    month: date.getUTCMonth() + 1,
    day: date.getUTCDate(),
    weekday: date.getUTCDay(),
  };
}

function lastWeekdayOfMonth(year, month, weekday) {
  const last = new Date(Date.UTC(year, month, 0));
  const delta = (last.getUTCDay() - weekday + 7) % 7;
  return last.getUTCDate() - delta;
}

function easterSunday(year) {
  const a = year % 19;
  const b = Math.floor(year / 100);
  const c = year % 100;
  const d = Math.floor(b / 4);
  const e = b % 4;
  const f = Math.floor((b + 8) / 25);
  const g = Math.floor((b - f + 1) / 3);
  const h = (19 * a + b - d - g + 15) % 30;
  const i = Math.floor(c / 4);
  const k = c % 4;
  const l = (32 + 2 * e + 2 * i - h - k) % 7;
  const m = Math.floor((a + 11 * h + 22 * l) / 451);
  const month = Math.floor((h + l - 7 * m + 114) / 31);
  const day = ((h + l - 7 * m + 114) % 31) + 1;

  return { month, day };
}

function addObservedFixedHoliday(dates, year, month, day, options = {}) {
  const date = new Date(Date.UTC(year, month - 1, day));
  const weekday = date.getUTCDay();

  if (weekday === 0) {
    const observed = addDays(year, month, day, 1);
    dates.add(dateString(observed.year, observed.month, observed.day));
    return;
  }

  if (weekday === 6) {
    if (options.skipSaturdayObserved) return;

    const observed = addDays(year, month, day, -1);
    dates.add(dateString(observed.year, observed.month, observed.day));
    return;
  }

  dates.add(dateString(year, month, day));
}

function previousTradingDate(year, month, day, closedDates) {
  let current = addDays(year, month, day, -1);

  while (
    current.weekday === 0 ||
    current.weekday === 6 ||
    closedDates.has(dateString(current.year, current.month, current.day))
  ) {
    current = addDays(current.year, current.month, current.day, -1);
  }

  return dateString(current.year, current.month, current.day);
}

function nextTradingDate(year, month, day) {
  let current = addDays(year, month, day, 1);

  while (
    current.weekday === 0 ||
    current.weekday === 6 ||
    buildUsMarketCalendar(current.year).closedDates.has(
      dateString(current.year, current.month, current.day),
    )
  ) {
    current = addDays(current.year, current.month, current.day, 1);
  }

  return dateString(current.year, current.month, current.day);
}

function buildUsMarketCalendar(year) {
  if (marketCalendarCache.has(year)) return marketCalendarCache.get(year);

  const closedDates = new Set();
  const earlyCloseDates = new Set();

  addObservedFixedHoliday(closedDates, year, 1, 1, {
    skipSaturdayObserved: true,
  });
  closedDates.add(dateString(year, 1, nthWeekdayOfMonth(year, 1, 1, 3)));
  closedDates.add(dateString(year, 2, nthWeekdayOfMonth(year, 2, 1, 3)));

  const easter = easterSunday(year);
  const goodFriday = addDays(year, easter.month, easter.day, -2);
  closedDates.add(
    dateString(goodFriday.year, goodFriday.month, goodFriday.day),
  );

  closedDates.add(dateString(year, 5, lastWeekdayOfMonth(year, 5, 1)));
  addObservedFixedHoliday(closedDates, year, 6, 19);
  addObservedFixedHoliday(closedDates, year, 7, 4);
  closedDates.add(dateString(year, 9, nthWeekdayOfMonth(year, 9, 1, 1)));
  closedDates.add(dateString(year, 11, nthWeekdayOfMonth(year, 11, 4, 4)));
  addObservedFixedHoliday(closedDates, year, 12, 25);

  const thanksgivingDay = nthWeekdayOfMonth(year, 11, 4, 4);
  const dayAfterThanksgiving = addDays(year, 11, thanksgivingDay, 1);
  earlyCloseDates.add(
    dateString(
      dayAfterThanksgiving.year,
      dayAfterThanksgiving.month,
      dayAfterThanksgiving.day,
    ),
  );

  const independenceEarlyClose = previousTradingDate(
    year,
    7,
    4,
    closedDates,
  );
  earlyCloseDates.add(independenceEarlyClose);

  const christmasEve = dateString(year, 12, 24);
  const christmasEveDate = new Date(Date.UTC(year, 11, 24));
  if (
    christmasEveDate.getUTCDay() >= 1 &&
    christmasEveDate.getUTCDay() <= 5 &&
    !closedDates.has(christmasEve)
  ) {
    earlyCloseDates.add(christmasEve);
  }

  const calendar = { closedDates, earlyCloseDates };
  marketCalendarCache.set(year, calendar);
  return calendar;
}

function isNewYorkDst(utcDate) {
  const year = utcDate.getUTCFullYear();
  const dstStartDay = nthWeekdayOfMonth(year, 3, 0, 2);
  const dstEndDay = nthWeekdayOfMonth(year, 11, 0, 1);
  const dstStartUtc = Date.UTC(year, 2, dstStartDay, 7);
  const dstEndUtc = Date.UTC(year, 10, dstEndDay, 6);
  const now = utcDate.getTime();

  return now >= dstStartUtc && now < dstEndUtc;
}

function newYorkTimeParts(utcDate) {
  const offsetHours = isNewYorkDst(utcDate) ? -4 : -5;
  const ny = new Date(utcDate.getTime() + offsetHours * 60 * 60 * 1000);
  const date = ny.toISOString().slice(0, 10);
  const minutes = ny.getUTCHours() * 60 + ny.getUTCMinutes();
  const weekday = ny.getUTCDay();
  const year = ny.getUTCFullYear();

  return { date, minutes, weekday, year };
}

function isUsMarketOpenDay(parts) {
  if (
    parts.year < MARKET_CALENDAR_START_YEAR ||
    parts.year > MARKET_CALENDAR_END_YEAR
  ) {
    return parts.weekday >= 1 && parts.weekday <= 5;
  }

  const calendar = buildUsMarketCalendar(parts.year);

  return (
    parts.weekday >= 1 &&
    parts.weekday <= 5 &&
    !calendar.closedDates.has(parts.date)
  );
}

function marketCloseMinute(parts) {
  if (!isUsMarketOpenDay(parts)) return 0;

  const calendar = buildUsMarketCalendar(parts.year);
  return calendar.earlyCloseDates.has(parts.date) ? 780 : 960;
}

function isRegularMarket(parts) {
  const closeMinute = marketCloseMinute(parts);
  return closeMinute > 0 && parts.minutes >= 570 && parts.minutes < closeMinute;
}

function newYorkDateParts(date) {
  const [year, month, day] = date.split('-').map((part) => Number(part));
  const utcDate = new Date(Date.UTC(year, month - 1, day));
  return {
    date,
    minutes: 570,
    weekday: utcDate.getUTCDay(),
    year,
  };
}

function nextNewYorkDate(date) {
  const [year, month, day] = date.split('-').map((part) => Number(part));
  const next = addDays(year, month, day, 1);
  return dateString(next.year, next.month, next.day);
}

function closeGuessWinnerMessageExpired(winnerMessage, now = new Date()) {
  const updatedAt = new Date(String(winnerMessage?.updatedAt || ''));
  if (Number.isNaN(updatedAt.getTime())) return true;

  const updatedParts = newYorkTimeParts(updatedAt);
  const nowParts = newYorkTimeParts(now);
  let date = updatedParts.date;

  while (date <= nowParts.date) {
    const parts = newYorkDateParts(date);
    if (isUsMarketOpenDay(parts)) {
      const openIsAfterMessage =
        date > updatedParts.date || updatedParts.minutes < 570;
      const openHasStarted =
        date < nowParts.date || nowParts.minutes >= 570;

      if (openIsAfterMessage && openHasStarted) {
        return true;
      }
    }

    date = nextNewYorkDate(date);
  }

  return false;
}

function closeGuessSubmissionWindowOpen(now = new Date()) {
  return true;
}

function closeGuessSubmissionDate(now = new Date()) {
  const parts = newYorkTimeParts(now);
  if (!isUsMarketOpenDay(parts)) {
    const [year, month, day] = parts.date.split('-').map((part) => Number(part));
    return nextTradingDate(year, month, day);
  }

  if (parts.minutes >= marketCloseMinute(parts)) {
    const [year, month, day] = parts.date.split('-').map((part) => Number(part));
    return nextTradingDate(year, month, day);
  }

  return parts.date;
}

function closeGuessResultDate(now = new Date()) {
  const parts = newYorkTimeParts(now);
  const [year, month, day] = parts.date.split('-').map((part) => Number(part));

  if (isUsMarketOpenDay(parts) && parts.minutes >= marketCloseMinute(parts)) {
    return parts.date;
  }

  return previousTradingDate(
    year,
    month,
    day,
    buildUsMarketCalendar(year).closedDates,
  );
}

function closeGuessDefaultDate(dates) {
  const resultDate = closeGuessResultDate();
  if (dates.includes(resultDate) || closeGuessQuoteFallbackAllowed(resultDate)) {
    return resultDate;
  }
  return dates[0] || resultDate;
}

function closeGuessVisibleResultDates(dates, now = new Date()) {
  const resultDate = closeGuessResultDate(now);
  return dates.filter((date) => date <= resultDate);
}

function dropZoneForPercent(dropPercent) {
  if (dropPercent <= -50) return 50;
  if (dropPercent <= -40) return 40;
  if (dropPercent <= -30) return 30;
  if (dropPercent <= -20) return 20;
  return 0;
}

function alertTypeForDropZone(zone) {
  if (zone === 20) return 'minus20';
  if (zone === 30) return 'minus30';
  if (zone === 40) return 'minus40';
  if (zone === 50) return 'minus50';
  return '';
}

function recoveryAlertTypesForZoneChange(savedZone, nextZone) {
  const types = [];

  if (savedZone >= 50 && nextZone < 50) types.push('recovery50');
  if (savedZone >= 40 && nextZone < 40) types.push('recovery40');
  if (savedZone >= 30 && nextZone < 30) types.push('recovery30');
  if (savedZone >= 20 && nextZone < 20) types.push('recovery20');

  return types;
}

function alertTopicForLanguage(language) {
  return `${ALERT_TOPIC}_${language}`;
}

function normalizedAlertLanguage(language) {
  const normalized = String(language || '').replace(/-/g, '_');
  if (normalized === 'zh_TW' || normalized.toLowerCase() === 'zh_hant') {
    return 'zh_TW';
  }
  if (normalized.startsWith('zh')) return 'zh';
  if (ALERT_LANGUAGES.includes(normalized)) return normalized;

  const baseCode = normalized.split('_')[0];
  return ALERT_LANGUAGES.includes(baseCode) ? baseCode : 'en';
}

function containsKorean(text) {
  return /[\u1100-\u11ff\u3130-\u318f\uac00-\ud7a3]/u.test(
    String(text || ''),
  );
}

function nonKoreanAlertText(localizedText, englishText, fallbackText) {
  const preferred = String(localizedText || '').trim();
  if (preferred && !containsKorean(preferred)) return preferred;

  const english = String(englishText || '').trim();
  if (english && !containsKorean(english)) return english;

  return fallbackText;
}

function notificationTextForLanguage(data, language) {
  const code = normalizedAlertLanguage(language);
  if (code === 'ko') {
    const title =
      data.title_ko || data.title_en || data.title || 'QLD Alert';
    const body =
      data.body_ko ||
      data.detail_ko ||
      data.body_en ||
      data.detail_en ||
      data.body ||
      title;

    return { title, body };
  }

  const englishTitle = data.title_en || data.title;
  const englishBody = data.body_en || data.detail_en || data.body;
  const title = nonKoreanAlertText(
    data[`title_${code}`],
    englishTitle,
    'QLD Alert',
  );
  const body = nonKoreanAlertText(
    data[`body_${code}`] || data[`detail_${code}`],
    englishBody,
    title,
  );

  return { title, body };
}

function cleanServerAlertText(type) {
  const texts = {
    high: {
      title_en: 'QLD reached a new high',
      body_en:
        'QLD closed at a new high. The shared server high has been updated.',
      title_ko: 'QLD 신고가 알림',
      body_ko:
        'QLD가 종가 기준 신고가를 기록했습니다. 서버 기준 최고가가 갱신되었습니다.',
    },
    minus20: {
      title_en: 'QLD -20% strategy zone',
      body_en:
        'QLD closed 20% or more below its high. Review your staged buying plan.',
      title_ko: 'QLD -20% 전략 알림',
      body_ko:
        'QLD가 최고가 대비 -20% 구간에 들어왔습니다. 분할 매수 계획을 확인하세요.',
    },
    minus30: {
      title_en: 'QLD -30% strategy zone',
      body_en:
        'QLD closed 30% or more below its high. Review your staged buying plan.',
      title_ko: 'QLD -30% 전략 알림',
      body_ko:
        'QLD가 최고가 대비 -30% 구간에 들어왔습니다. 분할 매수 계획을 확인하세요.',
    },
    minus40: {
      title_en: 'QLD -40% strategy zone',
      body_en:
        'QLD closed 40% or more below its high. Review your staged buying plan.',
      title_ko: 'QLD -40% 전략 알림',
      body_ko:
        'QLD가 최고가 대비 -40% 구간에 들어왔습니다. 분할 매수 계획을 확인하세요.',
    },
    minus50: {
      title_en: 'QLD -50% strategy zone',
      body_en:
        'QLD closed 50% or more below its high. Review your staged buying plan.',
      title_ko: 'QLD -50% 전략 알림',
      body_ko:
        'QLD가 최고가 대비 -50% 구간에 들어왔습니다. 현금 비중과 분할 매수 계획을 확인하세요.',
    },
    recovery20: {
      title_en: 'QLD recovered above -20%',
      body_en:
        'QLD recovered above the -20% drawdown zone. Review your portfolio plan.',
      title_ko: 'QLD -20% 구간 회복',
      body_ko:
        'QLD가 최고가 대비 -20% 구간 위로 회복했습니다. 포트폴리오 계획을 확인하세요.',
    },
    recovery30: {
      title_en: 'QLD recovered above -30%',
      body_en:
        'QLD recovered above the -30% drawdown zone. Review your portfolio plan.',
      title_ko: 'QLD -30% 구간 회복',
      body_ko:
        'QLD가 최고가 대비 -30% 구간 위로 회복했습니다. 포트폴리오 계획을 확인하세요.',
    },
    recovery40: {
      title_en: 'QLD recovered above -40%',
      body_en:
        'QLD recovered above the -40% drawdown zone. Review your portfolio plan.',
      title_ko: 'QLD -40% 구간 회복',
      body_ko:
        'QLD가 최고가 대비 -40% 구간 위로 회복했습니다. 포트폴리오 계획을 확인하세요.',
    },
    recovery50: {
      title_en: 'QLD recovered above -50%',
      body_en:
        'QLD recovered above the -50% drawdown zone. Review your portfolio plan.',
      title_ko: 'QLD -50% 구간 회복',
      body_ko:
        'QLD가 최고가 대비 -50% 구간 위로 회복했습니다. 포트폴리오 계획을 확인하세요.',
    },
  };

  return texts[type] || null;
}

function localizedAlertPayload(type) {
  if (type === 'marketOpen') {
    const titleEn = 'U.S. market is open';
    const bodyEn =
      'Regular trading has started. Check your plan only if action is needed today.';
    return {
      type,
      title: titleEn,
      body: bodyEn,
      detail: bodyEn,
      title_en: titleEn,
      body_en: bodyEn,
      detail_en: bodyEn,
      title_ko: '\uBBF8\uAD6D \uC99D\uC2DC\uAC00 \uC2DC\uC791\uB418\uC5C8\uC2B5\uB2C8\uB2E4',
      body_ko:
        '\uC815\uADDC\uC7A5\uC774 \uC2DC\uC791\uB418\uC5C8\uC2B5\uB2C8\uB2E4. \uC624\uB298 \uD589\uB3D9\uD560 \uACC4\uD68D\uC774 \uC788\uC744 \uB54C\uB9CC \uAC00\uACA9\uACFC \uC804\uB7B5 \uC54C\uB9BC\uC744 \uD655\uC778\uD558\uC138\uC694.',
      detail_ko:
        '\uC815\uADDC\uC7A5\uC774 \uC2DC\uC791\uB418\uC5C8\uC2B5\uB2C8\uB2E4. \uC624\uB298 \uD589\uB3D9\uD560 \uACC4\uD68D\uC774 \uC788\uC744 \uB54C\uB9CC \uAC00\uACA9\uACFC \uC804\uB7B5 \uC54C\uB9BC\uC744 \uD655\uC778\uD558\uC138\uC694.',
      title_ja: '\u7C73\u56FD\u5E02\u5834\u304C\u958B\u304D\u307E\u3057\u305F',
      body_ja:
        '\u901A\u5E38\u53D6\u5F15\u304C\u59CB\u307E\u308A\u307E\u3057\u305F\u3002\u4ECA\u65E5\u884C\u52D5\u304C\u5FC5\u8981\u306A\u5834\u5408\u3060\u3051\u8A08\u753B\u3092\u78BA\u8A8D\u3057\u3066\u304F\u3060\u3055\u3044\u3002',
      detail_ja:
        '\u901A\u5E38\u53D6\u5F15\u304C\u59CB\u307E\u308A\u307E\u3057\u305F\u3002\u4ECA\u65E5\u884C\u52D5\u304C\u5FC5\u8981\u306A\u5834\u5408\u3060\u3051\u8A08\u753B\u3092\u78BA\u8A8D\u3057\u3066\u304F\u3060\u3055\u3044\u3002',
      title_es: 'El mercado de EE. UU. esta abierto',
      body_es:
        'La sesion regular ha comenzado. Revisa tu plan solo si necesitas actuar hoy.',
      detail_es:
        'La sesion regular ha comenzado. Revisa tu plan solo si necesitas actuar hoy.',
      title_pt: 'O mercado dos EUA abriu',
      body_pt:
        'A sessao regular comecou. Verifique seu plano apenas se precisar agir hoje.',
      detail_pt:
        'A sessao regular comecou. Verifique seu plano apenas se precisar agir hoje.',
      title_ru: '\u0420\u044B\u043D\u043E\u043A \u0421\u0428\u0410 \u043E\u0442\u043A\u0440\u044B\u043B\u0441\u044F',
      body_ru:
        '\u041E\u0441\u043D\u043E\u0432\u043D\u0430\u044F \u0441\u0435\u0441\u0441\u0438\u044F \u043D\u0430\u0447\u0430\u043B\u0430\u0441\u044C. \u041F\u0440\u043E\u0432\u0435\u0440\u044F\u0439\u0442\u0435 \u043F\u043B\u0430\u043D \u0442\u043E\u043B\u044C\u043A\u043E \u0435\u0441\u043B\u0438 \u043D\u0443\u0436\u043D\u043E \u0434\u0435\u0439\u0441\u0442\u0432\u043E\u0432\u0430\u0442\u044C \u0441\u0435\u0433\u043E\u0434\u043D\u044F.',
      detail_ru:
        '\u041E\u0441\u043D\u043E\u0432\u043D\u0430\u044F \u0441\u0435\u0441\u0441\u0438\u044F \u043D\u0430\u0447\u0430\u043B\u0430\u0441\u044C. \u041F\u0440\u043E\u0432\u0435\u0440\u044F\u0439\u0442\u0435 \u043F\u043B\u0430\u043D \u0442\u043E\u043B\u044C\u043A\u043E \u0435\u0441\u043B\u0438 \u043D\u0443\u0436\u043D\u043E \u0434\u0435\u0439\u0441\u0442\u0432\u043E\u0432\u0430\u0442\u044C \u0441\u0435\u0433\u043E\u0434\u043D\u044F.',
      title_zh: '\u7F8E\u56FD\u5E02\u573A\u5DF2\u5F00\u76D8',
      body_zh:
        '\u5E38\u89C4\u4EA4\u6613\u5DF2\u5F00\u59CB\u3002\u53EA\u6709\u4ECA\u5929\u9700\u8981\u884C\u52A8\u65F6\u518D\u68C0\u67E5\u8BA1\u5212\u3002',
      detail_zh:
        '\u5E38\u89C4\u4EA4\u6613\u5DF2\u5F00\u59CB\u3002\u53EA\u6709\u4ECA\u5929\u9700\u8981\u884C\u52A8\u65F6\u518D\u68C0\u67E5\u8BA1\u5212\u3002',
      title_zh_TW: '\u7F8E\u570B\u5E02\u5834\u5DF2\u958B\u76E4',
      body_zh_TW:
        '\u5E38\u898F\u4EA4\u6613\u5DF2\u958B\u59CB\u3002\u53EA\u6709\u4ECA\u5929\u9700\u8981\u884C\u52D5\u6642\u518D\u6AA2\u67E5\u8A08\u756B\u3002',
      detail_zh_TW:
        '\u5E38\u898F\u4EA4\u6613\u5DF2\u958B\u59CB\u3002\u53EA\u6709\u4ECA\u5929\u9700\u8981\u884C\u52D5\u6642\u518D\u6AA2\u67E5\u8A08\u756B\u3002',
      title_fr: 'Le marche americain est ouvert',
      body_fr:
        'La seance reguliere a commence. Verifiez votre plan seulement si une action est necessaire.',
      detail_fr:
        'La seance reguliere a commence. Verifiez votre plan seulement si une action est necessaire.',
      title_de: 'Der US-Markt ist geoeffnet',
      body_de:
        'Der regulaere Handel hat begonnen. Pruefe deinen Plan nur, wenn heute Handlungsbedarf besteht.',
      detail_de:
        'Der regulaere Handel hat begonnen. Pruefe deinen Plan nur, wenn heute Handlungsbedarf besteht.',
    };
  }

  if (type.startsWith('profitTarget')) {
    const match = type.match(/^profitTarget(Qld|Tqqq)(50|100|200|300)$/);
    const symbol = match?.[1] === 'Tqqq' ? 'TQQQ' : 'QLD';
    const target = match?.[2] ?? '50';
    const titleKo = `${symbol} 수익률 ${target}% 달성`;
    const titleEn = `${symbol} profit reached ${target}%`;
    const titleJa = `${symbol} 利益率${target}%達成`;
    const titleEs = `${symbol} alcanzó ${target}% de rentabilidad`;
    const titlePt = `${symbol} atingiu ${target}% de rentabilidade`;
    const titleRu = `${symbol} достиг доходности ${target}%`;
    const titleZh = `${symbol} 收益率达到 ${target}%`;
    const titleZhTw = `${symbol} 收益率達到 ${target}%`;
    const titleFr = `${symbol} a atteint ${target}% de rendement`;
    const titleDe = `${symbol} hat ${target}% Rendite erreicht`;
    const bodyKo =
      `${symbol}가 입력한 평균단가 대비 ${target}% 수익률을 달성했습니다. 목표 비중과 현금 비중을 함께 확인하세요.`;
    const bodyEn =
      `${symbol} reached a ${target}% gain from your average price. Check your target allocation and cash level.`;
    const bodyJa =
      `${symbol}は入力した平均取得単価に対して${target}%の利益率に達しました。目標比率と現金比率を確認してください。`;
    const bodyEs =
      `${symbol} alcanzó ${target}% frente a tu precio medio. Revisa la asignación objetivo y el efectivo.`;
    const bodyPt =
      `${symbol} atingiu ${target}% sobre seu preço médio. Revise a alocação-alvo e o caixa.`;
    const bodyRu =
      `${symbol} достиг ${target}% к вашей средней цене. Проверьте целевую долю и кэш.`;
    const bodyZh =
      `${symbol} 相对你的平均成本已达到 ${target}% 收益率。请检查目标配置和现金比例。`;
    const bodyZhTw =
      `${symbol} 相對你的平均成本已達到 ${target}% 收益率。請檢查目標配置和現金比例。`;
    const bodyFr =
      `${symbol} a atteint ${target}% par rapport à votre prix moyen. Vérifiez l’allocation cible et le cash.`;
    const bodyDe =
      `${symbol} hat gegenüber deinem Durchschnittspreis ${target}% Rendite erreicht. Prüfe Zielgewichtung und Cash-Anteil.`;

    return {
      type,
      title: titleEn,
      body: bodyEn,
      detail: bodyEn,
      title_en: titleEn,
      body_en: bodyEn,
      detail_en: bodyEn,
    };
  }

  const cleanText = cleanServerAlertText(type);
  if (cleanText) {
    return {
      type,
      title: cleanText.title_en,
      body: cleanText.body_en,
      detail: cleanText.body_en,
      title_en: cleanText.title_en,
      body_en: cleanText.body_en,
      detail_en: cleanText.body_en,
      title_ko: cleanText.title_ko,
      body_ko: cleanText.body_ko,
      detail_ko: cleanText.body_ko,
    };
  }

  const config = ALERT_MESSAGES[type] ?? {};
  const title = config.title ?? {};
  const body = config.body ?? {};
  const fallbackTitle = title.en ?? type;
  const fallbackBody = body.en ?? fallbackTitle;
  const data = {
    type,
    title: fallbackTitle,
    body: fallbackBody,
    detail: fallbackBody,
  };
  const languageCodes = type === 'marketOpen' ? ALERT_LANGUAGES : ['en'];

  for (const code of languageCodes) {
    if (title[code]) data[`title_${code}`] = title[code];
    if (body[code]) {
      data[`body_${code}`] = body[code];
      data[`detail_${code}`] = body[code];
    }
  }

  return data;
}

function symbolMatches(responseSymbol, requestedSymbol) {
  if (!responseSymbol) return true;
  const requestedWithoutPrefix = requestedSymbol.replace(/^\^/, '');

  return (
    responseSymbol === requestedSymbol ||
    responseSymbol === requestedWithoutPrefix ||
    responseSymbol.startsWith(`${requestedSymbol}.`) ||
    responseSymbol.startsWith(`${requestedSymbol}:`) ||
    responseSymbol.startsWith(`${requestedWithoutPrefix}.`) ||
    responseSymbol.startsWith(`${requestedWithoutPrefix}:`) ||
    responseSymbol.endsWith(`:${requestedSymbol}`) ||
    responseSymbol.endsWith(`:${requestedWithoutPrefix}`)
  );
}

async function fetchYahooChart(symbol, query) {
  const yahooUrl = `${YAHOO_CHART_BASE}/${symbol}?${query}`;
  const response = await fetch(yahooUrl, {
    headers: yahooHeaders,
    cf: {
      cacheTtl: 0,
      cacheEverything: false,
    },
  });

  if (!response.ok) {
    throw new Error(`Yahoo chart request failed (${response.status})`);
  }

  return response.json();
}

async function fetchFinnhubQuote(symbol, env) {
  const token = env?.FINNHUB_API_KEY || FINNHUB_API_KEY;
  if (!token) {
    throw new Error('FINNHUB_API_KEY secret is missing');
  }
  const url = new URL(FINNHUB_QUOTE_URL);
  url.searchParams.set('symbol', symbol);
  url.searchParams.set('token', token);

  const response = await fetch(url.toString(), {
    headers: { Accept: 'application/json' },
    cf: {
      cacheTtl: 0,
      cacheEverything: false,
    },
  });

  if (!response.ok) {
    throw new Error(`Finnhub quote request failed (${response.status})`);
  }

  const data = await response.json();
  const currentPrice = numberOrZero(data.c);
  const previousClose = numberOrZero(data.pc);

  if (currentPrice <= 0) {
    throw new Error(`Finnhub quote invalid (${symbol})`);
  }

  return {
    symbol,
    currentPrice,
    previousClose,
    regularMarketPrice: currentPrice,
    regularMarketPreviousClose: previousClose,
    source: 'finnhub',
    timestamp: Date.now(),
  };
}

function quoteFromYahooChart(symbol, chartData) {
  const result = chartData?.chart?.result?.[0] ?? null;
  const meta = result?.meta ?? {};
  const marketPrices = extractMarketPrices(result);
  const regularMarketPrice =
    numberOrZero(meta.regularMarketPrice) ||
    numberOrZero(marketPrices.regularMarketPrice);
  const currentPrice =
    regularMarketPrice ||
    numberOrZero(marketPrices.latestPrice);
  const previousClose =
    numberOrZero(meta.regularMarketPreviousClose) ||
    numberOrZero(meta.previousClose) ||
    numberOrZero(meta.chartPreviousClose) ||
    numberOrZero(marketPrices.regularMarketPreviousClose);

  if (currentPrice <= 0) {
    throw new Error(`Yahoo quote invalid (${symbol})`);
  }

  return {
    symbol,
    currentPrice,
    previousClose,
    preMarketPrice: marketPrices.preMarketPrice,
    postMarketPrice: marketPrices.postMarketPrice,
    regularMarketPrice: regularMarketPrice || currentPrice,
    regularMarketPreviousClose: previousClose,
    source: 'yahoo',
    timestamp: Date.now(),
  };
}

async function fetchYahooQuote(symbol) {
  const yahooSymbols = [symbol];
  let lastError;

  for (const yahooSymbol of yahooSymbols) {
    try {
      const chartData = await fetchYahooChart(yahooSymbol, INTRADAY_QUERY);
      return {
        ...quoteFromYahooChart(symbol, chartData),
        yahooSymbol,
      };
    } catch (error) {
      lastError = error;
    }
  }

  throw lastError;
}

async function fetchEquityQuote(symbol, env) {
  const [finnhubResult, yahooResult] = await Promise.allSettled([
    fetchFinnhubQuote(symbol, env),
    fetchYahooQuote(symbol),
  ]);

  if (finnhubResult.status === 'rejected' && yahooResult.status === 'rejected') {
    throw finnhubResult.reason || yahooResult.reason;
  }

  const finnhub =
    finnhubResult.status === 'fulfilled' ? finnhubResult.value : {};
  const yahoo = yahooResult.status === 'fulfilled' ? yahooResult.value : {};
  const preMarketPrice = numberOrZero(yahoo.preMarketPrice);
  const postMarketPrice = numberOrZero(yahoo.postMarketPrice);
  const regularMarketPrice =
    numberOrZero(yahoo.regularMarketPrice) ||
    numberOrZero(finnhub.regularMarketPrice) ||
    numberOrZero(finnhub.currentPrice);
  const currentPrice =
    regularMarketPrice ||
    numberOrZero(yahoo.currentPrice) ||
    numberOrZero(finnhub.currentPrice);
  const previousClose =
    numberOrZero(yahoo.previousClose) ||
    numberOrZero(finnhub.previousClose);

  return {
    symbol,
    currentPrice,
    previousClose,
    preMarketPrice,
    postMarketPrice,
    regularMarketPrice,
    regularMarketPreviousClose:
      numberOrZero(yahoo.regularMarketPreviousClose) || previousClose,
    source:
      finnhubResult.status === 'fulfilled' && yahooResult.status === 'fulfilled'
        ? 'finnhub+yahoo'
        : finnhubResult.status === 'fulfilled'
          ? 'finnhub'
          : 'yahoo',
    timestamp: Date.now(),
  };
}

function lastQuoteKey(symbol) {
  return `${LAST_QUOTE_PREFIX}${symbol}`;
}

function staleQuoteBody(body) {
  if (!body) return null;
  return {
    ...body,
    stale: true,
    source: body.source ? `${body.source}+stale` : 'stale',
    timestamp: body.timestamp || Date.now(),
  };
}

async function rememberLastQuote(symbol, body, env) {
  if (!env?.ALERT_STATE || !body?.currentPrice) return;

  try {
    await env.ALERT_STATE.put(lastQuoteKey(symbol), JSON.stringify(body), {
      expirationTtl: 3 * 24 * 60 * 60,
    });
  } catch (_) {
    // Last-quote storage is only a resilience layer.
  }
}

async function readLastQuote(symbol, env) {
  const memory = quoteCache.get(symbol)?.body;
  if (memory?.currentPrice) return staleQuoteBody(memory);
  if (!env?.ALERT_STATE) return null;

  try {
    const stored = await env.ALERT_STATE.get(lastQuoteKey(symbol), 'json');
    return stored?.currentPrice ? staleQuoteBody(stored) : null;
  } catch (_) {
    return null;
  }
}

async function fetchQuoteResilient(symbol, env, fetcher) {
  try {
    const body = await fetcher();
    quoteCache.set(symbol, {
      body,
      expiresAt: Date.now() + QUOTE_CACHE_TTL_MS,
    });
    await rememberLastQuote(symbol, body, env);
    return body;
  } catch (_) {
    return readLastQuote(symbol, env);
  }
}

async function getQuoteData(symbol, env) {
  const now = Date.now();
  const cached = quoteCache.get(symbol);

  if (cached && cached.expiresAt > now) {
    return { body: cached.body, cacheStatus: 'HIT' };
  }

  if (quoteInflight.has(symbol)) {
    const body = await quoteInflight.get(symbol);
    return { body, cacheStatus: 'HIT' };
  }

  const fetchPromise = (symbol === 'NQ=F' || symbol === '^VIX' || symbol === '^TNX'
    ? fetchYahooQuote(symbol)
    : fetchEquityQuote(symbol, env))
    .then(async (body) => {
      quoteCache.set(symbol, {
        body,
        expiresAt: Date.now() + QUOTE_CACHE_TTL_MS,
      });
      await rememberLastQuote(symbol, body, env);
      quoteInflight.delete(symbol);
      return body;
    })
    .catch((error) => {
      quoteInflight.delete(symbol);
      throw error;
    });

  quoteInflight.set(symbol, fetchPromise);

  const body = await fetchPromise;
  return { body, cacheStatus: 'MISS' };
}

async function getQldWidgetData(env) {
  const now = Date.now();
  if (widgetCache && widgetCache.expiresAt > now) {
    return { body: widgetCache.body, cacheStatus: 'HIT' };
  }

  if (widgetInflight) {
    return { body: await widgetInflight, cacheStatus: 'HIT' };
  }

  widgetInflight = Promise.all([
    fetchEquityQuote('QLD', env),
    fetchYahooChart('QLD', 'range=10y&interval=1d'),
  ])
    .then(([quote, chartData]) => {
      const result = chartData?.chart?.result?.[0] ?? null;
      const tenYearHigh = highestHighFromChartResult(result);
      const previousCloseChangePercent =
        quote.currentPrice > 0 && quote.previousClose > 0
          ? ((quote.currentPrice - quote.previousClose) /
              quote.previousClose) *
            100
          : 0;
      const body = {
        symbol: 'QLD',
        currentPrice: quote.currentPrice,
        previousClose: quote.previousClose,
        previousCloseChangePercent,
        tenYearHigh,
        source: 'worker-widget',
        timestamp: Date.now(),
      };

      widgetCache = {
        body,
        expiresAt: Date.now() + WIDGET_CACHE_TTL_MS,
      };
      widgetInflight = null;
      return body;
    })
    .catch((error) => {
      widgetInflight = null;
      throw error;
    });

  return { body: await widgetInflight, cacheStatus: 'MISS' };
}

function latestCloseInPeriod(timestamps, closes, start, end) {
  for (let i = timestamps.length - 1; i >= 0; i -= 1) {
    const close = closes[i];
    const ts = timestamps[i];

    if (close == null || ts == null) {
      continue;
    }

    if (ts >= start && ts < end) {
      return close;
    }
  }

  return null;
}

function lastNonNullClose(closes) {
  for (let i = closes.length - 1; i >= 0; i -= 1) {
    if (closes[i] != null) {
      return closes[i];
    }
  }

  return null;
}

function extractMarketPrices(chartResult) {
  const meta = chartResult?.meta ?? {};
  const timestamps = chartResult?.timestamp ?? [];
  const closes = chartResult?.indicators?.quote?.[0]?.close ?? [];
  const period = meta.currentTradingPeriod;

  const preMarketPrice =
    period?.pre != null
      ? latestCloseInPeriod(
          timestamps,
          closes,
          period.pre.start,
          period.pre.end,
        )
      : null;

  const postMarketPrice =
    period?.post != null
      ? latestCloseInPeriod(
          timestamps,
          closes,
          period.post.start,
          period.post.end,
        )
      : null;

  const regularMarketPrice =
    period?.regular != null
      ? latestCloseInPeriod(
          timestamps,
          closes,
          period.regular.start,
          period.regular.end,
        )
      : lastNonNullClose(closes);

  const regularMarketPreviousClose =
    meta.regularMarketPreviousClose ??
    meta.previousClose ??
    meta.chartPreviousClose ??
    null;
  const latestPrice = lastNonNullClose(closes);

  return {
    latestPrice,
    preMarketPrice,
    postMarketPrice,
    regularMarketPrice,
    regularMarketPreviousClose,
  };
}

function mergeMarketPricesIntoMeta(targetMeta, marketPrices) {
  for (const [key, value] of Object.entries(marketPrices)) {
    if (value != null) {
      targetMeta[key] = value;
    }
  }
}

function lastNonNullIndex(values) {
  for (let i = values.length - 1; i >= 0; i -= 1) {
    if (values[i] != null) {
      return i;
    }
  }

  return -1;
}

function applyLatestIntradayClose(historicalResult, intradayResult) {
  if (!intradayResult) {
    return null;
  }

  const intradayQuote = intradayResult.indicators?.quote?.[0];
  const intradayCloses = intradayQuote?.close ?? [];
  const intradayTimestamps = intradayResult.timestamp ?? [];

  const intradayLastIndex = lastNonNullIndex(intradayCloses);
  if (intradayLastIndex < 0) {
    return null;
  }

  const latestClose = intradayCloses[intradayLastIndex];
  const latestTimestamp = intradayTimestamps[intradayLastIndex];

  const historicalQuote = historicalResult.indicators?.quote?.[0];
  const historicalCloses = historicalQuote?.close;
  if (!historicalCloses?.length) {
    return latestClose;
  }

  const historicalLastIndex = lastNonNullIndex(historicalCloses);
  if (historicalLastIndex < 0) {
    return latestClose;
  }

  historicalCloses[historicalLastIndex] = latestClose;

  if (
    latestTimestamp != null &&
    historicalResult.timestamp?.length > historicalLastIndex
  ) {
    historicalResult.timestamp[historicalLastIndex] = latestTimestamp;
  }

  return latestClose;
}

async function buildChartData(symbol, options = {}) {
  const historicalData = await fetchYahooChart(symbol, 'range=1y&interval=1d');
  const intradayData = options.dailyOnly
    ? null
    : await fetchYahooChart(symbol, INTRADAY_QUERY);

  const historicalResult = historicalData?.chart?.result?.[0];
  if (!historicalResult) {
    throw new Error('No chart data from Yahoo Finance');
  }

  const intradayResult = intradayData?.chart?.result?.[0];
  const marketPrices = intradayResult
    ? extractMarketPrices(intradayResult)
    : extractMarketPrices(historicalResult);

  historicalResult.meta = historicalResult.meta ?? {};
  mergeMarketPricesIntoMeta(historicalResult.meta, marketPrices);
  applyLatestIntradayClose(historicalResult, intradayResult);

  return historicalData;
}

async function getChartData(symbol, options = {}) {
  const now = Date.now();
  const cacheKey = options.dailyOnly ? `${symbol}:daily` : symbol;
  const cached = cache.get(cacheKey);

  if (cached && cached.expiresAt > now) {
    return { body: cached.body, cacheStatus: 'HIT' };
  }

  if (inflight.has(cacheKey)) {
    const body = await inflight.get(cacheKey);
    return { body, cacheStatus: 'HIT' };
  }

  const fetchPromise = buildChartData(symbol, options)
    .then((body) => {
      cache.set(cacheKey, {
        body,
        expiresAt: Date.now() + CACHE_TTL_MS,
      });
      inflight.delete(cacheKey);
      return body;
    })
    .catch((error) => {
      inflight.delete(cacheKey);
      throw error;
    });

  inflight.set(cacheKey, fetchPromise);

  const body = await fetchPromise;
  return { body, cacheStatus: 'MISS' };
}

function jsonResponse(payload, cacheStatus, status = 200) {
  const responseSymbol =
    payload?.chart?.result?.[0]?.meta?.symbol ?? payload?.requestedSymbol ?? '';

  return new Response(JSON.stringify(payload), {
    status,
    headers: {
      ...corsHeaders,
      ...securityHeaders,
      'Content-Type': 'application/json',
      'Cache-Control': 'no-store, no-cache, must-revalidate, max-age=0',
      Pragma: 'no-cache',
      'X-Cache': cacheStatus,
      'X-Symbol': responseSymbol,
    },
  });
}

function quoteResponse(payload, cacheStatus, status = 200) {
  return new Response(JSON.stringify(payload), {
    status,
    headers: {
      ...corsHeaders,
      ...securityHeaders,
      'Content-Type': 'application/json',
      'Cache-Control': `public, max-age=${Math.floor(
        QUOTE_CACHE_TTL_MS / 1000,
      )}`,
      'X-Cache': cacheStatus,
      'X-Symbol': payload?.symbol ?? '',
    },
  });
}

function apiJsonResponse(payload, status = 200) {
  return new Response(JSON.stringify(payload), {
    status,
    headers: {
      ...corsHeaders,
      ...securityHeaders,
      'Content-Type': 'application/json',
      'Cache-Control': 'no-store',
    },
  });
}

function normalizeCloseGuessDate(value) {
  const date = String(value || '').trim();
  return /^\d{4}-\d{2}-\d{2}$/.test(date)
    ? date
    : newYorkTimeParts(new Date()).date;
}

function closeGuessKey(date) {
  return `${CLOSE_GUESS_PREFIX}${date}`;
}

function normalizeCloseGuessId(value) {
  return String(value || '')
    .trim()
    .replace(/\s+/g, ' ')
    .slice(0, 24);
}

function normalizeUserUid(value) {
  return String(value || '')
    .trim()
    .replace(/[^A-Za-z0-9:_-]/g, '')
    .slice(0, 128);
}

function adminUidSet(env) {
  return new Set(
    String(env?.ADMIN_UIDS || '')
      .split(',')
      .map(normalizeUserUid)
      .filter(Boolean),
  );
}

function adminUidSuffixSet(env) {
  return new Set(
    `179204,${String(env?.ADMIN_UID_SUFFIXES || '')}`
      .split(',')
      .map((value) => normalizeUserUid(value).slice(-6))
      .filter(Boolean),
  );
}

function isAdminUid(env, uid) {
  const normalized = normalizeUserUid(uid);
  return (
    normalized &&
    (adminUidSet(env).has(normalized) ||
      adminUidSuffixSet(env).has(normalized.slice(-6)))
  );
}

function adminStatusResponse(env, uid) {
  const normalized = normalizeUserUid(uid);
  const isAdmin = isAdminUid(env, normalized);
  return apiJsonResponse(
    {
      isAdmin,
      permissions: isAdmin ? ADMIN_PERMISSIONS : [],
    },
    200,
  );
}

function normalizeMajorUsScheduleItem(item) {
  const rawTitle = String(item?.title || '')
    .trim()
    .replace(/\s+/g, ' ')
    .slice(0, 80);
  const title = normalizeMajorUsScheduleTitle(rawTitle);
  const date = String(item?.date || '').trim();
  if (!title || !/^\d{4}-\d{2}-\d{2}$/.test(date)) return null;

  const parsed = new Date(`${date}T00:00:00Z`);
  if (
    Number.isNaN(parsed.getTime()) ||
    parsed.toISOString().slice(0, 10) !== date
  ) {
    return null;
  }

  return { title, date };
}

function normalizeMajorUsScheduleTitle(title) {
  const upper = String(title || '').trim().toUpperCase();
  if (!upper) return '';
  if (upper.includes('FOMC')) return 'FOMC';
  if (upper.includes('CPI')) return 'CPI';
  if (
    upper.includes('NFP') ||
    title.includes('고용') ||
    title.includes('雇用') ||
    upper.includes('EMPLOY')
  ) {
    return 'NFP';
  }
  return upper.replace(/\s*발표일정\s*/g, '').trim().slice(0, 80);
}

function sortMajorUsSchedules(items) {
  return [...items].sort((a, b) => {
    const dateCompare = String(a.date).localeCompare(String(b.date));
    return dateCompare || String(a.title).localeCompare(String(b.title));
  });
}

async function loadMajorUsSchedules(env) {
  const stored = await env.ALERT_STATE?.get(MAJOR_US_SCHEDULES_KEY, 'json');
  const source = Array.isArray(stored?.items)
    ? stored.items
    : DEFAULT_MAJOR_US_SCHEDULES;
  return sortMajorUsSchedules(
    source
      .map(normalizeMajorUsScheduleItem)
      .filter(Boolean)
      .slice(0, MAJOR_US_SCHEDULE_MAX_ENTRIES),
  );
}

function sameMajorUsScheduleItem(left, right) {
  return left?.title === right?.title && left?.date === right?.date;
}

async function saveMajorUsSchedules(env, items) {
  const nextItems = sortMajorUsSchedules(items).slice(
    0,
    MAJOR_US_SCHEDULE_MAX_ENTRIES,
  );
  await env.ALERT_STATE.put(
    MAJOR_US_SCHEDULES_KEY,
    JSON.stringify({
      items: nextItems,
      updatedAt: new Date().toISOString(),
    }),
  );
  return nextItems;
}

async function handleGetMajorUsSchedules(env) {
  if (!env.ALERT_STATE) {
    return apiJsonResponse({ error: 'Schedule storage is unavailable' }, 503);
  }

  return apiJsonResponse({ items: await loadMajorUsSchedules(env) }, 200);
}

async function handlePostMajorUsSchedules(request, env) {
  if (!env.ALERT_STATE) {
    return apiJsonResponse({ error: 'Schedule storage is unavailable' }, 503);
  }

  const contentLength = Number(request.headers.get('content-length') || 0);
  if (contentLength > 4096) {
    return apiJsonResponse({ error: 'Request too large' }, 413);
  }

  const body = await request.json();
  const adminUid = normalizeUserUid(body?.adminUid || body?.uid);
  if (!isAdminUid(env, adminUid)) {
    return apiJsonResponse({ error: 'Admin only' }, 403);
  }

  const action = String(body?.action || '').trim();
  const item = normalizeMajorUsScheduleItem(body?.item);
  if (!item || !['add', 'update', 'delete'].includes(action)) {
    return apiJsonResponse({ error: 'Invalid schedule request' }, 400);
  }

  const items = await loadMajorUsSchedules(env);
  let nextItems = items;

  if (action === 'add') {
    nextItems = items
      .filter((saved) => !sameMajorUsScheduleItem(saved, item))
      .concat(item);
  } else {
    const previousItem = normalizeMajorUsScheduleItem(body?.previousItem);
    if (!previousItem) {
      return apiJsonResponse({ error: 'Invalid previous schedule' }, 400);
    }

    const found = items.some((saved) =>
      sameMajorUsScheduleItem(saved, previousItem),
    );
    if (!found) {
      return apiJsonResponse({ error: 'Schedule not found' }, 404);
    }

    nextItems =
      action === 'delete'
        ? items.filter((saved) => !sameMajorUsScheduleItem(saved, previousItem))
        : items.map((saved) =>
            sameMajorUsScheduleItem(saved, previousItem) ? item : saved,
          );
  }

  return apiJsonResponse(
    { items: await saveMajorUsSchedules(env, nextItems) },
    200,
  );
}

function anonymousNameForUid(uid) {
  const normalized = normalizeUserUid(uid);
  return normalized ? `익명-${normalized.slice(-6)}` : '';
}

function normalizeCloseGuessEntry(entry) {
  const uid = normalizeUserUid(entry?.uid);
  const nickname = normalizeCloseGuessId(entry?.nickname || entry?.id);
  const id = nickname || anonymousNameForUid(uid);
  const price = Number(entry?.price);
  const close = Number(entry?.close);
  const submittedAt = String(entry?.submittedAt || new Date().toISOString());
  const messageTokenHash = String(entry?.messageTokenHash || '');
  const attempts = Math.max(1, Math.floor(Number(entry?.attempts) || 1));

  if ((!uid && !id) || !Number.isFinite(price) || price <= 0) return null;
  if (!Number.isFinite(close) || close <= 0) return null;

  return { uid, id, price, close, submittedAt, messageTokenHash, attempts };
}

function sameCloseGuessUser(left, right) {
  if (!left || !right) return false;
  if (left.uid && right.uid) return left.uid === right.uid;
  return left.id === right.id;
}

function closeGuessAttemptCount(entries, entry) {
  return entries
    .filter((saved) => sameCloseGuessUser(saved, entry))
    .reduce((max, saved) => Math.max(max, Number(saved.attempts) || 1), 0);
}

function randomCloseGuessToken() {
  const bytes = new Uint8Array(32);
  crypto.getRandomValues(bytes);
  return [...bytes].map((byte) => byte.toString(16).padStart(2, '0')).join('');
}

function sortCloseGuessEntries(entries) {
  return entries
    .map(normalizeCloseGuessEntry)
    .filter(Boolean)
    .sort((a, b) => {
      const difference = Math.abs(a.price - a.close) - Math.abs(b.price - b.close);
      if (difference !== 0) return difference;
      return a.submittedAt.localeCompare(b.submittedAt);
    });
}

function applyCloseGuessReferenceClose(entries, referenceClose) {
  const close = Number(referenceClose);
  if (!Number.isFinite(close) || close <= 0) {
    return sortCloseGuessEntries(entries);
  }

  return sortCloseGuessEntries(
    entries.map((entry) => ({
      ...entry,
      close,
    })),
  );
}

function closeGuessQuoteFallbackAllowed(date, now = new Date()) {
  const parts = newYorkTimeParts(now);
  return (
    parts.date === date &&
    isUsMarketOpenDay(parts) &&
    parts.minutes >= marketCloseMinute(parts)
  );
}

function closeGuessReferenceCloseLookupDate(date, now = new Date()) {
  const normalizedDate = normalizeCloseGuessDate(date);
  const parts = newYorkTimeParts(now);
  const targetParts = newYorkDateParts(normalizedDate);
  const targetCloseMinute = marketCloseMinute(targetParts);

  if (
    normalizedDate < parts.date ||
    (normalizedDate === parts.date &&
      targetCloseMinute > 0 &&
      parts.minutes >= targetCloseMinute)
  ) {
    return normalizedDate;
  }

  const [year, month, day] = normalizedDate
    .split('-')
    .map((part) => Number(part));
  return previousTradingDate(
    year,
    month,
    day,
    buildUsMarketCalendar(year).closedDates,
  );
}

async function closeGuessReferenceClose(env, date, fallbackClose = 0) {
  const lookupDate = closeGuessReferenceCloseLookupDate(date);
  try {
    const dailyResult = await fetchDailyChartResult('QLD');
    const matchingEntry = closeEntriesFromChartResult(dailyResult)
      .reverse()
      .find((entry) => entry.date === lookupDate);
    if (matchingEntry?.close > 0) return matchingEntry.close;
  } catch (error) {
    console.warn('close guess daily close lookup failed', error?.message || error);
  }

  if (closeGuessQuoteFallbackAllowed(date) || lookupDate !== date) {
    try {
      const quote = await fetchQuoteResilient('QLD', env, () =>
        fetchEquityQuote('QLD', env),
      );
      const quoteClose =
        lookupDate !== date
          ? numberOrZero(quote?.previousClose) ||
            numberOrZero(quote?.regularMarketPreviousClose)
          : numberOrZero(quote?.regularMarketPrice) ||
            numberOrZero(quote?.currentPrice);
      if (quoteClose > 0) return quoteClose;
    } catch (error) {
      console.warn('close guess quote close lookup failed', error?.message || error);
    }
  }

  return numberOrZero(fallbackClose);
}

async function loadCloseGuessDay(env, date) {
  const stored = await env.ALERT_STATE?.get(closeGuessKey(date), 'json');
  const storedEntries = sortCloseGuessEntries(stored?.entries || []);
  const fallbackClose = storedEntries.find((entry) => entry.close > 0)?.close || 0;
  const referenceClose = await closeGuessReferenceClose(env, date, fallbackClose);
  const entries = applyCloseGuessReferenceClose(storedEntries, referenceClose);
  const winnerMessage =
    stored?.winnerMessage &&
    typeof stored.winnerMessage === 'object' &&
    typeof stored.winnerMessage.message === 'string' &&
    !closeGuessWinnerMessageExpired(stored.winnerMessage)
      ? {
          uid: normalizeUserUid(stored.winnerMessage.uid),
          id: normalizeCloseGuessId(stored.winnerMessage.id),
          message: stored.winnerMessage.message.slice(
            0,
            CLOSE_GUESS_MAX_MESSAGE_LENGTH,
          ),
          updatedAt: String(stored.winnerMessage.updatedAt || ''),
        }
      : null;

  return {
    date,
    entries,
    referenceClose,
    winnerMessage,
    updatedAt: stored?.updatedAt || '',
  };
}

function closeGuessDayResponse(day, dates) {
  const entries = sortCloseGuessEntries(day.entries).slice(0, 5).map((entry) => ({
    id: entry.id,
    uid: entry.uid,
    price: entry.price,
    close: entry.close,
    submittedAt: entry.submittedAt,
    difference: Math.abs(entry.price - entry.close),
    attempts: entry.attempts || 1,
  }));

  return {
    date: day.date,
    dates,
    entries,
    referenceClose: day.referenceClose || 0,
    winnerMessage: day.winnerMessage,
    updatedAt: day.updatedAt,
  };
}

function normalizeInquiryId(value) {
  return String(value || '')
    .trim()
    .replace(/\s+/g, ' ')
    .slice(0, 24);
}

function normalizeInquiryNickname(value, uid = '') {
  return normalizeInquiryId(value) || anonymousNameForUid(uid);
}

function normalizeInquiryContent(value) {
  return String(value || '')
    .trim()
    .replace(/\r\n/g, '\n')
    .slice(0, INQUIRY_MAX_CONTENT_LENGTH);
}

function normalizeInquiryAnswer(value) {
  return String(value || '')
    .trim()
    .replace(/\r\n/g, '\n')
    .slice(0, INQUIRY_MAX_CONTENT_LENGTH);
}

function normalizeInquiryMessage(item, fallbackRole = 'user') {
  const role = item?.role === 'admin' ? 'admin' : fallbackRole;
  const content = normalizeInquiryContent(item?.content);
  const createdAt = String(item?.createdAt || new Date().toISOString());
  const uid = normalizeUserUid(item?.uid);
  const nickname = normalizeInquiryNickname(
    item?.nickname || item?.id || (role === 'admin' ? '관리자' : ''),
    uid,
  );

  if (!content) return null;
  return { role, content, createdAt, uid, nickname };
}

function inquiryMessages(inquiry) {
  const messages = Array.isArray(inquiry?.messages)
    ? inquiry.messages
        .map((item) => normalizeInquiryMessage(item))
        .filter(Boolean)
    : [];

  if (messages.length > 0) return messages;

  const uid = normalizeUserUid(inquiry?.uid);
  const content = normalizeInquiryContent(inquiry?.content);
  const createdAt = String(inquiry?.createdAt || '');
  const nickname = normalizeInquiryNickname(inquiry?.nickname || inquiry?.id, uid);
  const answer = normalizeInquiryAnswer(inquiry?.answer);
  const answeredAt = String(inquiry?.answeredAt || '');
  const answeredBy = normalizeInquiryNickname(inquiry?.answeredBy || '관리자');
  const fallback = [];

  if (content) {
    fallback.push({
      role: 'user',
      content,
      createdAt,
      uid,
      nickname,
    });
  }
  if (answer) {
    fallback.push({
      role: 'admin',
      content: answer,
      createdAt: answeredAt || createdAt,
      uid: '',
      nickname: answeredBy,
    });
  }

  return fallback;
}

function publicInquiry(inquiry) {
  const uid = normalizeUserUid(inquiry?.uid);
  const createdAt = String(inquiry?.createdAt || '');
  const answer = normalizeInquiryAnswer(inquiry?.answer);
  const pinned = inquiry?.pinned === true;
  const messages = inquiryMessages(inquiry);
  const lastAdminMessage = [...messages]
    .reverse()
    .find((message) => message.role === 'admin');
  return {
    inquiryId: String(inquiry?.inquiryId || createdAt),
    id: normalizeInquiryNickname(inquiry?.nickname || inquiry?.id, uid),
    nickname: normalizeInquiryNickname(inquiry?.nickname || inquiry?.id, uid),
    content: normalizeInquiryContent(inquiry?.content),
    createdAt,
    answer: lastAdminMessage?.content || answer,
    answeredAt: lastAdminMessage?.createdAt || (answer ? String(inquiry?.answeredAt || '') : ''),
    answeredBy: lastAdminMessage?.nickname || (answer ? normalizeInquiryNickname(inquiry?.answeredBy || '관리자') : ''),
    messages,
    pinned,
    pinnedAt: pinned ? String(inquiry?.pinnedAt || '') : '',
  };
}

function sortInquiries(items) {
  return [...items].sort((a, b) => {
    const pinnedCompare = Number(b.pinned === true) - Number(a.pinned === true);
    if (pinnedCompare !== 0) return pinnedCompare;
    const pinnedAtCompare = String(b.pinnedAt || '').localeCompare(
      String(a.pinnedAt || ''),
    );
    if (pinnedAtCompare !== 0) return pinnedAtCompare;
    return String(b.createdAt || '').localeCompare(String(a.createdAt || ''));
  });
}

async function loadInquiries(env) {
  const stored = await env.ALERT_STATE?.get(INQUIRIES_KEY, 'json');
  return Array.isArray(stored?.items)
    ? stored.items
        .map((item) => ({
          ...publicInquiry(item),
          uid: normalizeUserUid(item?.uid),
          passwordHash: String(item?.passwordHash || ''),
          messages: inquiryMessages(item),
        }))
        .filter((item) => item.id && item.content && item.createdAt)
    : [];
}

async function handleGetInquiries(env) {
  if (!env.ALERT_STATE) {
    return apiJsonResponse({ error: 'Inquiry storage is unavailable' }, 503);
  }

  const items = sortInquiries(await loadInquiries(env)).map(publicInquiry);
  return apiJsonResponse({ items }, 200);
}

async function handlePostInquiry(request, env) {
  if (!env.ALERT_STATE) {
    return apiJsonResponse({ error: 'Inquiry storage is unavailable' }, 503);
  }

  const contentLength = Number(request.headers.get('content-length') || 0);
  if (contentLength > 8192) {
    return apiJsonResponse({ error: 'Request too large' }, 413);
  }

  const body = await request.json();
  const uid = normalizeUserUid(body?.uid);
  const nickname = normalizeInquiryNickname(body?.nickname || body?.id, uid);
  const content = normalizeInquiryContent(body?.content);

  if (!uid || !content) {
    return apiJsonResponse({ error: 'Invalid inquiry' }, 400);
  }

  const items = await loadInquiries(env);
  const nextItems = [
    {
      inquiryId: crypto.randomUUID(),
      uid,
      id: nickname,
      nickname,
      content,
      createdAt: new Date().toISOString(),
      messages: [
        {
          role: 'user',
          uid,
          nickname,
          content,
          createdAt: new Date().toISOString(),
        },
      ],
    },
    ...items,
  ].slice(0, INQUIRY_MAX_ENTRIES);

  await env.ALERT_STATE.put(
    INQUIRIES_KEY,
    JSON.stringify({
      items: nextItems,
      updatedAt: new Date().toISOString(),
    }),
  );

  await sendInquiryNotification(env, OWNER_ADMIN_UID, 'new', nextItems[0]);

  return apiJsonResponse({ items: sortInquiries(nextItems).map(publicInquiry) }, 200);
}

async function handlePostInquiryMessage(request, env) {
  if (!env.ALERT_STATE) {
    return apiJsonResponse({ error: 'Inquiry storage is unavailable' }, 503);
  }

  const contentLength = Number(request.headers.get('content-length') || 0);
  if (contentLength > 8192) {
    return apiJsonResponse({ error: 'Request too large' }, 413);
  }

  const body = await request.json();
  const inquiryId = String(body?.inquiryId || '').trim();
  const uid = normalizeUserUid(body?.uid);
  const adminUid = normalizeUserUid(body?.adminUid);
  const isAdmin = isAdminUid(env, adminUid || uid);
  const role = isAdmin ? 'admin' : 'user';
  const content = normalizeInquiryContent(body?.content || body?.answer);
  const nickname = isAdmin
    ? '관리자'
    : normalizeInquiryNickname(body?.nickname || body?.id, uid);

  if (!inquiryId || !content || (!isAdmin && !uid)) {
    return apiJsonResponse({ error: 'Invalid inquiry message' }, 400);
  }

  const items = await loadInquiries(env);
  let updated = false;
  let notificationTargetUid = '';
  let notificationKind = '';
  let notificationInquiry = null;
  const now = new Date().toISOString();
  const nextItems = items.map((item) => {
    const itemId = String(item.inquiryId || item.createdAt || '');
    if (itemId !== inquiryId) return item;

    const messages = [
      ...inquiryMessages(item),
      {
        role,
        uid: isAdmin ? '' : uid,
        nickname,
        content,
        createdAt: now,
      },
    ].slice(-80);

    updated = true;
    const nextItem = {
      ...item,
      inquiryId: itemId,
      messages,
      answer: role === 'admin' ? content : item.answer || '',
      answeredAt: role === 'admin' ? now : item.answeredAt || '',
      answeredBy: role === 'admin' ? '관리자' : item.answeredBy || '',
    };
    notificationTargetUid =
      role === 'admin' ? normalizeUserUid(item.uid) : OWNER_ADMIN_UID;
    notificationKind = role === 'admin' ? 'reply' : 'new';
    notificationInquiry = nextItem;
    return nextItem;
  });

  if (!updated) {
    return apiJsonResponse({ error: 'Inquiry not found' }, 404);
  }

  await env.ALERT_STATE.put(
    INQUIRIES_KEY,
    JSON.stringify({
      items: nextItems,
      updatedAt: now,
    }),
  );

  if (notificationTargetUid && notificationInquiry) {
    await sendInquiryNotification(
      env,
      notificationTargetUid,
      notificationKind,
      notificationInquiry,
    );
  }

  return apiJsonResponse({ items: sortInquiries(nextItems).map(publicInquiry) }, 200);
}

async function handlePostInquiryReply(request, env) {
  if (!env.ALERT_STATE) {
    return apiJsonResponse({ error: 'Inquiry storage is unavailable' }, 503);
  }

  const contentLength = Number(request.headers.get('content-length') || 0);
  if (contentLength > 8192) {
    return apiJsonResponse({ error: 'Request too large' }, 413);
  }

  const body = await request.json();
  const adminUid = normalizeUserUid(body?.adminUid || body?.uid);
  if (!isAdminUid(env, adminUid)) {
    return apiJsonResponse({ error: 'Admin only' }, 403);
  }

  const inquiryId = String(body?.inquiryId || '').trim();
  const answer = normalizeInquiryAnswer(body?.answer);
  if (!inquiryId || !answer) {
    return apiJsonResponse({ error: 'Invalid inquiry reply' }, 400);
  }

  const items = await loadInquiries(env);
  let updated = false;
  let replyNotificationTargetUid = '';
  let replyNotificationInquiry = null;
  const nextItems = items.map((item) => {
    const itemId = String(item.inquiryId || item.createdAt || '');
    if (itemId !== inquiryId) return item;
    const now = new Date().toISOString();
    const messages = [
      ...inquiryMessages(item),
      {
        role: 'admin',
        uid: '',
        nickname: '관리자',
        content: answer,
        createdAt: now,
      },
    ].slice(-80);
    updated = true;
    const nextItem = {
      ...item,
      inquiryId: itemId,
      messages,
      answer,
      answeredAt: now,
      answeredBy: '관리자',
    };
    replyNotificationTargetUid = normalizeUserUid(item.uid);
    replyNotificationInquiry = nextItem;
    return nextItem;
  });

  if (!updated) {
    return apiJsonResponse({ error: 'Inquiry not found' }, 404);
  }

  await env.ALERT_STATE.put(
    INQUIRIES_KEY,
    JSON.stringify({
      items: nextItems,
      updatedAt: new Date().toISOString(),
    }),
  );

  if (replyNotificationTargetUid && replyNotificationInquiry) {
    await sendInquiryNotification(
      env,
      replyNotificationTargetUid,
      'reply',
      replyNotificationInquiry,
    );
  }

  return apiJsonResponse({ items: sortInquiries(nextItems).map(publicInquiry) }, 200);
}

async function handlePinInquiry(request, env) {
  if (!env.ALERT_STATE) {
    return apiJsonResponse({ error: 'Inquiry storage is unavailable' }, 503);
  }

  const contentLength = Number(request.headers.get('content-length') || 0);
  if (contentLength > 4096) {
    return apiJsonResponse({ error: 'Request too large' }, 413);
  }

  const body = await request.json();
  const adminUid = normalizeUserUid(body?.adminUid || body?.uid);
  if (!isAdminUid(env, adminUid)) {
    return apiJsonResponse({ error: 'Admin only' }, 403);
  }

  const inquiryId = String(body?.inquiryId || '').trim();
  const pinned = body?.pinned === true;
  if (!inquiryId) {
    return apiJsonResponse({ error: 'Invalid inquiry pin request' }, 400);
  }

  const items = await loadInquiries(env);
  let updated = false;
  const nextItems = items.map((item) => {
    const itemId = String(item.inquiryId || item.createdAt || '');
    if (itemId !== inquiryId) return item;
    updated = true;
    return {
      ...item,
      inquiryId: itemId,
      pinned,
      pinnedAt: pinned ? new Date().toISOString() : '',
    };
  });

  if (!updated) {
    return apiJsonResponse({ error: 'Inquiry not found' }, 404);
  }

  await env.ALERT_STATE.put(
    INQUIRIES_KEY,
    JSON.stringify({
      items: nextItems,
      updatedAt: new Date().toISOString(),
    }),
  );

  return apiJsonResponse({ items: sortInquiries(nextItems).map(publicInquiry) }, 200);
}

async function handleDeleteInquiry(request, env) {
  if (!env.ALERT_STATE) {
    return apiJsonResponse({ error: 'Inquiry storage is unavailable' }, 503);
  }

  const contentLength = Number(request.headers.get('content-length') || 0);
  if (contentLength > 4096) {
    return apiJsonResponse({ error: 'Request too large' }, 413);
  }

  const body = await request.json();
  const adminUid = normalizeUserUid(body?.adminUid || body?.uid);
  if (!isAdminUid(env, adminUid)) {
    return apiJsonResponse({ error: 'Admin only' }, 403);
  }

  const inquiryId = String(body?.inquiryId || '').trim();
  if (!inquiryId) {
    return apiJsonResponse({ error: 'Invalid inquiry delete request' }, 400);
  }

  const items = await loadInquiries(env);
  const nextItems = items.filter((item) => {
    const itemId = String(item.inquiryId || item.createdAt || '');
    return itemId !== inquiryId;
  });

  if (nextItems.length === items.length) {
    return apiJsonResponse({ error: 'Inquiry not found' }, 404);
  }

  await env.ALERT_STATE.put(
    INQUIRIES_KEY,
    JSON.stringify({
      items: nextItems,
      updatedAt: new Date().toISOString(),
    }),
  );

  return apiJsonResponse({ items: sortInquiries(nextItems).map(publicInquiry) }, 200);
}

async function listCloseGuessDates(env) {
  const page = await env.ALERT_STATE.list({
    prefix: CLOSE_GUESS_PREFIX,
    limit: 30,
  });
  return page.keys
    .map((key) => key.name.slice(CLOSE_GUESS_PREFIX.length))
    .filter((date) => /^\d{4}-\d{2}-\d{2}$/.test(date))
    .sort()
    .reverse();
}

const JUMP_DODGE_KEY = 'jump_dodge_leaderboard_v1';
const JUMP_DODGE_MAX = 30;

const NUMBER_GUESS_KEY = 'number_guess_leaderboard_v1';
const NUMBER_GUESS_MAX = 30;

async function handleGetNumberGuessLeaderboard(env) {
  if (!env.ALERT_STATE) return apiJsonResponse({ error: 'Storage unavailable' }, 503);
  const raw = await env.ALERT_STATE.get(NUMBER_GUESS_KEY);
  const entries = raw ? JSON.parse(raw) : [];
  return apiJsonResponse({ entries }, 200);
}

async function handlePostNumberGuessScore(request, env) {
  if (!env.ALERT_STATE) return apiJsonResponse({ error: 'Storage unavailable' }, 503);
  const contentLength = Number(request.headers.get('content-length') || 0);
  if (contentLength > 512) return apiJsonResponse({ error: 'Request too large' }, 413);
  const body = await request.json();
  const uid = String(body?.uid ?? '').slice(0, 64).trim();
  const attempts = Math.floor(Number(body?.attempts));
  const name = String(body?.name ?? '').slice(0, 30).trim();
  if (!uid || !name || isNaN(attempts) || attempts < 1 || attempts > 999) {
    return apiJsonResponse({ error: 'Invalid data' }, 400);
  }
  const raw = await env.ALERT_STATE.get(NUMBER_GUESS_KEY);
  let entries = raw ? JSON.parse(raw) : [];
  const existing = entries.findIndex(e => e.uid === uid);
  if (existing >= 0) {
    // 적은 시도 횟수가 더 좋은 기록
    if (attempts >= entries[existing].attempts) return apiJsonResponse({ entries }, 200);
    entries[existing] = { uid, name, attempts, at: new Date().toISOString() };
  } else {
    entries.push({ uid, name, attempts, at: new Date().toISOString() });
  }
  entries.sort((a, b) => a.attempts - b.attempts);
  entries = entries.slice(0, NUMBER_GUESS_MAX);
  await env.ALERT_STATE.put(NUMBER_GUESS_KEY, JSON.stringify(entries));
  return apiJsonResponse({ entries }, 200);
}

async function handleGetJumpDodgeLeaderboard(env) {
  if (!env.ALERT_STATE) return apiJsonResponse({ error: 'Storage unavailable' }, 503);
  const raw = await env.ALERT_STATE.get(JUMP_DODGE_KEY);
  const entries = raw ? JSON.parse(raw) : [];
  return apiJsonResponse({ entries }, 200);
}

async function handlePostJumpDodgeScore(request, env) {
  if (!env.ALERT_STATE) return apiJsonResponse({ error: 'Storage unavailable' }, 503);
  const contentLength = Number(request.headers.get('content-length') || 0);
  if (contentLength > 512) return apiJsonResponse({ error: 'Request too large' }, 413);
  const body = await request.json();
  const uid = String(body?.uid ?? '').slice(0, 64).trim();
  const score = Math.floor(Number(body?.score));
  if (!uid || isNaN(score) || score < 1 || score > 9999) {
    return apiJsonResponse({ error: 'Invalid score' }, 400);
  }
  const raw = await env.ALERT_STATE.get(JUMP_DODGE_KEY);
  let entries = raw ? JSON.parse(raw) : [];
  // Update or insert this uid's best score
  const existing = entries.findIndex(e => e.uid === uid);
  if (existing >= 0) {
    if (score <= entries[existing].score) return apiJsonResponse({ entries }, 200);
    entries[existing] = { uid, score, at: new Date().toISOString() };
  } else {
    entries.push({ uid, score, at: new Date().toISOString() });
  }
  entries.sort((a, b) => b.score - a.score);
  entries = entries.slice(0, JUMP_DODGE_MAX);
  await env.ALERT_STATE.put(JUMP_DODGE_KEY, JSON.stringify(entries));
  return apiJsonResponse({ entries }, 200);
}

async function handleGetCloseGuessRankings(env, url) {
  if (!env.ALERT_STATE) {
    return apiJsonResponse({ error: 'Ranking storage is unavailable' }, 503);
  }

  const storedDates = await listCloseGuessDates(env);
  const dates = closeGuessVisibleResultDates(storedDates);
  const requestedDate = normalizeCloseGuessDate(url.searchParams.get('date'));
  const date = url.searchParams.has('date')
    ? requestedDate
    : closeGuessDefaultDate(dates);
  const day = await loadCloseGuessDay(env, date);
  return apiJsonResponse(closeGuessDayResponse(day, dates.includes(date) ? dates : [date, ...dates]), 200);
}

async function handlePostCloseGuess(request, env) {
  if (!env.ALERT_STATE) {
    return apiJsonResponse({ error: 'Ranking storage is unavailable' }, 503);
  }

  if (!closeGuessSubmissionWindowOpen()) {
    return apiJsonResponse(
      {
        error: 'Close guess submissions are open from market close through the first 3 hours of the next regular session',
      },
      403,
    );
  }

  const contentLength = Number(request.headers.get('content-length') || 0);
  if (contentLength > 4096) {
    return apiJsonResponse({ error: 'Request too large' }, 413);
  }

  const body = await request.json();
  const date = closeGuessSubmissionDate();
  const messageToken = randomCloseGuessToken();
  const entry = normalizeCloseGuessEntry({
    uid: body?.uid,
    id: body?.id,
    nickname: body?.nickname,
    price: body?.price,
    close: body?.close,
    submittedAt: new Date().toISOString(),
    messageTokenHash: await sha256Hex(messageToken),
  });

  if (!entry) {
    return apiJsonResponse({ error: 'Invalid close guess' }, 400);
  }

  const day = await loadCloseGuessDay(env, date);
  const referenceClose = day.referenceClose || entry.close;
  const previousAttempts = closeGuessAttemptCount(day.entries, entry);
  if (previousAttempts >= CLOSE_GUESS_MAX_ATTEMPTS) {
    return apiJsonResponse(
      {
        error: 'Close guess attempt limit exceeded',
        code: 'close_guess_attempt_limit',
        maxAttempts: CLOSE_GUESS_MAX_ATTEMPTS,
      },
      429,
    );
  }
  const entries = day.entries
    .filter((saved) => !sameCloseGuessUser(saved, entry))
    .concat({
      ...entry,
      close: referenceClose,
      attempts: previousAttempts + 1,
    })
    .slice(-CLOSE_GUESS_MAX_ENTRIES);
  const rankedEntries = sortCloseGuessEntries(entries);
  const nextDay = {
    date,
    entries,
    referenceClose,
    winnerMessage:
      day.winnerMessage &&
      ((day.winnerMessage.uid &&
        day.winnerMessage.uid === rankedEntries[0]?.uid) ||
        (!day.winnerMessage.uid &&
          day.winnerMessage.id === rankedEntries[0]?.id))
        ? day.winnerMessage
        : null,
    updatedAt: new Date().toISOString(),
  };

  await env.ALERT_STATE.put(closeGuessKey(date), JSON.stringify(nextDay));
  const dates = await listCloseGuessDates(env);
  const response = closeGuessDayResponse(nextDay, dates);
  response.winnerMessageToken =
    rankedEntries[0]?.uid === entry.uid ? messageToken : '';
  return apiJsonResponse(response, 200);
}

async function handlePostCloseGuessWinnerMessage(request, env) {
  if (!env.ALERT_STATE) {
    return apiJsonResponse({ error: 'Ranking storage is unavailable' }, 503);
  }

  const contentLength = Number(request.headers.get('content-length') || 0);
  if (contentLength > 4096) {
    return apiJsonResponse({ error: 'Request too large' }, 413);
  }

  const body = await request.json();
  const date = normalizeCloseGuessDate(body?.date);
  const uid = normalizeUserUid(body?.uid);
  const id = normalizeCloseGuessId(body?.id);
  const token = String(body?.token || '');
  const message = String(body?.message || '')
    .trim()
    .slice(0, CLOSE_GUESS_MAX_MESSAGE_LENGTH);
  const day = await loadCloseGuessDay(env, date);
  const winner = sortCloseGuessEntries(day.entries)[0];

  const isWinner = uid ? winner?.uid === uid : winner?.id === id;
  if (!winner || !isWinner) {
    return apiJsonResponse({ error: 'Only the first-place player can write a message' }, 403);
  }

  if (
    !token ||
    !winner.messageTokenHash ||
    !timingSafeSecretEqual(await sha256Hex(token), winner.messageTokenHash)
  ) {
    return apiJsonResponse({ error: 'Winner token is invalid' }, 403);
  }

  const nextDay = {
    date,
    entries: day.entries,
    referenceClose: day.referenceClose || 0,
    winnerMessage: message
      ? {
          uid: winner.uid,
          id,
          message,
          updatedAt: new Date().toISOString(),
        }
      : null,
    updatedAt: new Date().toISOString(),
  };

  await env.ALERT_STATE.put(closeGuessKey(date), JSON.stringify(nextDay));
  const dates = await listCloseGuessDates(env);
  return apiJsonResponse(closeGuessDayResponse(nextDay, dates), 200);
}

function legalPageResponse(title, body) {
  return new Response(
    `<!doctype html><html lang="en"><head><meta charset="utf-8">` +
      `<meta name="viewport" content="width=device-width,initial-scale=1">` +
      `<title>${title}</title><style>body{font-family:system-ui,sans-serif;` +
      `max-width:760px;margin:40px auto;padding:0 20px;line-height:1.65;` +
      `color:#172033}h1,h2{line-height:1.25}small{color:#667085}</style>` +
      `</head><body><h1>${title}</h1>${body}</body></html>`,
    {
      headers: {
        ...securityHeaders,
        'Content-Type': 'text/html; charset=utf-8',
        'Cache-Control': 'public, max-age=3600',
      },
    },
  );
}

function privacyPolicyResponse() {
  return legalPageResponse(
    'QLD Alert Privacy Policy',
    `<small>Effective date: June 4, 2026</small>
    <h2>Data we process</h2>
    <p>QLD Alert processes device notification tokens, app language, purchase
    verification tokens, and limited technical request information needed to
    provide alerts, verify purchases, prevent abuse, and operate the service.</p>
    <h2>Third-party services</h2>
    <p>The app uses Google Play Billing, Firebase Cloud Messaging, Google
    Mobile Ads, Cloudflare, Finnhub, and Yahoo Finance market data. These
    providers may process data under their own privacy policies.</p>
    <h2>Advertising and consent</h2>
    <p>Advertising is requested only after the applicable consent flow.
    Advertising identifiers and related data may be processed by Google Mobile
    Ads according to the choices presented to the user.</p>
    <h2>Retention and deletion</h2>
    <p>Verified paid-alert device registrations are retained while needed to
    deliver the purchased service. Reinstalling the app or replacing a device
    registration replaces the prior registration for that purchase. Users can
    request deletion through the developer contact shown on the Google Play
    listing.</p>
    <h2>Children</h2>
    <p>QLD Alert is not directed to children.</p>
    <h2>Contact</h2>
    <p>Use the developer contact email displayed on the QLD Alert Google Play
    listing for privacy questions or deletion requests.</p>`,
  );
}

function financialDisclaimerResponse() {
  return legalPageResponse(
    'QLD Alert Financial Disclaimer',
    `<small>Effective date: June 4, 2026</small>
    <p>QLD Alert provides general market information, educational material,
    alerts, and examples. It does not provide personalized investment,
    financial, legal, or tax advice.</p>
    <p>QLD and TQQQ are leveraged exchange-traded products and can experience
    substantial losses. Past performance does not guarantee future results.
    Users are solely responsible for investment decisions and should consider
    their objectives, financial situation, and professional advice.</p>
    <p>Market data and alerts can be delayed, incomplete, or unavailable.
    Never rely on the app as the sole basis for a trade.</p>`,
  );
}

async function sha256Hex(value) {
  const digest = await crypto.subtle.digest(
    'SHA-256',
    new TextEncoder().encode(value),
  );
  return [...new Uint8Array(digest)]
    .map((byte) => byte.toString(16).padStart(2, '0'))
    .join('');
}

async function googleServiceAccountAccessToken(env, scope, cacheKey) {
  const cached = await getState(env, cacheKey, null);
  const now = Math.floor(Date.now() / 1000);

  if (cached?.token && cached?.expiresAt > now + 120) {
    return cached.token;
  }

  if (
    !env.FIREBASE_CLIENT_EMAIL ||
    !env.FIREBASE_PRIVATE_KEY
  ) {
    throw new Error('Google service account secrets are missing');
  }

  const firebaseClientEmail = env.FIREBASE_CLIENT_EMAIL.replace(/^﻿/, '');
  const firebasePrivateKey = env.FIREBASE_PRIVATE_KEY.replace(/^﻿/, '');

  const unsignedJwt = `${base64UrlEncode(
    JSON.stringify({ alg: 'RS256', typ: 'JWT' }),
  )}.${base64UrlEncode(
    JSON.stringify({
      iss: firebaseClientEmail,
      scope,
      aud: GOOGLE_OAUTH_TOKEN_URL,
      iat: now,
      exp: now + 3600,
    }),
  )}`;
  const key = await crypto.subtle.importKey(
    'pkcs8',
    pemToArrayBuffer(firebasePrivateKey),
    {
      name: 'RSASSA-PKCS1-v1_5',
      hash: 'SHA-256',
    },
    false,
    ['sign'],
  );
  const signature = await crypto.subtle.sign(
    'RSASSA-PKCS1-v1_5',
    key,
    new TextEncoder().encode(unsignedJwt),
  );
  const jwt = `${unsignedJwt}.${base64UrlEncode(new Uint8Array(signature))}`;
  const response = await fetch(GOOGLE_OAUTH_TOKEN_URL, {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({
      grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
      assertion: jwt,
    }),
  });

  if (!response.ok) {
    throw new Error(`Google OAuth failed (${response.status})`);
  }

  const data = await response.json();
  if (!data.access_token) {
    throw new Error('Google OAuth response missing access_token');
  }

  await putState(env, cacheKey, {
    token: data.access_token,
    expiresAt: now + Number(data.expires_in ?? 3600),
  });
  return data.access_token;
}

async function firebaseAccessToken(env) {
  if (!env.FIREBASE_PROJECT_ID) {
    throw new Error('Firebase service account secrets are missing');
  }
  return googleServiceAccountAccessToken(
    env,
    'https://www.googleapis.com/auth/firebase.messaging',
    'firebaseAccessToken',
  );
}

async function verifyGooglePlayPurchase(env, purchaseToken) {
  const accessToken = await googleServiceAccountAccessToken(
    env,
    GOOGLE_ANDROID_PUBLISHER_SCOPE,
    'androidPublisherAccessToken',
  );
  const url =
    `https://androidpublisher.googleapis.com/androidpublisher/v3/applications/` +
    `${encodeURIComponent(ANDROID_PACKAGE_NAME)}/purchases/products/` +
    `${encodeURIComponent(CORE_ALERT_PRODUCT_ID)}/tokens/` +
    `${encodeURIComponent(purchaseToken)}`;
  const response = await fetch(url, {
    headers: {
      Authorization: `Bearer ${accessToken}`,
      Accept: 'application/json',
    },
  });

  if (!response.ok) {
    throw new Error(`Google Play purchase verification failed (${response.status})`);
  }

  const purchase = await response.json();
  if (purchase.purchaseState !== 0) {
    throw new Error('Google Play purchase is not completed');
  }
  return purchase;
}

async function fetchVoidedPurchases(env, options = {}) {
  const accessToken = await googleServiceAccountAccessToken(
    env,
    GOOGLE_ANDROID_PUBLISHER_SCOPE,
    'androidPublisherAccessToken',
  );
  const startTime =
    options.startTime ??
    Date.now() - VOIDED_PURCHASE_LOOKBACK_MS;
  const url =
    `https://androidpublisher.googleapis.com/androidpublisher/v3/applications/` +
    `${encodeURIComponent(ANDROID_PACKAGE_NAME)}/purchases/voidedpurchases`;
  const purchases = [];
  let pageToken = '';

  do {
    const requestUrl = new URL(url);
    requestUrl.searchParams.set('startTime', String(startTime));
    requestUrl.searchParams.set('endTime', String(Date.now()));
    requestUrl.searchParams.set('type', '0');
    requestUrl.searchParams.set('pageSelection.maxResults', '100');
    if (pageToken) {
      requestUrl.searchParams.set('pageSelection.token', pageToken);
    }

    const response = await fetch(requestUrl.toString(), {
      headers: {
        Authorization: `Bearer ${accessToken}`,
        Accept: 'application/json',
      },
    });

    if (!response.ok) {
      throw new Error(`Google Play voided purchases failed (${response.status})`);
    }

    const data = await response.json();
    purchases.push(...(data.voidedPurchases ?? []));
    pageToken = data.tokenPagination?.nextPageToken || '';
  } while (pageToken);

  return purchases;
}

async function isPurchaseTokenVoided(env, purchaseToken) {
  const voided = await fetchVoidedPurchases(env);
  return voided.some((purchase) => purchase.purchaseToken === purchaseToken);
}

async function removeVoidedPaidDevices(env) {
  const now = Date.now();
  const previousScan = await getState(env, PAID_VOIDED_SCAN_STATE_KEY, null);
  const previousScanTime = Number(previousScan?.completedAt ?? 0);
  const startTime =
    Number.isFinite(previousScanTime) && previousScanTime > 0
      ? Math.max(
          now - VOIDED_PURCHASE_LOOKBACK_MS,
          previousScanTime - VOIDED_PURCHASE_SCAN_OVERLAP_MS,
        )
      : now - VOIDED_PURCHASE_LOOKBACK_MS;
  const voided = await fetchVoidedPurchases(env, { startTime });
  let removed = 0;

  for (const purchase of voided) {
    if (!purchase.purchaseToken) continue;

    const purchaseHash = await sha256Hex(purchase.purchaseToken);
    const purchaseKey = `${PAID_PURCHASE_PREFIX}${purchaseHash}`;
    const deviceHash = await env.ALERT_STATE.get(purchaseKey);
    if (!deviceHash) continue;

    await env.ALERT_STATE.delete(`${PAID_DEVICE_PREFIX}${deviceHash}`);
    await env.ALERT_STATE.delete(purchaseKey);
    removed += 1;
  }

  await putState(env, PAID_VOIDED_SCAN_STATE_KEY, {
    completedAt: now,
    checked: voided.length,
    removed,
  });

  return { checked: voided.length, removed };
}

async function registerPaidDevice(env, purchaseToken, fcmToken, language, uid = '') {
  const purchase = await verifyGooglePlayPurchase(env, purchaseToken);
  if (await isPurchaseTokenVoided(env, purchaseToken)) {
    throw new Error('Google Play purchase has been voided');
  }
  const purchaseHash = await sha256Hex(purchaseToken);
  const deviceHash = await sha256Hex(fcmToken);
  const purchaseKey = `${PAID_PURCHASE_PREFIX}${purchaseHash}`;
  const previousDeviceHash = await env.ALERT_STATE.get(purchaseKey);

  if (previousDeviceHash && previousDeviceHash !== deviceHash) {
    await env.ALERT_STATE.delete(`${PAID_DEVICE_PREFIX}${previousDeviceHash}`);
  }

  await env.ALERT_STATE.put(
    `${PAID_DEVICE_PREFIX}${deviceHash}`,
    JSON.stringify({
      fcmToken,
      uid: normalizeUserUid(uid),
      language: normalizedAlertLanguage(language),
      productId: CORE_ALERT_PRODUCT_ID,
      orderId: purchase.orderId || '',
      purchaseToken,
      purchaseHash,
      verifiedAt: new Date().toISOString(),
    }),
  );
  await env.ALERT_STATE.put(purchaseKey, deviceHash);

  return {
    entitled: true,
    language: normalizedAlertLanguage(language),
  };
}

async function registerUserDevice(env, uid, fcmToken, language) {
  const normalizedUid = normalizeUserUid(uid);
  if (!normalizedUid || !fcmToken) {
    throw new Error('Invalid user device registration');
  }

  const deviceHash = await sha256Hex(fcmToken);
  await env.ALERT_STATE.put(
    `${USER_DEVICE_PREFIX}${normalizedUid}:${deviceHash}`,
    JSON.stringify({
      uid: normalizedUid,
      fcmToken,
      language: normalizedAlertLanguage(language),
      registeredAt: new Date().toISOString(),
    }),
    { expirationTtl: 90 * 24 * 60 * 60 },
  );

  return { registered: true };
}

async function reconcilePaidDevices(env) {
  const cutoff = Date.now() - 24 * 60 * 60 * 1000;
  let cursor;
  let checked = 0;
  let removed = 0;

  do {
    const page = await env.ALERT_STATE.list({
      prefix: PAID_DEVICE_PREFIX,
      cursor,
      limit: 100,
    });

    for (const key of page.keys) {
      if (checked >= 25) return { checked, removed };

      const device = await env.ALERT_STATE.get(key.name, 'json');
      const verifiedAt = Date.parse(device?.verifiedAt || '');
      if (Number.isFinite(verifiedAt) && verifiedAt > cutoff) continue;

      checked += 1;
      try {
        await verifyGooglePlayPurchase(env, device?.purchaseToken || '');
        device.verifiedAt = new Date().toISOString();
        await env.ALERT_STATE.put(key.name, JSON.stringify(device));
      } catch (_) {
        await env.ALERT_STATE.delete(key.name);
        if (device?.purchaseHash) {
          await env.ALERT_STATE.delete(
            `${PAID_PURCHASE_PREFIX}${device.purchaseHash}`,
          );
        }
        removed += 1;
      }
    }

    cursor = page.list_complete ? undefined : page.cursor;
  } while (cursor);

  return { checked, removed };
}

async function sendFcmTopicAlert(env, type, extraData = {}, options = {}) {
  const token = await firebaseAccessToken(env);
  const data = {
    ...localizedAlertPayload(type),
    sentAtMs: String(Date.now()),
    ...Object.fromEntries(
      Object.entries(extraData).map(([key, value]) => [key, String(value)]),
    ),
  };
  const language = normalizedAlertLanguage(options.language);
  const topic = options.topic || alertTopicForLanguage(language);
  const alertTag = [type, data.nyDate, data.price, data.zone, data.symbol]
    .filter(Boolean)
    .join(':');
  if (alertTag) {
    data.alertTag = alertTag;
  }
  const response = await fetch(
    `https://fcm.googleapis.com/v1/projects/${env.FIREBASE_PROJECT_ID.replace(/^﻿/, '')}/messages:send`,
    {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        message: {
          topic,
          data,
          android: {
            collapse_key: alertTag || type,
            priority: 'HIGH',
            ttl: '3600s',
          },
        },
      }),
    },
  );

  if (!response.ok) {
    const body = await response.text();
    throw new Error(`FCM send failed (${response.status}): ${body}`);
  }

  return response.json();
}

async function sendFcmDeviceAlert(env, fcmToken, type, extraData = {}, language = 'en') {
  const token = await firebaseAccessToken(env);
  const data = {
    ...localizedAlertPayload(type),
    sentAtMs: String(Date.now()),
    ...Object.fromEntries(
      Object.entries(extraData).map(([key, value]) => [key, String(value)]),
    ),
  };
  const response = await fetch(
    `https://fcm.googleapis.com/v1/projects/${env.FIREBASE_PROJECT_ID.replace(/^﻿/, '')}/messages:send`,
    {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        message: {
          token: fcmToken,
          data,
          android: {
            collapse_key: type,
            priority: 'HIGH',
            ttl: '3600s',
          },
        },
      }),
    },
  );

  if (!response.ok) {
    const bodyText = await response.text();
    throw new Error(`FCM device send failed (${response.status}): ${bodyText}`);
  }
  return response.json();
}

async function sendPaidDeviceAlerts(env, type, extraData = {}) {
  let cursor;
  let sent = 0;
  let failed = 0;

  do {
    const page = await env.ALERT_STATE.list({
      prefix: PAID_DEVICE_PREFIX,
      cursor,
      limit: 100,
    });

    for (const key of page.keys) {
      const device = await env.ALERT_STATE.get(key.name, 'json');
      if (!device?.fcmToken) continue;

      try {
        await sendFcmDeviceAlert(
          env,
          device.fcmToken,
          type,
          extraData,
          device.language,
        );
        sent += 1;
      } catch (error) {
        failed += 1;
        console.warn(
          JSON.stringify({
            event: 'paid_fcm_send_failed',
            deviceKey: key.name,
            message: error?.message ?? String(error),
          }),
        );
      }
    }

    cursor = page.list_complete ? undefined : page.cursor;
  } while (cursor);

  return { sent, failed };
}

async function sendUserDeviceAlerts(env, uid, type, extraData = {}) {
  const normalizedUid = normalizeUserUid(uid);
  if (!normalizedUid || !env.ALERT_STATE) return { sent: 0, failed: 0 };

  let cursor;
  let sent = 0;
  let failed = 0;

  do {
    const page = await env.ALERT_STATE.list({
      prefix: `${USER_DEVICE_PREFIX}${normalizedUid}:`,
      cursor,
      limit: 50,
    });

    for (const key of page.keys) {
      const device = await env.ALERT_STATE.get(key.name, 'json');
      if (!device?.fcmToken) continue;

      try {
        await sendFcmDeviceAlert(
          env,
          device.fcmToken,
          type,
          extraData,
          device.language,
        );
        sent += 1;
      } catch (error) {
        failed += 1;
        console.warn(
          JSON.stringify({
            event: 'user_fcm_send_failed',
            uid: normalizedUid,
            message: error?.message ?? String(error),
          }),
        );
      }
    }

    cursor = page.list_complete ? undefined : page.cursor;
  } while (cursor);

  return { sent, failed };
}

function sendInquiryNotification(env, uid, kind, inquiry) {
  const isReply = kind === 'reply';
  const type = isReply ? 'inquiryReply' : 'inquiryNew';
  const inquiryId = String(inquiry?.inquiryId || inquiry?.createdAt || '');
  const extraData = isReply
    ? {
        inquiryId,
        title_ko: '\uBB38\uC758 \uB2F5\uBCC0\uC774 \uB4F1\uB85D\uB418\uC5C8\uC2B5\uB2C8\uB2E4',
        body_ko: '\uBB38\uC758\uC0AC\uD56D\uC5D0 \uAD00\uB9AC\uC790 \uB2F5\uBCC0\uC774 \uB4F1\uB85D\uB418\uC5C8\uC2B5\uB2C8\uB2E4.',
        title_en: 'Your inquiry has a reply',
        body_en: 'An admin reply has been added to your inquiry.',
      }
    : {
        inquiryId,
        title_ko: '\uC0C8 \uBB38\uC758\uC0AC\uD56D\uC774 \uB4F1\uB85D\uB418\uC5C8\uC2B5\uB2C8\uB2E4',
        body_ko: '\uC0AC\uC6A9\uC790\uAC00 \uC0C8 \uBB38\uC758\uC0AC\uD56D\uC744 \uB0A8\uACBC\uC2B5\uB2C8\uB2E4.',
        title_en: 'New inquiry received',
        body_en: 'A user has submitted a new inquiry.',
      };

  return sendUserDeviceAlerts(env, uid, type, extraData);
}

async function sendLocalizedFcmTopicAlert(env, type, extraData = {}) {
  const results = [];

  for (const language of ALERT_LANGUAGES) {
    results.push(
      await sendFcmTopicAlert(env, type, extraData, {
        language,
        topic: alertTopicForLanguage(language),
      }),
    );
  }

  return results;
}

function closesFromChartResult(chartResult) {
  const closes = chartResult?.indicators?.quote?.[0]?.close ?? [];

  return closes
    .filter((value) => value != null)
    .map((value) => Number(value))
    .filter((value) => Number.isFinite(value) && value > 0);
}

function closeEntriesFromChartResult(chartResult) {
  const timestamps = chartResult?.timestamp ?? [];
  const closes = chartResult?.indicators?.quote?.[0]?.close ?? [];
  const count = Math.min(timestamps.length, closes.length);
  const entries = [];

  for (let index = 0; index < count; index += 1) {
    const close = Number(closes[index]);
    const timestamp = Number(timestamps[index]);
    if (!Number.isFinite(close) || close <= 0 || !Number.isFinite(timestamp)) {
      continue;
    }

    entries.push({
      date: newYorkTimeParts(new Date(timestamp * 1000)).date,
      close,
    });
  }

  return entries;
}

function latestClosePairFromChartResult(chartResult) {
  const entries = closeEntriesFromChartResult(chartResult);
  if (entries.length < 2) return null;

  const latest = entries[entries.length - 1];
  const previous = entries[entries.length - 2];

  return {
    date: latest.date,
    latest: latest.close,
    previous: previous.close,
  };
}

function isAfterCloseAlertWindow(parts) {
  if (!isUsMarketOpenDay(parts)) return false;

  const closeMinute = marketCloseMinute(parts);
  return (
    closeMinute > 0 &&
    parts.minutes >= closeMinute + 10 &&
    parts.minutes < 24 * 60
  );
}

function isMarketOpenAlertWindow(parts) {
  return (
    isUsMarketOpenDay(parts) &&
    parts.minutes >= 570 &&
    parts.minutes < 600
  );
}

async function evaluateMarketOpenAlert(env, parts) {
  if (!isMarketOpenAlertWindow(parts)) return;

  const lastMarketOpenAlertDate = await getState(
    env,
    'marketOpenAlertDate',
    '',
  );
  if (lastMarketOpenAlertDate === parts.date) return;

  await sendLocalizedFcmTopicAlert(env, 'marketOpen', {
    nyDate: parts.date,
  });
  await putState(env, 'marketOpenAlertDate', parts.date);
}

function qldMoveStateForPercent(percent) {
  if (percent >= 4) return 1;
  if (percent <= -4) return -1;
  return 0;
}

function qldMoveDownThresholdForPercent(percent) {
  if (percent <= -4) return 4;
  return 0;
}

function qldMoveUpThresholdForPercent(percent) {
  if (percent >= 4) return 4;
  return 0;
}

function qldMoveAlertText(percent, direction, threshold) {
  const value = Math.abs(percent).toFixed(1);
  const base =
    direction === 'down'
      ? {
          titleKo: `QLD ${value}% \uD070 \uD558\uB77D`,
          titleEn: `QLD down ${value}%`,
          bodyKo: `QLD\uAC00 \uC804\uC77C \uC885\uAC00 \uB300\uBE44 ${threshold}% \uC774\uC0C1 \uD558\uB77D\uD588\uC2B5\uB2C8\uB2E4. \uB9AC\uC2A4\uD06C\uC640 \uD604\uAE08 \uBE44\uC911\uC744 \uD655\uC778\uD558\uC138\uC694.`,
          bodyEn: `QLD moved down ${value}% from the previous close. Check risk and cash before acting.`,
        }
      : {
          titleKo: `QLD ${value}% \uD070 \uC0C1\uC2B9`,
          titleEn: `QLD up ${value}%`,
          bodyKo: `QLD\uAC00 \uC804\uC77C \uC885\uAC00 \uB300\uBE44 ${threshold}% \uC774\uC0C1 \uC0C1\uC2B9\uD588\uC2B5\uB2C8\uB2E4. \uC624\uB298 \uC6C0\uC9C1\uC784\uC774 \uACC4\uD68D\uC5D0 \uC601\uD5A5\uC744 \uC8FC\uB294\uC9C0 \uD655\uC778\uD558\uC138\uC694.`,
          bodyEn: `QLD moved up ${value}% from the previous close. Check whether today changes your plan.`,
        };

  return {
    title_ko: base.titleKo,
    body_ko: base.bodyKo,
    detail_ko: base.bodyKo,
    title_en: base.titleEn,
    body_en: base.bodyEn,
    detail_en: base.bodyEn,
  };
}
function highestHighFromChartResult(chartResult) {
  const highs = chartResult?.indicators?.quote?.[0]?.high ?? [];
  let highest = 0;

  for (const value of highs) {
    const next = Number(value);
    if (Number.isFinite(next) && next > highest) {
      highest = next;
    }
  }

  return highest;
}

async function fetchDailyChartResult(symbol) {
  const data = await buildChartData(symbol, { dailyOnly: true });
  return data?.chart?.result?.[0] ?? null;
}

async function evaluateHighAndStrategyAlerts(env, parts, qldDailyResult) {
  const entries = closeEntriesFromChartResult(qldDailyResult);
  if (entries.length < 1) return;

  const latestEntry = entries[entries.length - 1];
  if (latestEntry.date !== parts.date) return;

  const close = latestEntry.close;
  const historicalHigh = Math.max(...entries.map((entry) => entry.close));
  const previousHistoricalHigh =
    entries.length > 1
      ? Math.max(...entries.slice(0, -1).map((entry) => entry.close))
      : 0;
  const storedHigh = Number(
    (await getState(env, 'qldCloseHigh', 0)) || (await getState(env, 'qldHigh', 0)),
  );
  const initialHigh = Math.max(storedHigh, historicalHigh, close);

  if (!storedHigh || storedHigh <= 0) {
    await putState(env, 'qldCloseHigh', initialHigh);
    await putState(
      env,
      'dropZoneClose',
      dropZoneForPercent(
        ((close - initialHigh) / initialHigh) * 100,
      ),
    );
    return;
  }

  const referenceHigh = Math.max(storedHigh, previousHistoricalHigh);
  if (previousHistoricalHigh > storedHigh) {
    await putState(env, 'qldCloseHigh', previousHistoricalHigh);
  }

  if (close > referenceHigh) {
    await putState(env, 'qldCloseHigh', close);
    await putState(env, 'dropZoneClose', 0);
    const lastHighAlertDate = await getState(env, 'highAlertDate', '');
    if (lastHighAlertDate === parts.date) return;

    await sendLocalizedFcmTopicAlert(env, 'high', {
      price: close.toFixed(2),
      nyDate: parts.date,
    });
    await putState(env, 'highAlertDate', parts.date);
    return;
  }

  const dropPercent =
    ((close - referenceHigh) / referenceHigh) * 100;
  const nextZone = dropZoneForPercent(dropPercent);
  const savedZone = Number(await getState(env, 'dropZoneClose', nextZone));

  if (nextZone === savedZone) return;

  await putState(env, 'dropZoneClose', nextZone);

  if (nextZone > savedZone) {
    const type = alertTypeForDropZone(nextZone);
    if (!type) return;

    await sendLocalizedFcmTopicAlert(env, type, {
      qldPrice: close.toFixed(2),
      high: referenceHigh.toFixed(2),
      dropPercent: dropPercent.toFixed(2),
      nyDate: parts.date,
    });
    return;
  }

  const recoveryTypes = recoveryAlertTypesForZoneChange(savedZone, nextZone);
  for (const type of recoveryTypes) {
    await sendLocalizedFcmTopicAlert(env, type, {
      qldPrice: close.toFixed(2),
      high: referenceHigh.toFixed(2),
      dropPercent: dropPercent.toFixed(2),
      nyDate: parts.date,
    });
  }
}

async function evaluateQldMoveAlert(env, parts, qldDailyResult) {
  const closePair = latestClosePairFromChartResult(qldDailyResult);
  if (!closePair) return;
  if (closePair.date !== parts.date) return;

  const currentPrice = closePair.latest;
  const previousClose = closePair.previous;
  const percent = ((currentPrice - previousClose) / previousClose) * 100;
  const nextState = qldMoveStateForPercent(percent);
  const initialized = await getState(env, 'qldMoveAlertInitialized', false);

  await putState(env, 'qldMoveCloseState', nextState);

  const direction = nextState > 0 ? 'up' : 'down';
  const threshold =
    direction === 'down'
      ? qldMoveDownThresholdForPercent(percent)
      : qldMoveUpThresholdForPercent(percent);

  const thresholdStateKey = `qldMove${direction}Threshold:${parts.date}`;
  if (!initialized) {
    await putState(env, 'qldMoveAlertInitialized', true);
  }

  if (nextState === 0 || !threshold) return;

  const sentThreshold = Number(await getState(env, thresholdStateKey, 0));
  if (Number.isFinite(sentThreshold) && sentThreshold >= threshold) return;

  const type = direction === 'up' ? 'qldMoveUp4' : 'qldMoveDown4';
  await sendLocalizedFcmTopicAlert(env, type, {
    ...qldMoveAlertText(percent, direction, threshold),
    qldPrice: currentPrice.toFixed(2),
    previousClose: previousClose.toFixed(2),
    movePercent: percent.toFixed(2),
    moveThreshold: String(threshold),
    nyDate: parts.date,
  });
  await putState(env, thresholdStateKey, threshold);
  await putState(env, 'qldMoveAlertKey', `${parts.date}:${direction}:${threshold}`);
  await putState(env, 'qldMoveAlertDate', parts.date);
}

async function evaluateNasdaq200Alert(env, parts) {
  const lastCheckedDate = await getState(env, 'nasdaq200CheckedDate', '');
  if (lastCheckedDate === parts.date) return;

  const result = await fetchDailyChartResult('^NDX');
  const entries = closeEntriesFromChartResult(result);
  if (entries.length < 200) return;

  const latestEntry = entries[entries.length - 1];
  if (latestEntry.date !== parts.date) return;

  const closes = entries.map((entry) => entry.close);
  const latest = closes[closes.length - 1];
  const last200 = closes.slice(-200);
  const ma200 =
    last200.reduce((sum, value) => sum + value, 0) / last200.length;
  const nextState = latest >= ma200 ? 1 : -1;
  const savedState = Number(await getState(env, 'nasdaq200State', 0));

  await putState(env, 'nasdaq200CheckedDate', parts.date);

  if (!savedState) {
    await putState(env, 'nasdaq200State', nextState);
    return;
  }

  if (savedState === nextState) return;

  await putState(env, 'nasdaq200State', nextState);
  await sendLocalizedFcmTopicAlert(
    env,
    nextState < 0 ? 'nasdaq200Breakdown' : 'nasdaq200Breakout',
    {
      latest: latest.toFixed(2),
      ma200: ma200.toFixed(2),
      nyDate: parts.date,
    },
  );
}

async function evaluateFearGreedAlert(env, parts, scheduledTime = Date.now()) {
  const lastCheckedDate = await getState(env, 'fearGreedCheckedDate', '');
  if (lastCheckedDate === parts.date) return;

  const data = await fetchFearGreedData(scheduledTime);
  const nextState = fearGreedAlertStateForScore(data.score);
  const initialized = await getState(env, 'fearGreedAlertInitialized', false);
  const savedState = Number(await getState(env, 'fearGreedState', 0));

  await putState(env, 'fearGreedState', nextState);
  await putState(env, 'lastFearGreed', {
    ...data,
    checkedAt: new Date(scheduledTime).toISOString(),
  });

  if (!initialized) {
    await putState(env, 'fearGreedAlertInitialized', true);
    await putState(env, 'fearGreedCheckedDate', parts.date);
    return;
  }

  if (nextState === 0 || nextState === savedState) {
    await putState(env, 'fearGreedCheckedDate', parts.date);
    return;
  }

  const type =
    nextState < 0 ? 'fearGreedExtremeFear' : 'fearGreedExtremeGreed';
  await sendLocalizedFcmTopicAlert(env, type, {
    score: data.score.toFixed(0),
    rating: data.rating,
    nyDate: parts.date,
  });
  await putState(env, 'fearGreedCheckedDate', parts.date);
}

async function evaluateScheduledAlerts(env, scheduledTime = Date.now()) {
  if (!env.ALERT_STATE) {
    throw new Error('Cloudflare KV binding ALERT_STATE is missing');
  }

  const now = new Date(scheduledTime);
  const parts = newYorkTimeParts(now);

  await evaluateMarketOpenAlert(env, parts);

  if (!isAfterCloseAlertWindow(parts)) return;

  const [qldQuote, tqqqQuote, qldDailyResult] = await Promise.all([
    fetchFinnhubQuote('QLD', env),
    fetchFinnhubQuote('TQQQ', env),
    fetchDailyChartResult('QLD'),
  ]);

  await putState(env, 'lastQuotes', {
    qld: qldQuote,
    tqqq: tqqqQuote,
    checkedAt: now.toISOString(),
  });

  await evaluateHighAndStrategyAlerts(env, parts, qldDailyResult);
  await evaluateQldMoveAlert(env, parts, qldDailyResult);
  await evaluateNasdaq200Alert(env, parts);
  await evaluateFearGreedAlert(env, parts, scheduledTime);
}

export class QuoteStreamShard extends DurableObject {
  async fetch(request) {
    if (request.headers.get('Upgrade')?.toLowerCase() !== 'websocket') {
      return new Response('Expected WebSocket upgrade', { status: 426 });
    }

    if (this.ctx.getWebSockets().length >= MAX_CONNECTIONS_PER_SHARD) {
      return new Response('Stream shard is full', {
        status: 503,
        headers: { ...securityHeaders, 'Retry-After': '30' },
      });
    }

    const pair = new WebSocketPair();
    const [client, server] = Object.values(pair);
    const isFirstConnection = this.ctx.getWebSockets().length === 0;
    this.ctx.acceptWebSocket(server);

    if (isFirstConnection) {
      const source = this.env.QUOTE_STREAM_SOURCE.getByName('quotes-source');
      this.ctx.waitUntil(source.ensureStarted());
    }

    const latest = await this.ctx.storage.get('latestQuotes');
    if (
      latest &&
      Number(latest.timestamp) > Date.now() - QUOTE_STREAM_MAX_SNAPSHOT_AGE_MS
    ) {
      server.send(JSON.stringify(latest));
    } else {
      this.ctx.waitUntil(this.sendFreshSnapshot(server));
    }

    return new Response(null, { status: 101, webSocket: client });
  }

  async sendFreshSnapshot(socket) {
    const [qldResult, tqqqResult, futuresResult] = await Promise.allSettled([
      fetchQuoteResilient('QLD', this.env, () =>
        fetchEquityQuote('QLD', this.env),
      ),
      fetchQuoteResilient('TQQQ', this.env, () =>
        fetchEquityQuote('TQQQ', this.env),
      ),
      fetchQuoteResilient('NQ=F', this.env, () => fetchYahooQuote('NQ=F')),
    ]);
    const qld = qldResult.status === 'fulfilled' ? qldResult.value : null;
    const tqqq = tqqqResult.status === 'fulfilled' ? tqqqResult.value : null;
    const futures =
      futuresResult.status === 'fulfilled' ? futuresResult.value : null;

    if (!qld && !tqqq && !futures) return;

    const payload = {
      type: 'quotes',
      qld,
      tqqq,
      futures,
      timestamp: Date.now(),
    };

    await this.ctx.storage.put('latestQuotes', payload);

    try {
      socket.send(JSON.stringify(payload));
    } catch (_) {
      // The socket may have closed before the initial quote fetch completed.
    }
  }

  async connectionCount() {
    return this.ctx.getWebSockets().length;
  }

  async broadcastQuotes(payload) {
    await this.ctx.storage.put('latestQuotes', payload);
    const message = JSON.stringify(payload);

    for (const socket of this.ctx.getWebSockets()) {
      try {
        socket.send(message);
      } catch (_) {
        try {
          socket.close(1011, 'Quote broadcast failed');
        } catch (_) {
          // The socket is already closed.
        }
      }
    }
  }
}

export class QuoteStreamSource extends DurableObject {
  async ensureStarted() {
    await this.ctx.storage.setAlarm(Date.now() + 1000);
  }

  async alarm() {
    const shards = Array.from({ length: QUOTE_STREAM_SHARDS }, (_, index) =>
      this.env.QUOTE_STREAM_SHARD.getByName(`quotes-${index}`),
    );
    const connectionCounts = await Promise.all(
      shards.map((shard) => shard.connectionCount()),
    );

    if (connectionCounts.every((count) => count === 0)) {
      return;
    }

    const activeShards = shards.filter(
      (_, index) => connectionCounts[index] > 0,
    );

    try {
      const [qldResult, tqqqResult, futuresResult] = await Promise.allSettled([
        fetchQuoteResilient('QLD', this.env, () =>
          fetchEquityQuote('QLD', this.env),
        ),
        fetchQuoteResilient('TQQQ', this.env, () =>
          fetchEquityQuote('TQQQ', this.env),
        ),
        fetchQuoteResilient('NQ=F', this.env, () => fetchYahooQuote('NQ=F')),
      ]);
      const qld = qldResult.status === 'fulfilled' ? qldResult.value : null;
      const tqqq = tqqqResult.status === 'fulfilled' ? tqqqResult.value : null;
      const futures =
        futuresResult.status === 'fulfilled' ? futuresResult.value : null;

      if (!qld && !tqqq && !futures) return;

      const payload = {
        type: 'quotes',
        qld,
        tqqq,
        futures,
        timestamp: Date.now(),
      };

      await Promise.all(
        activeShards.map((shard) => shard.broadcastQuotes(payload)),
      );
    } finally {
      await this.ctx.storage.setAlarm(Date.now() + QUOTE_STREAM_INTERVAL_MS);
    }
  }
}

export default {
  async fetch(request, env, ctx) {
    if (request.method === 'OPTIONS') {
      return new Response(null, {
        headers: { ...corsHeaders, ...securityHeaders },
      });
    }

    const url = new URL(request.url);
    const path = url.pathname.replace(/\/+$/, '') || '/';
    const clientKey = request.headers.get('CF-Connecting-IP') || 'unknown';

    if (path === '/jump-dodge-leaderboard') {
      const { success } = await env.API_RATE_LIMITER.limit({ key: clientKey });
      if (!success) return apiJsonResponse({ error: 'Too many requests' }, 429);
      try {
        if (request.method === 'GET') return handleGetJumpDodgeLeaderboard(env);
        if (request.method === 'POST') return handlePostJumpDodgeScore(request, env);
        return apiJsonResponse({ error: 'Method Not Allowed' }, 405);
      } catch (e) {
        return apiJsonResponse({ error: 'Leaderboard request failed' }, 500);
      }
    }

    if (path === '/number-guess-leaderboard') {
      const { success } = await env.API_RATE_LIMITER.limit({ key: clientKey });
      if (!success) return apiJsonResponse({ error: 'Too many requests' }, 429);
      try {
        if (request.method === 'GET') return handleGetNumberGuessLeaderboard(env);
        if (request.method === 'POST') return handlePostNumberGuessScore(request, env);
        return apiJsonResponse({ error: 'Method Not Allowed' }, 405);
      } catch (e) {
        return apiJsonResponse({ error: 'Leaderboard request failed' }, 500);
      }
    }

    if (
      path === '/close-guess-rankings' ||
      path === '/close-guess' ||
      path === '/close-guess-winner-message' ||
      path === '/inquiries/reply' ||
      path === '/inquiries/message' ||
      path === '/inquiries/pin' ||
      path === '/inquiries/delete' ||
      path === '/inquiries' ||
      path === '/major-us-schedules' ||
      path === '/admin-status' ||
      path === '/debug-fcm'
    ) {
      const { success } = await env.API_RATE_LIMITER.limit({ key: clientKey });
      if (!success) {
        return apiJsonResponse({ error: 'Too many requests' }, 429);
      }

      try {
        if (path === '/close-guess-rankings' && request.method === 'GET') {
          return handleGetCloseGuessRankings(env, url);
        }
        if (path === '/close-guess' && request.method === 'POST') {
          return handlePostCloseGuess(request, env);
        }
        if (
          path === '/close-guess-winner-message' &&
          request.method === 'POST'
        ) {
          return handlePostCloseGuessWinnerMessage(request, env);
        }
        if (path === '/inquiries' && request.method === 'GET') {
          return handleGetInquiries(env);
        }
        if (path === '/inquiries' && request.method === 'POST') {
          return handlePostInquiry(request, env);
        }
        if (path === '/inquiries/reply' && request.method === 'POST') {
          return handlePostInquiryReply(request, env);
        }
        if (path === '/inquiries/message' && request.method === 'POST') {
          return handlePostInquiryMessage(request, env);
        }
        if (path === '/inquiries/pin' && request.method === 'POST') {
          return handlePinInquiry(request, env);
        }
        if (path === '/inquiries/delete' && request.method === 'POST') {
          return handleDeleteInquiry(request, env);
        }
        if (path === '/major-us-schedules' && request.method === 'GET') {
          return handleGetMajorUsSchedules(env);
        }
        if (path === '/major-us-schedules' && request.method === 'POST') {
          return handlePostMajorUsSchedules(request, env);
        }
        if (path === '/admin-status' && request.method === 'GET') {
          return adminStatusResponse(env, url.searchParams.get('uid'));
        }
        if (path === '/debug-fcm' && request.method === 'GET') {
          try {
            const cleanEmail = (env.FIREBASE_CLIENT_EMAIL ?? '').replace(/^﻿/, '');
            const cleanKey = (env.FIREBASE_PRIVATE_KEY ?? '').replace(/^﻿/, '');
            const now = Math.floor(Date.now() / 1000);
            const unsignedJwt = `${base64UrlEncode(JSON.stringify({ alg: 'RS256', typ: 'JWT' }))}.${base64UrlEncode(JSON.stringify({ iss: cleanEmail, scope: 'https://www.googleapis.com/auth/firebase.messaging', aud: 'https://oauth2.googleapis.com/token', iat: now, exp: now + 3600 }))}`;
            const keyData = pemToArrayBuffer(cleanKey);
            const key = await crypto.subtle.importKey('pkcs8', keyData, { name: 'RSASSA-PKCS1-v1_5', hash: 'SHA-256' }, false, ['sign']);
            const sig = await crypto.subtle.sign('RSASSA-PKCS1-v1_5', key, new TextEncoder().encode(unsignedJwt));
            const jwt = `${unsignedJwt}.${base64UrlEncode(new Uint8Array(sig))}`;
            const resp = await fetch('https://oauth2.googleapis.com/token', { method: 'POST', headers: { 'Content-Type': 'application/x-www-form-urlencoded' }, body: new URLSearchParams({ grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer', assertion: jwt }) });
            const body = await resp.json();
            return apiJsonResponse({ ok: resp.ok, status: resp.status, body, email: cleanEmail, projectId: (env.FIREBASE_PROJECT_ID ?? '').replace(/^﻿/, '') }, 200);
          } catch (err) {
            return apiJsonResponse({ ok: false, error: err?.message ?? String(err) }, 200);
          }
        }
        return apiJsonResponse({ error: 'Method Not Allowed' }, 405);
      } catch (error) {
        console.warn(
          JSON.stringify({
            event: 'close_guess_request_failed',
            path,
            message: error?.message ?? String(error),
          }),
        );
        return apiJsonResponse({ error: 'Ranking request failed' }, 500);
      }
    }

    if (path === '/paid-entitlement/register') {
      if (request.method !== 'POST') {
        return apiJsonResponse({ error: 'Method Not Allowed' }, 405);
      }

      const { success } = await env.API_RATE_LIMITER.limit({ key: clientKey });
      if (!success) {
        return apiJsonResponse({ error: 'Too many requests' }, 429);
      }

      const contentLength = Number(request.headers.get('content-length') || 0);
      if (contentLength > 16_384) {
        return apiJsonResponse({ error: 'Request too large' }, 413);
      }

      try {
        const body = await request.json();
        const uid = normalizeUserUid(body?.uid);
        const purchaseToken = String(body?.purchaseToken || '').trim();
        const fcmToken = String(body?.fcmToken || '').trim();
        const language = String(body?.language || 'en');

        if (
          purchaseToken.length < 16 ||
          purchaseToken.length > 4096 ||
          fcmToken.length < 16 ||
          fcmToken.length > 4096
        ) {
          return apiJsonResponse({ error: 'Invalid entitlement request' }, 400);
        }

        const result = await registerPaidDevice(
          env,
          purchaseToken,
          fcmToken,
          language,
          uid,
        );
        if (uid) {
          await registerUserDevice(env, uid, fcmToken, language);
        }
        return apiJsonResponse(result, 200);
      } catch (error) {
        console.warn(
          JSON.stringify({
            event: 'paid_entitlement_registration_failed',
            message: error?.message ?? String(error),
          }),
        );
        return apiJsonResponse(
          { entitled: false, error: 'Purchase verification failed' },
          403,
        );
      }
    }

    if (path === '/device/register') {
      if (request.method !== 'POST') {
        return apiJsonResponse({ error: 'Method Not Allowed' }, 405);
      }

      const { success } = await env.API_RATE_LIMITER.limit({ key: clientKey });
      if (!success) {
        return apiJsonResponse({ error: 'Too many requests' }, 429);
      }

      const contentLength = Number(request.headers.get('content-length') || 0);
      if (contentLength > 8192) {
        return apiJsonResponse({ error: 'Request too large' }, 413);
      }

      try {
        const body = await request.json();
        const uid = normalizeUserUid(body?.uid);
        const fcmToken = String(body?.fcmToken || '').trim();
        const language = String(body?.language || 'en');

        if (!uid || fcmToken.length < 16 || fcmToken.length > 4096) {
          return apiJsonResponse({ error: 'Invalid device registration' }, 400);
        }

        return apiJsonResponse(
          await registerUserDevice(env, uid, fcmToken, language),
          200,
        );
      } catch (error) {
        console.warn(
          JSON.stringify({
            event: 'user_device_registration_failed',
            message: error?.message ?? String(error),
          }),
        );
        return apiJsonResponse({ registered: false }, 500);
      }
    }

    if (request.method !== 'GET') {
      return new Response('Method Not Allowed', {
        status: 405,
        headers: {
          ...corsHeaders,
          ...securityHeaders,
          Allow: 'GET, OPTIONS',
        },
      });
    }

    if (path === '/stream') {
      const { success } = await env.STREAM_RATE_LIMITER.limit({
        key: clientKey,
      });
      if (!success) {
        return new Response('Too Many Requests', {
          status: 429,
          headers: { ...securityHeaders, 'Retry-After': '30' },
        });
      }

      if (request.headers.get('Upgrade')?.toLowerCase() !== 'websocket') {
        return new Response('Expected WebSocket upgrade', {
          status: 426,
          headers: { ...corsHeaders, ...securityHeaders },
        });
      }

      const shardIndex =
        crypto.getRandomValues(new Uint32Array(1))[0] % QUOTE_STREAM_SHARDS;
      return env.QUOTE_STREAM_SHARD.getByName(`quotes-${shardIndex}`).fetch(
        request,
      );
    }

    if (path === '/privacy') {
      return privacyPolicyResponse();
    }

    if (path === '/financial-disclaimer') {
      return financialDisclaimerResponse();
    }

    if (path === '/test-fcm') {
      const { success } = await env.ADMIN_RATE_LIMITER.limit({
        key: clientKey,
      });
      if (!success) {
        return new Response('Too Many Requests', {
          status: 429,
          headers: { ...securityHeaders, 'Retry-After': '30' },
        });
      }

      const providedSecret = request.headers.get('x-test-secret') || '';

      if (
        !env.TEST_SECRET ||
        !timingSafeSecretEqual(providedSecret, env.TEST_SECRET.trim())
      ) {
        return new Response(
          JSON.stringify({
            error: 'Forbidden',
            message: 'TEST_SECRET is required for FCM test sends',
          }),
          {
            status: 403,
            headers: {
              ...corsHeaders,
              ...securityHeaders,
              'Content-Type': 'application/json',
            },
          },
        );
      }

      const testType = url.searchParams.get('type') || 'marketOpen';
      const testLanguage = normalizedAlertLanguage(
        url.searchParams.get('lang') || 'ko',
      );
      const paidOnly =
        url.searchParams.get('paid') === '1' ||
        url.searchParams.get('paidOnly') === '1' ||
        url.searchParams.get('corePaid') === '1';
      const paidLanguageOnly =
        url.searchParams.get('paidLang') === '1' ||
        url.searchParams.get('paidLanguage') === '1';
      const testTopic =
        url.searchParams.get('legacy') === '1'
          ? ALERT_TOPIC
          : alertTopicForLanguage(testLanguage);

      if (!TEST_ALERT_TYPES.has(testType)) {
        return new Response(
          JSON.stringify({
            error: 'Invalid test type',
            allowedTypes: [...TEST_ALERT_TYPES],
          }),
          {
            status: 400,
            headers: {
              ...corsHeaders,
              ...securityHeaders,
              'Content-Type': 'application/json',
            },
          },
        );
      }

      const extraData = {
        test: 'true',
        sentAt: new Date().toISOString(),
        language: testLanguage,
      };
      const title = url.searchParams.get('title') || '';
      const body = url.searchParams.get('body') || '';
      const link = url.searchParams.get('link') || '';

      if (title) {
        extraData.title = title;
        extraData[`title_${testLanguage}`] = title;
      }
      if (body) {
        extraData.body = body;
        extraData.detail = body;
        extraData[`body_${testLanguage}`] = body;
        extraData[`detail_${testLanguage}`] = body;
      }
      if (link) {
        extraData.link = link;
      }

      const result = paidOnly || paidLanguageOnly
        ? await sendPaidDeviceAlerts(env, testType, extraData)
        : await sendFcmTopicAlert(env, testType, extraData, {
            language: testLanguage,
            topic: testTopic,
          });

      return new Response(
        JSON.stringify({
          ok: true,
          target: paidOnly || paidLanguageOnly ? 'verified-paid-devices' : testTopic,
          type: testType,
          language: testLanguage,
          paidOnly,
          paidLanguageOnly,
          fcmName: result?.name ?? '',
          sent: result?.sent,
          failed: result?.failed,
        }),
        {
          headers: {
            ...corsHeaders,
            ...securityHeaders,
            'Content-Type': 'application/json',
          },
        },
      );
    }

    if (!['/', '/app-config', '/fear-greed', '/quote', '/widget'].includes(path)) {
      return jsonResponse({ error: 'Not found' }, 'BYPASS', 404);
    }

    const { success } = await env.API_RATE_LIMITER.limit({
      key: clientKey,
    });
    if (!success) {
      return new Response(JSON.stringify({ error: 'Too many requests' }), {
        status: 429,
        headers: {
          ...corsHeaders,
          ...securityHeaders,
          'Content-Type': 'application/json',
          'Retry-After': '30',
        },
      });
    }

    if (path === '/app-config') {
      const defaultConfig = {
        latestVersionCode: 52,
        forceUpdate: false,
        updateUrl:
          'https://play.google.com/store/apps/details?id=com.qldalert.app',
        announcement: {
          enabled: false,
        },
      };

      let storedConfig = null;
      try {
        storedConfig = await env.ALERT_STATE?.get('app-config', 'json');
      } catch (error) {
        console.warn('Failed to load app-config from KV', error);
      }

      const config =
        storedConfig && typeof storedConfig === 'object'
          ? { ...defaultConfig, ...storedConfig }
          : defaultConfig;
      const storedVersionCode = Number(
        config.latestVersionCode ?? config.androidVersionCode ?? 0,
      );
      config.latestVersionCode = Math.max(
        defaultConfig.latestVersionCode,
        Number.isFinite(storedVersionCode) ? storedVersionCode : 0,
      );

      return jsonResponse(config, 'BYPASS', 200);
    }

    if (path === '/fear-greed') {
      try {
        const { body, cacheStatus } = await getFearGreedData();
        return jsonResponse(body, cacheStatus, 200);
      } catch (error) {
        if (fearGreedCache?.body) {
          return jsonResponse(fearGreedCache.body, 'STALE', 200);
        }

        return jsonResponse(
          {
            error: 'Failed to fetch Fear & Greed data',
            message: error?.message ?? String(error),
          },
          'BYPASS',
          502,
        );
      }
    }

    if (path === '/quote') {
      const quoteSymbol = (url.searchParams.get('symbol') || '').toUpperCase();

      if (!ALLOWED_QUOTE_SYMBOLS.has(quoteSymbol)) {
        return quoteResponse({ error: 'Invalid quote symbol' }, 'BYPASS', 400);
      }

      try {
        const { body, cacheStatus } = await getQuoteData(quoteSymbol, env);
        return quoteResponse(body, cacheStatus, 200);
      } catch (error) {
        const stale = await readLastQuote(quoteSymbol, env);
        if (stale) {
          return quoteResponse(stale, 'STALE', 200);
        }

        return quoteResponse(
          {
            error: 'Failed to fetch quote',
            message: error?.message ?? String(error),
            symbol: quoteSymbol,
          },
          'BYPASS',
          502,
        );
      }
    }

    if (path === '/widget') {
      try {
        const { body, cacheStatus } = await getQldWidgetData(env);
        return jsonResponse(body, cacheStatus, 200);
      } catch (error) {
        if (widgetCache?.body) {
          return jsonResponse(widgetCache.body, 'STALE', 200);
        }

        return jsonResponse(
          {
            error: 'Failed to fetch widget data',
            message: error?.message ?? String(error),
            symbol: 'QLD',
          },
          'BYPASS',
          502,
        );
      }
    }

    const symbol = (url.searchParams.get('symbol') || 'QLD').toUpperCase();

    if (!ALLOWED_SYMBOLS.has(symbol)) {
      return jsonResponse({ error: 'Invalid symbol' }, 'BYPASS', 400);
    }

    try {
      const dailyOnly = url.searchParams.get('dailyOnly') === '1';
      const { body, cacheStatus } = await getChartData(symbol, { dailyOnly });
      const responseSymbol =
        body?.chart?.result?.[0]?.meta?.symbol?.toUpperCase?.() ?? '';

      if (!symbolMatches(responseSymbol, symbol)) {
        throw new Error(
          `Symbol mismatch: requested ${symbol}, got ${responseSymbol}`,
        );
      }

      body.requestedSymbol = symbol;
      return jsonResponse(body, cacheStatus, 200);
    } catch (error) {
      const dailyOnly = url.searchParams.get('dailyOnly') === '1';
      const stale = cache.get(dailyOnly ? `${symbol}:daily` : symbol);
      if (stale?.body) {
        return jsonResponse(stale.body, 'STALE', 200);
      }

      return jsonResponse(
        {
          error: 'Failed to fetch market data',
          message: error?.message ?? String(error),
        },
        'BYPASS',
        502,
      );
    }
  },

  async scheduled(controller, env, ctx) {
    ctx.waitUntil(evaluateScheduledAlerts(env, controller.scheduledTime));
    ctx.waitUntil(reconcilePaidDevices(env));
    ctx.waitUntil(removeVoidedPaidDevices(env));
  },
};
