---
title: "Interface: GenericDatabaseWriter<DataModel> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* GenericDatabaseWriter

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).GenericDatabaseWriter

An interface to read from and write to the database within Convex mutation
functions.

Convex guarantees that all writes within a single mutation are
executed atomically, so you never have to worry about partial writes leaving
your data in an inconsistent state. See [the Convex Guide](https://docs.convex.dev/understanding/convex-fundamentals/functions.html#atomicity-and-optimistic-concurrency-control)
for the guarantees Convex provides your functions.

If you're using code generation, use the `DatabaseReader` type in
`convex/_generated/server.d.ts` which is typed for your data model.

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `DataModel` | extends [`GenericDataModel`](https://docs.convex.dev/api/modules/server.html#genericdatamodel) |

## Hierarchy[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#hierarchy "Direct link to Hierarchy")

* [`GenericDatabaseReader`](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html)<`DataModel`>

  ↳ **`GenericDatabaseWriter`**

## Properties[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#properties "Direct link to Properties")

### system[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#system "Direct link to system")

• **system**: `BaseDatabaseReader`<[`SystemDataModel`](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html)>

An interface to read from the system tables within Convex query functions

The two entry points are:

* [get](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#get), which fetches a single document
  by its [GenericId](https://docs.convex.dev/api/modules/values.html#genericid).
* [query](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#query), which starts building a query.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#inherited-from "Direct link to Inherited from")

[GenericDatabaseReader](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html).[system](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#system)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#defined-in "Direct link to Defined in")

[server/database.ts:130](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L130)

## Methods[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#methods "Direct link to Methods")

### get[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#get "Direct link to get")

▸ **get**<`TableName`>(`id`): `Promise`<`null` | [`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>>

Fetch a single document from the database by its [GenericId](https://docs.convex.dev/api/modules/values.html#genericid).

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableName` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `id` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`> | The [GenericId](https://docs.convex.dev/api/modules/values.html#genericid) of the document to fetch from the database. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#returns "Direct link to Returns")

`Promise`<`null` | [`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>>

* The [GenericDocument](https://docs.convex.dev/api/modules/server.html#genericdocument) of the document at the given [GenericId](https://docs.convex.dev/api/modules/values.html#genericid), or `null` if it no longer exists.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#inherited-from-1 "Direct link to Inherited from")

[GenericDatabaseReader](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html).[get](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#get)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#defined-in-1 "Direct link to Defined in")

[server/database.ts:36](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L36)

---

### query[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#query "Direct link to query")

▸ **query**<`TableName`>(`tableName`): [`QueryInitializer`](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html)<[`NamedTableInfo`](https://docs.convex.dev/api/modules/server.html#namedtableinfo)<`DataModel`, `TableName`>>

Begin a query for the given table name.

Queries don't execute immediately, so calling this method and extending its
query are free until the results are actually used.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableName` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `tableName` | `TableName` | The name of the table to query. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#returns-1 "Direct link to Returns")

[`QueryInitializer`](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html)<[`NamedTableInfo`](https://docs.convex.dev/api/modules/server.html#namedtableinfo)<`DataModel`, `TableName`>>

* A [QueryInitializer](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html) object to start building a query.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#inherited-from-2 "Direct link to Inherited from")

[GenericDatabaseReader](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html).[query](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#query)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#defined-in-2 "Direct link to Defined in")

[server/database.ts:49](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L49)

---

### normalizeId[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#normalizeid "Direct link to normalizeId")

▸ **normalizeId**<`TableName`>(`tableName`, `id`): `null` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`>

Returns the string ID format for the ID in a given table, or null if the ID
is from a different table or is not a valid ID.

This accepts the string ID format as well as the `.toString()` representation
of the legacy class-based ID format.

This does not guarantee that the ID exists (i.e. `db.get(id)` may return `null`).

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#type-parameters-3 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableName` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `tableName` | `TableName` | The name of the table. |
| `id` | `string` | The ID string. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#returns-2 "Direct link to Returns")

`null` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`>

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#inherited-from-3 "Direct link to Inherited from")

[GenericDatabaseReader](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html).[normalizeId](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#normalizeid)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#defined-in-3 "Direct link to Defined in")

[server/database.ts:65](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L65)

---

### insert[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#insert "Direct link to insert")

▸ **insert**<`TableName`>(`table`, `value`): `Promise`<[`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`>>

Insert a new document into a table.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#type-parameters-4 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableName` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `table` | `TableName` | The name of the table to insert a new document into. |
| `value` | [`WithoutSystemFields`](https://docs.convex.dev/api/modules/server.html#withoutsystemfields)<[`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>> | The [Value](https://docs.convex.dev/api/modules/values.html#value) to insert into the given table. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#returns-3 "Direct link to Returns")

`Promise`<[`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`>>

* [GenericId](https://docs.convex.dev/api/modules/values.html#genericid) of the new document.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#defined-in-4 "Direct link to Defined in")

[server/database.ts:172](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L172)

---

### patch[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#patch "Direct link to patch")

▸ **patch**<`TableName`>(`id`, `value`): `Promise`<`void`>

Patch an existing document, shallow merging it with the given partial
document.

New fields are added. Existing fields are overwritten. Fields set to
`undefined` are removed.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#type-parameters-5 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableName` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#parameters-4 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `id` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`> | The [GenericId](https://docs.convex.dev/api/modules/values.html#genericid) of the document to patch. |
| `value` | `PatchValue`<[`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>> | The partial [GenericDocument](https://docs.convex.dev/api/modules/server.html#genericdocument) to merge into the specified document. If this new value specifies system fields like `_id`, they must match the document's existing field values. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#returns-4 "Direct link to Returns")

`Promise`<`void`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#defined-in-5 "Direct link to Defined in")

[server/database.ts:208](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L208)

---

### replace[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#replace "Direct link to replace")

▸ **replace**<`TableName`>(`id`, `value`): `Promise`<`void`>

Replace the value of an existing document, overwriting its old value.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#type-parameters-6 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableName` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#parameters-5 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `id` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`> | The [GenericId](https://docs.convex.dev/api/modules/values.html#genericid) of the document to replace. |
| `value` | [`WithOptionalSystemFields`](https://docs.convex.dev/api/modules/server.html#withoptionalsystemfields)<[`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>> | The new [GenericDocument](https://docs.convex.dev/api/modules/server.html#genericdocument) for the document. This value can omit the system fields, and the database will fill them in. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#returns-5 "Direct link to Returns")

`Promise`<`void`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#defined-in-6 "Direct link to Defined in")

[server/database.ts:236](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L236)

---

### delete[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#delete "Direct link to delete")

▸ **delete**(`id`): `Promise`<`void`>

Delete an existing document.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#parameters-6 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `id` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<[`TableNamesInDataModel`](https://docs.convex.dev/api/modules/server.html#tablenamesindatamodel)<`DataModel`>> | The [GenericId](https://docs.convex.dev/api/modules/values.html#genericid) of the document to remove. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#returns-6 "Direct link to Returns")

`Promise`<`void`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#defined-in-7 "Direct link to Defined in")

[server/database.ts:259](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L259)

[Previous

GenericDatabaseReaderWithTable](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html)[Next

GenericDatabaseWriterWithTable](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriterWithTable.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#hierarchy)
* [Properties](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#properties)
  + [system](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#system)
* [Methods](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#methods)
  + [get](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#get)
  + [query](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#query)
  + [normalizeId](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#normalizeid)
  + [insert](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#insert)
  + [patch](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#patch)
  + [replace](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#replace)
  + [delete](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#delete)
