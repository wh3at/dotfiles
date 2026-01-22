---
title: "DictionaryConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/DictionaryConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [DictionaryConstraints](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html)

# Interface DictionaryConstraints

Constraints to be applied on [dictionary](https://fast-check.dev/api-reference/functions/dictionary.html)

#### Remarks

Since 2.22.0

interface DictionaryConstraints {
    [depthIdentifier](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#depthidentifier)?: string | [DepthIdentifier](https://fast-check.dev/api-reference/types/DepthIdentifier.html);
    [maxKeys](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#maxkeys)?: number;
    [minKeys](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#minkeys)?: number;
    [noNullPrototype](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#nonullprototype)?: boolean;
    [size](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#size)?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html);
}

* Defined in [packages/fast-check/src/arbitrary/dictionary.ts:23](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/dictionary.ts#L23)

##### Index

### Properties

[depthIdentifier?](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#depthidentifier)
[maxKeys?](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#maxkeys)
[minKeys?](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#minkeys)
[noNullPrototype?](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#nonullprototype)
[size?](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#size)

## Properties

### `Optional`depthIdentifier

depthIdentifier?: string | [DepthIdentifier](https://fast-check.dev/api-reference/types/DepthIdentifier.html)

Depth identifier can be used to share the current depth between several instances.

By default, if not specified, each instance of dictionary will have its own depth.
In other words: you can have depth=1 in one while you have depth=100 in another one.

#### Remarks

Since 3.15.0

* Defined in [packages/fast-check/src/arbitrary/dictionary.ts:49](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/dictionary.ts#L49)

### `Optional`maxKeys

maxKeys?: number

Lower bound for the number of keys defined into the generated instance

#### Default Value

0x7fffffff — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 2.22.0

* Defined in [packages/fast-check/src/arbitrary/dictionary.ts:35](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/dictionary.ts#L35)

### `Optional`minKeys

minKeys?: number

Lower bound for the number of keys defined into the generated instance

#### Default Value

```
0
Copy
```

#### Remarks

Since 2.22.0

* Defined in [packages/fast-check/src/arbitrary/dictionary.ts:29](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/dictionary.ts#L29)

### `Optional`noNullPrototype

noNullPrototype?: boolean

Do not generate objects with null prototype

#### Default Value

```
false
Copy
```

#### Remarks

Since 3.13.0

* Defined in [packages/fast-check/src/arbitrary/dictionary.ts:55](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/dictionary.ts#L55)

### `Optional`size

size?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html)

Define how large the generated values should be (at max)

#### Remarks

Since 2.22.0

* Defined in [packages/fast-check/src/arbitrary/dictionary.ts:40](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/dictionary.ts#L40)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[depthIdentifier](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#depthidentifier)[maxKeys](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#maxkeys)[minKeys](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#minkeys)[noNullPrototype](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#nonullprototype)[size](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html#size)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
