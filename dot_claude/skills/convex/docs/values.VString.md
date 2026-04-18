---
title: "Class: VString<Type, IsOptional> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/values.VString"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/values](https://docs.convex.dev/api/modules/values.html)
* VString

Copy as Markdown

Copied!

On this page

[values](https://docs.convex.dev/api/modules/values.html).VString

The type of the `v.string()` validator.

## Type parameters[​](https://docs.convex.dev/api/classes/values.VString.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `string` |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |

## Hierarchy[​](https://docs.convex.dev/api/classes/values.VString.html#hierarchy "Direct link to Hierarchy")

* `BaseValidator`<`Type`, `IsOptional`>

  ↳ **`VString`**

## Constructors[​](https://docs.convex.dev/api/classes/values.VString.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/values.VString.html#constructor "Direct link to constructor")

• **new VString**<`Type`, `IsOptional`>(`«destructured»`)

#### Type parameters[​](https://docs.convex.dev/api/classes/values.VString.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `string` |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |

#### Parameters[​](https://docs.convex.dev/api/classes/values.VString.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `«destructured»` | `Object` |
| › `isOptional` | `IsOptional` |

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VString.html#inherited-from "Direct link to Inherited from")

BaseValidator<Type, IsOptional>.constructor

#### Defined in[​](https://docs.convex.dev/api/classes/values.VString.html#defined-in "Direct link to Defined in")

[values/validators.ts:39](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L39)

## Properties[​](https://docs.convex.dev/api/classes/values.VString.html#properties "Direct link to Properties")

### type[​](https://docs.convex.dev/api/classes/values.VString.html#type "Direct link to type")

• `Readonly` **type**: `Type`

Only for TypeScript, the TS type of the JS values validated
by this validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VString.html#inherited-from-1 "Direct link to Inherited from")

BaseValidator.type

#### Defined in[​](https://docs.convex.dev/api/classes/values.VString.html#defined-in-1 "Direct link to Defined in")

[values/validators.ts:22](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L22)

---

### fieldPaths[​](https://docs.convex.dev/api/classes/values.VString.html#fieldpaths "Direct link to fieldPaths")

• `Readonly` **fieldPaths**: `never`

Only for TypeScript, if this an Object validator, then
this is the TS type of its property names.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VString.html#inherited-from-2 "Direct link to Inherited from")

BaseValidator.fieldPaths

#### Defined in[​](https://docs.convex.dev/api/classes/values.VString.html#defined-in-2 "Direct link to Defined in")

[values/validators.ts:27](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L27)

---

### isOptional[​](https://docs.convex.dev/api/classes/values.VString.html#isoptional "Direct link to isOptional")

• `Readonly` **isOptional**: `IsOptional`

Whether this is an optional Object property value validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VString.html#inherited-from-3 "Direct link to Inherited from")

BaseValidator.isOptional

#### Defined in[​](https://docs.convex.dev/api/classes/values.VString.html#defined-in-3 "Direct link to Defined in")

[values/validators.ts:32](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L32)

---

### isConvexValidator[​](https://docs.convex.dev/api/classes/values.VString.html#isconvexvalidator "Direct link to isConvexValidator")

• `Readonly` **isConvexValidator**: `true`

Always `"true"`.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VString.html#inherited-from-4 "Direct link to Inherited from")

BaseValidator.isConvexValidator

#### Defined in[​](https://docs.convex.dev/api/classes/values.VString.html#defined-in-4 "Direct link to Defined in")

[values/validators.ts:37](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L37)

---

### kind[​](https://docs.convex.dev/api/classes/values.VString.html#kind "Direct link to kind")

• `Readonly` **kind**: `"string"`

The kind of validator, `"string"`.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VString.html#defined-in-5 "Direct link to Defined in")

[values/validators.ts:199](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L199)

[Previous

VRecord](https://docs.convex.dev/api/classes/values.VRecord.html)[Next

VUnion](https://docs.convex.dev/api/classes/values.VUnion.html)

* [Type parameters](https://docs.convex.dev/api/classes/values.VString.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/classes/values.VString.html#hierarchy)
* [Constructors](https://docs.convex.dev/api/classes/values.VString.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/values.VString.html#constructor)
* [Properties](https://docs.convex.dev/api/classes/values.VString.html#properties)
  + [type](https://docs.convex.dev/api/classes/values.VString.html#type)
  + [fieldPaths](https://docs.convex.dev/api/classes/values.VString.html#fieldpaths)
  + [isOptional](https://docs.convex.dev/api/classes/values.VString.html#isoptional)
  + [isConvexValidator](https://docs.convex.dev/api/classes/values.VString.html#isconvexvalidator)
  + [kind](https://docs.convex.dev/api/classes/values.VString.html#kind)
