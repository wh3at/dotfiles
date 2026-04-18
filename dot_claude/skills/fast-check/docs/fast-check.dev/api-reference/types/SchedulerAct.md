---
title: "SchedulerAct | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/SchedulerAct"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [SchedulerAct](https://fast-check.dev/api-reference/types/SchedulerAct.html)

# Type Alias SchedulerAct

SchedulerAct: (f: () => Promise<void>) => Promise<void>

Function responsible to run the passed function and surround it with whatever needed.
The name has been inspired from the `act` function coming with React.

This wrapper function is not supposed to throw. The received function f will never throw.

Wrapping order in the following:

* global act defined on `fc.scheduler` wraps wait level one
* wait act defined on `s.waitX` wraps local one
* local act defined on `s.scheduleX(...)` wraps the trigger function

#### Type Declaration

* + (f: () => Promise<void>): Promise<void>
  + #### Parameters

    - f: () => Promise<void>

    #### Returns Promise<void>

#### Remarks

Since 3.9.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/Scheduler.ts:16](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/Scheduler.ts#L16)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
