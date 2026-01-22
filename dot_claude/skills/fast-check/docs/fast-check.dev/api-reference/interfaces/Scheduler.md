---
title: "Scheduler | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/Scheduler"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [Scheduler](https://fast-check.dev/api-reference/interfaces/Scheduler.html)

# Interface Scheduler<TMetaData>

Instance able to reschedule the ordering of promises for a given app

#### Remarks

Since 1.20.0

interface Scheduler<[TMetaData](https://fast-check.dev/api-reference/interfaces/Scheduler.html#tmetadata) = unknown> {
    [report](https://fast-check.dev/api-reference/interfaces/Scheduler.html#report): () => [SchedulerReportItem](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html)<[TMetaData](https://fast-check.dev/api-reference/interfaces/Scheduler.html#tmetadata)>[];
    [schedule](https://fast-check.dev/api-reference/interfaces/Scheduler.html#schedule): <T>(
        task: Promise<T>,
        label?: string,
        metadata?: [TMetaData](https://fast-check.dev/api-reference/interfaces/Scheduler.html#tmetadata),
        customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html),
    ) => Promise<T>;
    [scheduleFunction](https://fast-check.dev/api-reference/interfaces/Scheduler.html#schedulefunction): <TArgs extends any[], T>(
        asyncFunction: (...args: TArgs) => Promise<T>,
        customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html),
    ) => (...args: TArgs) => Promise<T>;
    [waitAll](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitall): (customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html)) => Promise<void>;
    [waitFor](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitfor): <T>(
        unscheduledTask: Promise<T>,
        customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html),
    ) => Promise<T>;
    [waitIdle](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitidle): (customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html)) => Promise<void>;
    [waitNext](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitnext): (count: number, customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html)) => Promise<void>;
    [waitOne](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitone): (customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html)) => Promise<void>;
    [count](https://fast-check.dev/api-reference/interfaces/Scheduler.html#count-1)(): number;
    [scheduleSequence](https://fast-check.dev/api-reference/interfaces/Scheduler.html#schedulesequence-1)(
        sequenceBuilders: [SchedulerSequenceItem](https://fast-check.dev/api-reference/types/SchedulerSequenceItem.html)<[TMetaData](https://fast-check.dev/api-reference/interfaces/Scheduler.html#tmetadata)>[],
        customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html),
    ): {
        done: boolean;
        faulty: boolean;
        task: Promise<{ done: boolean; faulty: boolean }>;
    };
}

#### Type Parameters

* TMetaData = unknown

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:23](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L23)

##### Index

### Properties

[report](https://fast-check.dev/api-reference/interfaces/Scheduler.html#report)
[schedule](https://fast-check.dev/api-reference/interfaces/Scheduler.html#schedule)
[scheduleFunction](https://fast-check.dev/api-reference/interfaces/Scheduler.html#schedulefunction)
[waitAll](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitall)
[waitFor](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitfor)
[waitIdle](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitidle)
[waitNext](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitnext)
[waitOne](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitone)

### Methods

[count](https://fast-check.dev/api-reference/interfaces/Scheduler.html#count)
[scheduleSequence](https://fast-check.dev/api-reference/interfaces/Scheduler.html#schedulesequence)

## Properties

### report

report: () => [SchedulerReportItem](https://fast-check.dev/api-reference/interfaces/SchedulerReportItem.html)<[TMetaData](https://fast-check.dev/api-reference/interfaces/Scheduler.html#tmetadata)>[]

Produce an array containing all the scheduled tasks so far with their execution status.
If the task has been executed, it includes a string representation of the associated output or error produced by the task if any.

Tasks will be returned in the order they get executed by the scheduler.

#### Remarks

Since 1.25.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:131](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L131)

### schedule

schedule: <T>(
    task: Promise<T>,
    label?: string,
    metadata?: [TMetaData](https://fast-check.dev/api-reference/interfaces/Scheduler.html#tmetadata),
    customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html),
) => Promise<T>

Wrap a new task using the Scheduler

#### Remarks

Since 1.20.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:28](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L28)

### scheduleFunction

scheduleFunction: <TArgs extends any[], T>(
    asyncFunction: (...args: TArgs) => Promise<T>,
    customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html),
) => (...args: TArgs) => Promise<T>

Automatically wrap function output using the Scheduler

#### Remarks

Since 1.20.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:34](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L34)

### waitAll

waitAll: (customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html)) => Promise<void>

Wait all scheduled tasks,
including the ones that might be created by one of the resolved task

#### Remarks

Since 1.20.0

#### Deprecated

Use `waitIdle()` instead, it comes with a more predictable behavior awaiting all scheduled and reachable tasks to be completed

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:82](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L82)

### waitFor

waitFor: <T>(
    unscheduledTask: Promise<T>,
    customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html),
) => Promise<T>

Wait as many scheduled tasks as need to resolve the received Promise

Some tests frameworks like `supertest` are not triggering calls to subsequent queries in a synchronous way,
some are waiting an explicit call to `then` to trigger them (either synchronously or asynchronously)...
As a consequence, none of `waitOne` or `waitAll` cannot wait for them out-of-the-box.

This helper is responsible to wait as many scheduled tasks as needed (but the bare minimal) to get
`unscheduledTask` resolved. Once resolved it returns its output either success or failure.

Be aware that while this helper will wait eveything to be ready for `unscheduledTask` to resolve,
having uncontrolled tasks triggering stuff required for `unscheduledTask` might be a source a uncontrollable
and not reproducible randomness as those triggers cannot be handled and scheduled by fast-check.

#### Remarks

Since 2.24.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:121](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L121)

### waitIdle

waitIdle: (customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html)) => Promise<void>

Wait until the scheduler becomes idle: all scheduled and reachable tasks have completed.

It will include tasks scheduled by other tasks, recursively.

Note: Tasks triggered by uncontrolled sources (like `fetch` or external events) cannot be detected
or awaited and may lead to incomplete waits.

If you want to wait for a precise event to happen you should rather opt for `waitFor` or `waitNext`
given they offer you a more granular control on what you are exactly waiting for.

#### Remarks

Since 4.2.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:103](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L103)

### waitNext

waitNext: (count: number, customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html)) => Promise<void>

Wait and schedule exactly `count` scheduled tasks.

#### Remarks

Since 4.2.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:88](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L88)

### waitOne

waitOne: (customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html)) => Promise<void>

Wait one scheduled task to be executed

#### Throws

Whenever there is no task scheduled

#### Remarks

Since 1.20.0

#### Deprecated

Use `waitNext(1)` instead, it comes with a more predictable behavior

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:74](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L74)

## Methods

### count

* count(): number

  Count of pending scheduled tasks

  #### Returns number

  #### Remarks

  Since 1.20.0

  + Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:66](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L66)

### scheduleSequence

* scheduleSequence(
      sequenceBuilders: [SchedulerSequenceItem](https://fast-check.dev/api-reference/types/SchedulerSequenceItem.html)<[TMetaData](https://fast-check.dev/api-reference/interfaces/Scheduler.html#tmetadata)>[],
      customAct?: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html),
  ): {
      done: boolean;
      faulty: boolean;
      task: Promise<{ done: boolean; faulty: boolean }>;
  }

  Schedule a sequence of Promise to be executed sequencially.
  Items within the sequence might be interleaved by other scheduled operations.

  Please note that whenever an item from the sequence has started,
  the scheduler will wait until its end before moving to another scheduled task.

  A handle is returned by the function in order to monitor the state of the sequence.
  Sequence will be marked:

  + done if all the promises have been executed properly
  + faulty if one of the promises within the sequence throws

  #### Parameters

  + sequenceBuilders: [SchedulerSequenceItem](https://fast-check.dev/api-reference/types/SchedulerSequenceItem.html)<[TMetaData](https://fast-check.dev/api-reference/interfaces/Scheduler.html#tmetadata)>[]
  + `Optional`customAct: [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html)

  #### Returns {     done: boolean;     faulty: boolean;     task: Promise<{ done: boolean; faulty: boolean }>; }

  #### Remarks

  Since 1.20.0

  + Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:53](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L53)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[report](https://fast-check.dev/api-reference/interfaces/Scheduler.html#report)[schedule](https://fast-check.dev/api-reference/interfaces/Scheduler.html#schedule)[scheduleFunction](https://fast-check.dev/api-reference/interfaces/Scheduler.html#schedulefunction)[waitAll](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitall)[waitFor](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitfor)[waitIdle](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitidle)[waitNext](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitnext)[waitOne](https://fast-check.dev/api-reference/interfaces/Scheduler.html#waitone)

Methods

[count](https://fast-check.dev/api-reference/interfaces/Scheduler.html#count)[scheduleSequence](https://fast-check.dev/api-reference/interfaces/Scheduler.html#schedulesequence)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
