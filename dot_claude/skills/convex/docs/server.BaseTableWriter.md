---
title: "Interface: BaseTableWriter<DataModel, TableName> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.BaseTableWriter"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* BaseTableWriter

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).BaseTableWriter

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `DataModel` | extends [`GenericDataModel`](https://docs.convex.dev/api/modules/server.html#genericdatamodel) |
| `TableName` | extends [`TableNamesInDataModel`](https://docs.convex.dev/api/modules/server.html#tablenamesindatamodel)<`DataModel`> |

## Hierarchy[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#hierarchy "Direct link to Hierarchy")

* [`BaseTableReader`](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html)<`DataModel`, `TableName`>

  ↳ **`BaseTableWriter`**

## Methods[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#methods "Direct link to Methods")

### get[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#get "Direct link to get")

▸ **get**(`id`): `Promise`<`null` | [`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>>

Fetch a single document from the table by its [GenericId](https://docs.convex.dev/api/modules/values.html#genericid).

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `id` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`> | The [GenericId](https://docs.convex.dev/api/modules/values.html#genericid) of the document to fetch from the database. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#returns "Direct link to Returns")

`Promise`<`null` | [`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>>

* The [GenericDocument](https://docs.convex.dev/api/modules/server.html#genericdocument) of the document at the given [GenericId](https://docs.convex.dev/api/modules/values.html#genericid), or `null` if it no longer exists.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#inherited-from "Direct link to Inherited from")

[BaseTableReader](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html).[get](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#get)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#defined-in "Direct link to Defined in")

[server/database.ts:90](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L90)

---

### query[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#query "Direct link to query")

▸ **query**(): [`QueryInitializer`](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html)<[`NamedTableInfo`](https://docs.convex.dev/api/modules/server.html#namedtableinfo)<`DataModel`, `TableName`>>

Begin a query for the table.

Queries don't execute immediately, so calling this method and extending its
query are free until the results are actually used.

#### Returns[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#returns-1 "Direct link to Returns")

[`QueryInitializer`](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html)<[`NamedTableInfo`](https://docs.convex.dev/api/modules/server.html#namedtableinfo)<`DataModel`, `TableName`>>

* A [QueryInitializer](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html) object to start building a query.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#inherited-from-1 "Direct link to Inherited from")

[BaseTableReader](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html).[query](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#query)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#defined-in-1 "Direct link to Defined in")

[server/database.ts:102](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L102)

---

### insert[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#insert "Direct link to insert")

▸ **insert**(`value`): `Promise`<[`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`>>

Insert a new document into the table.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `value` | [`WithoutSystemFields`](https://docs.convex.dev/api/modules/server.html#withoutsystemfields)<[`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>> | The [Value](https://docs.convex.dev/api/modules/values.html#value) to insert into the given table. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#returns-2 "Direct link to Returns")

`Promise`<[`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`>>

* [GenericId](https://docs.convex.dev/api/modules/values.html#genericid) of the new document.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#defined-in-2 "Direct link to Defined in")

[server/database.ts:297](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L297)

---

### patch[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#patch "Direct link to patch")

▸ **patch**(`id`, `value`): `Promise`<`void`>

Patch an existing document, shallow merging it with the given partial
document.

New fields are added. Existing fields are overwritten. Fields set to
`undefined` are removed.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `id` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`> | The [GenericId](https://docs.convex.dev/api/modules/values.html#genericid) of the document to patch. |
| `value` | `PatchValue`<[`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>> | The partial [GenericDocument](https://docs.convex.dev/api/modules/server.html#genericdocument) to merge into the specified document. If this new value specifies system fields like `_id`, they must match the document's existing field values. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#returns-3 "Direct link to Returns")

`Promise`<`void`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#defined-in-3 "Direct link to Defined in")

[server/database.ts:312](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L312)

---

### replace[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#replace "Direct link to replace")

▸ **replace**(`id`, `value`): `Promise`<`void`>

Replace the value of an existing document, overwriting its old value.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `id` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`> | The [GenericId](https://docs.convex.dev/api/modules/values.html#genericid) of the document to replace. |
| `value` | [`WithOptionalSystemFields`](https://docs.convex.dev/api/modules/server.html#withoptionalsystemfields)<[`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>> | The new [GenericDocument](https://docs.convex.dev/api/modules/server.html#genericdocument) for the document. This value can omit the system fields, and the database will fill them in. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#returns-4 "Direct link to Returns")

`Promise`<`void`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#defined-in-4 "Direct link to Defined in")

[server/database.ts:324](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L324)

---

### delete[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#delete "Direct link to delete")

▸ **delete**(`id`): `Promise`<`void`>

Delete an existing document.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#parameters-4 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `id` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`> | The [GenericId](https://docs.convex.dev/api/modules/values.html#genericid) of the document to remove. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#returns-5 "Direct link to Returns")

`Promise`<`void`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#defined-in-5 "Direct link to Defined in")

[server/database.ts:334](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L334)

[Previous

BaseTableReader](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html)[Next

CronJob](https://docs.convex.dev/api/interfaces/server.CronJob.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#hierarchy)
* [Methods](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#methods)
  + [get](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#get)
  + [query](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#query)
  + [insert](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#insert)
  + [patch](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#patch)
  + [replace](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#replace)
  + [delete](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html#delete)
