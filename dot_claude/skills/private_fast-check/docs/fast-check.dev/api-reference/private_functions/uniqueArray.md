---
title: "uniqueArray | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/uniqueArray"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [uniqueArray](https://fast-check.dev/api-reference/functions/uniqueArray.html)

# Function uniqueArray

* uniqueArray<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt), [U](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayu)>(
      arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt)>,
      constraints?: [UniqueArrayConstraintsRecommended](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsRecommended.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt), [U](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayu)>,
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt)[]>

  For arrays of unique values coming from `arb`

  #### Type Parameters

  + T
  + U

  #### Parameters

  + arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt)>

    Arbitrary used to generate the values inside the array
  + `Optional`constraints: [UniqueArrayConstraintsRecommended](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsRecommended.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt), [U](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayu)>

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt)[]>

  #### Remarks

  Since 2.23.0

  + Defined in [packages/fast-check/src/arbitrary/uniqueArray.ts:179](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/uniqueArray.ts#L179)
* uniqueArray<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-1)>(
      arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-1)>,
      constraints: [UniqueArrayConstraintsCustomCompare](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompare.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-1)>,
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-1)[]>

  For arrays of unique values coming from `arb`

  #### Type Parameters

  + T

  #### Parameters

  + arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-1)>

    Arbitrary used to generate the values inside the array
  + constraints: [UniqueArrayConstraintsCustomCompare](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompare.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-1)>

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-1)[]>

  #### Remarks

  Since 2.23.0

  + Defined in [packages/fast-check/src/arbitrary/uniqueArray.ts:192](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/uniqueArray.ts#L192)
* uniqueArray<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-2), [U](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayu-1)>(
      arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-2)>,
      constraints: [UniqueArrayConstraintsCustomCompareSelect](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompareSelect.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-2), [U](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayu-1)>,
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-2)[]>

  For arrays of unique values coming from `arb`

  #### Type Parameters

  + T
  + U

  #### Parameters

  + arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-2)>

    Arbitrary used to generate the values inside the array
  + constraints: [UniqueArrayConstraintsCustomCompareSelect](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompareSelect.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-2), [U](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayu-1)>

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-2)[]>

  #### Remarks

  Since 2.23.0

  + Defined in [packages/fast-check/src/arbitrary/uniqueArray.ts:202](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/uniqueArray.ts#L202)
* uniqueArray<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-3), [U](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayu-2)>(
      arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-3)>,
      constraints: [UniqueArrayConstraints](https://fast-check.dev/api-reference/types/UniqueArrayConstraints.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-3), [U](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayu-2)>,
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-3)[]>

  For arrays of unique values coming from `arb`

  #### Type Parameters

  + T
  + U

  #### Parameters

  + arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-3)>

    Arbitrary used to generate the values inside the array
  + constraints: [UniqueArrayConstraints](https://fast-check.dev/api-reference/types/UniqueArrayConstraints.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-3), [U](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayu-2)>

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/uniqueArray.html#uniquearrayt-3)[]>

  #### Remarks

  Since 2.23.0

  + Defined in [packages/fast-check/src/arbitrary/uniqueArray.ts:215](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/uniqueArray.ts#L215)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
