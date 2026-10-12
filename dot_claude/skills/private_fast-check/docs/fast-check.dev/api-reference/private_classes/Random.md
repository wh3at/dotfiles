---
title: "Random | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/classes/Random"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [Random](https://fast-check.dev/api-reference/classes/Random.html)

# Class Random

Wrapper around an instance of a `pure-rand`'s random number generator
offering a simpler interface to deal with random with impure patterns

* Defined in [packages/fast-check/src/random/generator/Random.ts:10](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/random/generator/Random.ts#L10)

##### Index

### Constructors

[constructor](https://fast-check.dev/api-reference/classes/Random.html#constructor)

### Methods

[clone](https://fast-check.dev/api-reference/classes/Random.html#clone)
[getState](https://fast-check.dev/api-reference/classes/Random.html#getstate)
[next](https://fast-check.dev/api-reference/classes/Random.html#next)
[nextBigInt](https://fast-check.dev/api-reference/classes/Random.html#nextbigint)
[nextBoolean](https://fast-check.dev/api-reference/classes/Random.html#nextboolean)
[nextDouble](https://fast-check.dev/api-reference/classes/Random.html#nextdouble)
[nextInt](https://fast-check.dev/api-reference/classes/Random.html#nextint)

## Constructors

### constructor

* new Random(sourceRng: RandomGenerator): [Random](https://fast-check.dev/api-reference/classes/Random.html)

  Create a mutable random number generator by cloning the passed one and mutate it

  #### Parameters

  + sourceRng: RandomGenerator

    Immutable random generator from pure-rand library, will not be altered (a clone will be)

  #### Returns [Random](https://fast-check.dev/api-reference/classes/Random.html)

  + Defined in [packages/fast-check/src/random/generator/Random.ts:23](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/random/generator/Random.ts#L23)

## Methods

### clone

* clone(): [Random](https://fast-check.dev/api-reference/classes/Random.html)

  Clone the random number generator

  #### Returns [Random](https://fast-check.dev/api-reference/classes/Random.html)

  + Defined in [packages/fast-check/src/random/generator/Random.ts:30](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/random/generator/Random.ts#L30)

### getState

* getState(): readonly number[] | undefined

  Extract the internal state of the internal RandomGenerator backing the current instance of Random

  #### Returns readonly number[] | undefined

  + Defined in [packages/fast-check/src/random/generator/Random.ts:90](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/random/generator/Random.ts#L90)

### next

* next(bits: number): number

  Generate an integer having `bits` random bits

  #### Parameters

  + bits: number

    Number of bits to generate

  #### Returns number

  + Defined in [packages/fast-check/src/random/generator/Random.ts:38](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/random/generator/Random.ts#L38)

### nextBigInt

* nextBigInt(min: bigint, max: bigint): bigint

  Generate a random bigint between min (included) and max (included)

  #### Parameters

  + min: bigint

    Minimal bigint value
  + max: bigint

    Maximal bigint value

  #### Returns bigint

  + Defined in [packages/fast-check/src/random/generator/Random.ts:74](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/random/generator/Random.ts#L74)

### nextBoolean

* nextBoolean(): boolean

  Generate a random boolean

  #### Returns boolean

  + Defined in [packages/fast-check/src/random/generator/Random.ts:46](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/random/generator/Random.ts#L46)

### nextDouble

* nextDouble(): number

  Generate a random floating point number between 0.0 (included) and 1.0 (excluded)

  #### Returns number

  + Defined in [packages/fast-check/src/random/generator/Random.ts:81](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/random/generator/Random.ts#L81)

### nextInt

* nextInt(): number

  Generate a random integer (32 bits)

  #### Returns number

  + Defined in [packages/fast-check/src/random/generator/Random.ts:53](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/random/generator/Random.ts#L53)
* nextInt(min: number, max: number): number

  Generate a random integer between min (included) and max (included)

  #### Parameters

  + min: number

    Minimal integer value
  + max: number

    Maximal integer value

  #### Returns number

  + Defined in [packages/fast-check/src/random/generator/Random.ts:60](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/random/generator/Random.ts#L60)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Constructors

[constructor](https://fast-check.dev/api-reference/classes/Random.html#constructor)

Methods

[clone](https://fast-check.dev/api-reference/classes/Random.html#clone)[getState](https://fast-check.dev/api-reference/classes/Random.html#getstate)[next](https://fast-check.dev/api-reference/classes/Random.html#next)[nextBigInt](https://fast-check.dev/api-reference/classes/Random.html#nextbigint)[nextBoolean](https://fast-check.dev/api-reference/classes/Random.html#nextboolean)[nextDouble](https://fast-check.dev/api-reference/classes/Random.html#nextdouble)[nextInt](https://fast-check.dev/api-reference/classes/Random.html#nextint)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
