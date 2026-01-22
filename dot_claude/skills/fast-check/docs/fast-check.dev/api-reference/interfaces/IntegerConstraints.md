---
title: "IntegerConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/IntegerConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [IntegerConstraints](https://fast-check.dev/api-reference/interfaces/IntegerConstraints.html)

# Interface IntegerConstraints

Constraints to be applied on [integer](https://fast-check.dev/api-reference/functions/integer.html)

#### Remarks

Since 2.6.0

interface IntegerConstraints {
    [max](https://fast-check.dev/api-reference/interfaces/IntegerConstraints.html#max)?: number;
    [min](https://fast-check.dev/api-reference/interfaces/IntegerConstraints.html#min)?: number;
}

* Defined in [packages/fast-check/src/arbitrary/integer.ts:11](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/integer.ts#L11)

##### Index

### Properties

[max?](https://fast-check.dev/api-reference/interfaces/IntegerConstraints.html#max)
[min?](https://fast-check.dev/api-reference/interfaces/IntegerConstraints.html#min)

## Properties

### `Optional`max

max?: number

Upper bound for the generated integers (included)

#### Default Value

```
0x7fffffff
Copy
```

#### Remarks

Since 2.6.0

* Defined in [packages/fast-check/src/arbitrary/integer.ts:23](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/integer.ts#L23)

### `Optional`min

min?: number

Lower bound for the generated integers (included)

#### Default Value

```
-0x80000000
Copy
```

#### Remarks

Since 2.6.0

* Defined in [packages/fast-check/src/arbitrary/integer.ts:17](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/integer.ts#L17)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[max](https://fast-check.dev/api-reference/interfaces/IntegerConstraints.html#max)[min](https://fast-check.dev/api-reference/interfaces/IntegerConstraints.html#min)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
