---
title: "Debugging | Guide | Vitest"
source_url: "https://vitest.dev/guide/debugging"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



Are you an LLM? You can read better optimized documentation at /guide/debugging.md for this page in Markdown format

# Debugging [​](https://vitest.dev/guide/debugging.html#debugging)

TIP

When debugging tests you might want to use following options:

* [`--test-timeout=0`](https://vitest.dev/guide/cli.html#testtimeout) to prevent tests from timing out when stopping at breakpoints
* [`--no-file-parallelism`](https://vitest.dev/guide/cli.html#fileparallelism) to prevent test files from running parallel

## VS Code [​](https://vitest.dev/guide/debugging.html#vs-code)

Quick way to debug tests in VS Code is via `JavaScript Debug Terminal`. Open a new `JavaScript Debug Terminal` and run `npm run test` or `vitest` directly. *this works with any code run in Node, so will work with most JS testing frameworks*

![image](https://user-images.githubusercontent.com/5594348/212169143-72bf39ce-f763-48f5-822a-0c8b2e6a8484.png)

You can also add a dedicated launch configuration to debug a test file in VS Code:

json

```
{
  // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "launch",
      "name": "Debug Current Test File",
      "autoAttachChildProcesses": true,
      "skipFiles": ["<node_internals>/**", "**/node_modules/**"],
      "program": "${workspaceRoot}/node_modules/vitest/vitest.mjs",
      "args": ["run", "${relativeFile}"],
      "smartStep": true,
      "console": "integratedTerminal"
    }
  ]
}
```

Then in the debug tab, ensure 'Debug Current Test File' is selected. You can then open the test file you want to debug and press F5 to start debugging.

### Browser mode [​](https://vitest.dev/guide/debugging.html#browser-mode)

To debug [Vitest Browser Mode](https://vitest.dev/guide/browser.html), pass `--inspect` or `--inspect-brk` in CLI or define it in your Vitest configuration:

CLIvitest.config.js

bash

```
vitest --inspect-brk --browser --no-file-parallelism
```

ts

```
import { defineConfig } from 'vitest/config'
import { playwright } from '@vitest/browser-playwright'

export default defineConfig({
  test: {
    inspectBrk: true,
    fileParallelism: false,
    browser: {
      provider: playwright(),
      instances: [{ browser: 'chromium' }]
    },
  },
})
```

By default Vitest will use port `9229` as debugging port. You can overwrite it with by passing value in `--inspect-brk`:

bash

```
vitest --inspect-brk=127.0.0.1:3000 --browser --no-file-parallelism
```

Use following [VSCode Compound configuration](https://code.visualstudio.com/docs/editor/debugging#_compound-launch-configurations) for launching Vitest and attaching debugger in the browser:

json

```
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "launch",
      "name": "Run Vitest Browser",
      "program": "${workspaceRoot}/node_modules/vitest/vitest.mjs",
      "console": "integratedTerminal",
      "args": ["--inspect-brk", "--browser", "--no-file-parallelism"]
    },
    {
      "type": "chrome",
      "request": "attach",
      "name": "Attach to Vitest Browser",
      "port": 9229
    }
  ],
  "compounds": [
    {
      "name": "Debug Vitest Browser",
      "configurations": ["Attach to Vitest Browser", "Run Vitest Browser"],
      "stopAll": true
    }
  ]
}
```

## IntelliJ IDEA [​](https://vitest.dev/guide/debugging.html#intellij-idea)

Create a [vitest](https://www.jetbrains.com/help/idea/vitest.html#createRunConfigVitest) run configuration. Use the following settings to run all tests in debug mode:

| Setting | Value |
| --- | --- |
| Working directory | `/path/to/your-project-root` |

Then run this configuration in debug mode. The IDE will stop at JS/TS breakpoints set in the editor.

## Node Inspector, e.g. Chrome DevTools [​](https://vitest.dev/guide/debugging.html#node-inspector-e-g-chrome-devtools)

Vitest also supports debugging tests without IDEs. However this requires that tests are not run parallel. Use one of the following commands to launch Vitest.

sh

```
# To run in a single worker
vitest --inspect-brk --no-file-parallelism

# To run in browser mode
vitest --inspect-brk --browser --no-file-parallelism
```

Once Vitest starts it will stop execution and wait for you to open developer tools that can connect to [Node.js inspector](https://nodejs.org/en/docs/guides/debugging-getting-started/). You can use Chrome DevTools for this by opening `chrome://inspect` on browser.

In watch mode you can keep the debugger open during test re-runs by using the `--isolate false` options.
