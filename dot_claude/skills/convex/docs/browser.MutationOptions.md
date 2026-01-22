---
title: "Interface: MutationOptions | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/browser.MutationOptions"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/browser](https://docs.convex.dev/api/modules/browser.html)
* MutationOptions

Copy as Markdown

Copied!

On this page

[browser](https://docs.convex.dev/api/modules/browser.html).MutationOptions

Options for [mutation](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#mutation).

## Properties[​](https://docs.convex.dev/api/interfaces/browser.MutationOptions.html#properties "Direct link to Properties")

### optimisticUpdate[​](https://docs.convex.dev/api/interfaces/browser.MutationOptions.html#optimisticupdate "Direct link to optimisticUpdate")

• `Optional` **optimisticUpdate**: [`OptimisticUpdate`](https://docs.convex.dev/api/modules/browser.html#optimisticupdate)<`any`>

An optimistic update to apply along with this mutation.

An optimistic update locally updates queries while a mutation is pending.
Once the mutation completes, the update will be rolled back.

#### Defined in[​](https://docs.convex.dev/api/interfaces/browser.MutationOptions.html#defined-in "Direct link to Defined in")

[browser/sync/client.ts:210](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L210)

[Previous

BaseConvexClientOptions](https://docs.convex.dev/api/interfaces/browser.BaseConvexClientOptions.html)[Next

OptimisticLocalStore](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html)

* [Properties](https://docs.convex.dev/api/interfaces/browser.MutationOptions.html#properties)
  + [optimisticUpdate](https://docs.convex.dev/api/interfaces/browser.MutationOptions.html#optimisticupdate)
