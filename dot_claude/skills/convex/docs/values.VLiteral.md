---
title: "Class: VLiteral<Type, IsOptional> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/values.VLiteral"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/values](https://docs.convex.dev/api/modules/values.html)
* VLiteral

Copy as Markdown

Copied!

On this page

[values](https://docs.convex.dev/api/modules/values.html).VLiteral

The type of the `v.literal()` validator.

## Type parameters[​](https://docs.convex.dev/api/classes/values.VLiteral.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `Type` |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |

## Hierarchy[​](https://docs.convex.dev/api/classes/values.VLiteral.html#hierarchy "Direct link to Hierarchy")

* `BaseValidator`<`Type`, `IsOptional`>

  ↳ **`VLiteral`**

## Constructors[​](https://docs.convex.dev/api/classes/values.VLiteral.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/values.VLiteral.html#constructor "Direct link to constructor")

• **new VLiteral**<`Type`, `IsOptional`>(`«destructured»`)

Usually you'd use `v.literal(value)` instead.

#### Type parameters[​](https://docs.convex.dev/api/classes/values.VLiteral.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `Type` |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |

#### Parameters[​](https://docs.convex.dev/api/classes/values.VLiteral.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `«destructured»` | `Object` |
| › `isOptional` | `IsOptional` |
| › `value` | `Type` |

#### Overrides[​](https://docs.convex.dev/api/classes/values.VLiteral.html#overrides "Direct link to Overrides")

BaseValidator&lt;Type, IsOptional&gt;.constructor

#### Defined in[​](https://docs.convex.dev/api/classes/values.VLiteral.html#defined-in "Direct link to Defined in")

[values/validators.ts:423](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L423)

## Properties[​](https://docs.convex.dev/api/classes/values.VLiteral.html#properties "Direct link to Properties")

### type[​](https://docs.convex.dev/api/classes/values.VLiteral.html#type "Direct link to type")

• `Readonly` **type**: `Type`

Only for TypeScript, the TS type of the JS values validated
by this validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VLiteral.html#inherited-from "Direct link to Inherited from")

BaseValidator.type

#### Defined in[​](https://docs.convex.dev/api/classes/values.VLiteral.html#defined-in-1 "Direct link to Defined in")

[values/validators.ts:22](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L22)

---

### fieldPaths[​](https://docs.convex.dev/api/classes/values.VLiteral.html#fieldpaths "Direct link to fieldPaths")

• `Readonly` **fieldPaths**: `never`

Only for TypeScript, if this an Object validator, then
this is the TS type of its property names.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VLiteral.html#inherited-from-1 "Direct link to Inherited from")

BaseValidator.fieldPaths

#### Defined in[​](https://docs.convex.dev/api/classes/values.VLiteral.html#defined-in-2 "Direct link to Defined in")

[values/validators.ts:27](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L27)

---

### isOptional[​](https://docs.convex.dev/api/classes/values.VLiteral.html#isoptional "Direct link to isOptional")

• `Readonly` **isOptional**: `IsOptional`

Whether this is an optional Object property value validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VLiteral.html#inherited-from-2 "Direct link to Inherited from")

BaseValidator.isOptional

#### Defined in[​](https://docs.convex.dev/api/classes/values.VLiteral.html#defined-in-3 "Direct link to Defined in")

[values/validators.ts:32](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L32)

---

### isConvexValidator[​](https://docs.convex.dev/api/classes/values.VLiteral.html#isconvexvalidator "Direct link to isConvexValidator")

• `Readonly` **isConvexValidator**: `true`

Always `"true"`.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VLiteral.html#inherited-from-3 "Direct link to Inherited from")

BaseValidator.isConvexValidator

#### Defined in[​](https://docs.convex.dev/api/classes/values.VLiteral.html#defined-in-4 "Direct link to Defined in")

[values/validators.ts:37](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L37)

---

### value[​](https://docs.convex.dev/api/classes/values.VLiteral.html#value "Direct link to value")

• `Readonly` **value**: `Type`

The value that the validated values must be equal to.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VLiteral.html#defined-in-5 "Direct link to Defined in")

[values/validators.ts:413](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L413)

---

### kind[​](https://docs.convex.dev/api/classes/values.VLiteral.html#kind "Direct link to kind")

• `Readonly` **kind**: `"literal"`

The kind of validator, `"literal"`.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VLiteral.html#defined-in-6 "Direct link to Defined in")

[values/validators.ts:418](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L418)

[Previous

VInt64](https://docs.convex.dev/api/classes/values.VInt64.html)[Next

VNull](https://docs.convex.dev/api/classes/values.VNull.html)

* [Type parameters](https://docs.convex.dev/api/classes/values.VLiteral.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/classes/values.VLiteral.html#hierarchy)
* [Constructors](https://docs.convex.dev/api/classes/values.VLiteral.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/values.VLiteral.html#constructor)
* [Properties](https://docs.convex.dev/api/classes/values.VLiteral.html#properties)
  + [type](https://docs.convex.dev/api/classes/values.VLiteral.html#type)
  + [fieldPaths](https://docs.convex.dev/api/classes/values.VLiteral.html#fieldpaths)
  + [isOptional](https://docs.convex.dev/api/classes/values.VLiteral.html#isoptional)
  + [isConvexValidator](https://docs.convex.dev/api/classes/values.VLiteral.html#isconvexvalidator)
  + [value](https://docs.convex.dev/api/classes/values.VLiteral.html#value)
  + [kind](https://docs.convex.dev/api/classes/values.VLiteral.html#kind)
