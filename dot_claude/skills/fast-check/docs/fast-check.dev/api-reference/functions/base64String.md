---
title: "base64String | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/base64String"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [base64String](https://fast-check.dev/api-reference/functions/base64String.html)

# Function base64String

* base64String(constraints?: [StringSharedConstraints](https://fast-check.dev/api-reference/interfaces/StringSharedConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  For base64 strings

  A base64 string will always have a length multiple of 4 (padded with =)

  #### Parameters

  + constraints: [StringSharedConstraints](https://fast-check.dev/api-reference/interfaces/StringSharedConstraints.html) = {}

    Constraints to apply when building instances (since 2.4.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/arbitrary/base64String.ts:50](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/base64String.ts#L50)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
