---
title: "SchedulerSequenceItem | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/SchedulerSequenceItem"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [SchedulerSequenceItem](https://fast-check.dev/api-reference/types/SchedulerSequenceItem.html)

# Type Alias SchedulerSequenceItem<TMetaData>

SchedulerSequenceItem:
    | { builder: () => Promise<any>; label: string; metadata?: [TMetaData](https://fast-check.dev/api-reference/types/SchedulerSequenceItem.html#tmetadata) }
    | (() => Promise<any>)

Define an item to be passed to `scheduleSequence`

#### Type Parameters

* TMetaData = unknown

#### Type Declaration

* { builder: () => Promise<any>; label: string; metadata?: [TMetaData](https://fast-check.dev/api-reference/types/SchedulerSequenceItem.html#tmetadata) }
  + ##### builder: () => Promise<any>

    Builder to start the task

    #### Remarks

    Since 1.20.0
  + ##### label: string

    Label

    #### Remarks

    Since 1.20.0
  + ##### `Optional`metadata?: [TMetaData](https://fast-check.dev/api-reference/types/SchedulerSequenceItem.html#tmetadata)

    Metadata to be attached into logs

    #### Remarks

    Since 1.25.0
* () => Promise<any>

#### Remarks

Since 1.20.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:139](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L139)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
