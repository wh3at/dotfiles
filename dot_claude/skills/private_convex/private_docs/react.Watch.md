---
title: "Interface: Watch<T> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/react.Watch"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/react](https://docs.convex.dev/api/modules/react.html)
* Watch

Copy as Markdown

Copied!

On this page

[react](https://docs.convex.dev/api/modules/react.html).Watch

A watch on the output of a Convex query function.

## Type parameters[​](https://docs.convex.dev/api/interfaces/react.Watch.html#type-parameters "Direct link to Type parameters")

| Name |
| --- |
| `T` |

## Methods[​](https://docs.convex.dev/api/interfaces/react.Watch.html#methods "Direct link to Methods")

### onUpdate[​](https://docs.convex.dev/api/interfaces/react.Watch.html#onupdate "Direct link to onUpdate")

▸ **onUpdate**(`callback`): () => `void`

Initiate a watch on the output of a query.

This will subscribe to this query and call
the callback whenever the query result changes.

**Important: If the client is already subscribed to this query with the
same arguments this callback will not be invoked until the query result is
updated.** To get the current, local result call
[localQueryResult](https://docs.convex.dev/api/interfaces/react.Watch.html#localqueryresult).

#### Parameters[​](https://docs.convex.dev/api/interfaces/react.Watch.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `callback` | () => `void` | Function that is called whenever the query result changes. |

#### Returns[​](https://docs.convex.dev/api/interfaces/react.Watch.html#returns "Direct link to Returns")

`fn`

* A function that disposes of the subscription.

▸ (): `void`

Initiate a watch on the output of a query.

This will subscribe to this query and call
the callback whenever the query result changes.

**Important: If the client is already subscribed to this query with the
same arguments this callback will not be invoked until the query result is
updated.** To get the current, local result call
[localQueryResult](https://docs.convex.dev/api/interfaces/react.Watch.html#localqueryresult).

##### Returns[​](https://docs.convex.dev/api/interfaces/react.Watch.html#returns-1 "Direct link to Returns")

`void`

* A function that disposes of the subscription.

#### Defined in[​](https://docs.convex.dev/api/interfaces/react.Watch.html#defined-in "Direct link to Defined in")

[react/client.ts:170](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L170)

---

### localQueryResult[​](https://docs.convex.dev/api/interfaces/react.Watch.html#localqueryresult "Direct link to localQueryResult")

▸ **localQueryResult**(): `undefined` | `T`

Get the current result of a query.

This will only return a result if we're already subscribed to the query
and have received a result from the server or the query value has been set
optimistically.

**`Throws`**

An error if the query encountered an error on the server.

#### Returns[​](https://docs.convex.dev/api/interfaces/react.Watch.html#returns-2 "Direct link to Returns")

`undefined` | `T`

The result of the query or `undefined` if it isn't known.

#### Defined in[​](https://docs.convex.dev/api/interfaces/react.Watch.html#defined-in-1 "Direct link to Defined in")

[react/client.ts:182](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L182)

---

### journal[​](https://docs.convex.dev/api/interfaces/react.Watch.html#journal "Direct link to journal")

▸ **journal**(): `undefined` | [`QueryJournal`](https://docs.convex.dev/api/modules/browser.html#queryjournal)

Get the current [QueryJournal](https://docs.convex.dev/api/modules/browser.html#queryjournal) for this query.

If we have not yet received a result for this query, this will be `undefined`.

#### Returns[​](https://docs.convex.dev/api/interfaces/react.Watch.html#returns-3 "Direct link to Returns")

`undefined` | [`QueryJournal`](https://docs.convex.dev/api/modules/browser.html#queryjournal)

#### Defined in[​](https://docs.convex.dev/api/interfaces/react.Watch.html#defined-in-2 "Direct link to Defined in")

[react/client.ts:194](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L194)

[Previous

ReactMutation](https://docs.convex.dev/api/interfaces/react.ReactMutation.html)[Next

WatchQueryOptions](https://docs.convex.dev/api/interfaces/react.WatchQueryOptions.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/react.Watch.html#type-parameters)
* [Methods](https://docs.convex.dev/api/interfaces/react.Watch.html#methods)
  + [onUpdate](https://docs.convex.dev/api/interfaces/react.Watch.html#onupdate)
  + [localQueryResult](https://docs.convex.dev/api/interfaces/react.Watch.html#localqueryresult)
  + [journal](https://docs.convex.dev/api/interfaces/react.Watch.html#journal)
