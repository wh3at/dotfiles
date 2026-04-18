---
title: "map | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/map"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [map](https://fast-check.dev/api-reference/functions/map.html)

# Function map

* map<[K](https://fast-check.dev/api-reference/functions/map.html#mapk), [V](https://fast-check.dev/api-reference/functions/map.html#mapv)>(
      keyArb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[K](https://fast-check.dev/api-reference/functions/map.html#mapk)>,
      valueArb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[V](https://fast-check.dev/api-reference/functions/map.html#mapv)>,
      constraints?: [MapConstraints](https://fast-check.dev/api-reference/interfaces/MapConstraints.html),
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Map<[K](https://fast-check.dev/api-reference/functions/map.html#mapk), [V](https://fast-check.dev/api-reference/functions/map.html#mapv)>>

  For Maps with keys produced by `keyArb` and values from `valueArb`

  #### Type Parameters

  + K
  + V

  #### Parameters

  + keyArb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[K](https://fast-check.dev/api-reference/functions/map.html#mapk)>

    Arbitrary used to generate the keys of the Map
  + valueArb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[V](https://fast-check.dev/api-reference/functions/map.html#mapv)>

    Arbitrary used to generate the values of the Map
  + constraints: [MapConstraints](https://fast-check.dev/api-reference/interfaces/MapConstraints.html) = {}

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Map<[K](https://fast-check.dev/api-reference/functions/map.html#mapk), [V](https://fast-check.dev/api-reference/functions/map.html#mapv)>>

  #### Remarks

  Since 4.4.0

  + Defined in [packages/fast-check/src/arbitrary/map.ts:57](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/map.ts#L57)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
