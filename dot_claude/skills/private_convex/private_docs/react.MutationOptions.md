---
title: "Interface: MutationOptions<Args> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/react.MutationOptions"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/react](https://docs.convex.dev/api/modules/react.html)
* MutationOptions

Copy as Markdown

Copied!

On this page

[react](https://docs.convex.dev/api/modules/react.html).MutationOptions

Options for [mutation](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#mutation).

## Type parameters[​](https://docs.convex.dev/api/interfaces/react.MutationOptions.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Args` | extends `Record`<`string`, [`Value`](https://docs.convex.dev/api/modules/values.html#value)> |

## Properties[​](https://docs.convex.dev/api/interfaces/react.MutationOptions.html#properties "Direct link to Properties")

### optimisticUpdate[​](https://docs.convex.dev/api/interfaces/react.MutationOptions.html#optimisticupdate "Direct link to optimisticUpdate")

• `Optional` **optimisticUpdate**: [`OptimisticUpdate`](https://docs.convex.dev/api/modules/browser.html#optimisticupdate)<`Args`>

An optimistic update to apply along with this mutation.

An optimistic update locally updates queries while a mutation is pending.
Once the mutation completes, the update will be rolled back.

#### Defined in[​](https://docs.convex.dev/api/interfaces/react.MutationOptions.html#defined-in "Direct link to Defined in")

[react/client.ts:282](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L282)

[Previous

ConvexReactClientOptions](https://docs.convex.dev/api/interfaces/react.ConvexReactClientOptions.html)[Next

ReactAction](https://docs.convex.dev/api/interfaces/react.ReactAction.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/react.MutationOptions.html#type-parameters)
* [Properties](https://docs.convex.dev/api/interfaces/react.MutationOptions.html#properties)
  + [optimisticUpdate](https://docs.convex.dev/api/interfaces/react.MutationOptions.html#optimisticupdate)
