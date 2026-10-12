---
title: "Class: VId<Type, IsOptional> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/values.VId"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/values](https://docs.convex.dev/api/modules/values.html)
* VId

Copy as Markdown

Copied!

On this page

[values](https://docs.convex.dev/api/modules/values.html).VId

The type of the `v.id(tableName)` validator.

## Type parameters[​](https://docs.convex.dev/api/classes/values.VId.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `Type` |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |

## Hierarchy[​](https://docs.convex.dev/api/classes/values.VId.html#hierarchy "Direct link to Hierarchy")

* `BaseValidator`<`Type`, `IsOptional`>

  ↳ **`VId`**

## Constructors[​](https://docs.convex.dev/api/classes/values.VId.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/values.VId.html#constructor "Direct link to constructor")

• **new VId**<`Type`, `IsOptional`>(`«destructured»`)

Usually you'd use `v.id(tableName)` instead.

#### Type parameters[​](https://docs.convex.dev/api/classes/values.VId.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `Type` |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |

#### Parameters[​](https://docs.convex.dev/api/classes/values.VId.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `«destructured»` | `Object` |
| › `isOptional` | `IsOptional` |
| › `tableName` | `TableNameFromType`<`Type`> |

#### Overrides[​](https://docs.convex.dev/api/classes/values.VId.html#overrides "Direct link to Overrides")

BaseValidator&lt;Type, IsOptional&gt;.constructor

#### Defined in[​](https://docs.convex.dev/api/classes/values.VId.html#defined-in "Direct link to Defined in")

[values/validators.ts:69](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L69)

## Properties[​](https://docs.convex.dev/api/classes/values.VId.html#properties "Direct link to Properties")

### type[​](https://docs.convex.dev/api/classes/values.VId.html#type "Direct link to type")

• `Readonly` **type**: `Type`

Only for TypeScript, the TS type of the JS values validated
by this validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VId.html#inherited-from "Direct link to Inherited from")

BaseValidator.type

#### Defined in[​](https://docs.convex.dev/api/classes/values.VId.html#defined-in-1 "Direct link to Defined in")

[values/validators.ts:22](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L22)

---

### fieldPaths[​](https://docs.convex.dev/api/classes/values.VId.html#fieldpaths "Direct link to fieldPaths")

• `Readonly` **fieldPaths**: `never`

Only for TypeScript, if this an Object validator, then
this is the TS type of its property names.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VId.html#inherited-from-1 "Direct link to Inherited from")

BaseValidator.fieldPaths

#### Defined in[​](https://docs.convex.dev/api/classes/values.VId.html#defined-in-2 "Direct link to Defined in")

[values/validators.ts:27](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L27)

---

### isOptional[​](https://docs.convex.dev/api/classes/values.VId.html#isoptional "Direct link to isOptional")

• `Readonly` **isOptional**: `IsOptional`

Whether this is an optional Object property value validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VId.html#inherited-from-2 "Direct link to Inherited from")

BaseValidator.isOptional

#### Defined in[​](https://docs.convex.dev/api/classes/values.VId.html#defined-in-3 "Direct link to Defined in")

[values/validators.ts:32](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L32)

---

### isConvexValidator[​](https://docs.convex.dev/api/classes/values.VId.html#isconvexvalidator "Direct link to isConvexValidator")

• `Readonly` **isConvexValidator**: `true`

Always `"true"`.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VId.html#inherited-from-3 "Direct link to Inherited from")

BaseValidator.isConvexValidator

#### Defined in[​](https://docs.convex.dev/api/classes/values.VId.html#defined-in-4 "Direct link to Defined in")

[values/validators.ts:37](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L37)

---

### tableName[​](https://docs.convex.dev/api/classes/values.VId.html#tablename "Direct link to tableName")

• `Readonly` **tableName**: `TableNameFromType`<`Type`>

The name of the table that the validated IDs must belong to.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VId.html#defined-in-5 "Direct link to Defined in")

[values/validators.ts:59](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L59)

---

### kind[​](https://docs.convex.dev/api/classes/values.VId.html#kind "Direct link to kind")

• `Readonly` **kind**: `"id"`

The kind of validator, `"id"`.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VId.html#defined-in-6 "Direct link to Defined in")

[values/validators.ts:64](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L64)

[Previous

VFloat64](https://docs.convex.dev/api/classes/values.VFloat64.html)[Next

VInt64](https://docs.convex.dev/api/classes/values.VInt64.html)

* [Type parameters](https://docs.convex.dev/api/classes/values.VId.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/classes/values.VId.html#hierarchy)
* [Constructors](https://docs.convex.dev/api/classes/values.VId.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/values.VId.html#constructor)
* [Properties](https://docs.convex.dev/api/classes/values.VId.html#properties)
  + [type](https://docs.convex.dev/api/classes/values.VId.html#type)
  + [fieldPaths](https://docs.convex.dev/api/classes/values.VId.html#fieldpaths)
  + [isOptional](https://docs.convex.dev/api/classes/values.VId.html#isoptional)
  + [isConvexValidator](https://docs.convex.dev/api/classes/values.VId.html#isconvexvalidator)
  + [tableName](https://docs.convex.dev/api/classes/values.VId.html#tablename)
  + [kind](https://docs.convex.dev/api/classes/values.VId.html#kind)
