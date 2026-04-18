---
title: "func | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/func"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [func](https://fast-check.dev/api-reference/functions/func.html)

# Function func

* func<[TArgs](https://fast-check.dev/api-reference/functions/func.html#functargs) extends any[], [TOut](https://fast-check.dev/api-reference/functions/func.html#functout)>(
      arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[TOut](https://fast-check.dev/api-reference/functions/func.html#functout)>,
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<(...args: [TArgs](https://fast-check.dev/api-reference/functions/func.html#functargs)) => [TOut](https://fast-check.dev/api-reference/functions/func.html#functout)>

  For pure functions

  #### Type Parameters

  + TArgs extends any[]
  + TOut

  #### Parameters

  + arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[TOut](https://fast-check.dev/api-reference/functions/func.html#functout)>

    Arbitrary responsible to produce the values

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<(...args: [TArgs](https://fast-check.dev/api-reference/functions/func.html#functargs)) => [TOut](https://fast-check.dev/api-reference/functions/func.html#functout)>

  #### Remarks

  Since 1.6.0

  + Defined in [packages/fast-check/src/arbitrary/func.ts:23](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/func.ts#L23)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
