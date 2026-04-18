---
title: "TestError | Playwright"
source_url: "https://playwright.dev/docs/api/class-testerror"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Test Reporter* TestError

On this page

Information about an error thrown during test execution.

---

## Properties[​](https://playwright.dev/docs/api/class-testerror.html#properties "Direct link to Properties")

### cause[​](https://playwright.dev/docs/api/class-testerror.html#test-error-cause "Direct link to cause")

Added in: v1.49
testError.cause

Error cause. Set when there is a [cause](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/cause) for the error. Will be `undefined` if there is no cause or if the cause is not an instance of [Error](https://nodejs.org/api/errors.html#errors_class_error "Error").

**Usage**

```
testError.cause
```

**Type**

* [TestError](https://playwright.dev/docs/api/class-testerror.html "TestError")

---

### location[​](https://playwright.dev/docs/api/class-testerror.html#test-error-location "Direct link to location")

Added in: v1.30
testError.location

Error location in the source code.

**Usage**

```
testError.location
```

**Type**

* [Location](https://playwright.dev/docs/api/class-location.html "Location")

---

### message[​](https://playwright.dev/docs/api/class-testerror.html#test-error-message "Direct link to message")

Added in: v1.10
testError.message

Error message. Set when [Error](https://nodejs.org/api/errors.html#errors_class_error "Error") (or its subclass) has been thrown.

**Usage**

```
testError.message
```

**Type**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

---

### snippet[​](https://playwright.dev/docs/api/class-testerror.html#test-error-snippet "Direct link to snippet")

Added in: v1.33
testError.snippet

Source code snippet with highlighted error.

**Usage**

```
testError.snippet
```

**Type**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

---

### stack[​](https://playwright.dev/docs/api/class-testerror.html#test-error-stack "Direct link to stack")

Added in: v1.10
testError.stack

Error stack. Set when [Error](https://nodejs.org/api/errors.html#errors_class_error "Error") (or its subclass) has been thrown.

**Usage**

```
testError.stack
```

**Type**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

---

### value[​](https://playwright.dev/docs/api/class-testerror.html#test-error-value "Direct link to value")

Added in: v1.10
testError.value

The value that was thrown. Set when anything except the [Error](https://nodejs.org/api/errors.html#errors_class_error "Error") (or its subclass) has been thrown.

**Usage**

```
testError.value
```

**Type**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

[Previous

TestCase](https://playwright.dev/docs/api/class-testcase.html)[Next

TestResult](https://playwright.dev/docs/api/class-testresult.html)

* [Properties](https://playwright.dev/docs/api/class-testerror.html#properties)
  + [cause](https://playwright.dev/docs/api/class-testerror.html#test-error-cause)+ [location](https://playwright.dev/docs/api/class-testerror.html#test-error-location)+ [message](https://playwright.dev/docs/api/class-testerror.html#test-error-message)+ [snippet](https://playwright.dev/docs/api/class-testerror.html#test-error-snippet)+ [stack](https://playwright.dev/docs/api/class-testerror.html#test-error-stack)+ [value](https://playwright.dev/docs/api/class-testerror.html#test-error-value)
