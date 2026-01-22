---
title: "Interface: VectorFilterBuilder<Document, VectorIndexConfig> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* VectorFilterBuilder

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).VectorFilterBuilder

An interface for defining filters for vector searches.

This has a similar interface to [FilterBuilder](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html), which is used in
database queries, but supports only the methods that can be efficiently
done in a vector search.

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Document` | extends [`GenericDocument`](https://docs.convex.dev/api/modules/server.html#genericdocument) |
| `VectorIndexConfig` | extends [`GenericVectorIndexConfig`](https://docs.convex.dev/api/modules/server.html#genericvectorindexconfig) |

## Methods[​](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#methods "Direct link to Methods")

### eq[​](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#eq "Direct link to eq")

▸ **eq**<`FieldName`>(`fieldName`, `value`): [`FilterExpression`](https://docs.convex.dev/api/classes/server.FilterExpression.html)<`boolean`>

Is the field at `fieldName` equal to `value`

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `FieldName` | extends `string` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `fieldName` | `FieldName` |
| `value` | [`FieldTypeFromFieldPath`](https://docs.convex.dev/api/modules/server.html#fieldtypefromfieldpath)<`Document`, `FieldName`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#returns "Direct link to Returns")

[`FilterExpression`](https://docs.convex.dev/api/classes/server.FilterExpression.html)<`boolean`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#defined-in "Direct link to Defined in")

[server/vector\_search.ts:110](https://github.com/get-convex/convex-js/blob/main/src/server/vector_search.ts#L110)

---

### or[​](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#or "Direct link to or")

▸ **or**(`...exprs`): [`FilterExpression`](https://docs.convex.dev/api/classes/server.FilterExpression.html)<`boolean`>

`exprs[0] || exprs[1] || ... || exprs[n]`

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#parameters-1 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `...exprs` | [`FilterExpression`](https://docs.convex.dev/api/classes/server.FilterExpression.html)<`boolean`>[] |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#returns-1 "Direct link to Returns")

[`FilterExpression`](https://docs.convex.dev/api/classes/server.FilterExpression.html)<`boolean`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#defined-in-1 "Direct link to Defined in")

[server/vector\_search.ts:122](https://github.com/get-convex/convex-js/blob/main/src/server/vector_search.ts#L122)

[Previous

ValidatedFunction](https://docs.convex.dev/api/interfaces/server.ValidatedFunction.html)[Next

VectorIndexConfig](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#type-parameters)
* [Methods](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#methods)
  + [eq](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#eq)
  + [or](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html#or)
