---
title: "IAsyncProperty | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/IAsyncProperty"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html)

# Interface IAsyncProperty<Ts>

Interface for asynchronous property, see [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html)

#### Remarks

Since 1.19.0

interface IAsyncProperty<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts)> {
    [runAfterEach](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#runaftereach): () => Promise<void>;
    [runBeforeEach](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#runbeforeeach): () => Promise<void>;
    [generate](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#generate-1)(mrng: [Random](https://fast-check.dev/api-reference/classes/Random.html), runId?: number): [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts)>;
    [isAsync](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#isasync-1)(): true;
    [run](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#run-1)(v: [Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts)): Promise<[PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html) | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html) | null>;
    [shrink](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#shrink-1)(value: [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts)>): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts)>>;
}

#### Type Parameters

* Ts

#### Hierarchy ([View Summary](https://fast-check.dev/api-reference/hierarchy.html#IAsyncProperty))

* [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts), true>
  + IAsyncProperty
    - [IAsyncPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html)

* Defined in [packages/fast-check/src/check/property/AsyncProperty.generic.ts:32](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/AsyncProperty.generic.ts#L32)

##### Index

### Properties

[runAfterEach](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#runaftereach)
[runBeforeEach](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#runbeforeeach)

### Methods

[generate](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#generate)
[isAsync](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#isasync)
[run](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#run)
[shrink](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#shrink)

## Properties

### runAfterEach

runAfterEach: () => Promise<void>

Run after each hook

#### Remarks

Since 3.4.0

Inherited from [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html).[runAfterEach](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#runaftereach)

* Defined in [packages/fast-check/src/check/property/IRawProperty.ts:81](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L81)

### runBeforeEach

runBeforeEach: () => Promise<void>

Run before each hook

#### Remarks

Since 3.4.0

Inherited from [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html).[runBeforeEach](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#runbeforeeach)

* Defined in [packages/fast-check/src/check/property/IRawProperty.ts:75](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L75)

## Methods

### generate

* generate(mrng: [Random](https://fast-check.dev/api-reference/classes/Random.html), runId?: number): [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts)>

  Generate values of type Ts

  #### Parameters

  + mrng: [Random](https://fast-check.dev/api-reference/classes/Random.html)

    Random number generator
  + `Optional`runId: number

    Id of the generation, starting at 0 - if set the generation might be biased

  #### Returns [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts)>

  #### Remarks

  Since 0.0.7 (return type changed in 3.0.0)

  Inherited from [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html).[generate](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#generate)

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:49](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L49)

### isAsync

* isAsync(): true

  Is the property asynchronous?

  true in case of asynchronous property, false otherwise

  #### Returns true

  #### Remarks

  Since 0.0.7

  Inherited from [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html).[isAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync-1)

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:39](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L39)

### run

* run(v: [Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts)): Promise<[PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html) | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html) | null>

  Check the predicate for v

  #### Parameters

  + v: [Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts)

    Value of which we want to check the predicate

  #### Returns Promise<[PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html) | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html) | null>

  #### Remarks

  Since 0.0.7

  Inherited from [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html).[run](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#run)

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:65](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L65)

### shrink

* shrink(value: [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts)>): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts)>>

  Shrink value of type Ts

  #### Parameters

  + value: [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts)>

    The value to be shrunk, it can be context-less

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#ts)>>

  #### Remarks

  Since 3.0.0

  Inherited from [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html).[shrink](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#shrink)

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:58](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L58)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[runAfterEach](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#runaftereach)[runBeforeEach](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#runbeforeeach)

Methods

[generate](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#generate)[isAsync](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#isasync)[run](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#run)[shrink](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html#shrink)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
