---
title: "Library | Playwright"
source_url: "https://playwright.dev/docs/library"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * Guides* Library

On this page

## Introduction[​](https://playwright.dev/docs/library.html#introduction "Direct link to Introduction")

Playwright Library provides unified APIs for launching and interacting with browsers, while Playwright Test provides all this plus a fully managed end-to-end Test Runner and experience.

Under most circumstances, for end-to-end testing, you'll want to use `@playwright/test` (Playwright Test), and not `playwright` (Playwright Library) directly. To get started with Playwright Test, follow the [Getting Started Guide](https://playwright.dev/docs/intro.html).

## Differences when using library[​](https://playwright.dev/docs/library.html#differences-when-using-library "Direct link to Differences when using library")

### Library Example[​](https://playwright.dev/docs/library.html#library-example "Direct link to Library Example")

The following is an example of using the Playwright Library directly to launch Chromium, go to a page, and check its title:

* TypeScript* JavaScript

```
import { chromium, devices } from 'playwright';
import assert from 'node:assert';

(async () => {
  // Setup
  const browser = await chromium.launch();
  const context = await browser.newContext(devices['iPhone 11']);
  const page = await context.newPage();

  // The actual interesting bit
  await context.route('**.jpg', route => route.abort());
  await page.goto('https://example.com/');

  assert(await page.title() === 'Example Domain'); // 👎 not a Web First assertion

  // Teardown
  await context.close();
  await browser.close();
})();
```

```
const assert = require('node:assert');
const { chromium, devices } = require('playwright');

(async () => {
  // Setup
  const browser = await chromium.launch();
  const context = await browser.newContext(devices['iPhone 11']);
  const page = await context.newPage();

  // The actual interesting bit
  await context.route('**.jpg', route => route.abort());
  await page.goto('https://example.com/');

  assert(await page.title() === 'Example Domain'); // 👎 not a Web First assertion

  // Teardown
  await context.close();
  await browser.close();
})();
```

Run it with `node my-script.js`.

### Test Example[​](https://playwright.dev/docs/library.html#test-example "Direct link to Test Example")

A test to achieve similar behavior, would look like:

* TypeScript* JavaScript

```
import { expect, test, devices } from '@playwright/test';

test.use(devices['iPhone 11']);

test('should be titled', async ({ page, context }) => {
  await context.route('**.jpg', route => route.abort());
  await page.goto('https://example.com/');

  await expect(page).toHaveTitle('Example');
});
```

```
const { expect, test, devices } = require('@playwright/test');

test.use(devices['iPhone 11']);

test('should be titled', async ({ page, context }) => {
  await context.route('**.jpg', route => route.abort());
  await page.goto('https://example.com/');

  await expect(page).toHaveTitle('Example');
});
```

Run it with `npx playwright test`.

### Key Differences[​](https://playwright.dev/docs/library.html#key-differences "Direct link to Key Differences")

The key differences to note are as follows:

|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Library Test|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | | Installation `npm install playwright` `npm init playwright@latest` - note `install` vs. `init`| Install browsers Install `@playwright/browser-chromium`, `@playwright/browser-firefox` and/or `@playwright/browser-webkit` `npx playwright install` or `npx playwright install chromium` for a single one| `import` from `playwright` `@playwright/test`| Initialization Explicitly need to:  1. Pick a browser to use, e.g. `chromium`- Launch browser with [browserType.launch()](https://playwright.dev/docs/api/class-browsertype.html#browser-type-launch)- Create a context with [browser.newContext()](https://playwright.dev/docs/api/class-browser.html#browser-new-context), *and* pass any context options explicitly, e.g. `devices['iPhone 11']`- Create a page with [browserContext.newPage()](https://playwright.dev/docs/api/class-browsercontext.html#browser-context-new-page)   An isolated `page` and `context` are provided to each test out-of the box, along with other [built-in fixtures](https://playwright.dev/docs/test-fixtures.html#built-in-fixtures). No explicit creation. If referenced by the test in its arguments, the Test Runner will create them for the test. (i.e. lazy-initialization)| Assertions No built-in Web-First Assertions [Web-First assertions](https://playwright.dev/docs/test-assertions.html) like:  * [expect(page).toHaveTitle()](https://playwright.dev/docs/api/class-pageassertions.html#page-assertions-to-have-title)* [expect(page).toHaveScreenshot()](https://playwright.dev/docs/api/class-pageassertions.html#page-assertions-to-have-screenshot-1)  which auto-wait and retry for the condition to be met.| Timeouts Defaults to 30s for most operations. Most operations don't time out, but every test has a timeout that makes it fail (30s by default).|  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | | Cleanup Explicitly need to:  1. Close context with [browserContext.close()](https://playwright.dev/docs/api/class-browsercontext.html#browser-context-close)- Close browser with [browser.close()](https://playwright.dev/docs/api/class-browser.html#browser-close)   No explicit close of [built-in fixtures](https://playwright.dev/docs/test-fixtures.html#built-in-fixtures); the Test Runner will take care of it.| Running When using the Library, you run the code as a node script, possibly with some compilation first. When using the Test Runner, you use the `npx playwright test` command. Along with your [config](https://playwright.dev/docs/test-configuration.html), the Test Runner handles any compilation and choosing what to run and how to run it. | | | | | | | | | | | | | | | | | | | | | | | | | | |

In addition to the above, Playwright Test, as a full-featured Test Runner, includes:

* [Configuration Matrix and Projects](https://playwright.dev/docs/test-configuration.html): In the above example, in the Playwright Library version, if we wanted to run with a different device or browser, we'd have to modify the script and plumb the information through. With Playwright Test, we can just specify the [matrix of configurations](https://playwright.dev/docs/test-configuration.html) in one place, and it will create run the one test under each of these configurations.
* [Parallelization](https://playwright.dev/docs/test-parallel.html)
* [Web-First Assertions](https://playwright.dev/docs/test-assertions.html)
* [Reporting](https://playwright.dev/docs/test-reporters.html)
* [Retries](https://playwright.dev/docs/test-retries.html)
* [Easily Enabled Tracing](https://playwright.dev/docs/trace-viewer-intro.html)
* and more…

## Usage[​](https://playwright.dev/docs/library.html#usage "Direct link to Usage")

Use npm or Yarn to install Playwright library in your Node.js project. See [system requirements](https://playwright.dev/docs/intro.html#system-requirements).

```
npm i -D playwright
```

You will also need to install browsers - either manually or by adding a package that will do it for you automatically.

```
# Download the Chromium, Firefox and WebKit browser
npx playwright install chromium firefox webkit

# Alternatively, add packages that will download a browser upon npm install
npm i -D @playwright/browser-chromium @playwright/browser-firefox @playwright/browser-webkit
```

See [managing browsers](https://playwright.dev/docs/browsers.html#managing-browser-binaries) for more options.

Once installed, you can import Playwright in a Node.js script, and launch any of the 3 browsers (`chromium`, `firefox` and `webkit`).

```
const { chromium } = require('playwright');

(async () => {
  const browser = await chromium.launch();
  // Create pages, interact with UI elements, assert values
  await browser.close();
})();
```

Playwright APIs are asynchronous and return Promise objects. Our code examples use [the async/await pattern](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Async_await) to ease readability. The code is wrapped in an unnamed async arrow function which is invoking itself.

```
(async () => { // Start of async arrow function
  // Function code
  // ...
})(); // End of the function and () to invoke itself
```

## First script[​](https://playwright.dev/docs/library.html#first-script "Direct link to First script")

In our first script, we will navigate to `https://playwright.dev/` and take a screenshot in WebKit.

```
const { webkit } = require('playwright');

(async () => {
  const browser = await webkit.launch();
  const page = await browser.newPage();
  await page.goto('https://playwright.dev/');
  await page.screenshot({ path: `example.png` });
  await browser.close();
})();
```

By default, Playwright runs the browsers in headless mode. To see the browser UI, pass the `headless: false` flag while launching the browser. You can also use `slowMo` to slow down execution. Learn more in the debugging tools [section](https://playwright.dev/docs/debug.html).

```
firefox.launch({ headless: false, slowMo: 50 });
```

## Record scripts[​](https://playwright.dev/docs/library.html#record-scripts "Direct link to Record scripts")

[Command line tools](https://playwright.dev/docs/test-cli.html) can be used to record user interactions and generate JavaScript code.

```
npx playwright codegen wikipedia.org
```

## Browser downloads[​](https://playwright.dev/docs/library.html#browser-downloads "Direct link to Browser downloads")

To download Playwright browsers run:

```
# Explicitly download browsers
npx playwright install
```

Alternatively, you can add `@playwright/browser-chromium`, `@playwright/browser-firefox` and `@playwright/browser-webkit` packages to automatically download the respective browser during the package installation.

```
# Use a helper package that downloads a browser on npm install
npm install @playwright/browser-chromium
```

**Download behind a firewall or a proxy**

Pass `HTTPS_PROXY` environment variable to download through a proxy.

* Bash* PowerShell* Batch

```
# Manual
HTTPS_PROXY=https://192.0.2.1 npx playwright install

# Through @playwright/browser-chromium, @playwright/browser-firefox
# and @playwright/browser-webkit helper packages
HTTPS_PROXY=https://192.0.2.1 npm install
```

```
# Manual
$Env:HTTPS_PROXY=https://192.0.2.1
npx playwright install

# Through @playwright/browser-chromium, @playwright/browser-firefox
# and @playwright/browser-webkit helper packages
$Env:HTTPS_PROXY=https://192.0.2.1
npm install
```

```
# Manual
set HTTPS_PROXY=https://192.0.2.1
npx playwright install

# Through @playwright/browser-chromium, @playwright/browser-firefox
# and @playwright/browser-webkit helper packages
set HTTPS_PROXY=https://192.0.2.1
npm install
```

**Download from artifact repository**

By default, Playwright downloads browsers from Microsoft's CDN. Pass `PLAYWRIGHT_DOWNLOAD_HOST` environment variable to download from an internal artifacts repository instead.

* Bash* PowerShell* Batch

```
# Manual
PLAYWRIGHT_DOWNLOAD_HOST=192.0.2.1 npx playwright install

# Through @playwright/browser-chromium, @playwright/browser-firefox
# and @playwright/browser-webkit helper packages
PLAYWRIGHT_DOWNLOAD_HOST=192.0.2.1 npm install
```

```
# Manual
$Env:PLAYWRIGHT_DOWNLOAD_HOST=192.0.2.1
npx playwright install

# Through @playwright/browser-chromium, @playwright/browser-firefox
# and @playwright/browser-webkit helper packages
$Env:PLAYWRIGHT_DOWNLOAD_HOST=192.0.2.1
npm install
```

```
# Manual
set PLAYWRIGHT_DOWNLOAD_HOST=192.0.2.1
npx playwright install

# Through @playwright/browser-chromium, @playwright/browser-firefox
# and @playwright/browser-webkit helper packages
set PLAYWRIGHT_DOWNLOAD_HOST=192.0.2.1
npm install
```

**Skip browser download**

In certain cases, it is desired to avoid browser downloads altogether because browser binaries are managed separately. This can be done by setting `PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD` variable before installing packages.

* Bash* PowerShell* Batch

```
# When using @playwright/browser-chromium, @playwright/browser-firefox
# and @playwright/browser-webkit helper packages
PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 npm install
```

```
# When using @playwright/browser-chromium, @playwright/browser-firefox
# and @playwright/browser-webkit helper packages
$Env:PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
npm install
```

```
# When using @playwright/browser-chromium, @playwright/browser-firefox
# and @playwright/browser-webkit helper packages
set PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
npm install
```

## TypeScript support[​](https://playwright.dev/docs/library.html#typescript-support "Direct link to TypeScript support")

Playwright includes built-in support for TypeScript. Type definitions will be imported automatically. It is recommended to use type-checking to improve the IDE experience.

### In JavaScript[​](https://playwright.dev/docs/library.html#in-javascript "Direct link to In JavaScript")

Add the following to the top of your JavaScript file to get type-checking in VS Code or WebStorm.

```
// @ts-check
// ...
```

Alternatively, you can use JSDoc to set types for variables.

```
/** @type {import('playwright').Page} */
let page;
```

### In TypeScript[​](https://playwright.dev/docs/library.html#in-typescript "Direct link to In TypeScript")

TypeScript support will work out-of-the-box. Types can also be imported explicitly.

```
let page: import('playwright').Page;
```

[Previous

Web server](https://playwright.dev/docs/test-webserver.html)[Next

Accessibility testing](https://playwright.dev/docs/accessibility-testing.html)

* [Introduction](https://playwright.dev/docs/library.html#introduction)* [Differences when using library](https://playwright.dev/docs/library.html#differences-when-using-library)
    + [Library Example](https://playwright.dev/docs/library.html#library-example)+ [Test Example](https://playwright.dev/docs/library.html#test-example)+ [Key Differences](https://playwright.dev/docs/library.html#key-differences)* [Usage](https://playwright.dev/docs/library.html#usage)* [First script](https://playwright.dev/docs/library.html#first-script)* [Record scripts](https://playwright.dev/docs/library.html#record-scripts)* [Browser downloads](https://playwright.dev/docs/library.html#browser-downloads)* [TypeScript support](https://playwright.dev/docs/library.html#typescript-support)
              + [In JavaScript](https://playwright.dev/docs/library.html#in-javascript)+ [In TypeScript](https://playwright.dev/docs/library.html#in-typescript)
