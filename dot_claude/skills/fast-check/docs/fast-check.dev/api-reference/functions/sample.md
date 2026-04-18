---
title: "sample | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/sample"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [sample](https://fast-check.dev/api-reference/functions/sample.html)

# Function sample

* sample<[Ts](https://fast-check.dev/api-reference/functions/sample.html#samplets)>(
      generator: [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/sample.html#samplets), boolean> | [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Ts](https://fast-check.dev/api-reference/functions/sample.html#samplets)>,
      params?: number | [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/sample.html#samplets)>,
  ): [Ts](https://fast-check.dev/api-reference/functions/sample.html#samplets)[]

  Generate an array containing all the values that would have been generated during [assert](https://fast-check.dev/api-reference/functions/assert.html) or [check](https://fast-check.dev/api-reference/functions/check.html)

  #### Type Parameters

  + Ts

  #### Parameters

  + generator: [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/sample.html#samplets), boolean> | [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Ts](https://fast-check.dev/api-reference/functions/sample.html#samplets)>

    [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html) or [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html) to extract the values from
  + `Optional`params: number | [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/sample.html#samplets)>

    Integer representing the number of values to generate or `Parameters` as in [assert](https://fast-check.dev/api-reference/functions/assert.html)

  #### Returns [Ts](https://fast-check.dev/api-reference/functions/sample.html#samplets)[]

  #### Example

  ```
  fc.sample(fc.nat(), 10); // extract 10 values from fc.nat() Arbitrary
  fc.sample(fc.nat(), {seed: 42}); // extract values from fc.nat() as if we were running fc.assert with seed=42
  Copy
  ```

  #### Remarks

  Since 0.0.6

  + Defined in [packages/fast-check/src/check/runner/Sampler.ts:61](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/Sampler.ts#L61)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
