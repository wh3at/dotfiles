---
title: "nat | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/nat"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [nat](https://fast-check.dev/api-reference/functions/nat.html)

# Function nat

* nat(): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<number>

  For positive integers between 0 (included) and 2147483647 (included)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<number>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/arbitrary/nat.ts:25](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/nat.ts#L25)
* nat(max: number): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<number>

  For positive integers between 0 (included) and max (included)

  #### Parameters

  + max: number

    Upper bound for the generated integers

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<number>

  #### Remarks

  You may prefer to use `fc.nat({max})` instead.

  + Defined in [packages/fast-check/src/arbitrary/nat.ts:35](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/nat.ts#L35)
* nat(constraints: [NatConstraints](https://fast-check.dev/api-reference/interfaces/NatConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<number>

  For positive integers between 0 (included) and max (included)

  #### Parameters

  + constraints: [NatConstraints](https://fast-check.dev/api-reference/interfaces/NatConstraints.html)

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<number>

  #### Remarks

  Since 2.6.0

  + Defined in [packages/fast-check/src/arbitrary/nat.ts:44](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/nat.ts#L44)
* nat(arg?: number | [NatConstraints](https://fast-check.dev/api-reference/interfaces/NatConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<number>

  For positive integers between 0 (included) and max (included)

  #### Parameters

  + `Optional`arg: number | [NatConstraints](https://fast-check.dev/api-reference/interfaces/NatConstraints.html)

    Either a maximum number or constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<number>

  #### Remarks

  Since 2.6.0

  + Defined in [packages/fast-check/src/arbitrary/nat.ts:53](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/nat.ts#L53)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
