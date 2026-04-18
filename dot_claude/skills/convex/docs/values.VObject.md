---
title: "Class: VObject<Type, Fields, IsOptional, FieldPaths> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/values.VObject"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/values](https://docs.convex.dev/api/modules/values.html)
* VObject

Copy as Markdown

Copied!

On this page

[values](https://docs.convex.dev/api/modules/values.html).VObject

The type of the `v.object()` validator.

## Type parameters[​](https://docs.convex.dev/api/classes/values.VObject.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `Type` |
| `Fields` | extends `Record`<`string`, [`GenericValidator`](https://docs.convex.dev/api/modules/values.html#genericvalidator)> |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |
| `FieldPaths` | extends `string` = { [Property in keyof Fields]: JoinFieldPaths<Property & string, Fields[Property]["fieldPaths"]> | Property }[keyof `Fields`] & `string` |

## Hierarchy[​](https://docs.convex.dev/api/classes/values.VObject.html#hierarchy "Direct link to Hierarchy")

* `BaseValidator`<`Type`, `IsOptional`, `FieldPaths`>

  ↳ **`VObject`**

## Constructors[​](https://docs.convex.dev/api/classes/values.VObject.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/values.VObject.html#constructor "Direct link to constructor")

• **new VObject**<`Type`, `Fields`, `IsOptional`, `FieldPaths`>(`«destructured»`)

Usually you'd use `v.object({ ... })` instead.

#### Type parameters[​](https://docs.convex.dev/api/classes/values.VObject.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Type` | `Type` |
| `Fields` | extends `Record`<`string`, [`GenericValidator`](https://docs.convex.dev/api/modules/values.html#genericvalidator)> |
| `IsOptional` | extends [`OptionalProperty`](https://docs.convex.dev/api/modules/values.html#optionalproperty) = `"required"` |
| `FieldPaths` | extends `string` = { [Property in string | number | symbol]: Property | `${Property & string}.${Fields[Property]["fieldPaths"]}` }[keyof `Fields`] & `string` |

#### Parameters[​](https://docs.convex.dev/api/classes/values.VObject.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `«destructured»` | `Object` |
| › `isOptional` | `IsOptional` |
| › `fields` | `Fields` |

#### Overrides[​](https://docs.convex.dev/api/classes/values.VObject.html#overrides "Direct link to Overrides")

BaseValidator&lt;Type, IsOptional, FieldPaths&gt;.constructor

#### Defined in[​](https://docs.convex.dev/api/classes/values.VObject.html#defined-in "Direct link to Defined in")

[values/validators.ts:289](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L289)

## Properties[​](https://docs.convex.dev/api/classes/values.VObject.html#properties "Direct link to Properties")

### type[​](https://docs.convex.dev/api/classes/values.VObject.html#type "Direct link to type")

• `Readonly` **type**: `Type`

Only for TypeScript, the TS type of the JS values validated
by this validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VObject.html#inherited-from "Direct link to Inherited from")

BaseValidator.type

#### Defined in[​](https://docs.convex.dev/api/classes/values.VObject.html#defined-in-1 "Direct link to Defined in")

[values/validators.ts:22](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L22)

---

### fieldPaths[​](https://docs.convex.dev/api/classes/values.VObject.html#fieldpaths "Direct link to fieldPaths")

• `Readonly` **fieldPaths**: `FieldPaths`

Only for TypeScript, if this an Object validator, then
this is the TS type of its property names.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VObject.html#inherited-from-1 "Direct link to Inherited from")

BaseValidator.fieldPaths

#### Defined in[​](https://docs.convex.dev/api/classes/values.VObject.html#defined-in-2 "Direct link to Defined in")

[values/validators.ts:27](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L27)

---

### isOptional[​](https://docs.convex.dev/api/classes/values.VObject.html#isoptional "Direct link to isOptional")

• `Readonly` **isOptional**: `IsOptional`

Whether this is an optional Object property value validator.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VObject.html#inherited-from-2 "Direct link to Inherited from")

BaseValidator.isOptional

#### Defined in[​](https://docs.convex.dev/api/classes/values.VObject.html#defined-in-3 "Direct link to Defined in")

[values/validators.ts:32](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L32)

---

### isConvexValidator[​](https://docs.convex.dev/api/classes/values.VObject.html#isconvexvalidator "Direct link to isConvexValidator")

• `Readonly` **isConvexValidator**: `true`

Always `"true"`.

#### Inherited from[​](https://docs.convex.dev/api/classes/values.VObject.html#inherited-from-3 "Direct link to Inherited from")

BaseValidator.isConvexValidator

#### Defined in[​](https://docs.convex.dev/api/classes/values.VObject.html#defined-in-4 "Direct link to Defined in")

[values/validators.ts:37](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L37)

---

### fields[​](https://docs.convex.dev/api/classes/values.VObject.html#fields "Direct link to fields")

• `Readonly` **fields**: `Fields`

An object with the validator for each property.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VObject.html#defined-in-5 "Direct link to Defined in")

[values/validators.ts:279](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L279)

---

### kind[​](https://docs.convex.dev/api/classes/values.VObject.html#kind "Direct link to kind")

• `Readonly` **kind**: `"object"`

The kind of validator, `"object"`.

#### Defined in[​](https://docs.convex.dev/api/classes/values.VObject.html#defined-in-6 "Direct link to Defined in")

[values/validators.ts:284](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L284)

## Methods[​](https://docs.convex.dev/api/classes/values.VObject.html#methods "Direct link to Methods")

### omit[​](https://docs.convex.dev/api/classes/values.VObject.html#omit "Direct link to omit")

▸ **omit**<`K`>(`...fields`): [`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<[`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Omit`<`Type`, `K`>>, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Omit`<`Fields`, `K`>>, `IsOptional`, { [Property in string | number | symbol]: Property | `${Property & string}.${Expand<Omit<Fields, K>>[Property]["fieldPaths"]}` }[keyof [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Omit`<`Fields`, `K`>>] & `string`>

Create a new VObject with the specified fields omitted.

#### Type parameters[​](https://docs.convex.dev/api/classes/values.VObject.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `K` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/classes/values.VObject.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `...fields` | `K`[] | The field names to omit from this VObject. |

#### Returns[​](https://docs.convex.dev/api/classes/values.VObject.html#returns "Direct link to Returns")

[`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<[`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Omit`<`Type`, `K`>>, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Omit`<`Fields`, `K`>>, `IsOptional`, { [Property in string | number | symbol]: Property | `${Property & string}.${Expand<Omit<Fields, K>>[Property]["fieldPaths"]}` }[keyof [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Omit`<`Fields`, `K`>>] & `string`>

#### Defined in[​](https://docs.convex.dev/api/classes/values.VObject.html#defined-in-7 "Direct link to Defined in")

[values/validators.ts:331](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L331)

---

### pick[​](https://docs.convex.dev/api/classes/values.VObject.html#pick "Direct link to pick")

▸ **pick**<`K`>(`...fields`): [`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<[`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Pick`<`Type`, `Extract`<keyof `Type`, `K`>>>, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Pick`<`Fields`, `K`>>, `IsOptional`, { [Property in string | number | symbol]: Property | `${Property & string}.${Expand<Pick<Fields, K>>[Property]["fieldPaths"]}` }[keyof [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Pick`<`Fields`, `K`>>] & `string`>

Create a new VObject with only the specified fields.

#### Type parameters[​](https://docs.convex.dev/api/classes/values.VObject.html#type-parameters-3 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `K` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/classes/values.VObject.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `...fields` | `K`[] | The field names to pick from this VObject. |

#### Returns[​](https://docs.convex.dev/api/classes/values.VObject.html#returns-1 "Direct link to Returns")

[`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<[`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Pick`<`Type`, `Extract`<keyof `Type`, `K`>>>, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Pick`<`Fields`, `K`>>, `IsOptional`, { [Property in string | number | symbol]: Property | `${Property & string}.${Expand<Pick<Fields, K>>[Property]["fieldPaths"]}` }[keyof [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Pick`<`Fields`, `K`>>] & `string`>

#### Defined in[​](https://docs.convex.dev/api/classes/values.VObject.html#defined-in-8 "Direct link to Defined in")

[values/validators.ts:348](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L348)

---

### partial[​](https://docs.convex.dev/api/classes/values.VObject.html#partial "Direct link to partial")

▸ **partial**(): [`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<{ [K in string | number | symbol]?: Type[K] }, { [K in string | number | symbol]: VOptional<Fields[K]> }, `IsOptional`, { [Property in string | number | symbol]: Property | `${Property & string}.${{ [K in string | number | symbol]: VOptional<Fields[K]> }[Property]["fieldPaths"]}` }[keyof `Fields`] & `string`>

Create a new VObject with all fields marked as optional.

#### Returns[​](https://docs.convex.dev/api/classes/values.VObject.html#returns-2 "Direct link to Returns")

[`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<{ [K in string | number | symbol]?: Type[K] }, { [K in string | number | symbol]: VOptional<Fields[K]> }, `IsOptional`, { [Property in string | number | symbol]: Property | `${Property & string}.${{ [K in string | number | symbol]: VOptional<Fields[K]> }[Property]["fieldPaths"]}` }[keyof `Fields`] & `string`>

#### Defined in[​](https://docs.convex.dev/api/classes/values.VObject.html#defined-in-9 "Direct link to Defined in")

[values/validators.ts:368](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L368)

---

### extend[​](https://docs.convex.dev/api/classes/values.VObject.html#extend "Direct link to extend")

▸ **extend**<`NewFields`>(`fields`): [`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<[`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Type` & [`ObjectType`](https://docs.convex.dev/api/modules/values.html#objecttype)<`NewFields`>>, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Fields` & `NewFields`>, `IsOptional`, { [Property in string | number | symbol]: Property | `${Property & string}.${Expand<Fields & NewFields>[Property]["fieldPaths"]}` }[keyof [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Fields` & `NewFields`>] & `string`>

Create a new VObject with additional fields merged in.

#### Type parameters[​](https://docs.convex.dev/api/classes/values.VObject.html#type-parameters-4 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `NewFields` | extends `Record`<`string`, [`GenericValidator`](https://docs.convex.dev/api/modules/values.html#genericvalidator)> |

#### Parameters[​](https://docs.convex.dev/api/classes/values.VObject.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `fields` | `NewFields` | An object with additional validators to merge into this VObject. |

#### Returns[​](https://docs.convex.dev/api/classes/values.VObject.html#returns-3 "Direct link to Returns")

[`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<[`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Type` & [`ObjectType`](https://docs.convex.dev/api/modules/values.html#objecttype)<`NewFields`>>, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Fields` & `NewFields`>, `IsOptional`, { [Property in string | number | symbol]: Property | `${Property & string}.${Expand<Fields & NewFields>[Property]["fieldPaths"]}` }[keyof [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Fields` & `NewFields`>] & `string`>

#### Defined in[​](https://docs.convex.dev/api/classes/values.VObject.html#defined-in-10 "Direct link to Defined in")

[values/validators.ts:389](https://github.com/get-convex/convex-js/blob/main/src/values/validators.ts#L389)

[Previous

VNull](https://docs.convex.dev/api/classes/values.VNull.html)[Next

VRecord](https://docs.convex.dev/api/classes/values.VRecord.html)

* [Type parameters](https://docs.convex.dev/api/classes/values.VObject.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/classes/values.VObject.html#hierarchy)
* [Constructors](https://docs.convex.dev/api/classes/values.VObject.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/values.VObject.html#constructor)
* [Properties](https://docs.convex.dev/api/classes/values.VObject.html#properties)
  + [type](https://docs.convex.dev/api/classes/values.VObject.html#type)
  + [fieldPaths](https://docs.convex.dev/api/classes/values.VObject.html#fieldpaths)
  + [isOptional](https://docs.convex.dev/api/classes/values.VObject.html#isoptional)
  + [isConvexValidator](https://docs.convex.dev/api/classes/values.VObject.html#isconvexvalidator)
  + [fields](https://docs.convex.dev/api/classes/values.VObject.html#fields)
  + [kind](https://docs.convex.dev/api/classes/values.VObject.html#kind)
* [Methods](https://docs.convex.dev/api/classes/values.VObject.html#methods)
  + [omit](https://docs.convex.dev/api/classes/values.VObject.html#omit)
  + [pick](https://docs.convex.dev/api/classes/values.VObject.html#pick)
  + [partial](https://docs.convex.dev/api/classes/values.VObject.html#partial)
  + [extend](https://docs.convex.dev/api/classes/values.VObject.html#extend)
