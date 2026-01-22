---
title: "Value | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/classes/Value"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [Value](https://fast-check.dev/api-reference/classes/Value.html)

# Class Value<T>

A `Value<T, TShrink = T>` holds an internal value of type `T`
and its associated context

#### Remarks

Since 3.0.0 (previously called `NextValue` in 2.15.0)

#### Type Parameters

* T

* Defined in [packages/fast-check/src/check/arbitrary/definition/Value.ts:13](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/arbitrary/definition/Value.ts#L13)

##### Index

### Constructors

[constructor](https://fast-check.dev/api-reference/classes/Value.html#constructor)

### Properties

[context](https://fast-check.dev/api-reference/classes/Value.html#context)
[hasToBeCloned](https://fast-check.dev/api-reference/classes/Value.html#hastobecloned)
[value](https://fast-check.dev/api-reference/classes/Value.html#value)
[value\_](https://fast-check.dev/api-reference/classes/Value.html#value_)

## Constructors

### constructor

* new Value<[T](https://fast-check.dev/api-reference/classes/Value.html#constructorvaluet)>(
      value\_: [T](https://fast-check.dev/api-reference/classes/Value.html#t),
      context: unknown,
      customGetValue?: (() => [T](https://fast-check.dev/api-reference/classes/Value.html#t)) | undefined,
  ): [Value](https://fast-check.dev/api-reference/classes/Value.html)<[T](https://fast-check.dev/api-reference/classes/Value.html#t)>

  #### Type Parameters

  + T

  #### Parameters

  + value\_: [T](https://fast-check.dev/api-reference/classes/Value.html#t)

    Internal value of the shrinkable
  + context: unknown

    Context associated to the generated value (useful for shrink)
  + customGetValue: (() => [T](https://fast-check.dev/api-reference/classes/Value.html#t)) | undefined = undefined

    Limited to internal usages (to ease migration to next), it will be removed on next major

  #### Returns [Value](https://fast-check.dev/api-reference/classes/Value.html)<[T](https://fast-check.dev/api-reference/classes/Value.html#t)>

  + Defined in [packages/fast-check/src/check/arbitrary/definition/Value.ts:50](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/arbitrary/definition/Value.ts#L50)

## Properties

### `Readonly`context

context: unknown

Context for the generated value
TODO - Do we want to clone it too?

#### Remarks

2.15.0

* Defined in [packages/fast-check/src/check/arbitrary/definition/Value.ts:43](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/arbitrary/definition/Value.ts#L43)

### `Readonly`hasToBeCloned

hasToBeCloned: boolean

State storing the result of hasCloneMethod
If `true` the value will be cloned each time it gets accessed

#### Remarks

Since 2.15.0

* Defined in [packages/fast-check/src/check/arbitrary/definition/Value.ts:19](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/arbitrary/definition/Value.ts#L19)

### `Readonly`value

value: [T](https://fast-check.dev/api-reference/classes/Value.html#t)

Safe value of the shrinkable
Depending on `hasToBeCloned` it will either be `value_` or a clone of it

#### Remarks

Since 2.15.0

* Defined in [packages/fast-check/src/check/arbitrary/definition/Value.ts:32](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/arbitrary/definition/Value.ts#L32)

### `Readonly`value\_

value\_: [T](https://fast-check.dev/api-reference/classes/Value.html#t)

Internal value of the shrinkable

#### Remarks

Since 2.15.0

* Defined in [packages/fast-check/src/check/arbitrary/definition/Value.ts:37](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/arbitrary/definition/Value.ts#L37)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Constructors

[constructor](https://fast-check.dev/api-reference/classes/Value.html#constructor)

Properties

[context](https://fast-check.dev/api-reference/classes/Value.html#context)[hasToBeCloned](https://fast-check.dev/api-reference/classes/Value.html#hastobecloned)[value](https://fast-check.dev/api-reference/classes/Value.html#value)[value\_](https://fast-check.dev/api-reference/classes/Value.html#value_)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
