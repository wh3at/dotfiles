---
title: "Screenshots | Playwright"
source_url: "https://playwright.dev/docs/screenshots"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * Guides* Screenshots

On this page

## Introduction[​](https://playwright.dev/docs/screenshots.html#introduction "Direct link to Introduction")

Here is a quick way to capture a screenshot and save it into a file:

```
await page.screenshot({ path: 'screenshot.png' });
```

[Screenshots API](https://playwright.dev/docs/api/class-page.html#page-screenshot) accepts many parameters for image format, clip area, quality, etc. Make sure to check them out.

## Full page screenshots[​](https://playwright.dev/docs/screenshots.html#full-page-screenshots "Direct link to Full page screenshots")

Full page screenshot is a screenshot of a full scrollable page, as if you had a very tall screen and the page could fit it entirely.

```
await page.screenshot({ path: 'screenshot.png', fullPage: true });
```

## Capture into buffer[​](https://playwright.dev/docs/screenshots.html#capture-into-buffer "Direct link to Capture into buffer")

Rather than writing into a file, you can get a buffer with the image and post-process it or pass it to a third party pixel diff facility.

```
const buffer = await page.screenshot();
console.log(buffer.toString('base64'));
```

## Element screenshot[​](https://playwright.dev/docs/screenshots.html#element-screenshot "Direct link to Element screenshot")

Sometimes it is useful to take a screenshot of a single element.

```
await page.locator('.header').screenshot({ path: 'screenshot.png' });
```

[Previous

Page object models](https://playwright.dev/docs/pom.html)[Next

Service Workers](https://playwright.dev/docs/service-workers.html)

* [Introduction](https://playwright.dev/docs/screenshots.html#introduction)* [Full page screenshots](https://playwright.dev/docs/screenshots.html#full-page-screenshots)* [Capture into buffer](https://playwright.dev/docs/screenshots.html#capture-into-buffer)* [Element screenshot](https://playwright.dev/docs/screenshots.html#element-screenshot)
