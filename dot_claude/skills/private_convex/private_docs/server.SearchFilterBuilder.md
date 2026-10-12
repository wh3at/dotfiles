---
title: "Interface: SearchFilterBuilder<Document, SearchIndexConfig> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.SearchFilterBuilder"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* SearchFilterBuilder

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).SearchFilterBuilder

Builder for defining search filters.

A search filter is a chained list of:

1. One search expression constructed with `.search`.
2. Zero or more equality expressions constructed with `.eq`.

The search expression must search for text in the index's `searchField`. The
filter expressions can use any of the `filterFields` defined in the index.

For all other filtering use [filter](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#filter).

To learn about full text search, see [Indexes](https://docs.convex.dev/text-search.html).

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.SearchFilterBuilder.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Document` | extends [`GenericDocument`](https://docs.convex.dev/api/modules/server.html#genericdocument) |
| `SearchIndexConfig` | extends [`GenericSearchIndexConfig`](https://docs.convex.dev/api/modules/server.html#genericsearchindexconfig) |

## Methods[​](https://docs.convex.dev/api/interfaces/server.SearchFilterBuilder.html#methods "Direct link to Methods")

### search[​](https://docs.convex.dev/api/interfaces/server.SearchFilterBuilder.html#search "Direct link to search")

▸ **search**(`fieldName`, `query`): [`SearchFilterFinalizer`](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html)<`Document`, `SearchIndexConfig`>

Search for the terms in `query` within `doc[fieldName]`.

This will do a full text search that returns results where any word of of
`query` appears in the field.

Documents will be returned based on their relevance to the query. This
takes into account:

* How many words in the query appear in the text?
* How many times do they appear?
* How long is the text field?

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.SearchFilterBuilder.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `fieldName` | `SearchIndexConfig`[`"searchField"`] | The name of the field to search in. This must be listed as the index's `searchField`. |
| `query` | `string` | The query text to search for. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.SearchFilterBuilder.html#returns "Direct link to Returns")

[`SearchFilterFinalizer`](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html)<`Document`, `SearchIndexConfig`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.SearchFilterBuilder.html#defined-in "Direct link to Defined in")

[server/search\_filter\_builder.ts:42](https://github.com/get-convex/convex-js/blob/main/src/server/search_filter_builder.ts#L42)

[Previous

Scheduler](https://docs.convex.dev/api/interfaces/server.Scheduler.html)[Next

SearchFilterFinalizer](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.SearchFilterBuilder.html#type-parameters)
* [Methods](https://docs.convex.dev/api/interfaces/server.SearchFilterBuilder.html#methods)
  + [search](https://docs.convex.dev/api/interfaces/server.SearchFilterBuilder.html#search)
