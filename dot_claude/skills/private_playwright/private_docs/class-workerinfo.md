---
title: "WorkerInfo | Playwright"
source_url: "https://playwright.dev/docs/api/class-workerinfo"
fetched_at: "2025-12-11T07:41:52.267880+00:00"
---



* * API reference* Test Runner* WorkerInfo

On this page

`WorkerInfo` contains information about the worker that is running tests and is available to worker-scoped fixtures. `WorkerInfo` is a subset of [TestInfo](https://playwright.dev/docs/api/class-testinfo.html "TestInfo") that is available in many other places.

---

## Properties[​](https://playwright.dev/docs/api/class-workerinfo.html#properties "Direct link to Properties")

### config[​](https://playwright.dev/docs/api/class-workerinfo.html#worker-info-config "Direct link to config")

Added in: v1.10
workerInfo.config

Processed configuration from the [configuration file](https://playwright.dev/docs/test-configuration.html).

**Usage**

```
workerInfo.config
```

**Type**

* [FullConfig](https://playwright.dev/docs/api/class-fullconfig.html "FullConfig")

---

### parallelIndex[​](https://playwright.dev/docs/api/class-workerinfo.html#worker-info-parallel-index "Direct link to parallelIndex")

Added in: v1.10
workerInfo.parallelIndex

The index of the worker between `0` and `workers - 1`. It is guaranteed that workers running at the same time have a different `parallelIndex`. When a worker is restarted, for example after a failure, the new worker process has the same `parallelIndex`.

Also available as `process.env.TEST_PARALLEL_INDEX`. Learn more about [parallelism and sharding](https://playwright.dev/docs/test-parallel.html) with Playwright Test.

**Usage**

```
workerInfo.parallelIndex
```

**Type**

* [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number")

---

### project[​](https://playwright.dev/docs/api/class-workerinfo.html#worker-info-project "Direct link to project")

Added in: v1.10
workerInfo.project

Processed project configuration from the [configuration file](https://playwright.dev/docs/test-configuration.html).

**Usage**

```
workerInfo.project
```

**Type**

* [FullProject](https://playwright.dev/docs/api/class-fullproject.html "FullProject")

---

### workerIndex[​](https://playwright.dev/docs/api/class-workerinfo.html#worker-info-worker-index "Direct link to workerIndex")

Added in: v1.10
workerInfo.workerIndex

The unique index of the worker process that is running the test. When a worker is restarted, for example after a failure, the new worker process gets a new unique `workerIndex`.

Also available as `process.env.TEST_WORKER_INDEX`. Learn more about [parallelism and sharding](https://playwright.dev/docs/test-parallel.html) with Playwright Test.

**Usage**

```
workerInfo.workerIndex
```

**Type**

* [number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Number_type "Number")

[Previous

TestStepInfo](https://playwright.dev/docs/api/class-teststepinfo.html)[Next

Reporter](https://playwright.dev/docs/api/class-reporter.html)

* [Properties](https://playwright.dev/docs/api/class-workerinfo.html#properties)
  + [config](https://playwright.dev/docs/api/class-workerinfo.html#worker-info-config)+ [parallelIndex](https://playwright.dev/docs/api/class-workerinfo.html#worker-info-parallel-index)+ [project](https://playwright.dev/docs/api/class-workerinfo.html#worker-info-project)+ [workerIndex](https://playwright.dev/docs/api/class-workerinfo.html#worker-info-worker-index)
