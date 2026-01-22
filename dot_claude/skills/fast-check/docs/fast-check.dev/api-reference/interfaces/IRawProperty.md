---
title: "IRawProperty | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/IRawProperty"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html)

# Interface IRawProperty<Ts, IsAsync>

Property

A property is the combination of:

* Arbitraries: how to generate the inputs for the algorithm
* Predicate: how to confirm the algorithm succeeded?

#### Remarks

Since 1.19.0

interface IRawProperty<[Ts](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#ts), [IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends boolean = boolean> {
    [runAfterEach](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#runaftereach): () => | ([IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends true ? Promise<void> : never)
    | ([IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends false ? void : never);
    [runBeforeEach](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#runbeforeeach): () => | ([IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends true ? Promise<void> : never)
    | ([IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends false ? void : never);
    [generate](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#generate-1)(mrng: [Random](https://fast-check.dev/api-reference/classes/Random.html), runId?: number): [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#ts)>;
    [isAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync-2)(): [IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync);
    [run](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#run-1)(
        v: [Ts](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#ts),
    ):
        | (
            [IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends true
                ? Promise<[PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html) | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html) | null>
                : never
        )
        | (
            [IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends false
                ? [PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html)
                | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html)
                | null
                : never
        );
    [shrink](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#shrink-1)(value: [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#ts)>): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#ts)>>;
}

#### Type Parameters

* Ts
* IsAsync extends boolean = boolean

#### Hierarchy ([View Summary](https://fast-check.dev/api-reference/hierarchy.html#IRawProperty))

* IRawProperty
  + [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html)
  + [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html)

* Defined in [packages/fast-check/src/check/property/IRawProperty.ts:32](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L32)

##### Index

### Properties

[runAfterEach](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#runaftereach)
[runBeforeEach](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#runbeforeeach)

### Methods

[generate](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#generate)
[isAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync-1)
[run](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#run)
[shrink](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#shrink)

## Properties

### runAfterEach

runAfterEach: () => | ([IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends true ? Promise<void> : never)
| ([IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends false ? void : never)

Run after each hook

#### Remarks

Since 3.4.0

* Defined in [packages/fast-check/src/check/property/IRawProperty.ts:81](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L81)

### runBeforeEach

runBeforeEach: () => | ([IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends true ? Promise<void> : never)
| ([IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends false ? void : never)

Run before each hook

#### Remarks

Since 3.4.0

* Defined in [packages/fast-check/src/check/property/IRawProperty.ts:75](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L75)

## Methods

### generate

* generate(mrng: [Random](https://fast-check.dev/api-reference/classes/Random.html), runId?: number): [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#ts)>

  Generate values of type Ts

  #### Parameters

  + mrng: [Random](https://fast-check.dev/api-reference/classes/Random.html)

    Random number generator
  + `Optional`runId: number

    Id of the generation, starting at 0 - if set the generation might be biased

  #### Returns [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#ts)>

  #### Remarks

  Since 0.0.7 (return type changed in 3.0.0)

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:49](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L49)

### isAsync

* isAsync(): [IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync)

  Is the property asynchronous?

  true in case of asynchronous property, false otherwise

  #### Returns [IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync)

  #### Remarks

  Since 0.0.7

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:39](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L39)

### run

* run(
      v: [Ts](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#ts),
  ):
      | (
          [IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends true
              ? Promise<[PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html) | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html) | null>
              : never
      )
      | (
          [IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends false
              ? [PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html)
              | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html)
              | null
              : never
      )

  Check the predicate for v

  #### Parameters

  + v: [Ts](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#ts)

    Value of which we want to check the predicate

  #### Returns     | (         [IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends true             ? Promise<[PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html) | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html) | null>             : never     )     | (         [IsAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync) extends false             ? [PreconditionFailure](https://fast-check.dev/api-reference/classes/PreconditionFailure.html)             | [PropertyFailure](https://fast-check.dev/api-reference/types/PropertyFailure.html)             | null             : never     )

  #### Remarks

  Since 0.0.7

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:65](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L65)

### shrink

* shrink(value: [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#ts)>): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#ts)>>

  Shrink value of type Ts

  #### Parameters

  + value: [Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#ts)>

    The value to be shrunk, it can be context-less

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[Value](https://fast-check.dev/api-reference/classes/Value.html)<[Ts](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#ts)>>

  #### Remarks

  Since 3.0.0

  + Defined in [packages/fast-check/src/check/property/IRawProperty.ts:58](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/IRawProperty.ts#L58)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[runAfterEach](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#runaftereach)[runBeforeEach](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#runbeforeeach)

Methods

[generate](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#generate)[isAsync](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#isasync-1)[run](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#run)[shrink](https://fast-check.dev/api-reference/interfaces/IRawProperty.html#shrink)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
