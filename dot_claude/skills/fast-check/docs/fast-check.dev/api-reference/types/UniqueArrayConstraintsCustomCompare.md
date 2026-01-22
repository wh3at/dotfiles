---
title: "UniqueArrayConstraintsCustomCompare | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompare"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [UniqueArrayConstraintsCustomCompare](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompare.html)

# Type Alias UniqueArrayConstraintsCustomCompare<T>

UniqueArrayConstraintsCustomCompare: [UniqueArraySharedConstraints](https://fast-check.dev/api-reference/types/UniqueArraySharedConstraints.html) & {
    comparator: (a: [T](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompare.html#t), b: [T](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompare.html#t)) => boolean;
    selector?: undefined;
}

Constraints implying a fully custom comparison function
to be applied on [uniqueArray](https://fast-check.dev/api-reference/functions/uniqueArray.html)

WARNING - Imply an extra performance cost whenever you want to generate large arrays

#### Type Parameters

* T

#### Type Declaration

* ##### comparator: (a: [T](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompare.html#t), b: [T](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsCustomCompare.html#t)) => boolean

  The operator to be used to compare the values after having applied the selector (if any)

  #### Remarks

  Since 2.23.0
* ##### `Optional`selector?: undefined

  How we should project the values before comparing them together

  #### Remarks

  Since 2.23.0

#### Remarks

Since 2.23.0

* Defined in [packages/fast-check/src/arbitrary/uniqueArray.ts:121](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/uniqueArray.ts#L121)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
