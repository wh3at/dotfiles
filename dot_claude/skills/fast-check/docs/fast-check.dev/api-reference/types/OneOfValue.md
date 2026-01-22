---
title: "OneOfValue | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/OneOfValue"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [OneOfValue](https://fast-check.dev/api-reference/types/OneOfValue.html)

# Type Alias OneOfValue<Ts>

OneOfValue: {
    [K in keyof [Ts](https://fast-check.dev/api-reference/types/OneOfValue.html#ts)]: [Ts](https://fast-check.dev/api-reference/types/OneOfValue.html#ts)[K] extends [MaybeWeightedArbitrary](https://fast-check.dev/api-reference/types/MaybeWeightedArbitrary.html)<infer U>
        ? U
        : never
}[number]

Infer the type of the Arbitrary produced by [oneof](https://fast-check.dev/api-reference/functions/oneof.html)
given the type of the source arbitraries

#### Type Parameters

* Ts extends [MaybeWeightedArbitrary](https://fast-check.dev/api-reference/types/MaybeWeightedArbitrary.html)<unknown>[]

#### Remarks

Since 2.2.0

* Defined in [packages/fast-check/src/arbitrary/oneof.ts:42](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/oneof.ts#L42)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
