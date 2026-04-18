---
title: "DepthContext | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/DepthContext"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [DepthContext](https://fast-check.dev/api-reference/types/DepthContext.html)

# Type Alias DepthContext

Instance of depth, can be used to alter the depth perceived by an arbitrary
or to bias your own arbitraries based on the current depth

#### Remarks

Since 2.25.0

type DepthContext = {
    [depth](https://fast-check.dev/api-reference/types/DepthContext.html#depth): number;
}

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/DepthContext.ts:28](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/DepthContext.ts#L28)

##### Index

### Properties

[depth](https://fast-check.dev/api-reference/types/DepthContext.html#depth)

## Properties

### depth

depth: number

Current depth (starts at 0, continues with 1, 2...).
Only made of integer values superior or equal to 0.

Remark: Whenever altering the `depth` during a `generate`, please make sure to ALWAYS
reset it to its original value before you leave the `generate`. Otherwise the execution
will imply side-effects that will potentially impact the following runs and make replay
of the issue barely impossible.

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/DepthContext.ts:38](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/DepthContext.ts#L38)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[depth](https://fast-check.dev/api-reference/types/DepthContext.html#depth)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
