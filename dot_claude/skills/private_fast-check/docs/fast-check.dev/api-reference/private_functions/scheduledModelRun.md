---
title: "scheduledModelRun | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/scheduledModelRun"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [scheduledModelRun](https://fast-check.dev/api-reference/functions/scheduledModelRun.html)

# Function scheduledModelRun

* scheduledModelRun<
      [Model](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelrunmodel) extends object,
      [Real](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelrunreal),
      [CheckAsync](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelruncheckasync) extends boolean,
      [InitialModel](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelruninitialmodel) extends object,
  >(
      scheduler: [Scheduler](https://fast-check.dev/api-reference/interfaces/Scheduler.html),
      s:
          | [ModelRunSetup](https://fast-check.dev/api-reference/types/ModelRunSetup.html)<[InitialModel](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelruninitialmodel), [Real](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelrunreal)>
          | [ModelRunAsyncSetup](https://fast-check.dev/api-reference/types/ModelRunAsyncSetup.html)<[InitialModel](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelruninitialmodel), [Real](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelrunreal)>,
      cmds: Iterable<[AsyncCommand](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html)<[Model](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelrunmodel), [Real](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelrunreal), [CheckAsync](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelruncheckasync)>>,
  ): Promise<void>

  Run asynchronous and scheduled commands over a `Model` and the `Real` system

  Throw in case of inconsistency

  #### Type Parameters

  + Model extends object
  + Real
  + CheckAsync extends boolean
  + InitialModel extends object

  #### Parameters

  + scheduler: [Scheduler](https://fast-check.dev/api-reference/interfaces/Scheduler.html)

    Scheduler
  + s: [ModelRunSetup](https://fast-check.dev/api-reference/types/ModelRunSetup.html)<[InitialModel](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelruninitialmodel), [Real](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelrunreal)> | [ModelRunAsyncSetup](https://fast-check.dev/api-reference/types/ModelRunAsyncSetup.html)<[InitialModel](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelruninitialmodel), [Real](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelrunreal)>

    Initial state provider
  + cmds: Iterable<[AsyncCommand](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html)<[Model](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelrunmodel), [Real](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelrunreal), [CheckAsync](https://fast-check.dev/api-reference/functions/scheduledModelRun.html#scheduledmodelruncheckasync)>>

    Asynchronous commands to be executed

  #### Returns Promise<void>

  #### Remarks

  Since 1.24.0

  + Defined in [packages/fast-check/src/check/model/ModelRunner.ts:150](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/ModelRunner.ts#L150)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
