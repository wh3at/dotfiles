---
title: "Class: ConvexHttpClient | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/browser.ConvexHttpClient"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/browser](https://docs.convex.dev/api/modules/browser.html)
* ConvexHttpClient

Copy as Markdown

Copied!

On this page

[browser](https://docs.convex.dev/api/modules/browser.html).ConvexHttpClient

A Convex client that runs queries and mutations over HTTP.

This client is stateful (it has user credentials and queues mutations)
so take care to avoid sharing it between requests in a server.

This is appropriate for server-side code (like Netlify Lambdas) or non-reactive
webapps.

## Constructors[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#constructor "Direct link to constructor")

• **new ConvexHttpClient**(`address`, `options?`)

Create a new [ConvexHttpClient](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html).

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `address` | `string` | The url of your Convex deployment, often provided by an environment variable. E.g. `https://small-mouse-123.convex.cloud`. |
| `options?` | `Object` | An object of options. - `skipConvexDeploymentUrlCheck` - Skip validating that the Convex deployment URL looks like `https://happy-animal-123.convex.cloud` or localhost. This can be useful if running a self-hosted Convex backend that uses a different URL. - `logger` - A logger or a boolean. If not provided, logs to the console. You can construct your own logger to customize logging to log elsewhere or not log at all, or use `false` as a shorthand for a no-op logger. A logger is an object with 4 methods: log(), warn(), error(), and logVerbose(). These methods can receive multiple arguments of any types, like console.log(). - `auth` - A JWT containing identity claims accessible in Convex functions. This identity may expire so it may be necessary to call `setAuth()` later, but for short-lived clients it's convenient to specify this value here. |
| `options.skipConvexDeploymentUrlCheck?` | `boolean` | - |
| `options.logger?` | `boolean` | `Logger` | - |
| `options.auth?` | `string` | - |

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#defined-in "Direct link to Defined in")

[browser/http\_client.ts:95](https://github.com/get-convex/convex-js/blob/main/src/browser/http_client.ts#L95)

## Accessors[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#accessors "Direct link to Accessors")

### url[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#url "Direct link to url")

• `get` **url**(): `string`

Return the address for this client, useful for creating a new client.

Not guaranteed to match the address with which this client was constructed:
it may be canonicalized.

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#returns "Direct link to Returns")

`string`

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#defined-in-1 "Direct link to Defined in")

[browser/http\_client.ts:143](https://github.com/get-convex/convex-js/blob/main/src/browser/http_client.ts#L143)

## Methods[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#methods "Direct link to Methods")

### backendUrl[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#backendurl "Direct link to backendUrl")

▸ **backendUrl**(): `string`

Obtain the [ConvexHttpClient](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html)'s URL to its backend.

**`Deprecated`**

Use url, which returns the url without /api at the end.

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#returns-1 "Direct link to Returns")

`string`

The URL to the Convex backend, including the client's API version.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#defined-in-2 "Direct link to Defined in")

[browser/http\_client.ts:133](https://github.com/get-convex/convex-js/blob/main/src/browser/http_client.ts#L133)

---

### setAuth[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#setauth "Direct link to setAuth")

▸ **setAuth**(`value`): `void`

Set the authentication token to be used for subsequent queries and mutations.

Should be called whenever the token changes (i.e. due to expiration and refresh).

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `value` | `string` | JWT-encoded OpenID Connect identity token. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#returns-2 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#defined-in-3 "Direct link to Defined in")

[browser/http\_client.ts:154](https://github.com/get-convex/convex-js/blob/main/src/browser/http_client.ts#L154)

---

### clearAuth[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#clearauth "Direct link to clearAuth")

▸ **clearAuth**(): `void`

Clear the current authentication token if set.

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#returns-3 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#defined-in-4 "Direct link to Defined in")

[browser/http\_client.ts:180](https://github.com/get-convex/convex-js/blob/main/src/browser/http_client.ts#L180)

---

### consistentQuery[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#consistentquery "Direct link to consistentQuery")

▸ **consistentQuery**<`Query`>(`query`, `...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

This API is experimental: it may change or disappear.

Execute a Convex query function at the same timestamp as every other
consistent query execution run by this HTTP client.

This doesn't make sense for long-lived ConvexHttpClients as Convex
backends can read a limited amount into the past: beyond 30 seconds
in the past may not be available.

Create a new client to use a consistent time.

**`Deprecated`**

This API is experimental: it may change or disappear.

#### Type parameters[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `query` | `Query` | - |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Query`> | The arguments object for the query. If this is omitted, the arguments will be `{}`. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#returns-4 "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

A promise of the query's result.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#defined-in-5 "Direct link to Defined in")

[browser/http\_client.ts:222](https://github.com/get-convex/convex-js/blob/main/src/browser/http_client.ts#L222)

---

### query[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#query "Direct link to query")

▸ **query**<`Query`>(`query`, `...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

Execute a Convex query function.

#### Type parameters[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `query` | `Query` | - |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Query`> | The arguments object for the query. If this is omitted, the arguments will be `{}`. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#returns-5 "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

A promise of the query's result.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#defined-in-6 "Direct link to Defined in")

[browser/http\_client.ts:266](https://github.com/get-convex/convex-js/blob/main/src/browser/http_client.ts#L266)

---

### mutation[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#mutation "Direct link to mutation")

▸ **mutation**<`Mutation`>(`mutation`, `...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Mutation`>>

Execute a Convex mutation function. Mutations are queued by default.

#### Type parameters[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Mutation` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"mutation"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#parameters-4 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `mutation` | `Mutation` | - |
| `...args` | [`ArgsAndOptions`](https://docs.convex.dev/api/modules/server.html#argsandoptions)<`Mutation`, [`HttpMutationOptions`](https://docs.convex.dev/api/modules/browser.html#httpmutationoptions)> | The arguments object for the mutation. If this is omitted, the arguments will be `{}`. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#returns-6 "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Mutation`>>

A promise of the mutation's result.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#defined-in-7 "Direct link to Defined in")

[browser/http\_client.ts:426](https://github.com/get-convex/convex-js/blob/main/src/browser/http_client.ts#L426)

---

### action[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#action "Direct link to action")

▸ **action**<`Action`>(`action`, `...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Action`>>

Execute a Convex action function. Actions are not queued.

#### Type parameters[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#type-parameters-3 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Action` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"action"`> |

#### Parameters[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#parameters-5 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `action` | `Action` | - |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Action`> | The arguments object for the action. If this is omitted, the arguments will be `{}`. |

#### Returns[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#returns-7 "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Action`>>

A promise of the action's result.

#### Defined in[​](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#defined-in-8 "Direct link to Defined in")

[browser/http\_client.ts:449](https://github.com/get-convex/convex-js/blob/main/src/browser/http_client.ts#L449)

[Previous

ConvexClient](https://docs.convex.dev/api/classes/browser.ConvexClient.html)[Next

BaseConvexClientOptions](https://docs.convex.dev/api/interfaces/browser.BaseConvexClientOptions.html)

* [Constructors](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#constructor)
* [Accessors](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#accessors)
  + [url](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#url)
* [Methods](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#methods)
  + [backendUrl](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#backendurl)
  + [setAuth](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#setauth)
  + [clearAuth](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#clearauth)
  + [consistentQuery](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#consistentquery)
  + [query](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#query)
  + [mutation](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#mutation)
  + [action](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html#action)
