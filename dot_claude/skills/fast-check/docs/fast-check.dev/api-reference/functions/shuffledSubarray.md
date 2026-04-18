---
title: "shuffledSubarray | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/shuffledSubarray"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [shuffledSubarray](https://fast-check.dev/api-reference/functions/shuffledSubarray.html)

# Function shuffledSubarray

* shuffledSubarray<[T](https://fast-check.dev/api-reference/functions/shuffledSubarray.html#shuffledsubarrayt)>(
      originalArray: [T](https://fast-check.dev/api-reference/functions/shuffledSubarray.html#shuffledsubarrayt)[],
      constraints?: [ShuffledSubarrayConstraints](https://fast-check.dev/api-reference/interfaces/ShuffledSubarrayConstraints.html),
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/shuffledSubarray.html#shuffledsubarrayt)[]>

  For subarrays of `originalArray`

  #### Type Parameters

  + T

  #### Parameters

  + originalArray: [T](https://fast-check.dev/api-reference/functions/shuffledSubarray.html#shuffledsubarrayt)[]

    Original array
  + constraints: [ShuffledSubarrayConstraints](https://fast-check.dev/api-reference/interfaces/ShuffledSubarrayConstraints.html) = {}

    Constraints to apply when building instances (since 2.4.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/shuffledSubarray.html#shuffledsubarrayt)[]>

  #### Remarks

  Since 1.5.0

  + Defined in [packages/fast-check/src/arbitrary/shuffledSubarray.ts:33](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/shuffledSubarray.ts#L33)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
