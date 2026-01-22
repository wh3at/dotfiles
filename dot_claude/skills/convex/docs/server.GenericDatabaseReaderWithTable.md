---
title: "Interface: GenericDatabaseReaderWithTable<DataModel> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* GenericDatabaseReaderWithTable

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).GenericDatabaseReaderWithTable

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `DataModel` | extends [`GenericDataModel`](https://docs.convex.dev/api/modules/server.html#genericdatamodel) |

## Hierarchy[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#hierarchy "Direct link to Hierarchy")

* `BaseDatabaseReaderWithTable`<`DataModel`>

  ↳ **`GenericDatabaseReaderWithTable`**

  ↳↳ [`GenericDatabaseWriterWithTable`](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriterWithTable.html)

## Properties[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#properties "Direct link to Properties")

### system[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#system "Direct link to system")

• **system**: `BaseDatabaseReaderWithTable`<[`SystemDataModel`](https://docs.convex.dev/api/interfaces/server.SystemDataModel.html)>

An interface to read from the system tables within Convex query functions

The two entry points are:

* [get](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#get), which fetches a single document
  by its [GenericId](https://docs.convex.dev/api/modules/values.html#genericid).
* [query](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#query), which starts building a query.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#defined-in "Direct link to Defined in")

[server/database.ts:146](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L146)

## Methods[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#methods "Direct link to Methods")

### table[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#table "Direct link to table")

▸ **table**<`TableName`>(`tableName`): [`BaseTableReader`](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html)<`DataModel`, `TableName`>

Scope the database to a specific table.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableName` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `tableName` | `TableName` |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#returns "Direct link to Returns")

[`BaseTableReader`](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html)<`DataModel`, `TableName`>

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#inherited-from "Direct link to Inherited from")

BaseDatabaseReaderWithTable.table

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#defined-in-1 "Direct link to Defined in")

[server/database.ts:75](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L75)

[Previous

GenericDatabaseReader](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html)[Next

GenericDatabaseWriter](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#hierarchy)
* [Properties](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#properties)
  + [system](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#system)
* [Methods](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#methods)
  + [table](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReaderWithTable.html#table)
