---
title: "Interface: ReactMutation<Mutation> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/react.ReactMutation"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/react](https://docs.convex.dev/api/modules/react.html)
* ReactMutation

Copy as Markdown

Copied!

On this page

[react](https://docs.convex.dev/api/modules/react.html).ReactMutation

An interface to execute a Convex mutation function on the server.

## Type parameters[​](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Mutation` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"mutation"`> |

## Callable[​](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#callable "Direct link to Callable")

### ReactMutation[​](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#reactmutation "Direct link to ReactMutation")

▸ **ReactMutation**(`...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Mutation`>>

Execute the mutation on the server, returning a `Promise` of its return value.

#### Parameters[​](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Mutation`> | Arguments for the mutation to pass up to the server. |

#### Returns[​](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#returns "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Mutation`>>

The return value of the server-side function call.

#### Defined in[​](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#defined-in "Direct link to Defined in")

[react/client.ts:64](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L64)

## Methods[​](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#methods "Direct link to Methods")

### withOptimisticUpdate[​](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#withoptimisticupdate "Direct link to withOptimisticUpdate")

▸ **withOptimisticUpdate**<`T`>(`optimisticUpdate`): [`ReactMutation`](https://docs.convex.dev/api/interfaces/react.ReactMutation.html)<`Mutation`>

Define an optimistic update to apply as part of this mutation.

This is a temporary update to the local query results to facilitate a
fast, interactive UI. It enables query results to update before a mutation
executed on the server.

When the mutation is invoked, the optimistic update will be applied.

Optimistic updates can also be used to temporarily remove queries from the
client and create loading experiences until a mutation completes and the
new query results are synced.

The update will be automatically rolled back when the mutation is fully
completed and queries have been updated.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `T` | extends [`OptimisticUpdate`](https://docs.convex.dev/api/modules/browser.html#optimisticupdate)<[`FunctionArgs`](https://docs.convex.dev/api/modules/server.html#functionargs)<`Mutation`>> |

#### Parameters[​](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `optimisticUpdate` | `T` & `ReturnType`<`T`> extends `Promise`<`any`> ? `"Optimistic update handlers must be synchronous"` : | The optimistic update to apply. |

#### Returns[​](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#returns-1 "Direct link to Returns")

[`ReactMutation`](https://docs.convex.dev/api/interfaces/react.ReactMutation.html)<`Mutation`>

A new `ReactMutation` with the update configured.

#### Defined in[​](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#defined-in-1 "Direct link to Defined in")

[react/client.ts:87](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L87)

[Previous

ReactAction](https://docs.convex.dev/api/interfaces/react.ReactAction.html)[Next

Watch](https://docs.convex.dev/api/interfaces/react.Watch.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#type-parameters)
* [Callable](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#callable)
  + [ReactMutation](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#reactmutation)
* [Methods](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#methods)
  + [withOptimisticUpdate](https://docs.convex.dev/api/interfaces/react.ReactMutation.html#withoptimisticupdate)
