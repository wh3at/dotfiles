---
title: "Float64ArrayConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/Float64ArrayConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [Float64ArrayConstraints](https://fast-check.dev/api-reference/types/Float64ArrayConstraints.html)

# Type Alias Float64ArrayConstraints

Float64ArrayConstraints: {
    maxLength?: number;
    minLength?: number;
    size?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html);
} & [DoubleConstraints](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html)

Constraints to be applied on [float64Array](https://fast-check.dev/api-reference/functions/float64Array.html)

#### Type Declaration

* ##### `Optional`maxLength?: number

  Upper bound of the generated array size

  #### Default Value

  0x7fffffff — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

  #### Remarks

  Since 2.9.0
* ##### `Optional`minLength?: number

  Lower bound of the generated array size

  #### Default Value

  ```
  0
  Copy
  ```

  #### Remarks

  Since 2.9.0
* ##### `Optional`size?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html)

  Define how large the generated values should be (at max)

  #### Remarks

  Since 2.22.0

#### Remarks

Since 2.9.0

* Defined in [packages/fast-check/src/arbitrary/float64Array.ts:13](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/float64Array.ts#L13)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
