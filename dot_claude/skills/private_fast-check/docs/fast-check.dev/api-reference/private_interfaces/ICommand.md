---
title: "ICommand | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/ICommand"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [ICommand](https://fast-check.dev/api-reference/interfaces/ICommand.html)

# Interface ICommand<Model, Real, RunResult, CheckAsync>

Interface that should be implemented in order to define a command

#### Remarks

Since 1.5.0

interface ICommand<
    [Model](https://fast-check.dev/api-reference/interfaces/ICommand.html#model) extends object,
    [Real](https://fast-check.dev/api-reference/interfaces/ICommand.html#real),
    [RunResult](https://fast-check.dev/api-reference/interfaces/ICommand.html#runresult),
    [CheckAsync](https://fast-check.dev/api-reference/interfaces/ICommand.html#checkasync) extends boolean = false,
> {
    [check](https://fast-check.dev/api-reference/interfaces/ICommand.html#check-1)(
        m: Readonly<[Model](https://fast-check.dev/api-reference/interfaces/ICommand.html#model)>,
    ): [CheckAsync](https://fast-check.dev/api-reference/interfaces/ICommand.html#checkasync) extends false ? boolean : Promise<boolean>;
    [run](https://fast-check.dev/api-reference/interfaces/ICommand.html#run-1)(m: [Model](https://fast-check.dev/api-reference/interfaces/ICommand.html#model), r: [Real](https://fast-check.dev/api-reference/interfaces/ICommand.html#real)): [RunResult](https://fast-check.dev/api-reference/interfaces/ICommand.html#runresult);
    [toString](https://fast-check.dev/api-reference/interfaces/ICommand.html#tostring-1)(): string;
}

#### Type Parameters

* Model extends object
* Real
* RunResult
* CheckAsync extends boolean = false

#### Hierarchy ([View Summary](https://fast-check.dev/api-reference/hierarchy.html#ICommand))

* ICommand
  + [AsyncCommand](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html)
  + [Command](https://fast-check.dev/api-reference/interfaces/Command.html)

* Defined in [packages/fast-check/src/check/model/command/ICommand.ts:11](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/command/ICommand.ts#L11)

##### Index

### Methods

[check](https://fast-check.dev/api-reference/interfaces/ICommand.html#check)
[run](https://fast-check.dev/api-reference/interfaces/ICommand.html#run)
[toString](https://fast-check.dev/api-reference/interfaces/ICommand.html#tostring)

## Methods

### check

* check(m: Readonly<[Model](https://fast-check.dev/api-reference/interfaces/ICommand.html#model)>): [CheckAsync](https://fast-check.dev/api-reference/interfaces/ICommand.html#checkasync) extends false ? boolean : Promise<boolean>

  Check if the model is in the right state to apply the command

  WARNING: does not change the model

  #### Parameters

  + m: Readonly<[Model](https://fast-check.dev/api-reference/interfaces/ICommand.html#model)>

    Model, simplified or schematic representation of real system

  #### Returns [CheckAsync](https://fast-check.dev/api-reference/interfaces/ICommand.html#checkasync) extends false ? boolean : Promise<boolean>

  #### Remarks

  Since 1.5.0

  + Defined in [packages/fast-check/src/check/model/command/ICommand.ts:21](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/command/ICommand.ts#L21)

### run

* run(m: [Model](https://fast-check.dev/api-reference/interfaces/ICommand.html#model), r: [Real](https://fast-check.dev/api-reference/interfaces/ICommand.html#real)): [RunResult](https://fast-check.dev/api-reference/interfaces/ICommand.html#runresult)

  Receive the non-updated model and the real or system under test.
  Perform the checks post-execution - Throw in case of invalid state.
  Update the model accordingly

  #### Parameters

  + m: [Model](https://fast-check.dev/api-reference/interfaces/ICommand.html#model)

    Model, simplified or schematic representation of real system
  + r: [Real](https://fast-check.dev/api-reference/interfaces/ICommand.html#real)

    Sytem under test

  #### Returns [RunResult](https://fast-check.dev/api-reference/interfaces/ICommand.html#runresult)

  #### Remarks

  Since 1.5.0

  + Defined in [packages/fast-check/src/check/model/command/ICommand.ts:33](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/command/ICommand.ts#L33)

### toString

* toString(): string

  Name of the command

  #### Returns string

  #### Remarks

  Since 1.5.0

  + Defined in [packages/fast-check/src/check/model/command/ICommand.ts:39](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/command/ICommand.ts#L39)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Methods

[check](https://fast-check.dev/api-reference/interfaces/ICommand.html#check)[run](https://fast-check.dev/api-reference/interfaces/ICommand.html#run)[toString](https://fast-check.dev/api-reference/interfaces/ICommand.html#tostring)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
