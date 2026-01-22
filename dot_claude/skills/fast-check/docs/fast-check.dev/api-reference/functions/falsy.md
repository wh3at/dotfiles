---
title: "falsy | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/falsy"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [falsy](https://fast-check.dev/api-reference/functions/falsy.html)

# Function falsy

* falsy<[TConstraints](https://fast-check.dev/api-reference/functions/falsy.html#falsytconstraints) extends [FalsyContraints](https://fast-check.dev/api-reference/interfaces/FalsyContraints.html)>(
      constraints?: [TConstraints](https://fast-check.dev/api-reference/functions/falsy.html#falsytconstraints),
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[FalsyValue](https://fast-check.dev/api-reference/types/FalsyValue.html)<[TConstraints](https://fast-check.dev/api-reference/functions/falsy.html#falsytconstraints)>>

  For falsy values:

  + ''
  + 0
  + NaN
  + false
  + null
  + undefined
  + 0n (whenever withBigInt: true)

  #### Type Parameters

  + TConstraints extends [FalsyContraints](https://fast-check.dev/api-reference/interfaces/FalsyContraints.html)

  #### Parameters

  + `Optional`constraints: [TConstraints](https://fast-check.dev/api-reference/functions/falsy.html#falsytconstraints)

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[FalsyValue](https://fast-check.dev/api-reference/types/FalsyValue.html)<[TConstraints](https://fast-check.dev/api-reference/functions/falsy.html#falsytconstraints)>>

  #### Remarks

  Since 1.26.0

  + Defined in [packages/fast-check/src/arbitrary/falsy.ts:47](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/falsy.ts#L47)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
