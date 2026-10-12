---
title: "Stream | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/classes/Stream"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [Stream](https://fast-check.dev/api-reference/classes/Stream.html)

# Class Stream<T>

Wrapper around `IterableIterator` interface
offering a set of helpers to deal with iterations in a simple way

#### Remarks

Since 0.0.7

#### Type Parameters

* T

#### Implements

* IterableIterator<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

* Defined in [packages/fast-check/src/stream/Stream.ts:20](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L20)

##### Index

### Constructors

[constructor](https://fast-check.dev/api-reference/classes/Stream.html#constructor)

### Methods

[[iterator]](Stream.html#iterator)
[drop](https://fast-check.dev/api-reference/classes/Stream.html#drop)
[dropWhile](https://fast-check.dev/api-reference/classes/Stream.html#dropwhile)
[every](https://fast-check.dev/api-reference/classes/Stream.html#every)
[filter](https://fast-check.dev/api-reference/classes/Stream.html#filter)
[flatMap](https://fast-check.dev/api-reference/classes/Stream.html#flatmap)
[getNthOrLast](https://fast-check.dev/api-reference/classes/Stream.html#getnthorlast)
[has](https://fast-check.dev/api-reference/classes/Stream.html#has)
[join](https://fast-check.dev/api-reference/classes/Stream.html#join)
[map](https://fast-check.dev/api-reference/classes/Stream.html#map)
[next](https://fast-check.dev/api-reference/classes/Stream.html#next)
[take](https://fast-check.dev/api-reference/classes/Stream.html#take)
[takeWhile](https://fast-check.dev/api-reference/classes/Stream.html#takewhile)
[nil](https://fast-check.dev/api-reference/classes/Stream.html#nil)
[of](https://fast-check.dev/api-reference/classes/Stream.html#of)

## Constructors

### constructor

* new Stream<[T](https://fast-check.dev/api-reference/classes/Stream.html#constructorstreamt)>(g: IterableIterator<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  Create a Stream based on `g`

  #### Type Parameters

  + T

  #### Parameters

  + g: IterableIterator<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

    Underlying data of the Stream

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  + Defined in [packages/fast-check/src/stream/Stream.ts:46](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L46)

## Methods

### [iterator]

* "[iterator]"(): IterableIterator<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  #### Returns IterableIterator<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  Implementation of IterableIterator.[iterator]

  + Defined in [packages/fast-check/src/stream/Stream.ts:58](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L58)

### drop

* drop(n: number): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  Drop `n` first elements of the Stream

  WARNING: It closes the current stream

  #### Parameters

  + n: number

    Number of elements to drop

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/stream/Stream.ts:114](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L114)

### dropWhile

* dropWhile(f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => boolean): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  Drop elements from the Stream while `f(element) === true`

  WARNING: It closes the current stream

  #### Parameters

  + f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => boolean

    Drop condition

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/stream/Stream.ts:96](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L96)

### every

* every(f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => boolean): boolean

  Check whether all elements of the Stream are successful for `f`

  WARNING: It closes the current stream

  #### Parameters

  + f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => boolean

    Condition to check

  #### Returns boolean

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/stream/Stream.ts:180](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L180)

### filter

* filter<[U](https://fast-check.dev/api-reference/classes/Stream.html#filteru)>(f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => v is [U](https://fast-check.dev/api-reference/classes/Stream.html#filteru)): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[U](https://fast-check.dev/api-reference/classes/Stream.html#filteru)>

  Filter elements of the Stream

  WARNING: It closes the current stream

  #### Type Parameters

  + U

  #### Parameters

  + f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => v is [U](https://fast-check.dev/api-reference/classes/Stream.html#filteru)

    Elements to keep

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[U](https://fast-check.dev/api-reference/classes/Stream.html#filteru)>

  #### Remarks

  Since 1.23.0

  + Defined in [packages/fast-check/src/stream/Stream.ts:157](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L157)
* filter(f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => boolean): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  Filter elements of the Stream

  WARNING: It closes the current stream

  #### Parameters

  + f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => boolean

    Elements to keep

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/stream/Stream.ts:166](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L166)

### flatMap

* flatMap<[U](https://fast-check.dev/api-reference/classes/Stream.html#flatmapu)>(f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => IterableIterator<[U](https://fast-check.dev/api-reference/classes/Stream.html#flatmapu)>): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[U](https://fast-check.dev/api-reference/classes/Stream.html#flatmapu)>

  Flat map all elements of the Stream using `f`

  WARNING: It closes the current stream

  #### Type Parameters

  + U

  #### Parameters

  + f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => IterableIterator<[U](https://fast-check.dev/api-reference/classes/Stream.html#flatmapu)>

    Mapper function

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[U](https://fast-check.dev/api-reference/classes/Stream.html#flatmapu)>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/stream/Stream.ts:83](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L83)

### getNthOrLast

* getNthOrLast(nth: number): [T](https://fast-check.dev/api-reference/classes/Stream.html#t) | null

  Take the `nth` element of the Stream of the last (if it does not exist)

  WARNING: It closes the current stream

  #### Parameters

  + nth: number

    Position of the element to extract

  #### Returns [T](https://fast-check.dev/api-reference/classes/Stream.html#t) | null

  #### Remarks

  Since 0.0.12

  + Defined in [packages/fast-check/src/stream/Stream.ts:228](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L228)

### has

* has(f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => boolean): [boolean, [T](https://fast-check.dev/api-reference/classes/Stream.html#t) | null]

  Check whether one of the elements of the Stream is successful for `f`

  WARNING: It closes the current stream

  #### Parameters

  + f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => boolean

    Condition to check

  #### Returns [boolean, [T](https://fast-check.dev/api-reference/classes/Stream.html#t) | null]

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/stream/Stream.ts:197](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L197)

### join

* join(...others: IterableIterator<[T](https://fast-check.dev/api-reference/classes/Stream.html#t), any, any>[]): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  Join `others` Stream to the current Stream

  WARNING: It closes the current stream and the other ones (as soon as it iterates over them)

  #### Parameters

  + ...others: IterableIterator<[T](https://fast-check.dev/api-reference/classes/Stream.html#t), any, any>[]

    Streams to join to the current Stream

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/stream/Stream.ts:215](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L215)

### map

* map<[U](https://fast-check.dev/api-reference/classes/Stream.html#mapu)>(f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => [U](https://fast-check.dev/api-reference/classes/Stream.html#mapu)): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[U](https://fast-check.dev/api-reference/classes/Stream.html#mapu)>

  Map all elements of the Stream using `f`

  WARNING: It closes the current stream

  #### Type Parameters

  + U

  #### Parameters

  + f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => [U](https://fast-check.dev/api-reference/classes/Stream.html#mapu)

    Mapper function

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[U](https://fast-check.dev/api-reference/classes/Stream.html#mapu)>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/stream/Stream.ts:71](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L71)

### next

* next(): IteratorResult<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  #### Returns IteratorResult<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  Implementation of IterableIterator.next

  + Defined in [packages/fast-check/src/stream/Stream.ts:55](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L55)

### take

* take(n: number): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  Take `n` first elements of the Stream

  WARNING: It closes the current stream

  #### Parameters

  + n: number

    Number of elements to take

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/stream/Stream.ts:144](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L144)

### takeWhile

* takeWhile(f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => boolean): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  Take elements from the Stream while `f(element) === true`

  WARNING: It closes the current stream

  #### Parameters

  + f: (v: [T](https://fast-check.dev/api-reference/classes/Stream.html#t)) => boolean

    Take condition

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#t)>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/stream/Stream.ts:132](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L132)

### `Static`nil

* nil<[T](https://fast-check.dev/api-reference/classes/Stream.html#nilt)>(): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#nilt)>

  Create an empty stream of T

  #### Type Parameters

  + T

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#nilt)>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/stream/Stream.ts:25](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L25)

### `Static`of

* of<[T](https://fast-check.dev/api-reference/classes/Stream.html#oft)>(...elements: [T](https://fast-check.dev/api-reference/classes/Stream.html#oft)[]): [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#oft)>

  Create a stream of T from a variable number of elements

  #### Type Parameters

  + T

  #### Parameters

  + ...elements: [T](https://fast-check.dev/api-reference/classes/Stream.html#oft)[]

    Elements used to create the Stream

  #### Returns [Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/classes/Stream.html#oft)>

  #### Remarks

  Since 2.12.0

  + Defined in [packages/fast-check/src/stream/Stream.ts:35](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/stream/Stream.ts#L35)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Constructors

[constructor](https://fast-check.dev/api-reference/classes/Stream.html#constructor)

Methods

[[iterator]](Stream.html#iterator)[drop](https://fast-check.dev/api-reference/classes/Stream.html#drop)[dropWhile](https://fast-check.dev/api-reference/classes/Stream.html#dropwhile)[every](https://fast-check.dev/api-reference/classes/Stream.html#every)[filter](https://fast-check.dev/api-reference/classes/Stream.html#filter)[flatMap](https://fast-check.dev/api-reference/classes/Stream.html#flatmap)[getNthOrLast](https://fast-check.dev/api-reference/classes/Stream.html#getnthorlast)[has](https://fast-check.dev/api-reference/classes/Stream.html#has)[join](https://fast-check.dev/api-reference/classes/Stream.html#join)[map](https://fast-check.dev/api-reference/classes/Stream.html#map)[next](https://fast-check.dev/api-reference/classes/Stream.html#next)[take](https://fast-check.dev/api-reference/classes/Stream.html#take)[takeWhile](https://fast-check.dev/api-reference/classes/Stream.html#takewhile)[nil](https://fast-check.dev/api-reference/classes/Stream.html#nil)[of](https://fast-check.dev/api-reference/classes/Stream.html#of)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
