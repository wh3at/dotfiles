---
title: "Coverage | Guide | Vitest"
source_url: "https://vitest.dev/guide/coverage"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



Are you an LLM? You can read better optimized documentation at /guide/coverage.md for this page in Markdown format

# Coverage [​](https://vitest.dev/guide/coverage.html#coverage)

Vitest supports Native code coverage via [`v8`](https://v8.dev/blog/javascript-code-coverage) and instrumented code coverage via [`istanbul`](https://istanbul.js.org/).

## Coverage Providers [​](https://vitest.dev/guide/coverage.html#coverage-providers)

Both `v8` and `istanbul` support are optional. By default, `v8` will be used.

You can select the coverage tool by setting `test.coverage.provider` to `v8` or `istanbul`:

vitest.config.ts

ts

```
import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    coverage: {
      provider: 'v8' // or 'istanbul'
    },
  },
})
```

When you start the Vitest process, it will prompt you to install the corresponding support package automatically.

Or if you prefer to install them manually:

v8istanbul

bash

```
npm i -D @vitest/coverage-v8
```

bash

```
npm i -D @vitest/coverage-istanbul
```

## V8 Provider [​](https://vitest.dev/guide/coverage.html#v8-provider)

INFO

The description of V8 coverage below is Vitest specific and does not apply to other test runners. Since `v3.2.0` Vitest has used [AST based coverage remapping](https://vitest.dev/blog/vitest-3-2#coverage-v8-ast-aware-remapping) for V8 coverage, which produces identical coverage reports to Istanbul.

This allows users to have the speed of V8 coverage with accuracy of Istanbul coverage.

By default Vitest uses `'v8'` coverage provider. This provider requires Javascript runtime that's implemented on top of [V8 engine](https://v8.dev/), such as NodeJS, Deno or any Chromium based browsers such as Google Chrome.

Coverage collection is performed during runtime by instructing V8 using [`node:inspector`](https://nodejs.org/api/inspector.html) and [Chrome DevTools Protocol](https://chromedevtools.github.io/devtools-protocol/tot/Profiler/) in browsers. User's source files can be executed as-is without any pre-instrumentation steps.

* ✅ Recommended option to use
* ✅ No pre-transpile step. Test files can be executed as-is.
* ✅ Faster execute times than Istanbul.
* ✅ Lower memory usage than Istanbul.
* ✅ Coverage report accuracy is as good as with Istanbul ([since Vitest `v3.2.0`](https://vitest.dev/blog/vitest-3-2#coverage-v8-ast-aware-remapping)).
* ⚠️ In some cases can be slower than Istanbul, e.g. when loading lots of different modules. V8 does not support limiting coverage collection to specific modules.
* ⚠️ There are some minor limitations set by V8 engine. See [`ast-v8-to-istanbul` | Limitations](https://github.com/AriPerkkio/ast-v8-to-istanbul?tab=readme-ov-file#limitations).
* ❌ Does not work on environments that don't use V8, such as Firefox or Bun. Or on environments that don't expose V8 coverage via profiler, such as Cloudflare Workers.

Test fileEnable V8 runtime coverage collectionRun fileCollect coverage results from V8Remap coverage results to source filesCoverage report

## Istanbul provider [​](https://vitest.dev/guide/coverage.html#istanbul-provider)

[Istanbul code coverage tooling](https://istanbul.js.org/) has existed since 2012 and is very well battle-tested. This provider works on any Javascript runtime as coverage tracking is done by instrumenting user's source files.

In practice, instrumenting source files means adding additional Javascript in user's files:

js

```
// Simplified example of branch and function coverage counters
const coverage = {
  branches: { 1: [0, 0] },
  functions: { 1: 0 },
}

export function getUsername(id) {
  // Function coverage increased when this is invoked
  coverage.functions['1']++

  if (id == null) {
    // Branch coverage increased when this is invoked
    coverage.branches['1'][0]++

    throw new Error('User ID is required')
  }
  // Implicit else coverage increased when if-statement condition not met
  coverage.branches['1'][1]++

  return database.getUser(id)
}

globalThis.__VITEST_COVERAGE__ ||= {}
globalThis.__VITEST_COVERAGE__[filename] = coverage
```

* ✅ Works on any Javascript runtime
* ✅ Widely used and battle-tested for over 13 years.
* ✅ In some cases faster than V8. Coverage instrumentation can be limited to specific files, as opposed to V8 where all modules are instrumented.
* ❌ Requires pre-instrumentation step
* ❌ Execution speed is slower than V8 due to instrumentation overhead
* ❌ Instrumentation increases file sizes
* ❌ Memory usage is higher than V8

Test filePre‑instrumentation with BabelRun fileCollect coverage results from Javascript scopeRemap coverage results to source filesCoverage report

## Coverage Setup [​](https://vitest.dev/guide/coverage.html#coverage-setup)

TIP

All coverage options are listed in [Coverage Config Reference](https://vitest.dev/config/#coverage).

To test with coverage enabled, you can pass the `--coverage` flag in CLI or set `coverage.enabled` in `vitest.config.ts`:

package.jsonvitest.config.ts

json

```
{
  "scripts": {
    "test": "vitest",
    "coverage": "vitest run --coverage"
  }
}
```

ts

```
import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    coverage: {
      enabled: true
    },
  },
})
```

## Including and excluding files from coverage report [​](https://vitest.dev/guide/coverage.html#including-and-excluding-files-from-coverage-report)

You can define what files are shown in coverage report by configuring [`coverage.include`](https://vitest.dev/config/#coverage-include) and [`coverage.exclude`](https://vitest.dev/config/#coverage-exclude).

By default Vitest will show only files that were imported during test run. To include uncovered files in the report, you'll need to configure [`coverage.include`](https://vitest.dev/config/#coverage-include) with a pattern that will pick your source files:

vitest.config.tsCovered Files

ts

```
import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    coverage: {
      include: ['src/**/*.{ts,tsx}']
    },
  },
})
```

sh

```
├── src
│   ├── components
│   │   └── counter.tsx
│   ├── mock-data
│   │   ├── products.json
│   │   └── users.json
│   └── utils
│       ├── formatters.ts
│       ├── time.ts
│       └── users.ts
├── test
│   └── utils.test.ts
│
├── package.json
├── tsup.config.ts
└── vitest.config.ts
```

To exclude files that are matching `coverage.include`, you can define an additional [`coverage.exclude`](https://vitest.dev/config/#coverage-exclude):

vitest.config.tsCovered Files

ts

```
import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    coverage: {
      include: ['src/**/*.{ts,tsx}'],
      exclude: ['**/utils/users.ts']
    },
  },
})
```

sh

```
├── src
│   ├── components
│   │   └── counter.tsx
│   ├── mock-data
│   │   ├── products.json
│   │   └── users.json
│   └── utils
│       ├── formatters.ts
│       ├── time.ts
│       └── users.ts
├── test
│   └── utils.test.ts
│
├── package.json
├── tsup.config.ts
└── vitest.config.ts
```

## Custom Coverage Reporter [​](https://vitest.dev/guide/coverage.html#custom-coverage-reporter)

You can use custom coverage reporters by passing either the name of the package or absolute path in `test.coverage.reporter`:

vitest.config.ts

ts

```
import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    coverage: {
      reporter: [
        // Specify reporter using name of the NPM package
        ['@vitest/custom-coverage-reporter', { someOption: true }],

        // Specify reporter using local path
        '/absolute/path/to/custom-reporter.cjs',
      ],
    },
  },
})
```

Custom reporters are loaded by Istanbul and must match its reporter interface. See [built-in reporters' implementation](https://github.com/istanbuljs/istanbuljs/tree/master/packages/istanbul-reports/lib) for reference.

custom-reporter.cjs

js

```
const { ReportBase } = require('istanbul-lib-report')

module.exports = class CustomReporter extends ReportBase {
  constructor(opts) {
    super()

    // Options passed from configuration are available here
    this.file = opts.file
  }

  onStart(root, context) {
    this.contentWriter = context.writer.writeFile(this.file)
    this.contentWriter.println('Start of custom coverage report')
  }

  onEnd() {
    this.contentWriter.println('End of custom coverage report')
    this.contentWriter.close()
  }
}
```

## Custom Coverage Provider [​](https://vitest.dev/guide/coverage.html#custom-coverage-provider)

It's also possible to provide your custom coverage provider by passing `'custom'` in `test.coverage.provider`:

vitest.config.ts

ts

```
import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    coverage: {
      provider: 'custom',
      customProviderModule: 'my-custom-coverage-provider'
    },
  },
})
```

The custom providers require a `customProviderModule` option which is a module name or path where to load the `CoverageProviderModule` from. It must export an object that implements `CoverageProviderModule` as default export:

my-custom-coverage-provider.ts

ts

```
import type {
  CoverageProvider,
  CoverageProviderModule,
  ResolvedCoverageOptions,
  Vitest
} from 'vitest'

const CustomCoverageProviderModule: CoverageProviderModule = {
  getProvider(): CoverageProvider {
    return new CustomCoverageProvider()
  },

  // Implements rest of the CoverageProviderModule ...
}

class CustomCoverageProvider implements CoverageProvider {
  name = 'custom-coverage-provider'
  options!: ResolvedCoverageOptions

  initialize(ctx: Vitest) {
    this.options = ctx.config.coverage
  }

  // Implements rest of the CoverageProvider ...
}

export default CustomCoverageProviderModule
```

Please refer to the type definition for more details.

## Ignoring Code [​](https://vitest.dev/guide/coverage.html#ignoring-code)

Both coverage providers have their own ways how to ignore code from coverage reports:

* [`v8`](https://github.com/AriPerkkio/ast-v8-to-istanbul?tab=readme-ov-file#ignoring-code)
* [`istanbul`](https://github.com/istanbuljs/nyc#parsing-hints-ignoring-lines)

When using TypeScript the source codes are transpiled using `esbuild`, which strips all comments from the source codes ([esbuild#516](https://github.com/evanw/esbuild/issues/516)). Comments which are considered as [legal comments](https://esbuild.github.io/api/#legal-comments) are preserved.

You can include a `@preserve` keyword in the ignore hint. Beware that these ignore hints may now be included in final production build as well.

diff

```
-/* istanbul ignore if */
+/* istanbul ignore if -- @preserve */
if (condition) {

-/* v8 ignore if */
+/* v8 ignore if -- @preserve */
if (condition) {
```

### Examples [​](https://vitest.dev/guide/coverage.html#examples)

if elsenext nodetry catchswitch casewhole file

ts

```
/* v8 ignore if -- @preserve */
if (parameter) {
  console.log('Ignored')
}
else {
  console.log('Included')
}

/* v8 ignore else -- @preserve */
if (parameter) {
  console.log('Included')
}
else {
  console.log('Ignored')
}
```

ts

```
/* v8 ignore next -- @preserve */
console.log('Ignored')
console.log('Included')

/* v8 ignore next -- @preserve */
function ignored() {
  console.log('all')
  console.log('lines')
  console.log('are')
  console.log('ignored')
}

/* v8 ignore next -- @preserve */
class Ignored {
  ignored() {}
  alsoIgnored() {}
}

/* v8 ignore next -- @preserve */
condition
  ? console.log('ignored')
  : console.log('also ignored')
```

ts

```
/* v8 ignore next -- @preserve */
try {
  console.log('Ignored')
}
catch (error) {
  console.log('Ignored')
}

try {
  console.log('Included')
}
catch (error) {
  /* v8 ignore next -- @preserve */
  console.log('Ignored')
  /* v8 ignore next -- @preserve */
  console.log('Ignored')
}

// Requires rolldown-vite due to esbuild's lack of support.
// See https://vite.dev/guide/rolldown.html#how-to-try-rolldown
try {
  console.log('Included')
}
catch (error) /* v8 ignore next */ {
  console.log('Ignored')
}
```

ts

```
switch (type) {
  case 1:
    return 'Included'

  /* v8 ignore next -- @preserve */
  case 2:
    return 'Ignored'

  case 3:
    return 'Included'

  /* v8 ignore next -- @preserve */
  default:
    return 'Ignored'
}
```

ts

```
/* v8 ignore file -- @preserve */
export function ignored() {
  return 'Whole file is ignored'
}
```

## Coverage Performance [​](https://vitest.dev/guide/coverage.html#coverage-performance)

If code coverage generation is slow on your project, see [Profiling Test Performance | Code coverage](https://vitest.dev/guide/profiling-test-performance.html#code-coverage).

## Vitest UI [​](https://vitest.dev/guide/coverage.html#vitest-ui)

You can check your coverage report in [Vitest UI](https://vitest.dev/guide/ui.html).

Vitest UI will enable coverage report when it is enabled explicitly and the html coverage reporter is present, otherwise it will not be available:

* enable `coverage.enabled=true` in your configuration file or run Vitest with `--coverage.enabled=true` flag
* add `html` to the `coverage.reporter` list: you can also enable `subdir` option to put coverage report in a subdirectory

![html coverage activation in Vitest UI](https://vitest.dev/vitest-ui-show-coverage-light.png)![html coverage activation in Vitest UI](https://vitest.dev/vitest-ui-show-coverage-dark.png)![html coverage in Vitest UI](https://vitest.dev/ui-coverage-1-light.png)![html coverage in Vitest UI](https://vitest.dev/ui-coverage-1-dark.png)
