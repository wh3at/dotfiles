---
title: "AsyncCommand | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/AsyncCommand"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [AsyncCommand](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html)

# Interface AsyncCommand<Model, Real, CheckAsync>

Interface that should be implemented in order to define
an asynchronous command

#### Remarks

Since 1.5.0

interface AsyncCommand<
    [Model](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#model) extends object,
    [Real](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#real),
    [CheckAsync](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#checkasync) extends boolean = false,
> {
    [check](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#check-1)(
        m: Readonly<[Model](https://fast-check.dev/api-reference/interfaces/ICommand.html#model)>,
    ): [CheckAsync](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#checkasync) extends false ? boolean : Promise<boolean>;
    [run](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#run-1)(m: [Model](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#model), r: [Real](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#real)): Promise;
    [toString](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#tostring-1)(): string;
}

#### Type Parameters

* Model extends object
* Real
* CheckAsync extends boolean = false

#### Hierarchy ([View Summary](https://fast-check.dev/api-reference/hierarchy.html#AsyncCommand))

* [ICommand](https://fast-check.dev/api-reference/interfaces/ICommand.html)<[Model](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#model), [Real](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#real), Promise<void>, [CheckAsync](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#checkasync)>
  + AsyncCommand

* Defined in [packages/fast-check/src/check/model/command/AsyncCommand.ts:10](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/command/AsyncCommand.ts#L10)

##### Index

### Methods

[check](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#check)
[run](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#run)
[toString](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#tostring)

## Methods

### check

* check(m: Readonly<[Model](https://fast-check.dev/api-reference/interfaces/ICommand.html#model)>): [CheckAsync](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#checkasync) extends false ? boolean : Promise<boolean>

  Check if the model is in the right state to apply the command

  WARNING: does not change the model

  #### Parameters

  + m: Readonly<[Model](https://fast-check.dev/api-reference/interfaces/ICommand.html#model)>

    Model, simplified or schematic representation of real system

  #### Returns [CheckAsync](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#checkasync) extends false ? boolean : Promise<boolean>

  #### Remarks

  Since 1.5.0

  Inherited from [ICommand](https://fast-check.dev/api-reference/interfaces/ICommand.html).[check](https://fast-check.dev/api-reference/interfaces/ICommand.html#check)

  + Defined in [packages/fast-check/src/check/model/command/ICommand.ts:21](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/model/command/ICommand.ts#L21)

### run

* run(m: [Model](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#model), r: [Real](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#real)): Promise

  Receive the non-updated model and the real or system under test.
  Perform the checks post-execution - Throw in case of invalid state.
  Update the model accordingly

  #### Parameters

  + m: [Model](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#model)

    Model, simplified or schematic representation of real system
  + r: [Real](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#real)

    Sytem under test

  #### Returns Promise

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

[check](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#check)[run](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#run)[toString](https://fast-check.dev/api-reference/interfaces/AsyncCommand.html#tostring)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
