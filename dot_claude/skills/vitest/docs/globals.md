---
title: "Mocking Globals | Vitest"
source_url: "https://vitest.dev/guide/mocking/globals"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



Are you an LLM? You can read better optimized documentation at /guide/mocking/globals.md for this page in Markdown format

# Mocking Globals [​](https://vitest.dev/guide/mocking/globals.html#mocking-globals)

You can mock global variables that are not present with `jsdom` or `node` by using [`vi.stubGlobal`](https://vitest.dev/api/vi#vi-stubglobal) helper. It will put the value of the global variable into a `globalThis` object.

By default, Vitest does not reset these globals, but you can turn on the [`unstubGlobals`](https://vitest.dev/config/#unstubglobals) option in your config to restore the original values after each test or call [`vi.unstubAllGlobals()`](https://vitest.dev/api/vi#vi-unstuballglobals) manually.

ts

```
import { vi } from 'vitest'

const IntersectionObserverMock = vi.fn(class {
  disconnect = vi.fn()
  observe = vi.fn()
  takeRecords = vi.fn()
  unobserve = vi.fn()
})

vi.stubGlobal('IntersectionObserver', IntersectionObserverMock)

// now you can access it as `IntersectionObserver` or `window.IntersectionObserver`
```
