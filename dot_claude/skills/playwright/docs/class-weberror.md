---
title: "WebError | Playwright"
source_url: "https://playwright.dev/docs/api/class-weberror"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Classes* WebError

On this page

[WebError](https://playwright.dev/docs/api/class-weberror.html "WebError") class represents an unhandled exception thrown in the page. It is dispatched via the [browserContext.on('weberror')](https://playwright.dev/docs/api/class-browsercontext.html#browser-context-event-web-error) event.

```
// Log all uncaught errors to the terminal
context.on('weberror', webError => {
  console.log(`Uncaught exception: "${webError.error()}"`);
});

// Navigate to a page with an exception.
await page.goto('data:text/html,<script>throw new Error("Test")</script>');
```

---

## Methods[​](https://playwright.dev/docs/api/class-weberror.html#methods "Direct link to Methods")

### error[​](https://playwright.dev/docs/api/class-weberror.html#web-error-error "Direct link to error")

Added in: v1.38
webError.error

Unhandled error that was thrown.

**Usage**

```
webError.error();
```

**Returns**

* [Error](https://nodejs.org/api/errors.html#errors_class_error "Error")[#](https://playwright.dev/docs/api/class-weberror.html#web-error-error-return)

---

### page[​](https://playwright.dev/docs/api/class-weberror.html#web-error-page "Direct link to page")

Added in: v1.38
webError.page

The page that produced this unhandled exception, if any.

**Usage**

```
webError.page();
```

**Returns**

* [null](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/null "null") | [Page](https://playwright.dev/docs/api/class-page.html "Page")[#](https://playwright.dev/docs/api/class-weberror.html#web-error-page-return)

[Previous

Video](https://playwright.dev/docs/api/class-video.html)[Next

WebSocket](https://playwright.dev/docs/api/class-websocket.html)

* [Methods](https://playwright.dev/docs/api/class-weberror.html#methods)
  + [error](https://playwright.dev/docs/api/class-weberror.html#web-error-error)+ [page](https://playwright.dev/docs/api/class-weberror.html#web-error-page)
