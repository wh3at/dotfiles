---
title: "stringMatching | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/stringMatching"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [stringMatching](https://fast-check.dev/api-reference/functions/stringMatching.html)

# Function stringMatching

* stringMatching(
      regex: RegExp,
      constraints?: [StringMatchingConstraints](https://fast-check.dev/api-reference/types/StringMatchingConstraints.html),
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  For strings matching the provided regex

  #### Parameters

  + regex: RegExp

    Arbitrary able to generate random strings (possibly multiple characters)
  + constraints: [StringMatchingConstraints](https://fast-check.dev/api-reference/types/StringMatchingConstraints.html) = {}

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  #### Remarks

  Since 3.10.0

  + Defined in [packages/fast-check/src/arbitrary/stringMatching.ts:207](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/stringMatching.ts#L207)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
