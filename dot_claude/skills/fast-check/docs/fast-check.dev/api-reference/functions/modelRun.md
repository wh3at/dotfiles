---
title: "modelRun | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/modelRun"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [modelRun](https://fast-check.dev/api-reference/functions/modelRun.html)

# Function modelRun

* modelRun<[Model](https://fast-check.dev/api-reference/functions/modelRun.html#modelrunmodel) extends object, [Real](https://fast-check.dev/api-reference/functions/modelRun.html#modelrunreal), [InitialModel](https://fast-check.dev/api-reference/functions/modelRun.html#modelruninitialmodel) extends object>(
      s: [ModelRunSetup](https://fast-check.dev/api-reference/types/ModelRunSetup.html)<[InitialModel](https://fast-check.dev/api-reference/functions/modelRun.html#modelruninitialmodel), [Real](https://fast-check.dev/api-reference/functions/modelRun.html#modelrunreal)>,
      cmds: Iterable<[Command](https://fast-check.dev/api-reference/interfaces/Command.html)<[Model](https://fast-check.dev/api-reference/functions/modelRun.html#modelrunmodel), [Real](https://fast-check.dev/api-reference/functions/modelRun.html#modelrunreal)>>,
  ): void

  Run synchronous commands over a `Model` and the `Real` system

  Throw in case of inconsistency

  #### Type Parameters

  + Model extends object
  + Real
  + InitialModel extends object

  #### Parameters

  + s: [ModelRunSetup](https://fast-check.dev/api-reference/types/ModelRunSetup.html)<[InitialModel](https://fast-check.dev/api-reference/functions/modelRun.html#modelruninitialmodel), [Real](https://fast-check.dev/api-reference/functions/modelRun.html#modelrunreal)>

    Initial state provider
  + cmds: Iterable<[Command](https://fast-check.dev/api-reference/interfaces/Command.html)<[Model](https://fast-check.dev/api-reference/functions/modelRun.html#modelrunmodel), [Real](https://fast-check.dev/api-reference/functions/modelRun.html#modelrunreal)>>

    Synchronous commands to be executed

  #### Returns void

  #### Remarks

  Since 1.5.0

  + Defined in [packages/fast-check/src/check/model/ModelRunner.ts:113](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/ModelRunner.ts#L113)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
