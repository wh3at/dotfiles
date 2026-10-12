---
title: "In-Source Testing | Guide | Vitest"
source_url: "https://vitest.dev/guide/in-source"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



Are you an LLM? You can read better optimized documentation at /guide/in-source.md for this page in Markdown format

# In-Source Testing [​](https://vitest.dev/guide/in-source.html#in-source-testing)

Vitest provides a way to run tests within your source code along side the implementation, similar to [Rust's module tests](https://doc.rust-lang.org/book/ch11-03-test-organization.html#the-tests-module-and-cfgtest).

This makes the tests share the same closure as the implementations and able to test against private states without exporting. Meanwhile, it also brings a closer feedback loop for development.

WARNING

This guide explains how to write tests inside your source code. If you need to write tests in separate test files, follow the ["Writing Tests" guide](https://vitest.dev/guide/index.html#writing-tests).

## Setup [​](https://vitest.dev/guide/in-source.html#setup)

To get started, put a `if (import.meta.vitest)` block at the end of your source file and write some tests inside it. For example:

src/index.ts

ts

```
// the implementation
export function add(...args: number[]) {
  return args.reduce((a, b) => a + b, 0)
}

// in-source test suites
if (import.meta.vitest) {
  const { it, expect } = import.meta.vitest
  it('add', () => {
    expect(add()).toBe(0)
    expect(add(1)).toBe(1)
    expect(add(1, 2, 3)).toBe(6)
  })
}
```

Update the `includeSource` config for Vitest to grab the files under `src/`:

vitest.config.ts

ts

```
import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    includeSource: ['src/**/*.{js,ts}'],
  },
})
```

Then you can start to test!

bash

```
$ npx vitest
```

## Production Build [​](https://vitest.dev/guide/in-source.html#production-build)

For the production build, you will need to set the `define` options in your config file, letting the bundler do the dead code elimination. For example, in Vite

vite.config.ts

ts

```
/// <reference types="vitest/config" />

import { defineConfig } from 'vite'

export default defineConfig({
  test: {
    includeSource: ['src/**/*.{js,ts}'],
  },
  define: {
    'import.meta.vitest': 'undefined',
  },
})
```

### Other Bundlers [​](https://vitest.dev/guide/in-source.html#other-bundlers)

Rolldown

rolldown.config.js

js

```
import { defineConfig } from 'rolldown/config'

export default defineConfig({
  transform: {
    define: {
      'import.meta.vitest': 'undefined',
    },
  },
})
```

Learn more: [Rolldown](https://rolldown.rs/)

Rollup

rollup.config.js

js

```
import replace from '@rollup/plugin-replace'

export default {
  plugins: [
    replace({
      'import.meta.vitest': 'undefined',
    })
  ],
  // other options
}
```

Learn more: [Rollup](https://rollupjs.org/)

unbuild

build.config.js

js

```
import { defineBuildConfig } from 'unbuild'

export default defineBuildConfig({
  replace: {
    'import.meta.vitest': 'undefined',
  },
  // other options
})
```

Learn more: [unbuild](https://github.com/unjs/unbuild)

webpack

webpack.config.js

js

```
const webpack = require('webpack')

module.exports = {
  plugins: [
    new webpack.DefinePlugin({
      'import.meta.vitest': 'undefined',
    })
  ],
}
```

Learn more: [webpack](https://webpack.js.org/plugins/define-plugin/)

## TypeScript [​](https://vitest.dev/guide/in-source.html#typescript)

To get TypeScript support for `import.meta.vitest`, add `vitest/importMeta` to your `tsconfig.json`:

tsconfig.json

json

```
{
  "compilerOptions": {
    "types": [
      "vitest/importMeta"
    ]
  }
}
```

Reference to [`examples/in-source-test`](https://github.com/vitest-dev/vitest/tree/main/examples/in-source-test) for the full example.

## Notes [​](https://vitest.dev/guide/in-source.html#notes)

This feature could be useful for:

* Unit testing for small-scoped functions or utilities
* Prototyping
* Inline Assertion

It's recommended to **use separate test files instead** for more complex tests like components or E2E testing.
