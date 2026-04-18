---
title: "Interface: SubscribeOptions | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/browser.SubscribeOptions"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/browser](https://docs.convex.dev/api/modules/browser.html)
* SubscribeOptions

Copy as Markdown

Copied!

On this page

[browser](https://docs.convex.dev/api/modules/browser.html).SubscribeOptions

Options for [subscribe](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#subscribe).

## Properties[​](https://docs.convex.dev/api/interfaces/browser.SubscribeOptions.html#properties "Direct link to Properties")

### journal[​](https://docs.convex.dev/api/interfaces/browser.SubscribeOptions.html#journal "Direct link to journal")

• `Optional` **journal**: [`QueryJournal`](https://docs.convex.dev/api/modules/browser.html#queryjournal)

An (optional) journal produced from a previous execution of this query
function.

If there is an existing subscription to a query function with the same
name and arguments, this journal will have no effect.

#### Defined in[​](https://docs.convex.dev/api/interfaces/browser.SubscribeOptions.html#defined-in "Direct link to Defined in")

[browser/sync/client.ts:190](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L190)

[Previous

OptimisticLocalStore](https://docs.convex.dev/api/interfaces/browser.OptimisticLocalStore.html)[Next

Module: server](https://docs.convex.dev/api/modules/server.html)

* [Properties](https://docs.convex.dev/api/interfaces/browser.SubscribeOptions.html#properties)
  + [journal](https://docs.convex.dev/api/interfaces/browser.SubscribeOptions.html#journal)
