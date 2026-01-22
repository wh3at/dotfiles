---
title: "Interface: GenericActionCtx<DataModel> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.GenericActionCtx"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* GenericActionCtx

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).GenericActionCtx

A set of services for use within Convex action functions.

The context is passed as the first argument to any Convex action
run on the server.

If you're using code generation, use the `ActionCtx` type in
`convex/_generated/server.d.ts` which is typed for your data model.

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `DataModel` | extends [`GenericDataModel`](https://docs.convex.dev/api/modules/server.html#genericdatamodel) |

## Properties[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#properties "Direct link to Properties")

### scheduler[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#scheduler "Direct link to scheduler")

• **scheduler**: [`Scheduler`](https://docs.convex.dev/api/interfaces/server.Scheduler.html)

A utility for scheduling Convex functions to run in the future.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#defined-in "Direct link to Defined in")

[server/registration.ts:236](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L236)

---

### auth[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#auth "Direct link to auth")

• **auth**: [`Auth`](https://docs.convex.dev/api/interfaces/server.Auth.html)

Information about the currently authenticated user.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#defined-in-1 "Direct link to Defined in")

[server/registration.ts:241](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L241)

---

### storage[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#storage "Direct link to storage")

• **storage**: [`StorageActionWriter`](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html)

A utility for reading and writing files in storage.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#defined-in-2 "Direct link to Defined in")

[server/registration.ts:246](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L246)

## Methods[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#methods "Direct link to Methods")

### runQuery[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#runquery "Direct link to runQuery")

▸ **runQuery**<`Query`>(`query`, `...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

Run the Convex query with the given name and arguments.

Consider using an internalQuery to prevent users from calling the
query directly.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`, `"public"` | `"internal"`> |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `query` | `Query` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the query to run. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Query`> | The arguments to the query function. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#returns "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

A promise of the query's result.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#defined-in-3 "Direct link to Defined in")

[server/registration.ts:196](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L196)

---

### runMutation[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#runmutation "Direct link to runMutation")

▸ **runMutation**<`Mutation`>(`mutation`, `...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Mutation`>>

Run the Convex mutation with the given name and arguments.

Consider using an internalMutation to prevent users from calling
the mutation directly.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Mutation` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"mutation"`, `"public"` | `"internal"`> |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `mutation` | `Mutation` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the mutation to run. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Mutation`> | The arguments to the mutation function. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#returns-1 "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Mutation`>>

A promise of the mutation's result.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#defined-in-4 "Direct link to Defined in")

[server/registration.ts:211](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L211)

---

### runAction[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#runaction "Direct link to runAction")

▸ **runAction**<`Action`>(`action`, `...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Action`>>

Run the Convex action with the given name and arguments.

Consider using an internalAction to prevent users from calling the
action directly.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#type-parameters-3 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Action` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"action"`, `"public"` | `"internal"`> |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `action` | `Action` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the action to run. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Action`> | The arguments to the action function. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#returns-2 "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Action`>>

A promise of the action's result.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#defined-in-5 "Direct link to Defined in")

[server/registration.ts:228](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L228)

---

### vectorSearch[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#vectorsearch "Direct link to vectorSearch")

▸ **vectorSearch**<`TableName`, `IndexName`>(`tableName`, `indexName`, `query`): `Promise`<{ `_id`: [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`> ; `_score`: `number` }[]>

Run a vector search on the given table and index.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#type-parameters-4 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableName` | extends `string` |
| `IndexName` | extends `string` | `number` | `symbol` |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `tableName` | `TableName` | The name of the table to query. |
| `indexName` | `IndexName` | The name of the vector index on the table to query. |
| `query` | `Object` | A [VectorSearchQuery](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html) containing the vector to query, the number of results to return, and any filters. |
| `query.vector` | `number`[] | The query vector. This must have the same length as the `dimensions` of the index. This vector search will return the IDs of the documents most similar to this vector. |
| `query.limit?` | `number` | The number of results to return. If specified, must be between 1 and 256 inclusive. **`Default`** `ts 10` |
| `query.filter?` | (`q`: [`VectorFilterBuilder`](https://docs.convex.dev/api/interfaces/server.VectorFilterBuilder.html)<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<[`NamedTableInfo`](https://docs.convex.dev/api/modules/server.html#namedtableinfo)<`DataModel`, `TableName`>>, [`NamedVectorIndex`](https://docs.convex.dev/api/modules/server.html#namedvectorindex)<[`NamedTableInfo`](https://docs.convex.dev/api/modules/server.html#namedtableinfo)<`DataModel`, `TableName`>, `IndexName`>>) => [`FilterExpression`](https://docs.convex.dev/api/classes/server.FilterExpression.html)<`boolean`> | Optional filter expression made up of `q.or` and `q.eq` operating over the filter fields of the index. e.g. `filter: q => q.or(q.eq("genre", "comedy"), q.eq("genre", "drama"))` |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#returns-3 "Direct link to Returns")

`Promise`<{ `_id`: [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`TableName`> ; `_score`: `number` }[]>

A promise of IDs and scores for the documents with the nearest
vectors

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#defined-in-6 "Direct link to Defined in")

[server/registration.ts:258](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L258)

[Previous

FilterBuilder](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html)[Next

GenericDatabaseReader](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#type-parameters)
* [Properties](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#properties)
  + [scheduler](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#scheduler)
  + [auth](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#auth)
  + [storage](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#storage)
* [Methods](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#methods)
  + [runQuery](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#runquery)
  + [runMutation](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#runmutation)
  + [runAction](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#runaction)
  + [vectorSearch](https://docs.convex.dev/api/interfaces/server.GenericActionCtx.html#vectorsearch)
