---
title: "LetrecValue | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/LetrecValue"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [LetrecValue](https://fast-check.dev/api-reference/types/LetrecValue.html)

# Type Alias LetrecValue<T>

LetrecValue: { [K in keyof [T](https://fast-check.dev/api-reference/types/LetrecValue.html#t)]: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/types/LetrecValue.html#t)[K]> }

Type of the value produced by [letrec](https://fast-check.dev/api-reference/functions/letrec.html)

#### Type Parameters

* T

#### Remarks

Since 3.0.0

* Defined in [packages/fast-check/src/arbitrary/letrec.ts:12](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/letrec.ts#L12)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
