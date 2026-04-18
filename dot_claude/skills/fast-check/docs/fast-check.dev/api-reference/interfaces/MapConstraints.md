---
title: "MapConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/MapConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [MapConstraints](https://fast-check.dev/api-reference/interfaces/MapConstraints.html)

# Interface MapConstraints

Constraints to be applied on [map](https://fast-check.dev/api-reference/functions/map.html)

#### Remarks

Since 4.4.0

interface MapConstraints {
    [depthIdentifier](https://fast-check.dev/api-reference/interfaces/MapConstraints.html#depthidentifier)?: string | [DepthIdentifier](https://fast-check.dev/api-reference/types/DepthIdentifier.html);
    [maxKeys](https://fast-check.dev/api-reference/interfaces/MapConstraints.html#maxkeys)?: number;
    [minKeys](https://fast-check.dev/api-reference/interfaces/MapConstraints.html#minkeys)?: number;
    [size](https://fast-check.dev/api-reference/interfaces/MapConstraints.html#size)?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html);
}

* Defined in [packages/fast-check/src/arbitrary/map.ts:18](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/map.ts#L18)

##### Index

### Properties

[depthIdentifier?](https://fast-check.dev/api-reference/interfaces/MapConstraints.html#depthidentifier)
[maxKeys?](https://fast-check.dev/api-reference/interfaces/MapConstraints.html#maxkeys)
[minKeys?](https://fast-check.dev/api-reference/interfaces/MapConstraints.html#minkeys)
[size?](https://fast-check.dev/api-reference/interfaces/MapConstraints.html#size)

## Properties

### `Optional`depthIdentifier

depthIdentifier?: string | [DepthIdentifier](https://fast-check.dev/api-reference/types/DepthIdentifier.html)

Depth identifier can be used to share the current depth between several instances.

By default, if not specified, each instance of map will have its own depth.
In other words: you can have depth=1 in one while you have depth=100 in another one.

#### Remarks

Since 4.4.0

* Defined in [packages/fast-check/src/arbitrary/map.ts:44](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/map.ts#L44)

### `Optional`maxKeys

maxKeys?: number

Upper bound for the number of entries defined into the generated instance

#### Default Value

```
0x7fffffff
Copy
```

#### Remarks

Since 4.4.0

* Defined in [packages/fast-check/src/arbitrary/map.ts:30](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/map.ts#L30)

### `Optional`minKeys

minKeys?: number

Lower bound for the number of entries defined into the generated instance

#### Default Value

```
0
Copy
```

#### Remarks

Since 4.4.0

* Defined in [packages/fast-check/src/arbitrary/map.ts:24](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/map.ts#L24)

### `Optional`size

size?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html)

Define how large the generated values should be (at max)

#### Remarks

Since 4.4.0

* Defined in [packages/fast-check/src/arbitrary/map.ts:35](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/map.ts#L35)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[depthIdentifier](https://fast-check.dev/api-reference/interfaces/MapConstraints.html#depthidentifier)[maxKeys](https://fast-check.dev/api-reference/interfaces/MapConstraints.html#maxkeys)[minKeys](https://fast-check.dev/api-reference/interfaces/MapConstraints.html#minkeys)[size](https://fast-check.dev/api-reference/interfaces/MapConstraints.html#size)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
