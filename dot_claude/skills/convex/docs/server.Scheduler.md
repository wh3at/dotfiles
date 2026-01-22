---
title: "Interface: Scheduler | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.Scheduler"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* Scheduler

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).Scheduler

An interface to schedule Convex functions.

You can schedule either mutations or actions. Mutations are guaranteed to execute
exactly once - they are automatically retried on transient errors and either execute
successfully or fail deterministically due to developer error in defining the
function. Actions execute at most once - they are not retried and might fail
due to transient errors.

Consider using an internalMutation or internalAction to enforce that
these functions cannot be called directly from a Convex client.

## Methods[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#methods "Direct link to Methods")

### runAfter[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#runafter "Direct link to runAfter")

▸ **runAfter**<`FuncRef`>(`delayMs`, `functionReference`, `...args`): `Promise`<[`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_scheduled_functions"`>>

Schedule a function to execute after a delay.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `FuncRef` | extends [`SchedulableFunctionReference`](https://docs.convex.dev/api/modules/server.html#schedulablefunctionreference) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `delayMs` | `number` | Delay in milliseconds. Must be non-negative. If the delay is zero, the scheduled function will be due to execute immediately after the scheduling one completes. |
| `functionReference` | `FuncRef` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the function to schedule. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`FuncRef`> | Arguments to call the scheduled functions with. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#returns "Direct link to Returns")

`Promise`<[`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_scheduled_functions"`>>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#defined-in "Direct link to Defined in")

[server/scheduler.ts:41](https://github.com/get-convex/convex-js/blob/main/src/server/scheduler.ts#L41)

---

### runAt[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#runat "Direct link to runAt")

▸ **runAt**<`FuncRef`>(`timestamp`, `functionReference`, `...args`): `Promise`<[`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_scheduled_functions"`>>

Schedule a function to execute at a given timestamp.

#### Type parameters[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `FuncRef` | extends [`SchedulableFunctionReference`](https://docs.convex.dev/api/modules/server.html#schedulablefunctionreference) |

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `timestamp` | `number` | `Date` | A Date or a timestamp (milliseconds since the epoch). If the timestamp is in the past, the scheduled function will be due to execute immediately after the scheduling one completes. The timestamp can't be more than five years in the past or more than five years in the future. |
| `functionReference` | `FuncRef` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the function to schedule. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`FuncRef`> | arguments to call the scheduled functions with. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#returns-1 "Direct link to Returns")

`Promise`<[`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_scheduled_functions"`>>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#defined-in-1 "Direct link to Defined in")

[server/scheduler.ts:58](https://github.com/get-convex/convex-js/blob/main/src/server/scheduler.ts#L58)

---

### cancel[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#cancel "Direct link to cancel")

▸ **cancel**(`id`): `Promise`<`void`>

Cancels a previously scheduled function if it has not started yet. If the
scheduled function is already in progress, it will continue running but
any new functions that it tries to schedule will be canceled.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#parameters-2 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `id` | [`GenericId`](https://docs.convex.dev/api/modules/values.html#genericid)<`"_scheduled_functions"`> |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#returns-2 "Direct link to Returns")

`Promise`<`void`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.Scheduler.html#defined-in-2 "Direct link to Defined in")

[server/scheduler.ts:71](https://github.com/get-convex/convex-js/blob/main/src/server/scheduler.ts#L71)

[Previous

QueryInitializer](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html)[Next

SearchFilterBuilder](https://docs.convex.dev/api/interfaces/server.SearchFilterBuilder.html)

* [Methods](https://docs.convex.dev/api/interfaces/server.Scheduler.html#methods)
  + [runAfter](https://docs.convex.dev/api/interfaces/server.Scheduler.html#runafter)
  + [runAt](https://docs.convex.dev/api/interfaces/server.Scheduler.html#runat)
  + [cancel](https://docs.convex.dev/api/interfaces/server.Scheduler.html#cancel)
