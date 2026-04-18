---
title: "Extending Reporters advanced | Vitest"
source_url: "https://vitest.dev/guide/advanced/reporters"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



Are you an LLM? You can read better optimized documentation at /guide/advanced/reporters.md for this page in Markdown format

# Extending Reporters advanced [​](https://vitest.dev/guide/advanced/reporters.html#extending-reporters)

WARNING

This is an advanced API. If you just want to configure built-in reporters, read the ["Reporters"](https://vitest.dev/guide/reporters.html) guide.

You can import reporters from `vitest/reporters` and extend them to create your custom reporters.

## Extending Built-in Reporters [​](https://vitest.dev/guide/advanced/reporters.html#extending-built-in-reporters)

In general, you don't need to create your reporter from scratch. `vitest` comes with several default reporting programs that you can extend.

ts

```
import { DefaultReporter } from 'vitest/reporters'

export default class MyDefaultReporter extends DefaultReporter {
  // do something
}
```

Of course, you can create your reporter from scratch. Just extend the `BaseReporter` class and implement the methods you need.

And here is an example of a custom reporter:

custom-reporter.js

ts

```
import { BaseReporter } from 'vitest/reporters'

export default class CustomReporter extends BaseReporter {
  onTestModuleCollected() {
    const files = this.ctx.state.getFiles(this.watchFilters)
    this.reportTestSummary(files)
  }
}
```

Or implement the `Reporter` interface:

custom-reporter.js

ts

```
import type { Reporter } from 'vitest/node'

export default class CustomReporter implements Reporter {
  onTestModuleCollected() {
    // print something
  }
}
```

Then you can use your custom reporter in the `vitest.config.ts` file:

vitest.config.ts

ts

```
import { defineConfig } from 'vitest/config'
import CustomReporter from './custom-reporter.js'

export default defineConfig({
  test: {
    reporters: [new CustomReporter()],
  },
})
```

## Reported Tasks [​](https://vitest.dev/guide/advanced/reporters.html#reported-tasks)

Instead of using the tasks that reporters receive, it is recommended to use the Reported Tasks API instead.

You can get access to this API by calling `vitest.state.getReportedEntity(runnerTask)`:

ts

```
import type {

Reporter

,

TestModule

 } from 'vitest/node'

class

MyReporter

 implements

Reporter

 {


onTestRunEnd

(

testModules

:

ReadonlyArray

<

TestModule

>) {
    for (const

testModule

 of

testModules

) {
      for (const

task

 of

testModule

.

children

) {


console

.

log

('test run end',

task

.

type

,

task

.

fullName

)
      }
    }
  }
}
```

## Exported Reporters [​](https://vitest.dev/guide/advanced/reporters.html#exported-reporters)

`vitest` comes with a few [built-in reporters](https://vitest.dev/guide/reporters.html) that you can use out of the box.

### Built-in reporters: [​](https://vitest.dev/guide/advanced/reporters.html#built-in-reporters)

1. `DefaultReporter`
2. `DotReporter`
3. `JsonReporter`
4. `VerboseReporter`
5. `TapReporter`
6. `JUnitReporter`
7. `TapFlatReporter`
8. `HangingProcessReporter`
9. `TreeReporter`

### Base Abstract reporters: [​](https://vitest.dev/guide/advanced/reporters.html#base-abstract-reporters)

1. `BaseReporter`

### Interface reporters: [​](https://vitest.dev/guide/advanced/reporters.html#interface-reporters)

1. `Reporter`
