---
title: "anything | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/anything"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [anything](https://fast-check.dev/api-reference/functions/anything.html)

# Function anything

* anything(): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<unknown>

  For any type of values

  You may use [sample](https://fast-check.dev/api-reference/functions/sample.html) to preview the values that will be generated

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<unknown>

  #### Example

  ```
  null, undefined, 42, 6.5, 'Hello', {}, {k: [{}, 1, 2]}
  Copy
  ```

  #### Remarks

  Since 0.0.7

  + Defined in [packages/fast-check/src/arbitrary/anything.ts:21](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/anything.ts#L21)
* anything(constraints: [ObjectConstraints](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<unknown>

  For any type of values following the constraints defined by `settings`

  You may use [sample](https://fast-check.dev/api-reference/functions/sample.html) to preview the values that will be generated

  #### Parameters

  + constraints: [ObjectConstraints](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html)

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<unknown>

  #### Example

  ```
  null, undefined, 42, 6.5, 'Hello', {}, {k: [{}, 1, 2]}
  Copy
  ```

  #### Example

  ```
  // Using custom settings
  fc.anything({
      key: fc.string(),
      values: [fc.integer(10,20), fc.constant(42)],
      maxDepth: 2
  });
  // Can build entries such as:
  // - 19
  // - [{"2":12,"k":15,"A":42}]
  // - {"4":[19,13,14,14,42,11,20,11],"6":42,"7":16,"L":10,"'":[20,11],"e":[42,20,42,14,13,17]}
  // - [42,42,42]...
  Copy
  ```

  #### Remarks

  Since 0.0.7

  + Defined in [packages/fast-check/src/arbitrary/anything.ts:52](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/anything.ts#L52)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
