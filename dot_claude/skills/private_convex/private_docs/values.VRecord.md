---
title: "Class: VRecord<Type, Key, Value, IsOptional, FieldPaths> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/values.VRecord"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/values](https://docs.convex.dev/api/modules/values.html)
* VRecord

Copy as Markdown

Copied!

On this page

[values](https://docs.convex.dev/api/modules/values.html).VRecord

The type of the `v.record()` validator.

## Type parameters[​](https://docs.convex.dev/api/classes/values.VRecord.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `Type` |
| `Key` | extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`string`, `"required"`, `any`> |
| `Value` | extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `"required"`, `any`> |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |
| `FieldPaths` | extends `string` = `string` |

## Hierarchy[​](https://docs.convex.dev/api/classes/values.VRecord.html#hierarchy "Direct link to Hierarchy")

* `BaseValidator`<`Type`, `IsOptional`, `FieldPaths`>

  ↳ **`VRecord`**

## Constructors[​](https://docs.convex.dev/api/classes/values.VRecord.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/values.VRecord.html#constructor "Direct link to constructor")

• **new VRecord**<`Type`, `Key`, `Value`, `IsOptional`, `FieldPaths`>(`«destructured»`)

Usually you'd use `v.record(key, value)` instead.

#### Type parameters[​](https://docs.convex.dev/api/classes/values.VRecord.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `Type` |
| `Key` | extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`string`, `"required"`, `any`> |
| `Value` | extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `"required"`, `any`> |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |
| `FieldPaths` | extends `string` = `string` |

#### Parameters[​](https://docs.convex.dev/api/classes/values.VRecord.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `«destructured»` | `Object` |
| › `isOptional` | `IsOptional` |
| › `key` | `Key` |
| › `value` | `Value` |

#### Overrides[​](https://docs.convex.dev/api/classes/values.VRecord.html#overrides "Direct link to Overrides")

BaseValidator&lt;Type, IsOptional, FieldPaths&gt;.constructor

#### Defined in[​](https://docs.convex.dev/api/classes/values.VRecord.html#defined-in "Direct link to Defined in")

[values/validators.ts:526](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L526)

## Properties[​](https://docs.convex.dev/api/classes/values.VRecord.html#properties "Direct link to Properties")

### type[​](https://docs.convex.dev/api/classes/values.VRecord.html#type "Direct link to type")

• `Readonly` **type**: `Type`

Only for TypeScript, the TS type of the JS values validated
by this validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VRecord.html#inherited-from "Direct link to Inherited from")

BaseValidator.type

#### Defined in[​](https://docs.convex.dev/api/classes/values.VRecord.html#defined-in-1 "Direct link to Defined in")

[values/validators.ts:22](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L22)

---

### fieldPaths[​](https://docs.convex.dev/api/classes/values.VRecord.html#fieldpaths "Direct link to fieldPaths")

• `Readonly` **fieldPaths**: `FieldPaths`

Only for TypeScript, if this an Object validator, then
this is the TS type of its property names.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VRecord.html#inherited-from-1 "Direct link to Inherited from")

BaseValidator.fieldPaths

#### Defined in[​](https://docs.convex.dev/api/classes/values.VRecord.html#defined-in-2 "Direct link to Defined in")

[values/validators.ts:27](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L27)

---

### isOptional[​](https://docs.convex.dev/api/classes/values.VRecord.html#isoptional "Direct link to isOptional")

• `Readonly` **isOptional**: `IsOptional`

Whether this is an optional Object property value validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VRecord.html#inherited-from-2 "Direct link to Inherited from")

BaseValidator.isOptional

#### Defined in[​](https://docs.convex.dev/api/classes/values.VRecord.html#defined-in-3 "Direct link to Defined in")

[values/validators.ts:32](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L32)

---

### isConvexValidator[​](https://docs.convex.dev/api/classes/values.VRecord.html#isconvexvalidator "Direct link to isConvexValidator")

• `Readonly` **isConvexValidator**: `true`

Always `"true"`.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VRecord.html#inherited-from-3 "Direct link to Inherited from")

BaseValidator.isConvexValidator

#### Defined in[​](https://docs.convex.dev/api/classes/values.VRecord.html#defined-in-4 "Direct link to Defined in")

[values/validators.ts:37](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L37)

---

### key[​](https://docs.convex.dev/api/classes/values.VRecord.html#key "Direct link to key")

• `Readonly` **key**: `Key`

The validator for the keys of the record.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VRecord.html#defined-in-5 "Direct link to Defined in")

[values/validators.ts:511](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L511)

---

### value[​](https://docs.convex.dev/api/classes/values.VRecord.html#value "Direct link to value")

• `Readonly` **value**: `Value`

The validator for the values of the record.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VRecord.html#defined-in-6 "Direct link to Defined in")

[values/validators.ts:516](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L516)

---

### kind[​](https://docs.convex.dev/api/classes/values.VRecord.html#kind "Direct link to kind")

• `Readonly` **kind**: `"record"`

The kind of validator, `"record"`.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VRecord.html#defined-in-7 "Direct link to Defined in")

[values/validators.ts:521](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L521)

[Previous

VObject](https://docs.convex.dev/api/classes/values.VObject.html)[Next

VString](https://docs.convex.dev/api/classes/values.VString.html)

* [Type parameters](https://docs.convex.dev/api/classes/values.VRecord.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/classes/values.VRecord.html#hierarchy)
* [Constructors](https://docs.convex.dev/api/classes/values.VRecord.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/values.VRecord.html#constructor)
* [Properties](https://docs.convex.dev/api/classes/values.VRecord.html#properties)
  + [type](https://docs.convex.dev/api/classes/values.VRecord.html#type)
  + [fieldPaths](https://docs.convex.dev/api/classes/values.VRecord.html#fieldpaths)
  + [isOptional](https://docs.convex.dev/api/classes/values.VRecord.html#isoptional)
  + [isConvexValidator](https://docs.convex.dev/api/classes/values.VRecord.html#isconvexvalidator)
  + [key](https://docs.convex.dev/api/classes/values.VRecord.html#key)
  + [value](https://docs.convex.dev/api/classes/values.VRecord.html#value)
  + [kind](https://docs.convex.dev/api/classes/values.VRecord.html#kind)
