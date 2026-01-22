---
title: "OptionConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/OptionConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [OptionConstraints](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html)

# Interface OptionConstraints<TNil>

Constraints to be applied on [option](https://fast-check.dev/api-reference/functions/option.html)

#### Remarks

Since 2.2.0

interface OptionConstraints<[TNil](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#tnil) = null> {
    [depthIdentifier](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#depthidentifier)?: string | [DepthIdentifier](https://fast-check.dev/api-reference/types/DepthIdentifier.html);
    [depthSize](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#depthsize)?: [DepthSize](https://fast-check.dev/api-reference/types/DepthSize.html);
    [freq](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#freq)?: number;
    [maxDepth](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#maxdepth)?: number;
    [nil](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#nil)?: [TNil](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#tnil);
}

#### Type Parameters

* TNil = null

* Defined in [packages/fast-check/src/arbitrary/option.ts:14](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/option.ts#L14)

##### Index

### Properties

[depthIdentifier?](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#depthidentifier)
[depthSize?](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#depthsize)
[freq?](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#freq)
[maxDepth?](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#maxdepth)
[nil?](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#nil)

## Properties

### `Optional`depthIdentifier

depthIdentifier?: string | [DepthIdentifier](https://fast-check.dev/api-reference/types/DepthIdentifier.html)

Depth identifier can be used to share the current depth between several instances.

By default, if not specified, each instance of option will have its own depth.
In other words: you can have depth=1 in one while you have depth=100 in another one.

#### Remarks

Since 2.14.0

* Defined in [packages/fast-check/src/arbitrary/option.ts:48](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/option.ts#L48)

### `Optional`depthSize

depthSize?: [DepthSize](https://fast-check.dev/api-reference/types/DepthSize.html)

While going deeper and deeper within a recursive structure (see [letrec](https://fast-check.dev/api-reference/functions/letrec.html)),
this factor will be used to increase the probability to generate nil.

#### Remarks

Since 2.14.0

* Defined in [packages/fast-check/src/arbitrary/option.ts:33](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/option.ts#L33)

### `Optional`freq

freq?: number

The probability to build a nil value is of `1 / freq`.

#### Default Value

```
6
Copy
```

#### Remarks

Since 1.17.0

* Defined in [packages/fast-check/src/arbitrary/option.ts:20](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/option.ts#L20)

### `Optional`maxDepth

maxDepth?: number

Maximal authorized depth. Once this depth has been reached only nil will be used.

#### Default Value

Number.POSITIVE\_INFINITY — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 2.14.0

* Defined in [packages/fast-check/src/arbitrary/option.ts:39](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/option.ts#L39)

### `Optional`nil

nil?: [TNil](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#tnil)

The nil value

#### Default Value

```
null
Copy
```

#### Remarks

Since 1.17.0

* Defined in [packages/fast-check/src/arbitrary/option.ts:26](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/option.ts#L26)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[depthIdentifier](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#depthidentifier)[depthSize](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#depthsize)[freq](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#freq)[maxDepth](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#maxdepth)[nil](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html#nil)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
