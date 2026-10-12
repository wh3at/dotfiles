---
title: "ConsoleMessage | Playwright"
source_url: "https://playwright.dev/docs/api/class-consolemessage"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Classes* ConsoleMessage

On this page

[ConsoleMessage](https://playwright.dev/docs/api/class-consolemessage.html "ConsoleMessage") objects are dispatched by page via the [page.on('console')](https://playwright.dev/docs/api/class-page.html#page-event-console) event. For each console message logged in the page there will be corresponding event in the Playwright context.

```
// Listen for all console logs
page.on('console', msg => console.log(msg.text()));

// Listen for all console events and handle errors
page.on('console', msg => {
  if (msg.type() === 'error')
    console.log(`Error text: "${msg.text()}"`);
});

// Get the next console log
const msgPromise = page.waitForEvent('console');
await page.evaluate(() => {
  console.log('hello', 42, { foo: 'bar' });  // Issue console.log inside the page
});
const msg = await msgPromise;

// Deconstruct console log arguments
await msg.args()[0].jsonValue(); // hello
await msg.args()[1].jsonValue(); // 42
```

---

## Methods[​](https://playwright.dev/docs/api/class-consolemessage.html#methods "Direct link to Methods")

### args[​](https://playwright.dev/docs/api/class-consolemessage.html#console-message-args "Direct link to args")

Added before v1.9
consoleMessage.args

List of arguments passed to a `console` function call. See also [page.on('console')](https://playwright.dev/docs/api/class-page.html#page-event-console).

**Usage**

```
consoleMessage.args();
```

**Returns**

* [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array")<[JSHandle](https://playwright.dev/docs/api/class-jshandle.html "JSHandle")>[#](https://playwright.dev/docs/api/class-consolemessage.html#console-message-args-return)

---

### location[​](https://playwright.dev/docs/api/class-consolemessage.html#console-message-location "Direct link to location")

Added before v1.9
consoleMessage.location

**Usage**

```
consoleMessage.location();
```

**Returns**

* [Object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object "Object")[#](https://playwright.dev/docs/api/class-consolemessage.html#console-message-location-return)
  + `url` [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

    URL of the resource.
  + `lineNumber` [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number")

    0-based line number in the resource.
  + `columnNumber` [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number")

    0-based column number in the resource.

---

### page[​](https://playwright.dev/docs/api/class-consolemessage.html#console-message-page "Direct link to page")

Added in: v1.34
consoleMessage.page

The page that produced this console message, if any.

**Usage**

```
consoleMessage.page();
```

**Returns**

* [null](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/null "null") | [Page](https://playwright.dev/docs/api/class-page.html "Page")[#](https://playwright.dev/docs/api/class-consolemessage.html#console-message-page-return)

---

### text[​](https://playwright.dev/docs/api/class-consolemessage.html#console-message-text "Direct link to text")

Added before v1.9
consoleMessage.text

The text of the console message.

**Usage**

```
consoleMessage.text();
```

**Returns**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")[#](https://playwright.dev/docs/api/class-consolemessage.html#console-message-text-return)

---

### type[​](https://playwright.dev/docs/api/class-consolemessage.html#console-message-type "Direct link to type")

Added before v1.9
consoleMessage.type

**Usage**

```
consoleMessage.type();
```

**Returns**

* "log" | "debug" | "info" | "error" | "warning" | "dir" | "dirxml" | "table" | "trace" | "clear" | "startGroup" | "startGroupCollapsed" | "endGroup" | "assert" | "profile" | "profileEnd" | "count" | "timeEnd"[#](https://playwright.dev/docs/api/class-consolemessage.html#console-message-type-return)

---

### worker[​](https://playwright.dev/docs/api/class-consolemessage.html#console-message-worker "Direct link to worker")

Added in: v1.57
consoleMessage.worker

The web worker or service worker that produced this console message, if any. Note that console messages from web workers also have non-null [consoleMessage.page()](https://playwright.dev/docs/api/class-consolemessage.html#console-message-page).

**Usage**

```
consoleMessage.worker();
```

**Returns**

* [null](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/null "null") | [Worker](https://playwright.dev/docs/api/class-worker.html "Worker")[#](https://playwright.dev/docs/api/class-consolemessage.html#console-message-worker-return)

[Previous

Clock](https://playwright.dev/docs/api/class-clock.html)[Next

Coverage](https://playwright.dev/docs/api/class-coverage.html)

* [Methods](https://playwright.dev/docs/api/class-consolemessage.html#methods)
  + [args](https://playwright.dev/docs/api/class-consolemessage.html#console-message-args)+ [location](https://playwright.dev/docs/api/class-consolemessage.html#console-message-location)+ [page](https://playwright.dev/docs/api/class-consolemessage.html#console-message-page)+ [text](https://playwright.dev/docs/api/class-consolemessage.html#console-message-text)+ [type](https://playwright.dev/docs/api/class-consolemessage.html#console-message-type)+ [worker](https://playwright.dev/docs/api/class-consolemessage.html#console-message-worker)
