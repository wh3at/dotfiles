---
title: "BigIntArrayConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/BigIntArrayConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [BigIntArrayConstraints](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html)

# Type Alias BigIntArrayConstraints

Constraints to be applied on typed arrays for big int values

#### Remarks

Since 3.0.0

type BigIntArrayConstraints = {
    [max](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#max)?: bigint;
    [maxLength](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#maxlength)?: number;
    [min](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#min)?: bigint;
    [minLength](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#minlength)?: number;
    [size](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#size)?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html);
}

* Defined in [packages/fast-check/src/arbitrary/\_internals/builders/TypedIntArrayArbitraryBuilder.ts:84](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/builders/TypedIntArrayArbitraryBuilder.ts#L84)

##### Index

### Properties

[max?](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#max)
[maxLength?](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#maxlength)
[min?](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#min)
[minLength?](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#minlength)
[size?](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#size)

## Properties

### `Optional`max

max?: bigint

Upper bound for the generated int (included)

#### Default Value

```
highest possible value for this type
Copy
```

#### Remarks

Since 3.0.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/builders/TypedIntArrayArbitraryBuilder.ts:108](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/builders/TypedIntArrayArbitraryBuilder.ts#L108)

### `Optional`maxLength

maxLength?: number

Upper bound of the generated array size

#### Default Value

0x7fffffff — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 3.0.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/builders/TypedIntArrayArbitraryBuilder.ts:96](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/builders/TypedIntArrayArbitraryBuilder.ts#L96)

### `Optional`min

min?: bigint

Lower bound for the generated int (included)

#### Default Value

```
smallest possible value for this type
Copy
```

#### Remarks

Since 3.0.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/builders/TypedIntArrayArbitraryBuilder.ts:102](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/builders/TypedIntArrayArbitraryBuilder.ts#L102)

### `Optional`minLength

minLength?: number

Lower bound of the generated array size

#### Default Value

```
0
Copy
```

#### Remarks

Since 3.0.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/builders/TypedIntArrayArbitraryBuilder.ts:90](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/builders/TypedIntArrayArbitraryBuilder.ts#L90)

### `Optional`size

size?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html)

Define how large the generated values should be (at max)

#### Remarks

Since 3.0.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/builders/TypedIntArrayArbitraryBuilder.ts:113](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/builders/TypedIntArrayArbitraryBuilder.ts#L113)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[max](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#max)[maxLength](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#maxlength)[min](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#min)[minLength](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#minlength)[size](https://fast-check.dev/api-reference/types/BigIntArrayConstraints.html#size)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
