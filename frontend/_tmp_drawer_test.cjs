const { chromium } = require('playwright');
(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage({ viewport: { width: 375, height: 812 } });
  const email = `drawertest+${Date.now()}@example.com`;
  await page.goto('http://localhost:3000/auth/register', { waitUntil: 'load' });
  const fields = await page.locator('input').all();
  for (const f of fields) {
    const type = await f.getAttribute('type');
    if (type === 'email') await f.fill(email);
    else if (type === 'password') await f.fill('TestPass123!');
    else await f.fill('Drawer Tester');
  }
  await page.locator('select').selectOption('B2');
  await page.getByRole('button', { name: /create/i }).click();
  await page.waitForURL('**/', { timeout: 10000 });
  await page.waitForTimeout(500);
  await page.locator('button:has(svg)').first().click();
  await page.waitForTimeout(400);
  await page.screenshot({ path: '/private/tmp/claude-501/-Users-dimitristaskoudis-repos-Vyron/1aff9590-ac47-4466-809c-35ab3112ac37/scratchpad/mobile_drawer.png' });
  await browser.close();
})();
