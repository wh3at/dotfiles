---
title: "limitShrink | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/limitShrink"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [limitShrink](https://fast-check.dev/api-reference/functions/limitShrink.html)

# Function limitShrink

* limitShrink<[T](https://fast-check.dev/api-reference/functions/limitShrink.html#limitshrinkt)>(arbitrary: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/limitShrink.html#limitshrinkt)>, maxShrinks: number): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/limitShrink.html#limitshrinkt)>

  Create another Arbitrary with a limited (or capped) number of shrink values

  #### Type Parameters

  + T

  #### Parameters

  + arbitrary: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/limitShrink.html#limitshrinkt)>

    Instance of arbitrary responsible to generate and shrink values
  + maxShrinks: number

    Maximal number of shrunk values that can be pulled from the resulting arbitrary

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/limitShrink.html#limitshrinkt)>

  Create another arbitrary with limited number of shrink values

  #### Example

  ```
  const dataGenerator: Arbitrary<string> = ...;
  const limitedShrinkableDataGenerator: Arbitrary<string> = fc.limitShrink(dataGenerator, 10);
  // up to 10 shrunk values could be extracted from the resulting arbitrary
  Copy
  ```

  NOTE: Although limiting the shrinking capabilities can speed up your CI when failures occur, we do not recommend this approach.
  Instead, if you want to reduce the shrinking time for automated jobs or local runs, consider using `endOnFailure` or `interruptAfterTimeLimit`.

  #### Remarks

  Since 3.20.0

  + Defined in [packages/fast-check/src/arbitrary/limitShrink.ts:24](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/limitShrink.ts#L24)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
