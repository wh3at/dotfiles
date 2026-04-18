---
title: "Interface: SystemDataModel | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.SystemDataModel"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* SystemDataModel

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).SystemDataModel

Internal type used in Convex code generation!

Convert a [SchemaDefinition](https://docs.convex.dev/api/classes/server.SchemaDefinition.html) into a [GenericDataModel](https://docs.convex.dev/api/modules/server.html#genericdatamodel).

## Hierarchy[​](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html#hierarchy "Direct link to Hierarchy")

* [`DataModelFromSchemaDefinition`](https://docs.convex.dev/api/modules/server.html#datamodelfromschemadefinition)<typeof `_systemSchema`>

  ↳ **`SystemDataModel`**

## Properties[​](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html#properties "Direct link to Properties")

### \_scheduled\_functions[​](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html#_scheduled_functions "Direct link to _scheduled_functions")

• **\_scheduled\_functions**: `Object`

#### Type declaration[​](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html#type-declaration "Direct link to Type declaration")

| Name | Type |
| --- | --- |
| `document` | { `completedTime`: `undefined` | `number` ; `name`: `string` ; `args`: `any`[] ; `scheduledTime`: `number` ; `state`: { kind: "pending"; } | { kind: "inProgress"; } | { kind: "success"; } | { kind: "failed"; error: string; } | { kind: "canceled"; } ; `_creationTime`: `number` ; `_id`: [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_scheduled_functions"`> } |
| `document.completedTime` | `undefined` | `number` |
| `document.name` | `string` |
| `document.args` | `any`[] |
| `document.scheduledTime` | `number` |
| `document.state` | { kind: "pending"; } | { kind: "inProgress"; } | { kind: "success"; } | { kind: "failed"; error: string; } | { kind: "canceled"; } |
| `document._creationTime` | `number` |
| `document._id` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_scheduled_functions"`> |
| `fieldPaths` | `"_id"` | `ExtractFieldPaths`<[`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<{ `completedTime`: `undefined` | `number` ; `name`: `string` ; `args`: `any`[] ; `scheduledTime`: `number` ; `state`: { kind: "pending"; } | { kind: "inProgress"; } | { kind: "success"; } | { kind: "failed"; error: string; } | { kind: "canceled"; } }, { `name`: [`VString`](https://docs.convex.dev/api/classes/values.VString.html)<`string`, `"required"`> ; `args`: [`VArray`](https://docs.convex.dev/api/classes/values.VArray.html)<`any`[], [`VAny`](https://docs.convex.dev/api/classes/values.VAny.html)<`any`, `"required"`, `string`>, `"required"`> ; `scheduledTime`: [`VFloat64`](https://docs.convex.dev/api/classes/values.VFloat64.html)<`number`, `"required"`> ; `completedTime`: [`VFloat64`](https://docs.convex.dev/api/classes/values.VFloat64.html)<`undefined` | `number`, `"optional"`> ; `state`: [`VUnion`](https://docs.convex.dev/api/classes/values.VUnion.html)<{ `kind`: `"pending"` } | { `kind`: `"inProgress"` } | { `kind`: `"success"` } | { `kind`: `"failed"` ; `error`: `string` } | { `kind`: `"canceled"` }, [[`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<{ `kind`: `"pending"` }, { `kind`: [`VLiteral`](https://docs.convex.dev/api/classes/values.VLiteral.html)<`"pending"`, `"required"`> }, `"required"`, `"kind"`>, [`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<{ `kind`: `"inProgress"` }, { `kind`: [`VLiteral`](https://docs.convex.dev/api/classes/values.VLiteral.html)<`"inProgress"`, `"required"`> }, `"required"`, `"kind"`>, [`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<{ `kind`: `"success"` }, { `kind`: [`VLiteral`](https://docs.convex.dev/api/classes/values.VLiteral.html)<`"success"`, `"required"`> }, `"required"`, `"kind"`>, [`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<{ `kind`: `"failed"` ; `error`: `string` }, { `kind`: [`VLiteral`](https://docs.convex.dev/api/classes/values.VLiteral.html)<`"failed"`, `"required"`> ; `error`: [`VString`](https://docs.convex.dev/api/classes/values.VString.html)<`string`, `"required"`> }, `"required"`, `"kind"` | `"error"`>, [`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<{ `kind`: `"canceled"` }, { `kind`: [`VLiteral`](https://docs.convex.dev/api/classes/values.VLiteral.html)<`"canceled"`, `"required"`> }, `"required"`, `"kind"`>], `"required"`, `"kind"` | `"error"`> }, `"required"`, `"name"` | `"args"` | `"scheduledTime"` | `"completedTime"` | `"state"` | `"state.kind"` | `"state.error"`>> |
| `indexes` | { `by_id`: [`"_id"`] ; `by_creation_time`: [`"_creationTime"`] } |
| `indexes.by_id` | [`"_id"`] |
| `indexes.by_creation_time` | [`"_creationTime"`] |
| `searchIndexes` |  |
| `vectorIndexes` |  |

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html#inherited-from "Direct link to Inherited from")

DataModelFromSchemaDefinition.\_scheduled\_functions

---

### \_storage[​](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html#_storage "Direct link to _storage")

• **\_storage**: `Object`

#### Type declaration[​](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html#type-declaration-1 "Direct link to Type declaration")

| Name | Type |
| --- | --- |
| `document` | { `contentType`: `undefined` | `string` ; `sha256`: `string` ; `size`: `number` ; `_creationTime`: `number` ; `_id`: [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_storage"`> } |
| `document.contentType` | `undefined` | `string` |
| `document.sha256` | `string` |
| `document.size` | `number` |
| `document._creationTime` | `number` |
| `document._id` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_storage"`> |
| `fieldPaths` | `"_id"` | `ExtractFieldPaths`<[`VObject`](https://docs.convex.dev/api/classes/values.VObject.html)<{ `contentType`: `undefined` | `string` ; `sha256`: `string` ; `size`: `number` }, { `sha256`: [`VString`](https://docs.convex.dev/api/classes/values.VString.html)<`string`, `"required"`> ; `size`: [`VFloat64`](https://docs.convex.dev/api/classes/values.VFloat64.html)<`number`, `"required"`> ; `contentType`: [`VString`](https://docs.convex.dev/api/classes/values.VString.html)<`undefined` | `string`, `"optional"`> }, `"required"`, `"sha256"` | `"size"` | `"contentType"`>> |
| `indexes` | { `by_id`: [`"_id"`] ; `by_creation_time`: [`"_creationTime"`] } |
| `indexes.by_id` | [`"_id"`] |
| `indexes.by_creation_time` | [`"_creationTime"`] |
| `searchIndexes` |  |
| `vectorIndexes` |  |

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html#inherited-from-1 "Direct link to Inherited from")

DataModelFromSchemaDefinition.\_storage

[Previous

StorageWriter](https://docs.convex.dev/api/interfaces/server.StorageWriter.html)[Next

UserIdentity](https://docs.convex.dev/api/interfaces/server.UserIdentity.html)

* [Hierarchy](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html#hierarchy)
* [Properties](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html#properties)
  + [\_scheduled\_functions](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html#_scheduled_functions)
  + [\_storage](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html#_storage)
