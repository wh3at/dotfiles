---
title: "Class: TableDefinition<DocumentType, Indexes, SearchIndexes, VectorIndexes> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/server.TableDefinition"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* TableDefinition

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).TableDefinition

The definition of a table within a schema.

This should be produced by using [defineTable](https://docs.convex.dev/api/modules/server.html#definetable).

## Type parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `DocumentType` | extends [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `any`, `any`> = [`Validator`](https://docs.convex.dev/api/modules/values.html#validator)<`any`, `any`, `any`> |
| `Indexes` | extends [`GenericTableIndexes`](https://docs.convex.dev/api/modules/server.html#generictableindexes) = |
| `SearchIndexes` | extends [`GenericTableSearchIndexes`](https://docs.convex.dev/api/modules/server.html#generictablesearchindexes) = |
| `VectorIndexes` | extends [`GenericTableVectorIndexes`](https://docs.convex.dev/api/modules/server.html#generictablevectorindexes) = |

## Properties[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#properties "Direct link to Properties")

### validator[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#validator "Direct link to validator")

• **validator**: `DocumentType`

#### Defined in[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#defined-in "Direct link to Defined in")

[server/schema.ts:199](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L199)

## Methods[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#methods "Direct link to Methods")

### indexes[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#indexes "Direct link to indexes")

▸ \*\* indexes\*\*(): { `indexDescriptor`: `string` ; `fields`: `string`[] }[]

This API is experimental: it may change or disappear.

Returns indexes defined on this table.
Intended for the advanced use cases of dynamically deciding which index to use for a query.
If you think you need this, please chime in on ths issue in the Convex JS GitHub repo.
<https://github.com/get-convex/convex-js/issues/49>

#### Returns[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#returns "Direct link to Returns")

{ `indexDescriptor`: `string` ; `fields`: `string`[] }[]

#### Defined in[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#defined-in-1 "Direct link to Defined in")

[server/schema.ts:222](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L222)

---

### index[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#index "Direct link to index")

▸ **index**<`IndexName`, `FirstFieldPath`, `RestFieldPaths`>(`name`, `indexConfig`): [`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Indexes` & `Record`<`IndexName`, [`FirstFieldPath`, ...RestFieldPaths[], `"_creationTime"`]>>, `SearchIndexes`, `VectorIndexes`>

Define an index on this table.

To learn about indexes, see [Defining Indexes](https://docs.convex.dev/using/indexes.html).

#### Type parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `IndexName` | extends `string` |
| `FirstFieldPath` | extends `any` |
| `RestFieldPaths` | extends `ExtractFieldPaths`<`DocumentType`>[] |

#### Parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `name` | `IndexName` | The name of the index. |
| `indexConfig` | `Object` | The index configuration object. |
| `indexConfig.fields` | [`FirstFieldPath`, ...RestFieldPaths[]] | The fields to index, in order. Must specify at least one field. |
| `indexConfig.staged?` | `false` | Whether the index should be staged. For large tables, index backfill can be slow. Staging an index allows you to push the schema and enable the index later. If `staged` is `true`, the index will be staged and will not be enabled until the staged flag is removed. Staged indexes do not block push completion. Staged indexes cannot be used in queries. |

#### Returns[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#returns-1 "Direct link to Returns")

[`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Indexes` & `Record`<`IndexName`, [`FirstFieldPath`, ...RestFieldPaths[], `"_creationTime"`]>>, `SearchIndexes`, `VectorIndexes`>

A [TableDefinition](https://docs.convex.dev/api/classes/server.TableDefinition.html) with this index included.

#### Defined in[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#defined-in-2 "Direct link to Defined in")

[server/schema.ts:235](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L235)

▸ **index**<`IndexName`, `FirstFieldPath`, `RestFieldPaths`>(`name`, `fields`): [`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Indexes` & `Record`<`IndexName`, [`FirstFieldPath`, ...RestFieldPaths[], `"_creationTime"`]>>, `SearchIndexes`, `VectorIndexes`>

Define an index on this table.

To learn about indexes, see [Defining Indexes](https://docs.convex.dev/using/indexes.html).

#### Type parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `IndexName` | extends `string` |
| `FirstFieldPath` | extends `any` |
| `RestFieldPaths` | extends `ExtractFieldPaths`<`DocumentType`>[] |

#### Parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `name` | `IndexName` | The name of the index. |
| `fields` | [`FirstFieldPath`, ...RestFieldPaths[]] | The fields to index, in order. Must specify at least one field. |

#### Returns[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#returns-2 "Direct link to Returns")

[`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`Indexes` & `Record`<`IndexName`, [`FirstFieldPath`, ...RestFieldPaths[], `"_creationTime"`]>>, `SearchIndexes`, `VectorIndexes`>

A [TableDefinition](https://docs.convex.dev/api/classes/server.TableDefinition.html) with this index included.

#### Defined in[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#defined-in-3 "Direct link to Defined in")

[server/schema.ts:268](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L268)

▸ **index**<`IndexName`, `FirstFieldPath`, `RestFieldPaths`>(`name`, `indexConfig`): [`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, `Indexes`, `SearchIndexes`, `VectorIndexes`>

Define a staged index on this table.

For large tables, index backfill can be slow. Staging an index allows you
to push the schema and enable the index later.

If `staged` is `true`, the index will be staged and will not be enabled
until the staged flag is removed. Staged indexes do not block push
completion. Staged indexes cannot be used in queries.

To learn about indexes, see [Defining Indexes](https://docs.convex.dev/using/indexes.html).

#### Type parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#type-parameters-3 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `IndexName` | extends `string` |
| `FirstFieldPath` | extends `any` |
| `RestFieldPaths` | extends `ExtractFieldPaths`<`DocumentType`>[] |

#### Parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `name` | `IndexName` | The name of the index. |
| `indexConfig` | `Object` | The index configuration object. |
| `indexConfig.fields` | [`FirstFieldPath`, ...RestFieldPaths[]] | The fields to index, in order. Must specify at least one field. |
| `indexConfig.staged` | `true` | Whether the index should be staged. For large tables, index backfill can be slow. Staging an index allows you to push the schema and enable the index later. If `staged` is `true`, the index will be staged and will not be enabled until the staged flag is removed. Staged indexes do not block push completion. Staged indexes cannot be used in queries. |

#### Returns[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#returns-3 "Direct link to Returns")

[`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, `Indexes`, `SearchIndexes`, `VectorIndexes`>

A [TableDefinition](https://docs.convex.dev/api/classes/server.TableDefinition.html) with this index included.

#### Defined in[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#defined-in-4 "Direct link to Defined in")

[server/schema.ts:304](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L304)

---

### searchIndex[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#searchindex "Direct link to searchIndex")

▸ **searchIndex**<`IndexName`, `SearchField`, `FilterFields`>(`name`, `indexConfig`): [`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, `Indexes`, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`SearchIndexes` & `Record`<`IndexName`, { `searchField`: `SearchField` ; `filterFields`: `FilterFields` }>>, `VectorIndexes`>

Define a search index on this table.

To learn about search indexes, see [Search](https://docs.convex.dev/text-search.html).

#### Type parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#type-parameters-4 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `IndexName` | extends `string` |
| `SearchField` | extends `any` |
| `FilterFields` | extends `any` = `never` |

#### Parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `name` | `IndexName` | The name of the index. |
| `indexConfig` | `Object` | The search index configuration object. |
| `indexConfig.searchField` | `SearchField` | The field to index for full text search. This must be a field of type `string`. |
| `indexConfig.filterFields?` | `FilterFields`[] | Additional fields to index for fast filtering when running search queries. |
| `indexConfig.staged?` | `false` | Whether the index should be staged. For large tables, index backfill can be slow. Staging an index allows you to push the schema and enable the index later. If `staged` is `true`, the index will be staged and will not be enabled until the staged flag is removed. Staged indexes do not block push completion. Staged indexes cannot be used in queries. |

#### Returns[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#returns-4 "Direct link to Returns")

[`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, `Indexes`, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`SearchIndexes` & `Record`<`IndexName`, { `searchField`: `SearchField` ; `filterFields`: `FilterFields` }>>, `VectorIndexes`>

A [TableDefinition](https://docs.convex.dev/api/classes/server.TableDefinition.html) with this search index included.

#### Defined in[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#defined-in-5 "Direct link to Defined in")

[server/schema.ts:357](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L357)

▸ **searchIndex**<`IndexName`, `SearchField`, `FilterFields`>(`name`, `indexConfig`): [`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, `Indexes`, `SearchIndexes`, `VectorIndexes`>

Define a staged search index on this table.

For large tables, index backfill can be slow. Staging an index allows you
to push the schema and enable the index later.

If `staged` is `true`, the index will be staged and will not be enabled
until the staged flag is removed. Staged indexes do not block push
completion. Staged indexes cannot be used in queries.

To learn about search indexes, see [Search](https://docs.convex.dev/text-search.html).

#### Type parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#type-parameters-5 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `IndexName` | extends `string` |
| `SearchField` | extends `any` |
| `FilterFields` | extends `any` = `never` |

#### Parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#parameters-4 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `name` | `IndexName` | The name of the index. |
| `indexConfig` | `Object` | The search index configuration object. |
| `indexConfig.searchField` | `SearchField` | The field to index for full text search. This must be a field of type `string`. |
| `indexConfig.filterFields?` | `FilterFields`[] | Additional fields to index for fast filtering when running search queries. |
| `indexConfig.staged` | `true` | Whether the index should be staged. For large tables, index backfill can be slow. Staging an index allows you to push the schema and enable the index later. If `staged` is `true`, the index will be staged and will not be enabled until the staged flag is removed. Staged indexes do not block push completion. Staged indexes cannot be used in queries. |

#### Returns[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#returns-5 "Direct link to Returns")

[`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, `Indexes`, `SearchIndexes`, `VectorIndexes`>

A [TableDefinition](https://docs.convex.dev/api/classes/server.TableDefinition.html) with this search index included.

#### Defined in[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#defined-in-6 "Direct link to Defined in")

[server/schema.ts:401](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L401)

---

### vectorIndex[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#vectorindex "Direct link to vectorIndex")

▸ **vectorIndex**<`IndexName`, `VectorField`, `FilterFields`>(`name`, `indexConfig`): [`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, `Indexes`, `SearchIndexes`, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`VectorIndexes` & `Record`<`IndexName`, { `vectorField`: `VectorField` ; `dimensions`: `number` ; `filterFields`: `FilterFields` }>>>

Define a vector index on this table.

To learn about vector indexes, see [Vector Search](https://docs.convex.dev/vector-search.html).

#### Type parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#type-parameters-6 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `IndexName` | extends `string` |
| `VectorField` | extends `any` |
| `FilterFields` | extends `any` = `never` |

#### Parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#parameters-5 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `name` | `IndexName` | The name of the index. |
| `indexConfig` | `Object` | The vector index configuration object. |
| `indexConfig.vectorField` | `VectorField` | The field to index for vector search. This must be a field of type `v.array(v.float64())` (or a union) |
| `indexConfig.dimensions` | `number` | The length of the vectors indexed. This must be between 2 and 2048 inclusive. |
| `indexConfig.filterFields?` | `FilterFields`[] | Additional fields to index for fast filtering when running vector searches. |
| `indexConfig.staged?` | `false` | Whether the index should be staged. For large tables, index backfill can be slow. Staging an index allows you to push the schema and enable the index later. If `staged` is `true`, the index will be staged and will not be enabled until the staged flag is removed. Staged indexes do not block push completion. Staged indexes cannot be used in queries. |

#### Returns[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#returns-6 "Direct link to Returns")

[`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, `Indexes`, `SearchIndexes`, [`Expand`](https://docs.convex.dev/api/modules/server.html#expand)<`VectorIndexes` & `Record`<`IndexName`, { `vectorField`: `VectorField` ; `dimensions`: `number` ; `filterFields`: `FilterFields` }>>>

A [TableDefinition](https://docs.convex.dev/api/classes/server.TableDefinition.html) with this vector index included.

#### Defined in[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#defined-in-7 "Direct link to Defined in")

[server/schema.ts:448](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L448)

▸ **vectorIndex**<`IndexName`, `VectorField`, `FilterFields`>(`name`, `indexConfig`): [`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, `Indexes`, `SearchIndexes`, `VectorIndexes`>

Define a staged vector index on this table.

For large tables, index backfill can be slow. Staging an index allows you
to push the schema and enable the index later.

If `staged` is `true`, the index will be staged and will not be enabled
until the staged flag is removed. Staged indexes do not block push
completion. Staged indexes cannot be used in queries.

To learn about vector indexes, see [Vector Search](https://docs.convex.dev/vector-search.html).

#### Type parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#type-parameters-7 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `IndexName` | extends `string` |
| `VectorField` | extends `any` |
| `FilterFields` | extends `any` = `never` |

#### Parameters[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#parameters-6 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `name` | `IndexName` | The name of the index. |
| `indexConfig` | `Object` | The vector index configuration object. |
| `indexConfig.vectorField` | `VectorField` | The field to index for vector search. This must be a field of type `v.array(v.float64())` (or a union) |
| `indexConfig.dimensions` | `number` | The length of the vectors indexed. This must be between 2 and 2048 inclusive. |
| `indexConfig.filterFields?` | `FilterFields`[] | Additional fields to index for fast filtering when running vector searches. |
| `indexConfig.staged` | `true` | Whether the index should be staged. For large tables, index backfill can be slow. Staging an index allows you to push the schema and enable the index later. If `staged` is `true`, the index will be staged and will not be enabled until the staged flag is removed. Staged indexes do not block push completion. Staged indexes cannot be used in queries. |

#### Returns[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#returns-7 "Direct link to Returns")

[`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, `Indexes`, `SearchIndexes`, `VectorIndexes`>

A [TableDefinition](https://docs.convex.dev/api/classes/server.TableDefinition.html) with this vector index included.

#### Defined in[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#defined-in-8 "Direct link to Defined in")

[server/schema.ts:491](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L491)

---

### self[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#self "Direct link to self")

▸ `Protected` **self**(): [`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, `Indexes`, `SearchIndexes`, `VectorIndexes`>

Work around for <https://github.com/microsoft/TypeScript/issues/57035>

#### Returns[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#returns-8 "Direct link to Returns")

[`TableDefinition`](https://docs.convex.dev/api/classes/server.TableDefinition.html)<`DocumentType`, `Indexes`, `SearchIndexes`, `VectorIndexes`>

#### Defined in[​](https://docs.convex.dev/api/classes/server.TableDefinition.html#defined-in-9 "Direct link to Defined in")

[server/schema.ts:534](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L534)

[Previous

SearchFilter](https://docs.convex.dev/api/classes/server.SearchFilter.html)[Next

Auth](https://docs.convex.dev/api/interfaces/server.Auth.html)

* [Type parameters](https://docs.convex.dev/api/classes/server.TableDefinition.html#type-parameters)
* [Properties](https://docs.convex.dev/api/classes/server.TableDefinition.html#properties)
  + [validator](https://docs.convex.dev/api/classes/server.TableDefinition.html#validator)
* [Methods](https://docs.convex.dev/api/classes/server.TableDefinition.html#methods)
  + [indexes](https://docs.convex.dev/api/classes/server.TableDefinition.html#indexes)
  + [index](https://docs.convex.dev/api/classes/server.TableDefinition.html#index)
  + [searchIndex](https://docs.convex.dev/api/classes/server.TableDefinition.html#searchindex)
  + [vectorIndex](https://docs.convex.dev/api/classes/server.TableDefinition.html#vectorindex)
  + [self](https://docs.convex.dev/api/classes/server.TableDefinition.html#self)
