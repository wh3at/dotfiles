---
title: "Interface: BaseTableReader<DataModel, TableName> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.BaseTableReader"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* BaseTableReader

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).BaseTableReader

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `DataModel` | extends [`GenericDataModel`](https://docs.convex.dev/api/modules/server.html#genericdatamodel) |
| `TableName` | extends [`TableNamesInDataModel`](https://docs.convex.dev/api/modules/server.html#tablenamesindatamodel)<`DataModel`> |

## Hierarchy[​](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#hierarchy "Direct link to Hierarchy")

* **`BaseTableReader`**

  ↳ [`BaseTableWriter`](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html)

## Methods[​](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#methods "Direct link to Methods")

### get[​](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#get "Direct link to get")

▸ **get**(`id`): `Promise`<`null` | [`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>>

Fetch a single document from the table by its [GenericId](https://docs.convex.dev/api/modules/values.html#genericid).

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `id` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`> | The [GenericId](https://docs.convex.dev/api/modules/values.html#genericid) of the document to fetch from the database. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#returns "Direct link to Returns")

`Promise`<`null` | [`DocumentByName`](https://docs.convex.dev/api/modules/server.html#documentbyname)<`DataModel`, `TableName`>>

* The [GenericDocument](https://docs.convex.dev/api/modules/server.html#genericdocument) of the document at the given [GenericId](https://docs.convex.dev/api/modules/values.html#genericid), or `null` if it no longer exists.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#defined-in "Direct link to Defined in")

[server/database.ts:90](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L90)

---

### query[​](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#query "Direct link to query")

▸ **query**(): [`QueryInitializer`](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html)<[`NamedTableInfo`](https://docs.convex.dev/api/modules/server.html#namedtableinfo)<`DataModel`, `TableName`>>

Begin a query for the table.

Queries don't execute immediately, so calling this method and extending its
query are free until the results are actually used.

#### Returns[​](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#returns-1 "Direct link to Returns")

[`QueryInitializer`](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html)<[`NamedTableInfo`](https://docs.convex.dev/api/modules/server.html#namedtableinfo)<`DataModel`, `TableName`>>

* A [QueryInitializer](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html) object to start building a query.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#defined-in-1 "Direct link to Defined in")

[server/database.ts:102](https://github.com/get-convex/convex-js/blob/main/src/server/database.ts#L102)

[Previous

Auth](https://docs.convex.dev/api/interfaces/server.Auth.html)[Next

BaseTableWriter](https://docs.convex.dev/api/interfaces/server.BaseTableWriter.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#hierarchy)
* [Methods](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#methods)
  + [get](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#get)
  + [query](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html#query)
