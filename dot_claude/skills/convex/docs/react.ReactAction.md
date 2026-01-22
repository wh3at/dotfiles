---
title: "Interface: ReactAction<Action> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/react.ReactAction"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/react](https://docs.convex.dev/api/modules/react.html)
* ReactAction

Copy as Markdown

Copied!

On this page

[react](https://docs.convex.dev/api/modules/react.html).ReactAction

An interface to execute a Convex action on the server.

## Type parameters[​](https://docs.convex.dev/api/interfaces/react.ReactAction.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Action` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"action"`> |

## Callable[​](https://docs.convex.dev/api/interfaces/react.ReactAction.html#callable "Direct link to Callable")

### ReactAction[​](https://docs.convex.dev/api/interfaces/react.ReactAction.html#reactaction "Direct link to ReactAction")

▸ **ReactAction**(`...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Action`>>

Execute the function on the server, returning a `Promise` of its return value.

#### Parameters[​](https://docs.convex.dev/api/interfaces/react.ReactAction.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Action`> | Arguments for the function to pass up to the server. |

#### Returns[​](https://docs.convex.dev/api/interfaces/react.ReactAction.html#returns "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Action`>>

The return value of the server-side function call.

#### Defined in[​](https://docs.convex.dev/api/interfaces/react.ReactAction.html#defined-in "Direct link to Defined in")

[react/client.ts:136](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L136)

[Previous

MutationOptions](https://docs.convex.dev/api/interfaces/react.MutationOptions.html)[Next

ReactMutation](https://docs.convex.dev/api/interfaces/react.ReactMutation.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/react.ReactAction.html#type-parameters)
* [Callable](https://docs.convex.dev/api/interfaces/react.ReactAction.html#callable)
  + [ReactAction](https://docs.convex.dev/api/interfaces/react.ReactAction.html#reactaction)
