---
title: "Class: VArray<Type, Element, IsOptional> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/values.VArray"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/values](https://docs.convex.dev/api/modules/values.html)
* VArray

Copy as Markdown

Copied!

On this page

[values](https://docs.convex.dev/api/modules/values.html).VArray

The type of the `v.array()` validator.

## Type parameters[​](https://docs.convex.dev/api/classes/values.VArray.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `Type` |
| `Element` | extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `"required"`, `any`> |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |

## Hierarchy[​](https://docs.convex.dev/api/classes/values.VArray.html#hierarchy "Direct link to Hierarchy")

* `BaseValidator`<`Type`, `IsOptional`>

  ↳ **`VArray`**

## Constructors[​](https://docs.convex.dev/api/classes/values.VArray.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/values.VArray.html#constructor "Direct link to constructor")

• **new VArray**<`Type`, `Element`, `IsOptional`>(`«destructured»`)

Usually you'd use `v.array(element)` instead.

#### Type parameters[​](https://docs.convex.dev/api/classes/values.VArray.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `Type` |
| `Element` | extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `"required"`, `any`> |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |

#### Parameters[​](https://docs.convex.dev/api/classes/values.VArray.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `«destructured»` | `Object` |
| › `isOptional` | `IsOptional` |
| › `element` | `Element` |

#### Overrides[​](https://docs.convex.dev/api/classes/values.VArray.html#overrides "Direct link to Overrides")

BaseValidator&lt;Type, IsOptional&gt;.constructor

#### Defined in[​](https://docs.convex.dev/api/classes/values.VArray.html#defined-in "Direct link to Defined in")

[values/validators.ts:472](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L472)

## Properties[​](https://docs.convex.dev/api/classes/values.VArray.html#properties "Direct link to Properties")

### type[​](https://docs.convex.dev/api/classes/values.VArray.html#type "Direct link to type")

• `Readonly` **type**: `Type`

Only for TypeScript, the TS type of the JS values validated
by this validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VArray.html#inherited-from "Direct link to Inherited from")

BaseValidator.type

#### Defined in[​](https://docs.convex.dev/api/classes/values.VArray.html#defined-in-1 "Direct link to Defined in")

[values/validators.ts:22](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L22)

---

### fieldPaths[​](https://docs.convex.dev/api/classes/values.VArray.html#fieldpaths "Direct link to fieldPaths")

• `Readonly` **fieldPaths**: `never`

Only for TypeScript, if this an Object validator, then
this is the TS type of its property names.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VArray.html#inherited-from-1 "Direct link to Inherited from")

BaseValidator.fieldPaths

#### Defined in[​](https://docs.convex.dev/api/classes/values.VArray.html#defined-in-2 "Direct link to Defined in")

[values/validators.ts:27](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L27)

---

### isOptional[​](https://docs.convex.dev/api/classes/values.VArray.html#isoptional "Direct link to isOptional")

• `Readonly` **isOptional**: `IsOptional`

Whether this is an optional Object property value validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VArray.html#inherited-from-2 "Direct link to Inherited from")

BaseValidator.isOptional

#### Defined in[​](https://docs.convex.dev/api/classes/values.VArray.html#defined-in-3 "Direct link to Defined in")

[values/validators.ts:32](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L32)

---

### isConvexValidator[​](https://docs.convex.dev/api/classes/values.VArray.html#isconvexvalidator "Direct link to isConvexValidator")

• `Readonly` **isConvexValidator**: `true`

Always `"true"`.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VArray.html#inherited-from-3 "Direct link to Inherited from")

BaseValidator.isConvexValidator

#### Defined in[​](https://docs.convex.dev/api/classes/values.VArray.html#defined-in-4 "Direct link to Defined in")

[values/validators.ts:37](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L37)

---

### element[​](https://docs.convex.dev/api/classes/values.VArray.html#element "Direct link to element")

• `Readonly` **element**: `Element`

The validator for the elements of the array.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VArray.html#defined-in-5 "Direct link to Defined in")

[values/validators.ts:462](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L462)

---

### kind[​](https://docs.convex.dev/api/classes/values.VArray.html#kind "Direct link to kind")

• `Readonly` **kind**: `"array"`

The kind of validator, `"array"`.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VArray.html#defined-in-6 "Direct link to Defined in")

[values/validators.ts:467](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L467)

[Previous

VAny](https://docs.convex.dev/api/classes/values.VAny.html)[Next

VBoolean](https://docs.convex.dev/api/classes/values.VBoolean.html)

* [Type parameters](https://docs.convex.dev/api/classes/values.VArray.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/classes/values.VArray.html#hierarchy)
* [Constructors](https://docs.convex.dev/api/classes/values.VArray.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/values.VArray.html#constructor)
* [Properties](https://docs.convex.dev/api/classes/values.VArray.html#properties)
  + [type](https://docs.convex.dev/api/classes/values.VArray.html#type)
  + [fieldPaths](https://docs.convex.dev/api/classes/values.VArray.html#fieldpaths)
  + [isOptional](https://docs.convex.dev/api/classes/values.VArray.html#isoptional)
  + [isConvexValidator](https://docs.convex.dev/api/classes/values.VArray.html#isconvexvalidator)
  + [element](https://docs.convex.dev/api/classes/values.VArray.html#element)
  + [kind](https://docs.convex.dev/api/classes/values.VArray.html#kind)
