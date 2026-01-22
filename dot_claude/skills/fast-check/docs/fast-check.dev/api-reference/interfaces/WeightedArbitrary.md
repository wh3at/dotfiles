---
title: "WeightedArbitrary | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/WeightedArbitrary"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [WeightedArbitrary](https://fast-check.dev/api-reference/interfaces/WeightedArbitrary.html)

# Interface WeightedArbitrary<T>

Conjonction of a weight and an arbitrary used by [oneof](https://fast-check.dev/api-reference/functions/oneof.html)
in order to generate values

#### Remarks

Since 1.18.0

interface WeightedArbitrary<[T](https://fast-check.dev/api-reference/interfaces/WeightedArbitrary.html#t)> {
    [arbitrary](https://fast-check.dev/api-reference/interfaces/WeightedArbitrary.html#arbitrary): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/interfaces/WeightedArbitrary.html#t)>;
    [weight](https://fast-check.dev/api-reference/interfaces/WeightedArbitrary.html#weight): number;
}

#### Type Parameters

* T

* Defined in [packages/fast-check/src/arbitrary/oneof.ts:15](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/oneof.ts#L15)

##### Index

### Properties

[arbitrary](https://fast-check.dev/api-reference/interfaces/WeightedArbitrary.html#arbitrary)
[weight](https://fast-check.dev/api-reference/interfaces/WeightedArbitrary.html#weight)

## Properties

### arbitrary

arbitrary: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/interfaces/WeightedArbitrary.html#t)>

Instance of Arbitrary

#### Remarks

Since 0.0.7

* Defined in [packages/fast-check/src/arbitrary/oneof.ts:25](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/oneof.ts#L25)

### weight

weight: number

Weight to be applied when selecting which arbitrary should be used

#### Remarks

Since 0.0.7

* Defined in [packages/fast-check/src/arbitrary/oneof.ts:20](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/oneof.ts#L20)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[arbitrary](https://fast-check.dev/api-reference/interfaces/WeightedArbitrary.html#arbitrary)[weight](https://fast-check.dev/api-reference/interfaces/WeightedArbitrary.html#weight)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
