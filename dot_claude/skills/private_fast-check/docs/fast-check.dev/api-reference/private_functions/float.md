---
title: "float | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/float"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [float](https://fast-check.dev/api-reference/functions/float.html)

# Function float

* float(constraints?: [FloatConstraints](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<number>

  For 32-bit floating point numbers:

  + sign: 1 bit
  + significand: 23 bits
  + exponent: 8 bits

  The smallest non-zero value (in absolute value) that can be represented by such float is: 2 \*\* -126 \* 2 \*\* -23.
  And the largest one is: 2 \*\* 127 \* (1 + (2 \*\* 23 - 1) / 2 \*\* 23).

  #### Parameters

  + constraints: [FloatConstraints](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html) = {}

    Constraints to apply when building instances (since 2.8.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<number>

  #### Remarks

  Since 0.0.6

  + Defined in [packages/fast-check/src/arbitrary/float.ts:154](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/float.ts#L154)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
