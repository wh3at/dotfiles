---
title: "asyncModelRun | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/asyncModelRun"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [asyncModelRun](https://fast-check.dev/api-reference/functions/asyncModelRun.html)

# Function asyncModelRun

* asyncModelRun<
      [Model](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelrunmodel) extends object,
      [Real](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelrunreal),
      [CheckAsync](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelruncheckasync) extends boolean,
      [InitialModel](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelruninitialmodel) extends object,
  >(
      s:
          | [ModelRunSetup](https://fast-check.dev/api-reference/types/ModelRunSetup.html)<[InitialModel](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelruninitialmodel), [Real](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelrunreal)>
          | [ModelRunAsyncSetup](https://fast-check.dev/api-reference/types/ModelRunAsyncSetup.html)<[InitialModel](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelruninitialmodel), [Real](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelrunreal)>,
      cmds: Iterable<[AsyncCommand](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html)<[Model](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelrunmodel), [Real](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelrunreal), [CheckAsync](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelruncheckasync)>>,
  ): Promise<void>

  Run asynchronous commands over a `Model` and the `Real` system

  Throw in case of inconsistency

  #### Type Parameters

  + Model extends object
  + Real
  + CheckAsync extends boolean
  + InitialModel extends object

  #### Parameters

  + s: [ModelRunSetup](https://fast-check.dev/api-reference/types/ModelRunSetup.html)<[InitialModel](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelruninitialmodel), [Real](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelrunreal)> | [ModelRunAsyncSetup](https://fast-check.dev/api-reference/types/ModelRunAsyncSetup.html)<[InitialModel](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelruninitialmodel), [Real](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelrunreal)>

    Initial state provider
  + cmds: Iterable<[AsyncCommand](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html)<[Model](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelrunmodel), [Real](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelrunreal), [CheckAsync](https://fast-check.dev/api-reference/functions/asyncModelRun.html#asyncmodelruncheckasync)>>

    Asynchronous commands to be executed

  #### Returns Promise<void>

  #### Remarks

  Since 1.5.0

  + Defined in [packages/fast-check/src/check/model/ModelRunner.ts:131](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/ModelRunner.ts#L131)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
