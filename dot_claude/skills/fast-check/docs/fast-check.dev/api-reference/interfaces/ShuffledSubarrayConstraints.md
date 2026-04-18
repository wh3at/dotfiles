---
title: "ShuffledSubarrayConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/ShuffledSubarrayConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [ShuffledSubarrayConstraints](https://fast-check.dev/api-reference/interfaces/ShuffledSubarrayConstraints.html)

# Interface ShuffledSubarrayConstraints

Constraints to be applied on [shuffledSubarray](https://fast-check.dev/api-reference/functions/shuffledSubarray.html)

#### Remarks

Since 2.18.0

interface ShuffledSubarrayConstraints {
    [maxLength](https://fast-check.dev/api-reference/interfaces/ShuffledSubarrayConstraints.html#maxlength)?: number;
    [minLength](https://fast-check.dev/api-reference/interfaces/ShuffledSubarrayConstraints.html#minlength)?: number;
}

* Defined in [packages/fast-check/src/arbitrary/shuffledSubarray.ts:9](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/shuffledSubarray.ts#L9)

##### Index

### Properties

[maxLength?](https://fast-check.dev/api-reference/interfaces/ShuffledSubarrayConstraints.html#maxlength)
[minLength?](https://fast-check.dev/api-reference/interfaces/ShuffledSubarrayConstraints.html#minlength)

## Properties

### `Optional`maxLength

maxLength?: number

Upper bound of the generated subarray size (included)

#### Default Value

```
The length of the original array itself
Copy
```

#### Remarks

Since 2.4.0

* Defined in [packages/fast-check/src/arbitrary/shuffledSubarray.ts:21](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/shuffledSubarray.ts#L21)

### `Optional`minLength

minLength?: number

Lower bound of the generated subarray size (included)

#### Default Value

```
0
Copy
```

#### Remarks

Since 2.4.0

* Defined in [packages/fast-check/src/arbitrary/shuffledSubarray.ts:15](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/shuffledSubarray.ts#L15)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[maxLength](https://fast-check.dev/api-reference/interfaces/ShuffledSubarrayConstraints.html#maxlength)[minLength](https://fast-check.dev/api-reference/interfaces/ShuffledSubarrayConstraints.html#minlength)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
