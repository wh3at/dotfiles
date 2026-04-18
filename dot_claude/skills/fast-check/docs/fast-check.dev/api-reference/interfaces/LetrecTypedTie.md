---
title: "LetrecTypedTie | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/LetrecTypedTie"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [LetrecTypedTie](https://fast-check.dev/api-reference/interfaces/LetrecTypedTie.html)

# Interface LetrecTypedTie<T>

Strongly typed type for the `tie` function passed by [letrec](https://fast-check.dev/api-reference/functions/letrec.html) to the `builder` function we pass to it.
You may want also want to use its loosely typed version [LetrecLooselyTypedTie](https://fast-check.dev/api-reference/types/LetrecLooselyTypedTie.html).

#### Remarks

Since 3.0.0

#### Type Parameters

* T

* LetrecTypedTie<[K](https://fast-check.dev/api-reference/interfaces/LetrecTypedTie.html#letrectypedtiek) extends string | number | symbol>(key: [K](https://fast-check.dev/api-reference/interfaces/LetrecTypedTie.html#letrectypedtiek)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/interfaces/LetrecTypedTie.html#t)[[K](https://fast-check.dev/api-reference/interfaces/LetrecTypedTie.html#letrectypedtiek)]>

  #### Type Parameters

  + K extends string | number | symbol

  #### Parameters

  + key: [K](https://fast-check.dev/api-reference/interfaces/LetrecTypedTie.html#letrectypedtiek)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/interfaces/LetrecTypedTie.html#t)[[K](https://fast-check.dev/api-reference/interfaces/LetrecTypedTie.html#letrectypedtiek)]>

  + Defined in [packages/fast-check/src/arbitrary/letrec.ts:24](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/letrec.ts#L24)
* LetrecTypedTie(key: string): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<unknown>

  #### Parameters

  + key: string

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<unknown>

  + Defined in [packages/fast-check/src/arbitrary/letrec.ts:25](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/letrec.ts#L25)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
