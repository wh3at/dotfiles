---
title: "StringSharedConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/StringSharedConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [StringSharedConstraints](https://fast-check.dev/api-reference/interfaces/StringSharedConstraints.html)

# Interface StringSharedConstraints

Constraints to be applied on arbitraries for strings

#### Remarks

Since 2.4.0

interface StringSharedConstraints {
    [maxLength](https://fast-check.dev/api-reference/interfaces/StringSharedConstraints.html#maxlength)?: number;
    [minLength](https://fast-check.dev/api-reference/interfaces/StringSharedConstraints.html#minlength)?: number;
    [size](https://fast-check.dev/api-reference/interfaces/StringSharedConstraints.html#size)?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html);
}

* Defined in [packages/fast-check/src/arbitrary/\_shared/StringSharedConstraints.ts:8](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_shared/StringSharedConstraints.ts#L8)

##### Index

### Properties

[maxLength?](https://fast-check.dev/api-reference/interfaces/StringSharedConstraints.html#maxlength)
[minLength?](https://fast-check.dev/api-reference/interfaces/StringSharedConstraints.html#minlength)
[size?](https://fast-check.dev/api-reference/interfaces/StringSharedConstraints.html#size)

## Properties

### `Optional`maxLength

maxLength?: number

Upper bound of the generated string length (included)

#### Default Value

0x7fffffff — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 2.4.0

* Defined in [packages/fast-check/src/arbitrary/\_shared/StringSharedConstraints.ts:20](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_shared/StringSharedConstraints.ts#L20)

### `Optional`minLength

minLength?: number

Lower bound of the generated string length (included)

#### Default Value

```
0
Copy
```

#### Remarks

Since 2.4.0

* Defined in [packages/fast-check/src/arbitrary/\_shared/StringSharedConstraints.ts:14](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_shared/StringSharedConstraints.ts#L14)

### `Optional`size

size?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html)

Define how large the generated values should be (at max)

#### Remarks

Since 2.22.0

* Defined in [packages/fast-check/src/arbitrary/\_shared/StringSharedConstraints.ts:25](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_shared/StringSharedConstraints.ts#L25)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[maxLength](https://fast-check.dev/api-reference/interfaces/StringSharedConstraints.html#maxlength)[minLength](https://fast-check.dev/api-reference/interfaces/StringSharedConstraints.html#minlength)[size](https://fast-check.dev/api-reference/interfaces/StringSharedConstraints.html#size)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
