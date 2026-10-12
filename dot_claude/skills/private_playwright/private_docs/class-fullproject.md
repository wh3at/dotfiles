---
title: "FullProject | Playwright"
source_url: "https://playwright.dev/docs/api/class-fullproject"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Test Runner* FullProject

On this page

Runtime representation of the test project configuration. It is accessible in the tests via [testInfo.project](https://playwright.dev/docs/api/class-testinfo.html#test-info-project) and [workerInfo.project](https://playwright.dev/docs/api/class-workerinfo.html#worker-info-project) and is passed to the test reporters. To see the format of the project in the Playwright configuration file please see [TestProject](https://playwright.dev/docs/api/class-testproject.html "TestProject") instead.

---

## Properties[​](https://playwright.dev/docs/api/class-fullproject.html#properties "Direct link to Properties")

### dependencies[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-dependencies "Direct link to dependencies")

Added in: v1.31
fullProject.dependencies

See [testProject.dependencies](https://playwright.dev/docs/api/class-testproject.html#test-project-dependencies).

**Usage**

```
fullProject.dependencies
```

**Type**

* [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array")<[string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")>

---

### grep[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-grep "Direct link to grep")

Added in: v1.10
fullProject.grep

See [testProject.grep](https://playwright.dev/docs/api/class-testproject.html#test-project-grep).

**Usage**

```
fullProject.grep
```

**Type**

* [RegExp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp "RegExp") | [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array")<[RegExp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp "RegExp")>

---

### grepInvert[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-grep-invert "Direct link to grepInvert")

Added in: v1.10
fullProject.grepInvert

See [testProject.grepInvert](https://playwright.dev/docs/api/class-testproject.html#test-project-grep-invert).

**Usage**

```
fullProject.grepInvert
```

**Type**

* [null](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/null "null") | [RegExp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp "RegExp") | [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array")<[RegExp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp "RegExp")>

---

### metadata[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-metadata "Direct link to metadata")

Added in: v1.10
fullProject.metadata

See [testProject.metadata](https://playwright.dev/docs/api/class-testproject.html#test-project-metadata).

**Usage**

```
fullProject.metadata
```

**Type**

* [Metadata](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object "Object<string, any>")

---

### name[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-name "Direct link to name")

Added in: v1.10
fullProject.name

See [testProject.name](https://playwright.dev/docs/api/class-testproject.html#test-project-name).

**Usage**

```
fullProject.name
```

**Type**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

---

### outputDir[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-output-dir "Direct link to outputDir")

Added in: v1.10
fullProject.outputDir

See [testProject.outputDir](https://playwright.dev/docs/api/class-testproject.html#test-project-output-dir).

**Usage**

```
fullProject.outputDir
```

**Type**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

---

### repeatEach[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-repeat-each "Direct link to repeatEach")

Added in: v1.10
fullProject.repeatEach

See [testProject.repeatEach](https://playwright.dev/docs/api/class-testproject.html#test-project-repeat-each).

**Usage**

```
fullProject.repeatEach
```

**Type**

* [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number")

---

### retries[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-retries "Direct link to retries")

Added in: v1.10
fullProject.retries

See [testProject.retries](https://playwright.dev/docs/api/class-testproject.html#test-project-retries).

**Usage**

```
fullProject.retries
```

**Type**

* [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number")

---

### snapshotDir[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-snapshot-dir "Direct link to snapshotDir")

Added in: v1.10
fullProject.snapshotDir

See [testProject.snapshotDir](https://playwright.dev/docs/api/class-testproject.html#test-project-snapshot-dir).

**Usage**

```
fullProject.snapshotDir
```

**Type**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

---

### teardown[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-teardown "Direct link to teardown")

Added in: v1.34
fullProject.teardown

See [testProject.teardown](https://playwright.dev/docs/api/class-testproject.html#test-project-teardown).

**Usage**

```
fullProject.teardown
```

**Type**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

---

### testDir[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-test-dir "Direct link to testDir")

Added in: v1.10
fullProject.testDir

See [testProject.testDir](https://playwright.dev/docs/api/class-testproject.html#test-project-test-dir).

**Usage**

```
fullProject.testDir
```

**Type**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string")

---

### testIgnore[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-test-ignore "Direct link to testIgnore")

Added in: v1.10
fullProject.testIgnore

See [testProject.testIgnore](https://playwright.dev/docs/api/class-testproject.html#test-project-test-ignore).

**Usage**

```
fullProject.testIgnore
```

**Type**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string") | [RegExp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp "RegExp") | [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array")<[string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string") | [RegExp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp "RegExp")>

---

### testMatch[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-test-match "Direct link to testMatch")

Added in: v1.10
fullProject.testMatch

See [testProject.testMatch](https://playwright.dev/docs/api/class-testproject.html#test-project-test-match).

**Usage**

```
fullProject.testMatch
```

**Type**

* [string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string") | [RegExp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp "RegExp") | [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array")<[string](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#String_type "string") | [RegExp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp "RegExp")>

---

### timeout[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-timeout "Direct link to timeout")

Added in: v1.10
fullProject.timeout

See [testProject.timeout](https://playwright.dev/docs/api/class-testproject.html#test-project-timeout).

**Usage**

```
fullProject.timeout
```

**Type**

* [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number")

---

### use[​](https://playwright.dev/docs/api/class-fullproject.html#full-project-use "Direct link to use")

Added in: v1.10
fullProject.use

See [testProject.use](https://playwright.dev/docs/api/class-testproject.html#test-project-use).

**Usage**

```
fullProject.use
```

**Type**

* [Fixtures](https://playwright.dev/docs/api/class-fixtures.html "Fixtures")

[Previous

FullConfig](https://playwright.dev/docs/api/class-fullconfig.html)[Next

Location](https://playwright.dev/docs/api/class-location.html)

* [Properties](https://playwright.dev/docs/api/class-fullproject.html#properties)
  + [dependencies](https://playwright.dev/docs/api/class-fullproject.html#full-project-dependencies)+ [grep](https://playwright.dev/docs/api/class-fullproject.html#full-project-grep)+ [grepInvert](https://playwright.dev/docs/api/class-fullproject.html#full-project-grep-invert)+ [metadata](https://playwright.dev/docs/api/class-fullproject.html#full-project-metadata)+ [name](https://playwright.dev/docs/api/class-fullproject.html#full-project-name)+ [outputDir](https://playwright.dev/docs/api/class-fullproject.html#full-project-output-dir)+ [repeatEach](https://playwright.dev/docs/api/class-fullproject.html#full-project-repeat-each)+ [retries](https://playwright.dev/docs/api/class-fullproject.html#full-project-retries)+ [snapshotDir](https://playwright.dev/docs/api/class-fullproject.html#full-project-snapshot-dir)+ [teardown](https://playwright.dev/docs/api/class-fullproject.html#full-project-teardown)+ [testDir](https://playwright.dev/docs/api/class-fullproject.html#full-project-test-dir)+ [testIgnore](https://playwright.dev/docs/api/class-fullproject.html#full-project-test-ignore)+ [testMatch](https://playwright.dev/docs/api/class-fullproject.html#full-project-test-match)+ [timeout](https://playwright.dev/docs/api/class-fullproject.html#full-project-timeout)+ [use](https://playwright.dev/docs/api/class-fullproject.html#full-project-use)
