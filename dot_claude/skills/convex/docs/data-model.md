---
title: "dataModel.d.ts | Convex Developer Hub"
source_url: "https://docs.convex.dev/generated-api/data-model"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Generated Code](https://docs.convex.dev/generated-api/index.html)
* dataModel.d.ts

Copy as Markdown

Copied!

On this page

This code is generated

These exports are not directly available in the `convex` package!

Instead you must run `npx convex dev` to create
`convex/_generated/dataModel.d.ts`.

Generated data model types.

## Types[​](https://docs.convex.dev/generated-api/data-model.html#types "Direct link to Types")

### TableNames[​](https://docs.convex.dev/generated-api/data-model.html#tablenames "Direct link to TableNames")

Ƭ **TableNames**: `string`

The names of all of your Convex tables.

---

### Doc[​](https://docs.convex.dev/generated-api/data-model.html#doc "Direct link to Doc")

Ƭ **Doc**`<TableName>`: `Object`

The type of a document stored in Convex.

#### Type parameters[​](https://docs.convex.dev/generated-api/data-model.html#type-parameters "Direct link to Type parameters")

| Name | Type | Description |
| --- | --- | --- |
| `TableName` | extends [`TableNames`](https://docs.convex.dev/generated-api/data-model.html#tablenames) | A string literal type of the table name (like "users"). |

---

### Id[​](https://docs.convex.dev/generated-api/data-model.html#id "Direct link to Id")

An identifier for a document in Convex.

Convex documents are uniquely identified by their `Id`, which is accessible on
the `_id` field. To learn more, see [Document IDs](https://docs.convex.dev/database/document-ids.html).

Documents can be loaded using `db.get(id)` in query and mutation functions.

IDs are just strings at runtime, but this type can be used to distinguish them
from other strings when type checking.

This is an alias of [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid) that is typed
for your data model.

#### Type parameters[​](https://docs.convex.dev/generated-api/data-model.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type | Description |
| --- | --- | --- |
| `TableName` | extends [`TableNames`](https://docs.convex.dev/generated-api/data-model.html#tablenames) | A string literal type of the table name (like "users"). |

---

### DataModel[​](https://docs.convex.dev/generated-api/data-model.html#datamodel "Direct link to DataModel")

Ƭ **DataModel**: `Object`

A type describing your Convex data model.

This type includes information about what tables you have, the type of documents
stored in those tables, and the indexes defined on them.

This type is used to parameterize methods like
[`queryGeneric`](https://docs.convex.dev/api/modules/server.html#querygeneric) and
[`mutationGeneric`](https://docs.convex.dev/api/modules/server.html#mutationgeneric) to make them type-safe.

[Previous

Generated Code](https://docs.convex.dev/generated-api/index.html)[Next

api.js](https://docs.convex.dev/generated-api/api.html)

* [Types](https://docs.convex.dev/generated-api/data-model.html#types)
  + [TableNames](https://docs.convex.dev/generated-api/data-model.html#tablenames)
  + [Doc](https://docs.convex.dev/generated-api/data-model.html#doc)
  + [Id](https://docs.convex.dev/generated-api/data-model.html#id)
  + [DataModel](https://docs.convex.dev/generated-api/data-model.html#datamodel)
