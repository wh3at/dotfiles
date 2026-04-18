---
title: "sparseArray | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/sparseArray"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [sparseArray](https://fast-check.dev/api-reference/functions/sparseArray.html)

# Function sparseArray

* sparseArray<[T](https://fast-check.dev/api-reference/functions/sparseArray.html#sparsearrayt)>(
      arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/sparseArray.html#sparsearrayt)>,
      constraints?: [SparseArrayConstraints](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html),
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/sparseArray.html#sparsearrayt)[]>

  For sparse arrays of values coming from `arb`

  #### Type Parameters

  + T

  #### Parameters

  + arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/sparseArray.html#sparsearrayt)>

    Arbitrary used to generate the values inside the sparse array
  + constraints: [SparseArrayConstraints](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html) = {}

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/sparseArray.html#sparsearrayt)[]>

  #### Remarks

  Since 2.13.0

  + Defined in [packages/fast-check/src/arbitrary/sparseArray.ts:95](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/sparseArray.ts#L95)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
