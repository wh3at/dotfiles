---
title: "RunDetailsSuccess | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [RunDetailsSuccess](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html)

# Interface RunDetailsSuccess<Ts>

Run reported as success

Refer to [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html) for more details

#### Remarks

Since 1.25.0

interface RunDetailsSuccess<[Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#ts)> {
    [counterexample](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#counterexample): null;
    [counterexamplePath](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#counterexamplepath): null;
    [errorInstance](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#errorinstance): null;
    [executionSummary](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#executionsummary): [ExecutionTree](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html)<[Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#ts)>[];
    [failed](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#failed): false;
    [failures](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#failures): [Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#ts)[];
    [interrupted](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#interrupted): boolean;
    [numRuns](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#numruns): number;
    [numShrinks](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#numshrinks): number;
    [numSkips](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#numskips): number;
    [runConfiguration](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#runconfiguration): [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#ts)>;
    [seed](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#seed): number;
    [verbose](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#verbose): [VerbosityLevel](https://fast-check.dev/api-reference/enums/VerbosityLevel.html);
}

#### Type Parameters

* Ts

#### Hierarchy ([View Summary](https://fast-check.dev/api-reference/hierarchy.html#RunDetailsSuccess))

* [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html)<[Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#ts)>
  + RunDetailsSuccess

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:78](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L78)

##### Index

### Properties

[counterexample](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#counterexample)
[counterexamplePath](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#counterexamplepath)
[errorInstance](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#errorinstance)
[executionSummary](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#executionsummary)
[failed](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#failed)
[failures](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#failures)
[interrupted](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#interrupted)
[numRuns](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#numruns)
[numShrinks](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#numshrinks)
[numSkips](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#numskips)
[runConfiguration](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#runconfiguration)
[seed](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#seed)
[verbose](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#verbose)

## Properties

### counterexample

counterexample: null

In case of failure: the counterexample contains the minimal failing case (first failure after shrinking)

#### Remarks

Since 0.0.7

Overrides [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html).[counterexample](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#counterexample)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:81](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L81)

### counterexamplePath

counterexamplePath: null

In case of failure: path to the counterexample

For replay purposes, it can be forced in [assert](https://fast-check.dev/api-reference/functions/assert.html), [check](https://fast-check.dev/api-reference/functions/check.html), [sample](https://fast-check.dev/api-reference/functions/sample.html) and [statistics](https://fast-check.dev/api-reference/functions/statistics.html) using `Parameters`

#### Remarks

Since 1.0.0

Overrides [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html).[counterexamplePath](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#counterexamplepath)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:82](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L82)

### errorInstance

errorInstance: null

In case of failure: it contains the error that has been thrown if any

#### Remarks

Since 3.0.0

Overrides [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html).[errorInstance](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#errorinstance)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:83](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L83)

### executionSummary

executionSummary: [ExecutionTree](https://fast-check.dev/api-reference/interfaces/ExecutionTree.html)<[Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#ts)>[]

Execution summary of the run

Traces the origin of each value encountered during the test and its execution status.
Can help to diagnose shrinking issues.

You must enable verbose with at least `Verbosity.Verbose` in `Parameters`
in order to have values in it:

* Verbose: Only failures
* VeryVerbose: Failures, Successes and Skipped

#### Remarks

Since 1.9.0

Inherited from [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html).[executionSummary](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#executionsummary)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:172](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L172)

### failed

failed: false

Does the property failed during the execution of [check](https://fast-check.dev/api-reference/functions/check.html)?

#### Remarks

Since 0.0.7

Overrides [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html).[failed](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#failed)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:79](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L79)

### failures

failures: [Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#ts)[]

List all failures that have occurred during the run

You must enable verbose with at least `Verbosity.Verbose` in `Parameters`
in order to have values in it

#### Remarks

Since 1.1.0

Inherited from [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html).[failures](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#failures)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:158](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L158)

### interrupted

interrupted: boolean

Was the execution interrupted?

#### Remarks

Since 1.19.0

Overrides [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html).[interrupted](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#interrupted)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:80](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L80)

### numRuns

numRuns: number

Number of runs

* In case of failed property: Number of runs up to the first failure (including the failure run)
* Otherwise: Number of successful executions

#### Remarks

Since 1.0.0

Inherited from [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html).[numRuns](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#numruns)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:110](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L110)

### numShrinks

numShrinks: number

Number of shrinks required to get to the minimal failing case (aka counterexample)

#### Remarks

Since 1.0.0

Inherited from [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html).[numShrinks](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#numshrinks)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:124](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L124)

### numSkips

numSkips: number

Number of skipped entries due to failed pre-condition

As `numRuns` it only takes into account the skipped values that occured before the first failure.
Refer to [pre](https://fast-check.dev/api-reference/functions/pre.html) to add such pre-conditions.

#### Remarks

Since 1.3.0

Inherited from [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html).[numSkips](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#numskips)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:119](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L119)

### runConfiguration

runConfiguration: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#ts)>

Configuration of the run

It includes both local parameters set on [check](https://fast-check.dev/api-reference/functions/check.html) or [assert](https://fast-check.dev/api-reference/functions/assert.html)
and global ones specified using [configureGlobal](https://fast-check.dev/api-reference/functions/configureGlobal.html)

#### Remarks

Since 1.25.0

Inherited from [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html).[runConfiguration](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#runconfiguration)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:186](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L186)

### seed

seed: number

Seed that have been used by the run

It can be forced in [assert](https://fast-check.dev/api-reference/functions/assert.html), [check](https://fast-check.dev/api-reference/functions/check.html), [sample](https://fast-check.dev/api-reference/functions/sample.html) and [statistics](https://fast-check.dev/api-reference/functions/statistics.html) using `Parameters`

#### Remarks

Since 0.0.7

Inherited from [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html).[seed](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#seed)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:131](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L131)

### verbose

verbose: [VerbosityLevel](https://fast-check.dev/api-reference/enums/VerbosityLevel.html)

Verbosity level required by the user

#### Remarks

Since 1.9.0

Inherited from [RunDetailsCommon](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html).[verbose](https://fast-check.dev/api-reference/interfaces/RunDetailsCommon.html#verbose)

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:177](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L177)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[counterexample](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#counterexample)[counterexamplePath](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#counterexamplepath)[errorInstance](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#errorinstance)[executionSummary](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#executionsummary)[failed](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#failed)[failures](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#failures)[interrupted](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#interrupted)[numRuns](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#numruns)[numShrinks](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#numshrinks)[numSkips](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#numskips)[runConfiguration](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#runconfiguration)[seed](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#seed)[verbose](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html#verbose)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
