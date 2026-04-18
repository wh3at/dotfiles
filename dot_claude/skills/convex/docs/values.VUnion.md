---
title: "Class: VUnion<Type, T, IsOptional, FieldPaths> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/values.VUnion"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/values](https://docs.convex.dev/api/modules/values.html)
* VUnion

Copy as Markdown

Copied!

On this page

[values](https://docs.convex.dev/api/modules/values.html).VUnion

The type of the `v.union()` validator.

## Type parameters[​](https://docs.convex.dev/api/classes/values.VUnion.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `Type` |
| `T` | extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `"required"`, `any`>[] |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |
| `FieldPaths` | extends `string` = `T`[`number`][`"fieldPaths"`] |

## Hierarchy[​](https://docs.convex.dev/api/classes/values.VUnion.html#hierarchy "Direct link to Hierarchy")

* `BaseValidator`<`Type`, `IsOptional`, `FieldPaths`>

  ↳ **`VUnion`**

## Constructors[​](https://docs.convex.dev/api/classes/values.VUnion.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/values.VUnion.html#constructor "Direct link to constructor")

• **new VUnion**<`Type`, `T`, `IsOptional`, `FieldPaths`>(`«destructured»`)

Usually you'd use `v.union(...members)` instead.

#### Type parameters[​](https://docs.convex.dev/api/classes/values.VUnion.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `Type` |
| `T` | extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `"required"`, `any`>[] |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |
| `FieldPaths` | extends `string` = `T`[`number`][`"fieldPaths"`] |

#### Parameters[​](https://docs.convex.dev/api/classes/values.VUnion.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `«destructured»` | `Object` |
| › `isOptional` | `IsOptional` |
| › `members` | `T` |

#### Overrides[​](https://docs.convex.dev/api/classes/values.VUnion.html#overrides "Direct link to Overrides")

BaseValidator&lt;Type, IsOptional, FieldPaths&gt;.constructor

#### Defined in[​](https://docs.convex.dev/api/classes/values.VUnion.html#defined-in "Direct link to Defined in")

[values/validators.ts:592](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L592)

## Properties[​](https://docs.convex.dev/api/classes/values.VUnion.html#properties "Direct link to Properties")

### type[​](https://docs.convex.dev/api/classes/values.VUnion.html#type "Direct link to type")

• `Readonly` **type**: `Type`

Only for TypeScript, the TS type of the JS values validated
by this validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VUnion.html#inherited-from "Direct link to Inherited from")

BaseValidator.type

#### Defined in[​](https://docs.convex.dev/api/classes/values.VUnion.html#defined-in-1 "Direct link to Defined in")

[values/validators.ts:22](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L22)

---

### fieldPaths[​](https://docs.convex.dev/api/classes/values.VUnion.html#fieldpaths "Direct link to fieldPaths")

• `Readonly` **fieldPaths**: `FieldPaths`

Only for TypeScript, if this an Object validator, then
this is the TS type of its property names.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VUnion.html#inherited-from-1 "Direct link to Inherited from")

BaseValidator.fieldPaths

#### Defined in[​](https://docs.convex.dev/api/classes/values.VUnion.html#defined-in-2 "Direct link to Defined in")

[values/validators.ts:27](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L27)

---

### isOptional[​](https://docs.convex.dev/api/classes/values.VUnion.html#isoptional "Direct link to isOptional")

• `Readonly` **isOptional**: `IsOptional`

Whether this is an optional Object property value validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VUnion.html#inherited-from-2 "Direct link to Inherited from")

BaseValidator.isOptional

#### Defined in[​](https://docs.convex.dev/api/classes/values.VUnion.html#defined-in-3 "Direct link to Defined in")

[values/validators.ts:32](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L32)

---

### isConvexValidator[​](https://docs.convex.dev/api/classes/values.VUnion.html#isconvexvalidator "Direct link to isConvexValidator")

• `Readonly` **isConvexValidator**: `true`

Always `"true"`.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VUnion.html#inherited-from-3 "Direct link to Inherited from")

BaseValidator.isConvexValidator

#### Defined in[​](https://docs.convex.dev/api/classes/values.VUnion.html#defined-in-4 "Direct link to Defined in")

[values/validators.ts:37](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L37)

---

### members[​](https://docs.convex.dev/api/classes/values.VUnion.html#members "Direct link to members")

• `Readonly` **members**: `T`

The array of validators, one of which must match the value.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VUnion.html#defined-in-5 "Direct link to Defined in")

[values/validators.ts:582](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L582)

---

### kind[​](https://docs.convex.dev/api/classes/values.VUnion.html#kind "Direct link to kind")

• `Readonly` **kind**: `"union"`

The kind of validator, `"union"`.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VUnion.html#defined-in-6 "Direct link to Defined in")

[values/validators.ts:587](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L587)

[Previous

VString](https://docs.convex.dev/api/classes/values.VString.html)[Next

Base64](https://docs.convex.dev/api/namespaces/values.Base64.html)

* [Type parameters](https://docs.convex.dev/api/classes/values.VUnion.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/classes/values.VUnion.html#hierarchy)
* [Constructors](https://docs.convex.dev/api/classes/values.VUnion.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/values.VUnion.html#constructor)
* [Properties](https://docs.convex.dev/api/classes/values.VUnion.html#properties)
  + [type](https://docs.convex.dev/api/classes/values.VUnion.html#type)
  + [fieldPaths](https://docs.convex.dev/api/classes/values.VUnion.html#fieldpaths)
  + [isOptional](https://docs.convex.dev/api/classes/values.VUnion.html#isoptional)
  + [isConvexValidator](https://docs.convex.dev/api/classes/values.VUnion.html#isconvexvalidator)
  + [members](https://docs.convex.dev/api/classes/values.VUnion.html#members)
  + [kind](https://docs.convex.dev/api/classes/values.VUnion.html#kind)
