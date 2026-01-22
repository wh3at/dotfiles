---
title: "Parallelism | Guide | Vitest"
source_url: "https://vitest.dev/guide/parallelism"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



Are you an LLM? You can read better optimized documentation at /guide/parallelism.md for this page in Markdown format

# Parallelism [​](https://vitest.dev/guide/parallelism.html#parallelism)

## File Parallelism [​](https://vitest.dev/guide/parallelism.html#file-parallelism)

By default, Vitest runs *test files* in parallel. Depending on the specified `pool`, Vitest uses a different mechanism to parallelize test files:

* `forks` (the default) and `vmForks` run tests in different [child processes](https://nodejs.org/api/child_process.html)
* `threads` and `vmThreads` run tests in different [worker threads](https://nodejs.org/api/worker_threads.html)

Both "child processes" and "worker threads" are refered to as "workers". You can configure the number of running workers with [`maxWorkers`](https://vitest.dev/config/#maxworkers) option.

If you have a lot of tests, it is usually faster to run them in parallel, but it also depends on the project, the environment and [isolation](https://vitest.dev/config/#isolate) state. To disable file parallelisation, you can set [`fileParallelism`](https://vitest.dev/config/#fileparallelism) to `false`. To learn more about possible performance improvements, read the [Performance Guide](https://vitest.dev/guide/improving-performance.html).

## Test Parallelism [​](https://vitest.dev/guide/parallelism.html#test-parallelism)

Unlike *test files*, Vitest runs *tests* in sequence. This means that tests inside a single test file will run in the order they are defined.

Vitest supports the [`concurrent`](https://vitest.dev/api/#test-concurrent) option to run tests together. If this option is set, Vitest will group concurrent tests in the same *file* (the number of simultaneously running tests depends on the [`maxConcurrency`](https://vitest.dev/config/#maxconcurrency) option) and run them with [`Promise.all`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all).

Vitest doesn't perform any smart analysis and doesn't create additional workers to run these tests. This means that the performance of your tests will improve only if you rely heavily on asynchronous operations. For example, these tests will still run one after another even though the `concurrent` option is specified. This is because they are synchronous:

ts

```
test.concurrent('the first test', () => {
  expect(1).toBe(1)
})

test.concurrent('the second test', () => {
  expect(2).toBe(2)
})
```

If you wish to run all tests concurrently, you can set the [`sequence.concurrent`](https://vitest.dev/config/#sequence-concurrent) option to `true`.
