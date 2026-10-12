---
title: "Interface: GenericDatabaseReader<DataModel> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* GenericDatabaseReader

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).GenericDatabaseReader

An interface to read from the database within Convex query functions.

The two entry points are:

* [get](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#get), which fetches a single document
  by its [GenericId](https://docs.convex.dev/api/modules/values.html#genericid).
* [query](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#query), which starts building a query.

If you're using code generation, use the `DatabaseReader` type in
`convex/_generated/server.d.ts` which is typed for your data model.

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `DataModel` | extends [`GenericDataModel`](https://docs.convex.dev/api/modules/server.html#genericdatamodel) |

## Hierarchy[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#hierarchy "Direct link to Hierarchy")

* `BaseDatabaseReader`<`DataModel`>

  ↳ **`GenericDatabaseReader`**

  ↳↳ [`GenericDatabaseWriter`](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html)

## Properties[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#properties "Direct link to Properties")

### system[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#system "Direct link to system")

• **system**: `BaseDatabaseReader`<[`SystemDataModel`](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html)>

An interface to read from the system tables within Convex query functions

The two entry points are:

* [get](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#get), which fetches a single document
  by its [GenericId](https://docs.convex.dev/api/modules/values.html#genericid).
* [query](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#query), which starts building a query.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#defined-in "Direct link to Defined in")

[server/database.ts:130](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L130)

## Methods[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#methods "Direct link to Methods")

### get[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#get "Direct link to get")

▸ **get**<`TableName`>(`id`): `Promise`<`null` | [`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>>

Fetch a single document from the database by its [GenericId](https://docs.convex.dev/api/modules/values.html#genericid).

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableName` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `id` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`> | The [GenericId](https://docs.convex.dev/api/modules/values.html#genericid) of the document to fetch from the database. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#returns "Direct link to Returns")

`Promise`<`null` | [`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>>

* The [GenericDocument](https://docs.convex.dev/api/modules/server.html#genericdocument) of the document at the given [GenericId](https://docs.convex.dev/api/modules/values.html#genericid), or `null` if it no longer exists.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#inherited-from "Direct link to Inherited from")

BaseDatabaseReader.get

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#defined-in-1 "Direct link to Defined in")

[server/database.ts:36](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L36)

---

### query[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#query "Direct link to query")

▸ **query**<`TableName`>(`tableName`): [`QueryInitializer`](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html)<[`NamedTableInfo`](https://docs.convex.dev/api/modules/server.html#namedtableinfo)<`DataModel`, `TableName`>>

Begin a query for the given table name.

Queries don't execute immediately, so calling this method and extending its
query are free until the results are actually used.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableName` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `tableName` | `TableName` | The name of the table to query. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#returns-1 "Direct link to Returns")

[`QueryInitializer`](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html)<[`NamedTableInfo`](https://docs.convex.dev/api/modules/server.html#namedtableinfo)<`DataModel`, `TableName`>>

* A [QueryInitializer](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html) object to start building a query.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#inherited-from-1 "Direct link to Inherited from")

BaseDatabaseReader.query

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#defined-in-2 "Direct link to Defined in")

[server/database.ts:49](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L49)

---

### normalizeId[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#normalizeid "Direct link to normalizeId")

▸ **normalizeId**<`TableName`>(`tableName`, `id`): `null` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`>

Returns the string ID format for the ID in a given table, or null if the ID
is from a different table or is not a valid ID.

This accepts the string ID format as well as the `.toString()` representation
of the legacy class-based ID format.

This does not guarantee that the ID exists (i.e. `db.get(id)` may return `null`).

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#type-parameters-3 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableName` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `tableName` | `TableName` | The name of the table. |
| `id` | `string` | The ID string. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#returns-2 "Direct link to Returns")

`null` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`>

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#inherited-from-2 "Direct link to Inherited from")

BaseDatabaseReader.normalizeId

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#defined-in-3 "Direct link to Defined in")

[server/database.ts:65](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L65)

[Previous

GenericActionCtx](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html)[Next

GenericDatabaseReaderWithTable](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#hierarchy)
* [Properties](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#properties)
  + [system](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#system)
* [Methods](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#methods)
  + [get](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#get)
  + [query](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#query)
  + [normalizeId](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#normalizeid)
