---
title: "FloatConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/FloatConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [FloatConstraints](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html)

# Interface FloatConstraints

Constraints to be applied on [float](https://fast-check.dev/api-reference/functions/float.html)

#### Remarks

Since 2.6.0

interface FloatConstraints {
    [max](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#max)?: number;
    [maxExcluded](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#maxexcluded)?: boolean;
    [min](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#min)?: number;
    [minExcluded](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#minexcluded)?: boolean;
    [noDefaultInfinity](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#nodefaultinfinity)?: boolean;
    [noInteger](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#nointeger)?: boolean;
    [noNaN](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#nonan)?: boolean;
}

* Defined in [packages/fast-check/src/arbitrary/float.ts:23](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/float.ts#L23)

##### Index

### Properties

[max?](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#max)
[maxExcluded?](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#maxexcluded)
[min?](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#min)
[minExcluded?](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#minexcluded)
[noDefaultInfinity?](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#nodefaultinfinity)
[noInteger?](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#nointeger)
[noNaN?](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#nonan)

## Properties

### `Optional`max

max?: number

Upper bound for the generated 32-bit floats (included)

#### Default Value

```
Number.POSITIVE_INFINITY, 3.4028234663852886e+38 when noDefaultInfinity is true
Copy
```

#### Remarks

Since 2.8.0

* Defined in [packages/fast-check/src/arbitrary/float.ts:42](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/float.ts#L42)

### `Optional`maxExcluded

maxExcluded?: boolean

Should the upper bound (aka max) be excluded?
Note: Excluding max=Number.POSITIVE\_INFINITY would result into having max set to 3.4028234663852886e+38.

#### Default Value

```
false
Copy
```

#### Remarks

Since 3.12.0

* Defined in [packages/fast-check/src/arbitrary/float.ts:49](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/float.ts#L49)

### `Optional`min

min?: number

Lower bound for the generated 32-bit floats (included)

#### Default Value

```
Number.NEGATIVE_INFINITY, -3.4028234663852886e+38 when noDefaultInfinity is true
Copy
```

#### Remarks

Since 2.8.0

* Defined in [packages/fast-check/src/arbitrary/float.ts:29](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/float.ts#L29)

### `Optional`minExcluded

minExcluded?: boolean

Should the lower bound (aka min) be excluded?
Note: Excluding min=Number.NEGATIVE\_INFINITY would result into having min set to -3.4028234663852886e+38.

#### Default Value

```
false
Copy
```

#### Remarks

Since 3.12.0

* Defined in [packages/fast-check/src/arbitrary/float.ts:36](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/float.ts#L36)

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

* Defined in [packages/fast-check/src/arbitrary/float.ts:56](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/float.ts#L56)

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

* Defined in [packages/fast-check/src/arbitrary/float.ts:69](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/float.ts#L69)

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

* Defined in [packages/fast-check/src/arbitrary/float.ts:62](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/float.ts#L62)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[max](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#max)[maxExcluded](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#maxexcluded)[min](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#min)[minExcluded](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#minexcluded)[noDefaultInfinity](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#nodefaultinfinity)[noInteger](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#nointeger)[noNaN](https://fast-check.dev/api-reference/interfaces/FloatConstraints.html#nonan)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
