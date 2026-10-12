---
title: "Parameters | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/Parameters"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)

# Interface Parameters<T>

Customization of the parameters used to run the properties

#### Remarks

Since 0.0.6

interface Parameters<[T](https://fast-check.dev/api-reference/interfaces/Parameters.html#t) = void> {
    [asyncReporter](https://fast-check.dev/api-reference/interfaces/Parameters.html#asyncreporter)?: (runDetails: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[T](https://fast-check.dev/api-reference/interfaces/Parameters.html#t)>) => Promise<void>;
    [endOnFailure](https://fast-check.dev/api-reference/interfaces/Parameters.html#endonfailure)?: boolean;
    [examples](https://fast-check.dev/api-reference/interfaces/Parameters.html#examples)?: [T](https://fast-check.dev/api-reference/interfaces/Parameters.html#t)[];
    [ignoreEqualValues](https://fast-check.dev/api-reference/interfaces/Parameters.html#ignoreequalvalues)?: boolean;
    [includeErrorInReport](https://fast-check.dev/api-reference/interfaces/Parameters.html#includeerrorinreport)?: boolean;
    [interruptAfterTimeLimit](https://fast-check.dev/api-reference/interfaces/Parameters.html#interruptaftertimelimit)?: number;
    [markInterruptAsFailure](https://fast-check.dev/api-reference/interfaces/Parameters.html#markinterruptasfailure)?: boolean;
    [maxSkipsPerRun](https://fast-check.dev/api-reference/interfaces/Parameters.html#maxskipsperrun)?: number;
    [numRuns](https://fast-check.dev/api-reference/interfaces/Parameters.html#numruns)?: number;
    [path](https://fast-check.dev/api-reference/interfaces/Parameters.html#path)?: string;
    [randomType](https://fast-check.dev/api-reference/interfaces/Parameters.html#randomtype)?: [RandomType](https://fast-check.dev/api-reference/types/RandomType.html) | ((seed: number) => RandomGenerator);
    [reporter](https://fast-check.dev/api-reference/interfaces/Parameters.html#reporter)?: (runDetails: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[T](https://fast-check.dev/api-reference/interfaces/Parameters.html#t)>) => void;
    [seed](https://fast-check.dev/api-reference/interfaces/Parameters.html#seed)?: number;
    [skipAllAfterTimeLimit](https://fast-check.dev/api-reference/interfaces/Parameters.html#skipallaftertimelimit)?: number;
    [skipEqualValues](https://fast-check.dev/api-reference/interfaces/Parameters.html#skipequalvalues)?: boolean;
    [timeout](https://fast-check.dev/api-reference/interfaces/Parameters.html#timeout)?: number;
    [unbiased](https://fast-check.dev/api-reference/interfaces/Parameters.html#unbiased)?: boolean;
    [verbose](https://fast-check.dev/api-reference/interfaces/Parameters.html#verbose)?: boolean | [VerbosityLevel](https://fast-check.dev/api-reference/enums/VerbosityLevel.html);
    [logger](https://fast-check.dev/api-reference/interfaces/Parameters.html#logger-1)?(v: string): void;
}

#### Type Parameters

* T = void

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:11](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L11)

##### Index

### Properties

[asyncReporter?](https://fast-check.dev/api-reference/interfaces/Parameters.html#asyncreporter)
[endOnFailure?](https://fast-check.dev/api-reference/interfaces/Parameters.html#endonfailure)
[examples?](https://fast-check.dev/api-reference/interfaces/Parameters.html#examples)
[ignoreEqualValues?](https://fast-check.dev/api-reference/interfaces/Parameters.html#ignoreequalvalues)
[includeErrorInReport?](https://fast-check.dev/api-reference/interfaces/Parameters.html#includeerrorinreport)
[interruptAfterTimeLimit?](https://fast-check.dev/api-reference/interfaces/Parameters.html#interruptaftertimelimit)
[markInterruptAsFailure?](https://fast-check.dev/api-reference/interfaces/Parameters.html#markinterruptasfailure)
[maxSkipsPerRun?](https://fast-check.dev/api-reference/interfaces/Parameters.html#maxskipsperrun)
[numRuns?](https://fast-check.dev/api-reference/interfaces/Parameters.html#numruns)
[path?](https://fast-check.dev/api-reference/interfaces/Parameters.html#path)
[randomType?](https://fast-check.dev/api-reference/interfaces/Parameters.html#randomtype)
[reporter?](https://fast-check.dev/api-reference/interfaces/Parameters.html#reporter)
[seed?](https://fast-check.dev/api-reference/interfaces/Parameters.html#seed)
[skipAllAfterTimeLimit?](https://fast-check.dev/api-reference/interfaces/Parameters.html#skipallaftertimelimit)
[skipEqualValues?](https://fast-check.dev/api-reference/interfaces/Parameters.html#skipequalvalues)
[timeout?](https://fast-check.dev/api-reference/interfaces/Parameters.html#timeout)
[unbiased?](https://fast-check.dev/api-reference/interfaces/Parameters.html#unbiased)
[verbose?](https://fast-check.dev/api-reference/interfaces/Parameters.html#verbose)

### Methods

[logger?](https://fast-check.dev/api-reference/interfaces/Parameters.html#logger)

## Properties

### `Optional`asyncReporter

asyncReporter?: (runDetails: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[T](https://fast-check.dev/api-reference/interfaces/Parameters.html#t)>) => Promise<void>

Replace the default reporter handling errors by a custom one

Reporter is responsible to throw in case of failure: default one throws whenever `runDetails.failed` is true.
But you may want to change this behaviour in yours.

Only used when calling [assert](https://fast-check.dev/api-reference/functions/assert.html)
Cannot be defined in conjonction with `reporter`
Not compatible with synchronous properties: runner will throw

#### Remarks

Since 1.25.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:193](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L193)

### `Optional`endOnFailure

endOnFailure?: boolean

Stop run on failure

It makes the run stop at the first encountered failure without shrinking.

When used in complement to `seed` and `path`,
it replays only the minimal counterexample.

#### Remarks

Since 1.11.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:168](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L168)

### `Optional`examples

examples?: [T](https://fast-check.dev/api-reference/interfaces/Parameters.html#t)[]

Custom values added at the beginning of generated ones

It enables users to come with examples they want to test at every run

#### Remarks

Since 1.4.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:157](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L157)

### `Optional`ignoreEqualValues

ignoreEqualValues?: boolean

Discard runs corresponding to already tried values.

WARNING:
Discarded runs will not be replaced.
In other words, if you ask for 100 runs and have 2 discarded runs you will only have 98 effective runs.

NOTE: Relies on `fc.stringify` to check the equality.

#### Remarks

Since 2.14.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:122](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L122)

### `Optional`includeErrorInReport

includeErrorInReport?: boolean

By default the Error causing the failure of the predicate will not be directly exposed within the message
of the Error thown by fast-check. It will be exposed by a cause field attached to the Error.

The Error with cause has been supported by Node since 16.14.0 and is properly supported in many test runners.

But if the original Error fails to appear within your test runner,
Or if you prefer the Error to be included directly as part of the message of the resulted Error,
you can toggle this flag and the Error produced by fast-check in case of failure will expose the source Error
as part of the message and not as a cause.

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:205](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L205)

### `Optional`interruptAfterTimeLimit

interruptAfterTimeLimit?: number

Interrupt test execution after a given time limit: disabled by default

NOTE: Relies on `Date.now()`.

NOTE:
Useful to avoid having too long running processes in your CI.
Replay capability (see `seed`, `path`) can still be used if needed.

WARNING:
If the test got interrupted before any failure occured
and before it reached the requested number of runs specified by `numRuns`
it will be marked as success. Except if `markInterruptAsFailure` has been set to `true`

#### Remarks

Since 1.19.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:91](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L91)

### `Optional`markInterruptAsFailure

markInterruptAsFailure?: boolean

Mark interrupted runs as failed runs if preceded by one success or more: disabled by default
Interrupted with no success at all always defaults to failure whatever the value of this flag.

#### Remarks

Since 1.19.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:97](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L97)

### `Optional`maxSkipsPerRun

maxSkipsPerRun?: number

Maximal number of skipped values per run

Skipped is considered globally, so this value is used to compute maxSkips = maxSkipsPerRun \* numRuns.
Runner will consider a run to have failed if it skipped maxSkips+1 times before having generated numRuns valid entries.

See [pre](https://fast-check.dev/api-reference/functions/pre.html) for more details on pre-conditions

#### Remarks

Since 1.3.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:51](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L51)

### `Optional`numRuns

numRuns?: number

Number of runs before success: 100 by default

#### Remarks

Since 1.0.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:40](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L40)

### `Optional`path

path?: string

Way to replay a failing property directly with the counterexample.
It can be fed with the counterexamplePath returned by the failing test (requires `seed` too).

#### Remarks

Since 1.0.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:128](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L128)

### `Optional`randomType

randomType?: [RandomType](https://fast-check.dev/api-reference/types/RandomType.html) | ((seed: number) => RandomGenerator)

Random number generator: `xorshift128plus` by default

Random generator is the core element behind the generation of random values - changing it might directly impact the quality and performances of the generation of random values.
It can be one of: 'mersenne', 'congruential', 'congruential32', 'xorshift128plus', 'xoroshiro128plus'
Or any function able to build a `RandomGenerator` based on a seed

As required since pure-rand v6.0.0, when passing a builder for RandomGenerator,
the random number generator must generate values between -0x80000000 and 0x7fffffff.

#### Remarks

Since 1.6.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:35](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L35)

### `Optional`reporter

reporter?: (runDetails: [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[T](https://fast-check.dev/api-reference/interfaces/Parameters.html#t)>) => void

Replace the default reporter handling errors by a custom one

Reporter is responsible to throw in case of failure: default one throws whenever `runDetails.failed` is true.
But you may want to change this behaviour in yours.

Only used when calling [assert](https://fast-check.dev/api-reference/functions/assert.html)
Cannot be defined in conjonction with `asyncReporter`

#### Remarks

Since 1.25.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:180](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L180)

### `Optional`seed

seed?: number

Initial seed of the generator: `Date.now()` by default

It can be forced to replay a failed run.

In theory, seeds are supposed to be 32-bit integers.
In case of double value, the seed will be rescaled into a valid 32-bit integer (eg.: values between 0 and 1 will be evenly spread into the range of possible seeds).

#### Remarks

Since 0.0.6

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:22](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L22)

### `Optional`skipAllAfterTimeLimit

skipAllAfterTimeLimit?: number

Skip all runs after a given time limit: disabled by default

NOTE: Relies on `Date.now()`.

NOTE:
Useful to stop too long shrinking processes.
Replay capability (see `seed`, `path`) can resume the shrinking.

WARNING:
It skips runs. Thus test might be marked as failed.
Indeed, it might not reached the requested number of successful runs.

#### Remarks

Since 1.15.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:74](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L74)

### `Optional`skipEqualValues

skipEqualValues?: boolean

Skip runs corresponding to already tried values.

WARNING:
Discarded runs will be retried. Under the hood they are simple calls to `fc.pre`.
In other words, if you ask for 100 runs but your generator can only generate 10 values then the property will fail as 100 runs will never be reached.
Contrary to `ignoreEqualValues` you always have the number of runs you requested.

NOTE: Relies on `fc.stringify` to check the equality.

#### Remarks

Since 2.14.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:110](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L110)

### `Optional`timeout

timeout?: number

Maximum time in milliseconds for the predicate to answer: disabled by default

WARNING: Only works for async code (see [asyncProperty](https://fast-check.dev/api-reference/functions/asyncProperty.html)), will not interrupt a synchronous code.

#### Remarks

Since 0.0.11

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:58](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L58)

### `Optional`unbiased

unbiased?: boolean

Force the use of unbiased arbitraries: biased by default

#### Remarks

Since 1.1.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:138](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L138)

### `Optional`verbose

verbose?: boolean | [VerbosityLevel](https://fast-check.dev/api-reference/enums/VerbosityLevel.html)

Enable verbose mode: [VerbosityLevel.None](https://fast-check.dev/api-reference/enums/VerbosityLevel.html#none) by default

Using `verbose: true` is equivalent to `verbose: VerbosityLevel.Verbose`

It can prove very useful to troubleshoot issues.
See [VerbosityLevel](https://fast-check.dev/api-reference/enums/VerbosityLevel.html) for more details on each level.

#### Remarks

Since 1.1.0

* Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:149](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L149)

## Methods

### `Optional`logger

* logger?(v: string): void

  Logger (see [statistics](https://fast-check.dev/api-reference/functions/statistics.html)): `console.log` by default

  #### Parameters

  + v: string

  #### Returns void

  #### Remarks

  Since 0.0.6

  + Defined in [packages/fast-check/src/check/runner/configuration/Parameters.ts:133](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/Parameters.ts#L133)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[asyncReporter](https://fast-check.dev/api-reference/interfaces/Parameters.html#asyncreporter)[endOnFailure](https://fast-check.dev/api-reference/interfaces/Parameters.html#endonfailure)[examples](https://fast-check.dev/api-reference/interfaces/Parameters.html#examples)[ignoreEqualValues](https://fast-check.dev/api-reference/interfaces/Parameters.html#ignoreequalvalues)[includeErrorInReport](https://fast-check.dev/api-reference/interfaces/Parameters.html#includeerrorinreport)[interruptAfterTimeLimit](https://fast-check.dev/api-reference/interfaces/Parameters.html#interruptaftertimelimit)[markInterruptAsFailure](https://fast-check.dev/api-reference/interfaces/Parameters.html#markinterruptasfailure)[maxSkipsPerRun](https://fast-check.dev/api-reference/interfaces/Parameters.html#maxskipsperrun)[numRuns](https://fast-check.dev/api-reference/interfaces/Parameters.html#numruns)[path](https://fast-check.dev/api-reference/interfaces/Parameters.html#path)[randomType](https://fast-check.dev/api-reference/interfaces/Parameters.html#randomtype)[reporter](https://fast-check.dev/api-reference/interfaces/Parameters.html#reporter)[seed](https://fast-check.dev/api-reference/interfaces/Parameters.html#seed)[skipAllAfterTimeLimit](https://fast-check.dev/api-reference/interfaces/Parameters.html#skipallaftertimelimit)[skipEqualValues](https://fast-check.dev/api-reference/interfaces/Parameters.html#skipequalvalues)[timeout](https://fast-check.dev/api-reference/interfaces/Parameters.html#timeout)[unbiased](https://fast-check.dev/api-reference/interfaces/Parameters.html#unbiased)[verbose](https://fast-check.dev/api-reference/interfaces/Parameters.html#verbose)

Methods

[logger](https://fast-check.dev/api-reference/interfaces/Parameters.html#logger)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
