---
title: "constantFrom | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/constantFrom"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [constantFrom](https://fast-check.dev/api-reference/functions/constantFrom.html)

# Function constantFrom

* constantFrom<const [T](https://fast-check.dev/api-reference/functions/constantFrom.html#constantfromt) = never>(...values: [T](https://fast-check.dev/api-reference/functions/constantFrom.html#constantfromt)[]): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/constantFrom.html#constantfromt)>

  For one `...values` values - all equiprobable

  **WARNING**: It expects at least one value, otherwise it should throw

  #### Type Parameters

  + const T = never

  #### Parameters

  + ...values: [T](https://fast-check.dev/api-reference/functions/constantFrom.html#constantfromt)[]

    Constant values to be produced (all values shrink to the first one)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/constantFrom.html#constantfromt)>

  #### Remarks

  Since 0.0.12

  + Defined in [packages/fast-check/src/arbitrary/constantFrom.ts:19](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/constantFrom.ts#L19)
* constantFrom<[TArgs](https://fast-check.dev/api-reference/functions/constantFrom.html#constantfromtargs) extends any[] | [any]>(
      ...values: [TArgs](https://fast-check.dev/api-reference/functions/constantFrom.html#constantfromtargs),
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[TArgs](https://fast-check.dev/api-reference/functions/constantFrom.html#constantfromtargs)[number]>

  For one `...values` values - all equiprobable

  **WARNING**: It expects at least one value, otherwise it should throw

  #### Type Parameters

  + TArgs extends any[] | [any]

  #### Parameters

  + ...values: [TArgs](https://fast-check.dev/api-reference/functions/constantFrom.html#constantfromtargs)

    Constant values to be produced (all values shrink to the first one)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[TArgs](https://fast-check.dev/api-reference/functions/constantFrom.html#constantfromtargs)[number]>

  #### Remarks

  Since 0.0.12

  + Defined in [packages/fast-check/src/arbitrary/constantFrom.ts:31](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/constantFrom.ts#L31)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
