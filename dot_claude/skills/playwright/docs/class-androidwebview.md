---
title: "AndroidWebView | Playwright"
source_url: "https://playwright.dev/docs/api/class-androidwebview"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Experimental* AndroidWebView

On this page

[AndroidWebView](https://playwright.dev/docs/api/class-androidwebview.html "AndroidWebView") represents a WebView open on the [AndroidDevice](https://playwright.dev/docs/api/class-androiddevice.html "AndroidDevice"). WebView is usually obtained using [androidDevice.webView()](https://playwright.dev/docs/api/class-androiddevice.html#android-device-web-view).

---

## Methods[​](https://playwright.dev/docs/api/class-androidwebview.html#methods "Direct link to Methods")

### page[​](https://playwright.dev/docs/api/class-androidwebview.html#android-web-view-page "Direct link to page")

Added in: v1.9
androidWebView.page

Connects to the WebView and returns a regular Playwright [Page](https://playwright.dev/docs/api/class-page.html "Page") to interact with.

**Usage**

```
await androidWebView.page();
```

**Returns**

* [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise "Promise")<[Page](https://playwright.dev/docs/api/class-page.html "Page")>[#](https://playwright.dev/docs/api/class-androidwebview.html#android-web-view-page-return)

---

### pid[​](https://playwright.dev/docs/api/class-androidwebview.html#android-web-view-pid "Direct link to pid")

Added in: v1.9
androidWebView.pid

WebView process PID.

**Usage**

```
androidWebView.pid();
```

**Returns**

* [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number")[#](https://playwright.dev/docs/api/class-androidwebview.html#android-web-view-pid-return)

---

### pkg[​](https://playwright.dev/docs/api/class-androidwebview.html#android-web-view-pkg "Direct link to pkg")

Added in: v1.9
androidWebView.pkg

WebView package identifier.

**Usage**

```
androidWebView.pkg();
```

**Returns**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")[#](https://playwright.dev/docs/api/class-androidwebview.html#android-web-view-pkg-return)

---

## Events[​](https://playwright.dev/docs/api/class-androidwebview.html#events "Direct link to Events")

### on('close')[​](https://playwright.dev/docs/api/class-androidwebview.html#android-web-view-event-close "Direct link to on('close')")

Added in: v1.9
androidWebView.on('close')

Emitted when the WebView is closed.

**Usage**

```
androidWebView.on('close', data => {});
```

[Previous

AndroidSocket](https://playwright.dev/docs/api/class-androidsocket.html)[Next

Electron](https://playwright.dev/docs/api/class-electron.html)

* [Methods](https://playwright.dev/docs/api/class-androidwebview.html#methods)
  + [page](https://playwright.dev/docs/api/class-androidwebview.html#android-web-view-page)+ [pid](https://playwright.dev/docs/api/class-androidwebview.html#android-web-view-pid)+ [pkg](https://playwright.dev/docs/api/class-androidwebview.html#android-web-view-pkg)* [Events](https://playwright.dev/docs/api/class-androidwebview.html#events)
    + [on('close')](https://playwright.dev/docs/api/class-androidwebview.html#android-web-view-event-close)
