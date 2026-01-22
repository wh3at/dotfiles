---
title: "ArrayConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/ArrayConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [ArrayConstraints](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html)

# Interface ArrayConstraints

Constraints to be applied on [array](https://fast-check.dev/api-reference/functions/array.html)

#### Remarks

Since 2.4.0

interface ArrayConstraints {
    [depthIdentifier](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html#depthidentifier)?: string | [DepthIdentifier](https://fast-check.dev/api-reference/types/DepthIdentifier.html);
    [maxLength](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html#maxlength)?: number;
    [minLength](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html#minlength)?: number;
    [size](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html#size)?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html);
}

* Defined in [packages/fast-check/src/arbitrary/array.ts:15](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/array.ts#L15)

##### Index

### Properties

[depthIdentifier?](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html#depthidentifier)
[maxLength?](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html#maxlength)
[minLength?](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html#minlength)
[size?](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html#size)

## Properties

### `Optional`depthIdentifier

depthIdentifier?: string | [DepthIdentifier](https://fast-check.dev/api-reference/types/DepthIdentifier.html)

When receiving a depth identifier, the arbitrary will impact the depth
attached to it to avoid going too deep if it already generated lots of items.

In other words, if the number of generated values within the collection is large
then the generated items will tend to be less deep to avoid creating structures a lot
larger than expected.

For the moment, the depth is not taken into account to compute the number of items to
define for a precise generate call of the array. Just applied onto eligible items.

#### Remarks

Since 2.25.0

* Defined in [packages/fast-check/src/arbitrary/array.ts:51](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/array.ts#L51)

### `Optional`maxLength

maxLength?: number

Upper bound of the generated array size

#### Default Value

0x7fffffff — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 2.4.0

* Defined in [packages/fast-check/src/arbitrary/array.ts:27](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/array.ts#L27)

### `Optional`minLength

minLength?: number

Lower bound of the generated array size

#### Default Value

```
0
Copy
```

#### Remarks

Since 2.4.0

* Defined in [packages/fast-check/src/arbitrary/array.ts:21](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/array.ts#L21)

### `Optional`size

size?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html)

Define how large the generated values should be (at max)

When used in conjonction with `maxLength`, `size` will be used to define
the upper bound of the generated array size while `maxLength` will be used
to define and document the general maximal length allowed for this case.

#### Remarks

Since 2.22.0

* Defined in [packages/fast-check/src/arbitrary/array.ts:37](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/array.ts#L37)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[depthIdentifier](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html#depthidentifier)[maxLength](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html#maxlength)[minLength](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html#minlength)[size](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html#size)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
