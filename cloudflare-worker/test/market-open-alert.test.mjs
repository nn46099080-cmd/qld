import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import vm from 'node:vm';

const source = readFileSync(new URL('../src/index.js', import.meta.url), 'utf8');
const helpersStart = source.indexOf('function nthWeekdayOfMonth');
const helpersEnd = source.indexOf('function closeGuessWinnerMessageExpired');
const windowStart = source.indexOf('function isMarketOpenAlertWindow');
const windowEnd = source.indexOf('async function evaluateMarketOpenAlert');

assert.notEqual(helpersStart, -1);
assert.notEqual(helpersEnd, -1);
assert.notEqual(windowStart, -1);
assert.notEqual(windowEnd, -1);

const sandbox = {};
vm.createContext(sandbox);
vm.runInContext(
  `const MARKET_CALENDAR_START_YEAR = 2026;
   const MARKET_CALENDAR_END_YEAR = 2030;
   const marketCalendarCache = new Map();
   ${source.slice(helpersStart, helpersEnd)}
   ${source.slice(windowStart, windowEnd)}
   globalThis.newYorkTimeParts = newYorkTimeParts;
   globalThis.isUsMarketOpenDay = isUsMarketOpenDay;
   globalThis.isMarketOpenAlertWindow = isMarketOpenAlertWindow;`,
  sandbox,
);

const tonightOpen = sandbox.newYorkTimeParts(new Date('2026-06-22T13:30:00.000Z'));
assert.equal(tonightOpen.date, '2026-06-22');
assert.equal(tonightOpen.minutes, 570);
assert.equal(tonightOpen.weekday, 1);
assert.equal(sandbox.isUsMarketOpenDay(tonightOpen), true);
assert.equal(sandbox.isMarketOpenAlertWindow(tonightOpen), true);

const tonightOpenWindowEnd = sandbox.newYorkTimeParts(
  new Date('2026-06-22T13:59:59.000Z'),
);
assert.equal(sandbox.isMarketOpenAlertWindow(tonightOpenWindowEnd), true);

const afterTonightOpenWindow = sandbox.newYorkTimeParts(
  new Date('2026-06-22T14:00:00.000Z'),
);
assert.equal(sandbox.isMarketOpenAlertWindow(afterTonightOpenWindow), false);

const juneteenthHoliday = sandbox.newYorkTimeParts(new Date('2026-06-19T13:30:00.000Z'));
assert.equal(juneteenthHoliday.date, '2026-06-19');
assert.equal(sandbox.isUsMarketOpenDay(juneteenthHoliday), false);
assert.equal(sandbox.isMarketOpenAlertWindow(juneteenthHoliday), false);
