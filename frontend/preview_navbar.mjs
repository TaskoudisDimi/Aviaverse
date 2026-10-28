import { chromium } from 'playwright';

const BASE = 'http://localhost:3000';
const email = `navpreview_${Date.now()}@example.com`;
const password = 'TestPass123!';

const browser = await chromium.launch();
const page = await browser.newPage({ viewport: { width: 1400, height: 900 } });

await page.goto(`${BASE}/auth/register`, { waitUntil: 'networkidle' });
await page.fill('input[type="text"]', 'Nav Preview');
await page.fill('input[type="email"]', email);
await page.fill('input[type="password"]', password);
await page.selectOption('select', 'B1.1');
await page.click('button[type="submit"]');
await page.waitForTimeout(1500);

await page.goto(`${BASE}/dashboard`, { waitUntil: 'networkidle' }).catch(() => {});
await page.waitForTimeout(500);
await page.screenshot({ path: 'nav_dashboard.png', fullPage: true });

// Open the user menu dropdown
await page.click('button:has-text("Nav Preview")').catch(() => {});
await page.waitForTimeout(300);
await page.screenshot({ path: 'nav_dropdown.png' });

// Mobile view
await page.setViewportSize({ width: 390, height: 844 });
await page.goto(`${BASE}/dashboard`, { waitUntil: 'networkidle' });
await page.waitForTimeout(400);
await page.click('button svg').catch(() => {});
await page.waitForTimeout(300);
await page.screenshot({ path: 'nav_mobile_drawer.png' });

console.log('email for cleanup:', email);
await browser.close();
