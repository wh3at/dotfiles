---
title: "UniqueArrayConstraintsRecommended | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/UniqueArrayConstraintsRecommended"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [UniqueArrayConstraintsRecommended](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsRecommended.html)

# Type Alias UniqueArrayConstraintsRecommended<T, U>

UniqueArrayConstraintsRecommended: [UniqueArraySharedConstraints](https://fast-check.dev/api-reference/types/UniqueArraySharedConstraints.html) & {
    comparator?: "SameValue" | "SameValueZero" | "IsStrictlyEqual";
    selector?: (v: [T](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsRecommended.html#t)) => [U](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsRecommended.html#u);
}

Constraints implying known and optimized comparison function
to be applied on [uniqueArray](https://fast-check.dev/api-reference/functions/uniqueArray.html)

#### Type Parameters

* T
* U

#### Type Declaration

* ##### `Optional`comparator?: "SameValue" | "SameValueZero" | "IsStrictlyEqual"

  The operator to be used to compare the values after having applied the selector (if any):

  + SameValue behaves like `Object.is` — <https://tc39.es/ecma262/multipage/abstract-operations.html#sec-samevalue>
  + SameValueZero behaves like `Set` or `Map` — <https://tc39.es/ecma262/multipage/abstract-operations.html#sec-samevaluezero>
  + IsStrictlyEqual behaves like `===` — <https://tc39.es/ecma262/multipage/abstract-operations.html#sec-isstrictlyequal>
  + Fully custom comparison function: it implies performance costs for large arrays

  #### Default Value

  ```
  'SameValue'
  Copy
  ```

  #### Remarks

  Since 2.23.0
* ##### `Optional`selector?: (v: [T](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsRecommended.html#t)) => [U](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsRecommended.html#u)

  How we should project the values before comparing them together

  #### Default Value

  ```
  (v =&gt; v)
  Copy
  ```

  #### Remarks

  Since 2.23.0

#### Remarks

Since 2.23.0

* Defined in [packages/fast-check/src/arbitrary/uniqueArray.ts:92](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/uniqueArray.ts#L92)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
