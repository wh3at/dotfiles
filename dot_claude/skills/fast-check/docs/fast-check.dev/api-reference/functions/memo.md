---
title: "memo | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/memo"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [memo](https://fast-check.dev/api-reference/functions/memo.html)

# Function memo

* memo<[T](https://fast-check.dev/api-reference/functions/memo.html#memot)>(builder: (maxDepth: number) => [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/memo.html#memot)>): [Memo](https://fast-check.dev/api-reference/types/Memo.html)<[T](https://fast-check.dev/api-reference/functions/memo.html#memot)>

  For mutually recursive types

  #### Type Parameters

  + T

  #### Parameters

  + builder: (maxDepth: number) => [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/memo.html#memot)>

    Arbitrary builder taken the maximal depth allowed as input (parameter `n`)

  #### Returns [Memo](https://fast-check.dev/api-reference/types/Memo.html)<[T](https://fast-check.dev/api-reference/functions/memo.html#memot)>

  #### Example

  ```
  // tree is 1 / 3 of node, 2 / 3 of leaf
  const tree: fc.Memo<Tree> = fc.memo(n => fc.oneof(node(n), leaf(), leaf()));
  const node: fc.Memo<Tree> = fc.memo(n => {
    if (n <= 1) return fc.record({ left: leaf(), right: leaf() });
    return fc.record({ left: tree(), right: tree() }); // tree() is equivalent to tree(n-1)
  });
  const leaf = fc.nat;
  Copy
  ```

  #### Remarks

  Since 1.16.0

  + Defined in [packages/fast-check/src/arbitrary/memo.ts:33](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/memo.ts#L33)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
