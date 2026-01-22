---
title: "RunDetails | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/RunDetails"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)

# Type Alias RunDetails<Ts>

RunDetails:
    | [RunDetailsFailureProperty](https://fast-check.dev/api-reference/interfaces/RunDetailsFailureProperty.html)<[Ts](https://fast-check.dev/api-reference/types/RunDetails.html#ts)>
    | [RunDetailsFailureTooManySkips](https://fast-check.dev/api-reference/interfaces/RunDetailsFailureTooManySkips.html)<[Ts](https://fast-check.dev/api-reference/types/RunDetails.html#ts)>
    | [RunDetailsFailureInterrupted](https://fast-check.dev/api-reference/interfaces/RunDetailsFailureInterrupted.html)<[Ts](https://fast-check.dev/api-reference/types/RunDetails.html#ts)>
    | [RunDetailsSuccess](https://fast-check.dev/api-reference/interfaces/RunDetailsSuccess.html)<[Ts](https://fast-check.dev/api-reference/types/RunDetails.html#ts)>

Post-run details produced by [check](https://fast-check.dev/api-reference/functions/check.html)

A failing property can easily detected by checking the `failed` flag of this structure

#### Type Parameters

* Ts

#### Remarks

Since 0.0.7

* Defined in [packages/fast-check/src/check/runner/reporter/RunDetails.ts:13](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/reporter/RunDetails.ts#L13)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
