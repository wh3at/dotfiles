---
title: "noBias | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/noBias"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [noBias](https://fast-check.dev/api-reference/functions/noBias.html)

# Function noBias

* noBias<[T](https://fast-check.dev/api-reference/functions/noBias.html#nobiast)>(arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/noBias.html#nobiast)>): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/noBias.html#nobiast)>

  Build an arbitrary without any bias.

  The produced instance wraps the source one and ensures the bias factor will always be passed to undefined meaning bias will be deactivated.
  All the rest stays unchanged.

  #### Type Parameters

  + T

  #### Parameters

  + arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/noBias.html#nobiast)>

    The original arbitrary used for generating values. This arbitrary remains unchanged.

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/noBias.html#nobiast)>

  #### Remarks

  Since 3.20.0

  + Defined in [packages/fast-check/src/arbitrary/noBias.ts:35](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/noBias.ts#L35)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
