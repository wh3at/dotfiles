---
title: "TimeoutError | Playwright"
source_url: "https://playwright.dev/docs/api/class-timeouterror"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Classes* TimeoutError

* extends: [Error](https://nodejs.org/api/errors.html#errors_class_error "Error")

TimeoutError is emitted whenever certain operations are terminated due to timeout, e.g. [locator.waitFor()](https://playwright.dev/docs/api/class-locator.html#locator-wait-for) or [browserType.launch()](https://playwright.dev/docs/api/class-browsertype.html#browser-type-launch).

```
const playwright = require('playwright');

(async () => {
  const browser = await playwright.chromium.launch();
  const context = await browser.newContext();
  const page = await context.newPage();
  try {
    await page.locator('text=Foo').click({
      timeout: 100,
    });
  } catch (error) {
    if (error instanceof playwright.errors.TimeoutError)
      console.log('Timeout!');
  }
  await browser.close();
})();
```

[Previous

Selectors](https://playwright.dev/docs/api/class-selectors.html)[Next

Touchscreen](https://playwright.dev/docs/api/class-touchscreen.html)
