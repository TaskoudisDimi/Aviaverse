import { chromium } from 'playwright';
const BASE = 'http://localhost:3000';
const browser = await chromium.launch();
const page = await browser.newPage({ viewport: { width: 1400, height: 900 } });

await page.goto(`${BASE}/auth/login`, { waitUntil: 'networkidle' });
await page.fill('input[type="email"]', 'navpreview_1793216249192@example.com');
await page.fill('input[type="password"]', 'TestPass123!');
await page.click('button[type="submit"]');
await page.waitForTimeout(1200);

const routes = [
  ['/modules/1', 'sweep_module.png'],
  ['/ai', 'sweep_ai.png'],
  ['/about', 'sweep_about.png'],
  ['/literature', 'sweep_literature.png'],
  ['/sessions', 'sweep_sessions.png'],
  ['/admin', 'sweep_admin.png'],
];
for (const [path, file] of routes) {
  await page.goto(`${BASE}${path}`, { waitUntil: 'networkidle' }).catch(() => {});
  await page.waitForTimeout(600);
  await page.screenshot({ path: file });
}
await browser.close();
