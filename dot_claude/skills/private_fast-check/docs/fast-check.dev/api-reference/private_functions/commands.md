---
title: "commands | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/commands"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [commands](https://fast-check.dev/api-reference/functions/commands.html)

# Function commands

* commands<[Model](https://fast-check.dev/api-reference/functions/commands.html#commandsmodel) extends object, [Real](https://fast-check.dev/api-reference/functions/commands.html#commandsreal), [CheckAsync](https://fast-check.dev/api-reference/functions/commands.html#commandscheckasync) extends boolean>(
      commandArbs: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[AsyncCommand](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html)<[Model](https://fast-check.dev/api-reference/functions/commands.html#commandsmodel), [Real](https://fast-check.dev/api-reference/functions/commands.html#commandsreal), [CheckAsync](https://fast-check.dev/api-reference/functions/commands.html#commandscheckasync)>>[],
      constraints?: [CommandsContraints](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html),
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Iterable<[AsyncCommand](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html)<[Model](https://fast-check.dev/api-reference/functions/commands.html#commandsmodel), [Real](https://fast-check.dev/api-reference/functions/commands.html#commandsreal), [CheckAsync](https://fast-check.dev/api-reference/functions/commands.html#commandscheckasync)>, any, any>>

  For arrays of [AsyncCommand](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html) to be executed by [asyncModelRun](https://fast-check.dev/api-reference/functions/asyncModelRun.html)

  This implementation comes with a shrinker adapted for commands.
  It should shrink more efficiently than [array](https://fast-check.dev/api-reference/functions/array.html) for [AsyncCommand](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html) arrays.

  #### Type Parameters

  + Model extends object
  + Real
  + CheckAsync extends boolean

  #### Parameters

  + commandArbs: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[AsyncCommand](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html)<[Model](https://fast-check.dev/api-reference/functions/commands.html#commandsmodel), [Real](https://fast-check.dev/api-reference/functions/commands.html#commandsreal), [CheckAsync](https://fast-check.dev/api-reference/functions/commands.html#commandscheckasync)>>[]

    Arbitraries responsible to build commands
  + `Optional`constraints: [CommandsContraints](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html)

    Constraints to be applied when generating the commands (since 1.11.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Iterable<[AsyncCommand](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html)<[Model](https://fast-check.dev/api-reference/functions/commands.html#commandsmodel), [Real](https://fast-check.dev/api-reference/functions/commands.html#commandsreal), [CheckAsync](https://fast-check.dev/api-reference/functions/commands.html#commandscheckasync)>, any, any>>

  #### Remarks

  Since 1.5.0

  + Defined in [packages/fast-check/src/arbitrary/commands.ts:24](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/commands.ts#L24)
* commands<[Model](https://fast-check.dev/api-reference/functions/commands.html#commandsmodel-1) extends object, [Real](https://fast-check.dev/api-reference/functions/commands.html#commandsreal-1)>(
      commandArbs: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Command](https://fast-check.dev/api-reference/interfaces/Command.html)<[Model](https://fast-check.dev/api-reference/functions/commands.html#commandsmodel-1), [Real](https://fast-check.dev/api-reference/functions/commands.html#commandsreal-1)>>[],
      constraints?: [CommandsContraints](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html),
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Iterable<[Command](https://fast-check.dev/api-reference/interfaces/Command.html)<[Model](https://fast-check.dev/api-reference/functions/commands.html#commandsmodel-1), [Real](https://fast-check.dev/api-reference/functions/commands.html#commandsreal-1)>, any, any>>

  For arrays of [Command](https://fast-check.dev/api-reference/interfaces/Command.html) to be executed by [modelRun](https://fast-check.dev/api-reference/functions/modelRun.html)

  This implementation comes with a shrinker adapted for commands.
  It should shrink more efficiently than [array](https://fast-check.dev/api-reference/functions/array.html) for [Command](https://fast-check.dev/api-reference/interfaces/Command.html) arrays.

  #### Type Parameters

  + Model extends object
  + Real

  #### Parameters

  + commandArbs: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Command](https://fast-check.dev/api-reference/interfaces/Command.html)<[Model](https://fast-check.dev/api-reference/functions/commands.html#commandsmodel-1), [Real](https://fast-check.dev/api-reference/functions/commands.html#commandsreal-1)>>[]

    Arbitraries responsible to build commands
  + `Optional`constraints: [CommandsContraints](https://fast-check.dev/api-reference/interfaces/CommandsContraints.html)

    Constraints to be applied when generating the commands (since 1.11.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Iterable<[Command](https://fast-check.dev/api-reference/interfaces/Command.html)<[Model](https://fast-check.dev/api-reference/functions/commands.html#commandsmodel-1), [Real](https://fast-check.dev/api-reference/functions/commands.html#commandsreal-1)>, any, any>>

  #### Remarks

  Since 1.5.0

  + Defined in [packages/fast-check/src/arbitrary/commands.ts:40](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/commands.ts#L40)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
