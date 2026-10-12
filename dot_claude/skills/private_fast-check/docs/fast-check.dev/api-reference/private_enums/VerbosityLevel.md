---
title: "VerbosityLevel | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/enums/VerbosityLevel"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [VerbosityLevel](https://fast-check.dev/api-reference/enums/VerbosityLevel.html)

# Enumeration VerbosityLevel

Verbosity level

#### Remarks

Since 1.9.1

* Defined in [packages/fast-check/src/check/runner/configuration/VerbosityLevel.ts:6](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/VerbosityLevel.ts#L6)

##### Index

### Enumeration Members

[None](https://fast-check.dev/api-reference/enums/VerbosityLevel.html#none)
[Verbose](https://fast-check.dev/api-reference/enums/VerbosityLevel.html#verbose)
[VeryVerbose](https://fast-check.dev/api-reference/enums/VerbosityLevel.html#veryverbose)

## Enumeration Members

### None

None: 0

Level 0 (default)

Minimal reporting:

* minimal failing case
* error log corresponding to the minimal failing case

#### Remarks

Since 1.9.1

* Defined in [packages/fast-check/src/check/runner/configuration/VerbosityLevel.ts:16](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/VerbosityLevel.ts#L16)

### Verbose

Verbose: 1

Level 1

Failures reporting:

* same as `VerbosityLevel.None`
* list all the failures encountered during the shrinking process

#### Remarks

Since 1.9.1

* Defined in [packages/fast-check/src/check/runner/configuration/VerbosityLevel.ts:26](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/VerbosityLevel.ts#L26)

### VeryVerbose

VeryVerbose: 2

Level 2

Execution flow reporting:

* same as `VerbosityLevel.None`
* all runs with their associated status displayed as a tree

#### Remarks

Since 1.9.1

* Defined in [packages/fast-check/src/check/runner/configuration/VerbosityLevel.ts:36](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/VerbosityLevel.ts#L36)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Enumeration Members

[None](https://fast-check.dev/api-reference/enums/VerbosityLevel.html#none)[Verbose](https://fast-check.dev/api-reference/enums/VerbosityLevel.html#verbose)[VeryVerbose](https://fast-check.dev/api-reference/enums/VerbosityLevel.html#veryverbose)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
