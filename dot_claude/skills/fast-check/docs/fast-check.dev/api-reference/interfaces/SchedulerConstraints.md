---
title: "SchedulerConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/SchedulerConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [SchedulerConstraints](https://fast-check.dev/api-reference/interfaces/SchedulerConstraints.html)

# Interface SchedulerConstraints

Constraints to be applied on [scheduler](https://fast-check.dev/api-reference/functions/scheduler.html)

#### Remarks

Since 2.2.0

interface SchedulerConstraints {
    [act](https://fast-check.dev/api-reference/interfaces/SchedulerConstraints.html#act): (f: () => Promise<void>) => Promise<unknown>;
}

* Defined in [packages/fast-check/src/arbitrary/scheduler.ts:12](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/scheduler.ts#L12)

##### Index

### Properties

[act](https://fast-check.dev/api-reference/interfaces/SchedulerConstraints.html#act)

## Properties

### act

act: (f: () => Promise<void>) => Promise<unknown>

Ensure that all scheduled tasks will be executed in the right context (for instance it can be the `act` of React)

#### Remarks

Since 1.21.0

* Defined in [packages/fast-check/src/arbitrary/scheduler.ts:17](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/scheduler.ts#L17)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[act](https://fast-check.dev/api-reference/interfaces/SchedulerConstraints.html#act)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
