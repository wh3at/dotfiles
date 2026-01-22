---
title: "date | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/date"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [date](https://fast-check.dev/api-reference/functions/date.html)

# Function date

* date(constraints?: [DateConstraints](https://fast-check.dev/api-reference/interfaces/DateConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Date>

  For date between constraints.min or new Date(-8640000000000000) (included) and constraints.max or new Date(8640000000000000) (included)

  #### Parameters

  + constraints: [DateConstraints](https://fast-check.dev/api-reference/interfaces/DateConstraints.html) = {}

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Date>

  #### Remarks

  Since 1.17.0

  + Defined in [packages/fast-check/src/arbitrary/date.ts:47](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/date.ts#L47)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
