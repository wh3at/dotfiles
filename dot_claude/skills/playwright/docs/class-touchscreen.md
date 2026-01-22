---
title: "Touchscreen | Playwright"
source_url: "https://playwright.dev/docs/api/class-touchscreen"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Classes* Touchscreen

On this page

The Touchscreen class operates in main-frame CSS pixels relative to the top-left corner of the viewport. Methods on the touchscreen can only be used in browser contexts that have been initialized with `hasTouch` set to true.

This class is limited to emulating tap gestures. For examples of other gestures simulated by manually dispatching touch events, see the [emulating legacy touch events](https://playwright.dev/docs/touch-events.html) page.

---

## Methods[​](https://playwright.dev/docs/api/class-touchscreen.html#methods "Direct link to Methods")

### tap[​](https://playwright.dev/docs/api/class-touchscreen.html#touchscreen-tap "Direct link to tap")

Added before v1.9
touchscreen.tap

Dispatches a `touchstart` and `touchend` event with a single touch at the position ([x](https://playwright.dev/docs/api/class-touchscreen.html#touchscreen-tap-option-x),[y](https://playwright.dev/docs/api/class-touchscreen.html#touchscreen-tap-option-y)).

note

[page.tap()](https://playwright.dev/docs/api/class-page.html#page-tap) the method will throw if [hasTouch](https://playwright.dev/docs/api/class-browser.html#browser-new-context-option-has-touch) option of the browser context is false.

**Usage**

```
await touchscreen.tap(x, y);
```

**Arguments**

* `x` [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number")[#](https://playwright.dev/docs/api/class-touchscreen.html#touchscreen-tap-option-x)

  X coordinate relative to the main frame's viewport in CSS pixels.
* `y` [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number")[#](https://playwright.dev/docs/api/class-touchscreen.html#touchscreen-tap-option-y)

  Y coordinate relative to the main frame's viewport in CSS pixels.

**Returns**

* [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise "Promise")<[void](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined "void")>[#](https://playwright.dev/docs/api/class-touchscreen.html#touchscreen-tap-return)

[Previous

TimeoutError](https://playwright.dev/docs/api/class-timeouterror.html)[Next

Tracing](https://playwright.dev/docs/api/class-tracing.html)

* [Methods](https://playwright.dev/docs/api/class-touchscreen.html#methods)
  + [tap](https://playwright.dev/docs/api/class-touchscreen.html#touchscreen-tap)
