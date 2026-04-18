---
title: "Interface: GenericQueryCtx<DataModel> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.GenericQueryCtx"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* GenericQueryCtx

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).GenericQueryCtx

A set of services for use within Convex query functions.

The query context is passed as the first argument to any Convex query
function run on the server.

This differs from the MutationCtx because all of the services are
read-only.

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `DataModel` | extends [`GenericDataModel`](https://docs.convex.dev/api/modules/server.html#genericdatamodel) |

## Properties[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#properties "Direct link to Properties")

### db[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#db "Direct link to db")

• **db**: [`GenericDatabaseReader`](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html)<`DataModel`>

A utility for reading data in the database.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#defined-in "Direct link to Defined in")

[server/registration.ts:130](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L130)

---

### auth[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#auth "Direct link to auth")

• **auth**: [`Auth`](https://docs.convex.dev/api/interfaces/server.Auth.html)

Information about the currently authenticated user.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#defined-in-1 "Direct link to Defined in")

[server/registration.ts:135](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L135)

---

### storage[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#storage "Direct link to storage")

• **storage**: [`StorageReader`](https://docs.convex.dev/api/interfaces/server.StorageReader.html)

A utility for reading files in storage.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#defined-in-2 "Direct link to Defined in")

[server/registration.ts:140](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L140)

---

### runQuery[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#runquery "Direct link to runQuery")

• **runQuery**: <Query>(`query`: `Query`, ...`args`: [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Query`>) => `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

#### Type declaration[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#type-declaration "Direct link to Type declaration")

▸ <`Query`>(`query`, `...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

Call a query function within the same transaction.

NOTE: often you can call the query's function directly instead of using this.
`runQuery` incurs overhead of running argument and return value validation,
and creating a new isolated JS context.

##### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`, `"public"` | `"internal"`> |

##### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `query` | `Query` |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Query`> |

##### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#returns "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#defined-in-3 "Direct link to Defined in")

[server/registration.ts:149](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L149)

[Previous

GenericMutationCtx](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html)[Next

IndexRangeBuilder](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#type-parameters)
* [Properties](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#properties)
  + [db](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#db)
  + [auth](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#auth)
  + [storage](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#storage)
  + [runQuery](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html#runquery)
