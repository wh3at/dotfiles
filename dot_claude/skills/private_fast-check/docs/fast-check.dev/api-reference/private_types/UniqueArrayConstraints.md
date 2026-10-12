---
title: "UniqueArrayConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/UniqueArrayConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [UniqueArrayConstraints](https://fast-check.dev/api-reference/types/UniqueArrayConstraints.html)

# Type Alias UniqueArrayConstraints<T, U>

UniqueArrayConstraints:
    | [UniqueArrayConstraintsRecommended](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsRecommended.html)<[T](https://fast-check.dev/api-reference/types/UniqueArrayConstraints.html#t), [U](https://fast-check.dev/api-reference/types/UniqueArrayConstraints.html#u)>
    | [UniqueArrayConstraintsCustomCompare](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompare.html)<[T](https://fast-check.dev/api-reference/types/UniqueArrayConstraints.html#t)>
    | [UniqueArrayConstraintsCustomCompareSelect](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompareSelect.html)<[T](https://fast-check.dev/api-reference/types/UniqueArrayConstraints.html#t), [U](https://fast-check.dev/api-reference/types/UniqueArrayConstraints.html#u)>

Constraints implying known and optimized comparison function
to be applied on [uniqueArray](https://fast-check.dev/api-reference/functions/uniqueArray.html)

The defaults relies on the defaults specified by [UniqueArrayConstraintsRecommended](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsRecommended.html)

#### Type Parameters

* T
* U

#### Remarks

Since 2.23.0

* Defined in [packages/fast-check/src/arbitrary/uniqueArray.ts:165](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/uniqueArray.ts#L165)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
