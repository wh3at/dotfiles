---
title: "Network | Playwright"
source_url: "https://playwright.dev/docs/network"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * Guides* Network

On this page

## Introduction[​](https://playwright.dev/docs/network.html#introduction "Direct link to Introduction")

Playwright provides APIs to **monitor** and **modify** browser network traffic, both HTTP and HTTPS. Any requests that a page does, including [XHRs](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest) and [fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) requests, can be tracked, modified and handled.

## Mock APIs[​](https://playwright.dev/docs/network.html#mock-apis "Direct link to Mock APIs")

Check out our [API mocking guide](https://playwright.dev/docs/mock.html) to learn more on how to

* mock API requests and never hit the API
* perform the API request and modify the response
* use HAR files to mock network requests.

## Network mocking[​](https://playwright.dev/docs/network.html#network-mocking "Direct link to Network mocking")

You don't have to configure anything to mock network requests. Just define a custom [Route](https://playwright.dev/docs/api/class-route.html "Route") that mocks network for a browser context.

example.spec.ts

```
import { test, expect } from '@playwright/test';

test.beforeEach(async ({ context }) => {
  // Block any css requests for each test in this file.
  await context.route(/.css$/, route => route.abort());
});

test('loads page without css', async ({ page }) => {
  await page.goto('https://playwright.dev');
  // ... test goes here
});
```

Alternatively, you can use [page.route()](https://playwright.dev/docs/api/class-page.html#page-route) to mock network in a single page.

example.spec.ts

```
import { test, expect } from '@playwright/test';

test('loads page without images', async ({ page }) => {
  // Block png and jpeg images.
  await page.route(/(png|jpeg)$/, route => route.abort());

  await page.goto('https://playwright.dev');
  // ... test goes here
});
```

## HTTP Authentication[​](https://playwright.dev/docs/network.html#http-authentication "Direct link to HTTP Authentication")

Perform HTTP Authentication.

* Test* Library

playwright.config.ts

```
import { defineConfig } from '@playwright/test';
export default defineConfig({
  use: {
    httpCredentials: {
      username: 'bill',
      password: 'pa55w0rd',
    }
  }
});
```

```
const context = await browser.newContext({
  httpCredentials: {
    username: 'bill',
    password: 'pa55w0rd',
  },
});
const page = await context.newPage();
await page.goto('https://example.com');
```

## HTTP Proxy[​](https://playwright.dev/docs/network.html#http-proxy "Direct link to HTTP Proxy")

You can configure pages to load over the HTTP(S) proxy or SOCKSv5. Proxy can be either set globally for the entire browser, or for each browser context individually.

You can optionally specify username and password for HTTP(S) proxy, you can also specify hosts to bypass the [proxy](https://playwright.dev/docs/api/class-browser.html#browser-new-context-option-proxy) for.

Here is an example of a global proxy:

* Test* Library

playwright.config.ts

```
import { defineConfig } from '@playwright/test';
export default defineConfig({
  use: {
    proxy: {
      server: 'http://myproxy.com:3128',
      username: 'usr',
      password: 'pwd'
    }
  }
});
```

```
const browser = await chromium.launch({
  proxy: {
    server: 'http://myproxy.com:3128',
    username: 'usr',
    password: 'pwd'
  }
});
```

Its also possible to specify it per context:

* Test* Library

example.spec.ts

```
import { test, expect } from '@playwright/test';

test('should use custom proxy on a new context', async ({ browser }) => {
  const context = await browser.newContext({
    proxy: {
      server: 'http://myproxy.com:3128',
    }
  });
  const page = await context.newPage();

  await context.close();
});
```

```
const browser = await chromium.launch();
const context = await browser.newContext({
  proxy: { server: 'http://myproxy.com:3128' }
});
```

## Network events[​](https://playwright.dev/docs/network.html#network-events "Direct link to Network events")

You can monitor all the [Request](https://playwright.dev/docs/api/class-request.html "Request")s and [Response](https://playwright.dev/docs/api/class-response.html "Response")s:

```
// Subscribe to 'request' and 'response' events.
page.on('request', request => console.log('>>', request.method(), request.url()));
page.on('response', response => console.log('<<', response.status(), response.url()));

await page.goto('https://example.com');
```

Or wait for a network response after the button click with [page.waitForResponse()](https://playwright.dev/docs/api/class-page.html#page-wait-for-response):

```
// Use a glob URL pattern. Note no await.
const responsePromise = page.waitForResponse('**/api/fetch_data');
await page.getByText('Update').click();
const response = await responsePromise;
```

#### Variations[​](https://playwright.dev/docs/network.html#variations "Direct link to Variations")

Wait for [Response](https://playwright.dev/docs/api/class-response.html "Response")s with [page.waitForResponse()](https://playwright.dev/docs/api/class-page.html#page-wait-for-response)

```
// Use a RegExp. Note no await.
const responsePromise = page.waitForResponse(/\.jpeg$/);
await page.getByText('Update').click();
const response = await responsePromise;

// Use a predicate taking a Response object. Note no await.
const responsePromise = page.waitForResponse(response => response.url().includes(token));
await page.getByText('Update').click();
const response = await responsePromise;
```

## Handle requests[​](https://playwright.dev/docs/network.html#handle-requests "Direct link to Handle requests")

```
await page.route('**/api/fetch_data', route => route.fulfill({
  status: 200,
  body: testData,
}));
await page.goto('https://example.com');
```

You can mock API endpoints via handling the network requests in your Playwright script.

#### Variations[​](https://playwright.dev/docs/network.html#variations-1 "Direct link to Variations")

Set up route on the entire browser context with [browserContext.route()](https://playwright.dev/docs/api/class-browsercontext.html#browser-context-route) or page with [page.route()](https://playwright.dev/docs/api/class-page.html#page-route). It will apply to popup windows and opened links.

```
await browserContext.route('**/api/login', route => route.fulfill({
  status: 200,
  body: 'accept',
}));
await page.goto('https://example.com');
```

## Modify requests[​](https://playwright.dev/docs/network.html#modify-requests "Direct link to Modify requests")

```
// Delete header
await page.route('**/*', async route => {
  const headers = route.request().headers();
  delete headers['X-Secret'];
  await route.continue({ headers });
});

// Continue requests as POST.
await page.route('**/*', route => route.continue({ method: 'POST' }));
```

You can continue requests with modifications. Example above removes an HTTP header from the outgoing requests.

## Abort requests[​](https://playwright.dev/docs/network.html#abort-requests "Direct link to Abort requests")

You can abort requests using [page.route()](https://playwright.dev/docs/api/class-page.html#page-route) and [route.abort()](https://playwright.dev/docs/api/class-route.html#route-abort).

```
await page.route('**/*.{png,jpg,jpeg}', route => route.abort());

// Abort based on the request type
await page.route('**/*', route => {
  return route.request().resourceType() === 'image' ? route.abort() : route.continue();
});
```

## Modify responses[​](https://playwright.dev/docs/network.html#modify-responses "Direct link to Modify responses")

To modify a response use [APIRequestContext](https://playwright.dev/docs/api/class-apirequestcontext.html "APIRequestContext") to get the original response and then pass the response to [route.fulfill()](https://playwright.dev/docs/api/class-route.html#route-fulfill). You can override individual fields on the response via options:

```
await page.route('**/title.html', async route => {
  // Fetch original response.
  const response = await route.fetch();
  // Add a prefix to the title.
  let body = await response.text();
  body = body.replace('<title>', '<title>My prefix:');
  await route.fulfill({
    // Pass all fields from the response.
    response,
    // Override response body.
    body,
    // Force content type to be html.
    headers: {
      ...response.headers(),
      'content-type': 'text/html'
    }
  });
});
```

## Glob URL patterns[​](https://playwright.dev/docs/network.html#glob-url-patterns "Direct link to Glob URL patterns")

Playwright uses simplified glob patterns for URL matching in network interception methods like [page.route()](https://playwright.dev/docs/api/class-page.html#page-route) or [page.waitForResponse()](https://playwright.dev/docs/api/class-page.html#page-wait-for-response). These patterns support basic wildcards:

1. Asterisks:
   * A single `*` matches any characters except `/`
   * A double `**` matches any characters including `/`
2. Question mark `?` matches only question mark `?`. If you want to match any character, use `*` instead.
3. Curly braces `{}` can be used to match a list of options separated by commas `,`
4. Backslash `\` can be used to escape any of special characters (note to escape backslash itself as `\\`)

Examples:

* `https://example.com/*.js` matches `https://example.com/file.js` but not `https://example.com/path/file.js`
* `https://example.com/?page=1` matches `https://example.com/?page=1` but not `https://example.com`
* `**/*.js` matches both `https://example.com/file.js` and `https://example.com/path/file.js`
* `**/*.{png,jpg,jpeg}` matches all image requests

Important notes:

* The glob pattern must match the entire URL, not just a part of it.
* When using globs for URL matching, consider the full URL structure, including the protocol and path separators.
* For more complex matching requirements, consider using [RegExp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp "RegExp") instead of glob patterns.

## WebSockets[​](https://playwright.dev/docs/network.html#websockets "Direct link to WebSockets")

Playwright supports [WebSockets](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API) inspection, mocking and modifying out of the box. See our [API mocking guide](https://playwright.dev/docs/mock.html#mock-websockets) to learn how to mock WebSockets.

Every time a WebSocket is created, the [page.on('websocket')](https://playwright.dev/docs/api/class-page.html#page-event-web-socket) event is fired. This event contains the [WebSocket](https://playwright.dev/docs/api/class-websocket.html "WebSocket") instance for further web socket frames inspection:

```
page.on('websocket', ws => {
  console.log(`WebSocket opened: ${ws.url()}>`);
  ws.on('framesent', event => console.log(event.payload));
  ws.on('framereceived', event => console.log(event.payload));
  ws.on('close', () => console.log('WebSocket closed'));
});
```

## Missing Network Events and Service Workers[​](https://playwright.dev/docs/network.html#missing-network-events-and-service-workers "Direct link to Missing Network Events and Service Workers")

Playwright's built-in [browserContext.route()](https://playwright.dev/docs/api/class-browsercontext.html#browser-context-route) and [page.route()](https://playwright.dev/docs/api/class-page.html#page-route) allow your tests to natively route requests and perform mocking and interception.

If you're using Playwright's native [browserContext.route()](https://playwright.dev/docs/api/class-browsercontext.html#browser-context-route) and [page.route()](https://playwright.dev/docs/api/class-page.html#page-route), and it appears network events are missing, disable Service Workers by setting [serviceWorkers](https://playwright.dev/docs/api/class-browser.html#browser-new-context-option-service-workers) to `'block'`.

It might be that you are using a mock tool such as Mock Service Worker (MSW). While this tool works out of the box for mocking responses, it adds its own Service Worker that takes over the network requests, hence making them invisible to [browserContext.route()](https://playwright.dev/docs/api/class-browsercontext.html#browser-context-route) and [page.route()](https://playwright.dev/docs/api/class-page.html#page-route). If you are interested in both network testing and mocking, consider using built-in [browserContext.route()](https://playwright.dev/docs/api/class-browsercontext.html#browser-context-route) and [page.route()](https://playwright.dev/docs/api/class-page.html#page-route) for [response mocking](https://playwright.dev/docs/network.html#handle-requests).

######

If you're interested in not solely using Service Workers for testing and network mocking, but in routing and listening for requests made by Service Workers themselves, please see [this guide](https://playwright.dev/docs/service-workers.html).

[Previous

Navigations](https://playwright.dev/docs/navigations.html)[Next

Other locators](https://playwright.dev/docs/other-locators.html)

* [Introduction](https://playwright.dev/docs/network.html#introduction)* [Mock APIs](https://playwright.dev/docs/network.html#mock-apis)* [Network mocking](https://playwright.dev/docs/network.html#network-mocking)* [HTTP Authentication](https://playwright.dev/docs/network.html#http-authentication)* [HTTP Proxy](https://playwright.dev/docs/network.html#http-proxy)* [Network events](https://playwright.dev/docs/network.html#network-events)* [Handle requests](https://playwright.dev/docs/network.html#handle-requests)* [Modify requests](https://playwright.dev/docs/network.html#modify-requests)* [Abort requests](https://playwright.dev/docs/network.html#abort-requests)* [Modify responses](https://playwright.dev/docs/network.html#modify-responses)* [Glob URL patterns](https://playwright.dev/docs/network.html#glob-url-patterns)* [WebSockets](https://playwright.dev/docs/network.html#websockets)* [Missing Network Events and Service Workers](https://playwright.dev/docs/network.html#missing-network-events-and-service-workers)
