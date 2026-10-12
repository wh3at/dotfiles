---
title: "SparseArrayConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [SparseArrayConstraints](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html)

# Interface SparseArrayConstraints

Constraints to be applied on [sparseArray](https://fast-check.dev/api-reference/functions/sparseArray.html)

#### Remarks

Since 2.13.0

interface SparseArrayConstraints {
    [depthIdentifier](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#depthidentifier)?: string | [DepthIdentifier](https://fast-check.dev/api-reference/types/DepthIdentifier.html);
    [maxLength](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#maxlength)?: number;
    [maxNumElements](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#maxnumelements)?: number;
    [minNumElements](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#minnumelements)?: number;
    [noTrailingHole](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#notrailinghole)?: boolean;
    [size](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#size)?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html);
}

* Defined in [packages/fast-check/src/arbitrary/sparseArray.ts:23](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/sparseArray.ts#L23)

##### Index

### Properties

[depthIdentifier?](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#depthidentifier)
[maxLength?](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#maxlength)
[maxNumElements?](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#maxnumelements)
[minNumElements?](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#minnumelements)
[noTrailingHole?](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#notrailinghole)
[size?](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#size)

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

* Defined in [packages/fast-check/src/arbitrary/sparseArray.ts:66](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/sparseArray.ts#L66)

### `Optional`maxLength

maxLength?: number

Upper bound of the generated array size (maximal size: 4294967295)

#### Default Value

0x7fffffff — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 2.13.0

* Defined in [packages/fast-check/src/arbitrary/sparseArray.ts:29](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/sparseArray.ts#L29)

### `Optional`maxNumElements

maxNumElements?: number

Upper bound of the number of non-hole elements

#### Default Value

0x7fffffff — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 2.13.0

* Defined in [packages/fast-check/src/arbitrary/sparseArray.ts:41](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/sparseArray.ts#L41)

### `Optional`minNumElements

minNumElements?: number

Lower bound of the number of non-hole elements

#### Default Value

```
0
Copy
```

#### Remarks

Since 2.13.0

* Defined in [packages/fast-check/src/arbitrary/sparseArray.ts:35](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/sparseArray.ts#L35)

### `Optional`noTrailingHole

noTrailingHole?: boolean

When enabled, all generated arrays will either be the empty array or end by a non-hole

#### Default Value

```
false
Copy
```

#### Remarks

Since 2.13.0

* Defined in [packages/fast-check/src/arbitrary/sparseArray.ts:47](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/sparseArray.ts#L47)

### `Optional`size

size?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html)

Define how large the generated values should be (at max)

#### Remarks

Since 2.22.0

* Defined in [packages/fast-check/src/arbitrary/sparseArray.ts:52](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/sparseArray.ts#L52)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[depthIdentifier](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#depthidentifier)[maxLength](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#maxlength)[maxNumElements](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#maxnumelements)[minNumElements](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#minnumelements)[noTrailingHole](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#notrailinghole)[size](https://fast-check.dev/api-reference/interfaces/SparseArrayConstraints.html#size)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
