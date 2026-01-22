---
title: "double | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/double"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [double](https://fast-check.dev/api-reference/functions/double.html)

# Function double

* double(constraints?: [DoubleConstraints](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<number>

  For 64-bit floating point numbers:

  + sign: 1 bit
  + significand: 52 bits
  + exponent: 11 bits

  #### Parameters

  + constraints: [DoubleConstraints](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html) = {}

    Constraints to apply when building instances (since 2.8.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<number>

  #### Remarks

  Since 0.0.6

  + Defined in [packages/fast-check/src/arbitrary/double.ts:152](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/double.ts#L152)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
