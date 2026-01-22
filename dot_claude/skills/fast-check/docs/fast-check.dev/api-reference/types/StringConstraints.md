---
title: "StringConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/StringConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [StringConstraints](https://fast-check.dev/api-reference/types/StringConstraints.html)

# Type Alias StringConstraints

StringConstraints: [StringSharedConstraints](https://fast-check.dev/api-reference/interfaces/StringSharedConstraints.html) & {
    unit?:
        | "grapheme"
        | "grapheme-composite"
        | "grapheme-ascii"
        | "binary"
        | "binary-ascii"
        | [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>;
}

Constraints to be applied on arbitrary [string](https://fast-check.dev/api-reference/functions/string.html)

#### Type Declaration

* ##### `Optional`unit?:     | "grapheme"     | "grapheme-composite"     | "grapheme-ascii"     | "binary"     | "binary-ascii"     | [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  A string results from the join between several unitary strings produced by the Arbitrary instance defined by `unit`.
  The `minLength` and `maxLength` refers to the number of these units composing the string. In other words it does not have to be confound with `.length` on an instance of string.

  A unit can either be a fully custom Arbitrary or one of the pre-defined options:

  + `'grapheme'` - Any printable grapheme as defined by the Unicode standard. This unit includes graphemes that may:
    - Span multiple code points (e.g., `'\u{0061}\u{0300}'`)
    - Consist of multiple characters (e.g., `'\u{1f431}'`)
    - Include non-European and non-ASCII characters.
    - **Note:** Graphemes produced by this unit are designed to remain visually distinct when joined together.
    - **Note:** We are relying on the specifications of Unicode 15.
  + `'grapheme-composite'` - Any printable grapheme limited to a single code point. This option produces graphemes limited to a single code point.
    - **Note:** Graphemes produced by this unit are designed to remain visually distinct when joined together.
    - **Note:** We are relying on the specifications of Unicode 15.
  + `'grapheme-ascii'` - Any printable ASCII character.
  + `'binary'` - Any possible code point (except half surrogate pairs), regardless of how it may combine with subsequent code points in the produced string. This unit produces a single code point within the full Unicode range (0000-10FFFF).
  + `'binary-ascii'` - Any possible ASCII character, including control characters. This unit produces any code point in the range 0000-00FF.

  #### Default Value

  ```
  'grapheme-ascii'
  Copy
  ```

  #### Remarks

  Since 3.22.0

#### Remarks

Since 3.22.0

* Defined in [packages/fast-check/src/arbitrary/string.ts:15](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/string.ts#L15)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
