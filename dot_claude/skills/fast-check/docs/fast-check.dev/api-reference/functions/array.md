---
title: "array | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/array"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [array](https://fast-check.dev/api-reference/functions/array.html)

# Function array

* array<[T](https://fast-check.dev/api-reference/functions/array.html#arrayt)>(arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/array.html#arrayt)>, constraints?: [ArrayConstraints](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/array.html#arrayt)[]>

  For arrays of values coming from `arb`

  #### Type Parameters

  + T

  #### Parameters

  + arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/array.html#arrayt)>

    Arbitrary used to generate the values inside the array
  + constraints: [ArrayConstraints](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html) = {}

    Constraints to apply when building instances (since 2.4.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/array.html#arrayt)[]>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/arbitrary/array.ts:78](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/array.ts#L78)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
