---
title: "compareFunc | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/compareFunc"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [compareFunc](https://fast-check.dev/api-reference/functions/compareFunc.html)

# Function compareFunc

* compareFunc<[T](https://fast-check.dev/api-reference/functions/compareFunc.html#comparefunct)>(): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<(a: [T](https://fast-check.dev/api-reference/functions/compareFunc.html#comparefunct), b: [T](https://fast-check.dev/api-reference/functions/compareFunc.html#comparefunct)) => number>

  For comparison functions

  A comparison function returns:

  + negative value whenever `a < b`
  + positive value whenever `a > b`
  + zero whenever `a` and `b` are equivalent

  Comparison functions are transitive: `a < b and b < c => a < c`

  They also satisfy: `a < b <=> b > a` and `a = b <=> b = a`

  #### Type Parameters

  + T

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<(a: [T](https://fast-check.dev/api-reference/functions/compareFunc.html#comparefunct), b: [T](https://fast-check.dev/api-reference/functions/compareFunc.html#comparefunct)) => number>

  #### Remarks

  Since 1.6.0

  + Defined in [packages/fast-check/src/arbitrary/compareFunc.ts:21](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/compareFunc.ts#L21)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
