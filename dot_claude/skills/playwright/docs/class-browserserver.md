---
title: "BrowserServer | Playwright"
source_url: "https://playwright.dev/docs/api/class-browserserver"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Classes* BrowserServer

On this page

---

## Methods[​](https://playwright.dev/docs/api/class-browserserver.html#methods "Direct link to Methods")

### close[​](https://playwright.dev/docs/api/class-browserserver.html#browser-server-close "Direct link to close")

Added before v1.9
browserServer.close

Closes the browser gracefully and makes sure the process is terminated.

**Usage**

```
await browserServer.close();
```

**Returns**

* [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise "Promise")<[void](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined "void")>[#](https://playwright.dev/docs/api/class-browserserver.html#browser-server-close-return)

---

### kill[​](https://playwright.dev/docs/api/class-browserserver.html#browser-server-kill "Direct link to kill")

Added before v1.9
browserServer.kill

Kills the browser process and waits for the process to exit.

**Usage**

```
await browserServer.kill();
```

**Returns**

* [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise "Promise")<[void](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined "void")>[#](https://playwright.dev/docs/api/class-browserserver.html#browser-server-kill-return)

---

### process[​](https://playwright.dev/docs/api/class-browserserver.html#browser-server-process "Direct link to process")

Added before v1.9
browserServer.process

Spawned browser application process.

**Usage**

```
browserServer.process();
```

**Returns**

* [ChildProcess](https://nodejs.org/api/child_process.html "ChildProcess")[#](https://playwright.dev/docs/api/class-browserserver.html#browser-server-process-return)

---

### wsEndpoint[​](https://playwright.dev/docs/api/class-browserserver.html#browser-server-ws-endpoint "Direct link to wsEndpoint")

Added before v1.9
browserServer.wsEndpoint

Browser websocket url.

Browser websocket endpoint which can be used as an argument to [browserType.connect()](https://playwright.dev/docs/api/class-browsertype.html#browser-type-connect) to establish connection to the browser.

Note that if the listen `host` option in `launchServer` options is not specified, localhost will be output anyway, even if the actual listening address is an unspecified address.

**Usage**

```
browserServer.wsEndpoint();
```

**Returns**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")[#](https://playwright.dev/docs/api/class-browserserver.html#browser-server-ws-endpoint-return)

---

## Events[​](https://playwright.dev/docs/api/class-browserserver.html#events "Direct link to Events")

### on('close')[​](https://playwright.dev/docs/api/class-browserserver.html#browser-server-event-close "Direct link to on('close')")

Added before v1.9
browserServer.on('close')

Emitted when the browser server closes.

**Usage**

```
browserServer.on('close', data => {});
```

[Previous

BrowserContext](https://playwright.dev/docs/api/class-browsercontext.html)[Next

BrowserType](https://playwright.dev/docs/api/class-browsertype.html)

* [Methods](https://playwright.dev/docs/api/class-browserserver.html#methods)
  + [close](https://playwright.dev/docs/api/class-browserserver.html#browser-server-close)+ [kill](https://playwright.dev/docs/api/class-browserserver.html#browser-server-kill)+ [process](https://playwright.dev/docs/api/class-browserserver.html#browser-server-process)+ [wsEndpoint](https://playwright.dev/docs/api/class-browserserver.html#browser-server-ws-endpoint)* [Events](https://playwright.dev/docs/api/class-browserserver.html#events)
    + [on('close')](https://playwright.dev/docs/api/class-browserserver.html#browser-server-event-close)
