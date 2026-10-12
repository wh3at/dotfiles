---
title: "Interface: SearchIndexConfig<SearchField, FilterFields> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.SearchIndexConfig"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* SearchIndexConfig

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).SearchIndexConfig

The configuration for a full text search index.

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.SearchIndexConfig.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `SearchField` | extends `string` |
| `FilterFields` | extends `string` |

## Properties[​](https://docs.convex.dev/api/interfaces/server.SearchIndexConfig.html#properties "Direct link to Properties")

### searchField[​](https://docs.convex.dev/api/interfaces/server.SearchIndexConfig.html#searchfield "Direct link to searchField")

• **searchField**: `SearchField`

The field to index for full text search.

This must be a field of type `string`.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.SearchIndexConfig.html#defined-in "Direct link to Defined in")

[server/schema.ts:101](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L101)

---

### filterFields[​](https://docs.convex.dev/api/interfaces/server.SearchIndexConfig.html#filterfields "Direct link to filterFields")

• `Optional` **filterFields**: `FilterFields`[]

Additional fields to index for fast filtering when running search queries.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.SearchIndexConfig.html#defined-in-1 "Direct link to Defined in")

[server/schema.ts:106](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L106)

[Previous

SearchFilterFinalizer](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html)[Next

StorageActionWriter](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.SearchIndexConfig.html#type-parameters)
* [Properties](https://docs.convex.dev/api/interfaces/server.SearchIndexConfig.html#properties)
  + [searchField](https://docs.convex.dev/api/interfaces/server.SearchIndexConfig.html#searchfield)
  + [filterFields](https://docs.convex.dev/api/interfaces/server.SearchIndexConfig.html#filterfields)
