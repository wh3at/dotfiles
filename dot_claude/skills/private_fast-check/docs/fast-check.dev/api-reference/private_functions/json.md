---
title: "json | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/json"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [json](https://fast-check.dev/api-reference/functions/json.html)

# Function json

* json(constraints?: [JsonSharedConstraints](https://fast-check.dev/api-reference/interfaces/JsonSharedConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  For any JSON strings

  Keys and string values rely on [string](https://fast-check.dev/api-reference/functions/string.html)

  #### Parameters

  + constraints: [JsonSharedConstraints](https://fast-check.dev/api-reference/interfaces/JsonSharedConstraints.html) = {}

    Constraints to be applied onto the generated instance (since 2.5.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  #### Remarks

  Since 0.0.7

  + Defined in [packages/fast-check/src/arbitrary/json.ts:20](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/json.ts#L20)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
