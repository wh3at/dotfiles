---
title: "set | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/set"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [set](https://fast-check.dev/api-reference/functions/set.html)

# Function set

* set<[T](https://fast-check.dev/api-reference/functions/set.html#sett)>(arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/set.html#sett)>, constraints?: [SetConstraints](https://fast-check.dev/api-reference/types/SetConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Set<[T](https://fast-check.dev/api-reference/functions/set.html#sett)>>

  For sets of values coming from `arb`

  All the values in the set are unique. Comparison of values relies on `SameValueZero`
  which is the same comparison algorithm used by `Set`.

  #### Type Parameters

  + T

  #### Parameters

  + arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/set.html#sett)>

    Arbitrary used to generate the values inside the set
  + constraints: [SetConstraints](https://fast-check.dev/api-reference/types/SetConstraints.html) = {}

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Set<[T](https://fast-check.dev/api-reference/functions/set.html#sett)>>

  #### Remarks

  Since 4.4.0

  + Defined in [packages/fast-check/src/arbitrary/set.ts:58](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/set.ts#L58)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
