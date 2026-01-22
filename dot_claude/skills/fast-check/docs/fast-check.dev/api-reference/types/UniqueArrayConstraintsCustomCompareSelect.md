---
title: "UniqueArrayConstraintsCustomCompareSelect | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompareSelect"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [UniqueArrayConstraintsCustomCompareSelect](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompareSelect.html)

# Type Alias UniqueArrayConstraintsCustomCompareSelect<T, U>

UniqueArrayConstraintsCustomCompareSelect: [UniqueArraySharedConstraints](https://fast-check.dev/api-reference/types/UniqueArraySharedConstraints.html) & {
    comparator: (a: [U](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompareSelect.html#u), b: [U](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompareSelect.html#u)) => boolean;
    selector: (v: [T](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompareSelect.html#t)) => [U](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompareSelect.html#u);
}

Constraints implying fully custom comparison function and selector
to be applied on [uniqueArray](https://fast-check.dev/api-reference/functions/uniqueArray.html)

WARNING - Imply an extra performance cost whenever you want to generate large arrays

#### Type Parameters

* T
* U

#### Type Declaration

* ##### comparator: (a: [U](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompareSelect.html#u), b: [U](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompareSelect.html#u)) => boolean

  The operator to be used to compare the values after having applied the selector (if any)

  #### Remarks

  Since 2.23.0
* ##### selector: (v: [T](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompareSelect.html#t)) => [U](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompareSelect.html#u)

  How we should project the values before comparing them together

  #### Remarks

  Since 2.23.0

#### Remarks

Since 2.23.0

* Defined in [packages/fast-check/src/arbitrary/uniqueArray.ts:143](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/uniqueArray.ts#L143)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
