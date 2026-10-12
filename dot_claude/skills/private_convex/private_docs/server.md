---
title: "server.js | Convex Developer Hub"
source_url: "https://docs.convex.dev/generated-api/server"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Generated Code](https://docs.convex.dev/generated-api/index.html)
* server.js

Copy as Markdown

Copied!

On this page

This code is generated

These exports are not directly available in the `convex` package!

Instead you must run `npx convex dev` to create `convex/_generated/server.js`
and `convex/_generated/server.d.ts`.

Generated utilities for implementing server-side Convex query and mutation
functions.

## Functions[​](https://docs.convex.dev/generated-api/server.html#functions "Direct link to Functions")

### query[​](https://docs.convex.dev/generated-api/server.html#query "Direct link to query")

▸ **query**(`func`): [`RegisteredQuery`](https://docs.convex.dev/api/modules/server.html#registeredquery)

Define a query in this Convex app's public API.

This function will be allowed to read your Convex database and will be
accessible from the client.

This is an alias of [`queryGeneric`](https://docs.convex.dev/api/modules/server.html#querygeneric) that is
typed for your app's data model.

#### Parameters[​](https://docs.convex.dev/generated-api/server.html#parameters "Direct link to Parameters")

| Name | Description |
| --- | --- |
| `func` | The query function. It receives a [QueryCtx](https://docs.convex.dev/generated-api/server.html#queryctx) as its first argument. |

#### Returns[​](https://docs.convex.dev/generated-api/server.html#returns "Direct link to Returns")

[`RegisteredQuery`](https://docs.convex.dev/api/modules/server.html#registeredquery)

The wrapped query. Include this as an `export` to name it and make it
accessible.

---

### internalQuery[​](https://docs.convex.dev/generated-api/server.html#internalquery "Direct link to internalQuery")

▸ **internalQuery**(`func`):
[`RegisteredQuery`](https://docs.convex.dev/api/modules/server.html#registeredquery)

Define a query that is only accessible from other Convex functions (but not from
the client).

This function will be allowed to read from your Convex database. It will not be
accessible from the client.

This is an alias of
[`internalQueryGeneric`](https://docs.convex.dev/api/modules/server.html#internalquerygeneric) that is typed
for your app's data model.

#### Parameters[​](https://docs.convex.dev/generated-api/server.html#parameters-1 "Direct link to Parameters")

| Name | Description |
| --- | --- |
| `func` | The query function. It receives a [QueryCtx](https://docs.convex.dev/generated-api/server.html#queryctx) as its first argument. |

#### Returns[​](https://docs.convex.dev/generated-api/server.html#returns-1 "Direct link to Returns")

[`RegisteredQuery`](https://docs.convex.dev/api/modules/server.html#registeredquery)

The wrapped query. Include this as an `export` to name it and make it
accessible.

---

### mutation[​](https://docs.convex.dev/generated-api/server.html#mutation "Direct link to mutation")

▸ **mutation**(`func`):
[`RegisteredMutation`](https://docs.convex.dev/api/modules/server.html#registeredmutation)

Define a mutation in this Convex app's public API.

This function will be allowed to modify your Convex database and will be
accessible from the client.

This is an alias of [`mutationGeneric`](https://docs.convex.dev/api/modules/server.html#mutationgeneric)
that is typed for your app's data model.

#### Parameters[​](https://docs.convex.dev/generated-api/server.html#parameters-2 "Direct link to Parameters")

| Name | Description |
| --- | --- |
| `func` | The mutation function. It receives a [MutationCtx](https://docs.convex.dev/generated-api/server.html#mutationctx) as its first argument. |

#### Returns[​](https://docs.convex.dev/generated-api/server.html#returns-2 "Direct link to Returns")

[`RegisteredMutation`](https://docs.convex.dev/api/modules/server.html#registeredmutation)

The wrapped mutation. Include this as an `export` to name it and make it
accessible.

---

### internalMutation[​](https://docs.convex.dev/generated-api/server.html#internalmutation "Direct link to internalMutation")

▸ **internalMutation**(`func`):
[`RegisteredMutation`](https://docs.convex.dev/api/modules/server.html#registeredmutation)

Define a mutation that is only accessible from other Convex functions (but not
from the client).

This function will be allowed to read and write from your Convex database. It
will not be accessible from the client.

This is an alias of
[`internalMutationGeneric`](https://docs.convex.dev/api/modules/server.html#internalmutationgeneric) that is
typed for your app's data model.

#### Parameters[​](https://docs.convex.dev/generated-api/server.html#parameters-3 "Direct link to Parameters")

| Name | Description |
| --- | --- |
| `func` | The mutation function. It receives a [MutationCtx](https://docs.convex.dev/generated-api/server.html#mutationctx) as its first argument. |

#### Returns[​](https://docs.convex.dev/generated-api/server.html#returns-3 "Direct link to Returns")

[`RegisteredMutation`](https://docs.convex.dev/api/modules/server.html#registeredmutation)

The wrapped mutation. Include this as an `export` to name it and make it
accessible.

---

### action[​](https://docs.convex.dev/generated-api/server.html#action "Direct link to action")

▸ **action**(`func`): [`RegisteredAction`](https://docs.convex.dev/api/modules/server.html#registeredaction)

Define an action in this Convex app's public API.

An action is a function which can execute any JavaScript code, including
non-deterministic code and code with side-effects, like calling third-party
services. They can be run in Convex's JavaScript environment or in Node.js using
the `"use node"` directive. They can interact with the database indirectly by
calling queries and mutations using the [`ActionCtx`](https://docs.convex.dev/generated-api/server.html#actionctx).

This is an alias of [`actionGeneric`](https://docs.convex.dev/api/modules/server.html#actiongeneric) that is
typed for your app's data model.

#### Parameters[​](https://docs.convex.dev/generated-api/server.html#parameters-4 "Direct link to Parameters")

| Name | Description |
| --- | --- |
| `func` | The action function. It receives an [ActionCtx](https://docs.convex.dev/generated-api/server.html#actionctx) as its first argument. |

#### Returns[​](https://docs.convex.dev/generated-api/server.html#returns-4 "Direct link to Returns")

[`RegisteredAction`](https://docs.convex.dev/api/modules/server.html#registeredaction)

The wrapped function. Include this as an `export` to name it and make it
accessible.

---

### internalAction[​](https://docs.convex.dev/generated-api/server.html#internalaction "Direct link to internalAction")

▸ **internalAction**(`func`):
[`RegisteredAction`](https://docs.convex.dev/api/modules/server.html#registeredaction)

Define an action that is only accessible from other Convex functions (but not
from the client).

This is an alias of
[`internalActionGeneric`](https://docs.convex.dev/api/modules/server.html#internalactiongeneric) that is
typed for your app's data model.

#### Parameters[​](https://docs.convex.dev/generated-api/server.html#parameters-5 "Direct link to Parameters")

| Name | Description |
| --- | --- |
| `func` | The action function. It receives an [ActionCtx](https://docs.convex.dev/generated-api/server.html#actionctx) as its first argument. |

#### Returns[​](https://docs.convex.dev/generated-api/server.html#returns-5 "Direct link to Returns")

[`RegisteredAction`](https://docs.convex.dev/api/modules/server.html#registeredaction)

The wrapped action. Include this as an `export` to name it and make it
accessible.

---

### httpAction[​](https://docs.convex.dev/generated-api/server.html#httpaction "Direct link to httpAction")

▸
**httpAction**(`func: (ctx: ActionCtx, request: Request) => Promise<Response>`):
[`PublicHttpAction`](https://docs.convex.dev/api/modules/server.html#publichttpaction)

#### Parameters[​](https://docs.convex.dev/generated-api/server.html#parameters-6 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `func` | `(ctx: ActionCtx, request: Request) => Promise<Response>` | The function. It receives an [`ActionCtx`](https://docs.convex.dev/api/modules/server.html#actionctx) as its first argument and a [`Request`](https://developer.mozilla.org/en-US/docs/Web/API/Request) as its second argument. |

#### Returns[​](https://docs.convex.dev/generated-api/server.html#returns-6 "Direct link to Returns")

[`PublicHttpAction`](https://docs.convex.dev/api/modules/server.html#publichttpaction)

The wrapped function. Import this function from `convex/http.js` and route it to
hook it up.

## Types[​](https://docs.convex.dev/generated-api/server.html#types "Direct link to Types")

### QueryCtx[​](https://docs.convex.dev/generated-api/server.html#queryctx "Direct link to QueryCtx")

Ƭ **QueryCtx**: `Object`

A set of services for use within Convex query functions.

The query context is passed as the first argument to any Convex query function
run on the server.

This differs from the [MutationCtx](https://docs.convex.dev/generated-api/server.html#mutationctx) because all of the services
are read-only.

This is an alias of [`GenericQueryCtx`](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html)
that is typed for your app's data model.

#### Type declaration[​](https://docs.convex.dev/generated-api/server.html#type-declaration "Direct link to Type declaration")

| Name | Type |
| --- | --- |
| `db` | [`DatabaseReader`](https://docs.convex.dev/generated-api/server.html#databasereader) |
| `auth` | [`Auth`](https://docs.convex.dev/api/interfaces/server.Auth.html) |
| `storage` | [`StorageReader`](https://docs.convex.dev/api/interfaces/server.StorageReader.html) |

---

### MutationCtx[​](https://docs.convex.dev/generated-api/server.html#mutationctx "Direct link to MutationCtx")

Ƭ **MutationCtx**: `Object`

A set of services for use within Convex mutation functions.

The mutation context is passed as the first argument to any Convex mutation
function run on the server.

This is an alias of
[`GenericMutationCtx`](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html) that is typed
for your app's data model.

#### Type declaration[​](https://docs.convex.dev/generated-api/server.html#type-declaration-1 "Direct link to Type declaration")

| Name | Type |
| --- | --- |
| `db` | [`DatabaseWriter`](https://docs.convex.dev/generated-api/server.html#databasewriter) |
| `auth` | [`Auth`](https://docs.convex.dev/api/interfaces/server.Auth.html) |
| `storage` | [`StorageWriter`](https://docs.convex.dev/api/interfaces/server.StorageWriter.html) |
| `scheduler` | [`Scheduler`](https://docs.convex.dev/api/interfaces/server.Scheduler.html) |

---

### ActionCtx[​](https://docs.convex.dev/generated-api/server.html#actionctx "Direct link to ActionCtx")

Ƭ **ActionCtx**: `Object`

A set of services for use within Convex action functions.

The action context is passed as the first argument to any Convex action function
run on the server.

This is an alias of [`ActionCtx`](https://docs.convex.dev/api/modules/server.html#actionctx) that is typed
for your app's data model.

#### Type declaration[​](https://docs.convex.dev/generated-api/server.html#type-declaration-2 "Direct link to Type declaration")

| Name | Type |
| --- | --- |
| `runQuery` | (`name`: `string`, `args`?: `Record<string, Value>`) => `Promise<Value>` |
| `runMutation` | (`name`: `string`, `args`?: `Record<string, Value>`) => `Promise<Value>` |
| `runAction` | (`name`: `string`, `args`?: `Record<string, Value>`) => `Promise<Value>` |
| `auth` | [`Auth`](https://docs.convex.dev/api/interfaces/server.Auth.html) |
| `scheduler` | [`Scheduler`](https://docs.convex.dev/api/interfaces/server.Scheduler.html) |
| `storage` | [`StorageActionWriter`](https://docs.convex.dev/api/interfaces/server.StorageActionWriter.html) |
| `vectorSearch` | (`tableName`: `string`, `indexName`: `string`, `query`: [`VectorSearchQuery`](https://docs.convex.dev/api/interfaces/server.VectorSearchQuery.html)) => `Promise<Array<{ _id: Id, _score: number }>>` |

---

### DatabaseReader[​](https://docs.convex.dev/generated-api/server.html#databasereader "Direct link to DatabaseReader")

An interface to read from the database within Convex query functions.

This is an alias of
[`GenericDatabaseReader`](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html) that is
typed for your app's data model.

---

### DatabaseWriter[​](https://docs.convex.dev/generated-api/server.html#databasewriter "Direct link to DatabaseWriter")

An interface to read from and write to the database within Convex mutation
functions.

This is an alias of
[`GenericDatabaseWriter`](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html) that is
typed for your app's data model.

[Previous

api.js](https://docs.convex.dev/generated-api/api.html)[Next

Deployment API](https://docs.convex.dev/deployment-api.html)

* [Functions](https://docs.convex.dev/generated-api/server.html#functions)
  + [query](https://docs.convex.dev/generated-api/server.html#query)
  + [internalQuery](https://docs.convex.dev/generated-api/server.html#internalquery)
  + [mutation](https://docs.convex.dev/generated-api/server.html#mutation)
  + [internalMutation](https://docs.convex.dev/generated-api/server.html#internalmutation)
  + [action](https://docs.convex.dev/generated-api/server.html#action)
  + [internalAction](https://docs.convex.dev/generated-api/server.html#internalaction)
  + [httpAction](https://docs.convex.dev/generated-api/server.html#httpaction)
* [Types](https://docs.convex.dev/generated-api/server.html#types)
  + [QueryCtx](https://docs.convex.dev/generated-api/server.html#queryctx)
  + [MutationCtx](https://docs.convex.dev/generated-api/server.html#mutationctx)
  + [ActionCtx](https://docs.convex.dev/generated-api/server.html#actionctx)
  + [DatabaseReader](https://docs.convex.dev/generated-api/server.html#databasereader)
  + [DatabaseWriter](https://docs.convex.dev/generated-api/server.html#databasewriter)
