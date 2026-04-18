---
title: "OneOfConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/OneOfConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [OneOfConstraints](https://fast-check.dev/api-reference/types/OneOfConstraints.html)

# Type Alias OneOfConstraints

Constraints to be applied on [oneof](https://fast-check.dev/api-reference/functions/oneof.html)

#### Remarks

Since 2.14.0

type OneOfConstraints = {
    [depthIdentifier](https://fast-check.dev/api-reference/types/OneOfConstraints.html#depthidentifier)?: [DepthIdentifier](https://fast-check.dev/api-reference/types/DepthIdentifier.html) | string;
    [depthSize](https://fast-check.dev/api-reference/types/OneOfConstraints.html#depthsize)?: [DepthSize](https://fast-check.dev/api-reference/types/DepthSize.html);
    [maxDepth](https://fast-check.dev/api-reference/types/OneOfConstraints.html#maxdepth)?: number;
    [withCrossShrink](https://fast-check.dev/api-reference/types/OneOfConstraints.html#withcrossshrink)?: boolean;
}

* Defined in [packages/fast-check/src/arbitrary/oneof.ts:51](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/oneof.ts#L51)

##### Index

### Properties

[depthIdentifier?](https://fast-check.dev/api-reference/types/OneOfConstraints.html#depthidentifier)
[depthSize?](https://fast-check.dev/api-reference/types/OneOfConstraints.html#depthsize)
[maxDepth?](https://fast-check.dev/api-reference/types/OneOfConstraints.html#maxdepth)
[withCrossShrink?](https://fast-check.dev/api-reference/types/OneOfConstraints.html#withcrossshrink)

## Properties

### `Optional`depthIdentifier

depthIdentifier?: [DepthIdentifier](https://fast-check.dev/api-reference/types/DepthIdentifier.html) | string

Depth identifier can be used to share the current depth between several instances.

By default, if not specified, each instance of oneof will have its own depth.
In other words: you can have depth=1 in one while you have depth=100 in another one.

#### Remarks

Since 2.14.0

* Defined in [packages/fast-check/src/arbitrary/oneof.ts:87](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/oneof.ts#L87)

### `Optional`depthSize

depthSize?: [DepthSize](https://fast-check.dev/api-reference/types/DepthSize.html)

While going deeper and deeper within a recursive structure (see [letrec](https://fast-check.dev/api-reference/functions/letrec.html)),
this factor will be used to increase the probability to generate instances
of the first passed arbitrary.

#### Remarks

Since 2.14.0

* Defined in [packages/fast-check/src/arbitrary/oneof.ts:70](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/oneof.ts#L70)

### `Optional`maxDepth

maxDepth?: number

Maximal authorized depth.
Once this depth has been reached only the first arbitrary will be used.

#### Default Value

Number.POSITIVE\_INFINITY — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 2.14.0

* Defined in [packages/fast-check/src/arbitrary/oneof.ts:78](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/oneof.ts#L78)

### `Optional`withCrossShrink

withCrossShrink?: boolean

When set to true, the shrinker of oneof will try to check if the first arbitrary
could have been used to discover an issue. It allows to shrink trees.

Warning: First arbitrary must be the one resulting in the smallest structures
for usages in deep tree-like structures.

#### Default Value

```
false
Copy
```

#### Remarks

Since 2.14.0

* Defined in [packages/fast-check/src/arbitrary/oneof.ts:62](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/oneof.ts#L62)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[depthIdentifier](https://fast-check.dev/api-reference/types/OneOfConstraints.html#depthidentifier)[depthSize](https://fast-check.dev/api-reference/types/OneOfConstraints.html#depthsize)[maxDepth](https://fast-check.dev/api-reference/types/OneOfConstraints.html#maxdepth)[withCrossShrink](https://fast-check.dev/api-reference/types/OneOfConstraints.html#withcrossshrink)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
