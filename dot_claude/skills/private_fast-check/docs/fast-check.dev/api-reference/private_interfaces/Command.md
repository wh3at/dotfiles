---
title: "Command | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/Command"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [Command](https://fast-check.dev/api-reference/interfaces/Command.html)

# Interface Command<Model, Real>

Interface that should be implemented in order to define
a synchronous command

#### Remarks

Since 1.5.0

interface Command<[Model](https://fast-check.dev/api-reference/interfaces/Command.html#model) extends object, [Real](https://fast-check.dev/api-reference/interfaces/Command.html#real)> {
    [check](https://fast-check.dev/api-reference/interfaces/Command.html#check-1)(m: Readonly<[Model](https://fast-check.dev/api-reference/interfaces/ICommand.html#model)>): boolean;
    [run](https://fast-check.dev/api-reference/interfaces/Command.html#run-1)(m: [Model](https://fast-check.dev/api-reference/interfaces/Command.html#model), r: [Real](https://fast-check.dev/api-reference/interfaces/Command.html#real)): void;
    [toString](https://fast-check.dev/api-reference/interfaces/Command.html#tostring-1)(): string;
}

#### Type Parameters

* Model extends object
* Real

#### Hierarchy ([View Summary](https://fast-check.dev/api-reference/hierarchy.html#Command))

* [ICommand](https://fast-check.dev/api-reference/interfaces/ICommand.html)<[Model](https://fast-check.dev/api-reference/interfaces/Command.html#model), [Real](https://fast-check.dev/api-reference/interfaces/Command.html#real), void>
  + Command

* Defined in [packages/fast-check/src/check/model/command/Command.ts:10](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/command/Command.ts#L10)

##### Index

### Methods

[check](https://fast-check.dev/api-reference/interfaces/Command.html#check)
[run](https://fast-check.dev/api-reference/interfaces/Command.html#run)
[toString](https://fast-check.dev/api-reference/interfaces/Command.html#tostring)

## Methods

### check

* check(m: Readonly<[Model](https://fast-check.dev/api-reference/interfaces/ICommand.html#model)>): boolean

  Check if the model is in the right state to apply the command

  WARNING: does not change the model

  #### Parameters

  + m: Readonly<[Model](https://fast-check.dev/api-reference/interfaces/ICommand.html#model)>

    Model, simplified or schematic representation of real system

  #### Returns boolean

  #### Remarks

  Since 1.5.0

  Inherited from [ICommand](https://fast-check.dev/api-reference/interfaces/ICommand.html).[check](https://fast-check.dev/api-reference/interfaces/ICommand.html#check)

  + Defined in [packages/fast-check/src/check/model/command/ICommand.ts:21](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/command/ICommand.ts#L21)

### run

* run(m: [Model](https://fast-check.dev/api-reference/interfaces/Command.html#model), r: [Real](https://fast-check.dev/api-reference/interfaces/Command.html#real)): void

  Receive the non-updated model and the real or system under test.
  Perform the checks post-execution - Throw in case of invalid state.
  Update the model accordingly

  #### Parameters

  + m: [Model](https://fast-check.dev/api-reference/interfaces/Command.html#model)

    Model, simplified or schematic representation of real system
  + r: [Real](https://fast-check.dev/api-reference/interfaces/Command.html#real)

    Sytem under test

  #### Returns void

  #### Remarks

  Since 1.5.0

  Inherited from [ICommand](https://fast-check.dev/api-reference/interfaces/ICommand.html).[run](https://fast-check.dev/api-reference/interfaces/ICommand.html#run)

  + Defined in [packages/fast-check/src/check/model/command/ICommand.ts:33](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/command/ICommand.ts#L33)

### toString

* toString(): string

  Name of the command

  #### Returns string

  #### Remarks

  Since 1.5.0

  Inherited from [ICommand](https://fast-check.dev/api-reference/interfaces/ICommand.html).[toString](https://fast-check.dev/api-reference/interfaces/ICommand.html#tostring)

  + Defined in [packages/fast-check/src/check/model/command/ICommand.ts:39](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/command/ICommand.ts#L39)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Methods

[check](https://fast-check.dev/api-reference/interfaces/Command.html#check)[run](https://fast-check.dev/api-reference/interfaces/Command.html#run)[toString](https://fast-check.dev/api-reference/interfaces/Command.html#tostring)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
