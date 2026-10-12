---
title: "letrec | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/letrec"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [letrec](https://fast-check.dev/api-reference/functions/letrec.html)

# Function letrec

* letrec<[T](https://fast-check.dev/api-reference/functions/letrec.html#letrect)>(
      builder: [T](https://fast-check.dev/api-reference/functions/letrec.html#letrect) extends Record<string, unknown>
          ? [LetrecTypedBuilder](https://fast-check.dev/api-reference/types/LetrecTypedBuilder.html)<[T](https://fast-check.dev/api-reference/functions/letrec.html#letrect)<[T](https://fast-check.dev/api-reference/functions/letrec.html#letrect)>>
          : never,
  ): [LetrecValue](https://fast-check.dev/api-reference/types/LetrecValue.html)<[T](https://fast-check.dev/api-reference/functions/letrec.html#letrect)>

  For mutually recursive types

  #### Type Parameters

  + T

  #### Parameters

  + builder: [T](https://fast-check.dev/api-reference/functions/letrec.html#letrect) extends Record<string, unknown> ? [LetrecTypedBuilder](https://fast-check.dev/api-reference/types/LetrecTypedBuilder.html)<[T](https://fast-check.dev/api-reference/functions/letrec.html#letrect)<[T](https://fast-check.dev/api-reference/functions/letrec.html#letrect)>> : never

    Arbitraries builder based on themselves (through `tie`)

  #### Returns [LetrecValue](https://fast-check.dev/api-reference/types/LetrecValue.html)<[T](https://fast-check.dev/api-reference/functions/letrec.html#letrect)>

  #### Example

  ```
  type Leaf = number;
  type Node = [Tree, Tree];
  type Tree = Node | Leaf;
  const { tree } = fc.letrec<{ tree: Tree, node: Node, leaf: Leaf }>(tie => ({
    tree: fc.oneof({depthSize: 'small'}, tie('leaf'), tie('node')),
    node: fc.tuple(tie('tree'), tie('tree')),
    leaf: fc.nat()
  }));
  // tree is 50% of node, 50% of leaf
  // the ratio goes in favor of leaves as we go deeper in the tree (thanks to depthSize)
  Copy
  ```

  #### Remarks

  Since 1.16.0

  + Defined in [packages/fast-check/src/arbitrary/letrec.ts:90](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/letrec.ts#L90)
* letrec<[T](https://fast-check.dev/api-reference/functions/letrec.html#letrect-1)>(builder: [LetrecLooselyTypedBuilder](https://fast-check.dev/api-reference/types/LetrecLooselyTypedBuilder.html)<[T](https://fast-check.dev/api-reference/functions/letrec.html#letrect-1)>): [LetrecValue](https://fast-check.dev/api-reference/types/LetrecValue.html)<[T](https://fast-check.dev/api-reference/functions/letrec.html#letrect-1)>

  For mutually recursive types

  #### Type Parameters

  + T

  #### Parameters

  + builder: [LetrecLooselyTypedBuilder](https://fast-check.dev/api-reference/types/LetrecLooselyTypedBuilder.html)<[T](https://fast-check.dev/api-reference/functions/letrec.html#letrect-1)>

    Arbitraries builder based on themselves (through `tie`)

  #### Returns [LetrecValue](https://fast-check.dev/api-reference/types/LetrecValue.html)<[T](https://fast-check.dev/api-reference/functions/letrec.html#letrect-1)>

  #### Example

  ```
  const { tree } = fc.letrec(tie => ({
    tree: fc.oneof({depthSize: 'small'}, tie('leaf'), tie('node')),
    node: fc.tuple(tie('tree'), tie('tree')),
    leaf: fc.nat()
  }));
  // tree is 50% of node, 50% of leaf
  // the ratio goes in favor of leaves as we go deeper in the tree (thanks to depthSize)
  Copy
  ```

  #### Remarks

  Since 1.16.0

  + Defined in [packages/fast-check/src/arbitrary/letrec.ts:110](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/letrec.ts#L110)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
