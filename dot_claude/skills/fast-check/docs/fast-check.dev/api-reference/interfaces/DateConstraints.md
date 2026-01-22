---
title: "DateConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/DateConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [DateConstraints](https://fast-check.dev/api-reference/interfaces/DateConstraints.html)

# Interface DateConstraints

Constraints to be applied on [date](https://fast-check.dev/api-reference/functions/date.html)

#### Remarks

Since 3.3.0

interface DateConstraints {
    [max](https://fast-check.dev/api-reference/interfaces/DateConstraints.html#max)?: Date;
    [min](https://fast-check.dev/api-reference/interfaces/DateConstraints.html#min)?: Date;
    [noInvalidDate](https://fast-check.dev/api-reference/interfaces/DateConstraints.html#noinvaliddate)?: boolean;
}

* Defined in [packages/fast-check/src/arbitrary/date.ts:18](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/date.ts#L18)

##### Index

### Properties

[max?](https://fast-check.dev/api-reference/interfaces/DateConstraints.html#max)
[min?](https://fast-check.dev/api-reference/interfaces/DateConstraints.html#min)
[noInvalidDate?](https://fast-check.dev/api-reference/interfaces/DateConstraints.html#noinvaliddate)

## Properties

### `Optional`max

max?: Date

Upper bound of the range (included)

#### Default Value

```
new Date(8640000000000000)
Copy
```

#### Remarks

Since 1.17.0

* Defined in [packages/fast-check/src/arbitrary/date.ts:30](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/date.ts#L30)

### `Optional`min

min?: Date

Lower bound of the range (included)

#### Default Value

```
new Date(-8640000000000000)
Copy
```

#### Remarks

Since 1.17.0

* Defined in [packages/fast-check/src/arbitrary/date.ts:24](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/date.ts#L24)

### `Optional`noInvalidDate

noInvalidDate?: boolean

When set to true, no more "Invalid Date" can be generated.

#### Default Value

```
false
Copy
```

#### Remarks

Since 3.13.0

* Defined in [packages/fast-check/src/arbitrary/date.ts:36](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/date.ts#L36)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[max](https://fast-check.dev/api-reference/interfaces/DateConstraints.html#max)[min](https://fast-check.dev/api-reference/interfaces/DateConstraints.html#min)[noInvalidDate](https://fast-check.dev/api-reference/interfaces/DateConstraints.html#noinvaliddate)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
