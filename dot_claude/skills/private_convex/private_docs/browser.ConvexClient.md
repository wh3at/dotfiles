---
title: "Class: ConvexClient | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/browser.ConvexClient"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/browser](https://docs.convex.dev/api/modules/browser.html)
* ConvexClient

Copy as Markdown

Copied!

On this page

[browser](https://docs.convex.dev/api/modules/browser.html).ConvexClient

Subscribes to Convex query functions and executes mutations and actions over a WebSocket.

Optimistic updates for mutations are not provided for this client.
Third party clients may choose to wrap [BaseConvexClient](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html) for additional control.

```
const client = new ConvexClient("https://happy-otter-123.convex.cloud");
const unsubscribe = client.onUpdate(api.messages.list, {}, (messages) => {
  console.log(messages[0].body);
});
```

## Constructors[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#constructor "Direct link to constructor")

• **new ConvexClient**(`address`, `options?`)

Construct a client and immediately initiate a WebSocket connection to the passed address.

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `address` | `string` |
| `options` | [`ConvexClientOptions`](https://docs.convex.dev/api/modules/browser.html#convexclientoptions) |

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in "Direct link to Defined in")

[browser/simple\_client.ts:119](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L119)

## Accessors[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#accessors "Direct link to Accessors")

### closed[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#closed "Direct link to closed")

• `get` **closed**(): `boolean`

Once closed no registered callbacks will fire again.

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns "Direct link to Returns")

`boolean`

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in-1 "Direct link to Defined in")

[browser/simple\_client.ts:96](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L96)

---

### client[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#client "Direct link to client")

• `get` **client**(): [`BaseConvexClient`](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html)

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns-1 "Direct link to Returns")

[`BaseConvexClient`](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html)

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in-2 "Direct link to Defined in")

[browser/simple\_client.ts:99](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L99)

---

### disabled[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#disabled "Direct link to disabled")

• `get` **disabled**(): `boolean`

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns-2 "Direct link to Returns")

`boolean`

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in-3 "Direct link to Defined in")

[browser/simple\_client.ts:110](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L110)

## Methods[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#methods "Direct link to Methods")

### onUpdate[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#onupdate "Direct link to onUpdate")

▸ **onUpdate**<`Query`>(`query`, `args`, `callback`, `onError?`): `Unsubscribe`<`Query`[`"_returnType"`]>

Call a callback whenever a new result for a query is received. The callback
will run soon after being registered if a result for the query is already
in memory.

The return value is an Unsubscribe object which is both a function
an an object with properties. Both of the patterns below work with this object:

```
// call the return value as a function
const unsubscribe = client.onUpdate(api.messages.list, {}, (messages) => {
  console.log(messages);
});
unsubscribe();

// unpack the return value into its properties
const {
  getCurrentValue,
  unsubscribe,
} = client.onUpdate(api.messages.list, {}, (messages) => {
  console.log(messages);
});
```

#### Type parameters[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `query` | `Query` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the public query to run. |
| `args` | [`FunctionArgs`](https://docs.convex.dev/api/modules/server.html#functionargs)<`Query`> | The arguments to run the query with. |
| `callback` | (`result`: [`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>) => `unknown` | Function to call when the query result updates. |
| `onError?` | (`e`: `Error`) => `unknown` | Function to call when the query result updates with an error. If not provided, errors will be thrown instead of calling the callback. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns-3 "Direct link to Returns")

`Unsubscribe`<`Query`[`"_returnType"`]>

an Unsubscribe function to stop calling the onUpdate function.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in-4 "Direct link to Defined in")

[browser/simple\_client.ts:185](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L185)

---

### onPaginatedUpdate\_experimental[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#onpaginatedupdate_experimental "Direct link to onPaginatedUpdate_experimental")

▸ **onPaginatedUpdate\_experimental**<`Query`>(`query`, `args`, `options`, `callback`, `onError?`): `Unsubscribe`<`PaginatedQueryResult`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>[]>>

Call a callback whenever a new result for a paginated query is received.

This is an experimental preview: the final API may change.
In particular, caching behavior, page splitting, and required paginated query options
may change.

#### Type parameters[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `query` | `Query` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the public query to run. |
| `args` | [`FunctionArgs`](https://docs.convex.dev/api/modules/server.html#functionargs)<`Query`> | The arguments to run the query with. |
| `options` | `Object` | Options for the paginated query including initialNumItems and id. |
| `options.initialNumItems` | `number` | - |
| `callback` | (`result`: [`PaginationResult`](https://docs.convex.dev/api/interfaces/server.PaginationResult.html)<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>) => `unknown` | Function to call when the query result updates. |
| `onError?` | (`e`: `Error`) => `unknown` | Function to call when the query result updates with an error. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns-4 "Direct link to Returns")

`Unsubscribe`<`PaginatedQueryResult`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>[]>>

an Unsubscribe function to stop calling the callback.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in-5 "Direct link to Defined in")

[browser/simple\_client.ts:263](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L263)

---

### close[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#close "Direct link to close")

▸ **close**(): `Promise`<`void`>

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns-5 "Direct link to Returns")

`Promise`<`void`>

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in-6 "Direct link to Defined in")

[browser/simple\_client.ts:366](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L366)

---

### getAuth[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#getauth "Direct link to getAuth")

▸ **getAuth**(): `undefined` | { `token`: `string` ; `decoded`: `Record`<`string`, `any`> }

Get the current JWT auth token and decoded claims.

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns-6 "Direct link to Returns")

`undefined` | { `token`: `string` ; `decoded`: `Record`<`string`, `any`> }

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in-7 "Direct link to Defined in")

[browser/simple\_client.ts:380](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L380)

---

### setAuth[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#setauth "Direct link to setAuth")

▸ **setAuth**(`fetchToken`, `onChange?`): `void`

Set the authentication token to be used for subsequent queries and mutations.
`fetchToken` will be called automatically again if a token expires.
`fetchToken` should return `null` if the token cannot be retrieved, for example
when the user's rights were permanently revoked.

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `fetchToken` | [`AuthTokenFetcher`](https://docs.convex.dev/api/modules/browser.html#authtokenfetcher) | an async function returning the JWT (typically an OpenID Connect Identity Token) |
| `onChange?` | (`isAuthenticated`: `boolean`) => `void` | a callback that will be called when the authentication status changes |

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns-7 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in-8 "Direct link to Defined in")

[browser/simple\_client.ts:393](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L393)

---

### mutation[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#mutation "Direct link to mutation")

▸ **mutation**<`Mutation`>(`mutation`, `args`, `options?`): `Promise`<`Awaited`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Mutation`>>>

Execute a mutation function.

#### Type parameters[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Mutation` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"mutation"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#parameters-4 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `mutation` | `Mutation` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the public mutation to run. |
| `args` | [`FunctionArgs`](https://docs.convex.dev/api/modules/server.html#functionargs)<`Mutation`> | An arguments object for the mutation. |
| `options?` | [`MutationOptions`](https://docs.convex.dev/api/interfaces/browser.MutationOptions.html) | A [MutationOptions](https://docs.convex.dev/api/interfaces/browser.MutationOptions.html) options object for the mutation. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns-8 "Direct link to Returns")

`Promise`<`Awaited`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Mutation`>>>

A promise of the mutation's result.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in-9 "Direct link to Defined in")

[browser/simple\_client.ts:488](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L488)

---

### action[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#action "Direct link to action")

▸ **action**<`Action`>(`action`, `args`): `Promise`<`Awaited`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Action`>>>

Execute an action function.

#### Type parameters[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#type-parameters-3 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Action` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"action"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#parameters-5 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `action` | `Action` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the public action to run. |
| `args` | [`FunctionArgs`](https://docs.convex.dev/api/modules/server.html#functionargs)<`Action`> | An arguments object for the action. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns-9 "Direct link to Returns")

`Promise`<`Awaited`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Action`>>>

A promise of the action's result.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in-10 "Direct link to Defined in")

[browser/simple\_client.ts:505](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L505)

---

### query[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#query "Direct link to query")

▸ **query**<`Query`>(`query`, `args`): `Promise`<`Awaited`<`Query`[`"_returnType"`]>>

Fetch a query result once.

#### Type parameters[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#type-parameters-4 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#parameters-6 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `query` | `Query` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the public query to run. |
| `args` | `Query`[`"_args"`] | An arguments object for the query. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns-10 "Direct link to Returns")

`Promise`<`Awaited`<`Query`[`"_returnType"`]>>

A promise of the query's result.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in-11 "Direct link to Defined in")

[browser/simple\_client.ts:521](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L521)

---

### connectionState[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#connectionstate "Direct link to connectionState")

▸ **connectionState**(): [`ConnectionState`](https://docs.convex.dev/api/modules/browser.html#connectionstate)

Get the current [ConnectionState](https://docs.convex.dev/api/modules/browser.html#connectionstate) between the client and the Convex
backend.

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns-11 "Direct link to Returns")

[`ConnectionState`](https://docs.convex.dev/api/modules/browser.html#connectionstate)

The [ConnectionState](https://docs.convex.dev/api/modules/browser.html#connectionstate) with the Convex backend.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in-12 "Direct link to Defined in")

[browser/simple\_client.ts:553](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L553)

---

### subscribeToConnectionState[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#subscribetoconnectionstate "Direct link to subscribeToConnectionState")

▸ **subscribeToConnectionState**(`cb`): () => `void`

Subscribe to the [ConnectionState](https://docs.convex.dev/api/modules/browser.html#connectionstate) between the client and the Convex
backend, calling a callback each time it changes.

Subscribed callbacks will be called when any part of ConnectionState changes.
ConnectionState may grow in future versions (e.g. to provide a array of
inflight requests) in which case callbacks would be called more frequently.

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#parameters-7 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `cb` | (`connectionState`: [`ConnectionState`](https://docs.convex.dev/api/modules/browser.html#connectionstate)) => `void` |

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns-12 "Direct link to Returns")

`fn`

An unsubscribe function to stop listening.

▸ (): `void`

Subscribe to the [ConnectionState](https://docs.convex.dev/api/modules/browser.html#connectionstate) between the client and the Convex
backend, calling a callback each time it changes.

Subscribed callbacks will be called when any part of ConnectionState changes.
ConnectionState may grow in future versions (e.g. to provide a array of
inflight requests) in which case callbacks would be called more frequently.

##### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#returns-13 "Direct link to Returns")

`void`

An unsubscribe function to stop listening.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexClient.html#defined-in-13 "Direct link to Defined in")

[browser/simple\_client.ts:568](https://github.com/get-convex/convex-js/blob/main/src/browser/simple_client.ts#L568)

[Previous

BaseConvexClient](https://docs.convex.dev/api/classes/browser.BaseConvexClient.html)[Next

ConvexHttpClient](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html)

* [Constructors](https://docs.convex.dev/api/classes/browser.ConvexClient.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/browser.ConvexClient.html#constructor)
* [Accessors](https://docs.convex.dev/api/classes/browser.ConvexClient.html#accessors)
  + [closed](https://docs.convex.dev/api/classes/browser.ConvexClient.html#closed)
  + [client](https://docs.convex.dev/api/classes/browser.ConvexClient.html#client)
  + [disabled](https://docs.convex.dev/api/classes/browser.ConvexClient.html#disabled)
* [Methods](https://docs.convex.dev/api/classes/browser.ConvexClient.html#methods)
  + [onUpdate](https://docs.convex.dev/api/classes/browser.ConvexClient.html#onupdate)
  + [onPaginatedUpdate\_experimental](https://docs.convex.dev/api/classes/browser.ConvexClient.html#onpaginatedupdate_experimental)
  + [close](https://docs.convex.dev/api/classes/browser.ConvexClient.html#close)
  + [getAuth](https://docs.convex.dev/api/classes/browser.ConvexClient.html#getauth)
  + [setAuth](https://docs.convex.dev/api/classes/browser.ConvexClient.html#setauth)
  + [mutation](https://docs.convex.dev/api/classes/browser.ConvexClient.html#mutation)
  + [action](https://docs.convex.dev/api/classes/browser.ConvexClient.html#action)
  + [query](https://docs.convex.dev/api/classes/browser.ConvexClient.html#query)
  + [connectionState](https://docs.convex.dev/api/classes/browser.ConvexClient.html#connectionstate)
  + [subscribeToConnectionState](https://docs.convex.dev/api/classes/browser.ConvexClient.html#subscribetoconnectionstate)
