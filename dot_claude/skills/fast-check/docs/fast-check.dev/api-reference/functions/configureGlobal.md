---
title: "configureGlobal | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/configureGlobal"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [configureGlobal](https://fast-check.dev/api-reference/functions/configureGlobal.html)

# Function configureGlobal

* configureGlobal(parameters: [GlobalParameters](https://fast-check.dev/api-reference/types/GlobalParameters.html)): void

  Define global parameters that will be used by all the runners

  #### Parameters

  + parameters: [GlobalParameters](https://fast-check.dev/api-reference/types/GlobalParameters.html)

    Global parameters

  #### Returns void

  #### Example

  ```
  fc.configureGlobal({ numRuns: 10 });
  //...
  fc.assert(
    fc.property(
      fc.nat(), fc.nat(),
      (a, b) => a + b === b + a
    ), { seed: 42 }
  ) // equivalent to { numRuns: 10, seed: 42 }
  Copy
  ```

  #### Remarks

  Since 1.18.0

  + Defined in [packages/fast-check/src/check/runner/configuration/GlobalParameters.ts:109](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/GlobalParameters.ts#L109)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
