---
title: "TestCase | Playwright"
source_url: "https://playwright.dev/docs/api/class-testcase"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Test Reporter* TestCase

On this page

`TestCase` corresponds to every [test()](https://playwright.dev/docs/api/class-test.html#test-call) call in a test file. When a single [test()](https://playwright.dev/docs/api/class-test.html#test-call) is running in multiple projects or repeated multiple times, it will have multiple `TestCase` objects in corresponding projects' suites.

---

## Methods[​](https://playwright.dev/docs/api/class-testcase.html#methods "Direct link to Methods")

### ok[​](https://playwright.dev/docs/api/class-testcase.html#test-case-ok "Direct link to ok")

Added in: v1.10
testCase.ok

Whether the test is considered running fine. Non-ok tests fail the test run with non-zero exit code.

**Usage**

```
testCase.ok();
```

**Returns**

* [boolean](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Boolean_type "Boolean")[#](https://playwright.dev/docs/api/class-testcase.html#test-case-ok-return)

---

### outcome[​](https://playwright.dev/docs/api/class-testcase.html#test-case-outcome "Direct link to outcome")

Added in: v1.10
testCase.outcome

Testing outcome for this test. Note that outcome is not the same as [testResult.status](https://playwright.dev/docs/api/class-testresult.html#test-result-status):

* Test that is expected to fail and actually fails is `'expected'`.
* Test that passes on a second retry is `'flaky'`.

**Usage**

```
testCase.outcome();
```

**Returns**

* "skipped" | "expected" | "unexpected" | "flaky"[#](https://playwright.dev/docs/api/class-testcase.html#test-case-outcome-return)

---

### titlePath[​](https://playwright.dev/docs/api/class-testcase.html#test-case-title-path "Direct link to titlePath")

Added in: v1.10
testCase.titlePath

Returns a list of titles from the root down to this test.

**Usage**

```
testCase.titlePath();
```

**Returns**

* [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array")<[string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")>[#](https://playwright.dev/docs/api/class-testcase.html#test-case-title-path-return)

---

## Properties[​](https://playwright.dev/docs/api/class-testcase.html#properties "Direct link to Properties")

### annotations[​](https://playwright.dev/docs/api/class-testcase.html#test-case-annotations "Direct link to annotations")

Added in: v1.10
testCase.annotations

[testResult.annotations](https://playwright.dev/docs/api/class-testresult.html#test-result-annotations) of the last test run.

**Usage**

```
testCase.annotations
```

**Type**

* [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array")<[Object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object "Object")>
  + `type` [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

    Annotation type, for example `'skip'` or `'fail'`.
  + `description` [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string") *(optional)*

    Optional description.
  + `location` [Location](https://playwright.dev/docs/api/class-location.html "Location") *(optional)*

    Optional location in the source where the annotation is added.

---

### expectedStatus[​](https://playwright.dev/docs/api/class-testcase.html#test-case-expected-status "Direct link to expectedStatus")

Added in: v1.10
testCase.expectedStatus

Expected test status.

* Tests marked as [test.skip()](https://playwright.dev/docs/api/class-test.html#test-skip) or [test.fixme()](https://playwright.dev/docs/api/class-test.html#test-fixme) are expected to be `'skipped'`.
* Tests marked as [test.fail()](https://playwright.dev/docs/api/class-test.html#test-fail) are expected to be `'failed'`.
* Other tests are expected to be `'passed'`.

See also [testResult.status](https://playwright.dev/docs/api/class-testresult.html#test-result-status) for the actual status.

**Usage**

```
testCase.expectedStatus
```

**Type**

* "passed" | "failed" | "timedOut" | "skipped" | "interrupted"

---

### id[​](https://playwright.dev/docs/api/class-testcase.html#test-case-id "Direct link to id")

Added in: v1.25
testCase.id

A test ID that is computed based on the test file name, test title and project name. The ID is unique within Playwright session.

**Usage**

```
testCase.id
```

**Type**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

---

### location[​](https://playwright.dev/docs/api/class-testcase.html#test-case-location "Direct link to location")

Added in: v1.10
testCase.location

Location in the source where the test is defined.

**Usage**

```
testCase.location
```

**Type**

* [Location](https://playwright.dev/docs/api/class-location.html "Location")

---

### parent[​](https://playwright.dev/docs/api/class-testcase.html#test-case-parent "Direct link to parent")

Added in: v1.10
testCase.parent

Suite this test case belongs to.

**Usage**

```
testCase.parent
```

**Type**

* [Suite](https://playwright.dev/docs/api/class-suite.html "Suite")

---

### repeatEachIndex[​](https://playwright.dev/docs/api/class-testcase.html#test-case-repeat-each-index "Direct link to repeatEachIndex")

Added in: v1.10
testCase.repeatEachIndex

Contains the repeat index when running in "repeat each" mode. This mode is enabled by passing `--repeat-each` to the [command line](https://playwright.dev/docs/test-cli.html).

**Usage**

```
testCase.repeatEachIndex
```

**Type**

* [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number")

---

### results[​](https://playwright.dev/docs/api/class-testcase.html#test-case-results "Direct link to results")

Added in: v1.10
testCase.results

Results for each run of this test.

**Usage**

```
testCase.results
```

**Type**

* [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array")<[TestResult](https://playwright.dev/docs/api/class-testresult.html "TestResult")>

---

### retries[​](https://playwright.dev/docs/api/class-testcase.html#test-case-retries "Direct link to retries")

Added in: v1.10
testCase.retries

The maximum number of retries given to this test in the configuration.

Learn more about [test retries](https://playwright.dev/docs/test-retries.html#retries).

**Usage**

```
testCase.retries
```

**Type**

* [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number")

---

### tags[​](https://playwright.dev/docs/api/class-testcase.html#test-case-tags "Direct link to tags")

Added in: v1.42
testCase.tags

The list of tags defined on the test or suite via [test()](https://playwright.dev/docs/api/class-test.html#test-call) or [test.describe()](https://playwright.dev/docs/api/class-test.html#test-describe), as well as `@`-tokens extracted from test and suite titles.

Learn more about [test tags](https://playwright.dev/docs/test-annotations.html#tag-tests).

**Usage**

```
testCase.tags
```

**Type**

* [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array")<[string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")>

---

### timeout[​](https://playwright.dev/docs/api/class-testcase.html#test-case-timeout "Direct link to timeout")

Added in: v1.10
testCase.timeout

The timeout given to the test. Affected by [testConfig.timeout](https://playwright.dev/docs/api/class-testconfig.html#test-config-timeout), [testProject.timeout](https://playwright.dev/docs/api/class-testproject.html#test-project-timeout), [test.setTimeout()](https://playwright.dev/docs/api/class-test.html#test-set-timeout), [test.slow()](https://playwright.dev/docs/api/class-test.html#test-slow) and [testInfo.setTimeout()](https://playwright.dev/docs/api/class-testinfo.html#test-info-set-timeout).

**Usage**

```
testCase.timeout
```

**Type**

* [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number")

---

### title[​](https://playwright.dev/docs/api/class-testcase.html#test-case-title "Direct link to title")

Added in: v1.10
testCase.title

Test title as passed to the [test()](https://playwright.dev/docs/api/class-test.html#test-call) call.

**Usage**

```
testCase.title
```

**Type**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

---

### type[​](https://playwright.dev/docs/api/class-testcase.html#test-case-type "Direct link to type")

Added in: v1.44
testCase.type

Returns "test". Useful for detecting test cases in [suite.entries()](https://playwright.dev/docs/api/class-suite.html#suite-entries).

**Usage**

```
testCase.type
```

**Type**

* "test"

[Previous

Suite](https://playwright.dev/docs/api/class-suite.html)[Next

TestError](https://playwright.dev/docs/api/class-testerror.html)

* [Methods](https://playwright.dev/docs/api/class-testcase.html#methods)
  + [ok](https://playwright.dev/docs/api/class-testcase.html#test-case-ok)+ [outcome](https://playwright.dev/docs/api/class-testcase.html#test-case-outcome)+ [titlePath](https://playwright.dev/docs/api/class-testcase.html#test-case-title-path)* [Properties](https://playwright.dev/docs/api/class-testcase.html#properties)
    + [annotations](https://playwright.dev/docs/api/class-testcase.html#test-case-annotations)+ [expectedStatus](https://playwright.dev/docs/api/class-testcase.html#test-case-expected-status)+ [id](https://playwright.dev/docs/api/class-testcase.html#test-case-id)+ [location](https://playwright.dev/docs/api/class-testcase.html#test-case-location)+ [parent](https://playwright.dev/docs/api/class-testcase.html#test-case-parent)+ [repeatEachIndex](https://playwright.dev/docs/api/class-testcase.html#test-case-repeat-each-index)+ [results](https://playwright.dev/docs/api/class-testcase.html#test-case-results)+ [retries](https://playwright.dev/docs/api/class-testcase.html#test-case-retries)+ [tags](https://playwright.dev/docs/api/class-testcase.html#test-case-tags)+ [timeout](https://playwright.dev/docs/api/class-testcase.html#test-case-timeout)+ [title](https://playwright.dev/docs/api/class-testcase.html#test-case-title)+ [type](https://playwright.dev/docs/api/class-testcase.html#test-case-type)
