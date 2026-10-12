---
title: "Test Filtering | Guide | Vitest"
source_url: "https://vitest.dev/guide/filtering"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



Are you an LLM? You can read better optimized documentation at /guide/filtering.md for this page in Markdown format

# Test Filtering [​](https://vitest.dev/guide/filtering.html#test-filtering)

Filtering, timeouts, concurrent for suite and tests

## CLI [​](https://vitest.dev/guide/filtering.html#cli)

You can use CLI to filter test files by name:

bash

```
$ vitest basic
```

Will only execute test files that contain `basic`, e.g.

```
basic.test.ts
basic-foo.test.ts
basic/foo.test.ts
```

You can also use the `-t, --testNamePattern <pattern>` option to filter tests by full name. This can be helpful when you want to filter by the name defined within a file rather than the filename itself.

Since Vitest 3, you can also specify the test by filename and line number:

bash

```
$ vitest basic/foo.test.ts:10
```

WARNING

Note that Vitest requires the full filename for this feature to work. It can be relative to the current working directory or an absolute file path.

bash

```
$ vitest basic/foo.js:10 # ✅
$ vitest ./basic/foo.js:10 # ✅
$ vitest /users/project/basic/foo.js:10 # ✅
$ vitest foo:10 # ❌
$ vitest ./basic/foo:10 # ❌
```

At the moment Vitest also doesn't support ranges:

bash

```
$ vitest basic/foo.test.ts:10, basic/foo.test.ts:25 # ✅
$ vitest basic/foo.test.ts:10-25 # ❌
```

## Specifying a Timeout [​](https://vitest.dev/guide/filtering.html#specifying-a-timeout)

You can optionally pass a timeout in milliseconds as a third argument to tests. The default is [5 seconds](https://vitest.dev/config/#testtimeout).

ts

```
import { test } from 'vitest'

test('name', async () => { /* ... */ }, 1000)
```

Hooks also can receive a timeout, with the same 5 seconds default.

ts

```
import { beforeAll } from 'vitest'

beforeAll(async () => { /* ... */ }, 1000)
```

## Skipping Suites and Tests [​](https://vitest.dev/guide/filtering.html#skipping-suites-and-tests)

Use `.skip` to avoid running certain suites or tests

ts

```
import { assert, describe, it } from 'vitest'

describe.skip('skipped suite', () => {
  it('test', () => {
    // Suite skipped, no error
    assert.equal(Math.sqrt(4), 3)
  })
})

describe('suite', () => {
  it.skip('skipped test', () => {
    // Test skipped, no error
    assert.equal(Math.sqrt(4), 3)
  })
})
```

## Selecting Suites and Tests to Run [​](https://vitest.dev/guide/filtering.html#selecting-suites-and-tests-to-run)

Use `.only` to only run certain suites or tests

ts

```
import { assert, describe, it } from 'vitest'

// Only this suite (and others marked with only) are run
describe.only('suite', () => {
  it('test', () => {
    assert.equal(Math.sqrt(4), 3)
  })
})

describe('another suite', () => {
  it('skipped test', () => {
    // Test skipped, as tests are running in Only mode
    assert.equal(Math.sqrt(4), 3)
  })

  it.only('test', () => {
    // Only this test (and others marked with only) are run
    assert.equal(Math.sqrt(4), 2)
  })
})
```

## Unimplemented Suites and Tests [​](https://vitest.dev/guide/filtering.html#unimplemented-suites-and-tests)

Use `.todo` to stub suites and tests that should be implemented

ts

```
import { describe, it } from 'vitest'

// An entry will be shown in the report for this suite
describe.todo('unimplemented suite')

// An entry will be shown in the report for this test
describe('suite', () => {
  it.todo('unimplemented test')
})
```
