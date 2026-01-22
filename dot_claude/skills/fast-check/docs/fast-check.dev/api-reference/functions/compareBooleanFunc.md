---
title: "compareBooleanFunc | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/compareBooleanFunc"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [compareBooleanFunc](https://fast-check.dev/api-reference/functions/compareBooleanFunc.html)

# Function compareBooleanFunc

* compareBooleanFunc<[T](https://fast-check.dev/api-reference/functions/compareBooleanFunc.html#comparebooleanfunct)>(): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<(a: [T](https://fast-check.dev/api-reference/functions/compareBooleanFunc.html#comparebooleanfunct), b: [T](https://fast-check.dev/api-reference/functions/compareBooleanFunc.html#comparebooleanfunct)) => boolean>

  For comparison boolean functions

  A comparison boolean function returns:

  + `true` whenever `a < b`
  + `false` otherwise (ie. `a = b` or `a > b`)

  #### Type Parameters

  + T

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<(a: [T](https://fast-check.dev/api-reference/functions/compareBooleanFunc.html#comparebooleanfunct), b: [T](https://fast-check.dev/api-reference/functions/compareBooleanFunc.html#comparebooleanfunct)) => boolean>

  #### Remarks

  Since 1.6.0

  + Defined in [packages/fast-check/src/arbitrary/compareBooleanFunc.ts:16](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/compareBooleanFunc.ts#L16)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
