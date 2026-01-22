---
title: "RunDetailsCommon | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/RunDetailsCommon"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html)

# Interface RunDetailsCommon<Ts>

Shared part between variants of RunDetails

#### Remarks

Since 2.2.0

interface RunDetailsCommon<[Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#ts)> {
    [counterexample](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#counterexample): [Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#ts) | null;
    [counterexamplePath](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#counterexamplepath): string | null;
    [errorInstance](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#errorinstance): unknown;
    [executionSummary](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#executionsummary): [ExecutionTree](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html)<[Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#ts)>[];
    [failed](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#failed): boolean;
    [failures](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#failures): [Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#ts)[];
    [interrupted](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#interrupted): boolean;
    [numRuns](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#numruns): number;
    [numShrinks](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#numshrinks): number;
    [numSkips](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#numskips): number;
    [runConfiguration](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#runconfiguration): [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#ts)>;
    [seed](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#seed): number;
    [verbose](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#verbose): [VerbosityLevel](https://fast-check.dev/api-reference/enums/VerbosityLevel.html);
}

#### Type Parameters

* Ts

#### Hierarchy ([View Summary](https://fast-check.dev/api-reference/hierarchy.html#RunDetailsCommon))

* RunDetailsCommon
  + [RunDetailsFailureProperty](https://fast-check.dev/api-reference/interfaces/RunDetailsFailureProperty.html)
  + [RunDetailsFailureTooManySkips](https://fast-check.dev/api-reference/interfaces/RunDetailsFailureTooManySkips.html)
  + [RunDetailsFailureInterrupted](https://fast-check.dev/api-reference/interfaces/RunDetailsFailureInterrupted.html)
  + [RunDetailsSuccess](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:91](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L91)

##### Index

### Properties

[counterexample](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#counterexample)
[counterexamplePath](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#counterexamplepath)
[errorInstance](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#errorinstance)
[executionSummary](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#executionsummary)
[failed](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#failed)
[failures](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#failures)
[interrupted](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#interrupted)
[numRuns](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#numruns)
[numShrinks](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#numshrinks)
[numSkips](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#numskips)
[runConfiguration](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#runconfiguration)
[seed](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#seed)
[verbose](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#verbose)

## Properties

### counterexample

counterexample: [Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#ts) | null

In case of failure: the counterexample contains the minimal failing case (first failure after shrinking)

#### Remarks

Since 0.0.7

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:136](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L136)

### counterexamplePath

counterexamplePath: string | null

In case of failure: path to the counterexample

For replay purposes, it can be forced in [assert](https://fast-check.dev/api-reference/functions/assert.html), [check](https://fast-check.dev/api-reference/functions/check.html), [sample](https://fast-check.dev/api-reference/functions/sample.html) and [statistics](https://fast-check.dev/api-reference/functions/statistics.html) using `Parameters`

#### Remarks

Since 1.0.0

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:149](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L149)

### errorInstance

errorInstance: unknown

In case of failure: it contains the error that has been thrown if any

#### Remarks

Since 3.0.0

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:141](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L141)

### executionSummary

executionSummary: [ExecutionTree](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html)<[Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#ts)>[]

Execution summary of the run

Traces the origin of each value encountered during the test and its execution status.
Can help to diagnose shrinking issues.

You must enable verbose with at least `Verbosity.Verbose` in `Parameters`
in order to have values in it:

* Verbose: Only failures
* VeryVerbose: Failures, Successes and Skipped

#### Remarks

Since 1.9.0

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:172](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L172)

### failed

failed: boolean

Does the property failed during the execution of [check](https://fast-check.dev/api-reference/functions/check.html)?

#### Remarks

Since 0.0.7

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:96](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L96)

### failures

failures: [Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#ts)[]

List all failures that have occurred during the run

You must enable verbose with at least `Verbosity.Verbose` in `Parameters`
in order to have values in it

#### Remarks

Since 1.1.0

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:158](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L158)

### interrupted

interrupted: boolean

Was the execution interrupted?

#### Remarks

Since 1.19.0

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:101](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L101)

### numRuns

numRuns: number

Number of runs

* In case of failed property: Number of runs up to the first failure (including the failure run)
* Otherwise: Number of successful executions

#### Remarks

Since 1.0.0

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:110](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L110)

### numShrinks

numShrinks: number

Number of shrinks required to get to the minimal failing case (aka counterexample)

#### Remarks

Since 1.0.0

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:124](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L124)

### numSkips

numSkips: number

Number of skipped entries due to failed pre-condition

As `numRuns` it only takes into account the skipped values that occured before the first failure.
Refer to [pre](https://fast-check.dev/api-reference/functions/pre.html) to add such pre-conditions.

#### Remarks

Since 1.3.0

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:119](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L119)

### runConfiguration

runConfiguration: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#ts)>

Configuration of the run

It includes both local parameters set on [check](https://fast-check.dev/api-reference/functions/check.html) or [assert](https://fast-check.dev/api-reference/functions/assert.html)
and global ones specified using [configureGlobal](https://fast-check.dev/api-reference/functions/configureGlobal.html)

#### Remarks

Since 1.25.0

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:186](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L186)

### seed

seed: number

Seed that have been used by the run

It can be forced in [assert](https://fast-check.dev/api-reference/functions/assert.html), [check](https://fast-check.dev/api-reference/functions/check.html), [sample](https://fast-check.dev/api-reference/functions/sample.html) and [statistics](https://fast-check.dev/api-reference/functions/statistics.html) using `Parameters`

#### Remarks

Since 0.0.7

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:131](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L131)

### verbose

verbose: [VerbosityLevel](https://fast-check.dev/api-reference/enums/VerbosityLevel.html)

Verbosity level required by the user

#### Remarks

Since 1.9.0

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:177](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L177)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[counterexample](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#counterexample)[counterexamplePath](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#counterexamplepath)[errorInstance](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#errorinstance)[executionSummary](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#executionsummary)[failed](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#failed)[failures](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#failures)[interrupted](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#interrupted)[numRuns](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#numruns)[numShrinks](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#numshrinks)[numSkips](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#numskips)[runConfiguration](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#runconfiguration)[seed](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#seed)[verbose](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#verbose)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
