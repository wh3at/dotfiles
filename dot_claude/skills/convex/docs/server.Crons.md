---
title: "Class: Crons | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/server.Crons"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* Crons

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).Crons

A class for scheduling cron jobs.

To learn more see the documentation at [https://docs.convex.dev/scheduling/cron-jobs](https://docs.convex.dev/scheduling/cron-jobs.html)

## Constructors[​](https://docs.convex.dev/api/classes/server.Crons.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/server.Crons.html#constructor "Direct link to constructor")

• **new Crons**()

#### Defined in[​](https://docs.convex.dev/api/classes/server.Crons.html#defined-in "Direct link to Defined in")

[server/cron.ts:246](https://github.com/get-convex/convex-js/blob/main/src/server/cron.ts#L246)

## Properties[​](https://docs.convex.dev/api/classes/server.Crons.html#properties "Direct link to Properties")

### crons[​](https://docs.convex.dev/api/classes/server.Crons.html#crons "Direct link to crons")

• **crons**: `Record`<`string`, [`CronJob`](https://docs.convex.dev/api/interfaces/server.CronJob.html)>

#### Defined in[​](https://docs.convex.dev/api/classes/server.Crons.html#defined-in-1 "Direct link to Defined in")

[server/cron.ts:244](https://github.com/get-convex/convex-js/blob/main/src/server/cron.ts#L244)

---

### isCrons[​](https://docs.convex.dev/api/classes/server.Crons.html#iscrons "Direct link to isCrons")

• **isCrons**: `true`

#### Defined in[​](https://docs.convex.dev/api/classes/server.Crons.html#defined-in-2 "Direct link to Defined in")

[server/cron.ts:245](https://github.com/get-convex/convex-js/blob/main/src/server/cron.ts#L245)

## Methods[​](https://docs.convex.dev/api/classes/server.Crons.html#methods "Direct link to Methods")

### interval[​](https://docs.convex.dev/api/classes/server.Crons.html#interval "Direct link to interval")

▸ **interval**<`FuncRef`>(`cronIdentifier`, `schedule`, `functionReference`, `...args`): `void`

Schedule a mutation or action to run at some interval.

```
crons.interval("Clear presence data", {seconds: 30}, api.presence.clear);
```

#### Type parameters[​](https://docs.convex.dev/api/classes/server.Crons.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `FuncRef` | extends [`SchedulableFunctionReference`](https://docs.convex.dev/api/modules/server.html#schedulablefunctionreference) |

#### Parameters[​](https://docs.convex.dev/api/classes/server.Crons.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `cronIdentifier` | `string` | - |
| `schedule` | `Interval` | The time between runs for this scheduled job. |
| `functionReference` | `FuncRef` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the function to schedule. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`FuncRef`> | The arguments to the function. |

#### Returns[​](https://docs.convex.dev/api/classes/server.Crons.html#returns "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/server.Crons.html#defined-in-3 "Direct link to Defined in")

[server/cron.ts:283](https://github.com/get-convex/convex-js/blob/main/src/server/cron.ts#L283)

---

### hourly[​](https://docs.convex.dev/api/classes/server.Crons.html#hourly "Direct link to hourly")

▸ **hourly**<`FuncRef`>(`cronIdentifier`, `schedule`, `functionReference`, `...args`): `void`

Schedule a mutation or action to run on an hourly basis.

```
crons.hourly(
  "Reset high scores",
  {
    minuteUTC: 30,
  },
  api.scores.reset
)
```

#### Type parameters[​](https://docs.convex.dev/api/classes/server.Crons.html#type-parameters-1 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `FuncRef` | extends [`SchedulableFunctionReference`](https://docs.convex.dev/api/modules/server.html#schedulablefunctionreference) |

#### Parameters[​](https://docs.convex.dev/api/classes/server.Crons.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `cronIdentifier` | `string` | A unique name for this scheduled job. |
| `schedule` | `Hourly` | What time (UTC) each day to run this function. |
| `functionReference` | `FuncRef` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the function to schedule. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`FuncRef`> | The arguments to the function. |

#### Returns[​](https://docs.convex.dev/api/classes/server.Crons.html#returns-1 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/server.Crons.html#defined-in-4 "Direct link to Defined in")

[server/cron.ts:331](https://github.com/get-convex/convex-js/blob/main/src/server/cron.ts#L331)

---

### daily[​](https://docs.convex.dev/api/classes/server.Crons.html#daily "Direct link to daily")

▸ **daily**<`FuncRef`>(`cronIdentifier`, `schedule`, `functionReference`, `...args`): `void`

Schedule a mutation or action to run on a daily basis.

```
crons.daily(
  "Reset high scores",
  {
    hourUTC: 17, // (9:30am Pacific/10:30am Daylight Savings Pacific)
    minuteUTC: 30,
  },
  api.scores.reset
)
```

#### Type parameters[​](https://docs.convex.dev/api/classes/server.Crons.html#type-parameters-2 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `FuncRef` | extends [`SchedulableFunctionReference`](https://docs.convex.dev/api/modules/server.html#schedulablefunctionreference) |

#### Parameters[​](https://docs.convex.dev/api/classes/server.Crons.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `cronIdentifier` | `string` | A unique name for this scheduled job. |
| `schedule` | `Daily` | What time (UTC) each day to run this function. |
| `functionReference` | `FuncRef` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the function to schedule. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`FuncRef`> | The arguments to the function. |

#### Returns[​](https://docs.convex.dev/api/classes/server.Crons.html#returns-2 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/server.Crons.html#defined-in-5 "Direct link to Defined in")

[server/cron.ts:366](https://github.com/get-convex/convex-js/blob/main/src/server/cron.ts#L366)

---

### weekly[​](https://docs.convex.dev/api/classes/server.Crons.html#weekly "Direct link to weekly")

▸ **weekly**<`FuncRef`>(`cronIdentifier`, `schedule`, `functionReference`, `...args`): `void`

Schedule a mutation or action to run on a weekly basis.

```
crons.weekly(
  "Weekly re-engagement email",
  {
    dayOfWeek: "Tuesday",
    hourUTC: 17, // (9:30am Pacific/10:30am Daylight Savings Pacific)
    minuteUTC: 30,
  },
  api.emails.send
)
```

#### Type parameters[​](https://docs.convex.dev/api/classes/server.Crons.html#type-parameters-3 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `FuncRef` | extends [`SchedulableFunctionReference`](https://docs.convex.dev/api/modules/server.html#schedulablefunctionreference) |

#### Parameters[​](https://docs.convex.dev/api/classes/server.Crons.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `cronIdentifier` | `string` | A unique name for this scheduled job. |
| `schedule` | `Weekly` | What day and time (UTC) each week to run this function. |
| `functionReference` | `FuncRef` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the function to schedule. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`FuncRef`> | - |

#### Returns[​](https://docs.convex.dev/api/classes/server.Crons.html#returns-3 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/server.Crons.html#defined-in-6 "Direct link to Defined in")

[server/cron.ts:402](https://github.com/get-convex/convex-js/blob/main/src/server/cron.ts#L402)

---

### monthly[​](https://docs.convex.dev/api/classes/server.Crons.html#monthly "Direct link to monthly")

▸ **monthly**<`FuncRef`>(`cronIdentifier`, `schedule`, `functionReference`, `...args`): `void`

Schedule a mutation or action to run on a monthly basis.

Note that some months have fewer days than others, so e.g. a function
scheduled to run on the 30th will not run in February.

```
crons.monthly(
  "Bill customers at ",
  {
    hourUTC: 17, // (9:30am Pacific/10:30am Daylight Savings Pacific)
    minuteUTC: 30,
    day: 1,
  },
  api.billing.billCustomers
)
```

#### Type parameters[​](https://docs.convex.dev/api/classes/server.Crons.html#type-parameters-4 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `FuncRef` | extends [`SchedulableFunctionReference`](https://docs.convex.dev/api/modules/server.html#schedulablefunctionreference) |

#### Parameters[​](https://docs.convex.dev/api/classes/server.Crons.html#parameters-4 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `cronIdentifier` | `string` | A unique name for this scheduled job. |
| `schedule` | `Monthly` | What day and time (UTC) each month to run this function. |
| `functionReference` | `FuncRef` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the function to schedule. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`FuncRef`> | The arguments to the function. |

#### Returns[​](https://docs.convex.dev/api/classes/server.Crons.html#returns-4 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/server.Crons.html#defined-in-7 "Direct link to Defined in")

[server/cron.ts:443](https://github.com/get-convex/convex-js/blob/main/src/server/cron.ts#L443)

---

### cron[​](https://docs.convex.dev/api/classes/server.Crons.html#cron "Direct link to cron")

▸ **cron**<`FuncRef`>(`cronIdentifier`, `cron`, `functionReference`, `...args`): `void`

Schedule a mutation or action to run on a recurring basis.

Like the unix command `cron`, Sunday is 0, Monday is 1, etc.

```
 ┌─ minute (0 - 59)
 │ ┌─ hour (0 - 23)
 │ │ ┌─ day of the month (1 - 31)
 │ │ │ ┌─ month (1 - 12)
 │ │ │ │ ┌─ day of the week (0 - 6) (Sunday to Saturday)
"* * * * *"
```

#### Type parameters[​](https://docs.convex.dev/api/classes/server.Crons.html#type-parameters-5 "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `FuncRef` | extends [`SchedulableFunctionReference`](https://docs.convex.dev/api/modules/server.html#schedulablefunctionreference) |

#### Parameters[​](https://docs.convex.dev/api/classes/server.Crons.html#parameters-5 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `cronIdentifier` | `string` | A unique name for this scheduled job. |
| `cron` | `string` | Cron string like `"15 7 * * *"` (Every day at 7:15 UTC) |
| `functionReference` | `FuncRef` | A [FunctionReference](https://docs.convex.dev/api/modules/server.html#functionreference) for the function to schedule. |
| `...args` | [`OptionalRestArgs`](https://docs.convex.dev/api/modules/server.html#optionalrestargs)<`FuncRef`> | The arguments to the function. |

#### Returns[​](https://docs.convex.dev/api/classes/server.Crons.html#returns-5 "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/server.Crons.html#defined-in-8 "Direct link to Defined in")

[server/cron.ts:480](https://github.com/get-convex/convex-js/blob/main/src/server/cron.ts#L480)

[Previous

Module: server](https://docs.convex.dev/api/modules/server.html)[Next

Expression](https://docs.convex.dev/api/classes/server.Expression.html)

* [Constructors](https://docs.convex.dev/api/classes/server.Crons.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/server.Crons.html#constructor)
* [Properties](https://docs.convex.dev/api/classes/server.Crons.html#properties)
  + [crons](https://docs.convex.dev/api/classes/server.Crons.html#crons)
  + [isCrons](https://docs.convex.dev/api/classes/server.Crons.html#iscrons)
* [Methods](https://docs.convex.dev/api/classes/server.Crons.html#methods)
  + [interval](https://docs.convex.dev/api/classes/server.Crons.html#interval)
  + [hourly](https://docs.convex.dev/api/classes/server.Crons.html#hourly)
  + [daily](https://docs.convex.dev/api/classes/server.Crons.html#daily)
  + [weekly](https://docs.convex.dev/api/classes/server.Crons.html#weekly)
  + [monthly](https://docs.convex.dev/api/classes/server.Crons.html#monthly)
  + [cron](https://docs.convex.dev/api/classes/server.Crons.html#cron)
