---
title: "Interface: OptimisticLocalStore | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/browser](https://docs.convex.dev/api/modules/browser.html)
* OptimisticLocalStore

Copy as Markdown

Copied!

On this page

[browser](https://docs.convex.dev/api/modules/browser.html).OptimisticLocalStore

A view of the query results currently in the Convex client for use within
optimistic updates.

## Methods[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#methods "Direct link to Methods")

### getQuery[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#getquery "Direct link to getQuery")

▸ **getQuery**<`Query`>(`query`, `...args`): `undefined` | [`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>

Retrieve the result of a query from the client.

Important: Query results should be treated as immutable!
Always make new copies of structures within query results to avoid
corrupting data within the client.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`> |

#### Parameters[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `query` | `Query` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the query to get. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Query`> | The arguments object for this query. |

#### Returns[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#returns "Direct link to Returns")

`undefined` | [`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>

The query result or `undefined` if the query is not currently
in the client.

#### Defined in[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#defined-in "Direct link to Defined in")

[browser/sync/optimistic\_updates.ts:28](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/optimistic_updates.ts#L28)

---

### getAllQueries[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#getallqueries "Direct link to getAllQueries")

▸ **getAllQueries**<`Query`>(`query`): { `args`: [`FunctionArgs`](https://docs.convex.dev/api/modules/server.html#functionargs)<`Query`> ; `value`: `undefined` | [`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`> }[]

Retrieve the results and arguments of all queries with a given name.

This is useful for complex optimistic updates that need to inspect and
update many query results (for example updating a paginated list).

Important: Query results should be treated as immutable!
Always make new copies of structures within query results to avoid
corrupting data within the client.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`> |

#### Parameters[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `query` | `Query` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the query to get. |

#### Returns[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#returns-1 "Direct link to Returns")

{ `args`: [`FunctionArgs`](https://docs.convex.dev/api/modules/server.html#functionargs)<`Query`> ; `value`: `undefined` | [`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`> }[]

An array of objects, one for each query of the given name.
Each object includes:

* `args` - The arguments object for the query.
* `value` The query result or `undefined` if the query is loading.

#### Defined in[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#defined-in-1 "Direct link to Defined in")

[browser/sync/optimistic\_updates.ts:49](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/optimistic_updates.ts#L49)

---

### setQuery[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#setquery "Direct link to setQuery")

▸ **setQuery**<`Query`>(`query`, `args`, `value`): `void`

Optimistically update the result of a query.

This can either be a new value (perhaps derived from the old value from
[getQuery](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#getquery)) or `undefined` to remove the query.
Removing a query is useful to create loading states while Convex recomputes
the query results.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`> |

#### Parameters[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `query` | `Query` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the query to set. |
| `args` | [`FunctionArgs`](https://docs.convex.dev/api/modules/server.html#functionargs)<`Query`> | The arguments object for this query. |
| `value` | `undefined` | [`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`> | The new value to set the query to or `undefined` to remove it from the client. |

#### Returns[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#returns-2 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#defined-in-2 "Direct link to Defined in")

[browser/sync/optimistic\_updates.ts:69](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/optimistic_updates.ts#L69)

[Previous

MutationOptions](https://docs.convex.dev/api/interfaces/browser.MutationOptions.html)[Next

SubscribeOptions](https://docs.convex.dev/api/interfaces/browser.SubscribeOptions.html)

* [Methods](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#methods)
  + [getQuery](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#getquery)
  + [getAllQueries](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#getallqueries)
  + [setQuery](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html#setquery)
