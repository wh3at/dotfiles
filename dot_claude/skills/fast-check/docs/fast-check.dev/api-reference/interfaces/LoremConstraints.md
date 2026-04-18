---
title: "LoremConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/LoremConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [LoremConstraints](https://fast-check.dev/api-reference/interfaces/LoremConstraints.html)

# Interface LoremConstraints

Constraints to be applied on [lorem](https://fast-check.dev/api-reference/functions/lorem.html)

#### Remarks

Since 2.5.0

interface LoremConstraints {
    [maxCount](https://fast-check.dev/api-reference/interfaces/LoremConstraints.html#maxcount)?: number;
    [mode](https://fast-check.dev/api-reference/interfaces/LoremConstraints.html#mode)?: "words" | "sentences";
    [size](https://fast-check.dev/api-reference/interfaces/LoremConstraints.html#size)?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html);
}

* Defined in [packages/fast-check/src/arbitrary/lorem.ts:21](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/lorem.ts#L21)

##### Index

### Properties

[maxCount?](https://fast-check.dev/api-reference/interfaces/LoremConstraints.html#maxcount)
[mode?](https://fast-check.dev/api-reference/interfaces/LoremConstraints.html#mode)
[size?](https://fast-check.dev/api-reference/interfaces/LoremConstraints.html#size)

## Properties

### `Optional`maxCount

maxCount?: number

Maximal number of entities:

* maximal number of words in case mode is 'words'
* maximal number of sentences in case mode is 'sentences'

#### Default Value

0x7fffffff — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 2.5.0

* Defined in [packages/fast-check/src/arbitrary/lorem.ts:30](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/lorem.ts#L30)

### `Optional`mode

mode?: "words" | "sentences"

Type of strings that should be produced by [lorem](https://fast-check.dev/api-reference/functions/lorem.html):

* words: multiple words
* sentences: multiple sentences

#### Default Value

```
'words'
Copy
```

#### Remarks

Since 2.5.0

* Defined in [packages/fast-check/src/arbitrary/lorem.ts:39](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/lorem.ts#L39)

### `Optional`size

size?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html)

Define how large the generated values should be (at max)

#### Remarks

Since 2.22.0

* Defined in [packages/fast-check/src/arbitrary/lorem.ts:44](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/lorem.ts#L44)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[maxCount](https://fast-check.dev/api-reference/interfaces/LoremConstraints.html#maxcount)[mode](https://fast-check.dev/api-reference/interfaces/LoremConstraints.html#mode)[size](https://fast-check.dev/api-reference/interfaces/LoremConstraints.html#size)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
