---
title: "check | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/check"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [check](https://fast-check.dev/api-reference/functions/check.html)

# Function check

* check<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts)>(
      property: [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts)>,
      params?: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts)>,
  ): Promise<[RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts)>>

  Run the property, do not throw contrary to [assert](https://fast-check.dev/api-reference/functions/assert.html)

  WARNING: Has to be awaited

  #### Type Parameters

  + Ts

  #### Parameters

  + property: [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts)>

    Asynchronous property to be checked
  + `Optional`params: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts)>

    Optional parameters to customize the execution

  #### Returns Promise<[RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts)>>

  Test status and other useful details

  #### Remarks

  Since 0.0.7

  + Defined in [packages/fast-check/src/check/runner/Runner.ts:69](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/Runner.ts#L69)
* check<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-1)>(property: [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-1)>, params?: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-1)>): [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-1)>

  Run the property, do not throw contrary to [assert](https://fast-check.dev/api-reference/functions/assert.html)

  #### Type Parameters

  + Ts

  #### Parameters

  + property: [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-1)>

    Synchronous property to be checked
  + `Optional`params: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-1)>

    Optional parameters to customize the execution

  #### Returns [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-1)>

  Test status and other useful details

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/check/runner/Runner.ts:81](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/Runner.ts#L81)
* check<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-2)>(
      property: [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-2)>,
      params?: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-2)>,
  ): [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-2)> | Promise<[RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-2)>>

  Run the property, do not throw contrary to [assert](https://fast-check.dev/api-reference/functions/assert.html)

  WARNING: Has to be awaited if the property is asynchronous

  #### Type Parameters

  + Ts

  #### Parameters

  + property: [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-2)>

    Property to be checked
  + `Optional`params: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-2)>

    Optional parameters to customize the execution

  #### Returns [RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-2)> | Promise<[RunDetails](https://fast-check.dev/api-reference/types/RunDetails.html)<[Ts](https://fast-check.dev/api-reference/functions/check.html#checkts-2)>>

  Test status and other useful details

  #### Remarks

  Since 0.0.7

  + Defined in [packages/fast-check/src/check/runner/Runner.ts:95](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/Runner.ts#L95)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
