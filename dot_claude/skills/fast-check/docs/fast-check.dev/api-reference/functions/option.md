---
title: "option | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/option"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [option](https://fast-check.dev/api-reference/functions/option.html)

# Function option

* option<[T](https://fast-check.dev/api-reference/functions/option.html#optiont), [TNil](https://fast-check.dev/api-reference/functions/option.html#optiontnil) = null>(
      arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/option.html#optiont)>,
      constraints?: [OptionConstraints](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html)<[TNil](https://fast-check.dev/api-reference/functions/option.html#optiontnil)>,
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/option.html#optiont) | [TNil](https://fast-check.dev/api-reference/functions/option.html#optiontnil)>

  For either nil or a value coming from `arb` with custom frequency

  #### Type Parameters

  + T
  + TNil = null

  #### Parameters

  + arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/option.html#optiont)>

    Arbitrary that will be called to generate a non nil value
  + constraints: [OptionConstraints](https://fast-check.dev/api-reference/interfaces/OptionConstraints.html)<[TNil](https://fast-check.dev/api-reference/functions/option.html#optiontnil)> = {}

    Constraints on the option(since 1.17.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/option.html#optiont) | [TNil](https://fast-check.dev/api-reference/functions/option.html#optiontnil)>

  #### Remarks

  Since 0.0.6

  + Defined in [packages/fast-check/src/arbitrary/option.ts:60](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/option.ts#L60)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
