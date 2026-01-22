---
title: "WithCloneMethod | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/WithCloneMethod"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [WithCloneMethod](https://fast-check.dev/api-reference/interfaces/WithCloneMethod.html)

# Interface WithCloneMethod<T>

Object instance that should be cloned from one generation/shrink to another

#### Remarks

Since 2.15.0

interface WithCloneMethod<[T](https://fast-check.dev/api-reference/interfaces/WithCloneMethod.html#t)> {
    ["[cloneMethod]"](WithCloneMethod.html#clonemethod): () => [T](https://fast-check.dev/api-reference/interfaces/WithCloneMethod.html#t);
}

#### Type Parameters

* T

* Defined in [packages/fast-check/src/check/symbols.ts:21](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/symbols.ts#L21)

##### Index

### Properties

[[cloneMethod]](WithCloneMethod.html#clonemethod)

## Properties

### [cloneMethod]

"[cloneMethod]": () => [T](https://fast-check.dev/api-reference/interfaces/WithCloneMethod.html#t)

* Defined in [packages/fast-check/src/check/symbols.ts:22](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/symbols.ts#L22)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[[cloneMethod]](WithCloneMethod.html#clonemethod)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
