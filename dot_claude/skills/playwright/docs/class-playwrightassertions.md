---
title: "PlaywrightAssertions | Playwright"
source_url: "https://playwright.dev/docs/api/class-playwrightassertions"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



On this page

Playwright gives you Web-First Assertions with convenience methods for creating assertions that will wait and retry until the expected condition is met.

Consider the following example:

```
import { test, expect } from '@playwright/test';

test('status becomes submitted', async ({ page }) => {
  // ...
  await page.locator('#submit-button').click();
  await expect(page.locator('.status')).toHaveText('Submitted');
});
```

Playwright will be re-testing the node with the selector `.status` until fetched Node has the `"Submitted"` text. It will be re-fetching the node and checking it over and over, until the condition is met or until the timeout is reached. You can pass this timeout as an option.

By default, the timeout for assertions is set to 5 seconds.

---

## Methods[​](https://playwright.dev/docs/api/class-playwrightassertions.html#methods "Direct link to Methods")

### expect(response)[​](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-api-response "Direct link to expect(response)")

Added in: v1.18
playwrightAssertions.expect(response)

Creates a [APIResponseAssertions](https://playwright.dev/docs/api/class-apiresponseassertions.html "APIResponseAssertions") object for the given [APIResponse](https://playwright.dev/docs/api/class-apiresponse.html "APIResponse").

**Usage**

**Arguments**

* `response` [APIResponse](https://playwright.dev/docs/api/class-apiresponse.html "APIResponse")[#](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-api-response-option-response)

  [APIResponse](https://playwright.dev/docs/api/class-apiresponse.html "APIResponse") object to use for assertions.

**Returns**

* [APIResponseAssertions](https://playwright.dev/docs/api/class-apiresponseassertions.html "APIResponseAssertions")[#](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-api-response-return)

---

### expect(value)[​](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-generic "Direct link to expect(value)")

Added in: v1.9
playwrightAssertions.expect(value)

Creates a [GenericAssertions](https://playwright.dev/docs/api/class-genericassertions.html "GenericAssertions") object for the given value.

**Usage**

```
expect(value);
```

**Arguments**

* `value` [Object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object "Object")[#](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-generic-option-value)

  Value that will be asserted.

**Returns**

* [GenericAssertions](https://playwright.dev/docs/api/class-genericassertions.html "GenericAssertions")[#](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-generic-return)

---

### expect(locator)[​](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-locator "Direct link to expect(locator)")

Added in: v1.18
playwrightAssertions.expect(locator)

Creates a [LocatorAssertions](https://playwright.dev/docs/api/class-locatorassertions.html "LocatorAssertions") object for the given [Locator](https://playwright.dev/docs/api/class-locator.html "Locator").

**Usage**

**Arguments**

* `locator` [Locator](https://playwright.dev/docs/api/class-locator.html "Locator")[#](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-locator-option-locator)

  [Locator](https://playwright.dev/docs/api/class-locator.html "Locator") object to use for assertions.

**Returns**

* [LocatorAssertions](https://playwright.dev/docs/api/class-locatorassertions.html "LocatorAssertions")[#](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-locator-return)

---

### expect(page)[​](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-page "Direct link to expect(page)")

Added in: v1.18
playwrightAssertions.expect(page)

Creates a [PageAssertions](https://playwright.dev/docs/api/class-pageassertions.html "PageAssertions") object for the given [Page](https://playwright.dev/docs/api/class-page.html "Page").

**Usage**

**Arguments**

* `page` [Page](https://playwright.dev/docs/api/class-page.html "Page")[#](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-page-option-page)

  [Page](https://playwright.dev/docs/api/class-page.html "Page") object to use for assertions.

**Returns**

* [PageAssertions](https://playwright.dev/docs/api/class-pageassertions.html "PageAssertions")[#](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-page-return)

* [Methods](https://playwright.dev/docs/api/class-playwrightassertions.html#methods)
  + [expect(response)](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-api-response)+ [expect(value)](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-generic)+ [expect(locator)](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-locator)+ [expect(page)](https://playwright.dev/docs/api/class-playwrightassertions.html#playwright-assertions-expect-page)
