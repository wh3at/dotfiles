---
title: "Interface: VectorSearchQuery<TableInfo, IndexName> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.VectorSearchQuery"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* VectorSearchQuery

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).VectorSearchQuery

An object with parameters for performing a vector search against a vector index.

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableInfo` | extends [`GenericTableInfo`](https://docs.convex.dev/api/modules/server.html#generictableinfo) |
| `IndexName` | extends [`VectorIndexNames`](https://docs.convex.dev/api/modules/server.html#vectorindexnames)<`TableInfo`> |

## Properties[​](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#properties "Direct link to Properties")

### vector[​](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#vector "Direct link to vector")

• **vector**: `number`[]

The query vector.

This must have the same length as the `dimensions` of the index.
This vector search will return the IDs of the documents most similar to
this vector.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#defined-in "Direct link to Defined in")

[server/vector\_search.ts:30](https://github.com/get-convex/convex-js/blob/main/src/server/vector_search.ts#L30)

---

### limit[​](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#limit "Direct link to limit")

• `Optional` **limit**: `number`

The number of results to return. If specified, must be between 1 and 256
inclusive.

**`Default`**

```
10
```

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#defined-in-1 "Direct link to Defined in")

[server/vector\_search.ts:37](https://github.com/get-convex/convex-js/blob/main/src/server/vector_search.ts#L37)

---

### filter[​](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#filter "Direct link to filter")

• `Optional` **filter**: (`q`: [`VectorFilterBuilder`](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html)<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>, [`NamedVectorIndex`](https://docs.convex.dev/api/modules/server.html#namedvectorindex)<`TableInfo`, `IndexName`>>) => [`FilterExpression`](https://docs.convex.dev/api/classes/server.FilterExpression.html)<`boolean`>

#### Type declaration[​](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#type-declaration "Direct link to Type declaration")

▸ (`q`): [`FilterExpression`](https://docs.convex.dev/api/classes/server.FilterExpression.html)<`boolean`>

Optional filter expression made up of `q.or` and `q.eq` operating
over the filter fields of the index.

e.g. `filter: q => q.or(q.eq("genre", "comedy"), q.eq("genre", "drama"))`

##### Parameters[​](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `q` | [`VectorFilterBuilder`](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html)<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>, [`NamedVectorIndex`](https://docs.convex.dev/api/modules/server.html#namedvectorindex)<`TableInfo`, `IndexName`>> |

##### Returns[​](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#returns "Direct link to Returns")

[`FilterExpression`](https://docs.convex.dev/api/classes/server.FilterExpression.html)<`boolean`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#defined-in-2 "Direct link to Defined in")

[server/vector\_search.ts:47](https://github.com/get-convex/convex-js/blob/main/src/server/vector_search.ts#L47)

[Previous

VectorIndexConfig](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html)[Next

Module: react](https://docs.convex.dev/api/modules/react.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#type-parameters)
* [Properties](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#properties)
  + [vector](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#vector)
  + [limit](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#limit)
  + [filter](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html#filter)
