---
title: "IAsyncPropertyWithHooks | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [IAsyncPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html)

# Interface IAsyncPropertyWithHooks<Ts>

Interface for asynchronous property defining hooks, see [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html)

#### Remarks

Since 2.2.0

interface IAsyncPropertyWithHooks<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)> {
    [runAfterEach](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#runaftereach): () => Promise<void>;
    [runBeforeEach](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#runbeforeeach): () => Promise<void>;
    [afterEach](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#aftereach-1)(
        hookFunction: [AsyncPropertyHookFunction](https://fast-check.dev/api-reference/types/AsyncPropertyHookFunction.html),
    ): [IAsyncPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>;
    [beforeEach](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#beforeeach-1)(
        hookFunction: [AsyncPropertyHookFunction](https://fast-check.dev/api-reference/types/AsyncPropertyHookFunction.html),
    ): [IAsyncPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>;
    [generate](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#generate-1)(mrng: [Random](https://fast-check.dev/api-reference/classes/Random.html), runId?: number): [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>;
    [isAsync](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#isasync-1)(): true;
    [run](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#run-1)(v: [Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)): Promise<[PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html) | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html) | null>;
    [shrink](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#shrink-1)(value: [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>>;
}

#### Type Parameters

* Ts

#### Hierarchy ([View Summary](https://fast-check.dev/api-reference/hierarchy.html#IAsyncPropertyWithHooks))

* [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>
  + IAsyncPropertyWithHooks

* Defined in [packages/fast-check/src/check/property/AsyncProperty.generic.ts:39](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/AsyncProperty.generic.ts#L39)

##### Index

### Properties

[runAfterEach](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#runaftereach)
[runBeforeEach](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#runbeforeeach)

### Methods

[afterEach](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#aftereach)
[beforeEach](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#beforeeach)
[generate](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#generate)
[isAsync](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#isasync)
[run](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#run)
[shrink](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#shrink)

## Properties

### runAfterEach

runAfterEach: () => Promise<void>

Run after each hook

#### Remarks

Since 3.4.0

Inherited from [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html).[runAfterEach](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#runaftereach)

* Defined in [packages/fast-check/src/check/property/IRawProperty.ts:81](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L81)

### runBeforeEach

runBeforeEach: () => Promise<void>

Run before each hook

#### Remarks

Since 3.4.0

Inherited from [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html).[runBeforeEach](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#runbeforeeach)

* Defined in [packages/fast-check/src/check/property/IRawProperty.ts:75](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L75)

## Methods

### afterEach

* afterEach(hookFunction: [AsyncPropertyHookFunction](https://fast-check.dev/api-reference/types/AsyncPropertyHookFunction.html)): [IAsyncPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>

  Define a function that should be called after all calls to the predicate

  #### Parameters

  + hookFunction: [AsyncPropertyHookFunction](https://fast-check.dev/api-reference/types/AsyncPropertyHookFunction.html)

    Function to be called

  #### Returns [IAsyncPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>

  #### Remarks

  Since 1.6.0

  + Defined in [packages/fast-check/src/check/property/AsyncProperty.generic.ts:52](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/AsyncProperty.generic.ts#L52)

### beforeEach

* beforeEach(hookFunction: [AsyncPropertyHookFunction](https://fast-check.dev/api-reference/types/AsyncPropertyHookFunction.html)): [IAsyncPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>

  Define a function that should be called before all calls to the predicate

  #### Parameters

  + hookFunction: [AsyncPropertyHookFunction](https://fast-check.dev/api-reference/types/AsyncPropertyHookFunction.html)

    Function to be called

  #### Returns [IAsyncPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>

  #### Remarks

  Since 1.6.0

  + Defined in [packages/fast-check/src/check/property/AsyncProperty.generic.ts:45](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/AsyncProperty.generic.ts#L45)

### generate

* generate(mrng: [Random](https://fast-check.dev/api-reference/classes/Random.html), runId?: number): [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>

  Generate values of type Ts

  #### Parameters

  + mrng: [Random](https://fast-check.dev/api-reference/classes/Random.html)

    Random number generator
  + `Optional`runId: number

    Id of the generation, starting at 0 - if set the generation might be biased

  #### Returns [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>

  #### Remarks

  Since 0.0.7 (return type changed in 3.0.0)

  Inherited from [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html).[generate](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#generate)

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:49](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L49)

### isAsync

* isAsync(): true

  Is the property asynchronous?

  true in case of asynchronous property, false otherwise

  #### Returns true

  #### Remarks

  Since 0.0.7

  Inherited from [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html).[isAsync](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#isasync)

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:39](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L39)

### run

* run(v: [Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)): Promise<[PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html) | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html) | null>

  Check the predicate for v

  #### Parameters

  + v: [Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)

    Value of which we want to check the predicate

  #### Returns Promise<[PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html) | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html) | null>

  #### Remarks

  Since 0.0.7

  Inherited from [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html).[run](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#run)

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:65](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L65)

### shrink

* shrink(value: [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>>

  Shrink value of type Ts

  #### Parameters

  + value: [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>

    The value to be shrunk, it can be context-less

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#ts)>>

  #### Remarks

  Since 3.0.0

  Inherited from [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html).[shrink](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#shrink)

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:58](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L58)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[runAfterEach](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#runaftereach)[runBeforeEach](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#runbeforeeach)

Methods

[afterEach](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#aftereach)[beforeEach](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#beforeeach)[generate](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#generate)[isAsync](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#isasync)[run](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#run)[shrink](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html#shrink)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
