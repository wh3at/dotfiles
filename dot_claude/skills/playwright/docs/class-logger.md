---
title: "Logger | Playwright"
source_url: "https://playwright.dev/docs/api/class-logger"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Classes* Logger

On this page

Deprecated

This class is deprecated. The logs pumped through this class are incomplete. Please use tracing instead.

Playwright generates a lot of logs and they are accessible via the pluggable logger sink.

```
const { chromium } = require('playwright');  // Or 'firefox' or 'webkit'.

(async () => {
  const browser = await chromium.launch({
    logger: {
      isEnabled: (name, severity) => name === 'api',
      log: (name, severity, message, args) => console.log(`${name} ${message}`)
    }
  });
  // ...
})();
```

---

## Methods[​](https://playwright.dev/docs/api/class-logger.html#methods "Direct link to Methods")

### isEnabled[​](https://playwright.dev/docs/api/class-logger.html#logger-is-enabled "Direct link to isEnabled")

Added before v1.9
logger.isEnabled

Determines whether sink is interested in the logger with the given name and severity.

**Usage**

```
logger.isEnabled(name, severity);
```

**Arguments**

* `name` [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")[#](https://playwright.dev/docs/api/class-logger.html#logger-is-enabled-option-name)

  logger name
* `severity` "verbose" | "info" | "warning" | "error"[#](https://playwright.dev/docs/api/class-logger.html#logger-is-enabled-option-severity)

**Returns**

* [boolean](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Boolean_type "Boolean")[#](https://playwright.dev/docs/api/class-logger.html#logger-is-enabled-return)

---

### log[​](https://playwright.dev/docs/api/class-logger.html#logger-log "Direct link to log")

Added before v1.9
logger.log

**Usage**

```
logger.log(name, severity, message, args, hints);
```

**Arguments**

* `name` [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")[#](https://playwright.dev/docs/api/class-logger.html#logger-log-option-name)

  logger name
* `severity` "verbose" | "info" | "warning" | "error"[#](https://playwright.dev/docs/api/class-logger.html#logger-log-option-severity)
* `message` [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string") | [Error](https://nodejs.org/api/errors.html#errors_class_error "Error")[#](https://playwright.dev/docs/api/class-logger.html#logger-log-option-message)

  log message format
* `args` [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array")<[Object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object "Object")>[#](https://playwright.dev/docs/api/class-logger.html#logger-log-option-args)

  message arguments
* `hints` [Object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object "Object")[#](https://playwright.dev/docs/api/class-logger.html#logger-log-option-hints)

  + `color` [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string") *(optional)*

    Optional preferred logger color.

  optional formatting hints

[Previous

Locator](https://playwright.dev/docs/api/class-locator.html)[Next

Mouse](https://playwright.dev/docs/api/class-mouse.html)

* [Methods](https://playwright.dev/docs/api/class-logger.html#methods)
  + [isEnabled](https://playwright.dev/docs/api/class-logger.html#logger-is-enabled)+ [log](https://playwright.dev/docs/api/class-logger.html#logger-log)
