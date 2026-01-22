---
title: "uuid | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/uuid"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [uuid](https://fast-check.dev/api-reference/functions/uuid.html)

# Function uuid

* uuid(constraints?: [UuidConstraints](https://fast-check.dev/api-reference/interfaces/UuidConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  For UUID from v1 to v5

  According to [RFC 4122](https://tools.ietf.org/html/rfc4122)

  No mixed case, only lower case digits (0-9a-f)

  #### Parameters

  + constraints: [UuidConstraints](https://fast-check.dev/api-reference/interfaces/UuidConstraints.html) = {}

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  #### Remarks

  Since 1.17.0

  + Defined in [packages/fast-check/src/arbitrary/uuid.ts:56](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/uuid.ts#L56)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
