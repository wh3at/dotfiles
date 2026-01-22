---
title: "Interface: SearchFilterFinalizer<Document, SearchIndexConfig> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* SearchFilterFinalizer

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).SearchFilterFinalizer

Builder to define equality expressions as part of a search filter.

See [SearchFilterBuilder](https://docs.convex.dev/api/interfaces/server.SearchFilterBuilder.html).

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Document` | extends [`GenericDocument`](https://docs.convex.dev/api/modules/server.html#genericdocument) |
| `SearchIndexConfig` | extends [`GenericSearchIndexConfig`](https://docs.convex.dev/api/modules/server.html#genericsearchindexconfig) |

## Hierarchy[​](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html#hierarchy "Direct link to Hierarchy")

* [`SearchFilter`](https://docs.convex.dev/api/classes/server.SearchFilter.html)

  ↳ **`SearchFilterFinalizer`**

## Methods[​](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html#methods "Direct link to Methods")

### eq[​](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html#eq "Direct link to eq")

▸ **eq**<`FieldName`>(`fieldName`, `value`): [`SearchFilterFinalizer`](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html)<`Document`, `SearchIndexConfig`>

Restrict this query to documents where `doc[fieldName] === value`.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `FieldName` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `fieldName` | `FieldName` | The name of the field to compare. This must be listed in the search index's `filterFields`. |
| `value` | [`FieldTypeFromFieldPath`](https://docs.convex.dev/api/modules/server.html#fieldtypefromfieldpath)<`Document`, `FieldName`> | The value to compare against. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html#returns "Direct link to Returns")

[`SearchFilterFinalizer`](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html)<`Document`, `SearchIndexConfig`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html#defined-in "Direct link to Defined in")

[server/search\_filter\_builder.ts:66](https://github.com/get-convex/convex-js/blob/main/src/server/search_filter_builder.ts#L66)

[Previous

SearchFilterBuilder](https://docs.convex.dev/api/interfaces/server.SearchFilterBuilder.html)[Next

SearchIndexConfig](https://docs.convex.dev/api/interfaces/server.SearchIndexConfig.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html#hierarchy)
* [Methods](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html#methods)
  + [eq](https://docs.convex.dev/api/interfaces/server.SearchFilterFinalizer.html#eq)
