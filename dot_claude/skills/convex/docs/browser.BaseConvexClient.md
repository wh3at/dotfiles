---
title: "Class: BaseConvexClient | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/browser.BaseConvexClient"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/browser](https://docs.convex.dev/api/modules/browser.html)
* BaseConvexClient

Copy as Markdown

Copied!

On this page

[browser](https://docs.convex.dev/api/modules/browser.html).BaseConvexClient

Low-level client for directly integrating state management libraries
with Convex.

Most developers should use higher level clients, like
the [ConvexHttpClient](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html) or the React hook based [ConvexReactClient](https://docs.convex.dev/api/classes/react.ConvexReactClient.html).

## Constructors[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#constructor "Direct link to constructor")

• **new BaseConvexClient**(`address`, `onTransition`, `options?`)

#### Parameters[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `address` | `string` | The url of your Convex deployment, often provided by an environment variable. E.g. `https://small-mouse-123.convex.cloud`. |
| `onTransition` | (`updatedQueries`: [`QueryToken`](https://docs.convex.dev/api/modules/browser.html#querytoken)[]) => `void` | A callback receiving an array of query tokens corresponding to query results that have changed -- additional handlers can be added via `addOnTransitionHandler`. |
| `options?` | [`BaseConvexClientOptions`](https://docs.convex.dev/api/interfaces/browser.BaseConvexClientOptions.html) | See [BaseConvexClientOptions](https://docs.convex.dev/api/interfaces/browser.BaseConvexClientOptions.html) for a full description. |

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in "Direct link to Defined in")

[browser/sync/client.ts:277](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L277)

## Accessors[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#accessors "Direct link to Accessors")

### url[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#url "Direct link to url")

• `get` **url**(): `string`

Return the address for this client, useful for creating a new client.

Not guaranteed to match the address with which this client was constructed:
it may be canonicalized.

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns "Direct link to Returns")

`string`

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-1 "Direct link to Defined in")

[browser/sync/client.ts:1037](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L1037)

## Methods[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#methods "Direct link to Methods")

### getMaxObservedTimestamp[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#getmaxobservedtimestamp "Direct link to getMaxObservedTimestamp")

▸ **getMaxObservedTimestamp**(): `undefined` | `Long`

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-1 "Direct link to Returns")

`undefined` | `Long`

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-2 "Direct link to Defined in")

[browser/sync/client.ts:542](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L542)

---

### addOnTransitionHandler[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#addontransitionhandler "Direct link to addOnTransitionHandler")

▸ **addOnTransitionHandler**(`fn`): () => `boolean`

Add a handler that will be called on a transition.

Any external side effects (e.g. setting React state) should be handled here.

#### Parameters[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#parameters-1 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `fn` | (`transition`: `Transition`) => `void` |

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-2 "Direct link to Returns")

`fn`

▸ (): `boolean`

##### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-3 "Direct link to Returns")

`boolean`

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-3 "Direct link to Defined in")

[browser/sync/client.ts:621](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L621)

---

### getCurrentAuthClaims[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#getcurrentauthclaims "Direct link to getCurrentAuthClaims")

▸ **getCurrentAuthClaims**(): `undefined` | { `token`: `string` ; `decoded`: `Record`<`string`, `any`> }

Get the current JWT auth token and decoded claims.

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-4 "Direct link to Returns")

`undefined` | { `token`: `string` ; `decoded`: `Record`<`string`, `any`> }

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-4 "Direct link to Defined in")

[browser/sync/client.ts:630](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L630)

---

### setAuth[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#setauth "Direct link to setAuth")

▸ **setAuth**(`fetchToken`, `onChange`): `void`

Set the authentication token to be used for subsequent queries and mutations.
`fetchToken` will be called automatically again if a token expires.
`fetchToken` should return `null` if the token cannot be retrieved, for example
when the user's rights were permanently revoked.

#### Parameters[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `fetchToken` | [`AuthTokenFetcher`](https://docs.convex.dev/api/modules/browser.html#authtokenfetcher) | an async function returning the JWT-encoded OpenID Connect Identity Token |
| `onChange` | (`isAuthenticated`: `boolean`) => `void` | a callback that will be called when the authentication status changes |

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-5 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-5 "Direct link to Defined in")

[browser/sync/client.ts:655](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L655)

---

### hasAuth[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#hasauth "Direct link to hasAuth")

▸ **hasAuth**(): `boolean`

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-6 "Direct link to Returns")

`boolean`

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-6 "Direct link to Defined in")

[browser/sync/client.ts:662](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L662)

---

### clearAuth[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#clearauth "Direct link to clearAuth")

▸ **clearAuth**(): `void`

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-7 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-7 "Direct link to Defined in")

[browser/sync/client.ts:672](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L672)

---

### subscribe[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#subscribe "Direct link to subscribe")

▸ **subscribe**(`name`, `args?`, `options?`): `Object`

Subscribe to a query function.

Whenever this query's result changes, the `onTransition` callback
passed into the constructor will be called.

#### Parameters[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `name` | `string` | The name of the query. |
| `args?` | `Record`<`string`, [`Value`](https://docs.convex.dev/api/modules/values.html#value)> | An arguments object for the query. If this is omitted, the arguments will be `{}`. |
| `options?` | [`SubscribeOptions`](https://docs.convex.dev/api/interfaces/browser.SubscribeOptions.html) | A [SubscribeOptions](https://docs.convex.dev/api/interfaces/browser.SubscribeOptions.html) options object for this query. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-8 "Direct link to Returns")

`Object`

An object containing a [QueryToken](https://docs.convex.dev/api/modules/browser.html#querytoken) corresponding to this
query and an `unsubscribe` callback.

| Name | Type |
| --- | --- |
| `queryToken` | [`QueryToken`](https://docs.convex.dev/api/modules/browser.html#querytoken) |
| `unsubscribe` | () => `void` |

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-8 "Direct link to Defined in")

[browser/sync/client.ts:691](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L691)

---

### localQueryResult[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#localqueryresult "Direct link to localQueryResult")

▸ **localQueryResult**(`udfPath`, `args?`): `undefined` | [`Value`](https://docs.convex.dev/api/modules/values.html#value)

A query result based only on the current, local state.

The only way this will return a value is if we're already subscribed to the
query or its value has been set optimistically.

#### Parameters[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#parameters-4 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `udfPath` | `string` |
| `args?` | `Record`<`string`, [`Value`](https://docs.convex.dev/api/modules/values.html#value)> |

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-9 "Direct link to Returns")

`undefined` | [`Value`](https://docs.convex.dev/api/modules/values.html#value)

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-9 "Direct link to Defined in")

[browser/sync/client.ts:724](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L724)

---

### queryJournal[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#queryjournal "Direct link to queryJournal")

▸ **queryJournal**(`name`, `args?`): `undefined` | [`QueryJournal`](https://docs.convex.dev/api/modules/browser.html#queryjournal)

Retrieve the current [QueryJournal](https://docs.convex.dev/api/modules/browser.html#queryjournal) for this query function.

If we have not yet received a result for this query, this will be `undefined`.

#### Parameters[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#parameters-5 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `name` | `string` | The name of the query. |
| `args?` | `Record`<`string`, [`Value`](https://docs.convex.dev/api/modules/values.html#value)> | The arguments object for this query. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-10 "Direct link to Returns")

`undefined` | [`QueryJournal`](https://docs.convex.dev/api/modules/browser.html#queryjournal)

The query's [QueryJournal](https://docs.convex.dev/api/modules/browser.html#queryjournal) or `undefined`.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-10 "Direct link to Defined in")

[browser/sync/client.ts:777](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L777)

---

### connectionState[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#connectionstate "Direct link to connectionState")

▸ **connectionState**(): [`ConnectionState`](https://docs.convex.dev/api/modules/browser.html#connectionstate)

Get the current [ConnectionState](https://docs.convex.dev/api/modules/browser.html#connectionstate) between the client and the Convex
backend.

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-11 "Direct link to Returns")

[`ConnectionState`](https://docs.convex.dev/api/modules/browser.html#connectionstate)

The [ConnectionState](https://docs.convex.dev/api/modules/browser.html#connectionstate) with the Convex backend.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-11 "Direct link to Defined in")

[browser/sync/client.ts:792](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L792)

---

### subscribeToConnectionState[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#subscribetoconnectionstate "Direct link to subscribeToConnectionState")

▸ **subscribeToConnectionState**(`cb`): () => `void`

Subscribe to the [ConnectionState](https://docs.convex.dev/api/modules/browser.html#connectionstate) between the client and the Convex
backend, calling a callback each time it changes.

Subscribed callbacks will be called when any part of ConnectionState changes.
ConnectionState may grow in future versions (e.g. to provide a array of
inflight requests) in which case callbacks would be called more frequently.

#### Parameters[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#parameters-6 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `cb` | (`connectionState`: [`ConnectionState`](https://docs.convex.dev/api/modules/browser.html#connectionstate)) => `void` |

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-12 "Direct link to Returns")

`fn`

An unsubscribe function to stop listening.

▸ (): `void`

Subscribe to the [ConnectionState](https://docs.convex.dev/api/modules/browser.html#connectionstate) between the client and the Convex
backend, calling a callback each time it changes.

Subscribed callbacks will be called when any part of ConnectionState changes.
ConnectionState may grow in future versions (e.g. to provide a array of
inflight requests) in which case callbacks would be called more frequently.

##### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-13 "Direct link to Returns")

`void`

An unsubscribe function to stop listening.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-12 "Direct link to Defined in")

[browser/sync/client.ts:838](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L838)

---

### mutation[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#mutation "Direct link to mutation")

▸ **mutation**(`name`, `args?`, `options?`): `Promise`<`any`>

Execute a mutation function.

#### Parameters[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#parameters-7 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `name` | `string` | The name of the mutation. |
| `args?` | `Record`<`string`, [`Value`](https://docs.convex.dev/api/modules/values.html#value)> | An arguments object for the mutation. If this is omitted, the arguments will be `{}`. |
| `options?` | [`MutationOptions`](https://docs.convex.dev/api/interfaces/browser.MutationOptions.html) | A [MutationOptions](https://docs.convex.dev/api/interfaces/browser.MutationOptions.html) options object for this mutation. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-14 "Direct link to Returns")

`Promise`<`any`>

* A promise of the mutation's result.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-13 "Direct link to Defined in")

[browser/sync/client.ts:858](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L858)

---

### action[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#action "Direct link to action")

▸ **action**(`name`, `args?`): `Promise`<`any`>

Execute an action function.

#### Parameters[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#parameters-8 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `name` | `string` | The name of the action. |
| `args?` | `Record`<`string`, [`Value`](https://docs.convex.dev/api/modules/values.html#value)> | An arguments object for the action. If this is omitted, the arguments will be `{}`. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-15 "Direct link to Returns")

`Promise`<`any`>

A promise of the action's result.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-14 "Direct link to Defined in")

[browser/sync/client.ts:979](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L979)

---

### close[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#close "Direct link to close")

▸ **close**(): `Promise`<`void`>

Close any network handles associated with this client and stop all subscriptions.

Call this method when you're done with an [BaseConvexClient](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html) to
dispose of its sockets and resources.

#### Returns[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#returns-16 "Direct link to Returns")

`Promise`<`void`>

A `Promise` fulfilled when the connection has been completely closed.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#defined-in-15 "Direct link to Defined in")

[browser/sync/client.ts:1026](https://github.com/get-convex/convex-js/blob/main/src/browser/sync/client.ts#L1026)

[Previous

Module: browser](https://docs.convex.dev/api/modules/browser.html)[Next

ConvexClient](https://docs.convex.dev/api/classes/browser.ConvexClient.html)

* [Constructors](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#constructor)
* [Accessors](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#accessors)
  + [url](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#url)
* [Methods](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#methods)
  + [getMaxObservedTimestamp](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#getmaxobservedtimestamp)
  + [addOnTransitionHandler](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#addontransitionhandler)
  + [getCurrentAuthClaims](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#getcurrentauthclaims)
  + [setAuth](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#setauth)
  + [hasAuth](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#hasauth)
  + [clearAuth](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#clearauth)
  + [subscribe](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#subscribe)
  + [localQueryResult](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#localqueryresult)
  + [queryJournal](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#queryjournal)
  + [connectionState](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#connectionstate)
  + [subscribeToConnectionState](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#subscribetoconnectionstate)
  + [mutation](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#mutation)
  + [action](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#action)
  + [close](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html#close)
