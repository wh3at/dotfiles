---
title: "object | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/object"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [object](https://fast-check.dev/api-reference/functions/object.html)

# Function object

* object(): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Record<string, unknown>>

  For any objects

  You may use [sample](https://fast-check.dev/api-reference/functions/sample.html) to preview the values that will be generated

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Record<string, unknown>>

  #### Example

  ```
  {}, {k: [{}, 1, 2]}
  Copy
  ```

  #### Remarks

  Since 0.0.7

  + Defined in [packages/fast-check/src/arbitrary/object.ts:31](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/object.ts#L31)
* object(constraints: [ObjectConstraints](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Record<string, unknown>>

  For any objects following the constraints defined by `settings`

  You may use [sample](https://fast-check.dev/api-reference/functions/sample.html) to preview the values that will be generated

  #### Parameters

  + constraints: [ObjectConstraints](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html)

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Record<string, unknown>>

  #### Example

  ```
  {}, {k: [{}, 1, 2]}
  Copy
  ```

  #### Remarks

  Since 0.0.7

  + Defined in [packages/fast-check/src/arbitrary/object.ts:47](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/object.ts#L47)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
