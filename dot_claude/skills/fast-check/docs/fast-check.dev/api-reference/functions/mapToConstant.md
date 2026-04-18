---
title: "mapToConstant | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/mapToConstant"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [mapToConstant](https://fast-check.dev/api-reference/functions/mapToConstant.html)

# Function mapToConstant

* mapToConstant<[T](https://fast-check.dev/api-reference/functions/mapToConstant.html#maptoconstantt)>(
      ...entries: { build: (idInGroup: number) => [T](https://fast-check.dev/api-reference/functions/mapToConstant.html#maptoconstantt); num: number }[],
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/mapToConstant.html#maptoconstantt)>

  Generate non-contiguous ranges of values
  by mapping integer values to constant

  #### Type Parameters

  + T

  #### Parameters

  + ...entries: { build: (idInGroup: number) => [T](https://fast-check.dev/api-reference/functions/mapToConstant.html#maptoconstantt); num: number }[]

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/mapToConstant.html#maptoconstantt)>

  #### Example

  ```
  // generate alphanumeric values (a-z0-9)
  mapToConstant(
    { num: 26, build: v => String.fromCharCode(v + 0x61) },
    { num: 10, build: v => String.fromCharCode(v + 0x30) },
  )
  Copy
  ```

  #### Remarks

  Since 1.14.0

  + Defined in [packages/fast-check/src/arbitrary/mapToConstant.ts:40](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/mapToConstant.ts#L40)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
