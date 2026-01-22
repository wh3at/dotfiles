---
title: "IntArrayConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/IntArrayConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [IntArrayConstraints](https://fast-check.dev/api-reference/types/IntArrayConstraints.html)

# Type Alias IntArrayConstraints

Constraints to be applied on typed arrays for integer values

#### Remarks

Since 2.9.0

type IntArrayConstraints = {
    [max](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#max)?: number;
    [maxLength](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#maxlength)?: number;
    [min](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#min)?: number;
    [minLength](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#minlength)?: number;
    [size](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#size)?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html);
}

* Defined in [packages/fast-check/src/arbitrary/\_internals/builders/TypedIntArrayArbitraryBuilder.ts:47](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/builders/TypedIntArrayArbitraryBuilder.ts#L47)

##### Index

### Properties

[max?](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#max)
[maxLength?](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#maxlength)
[min?](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#min)
[minLength?](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#minlength)
[size?](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#size)

## Properties

### `Optional`max

max?: number

Upper bound for the generated int (included)

#### Default Value

```
highest possible value for this type
Copy
```

#### Remarks

Since 2.9.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/builders/TypedIntArrayArbitraryBuilder.ts:71](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/builders/TypedIntArrayArbitraryBuilder.ts#L71)

### `Optional`maxLength

maxLength?: number

Upper bound of the generated array size

#### Default Value

0x7fffffff — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 2.9.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/builders/TypedIntArrayArbitraryBuilder.ts:59](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/builders/TypedIntArrayArbitraryBuilder.ts#L59)

### `Optional`min

min?: number

Lower bound for the generated int (included)

#### Default Value

```
smallest possible value for this type
Copy
```

#### Remarks

Since 2.9.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/builders/TypedIntArrayArbitraryBuilder.ts:65](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/builders/TypedIntArrayArbitraryBuilder.ts#L65)

### `Optional`minLength

minLength?: number

Lower bound of the generated array size

#### Default Value

```
0
Copy
```

#### Remarks

Since 2.9.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/builders/TypedIntArrayArbitraryBuilder.ts:53](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/builders/TypedIntArrayArbitraryBuilder.ts#L53)

### `Optional`size

size?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html)

Define how large the generated values should be (at max)

#### Remarks

Since 2.22.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/builders/TypedIntArrayArbitraryBuilder.ts:76](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/builders/TypedIntArrayArbitraryBuilder.ts#L76)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[max](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#max)[maxLength](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#maxlength)[min](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#min)[minLength](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#minlength)[size](https://fast-check.dev/api-reference/types/IntArrayConstraints.html#size)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
