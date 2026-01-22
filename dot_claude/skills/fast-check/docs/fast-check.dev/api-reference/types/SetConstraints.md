---
title: "SetConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/SetConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [SetConstraints](https://fast-check.dev/api-reference/types/SetConstraints.html)

# Type Alias SetConstraints

Constraints to be applied on [set](https://fast-check.dev/api-reference/functions/set.html)

#### Remarks

Since 4.4.0

type SetConstraints = {
    [depthIdentifier](https://fast-check.dev/api-reference/types/SetConstraints.html#depthidentifier)?: [DepthIdentifier](https://fast-check.dev/api-reference/types/DepthIdentifier.html) | string;
    [maxLength](https://fast-check.dev/api-reference/types/SetConstraints.html#maxlength)?: number;
    [minLength](https://fast-check.dev/api-reference/types/SetConstraints.html#minlength)?: number;
    [size](https://fast-check.dev/api-reference/types/SetConstraints.html#size)?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html);
}

* Defined in [packages/fast-check/src/arbitrary/set.ts:12](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/set.ts#L12)

##### Index

### Properties

[depthIdentifier?](https://fast-check.dev/api-reference/types/SetConstraints.html#depthidentifier)
[maxLength?](https://fast-check.dev/api-reference/types/SetConstraints.html#maxlength)
[minLength?](https://fast-check.dev/api-reference/types/SetConstraints.html#minlength)
[size?](https://fast-check.dev/api-reference/types/SetConstraints.html#size)

## Properties

### `Optional`depthIdentifier

depthIdentifier?: [DepthIdentifier](https://fast-check.dev/api-reference/types/DepthIdentifier.html) | string

When receiving a depth identifier, the arbitrary will impact the depth
attached to it to avoid going too deep if it already generated lots of items.

In other words, if the number of generated values within the collection is large
then the generated items will tend to be less deep to avoid creating structures a lot
larger than expected.

For the moment, the depth is not taken into account to compute the number of items to
define for a precise generate call of the set. Just applied onto eligible items.

#### Remarks

Since 4.4.0

* Defined in [packages/fast-check/src/arbitrary/set.ts:43](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/set.ts#L43)

### `Optional`maxLength

maxLength?: number

Upper bound of the generated set size

#### Default Value

0x7fffffff — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 4.4.0

* Defined in [packages/fast-check/src/arbitrary/set.ts:24](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/set.ts#L24)

### `Optional`minLength

minLength?: number

Lower bound of the generated set size

#### Default Value

```
0
Copy
```

#### Remarks

Since 4.4.0

* Defined in [packages/fast-check/src/arbitrary/set.ts:18](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/set.ts#L18)

### `Optional`size

size?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html)

Define how large the generated values should be (at max)

#### Remarks

Since 4.4.0

* Defined in [packages/fast-check/src/arbitrary/set.ts:29](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/set.ts#L29)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[depthIdentifier](https://fast-check.dev/api-reference/types/SetConstraints.html#depthidentifier)[maxLength](https://fast-check.dev/api-reference/types/SetConstraints.html#maxlength)[minLength](https://fast-check.dev/api-reference/types/SetConstraints.html#minlength)[size](https://fast-check.dev/api-reference/types/SetConstraints.html#size)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
