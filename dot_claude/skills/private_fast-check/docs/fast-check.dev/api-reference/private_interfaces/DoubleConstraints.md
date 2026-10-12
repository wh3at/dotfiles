---
title: "DoubleConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/DoubleConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [DoubleConstraints](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html)

# Interface DoubleConstraints

Constraints to be applied on [double](https://fast-check.dev/api-reference/functions/double.html)

#### Remarks

Since 2.6.0

interface DoubleConstraints {
    [max](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#max)?: number;
    [maxExcluded](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#maxexcluded)?: boolean;
    [min](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#min)?: number;
    [minExcluded](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#minexcluded)?: boolean;
    [noDefaultInfinity](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#nodefaultinfinity)?: boolean;
    [noInteger](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#nointeger)?: boolean;
    [noNaN](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#nonan)?: boolean;
}

* Defined in [packages/fast-check/src/arbitrary/double.ts:24](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/double.ts#L24)

##### Index

### Properties

[max?](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#max)
[maxExcluded?](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#maxexcluded)
[min?](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#min)
[minExcluded?](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#minexcluded)
[noDefaultInfinity?](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#nodefaultinfinity)
[noInteger?](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#nointeger)
[noNaN?](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#nonan)

## Properties

### `Optional`max

max?: number

Upper bound for the generated 64-bit floats (included, see maxExcluded to exclude it)

#### Default Value

```
Number.POSITIVE_INFINITY, 1.7976931348623157e+308 when noDefaultInfinity is true
Copy
```

#### Remarks

Since 2.8.0

* Defined in [packages/fast-check/src/arbitrary/double.ts:43](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/double.ts#L43)

### `Optional`maxExcluded

maxExcluded?: boolean

Should the upper bound (aka max) be excluded?
Note: Excluding max=Number.POSITIVE\_INFINITY would result into having max set to Number.MAX\_VALUE.

#### Default Value

```
false
Copy
```

#### Remarks

Since 3.12.0

* Defined in [packages/fast-check/src/arbitrary/double.ts:50](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/double.ts#L50)

### `Optional`min

min?: number

Lower bound for the generated 64-bit floats (included, see minExcluded to exclude it)

#### Default Value

```
Number.NEGATIVE_INFINITY, -1.7976931348623157e+308 when noDefaultInfinity is true
Copy
```

#### Remarks

Since 2.8.0

* Defined in [packages/fast-check/src/arbitrary/double.ts:30](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/double.ts#L30)

### `Optional`minExcluded

minExcluded?: boolean

Should the lower bound (aka min) be excluded?
Note: Excluding min=Number.NEGATIVE\_INFINITY would result into having min set to -Number.MAX\_VALUE.

#### Default Value

```
false
Copy
```

#### Remarks

Since 3.12.0

* Defined in [packages/fast-check/src/arbitrary/double.ts:37](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/double.ts#L37)

### `Optional`noDefaultInfinity

noDefaultInfinity?: boolean

By default, lower and upper bounds are -infinity and +infinity.
By setting noDefaultInfinity to true, you move those defaults to minimal and maximal finite values.

#### Default Value

```
false
Copy
```

#### Remarks

Since 2.8.0

* Defined in [packages/fast-check/src/arbitrary/double.ts:57](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/double.ts#L57)

### `Optional`noInteger

noInteger?: boolean

When set to true, Number.isInteger(value) will be false for any generated value.
Note: -infinity and +infinity, or NaN can stil be generated except if you rejected them via another constraint.

#### Default Value

```
false
Copy
```

#### Remarks

Since 3.18.0

* Defined in [packages/fast-check/src/arbitrary/double.ts:70](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/double.ts#L70)

### `Optional`noNaN

noNaN?: boolean

When set to true, no more Number.NaN can be generated.

#### Default Value

```
false
Copy
```

#### Remarks

Since 2.8.0

* Defined in [packages/fast-check/src/arbitrary/double.ts:63](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/double.ts#L63)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[max](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#max)[maxExcluded](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#maxexcluded)[min](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#min)[minExcluded](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#minexcluded)[noDefaultInfinity](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#nodefaultinfinity)[noInteger](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#nointeger)[noNaN](https://fast-check.dev/api-reference/interfaces/DoubleConstraints.html#nonan)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
