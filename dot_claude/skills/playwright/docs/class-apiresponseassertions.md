---
title: "APIResponseAssertions | Playwright"
source_url: "https://playwright.dev/docs/api/class-apiresponseassertions"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Assertions* APIResponseAssertions

On this page

The [APIResponseAssertions](https://playwright.dev/docs/api/class-apiresponseassertions.html "APIResponseAssertions") class provides assertion methods that can be used to make assertions about the [APIResponse](https://playwright.dev/docs/api/class-apiresponse.html "APIResponse") in the tests.

```
import { test, expect } from '@playwright/test';

test('navigates to login', async ({ page }) => {
  // ...
  const response = await page.request.get('https://playwright.dev');
  await expect(response).toBeOK();
});
```

---

## Methods[​](https://playwright.dev/docs/api/class-apiresponseassertions.html#methods "Direct link to Methods")

### toBeOK[​](https://playwright.dev/docs/api/class-apiresponseassertions.html#api-response-assertions-to-be-ok "Direct link to toBeOK")

Added in: v1.18
apiResponseAssertions.toBeOK

Ensures the response status code is within `200..299` range.

**Usage**

```
await expect(response).toBeOK();
```

**Returns**

* [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise "Promise")<[void](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined "void")>[#](https://playwright.dev/docs/api/class-apiresponseassertions.html#api-response-assertions-to-be-ok-return)

---

## Properties[​](https://playwright.dev/docs/api/class-apiresponseassertions.html#properties "Direct link to Properties")

### not[​](https://playwright.dev/docs/api/class-apiresponseassertions.html#api-response-assertions-not "Direct link to not")

Added in: v1.20
apiResponseAssertions.not

Makes the assertion check for the opposite condition. For example, this code tests that the response status is not successful:

```
await expect(response).not.toBeOK();
```

**Usage**

```
expect(response).not
```

**Type**

* [APIResponseAssertions](https://playwright.dev/docs/api/class-apiresponseassertions.html "APIResponseAssertions")

[Previous

Worker](https://playwright.dev/docs/api/class-worker.html)[Next

GenericAssertions](https://playwright.dev/docs/api/class-genericassertions.html)

* [Methods](https://playwright.dev/docs/api/class-apiresponseassertions.html#methods)
  + [toBeOK](https://playwright.dev/docs/api/class-apiresponseassertions.html#api-response-assertions-to-be-ok)* [Properties](https://playwright.dev/docs/api/class-apiresponseassertions.html#properties)
    + [not](https://playwright.dev/docs/api/class-apiresponseassertions.html#api-response-assertions-not)
