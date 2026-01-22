---
title: "Global settings | fast-check"
source_url: "https://fast-check.dev/docs/configuration/global-settings/index"
fetched_at: "2025-12-29T00:49:30.561244+00:00"
---



* * [Configuration](https://fast-check.dev/docs/configuration/index.html)* Global settings

On this page

Share settings cross runners.

## Per test settings[​](https://fast-check.dev/docs/configuration/global-settings/index.html#per-test-settings "Direct link to Per test settings")

By default, the [runners](https://fast-check.dev/docs/core-blocks/runners/) take an [optional argument for extra settings](https://fast-check.dev/api-reference/interfaces/Parameters.html). Some of these settings can be re-used over-and-over in the same file and across several files.

Example:

```
test('test #1', () => {
  fc.assert(myProp1, { numRuns: 10 });
});
test('test #2', () => {
  fc.assert(myProp2, { numRuns: 10 });
});
test('test #3', () => {
  fc.assert(myProp3, { numRuns: 10 });
});
```

## Shared settings[​](https://fast-check.dev/docs/configuration/global-settings/index.html#shared-settings "Direct link to Shared settings")

The recommended way to share settings across runners is to use `configureGlobal`.

Here is how to update the snippet above to share the settings:

```
fc.configureGlobal({ numRuns: 10 });

test('test #1', () => {
  fc.assert(myProp1);
});
test('test #2', () => {
  fc.assert(myProp2);
});
test('test #3', () => {
  fc.assert(myProp3);
});
```

warning

`configureGlobal` fully resets the settings. In other words, it fully drops the previously defined global settings if any even if they applied on other keys.

Enrich existing global settings

If you want to only add new options on top of the existing ones you may want to use `readConfigureGlobal` as follow:

```
fc.configureGlobal({ ...fc.readConfigureGlobal(), ...myNewOptions });
```

You can also fully reset all the global options by calling `resetConfigureGlobal`.

Resources: [API reference](https://fast-check.dev/api-reference/functions/configureGlobal.html).
Available since 1.18.0.

## Integration with test frameworks[​](https://fast-check.dev/docs/configuration/global-settings/index.html#integration-with-test-frameworks "Direct link to Integration with test frameworks")

Main test frameworks provide ways to connect `configureGlobal` on all the spec files without having to copy the snippet over-and-over. This section describes how to do so with some of them.

### Jest[​](https://fast-check.dev/docs/configuration/global-settings/index.html#jest "Direct link to Jest")

You need to define a setup file (if not already done):

jest.config.js

```
module.exports = {
  setupFiles: ['./jest.setup.js'],
};
```

Then you can add the global settings snippet directly into the setup file:

jest.setup.js

```
const fc = require('fast-check');
fc.configureGlobal({ numRuns: 10 });
```

### Mocha[​](https://fast-check.dev/docs/configuration/global-settings/index.html#mocha "Direct link to Mocha")

When calling mocha, you can provide an additional parameter to specify a file to be executed before the code of your tests by adding `--file=mocha.setup.js`.

Then you can add the global settings snippet directly into the setup file:

mocha.setup.js

```
const fc = require('fast-check');
fc.configureGlobal({ numRuns: 10 });
```

### Vitest[​](https://fast-check.dev/docs/configuration/global-settings/index.html#vitest "Direct link to Vitest")

You need to define a setup file (if not already done):

vitest.config.js

```
import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    // ...
    setupFiles: ['./vitest.setup.js'],
  },
});
```

Then you can add the global settings snippet directly into the setup file:

vitest.setup.js

```
import fc from 'fast-check';
fc.configureGlobal({ numRuns: 10 });
```

[Previous

Custom reports](https://fast-check.dev/docs/configuration/custom-reports/index.html)[Next

Larger entries by default](https://fast-check.dev/docs/configuration/larger-entries-by-default/index.html)

* [Per test settings](https://fast-check.dev/docs/configuration/global-settings/index.html#per-test-settings)* [Shared settings](https://fast-check.dev/docs/configuration/global-settings/index.html#shared-settings)* [Integration with test frameworks](https://fast-check.dev/docs/configuration/global-settings/index.html#integration-with-test-frameworks)
      + [Jest](https://fast-check.dev/docs/configuration/global-settings/index.html#jest)+ [Mocha](https://fast-check.dev/docs/configuration/global-settings/index.html#mocha)+ [Vitest](https://fast-check.dev/docs/configuration/global-settings/index.html#vitest)
