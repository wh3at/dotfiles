---
title: "Recipes | Guide | Vitest"
source_url: "https://vitest.dev/guide/recipes"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



Are you an LLM? You can read better optimized documentation at /guide/recipes.md for this page in Markdown format

# Recipes [​](https://vitest.dev/guide/recipes.html#recipes)

## Disabling isolation for specific test files only [​](https://vitest.dev/guide/recipes.html#disabling-isolation-for-specific-test-files-only)

You can speed up your test run by disabling isolation for specific set of files by specifying `isolate` per `projects` entries:

vitest.config.ts

ts

```
import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    projects: [
      {
        // Non-isolated unit tests
        name: 'Unit tests',
        isolate: false,
        exclude: ['**.integration.test.ts'],
      },
      {
        // Isolated integration tests
        name: 'Integration tests',
        include: ['**.integration.test.ts'],
      },
    ],
  },
})
```

## Parallel and Sequential test files [​](https://vitest.dev/guide/recipes.html#parallel-and-sequential-test-files)

You can split test files into parallel and sequential groups by using `projects` option:

vitest.config.ts

ts

```
import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    projects: [
      {
        name: 'Parallel',
        exclude: ['**.sequantial.test.ts'],
      },
      {
        name: 'Sequential',
        include: ['**.sequantial.test.ts'],
        fileParallelism: false,
      },
    ],
  },
})
```
