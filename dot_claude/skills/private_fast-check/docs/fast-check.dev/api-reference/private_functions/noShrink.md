---
title: "noShrink | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/noShrink"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [noShrink](https://fast-check.dev/api-reference/functions/noShrink.html)

# Function noShrink

* noShrink<[T](https://fast-check.dev/api-reference/functions/noShrink.html#noshrinkt)>(arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/noShrink.html#noshrinkt)>): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/noShrink.html#noshrinkt)>

  Build an arbitrary without shrinking capabilities.

  NOTE:
  In most cases, users should avoid disabling shrinking capabilities.
  If the concern is the shrinking process taking too long or being unnecessary in CI environments,
  consider using alternatives like `endOnFailure` or `interruptAfterTimeLimit` instead.

  #### Type Parameters

  + T

  #### Parameters

  + arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/noShrink.html#noshrinkt)>

    The original arbitrary used for generating values. This arbitrary remains unchanged, but its shrinking capabilities will not be included in the new arbitrary.

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/noShrink.html#noshrinkt)>

  #### Remarks

  Since 3.20.0

  + Defined in [packages/fast-check/src/arbitrary/noShrink.ts:37](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/noShrink.ts#L37)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
