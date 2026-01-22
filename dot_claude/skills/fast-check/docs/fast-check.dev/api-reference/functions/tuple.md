---
title: "tuple | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/tuple"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [tuple](https://fast-check.dev/api-reference/functions/tuple.html)

# Function tuple

* tuple<[Ts](https://fast-check.dev/api-reference/functions/tuple.html#tuplets) extends unknown[]>(
      ...arbs: { [K in string | number | symbol]: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Ts](https://fast-check.dev/api-reference/functions/tuple.html#tuplets)[K<K>]> },
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Ts](https://fast-check.dev/api-reference/functions/tuple.html#tuplets)>

  For tuples produced using the provided `arbs`

  #### Type Parameters

  + Ts extends unknown[]

  #### Parameters

  + ...arbs: { [K in string | number | symbol]: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Ts](https://fast-check.dev/api-reference/functions/tuple.html#tuplets)[K<K>]> }

    Ordered list of arbitraries

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Ts](https://fast-check.dev/api-reference/functions/tuple.html#tuplets)>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/arbitrary/tuple.ts:12](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/tuple.ts#L12)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
