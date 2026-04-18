---
title: "Class: ConvexReactClient | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/react.ConvexReactClient"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/react](https://docs.convex.dev/api/modules/react.html)
* ConvexReactClient

Copy as Markdown

Copied!

On this page

[react](https://docs.convex.dev/api/modules/react.html).ConvexReactClient

A Convex client for use within React.

This loads reactive queries and executes mutations over a WebSocket.

## Constructors[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#constructor "Direct link to constructor")

• **new ConvexReactClient**(`address`, `options?`)

#### Parameters[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `address` | `string` | The url of your Convex deployment, often provided by an environment variable. E.g. `https://small-mouse-123.convex.cloud`. |
| `options?` | [`ConvexReactClientOptions`](https://docs.convex.dev/api/interfaces/react.ConvexReactClientOptions.html) | See [ConvexReactClientOptions](https://docs.convex.dev/api/interfaces/react.ConvexReactClientOptions.html) for a full description. |

#### Defined in[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#defined-in "Direct link to Defined in")

[react/client.ts:317](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L317)

## Accessors[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#accessors "Direct link to Accessors")

### url[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#url "Direct link to url")

• `get` **url**(): `string`

Return the address for this client, useful for creating a new client.

Not guaranteed to match the address with which this client was constructed:
it may be canonicalized.

#### Returns[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#returns "Direct link to Returns")

`string`

#### Defined in[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#defined-in-1 "Direct link to Defined in")

[react/client.ts:352](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L352)

---

### logger[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#logger "Direct link to logger")

• `get` **logger**(): `Logger`

Get the logger for this client.

#### Returns[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#returns-1 "Direct link to Returns")

`Logger`

The Logger for this client.

#### Defined in[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#defined-in-2 "Direct link to Defined in")

[react/client.ts:713](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L713)

## Methods[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#methods "Direct link to Methods")

### setAuth[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#setauth "Direct link to setAuth")

▸ **setAuth**(`fetchToken`, `onChange?`): `void`

Set the authentication token to be used for subsequent queries and mutations.
`fetchToken` will be called automatically again if a token expires.
`fetchToken` should return `null` if the token cannot be retrieved, for example
when the user's rights were permanently revoked.

#### Parameters[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `fetchToken` | [`AuthTokenFetcher`](https://docs.convex.dev/api/modules/browser.html#authtokenfetcher) | an async function returning the JWT-encoded OpenID Connect Identity Token |
| `onChange?` | (`isAuthenticated`: `boolean`) => `void` | a callback that will be called when the authentication status changes |

#### Returns[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#returns-2 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#defined-in-3 "Direct link to Defined in")

[react/client.ts:408](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L408)

---

### clearAuth[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#clearauth "Direct link to clearAuth")

▸ **clearAuth**(): `void`

Clear the current authentication token if set.

#### Returns[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#returns-3 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#defined-in-4 "Direct link to Defined in")

[react/client.ts:430](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L430)

---

### watchQuery[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#watchquery "Direct link to watchQuery")

▸ **watchQuery**<`Query`>(`query`, `...argsAndOptions`): [`Watch`](https://docs.convex.dev/api/interfaces/react.Watch.html)<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

Construct a new [Watch](https://docs.convex.dev/api/interfaces/react.Watch.html) on a Convex query function.

**Most application code should not call this method directly. Instead use
the [useQuery](https://docs.convex.dev/api/modules/react.html#usequery) hook.**

The act of creating a watch does nothing, a Watch is stateless.

#### Type parameters[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `query` | `Query` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the public query to run. |
| `...argsAndOptions` | [`ArgsAndOptions`](https://docs.convex.dev/api/modules/server.html#argsandoptions)<`Query`, [`WatchQueryOptions`](https://docs.convex.dev/api/interfaces/react.WatchQueryOptions.html)> | - |

#### Returns[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#returns-4 "Direct link to Returns")

[`Watch`](https://docs.convex.dev/api/interfaces/react.Watch.html)<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

The [Watch](https://docs.convex.dev/api/interfaces/react.Watch.html) object.

#### Defined in[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#defined-in-5 "Direct link to Defined in")

[react/client.ts:463](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L463)

---

### prewarmQuery[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#prewarmquery "Direct link to prewarmQuery")

▸ **prewarmQuery**<`Query`>(`queryOptions`): `void`

Indicates likely future interest in a query subscription.

The implementation currently immediately subscribes to a query. In the future this method
may prioritize some queries over others, fetch the query result without subscribing, or
do nothing in slow network connections or high load scenarios.

To use this in a React component, call useQuery() and ignore the return value.

#### Type parameters[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `queryOptions` | `ConvexQueryOptions`<`Query`> & { `extendSubscriptionFor?`: `number` } | A query (function reference from an api object) and its args, plus an optional extendSubscriptionFor for how long to subscribe to the query. |

#### Returns[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#returns-5 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#defined-in-6 "Direct link to Defined in")

[react/client.ts:539](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L539)

---

### mutation[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#mutation "Direct link to mutation")

▸ **mutation**<`Mutation`>(`mutation`, `...argsAndOptions`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Mutation`>>

Execute a mutation function.

#### Type parameters[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Mutation` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"mutation"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#parameters-4 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `mutation` | `Mutation` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the public mutation to run. |
| `...argsAndOptions` | [`ArgsAndOptions`](https://docs.convex.dev/api/modules/server.html#argsandoptions)<`Mutation`, [`MutationOptions`](https://docs.convex.dev/api/interfaces/react.MutationOptions.html)<[`FunctionArgs`](https://docs.convex.dev/api/modules/server.html#functionargs)<`Mutation`>>> | - |

#### Returns[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#returns-6 "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Mutation`>>

A promise of the mutation's result.

#### Defined in[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#defined-in-7 "Direct link to Defined in")

[react/client.ts:618](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L618)

---

### action[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#action "Direct link to action")

▸ **action**<`Action`>(`action`, `...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Action`>>

Execute an action function.

#### Type parameters[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#type-parameters-3 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Action` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"action"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#parameters-5 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `action` | `Action` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the public action to run. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Action`> | An arguments object for the action. If this is omitted, the arguments will be `{}`. |

#### Returns[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#returns-7 "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Action`>>

A promise of the action's result.

#### Defined in[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#defined-in-8 "Direct link to Defined in")

[react/client.ts:639](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L639)

---

### query[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#query "Direct link to query")

▸ **query**<`Query`>(`query`, `...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

Fetch a query result once.

**Most application code should subscribe to queries instead, using
the [useQuery](https://docs.convex.dev/api/modules/react.html#usequery) hook.**

#### Type parameters[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#type-parameters-4 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#parameters-6 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `query` | `Query` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the public query to run. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Query`> | An arguments object for the query. If this is omitted, the arguments will be `{}`. |

#### Returns[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#returns-8 "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

A promise of the query's result.

#### Defined in[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#defined-in-9 "Direct link to Defined in")

[react/client.ts:659](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L659)

---

### connectionState[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#connectionstate "Direct link to connectionState")

▸ **connectionState**(): [`ConnectionState`](https://docs.convex.dev/api/modules/browser.html#connectionstate)

Get the current [ConnectionState](https://docs.convex.dev/api/modules/browser.html#connectionstate) between the client and the Convex
backend.

#### Returns[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#returns-9 "Direct link to Returns")

[`ConnectionState`](https://docs.convex.dev/api/modules/browser.html#connectionstate)

The [ConnectionState](https://docs.convex.dev/api/modules/browser.html#connectionstate) with the Convex backend.

#### Defined in[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#defined-in-10 "Direct link to Defined in")

[react/client.ts:686](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L686)

---

### subscribeToConnectionState[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#subscribetoconnectionstate "Direct link to subscribeToConnectionState")

▸ **subscribeToConnectionState**(`cb`): () => `void`

Subscribe to the [ConnectionState](https://docs.convex.dev/api/modules/browser.html#connectionstate) between the client and the Convex
backend, calling a callback each time it changes.

Subscribed callbacks will be called when any part of ConnectionState changes.
ConnectionState may grow in future versions (e.g. to provide a array of
inflight requests) in which case callbacks would be called more frequently.
ConnectionState may also *lose* properties in future versions as we figure
out what information is most useful. As such this API is considered unstable.

#### Parameters[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#parameters-7 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `cb` | (`connectionState`: [`ConnectionState`](https://docs.convex.dev/api/modules/browser.html#connectionstate)) => `void` |

#### Returns[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#returns-10 "Direct link to Returns")

`fn`

An unsubscribe function to stop listening.

▸ (): `void`

Subscribe to the [ConnectionState](https://docs.convex.dev/api/modules/browser.html#connectionstate) between the client and the Convex
backend, calling a callback each time it changes.

Subscribed callbacks will be called when any part of ConnectionState changes.
ConnectionState may grow in future versions (e.g. to provide a array of
inflight requests) in which case callbacks would be called more frequently.
ConnectionState may also *lose* properties in future versions as we figure
out what information is most useful. As such this API is considered unstable.

##### Returns[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#returns-11 "Direct link to Returns")

`void`

An unsubscribe function to stop listening.

#### Defined in[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#defined-in-11 "Direct link to Defined in")

[react/client.ts:702](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L702)

---

### close[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#close "Direct link to close")

▸ **close**(): `Promise`<`void`>

Close any network handles associated with this client and stop all subscriptions.

Call this method when you're done with a [ConvexReactClient](https://docs.convex.dev/api/classes/react.ConvexReactClient.html) to
dispose of its sockets and resources.

#### Returns[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#returns-12 "Direct link to Returns")

`Promise`<`void`>

A `Promise` fulfilled when the connection has been completely closed.

#### Defined in[​](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#defined-in-12 "Direct link to Defined in")

[react/client.ts:725](https://github.com/get-convex/convex-js/blob/main/src/react/client.ts#L725)

[Previous

Module: react](https://docs.convex.dev/api/modules/react.html)[Next

ConvexReactClientOptions](https://docs.convex.dev/api/interfaces/react.ConvexReactClientOptions.html)

* [Constructors](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#constructor)
* [Accessors](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#accessors)
  + [url](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#url)
  + [logger](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#logger)
* [Methods](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#methods)
  + [setAuth](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#setauth)
  + [clearAuth](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#clearauth)
  + [watchQuery](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#watchquery)
  + [prewarmQuery](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#prewarmquery)
  + [mutation](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#mutation)
  + [action](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#action)
  + [query](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#query)
  + [connectionState](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#connectionstate)
  + [subscribeToConnectionState](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#subscribetoconnectionstate)
  + [close](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#close)
