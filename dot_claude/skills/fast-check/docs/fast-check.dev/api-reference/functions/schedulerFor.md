---
title: "schedulerFor | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/schedulerFor"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [schedulerFor](https://fast-check.dev/api-reference/functions/schedulerFor.html)

# Function schedulerFor

* schedulerFor<[TMetaData](https://fast-check.dev/api-reference/functions/schedulerFor.html#schedulerfortmetadata) = unknown>(
      constraints?: [SchedulerConstraints](https://fast-check.dev/api-reference/interfaces/SchedulerConstraints.html),
  ): (
      \_strs: TemplateStringsArray,
      ...ordering: number[],
  ) => [Scheduler](https://fast-check.dev/api-reference/interfaces/Scheduler.html)<[TMetaData](https://fast-check.dev/api-reference/functions/schedulerFor.html#schedulerfortmetadata)>

  For custom scheduler with predefined resolution order

  Ordering is defined by using a template string like the one generated in case of failure of a [scheduler](https://fast-check.dev/api-reference/functions/scheduler.html)

  It may be something like:

  #### Type Parameters

  + TMetaData = unknown

  #### Parameters

  + `Optional`constraints: [SchedulerConstraints](https://fast-check.dev/api-reference/interfaces/SchedulerConstraints.html)

  #### Returns (\_strs: TemplateStringsArray, ...ordering: number[]) => [Scheduler](https://fast-check.dev/api-reference/interfaces/Scheduler.html)<[TMetaData](https://fast-check.dev/api-reference/functions/schedulerFor.html#schedulerfortmetadata)>

  #### Example

  ```
  fc.schedulerFor()`
    -> [task\${2}] promise pending
    -> [task\${3}] promise pending
    -> [task\${1}] promise pending
  `
  Copy
  ```

  Or more generally:

  ```
  fc.schedulerFor()`
    This scheduler will resolve task ${2} first
    followed by ${3} and only then task ${1}
  `
  Copy
  ```

  WARNING:
  Custom scheduler will
  neither check that all the referred promises have been scheduled
  nor that they resolved with the same status and value.

  WARNING:
  If one the promises is wrongly defined it will fail - for instance asking to resolve 5 while 5 does not exist.

  #### Remarks

  Since 1.25.0

  + Defined in [packages/fast-check/src/arbitrary/scheduler.ts:66](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/scheduler.ts#L66)
* schedulerFor<[TMetaData](https://fast-check.dev/api-reference/functions/schedulerFor.html#schedulerfortmetadata-1) = unknown>(
      customOrdering: number[],
      constraints?: [SchedulerConstraints](https://fast-check.dev/api-reference/interfaces/SchedulerConstraints.html),
  ): [Scheduler](https://fast-check.dev/api-reference/interfaces/Scheduler.html)<[TMetaData](https://fast-check.dev/api-reference/functions/schedulerFor.html#schedulerfortmetadata-1)>

  For custom scheduler with predefined resolution order

  WARNING:
  Custom scheduler will not check that all the referred promises have been scheduled.

  WARNING:
  If one the promises is wrongly defined it will fail - for instance asking to resolve 5 while 5 does not exist.

  #### Type Parameters

  + TMetaData = unknown

  #### Parameters

  + customOrdering: number[]

    Array defining in which order the promises will be resolved.
    Id of the promises start at 1. 1 means first scheduled promise, 2 second scheduled promise and so on.
  + `Optional`constraints: [SchedulerConstraints](https://fast-check.dev/api-reference/interfaces/SchedulerConstraints.html)

  #### Returns [Scheduler](https://fast-check.dev/api-reference/interfaces/Scheduler.html)<[TMetaData](https://fast-check.dev/api-reference/functions/schedulerFor.html#schedulerfortmetadata-1)>

  #### Remarks

  Since 1.25.0

  + Defined in [packages/fast-check/src/arbitrary/scheduler.ts:85](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/scheduler.ts#L85)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
