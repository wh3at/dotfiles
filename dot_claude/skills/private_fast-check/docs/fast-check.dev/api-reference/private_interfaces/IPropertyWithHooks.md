---
title: "IPropertyWithHooks | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [IPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html)

# Interface IPropertyWithHooks<Ts>

Interface for synchronous property defining hooks, see [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html)

#### Remarks

Since 2.2.0

interface IPropertyWithHooks<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)> {
    [runAfterEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#runaftereach): () => void;
    [runBeforeEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#runbeforeeach): () => void;
    [afterEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#aftereach-1)(
        invalidHookFunction: (
            hookFunction: [GlobalPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalPropertyHookFunction.html),
        ) => Promise<unknown>,
    ): "afterEach expects a synchronous function but was given a function returning a Promise";
    [afterEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#aftereach-2)(hookFunction: [PropertyHookFunction](https://fast-check.dev/api-reference/types/PropertyHookFunction.html)): [IPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>;
    [beforeEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#beforeeach-1)(
        invalidHookFunction: (
            hookFunction: [GlobalPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalPropertyHookFunction.html),
        ) => Promise<unknown>,
    ): "beforeEach expects a synchronous function but was given a function returning a Promise";
    [beforeEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#beforeeach-2)(hookFunction: [PropertyHookFunction](https://fast-check.dev/api-reference/types/PropertyHookFunction.html)): [IPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>;
    [generate](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#generate-1)(mrng: [Random](https://fast-check.dev/api-reference/classes/Random.html), runId?: number): [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>;
    [isAsync](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#isasync-1)(): false;
    [run](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#run-1)(v: [Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)): [PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html) | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html) | null;
    [shrink](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#shrink-1)(value: [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>>;
}

#### Type Parameters

* Ts

#### Hierarchy ([View Summary](https://fast-check.dev/api-reference/hierarchy.html#IPropertyWithHooks))

* [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>
  + IPropertyWithHooks

* Defined in [packages/fast-check/src/check/property/Property.generic.ts:37](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/Property.generic.ts#L37)

##### Index

### Properties

[runAfterEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#runaftereach)
[runBeforeEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#runbeforeeach)

### Methods

[afterEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#aftereach)
[beforeEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#beforeeach)
[generate](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#generate)
[isAsync](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#isasync)
[run](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#run)
[shrink](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#shrink)

## Properties

### runAfterEach

runAfterEach: () => void

Run after each hook

#### Remarks

Since 3.4.0

Inherited from [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html).[runAfterEach](https://fast-check.dev/api-reference/interfaces/IProperty.html#runaftereach)

* Defined in [packages/fast-check/src/check/property/IRawProperty.ts:81](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L81)

### runBeforeEach

runBeforeEach: () => void

Run before each hook

#### Remarks

Since 3.4.0

Inherited from [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html).[runBeforeEach](https://fast-check.dev/api-reference/interfaces/IProperty.html#runbeforeeach)

* Defined in [packages/fast-check/src/check/property/IRawProperty.ts:75](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L75)

## Methods

### afterEach

* afterEach(
      invalidHookFunction: (
          hookFunction: [GlobalPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalPropertyHookFunction.html),
      ) => Promise<unknown>,
  ): "afterEach expects a synchronous function but was given a function returning a Promise"

  Define a function that should be called after all calls to the predicate

  #### Parameters

  + invalidHookFunction: (hookFunction: [GlobalPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalPropertyHookFunction.html)) => Promise<unknown>

    Function to be called, please provide a valid hook function

  #### Returns "afterEach expects a synchronous function but was given a function returning a Promise"

  #### Remarks

  Since 1.6.0

  + Defined in [packages/fast-check/src/check/property/Property.generic.ts:59](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/Property.generic.ts#L59)
* afterEach(hookFunction: [PropertyHookFunction](https://fast-check.dev/api-reference/types/PropertyHookFunction.html)): [IPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>

  Define a function that should be called after all calls to the predicate

  #### Parameters

  + hookFunction: [PropertyHookFunction](https://fast-check.dev/api-reference/types/PropertyHookFunction.html)

    Function to be called

  #### Returns [IPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>

  #### Remarks

  Since 1.6.0

  + Defined in [packages/fast-check/src/check/property/Property.generic.ts:67](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/Property.generic.ts#L67)

### beforeEach

* beforeEach(
      invalidHookFunction: (
          hookFunction: [GlobalPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalPropertyHookFunction.html),
      ) => Promise<unknown>,
  ): "beforeEach expects a synchronous function but was given a function returning a Promise"

  Define a function that should be called before all calls to the predicate

  #### Parameters

  + invalidHookFunction: (hookFunction: [GlobalPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalPropertyHookFunction.html)) => Promise<unknown>

    Function to be called, please provide a valid hook function

  #### Returns "beforeEach expects a synchronous function but was given a function returning a Promise"

  #### Remarks

  Since 1.6.0

  + Defined in [packages/fast-check/src/check/property/Property.generic.ts:43](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/Property.generic.ts#L43)
* beforeEach(hookFunction: [PropertyHookFunction](https://fast-check.dev/api-reference/types/PropertyHookFunction.html)): [IPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>

  Define a function that should be called before all calls to the predicate

  #### Parameters

  + hookFunction: [PropertyHookFunction](https://fast-check.dev/api-reference/types/PropertyHookFunction.html)

    Function to be called

  #### Returns [IPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>

  #### Remarks

  Since 1.6.0

  + Defined in [packages/fast-check/src/check/property/Property.generic.ts:52](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/Property.generic.ts#L52)

### generate

* generate(mrng: [Random](https://fast-check.dev/api-reference/classes/Random.html), runId?: number): [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>

  Generate values of type Ts

  #### Parameters

  + mrng: [Random](https://fast-check.dev/api-reference/classes/Random.html)

    Random number generator
  + `Optional`runId: number

    Id of the generation, starting at 0 - if set the generation might be biased

  #### Returns [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>

  #### Remarks

  Since 0.0.7 (return type changed in 3.0.0)

  Inherited from [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html).[generate](https://fast-check.dev/api-reference/interfaces/IProperty.html#generate)

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:49](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L49)

### isAsync

* isAsync(): false

  Is the property asynchronous?

  true in case of asynchronous property, false otherwise

  #### Returns false

  #### Remarks

  Since 0.0.7

  Inherited from [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html).[isAsync](https://fast-check.dev/api-reference/interfaces/IProperty.html#isasync)

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:39](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L39)

### run

* run(v: [Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)): [PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html) | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html) | null

  Check the predicate for v

  #### Parameters

  + v: [Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)

    Value of which we want to check the predicate

  #### Returns [PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html) | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html) | null

  #### Remarks

  Since 0.0.7

  Inherited from [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html).[run](https://fast-check.dev/api-reference/interfaces/IProperty.html#run)

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:65](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L65)

### shrink

* shrink(value: [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>>

  Shrink value of type Ts

  #### Parameters

  + value: [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>

    The value to be shrunk, it can be context-less

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#ts)>>

  #### Remarks

  Since 3.0.0

  Inherited from [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html).[shrink](https://fast-check.dev/api-reference/interfaces/IProperty.html#shrink)

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:58](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L58)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[runAfterEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#runaftereach)[runBeforeEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#runbeforeeach)

Methods

[afterEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#aftereach)[beforeEach](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#beforeeach)[generate](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#generate)[isAsync](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#isasync)[run](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#run)[shrink](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html#shrink)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
