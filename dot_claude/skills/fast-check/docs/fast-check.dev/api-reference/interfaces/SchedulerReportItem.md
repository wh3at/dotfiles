---
title: "SchedulerReportItem | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/SchedulerReportItem"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [SchedulerReportItem](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html)

# Interface SchedulerReportItem<TMetaData>

Describe a task for the report produced by the scheduler

#### Remarks

Since 1.25.0

interface SchedulerReportItem<[TMetaData](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#tmetadata) = unknown> {
    [label](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#label): string;
    [metadata](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#metadata)?: [TMetaData](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#tmetadata);
    [outputValue](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#outputvalue)?: string;
    [schedulingType](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#schedulingtype): "function" | "promise" | "sequence";
    [status](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#status): "rejected" | "pending" | "resolved";
    [taskId](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#taskid): number;
}

#### Type Parameters

* TMetaData = unknown

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:164](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L164)

##### Index

### Properties

[label](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#label)
[metadata?](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#metadata)
[outputValue?](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#outputvalue)
[schedulingType](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#schedulingtype)
[status](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#status)
[taskId](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#taskid)

## Properties

### label

label: string

Label of the task

#### Remarks

Since 1.25.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:192](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L192)

### `Optional`metadata

metadata?: [TMetaData](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#tmetadata)

Metadata linked when scheduling the task

#### Remarks

Since 1.25.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:197](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L197)

### `Optional`outputValue

outputValue?: string

Stringified version of the output or error computed using fc.stringify

#### Remarks

Since 1.25.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:202](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L202)

### schedulingType

schedulingType: "function" | "promise" | "sequence"

How was this task scheduled?

* promise: schedule
* function: scheduleFunction
* sequence: scheduleSequence

#### Remarks

Since 1.25.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:182](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L182)

### status

status: "rejected" | "pending" | "resolved"

Execution status for this task

* resolved: task released by the scheduler and successful
* rejected: task released by the scheduler but with errors
* pending: task still pending in the scheduler, not released yet

#### Remarks

Since 1.25.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:173](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L173)

### taskId

taskId: number

Incremental id for the task, first received task has taskId = 1

#### Remarks

Since 1.25.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:187](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L187)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[label](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#label)[metadata](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#metadata)[outputValue](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#outputvalue)[schedulingType](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#schedulingtype)[status](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#status)[taskId](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html#taskid)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
