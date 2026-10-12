---
title: "ObjectConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/ObjectConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [ObjectConstraints](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html)

# Interface ObjectConstraints

Constraints for [anything](https://fast-check.dev/api-reference/functions/anything.html) and [object](https://fast-check.dev/api-reference/functions/object.html)

interface ObjectConstraints {
    [depthSize](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#depthsize)?: [DepthSize](https://fast-check.dev/api-reference/types/DepthSize.html);
    [key](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#key)?: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>;
    [maxDepth](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#maxdepth)?: number;
    [maxKeys](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#maxkeys)?: number;
    [size](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#size)?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html);
    [stringUnit](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#stringunit)?:
        | [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>
        | "grapheme"
        | "binary"
        | "grapheme-composite"
        | "grapheme-ascii"
        | "binary-ascii";
    [values](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#values)?: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<unknown>[];
    [withBigInt](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withbigint)?: boolean;
    [withBoxedValues](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withboxedvalues)?: boolean;
    [withDate](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withdate)?: boolean;
    [withMap](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withmap)?: boolean;
    [withNullPrototype](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withnullprototype)?: boolean;
    [withObjectString](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withobjectstring)?: boolean;
    [withSet](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withset)?: boolean;
    [withSparseArray](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withsparsearray)?: boolean;
    [withTypedArray](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withtypedarray)?: boolean;
    [withUnicodeString](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withunicodestring)?: boolean;
}

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:16](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L16)

##### Index

### Properties

[depthSize?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#depthsize)
[key?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#key)
[maxDepth?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#maxdepth)
[maxKeys?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#maxkeys)
[size?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#size)
[stringUnit?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#stringunit)
[values?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#values)
[withBigInt?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withbigint)
[withBoxedValues?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withboxedvalues)
[withDate?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withdate)
[withMap?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withmap)
[withNullPrototype?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withnullprototype)
[withObjectString?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withobjectstring)
[withSet?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withset)
[withSparseArray?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withsparsearray)
[withTypedArray?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withtypedarray)
[withUnicodeString?](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withunicodestring)

## Properties

### `Optional`depthSize

depthSize?: [DepthSize](https://fast-check.dev/api-reference/types/DepthSize.html)

Limit the depth of the object by increasing the probability to generate simple values (defined via values)
as we go deeper in the object.

#### Remarks

Since 2.20.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:22](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L22)

### `Optional`key

key?: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

Arbitrary for keys

#### Default Value

[string](https://fast-check.dev/api-reference/functions/string.html)

#### Remarks

Since 0.0.7

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:45](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L45)

### `Optional`maxDepth

maxDepth?: number

Maximal depth allowed

#### Default Value

Number.POSITIVE\_INFINITY — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 0.0.7

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:28](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L28)

### `Optional`maxKeys

maxKeys?: number

Maximal number of keys

#### Default Value

0x7fffffff — *defaulting seen as "max non specified" when `defaultSizeToMaxWhenMaxSpecified=true`*

#### Remarks

Since 1.13.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:34](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L34)

### `Optional`size

size?: [SizeForArbitrary](https://fast-check.dev/api-reference/types/SizeForArbitrary.html)

Define how large the generated values should be (at max)

#### Remarks

Since 2.22.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:39](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L39)

### `Optional`stringUnit

stringUnit?:
    | [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>
    | "grapheme"
    | "binary"
    | "grapheme-composite"
    | "grapheme-ascii"
    | "binary-ascii"

Replace the default unit for strings.

#### Default Value

```
undefined
Copy
```

#### Remarks

Since 3.23.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:120](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L120)

### `Optional`values

values?: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<unknown>[]

Arbitrary for values

#### Default Value

[boolean](https://fast-check.dev/api-reference/functions/boolean.html), [integer](https://fast-check.dev/api-reference/functions/integer.html), [double](https://fast-check.dev/api-reference/functions/double.html), [string](https://fast-check.dev/api-reference/functions/string.html), null, undefined, Number.NaN, +0, -0, Number.EPSILON, Number.MIN\_VALUE, Number.MAX\_VALUE, Number.MIN\_SAFE\_INTEGER, Number.MAX\_SAFE\_INTEGER, Number.POSITIVE\_INFINITY, Number.NEGATIVE\_INFINITY

#### Remarks

Since 0.0.7

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:51](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L51)

### `Optional`withBigInt

withBigInt?: boolean

Also generate BigInt

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.26.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:87](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L87)

### `Optional`withBoxedValues

withBoxedValues?: boolean

Also generate boxed versions of values

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.11.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:57](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L57)

### `Optional`withDate

withDate?: boolean

Also generate Date

#### Default Value

```
false
Copy
```

#### Remarks

Since 2.5.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:93](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L93)

### `Optional`withMap

withMap?: boolean

Also generate Map

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.11.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:69](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L69)

### `Optional`withNullPrototype

withNullPrototype?: boolean

Also generate object with null prototype

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.23.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:81](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L81)

### `Optional`withObjectString

withObjectString?: boolean

Also generate string representations of object instances

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.17.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:75](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L75)

### `Optional`withSet

withSet?: boolean

Also generate Set

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.11.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:63](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L63)

### `Optional`withSparseArray

withSparseArray?: boolean

Also generate sparse arrays (arrays with holes)

#### Default Value

```
false
Copy
```

#### Remarks

Since 2.13.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:106](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L106)

### `Optional`withTypedArray

withTypedArray?: boolean

Also generate typed arrays in: (Uint|Int)(8|16|32)Array and Float(32|64)Array
Remark: no typed arrays made of bigint

#### Default Value

```
false
Copy
```

#### Remarks

Since 2.9.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:100](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L100)

### `Optional`withUnicodeString

withUnicodeString?: boolean

Replace the arbitrary of strings defaulted for key and values by one able to generate unicode strings with non-ascii characters.
If you override key and/or values constraint, this flag will not apply to your override.

#### Deprecated

Prefer using `stringUnit` to customize the kind of strings that will be generated by default.

#### Default Value

```
false
Copy
```

#### Remarks

Since 3.19.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/QualifiedObjectConstraints.ts:114](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/QualifiedObjectConstraints.ts#L114)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[depthSize](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#depthsize)[key](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#key)[maxDepth](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#maxdepth)[maxKeys](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#maxkeys)[size](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#size)[stringUnit](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#stringunit)[values](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#values)[withBigInt](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withbigint)[withBoxedValues](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withboxedvalues)[withDate](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withdate)[withMap](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withmap)[withNullPrototype](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withnullprototype)[withObjectString](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withobjectstring)[withSet](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withset)[withSparseArray](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withsparsearray)[withTypedArray](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withtypedarray)[withUnicodeString](https://fast-check.dev/api-reference/interfaces/ObjectConstraints.html#withunicodestring)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
