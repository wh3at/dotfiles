---
title: "Class: VBytes<Type, IsOptional> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/values.VBytes"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/values](https://docs.convex.dev/api/modules/values.html)
* VBytes

Copy as Markdown

Copied!

On this page

[values](https://docs.convex.dev/api/modules/values.html).VBytes

The type of the `v.bytes()` validator.

## Type parameters[​](https://docs.convex.dev/api/classes/values.VBytes.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `ArrayBuffer` |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |

## Hierarchy[​](https://docs.convex.dev/api/classes/values.VBytes.html#hierarchy "Direct link to Hierarchy")

* `BaseValidator`<`Type`, `IsOptional`>

  ↳ **`VBytes`**

## Constructors[​](https://docs.convex.dev/api/classes/values.VBytes.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/values.VBytes.html#constructor "Direct link to constructor")

• **new VBytes**<`Type`, `IsOptional`>(`«destructured»`)

#### Type parameters[​](https://docs.convex.dev/api/classes/values.VBytes.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `ArrayBuffer` |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |

#### Parameters[​](https://docs.convex.dev/api/classes/values.VBytes.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `«destructured»` | `Object` |
| › `isOptional` | `IsOptional` |

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VBytes.html#inherited-from "Direct link to Inherited from")

BaseValidator<Type, IsOptional>.constructor

#### Defined in[​](https://docs.convex.dev/api/classes/values.VBytes.html#defined-in "Direct link to Defined in")

[values/validators.ts:39](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L39)

## Properties[​](https://docs.convex.dev/api/classes/values.VBytes.html#properties "Direct link to Properties")

### type[​](https://docs.convex.dev/api/classes/values.VBytes.html#type "Direct link to type")

• `Readonly` **type**: `Type`

Only for TypeScript, the TS type of the JS values validated
by this validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VBytes.html#inherited-from-1 "Direct link to Inherited from")

BaseValidator.type

#### Defined in[​](https://docs.convex.dev/api/classes/values.VBytes.html#defined-in-1 "Direct link to Defined in")

[values/validators.ts:22](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L22)

---

### fieldPaths[​](https://docs.convex.dev/api/classes/values.VBytes.html#fieldpaths "Direct link to fieldPaths")

• `Readonly` **fieldPaths**: `never`

Only for TypeScript, if this an Object validator, then
this is the TS type of its property names.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VBytes.html#inherited-from-2 "Direct link to Inherited from")

BaseValidator.fieldPaths

#### Defined in[​](https://docs.convex.dev/api/classes/values.VBytes.html#defined-in-2 "Direct link to Defined in")

[values/validators.ts:27](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L27)

---

### isOptional[​](https://docs.convex.dev/api/classes/values.VBytes.html#isoptional "Direct link to isOptional")

• `Readonly` **isOptional**: `IsOptional`

Whether this is an optional Object property value validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VBytes.html#inherited-from-3 "Direct link to Inherited from")

BaseValidator.isOptional

#### Defined in[​](https://docs.convex.dev/api/classes/values.VBytes.html#defined-in-3 "Direct link to Defined in")

[values/validators.ts:32](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L32)

---

### isConvexValidator[​](https://docs.convex.dev/api/classes/values.VBytes.html#isconvexvalidator "Direct link to isConvexValidator")

• `Readonly` **isConvexValidator**: `true`

Always `"true"`.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VBytes.html#inherited-from-4 "Direct link to Inherited from")

BaseValidator.isConvexValidator

#### Defined in[​](https://docs.convex.dev/api/classes/values.VBytes.html#defined-in-4 "Direct link to Defined in")

[values/validators.ts:37](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L37)

---

### kind[​](https://docs.convex.dev/api/classes/values.VBytes.html#kind "Direct link to kind")

• `Readonly` **kind**: `"bytes"`

The kind of validator, `"bytes"`.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VBytes.html#defined-in-5 "Direct link to Defined in")

[values/validators.ts:177](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L177)

[Previous

VBoolean](https://docs.convex.dev/api/classes/values.VBoolean.html)[Next

VFloat64](https://docs.convex.dev/api/classes/values.VFloat64.html)

* [Type parameters](https://docs.convex.dev/api/classes/values.VBytes.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/classes/values.VBytes.html#hierarchy)
* [Constructors](https://docs.convex.dev/api/classes/values.VBytes.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/values.VBytes.html#constructor)
* [Properties](https://docs.convex.dev/api/classes/values.VBytes.html#properties)
  + [type](https://docs.convex.dev/api/classes/values.VBytes.html#type)
  + [fieldPaths](https://docs.convex.dev/api/classes/values.VBytes.html#fieldpaths)
  + [isOptional](https://docs.convex.dev/api/classes/values.VBytes.html#isoptional)
  + [isConvexValidator](https://docs.convex.dev/api/classes/values.VBytes.html#isconvexvalidator)
  + [kind](https://docs.convex.dev/api/classes/values.VBytes.html#kind)
