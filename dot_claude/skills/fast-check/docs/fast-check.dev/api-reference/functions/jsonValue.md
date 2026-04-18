---
title: "jsonValue | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/jsonValue"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [jsonValue](https://fast-check.dev/api-reference/functions/jsonValue.html)

# Function jsonValue

* jsonValue(constraints?: [JsonSharedConstraints](https://fast-check.dev/api-reference/interfaces/JsonSharedConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[JsonValue](https://fast-check.dev/api-reference/types/JsonValue.html)>

  For any JSON compliant values

  Keys and string values rely on [string](https://fast-check.dev/api-reference/functions/string.html)

  As `JSON.parse` preserves `-0`, `jsonValue` can also have `-0` as a value.
  `jsonValue` must be seen as: any value that could have been built by doing a `JSON.parse` on a given string.

  #### Parameters

  + constraints: [JsonSharedConstraints](https://fast-check.dev/api-reference/interfaces/JsonSharedConstraints.html) = {}

    Constraints to be applied onto the generated instance

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[JsonValue](https://fast-check.dev/api-reference/types/JsonValue.html)>

  #### Remarks

  Since 2.20.0

  + Defined in [packages/fast-check/src/arbitrary/jsonValue.ts:22](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/jsonValue.ts#L22)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
