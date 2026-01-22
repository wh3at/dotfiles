---
title: "SubarrayConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/SubarrayConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [SubarrayConstraints](https://fast-check.dev/api-reference/interfaces/SubarrayConstraints.html)

# Interface SubarrayConstraints

Constraints to be applied on [subarray](https://fast-check.dev/api-reference/functions/subarray.html)

#### Remarks

Since 2.4.0

interface SubarrayConstraints {
    [maxLength](https://fast-check.dev/api-reference/interfaces/SubarrayConstraints.html#maxlength)?: number;
    [minLength](https://fast-check.dev/api-reference/interfaces/SubarrayConstraints.html#minlength)?: number;
}

* Defined in [packages/fast-check/src/arbitrary/subarray.ts:9](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/subarray.ts#L9)

##### Index

### Properties

[maxLength?](https://fast-check.dev/api-reference/interfaces/SubarrayConstraints.html#maxlength)
[minLength?](https://fast-check.dev/api-reference/interfaces/SubarrayConstraints.html#minlength)

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

* Defined in [packages/fast-check/src/arbitrary/subarray.ts:21](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/subarray.ts#L21)

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

* Defined in [packages/fast-check/src/arbitrary/subarray.ts:15](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/subarray.ts#L15)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[maxLength](https://fast-check.dev/api-reference/interfaces/SubarrayConstraints.html#maxlength)[minLength](https://fast-check.dev/api-reference/interfaces/SubarrayConstraints.html#minlength)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
