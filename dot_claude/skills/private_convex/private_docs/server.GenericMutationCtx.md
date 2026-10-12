---
title: "Interface: GenericMutationCtx<DataModel> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.GenericMutationCtx"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* GenericMutationCtx

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).GenericMutationCtx

A set of services for use within Convex mutation functions.

The mutation context is passed as the first argument to any Convex mutation
function run on the server.

If you're using code generation, use the `MutationCtx` type in
`convex/_generated/server.d.ts` which is typed for your data model.

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `DataModel` | extends [`GenericDataModel`](https://docs.convex.dev/api/modules/server.html#genericdatamodel) |

## Properties[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#properties "Direct link to Properties")

### db[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#db "Direct link to db")

• **db**: [`GenericDatabaseWriter`](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html)<`DataModel`>

A utility for reading and writing data in the database.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#defined-in "Direct link to Defined in")

[server/registration.ts:50](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L50)

---

### auth[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#auth "Direct link to auth")

• **auth**: [`Auth`](https://docs.convex.dev/api/interfaces/server.Auth.html)

Information about the currently authenticated user.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#defined-in-1 "Direct link to Defined in")

[server/registration.ts:55](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L55)

---

### storage[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#storage "Direct link to storage")

• **storage**: [`StorageWriter`](https://docs.convex.dev/api/interfaces/server.StorageWriter.html)

A utility for reading and writing files in storage.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#defined-in-2 "Direct link to Defined in")

[server/registration.ts:60](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L60)

---

### scheduler[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#scheduler "Direct link to scheduler")

• **scheduler**: [`Scheduler`](https://docs.convex.dev/api/interfaces/server.Scheduler.html)

A utility for scheduling Convex functions to run in the future.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#defined-in-3 "Direct link to Defined in")

[server/registration.ts:65](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L65)

---

### runQuery[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#runquery "Direct link to runQuery")

• **runQuery**: <Query>(`query`: `Query`, ...`args`: [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Query`>) => `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

#### Type declaration[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#type-declaration "Direct link to Type declaration")

▸ <`Query`>(`query`, `...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

Call a query function within the same transaction.

NOTE: often you can call the query's function directly instead of using this.
`runQuery` incurs overhead of running argument and return value validation,
and creating a new isolated JS context.

##### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Query` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"query"`, `"public"` | `"internal"`> |

##### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `query` | `Query` |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Query`> |

##### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#returns "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Query`>>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#defined-in-4 "Direct link to Defined in")

[server/registration.ts:74](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L74)

---

### runMutation[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#runmutation "Direct link to runMutation")

• **runMutation**: <Mutation>(`mutation`: `Mutation`, ...`args`: [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Mutation`>) => `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Mutation`>>

#### Type declaration[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#type-declaration-1 "Direct link to Type declaration")

▸ <`Mutation`>(`mutation`, `...args`): `Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Mutation`>>

Call a mutation function within the same transaction.

NOTE: often you can call the mutation's function directly instead of using this.
`runMutation` incurs overhead of running argument and return value validation,
and creating a new isolated JS context.

The mutation runs in a sub-transaction, so if the mutation throws an error,
all of its writes will be rolled back. Additionally, a successful mutation's
writes will be serializable with other writes in the transaction.

##### Type parameters[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `Mutation` | extends [`FunctionReference`](https://docs.convex.dev/api/modules/server.html#functionreference)<`"mutation"`, `"public"` | `"internal"`> |

##### Parameters[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#parameters-1 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `mutation` | `Mutation` |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`Mutation`> |

##### Returns[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#returns-1 "Direct link to Returns")

`Promise`<[`FunctionReturnType`](https://docs.convex.dev/api/modules/server.html#functionreturntype)<`Mutation`>>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#defined-in-5 "Direct link to Defined in")

[server/registration.ts:90](https://github.com/get-convex/convex-js/blob/main/src/server/registration.ts#L90)

[Previous

GenericDatabaseWriterWithTable](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriterWithTable.html)[Next

GenericQueryCtx](https://docs.convex.dev/api/interfaces/server.GenericQueryCtx.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#type-parameters)
* [Properties](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#properties)
  + [db](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#db)
  + [auth](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#auth)
  + [storage](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#storage)
  + [scheduler](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#scheduler)
  + [runQuery](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#runquery)
  + [runMutation](https://docs.convex.dev/api/interfaces/server.GenericMutationCtx.html#runmutation)
