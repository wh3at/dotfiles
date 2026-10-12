---
title: "bigInt | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/bigInt"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [bigInt](https://fast-check.dev/api-reference/functions/bigInt.html)

# Function bigInt

* bigInt(): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<bigint>

  For bigint

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<bigint>

  #### Remarks

  Since 1.9.0

  + Defined in [packages/fast-check/src/arbitrary/bigInt.ts:64](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/bigInt.ts#L64)
* bigInt(min: bigint, max: bigint): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<bigint>

  For bigint between min (included) and max (included)

  #### Parameters

  + min: bigint

    Lower bound for the generated bigints (eg.: -5n, 0n, BigInt(Number.MIN\_SAFE\_INTEGER))
  + max: bigint

    Upper bound for the generated bigints (eg.: -2n, 2147483647n, BigInt(Number.MAX\_SAFE\_INTEGER))

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<bigint>

  #### Remarks

  Since 1.9.0

  + Defined in [packages/fast-check/src/arbitrary/bigInt.ts:74](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/bigInt.ts#L74)
* bigInt(constraints: [BigIntConstraints](https://fast-check.dev/api-reference/interfaces/BigIntConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<bigint>

  For bigint between min (included) and max (included)

  #### Parameters

  + constraints: [BigIntConstraints](https://fast-check.dev/api-reference/interfaces/BigIntConstraints.html)

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<bigint>

  #### Remarks

  Since 2.6.0

  + Defined in [packages/fast-check/src/arbitrary/bigInt.ts:83](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/bigInt.ts#L83)
* bigInt(...args: [] | [bigint, bigint] | [[BigIntConstraints](https://fast-check.dev/api-reference/interfaces/BigIntConstraints.html)]): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<bigint>

  For bigint between min (included) and max (included)

  #### Parameters

  + ...args: [] | [bigint, bigint] | [[BigIntConstraints](https://fast-check.dev/api-reference/interfaces/BigIntConstraints.html)]

    Either min/max bounds as an object or constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<bigint>

  #### Remarks

  Since 2.6.0

  + Defined in [packages/fast-check/src/arbitrary/bigInt.ts:92](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/bigInt.ts#L92)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
