---
title: "Interface: VectorIndexConfig<VectorField, FilterFields> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.VectorIndexConfig"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* VectorIndexConfig

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).VectorIndexConfig

The configuration for a vector index.

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `VectorField` | extends `string` |
| `FilterFields` | extends `string` |

## Properties[​](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html#properties "Direct link to Properties")

### vectorField[​](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html#vectorfield "Direct link to vectorField")

• **vectorField**: `VectorField`

The field to index for vector search.

This must be a field of type `v.array(v.float64())` (or a union)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html#defined-in "Direct link to Defined in")

[server/schema.ts:123](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L123)

---

### dimensions[​](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html#dimensions "Direct link to dimensions")

• **dimensions**: `number`

The length of the vectors indexed. This must be between 2 and 2048 inclusive.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html#defined-in-1 "Direct link to Defined in")

[server/schema.ts:127](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L127)

---

### filterFields[​](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html#filterfields "Direct link to filterFields")

• `Optional` **filterFields**: `FilterFields`[]

Additional fields to index for fast filtering when running vector searches.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html#defined-in-2 "Direct link to Defined in")

[server/schema.ts:131](https://github.com/get-convex/convex-js/blob/main/src/server/schema.ts#L131)

[Previous

VectorFilterBuilder](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html)[Next

VectorSearchQuery](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html#type-parameters)
* [Properties](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html#properties)
  + [vectorField](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html#vectorfield)
  + [dimensions](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html#dimensions)
  + [filterFields](https://docs.convex.dev/api/interfaces/server.VectorIndexConfig.html#filterfields)
