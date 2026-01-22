---
title: "BigIntConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/BigIntConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [BigIntConstraints](https://fast-check.dev/api-reference/interfaces/BigIntConstraints.html)

# Interface BigIntConstraints

Constraints to be applied on [bigInt](https://fast-check.dev/api-reference/functions/bigInt.html)

#### Remarks

Since 2.6.0

interface BigIntConstraints {
    [max](https://fast-check.dev/api-reference/interfaces/BigIntConstraints.html#max)?: bigint;
    [min](https://fast-check.dev/api-reference/interfaces/BigIntConstraints.html#min)?: bigint;
}

* Defined in [packages/fast-check/src/arbitrary/bigInt.ts:10](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/bigInt.ts#L10)

##### Index

### Properties

[max?](https://fast-check.dev/api-reference/interfaces/BigIntConstraints.html#max)
[min?](https://fast-check.dev/api-reference/interfaces/BigIntConstraints.html#min)

## Properties

### `Optional`max

max?: bigint

Upper bound for the generated bigints (eg.: -2n, 2147483647n, BigInt(Number.MAX\_SAFE\_INTEGER))

#### Remarks

Since 2.6.0

* Defined in [packages/fast-check/src/arbitrary/bigInt.ts:20](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/bigInt.ts#L20)

### `Optional`min

min?: bigint

Lower bound for the generated bigints (eg.: -5n, 0n, BigInt(Number.MIN\_SAFE\_INTEGER))

#### Remarks

Since 2.6.0

* Defined in [packages/fast-check/src/arbitrary/bigInt.ts:15](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/bigInt.ts#L15)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[max](https://fast-check.dev/api-reference/interfaces/BigIntConstraints.html#max)[min](https://fast-check.dev/api-reference/interfaces/BigIntConstraints.html#min)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
