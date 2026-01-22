---
title: "assert | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/assert"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [assert](https://fast-check.dev/api-reference/functions/assert.html)

# Function assert

* assert<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts)>(property: [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts)>, params?: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts)>): Promise<void>

  Run the property, throw in case of failure

  It can be called directly from describe/it blocks of Mocha.
  No meaningful results are produced in case of success.

  WARNING: Has to be awaited

  #### Type Parameters

  + Ts

  #### Parameters

  + property: [IAsyncProperty](https://fast-check.dev/api-reference/interfaces/IAsyncProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts)>

    Asynchronous property to be checked
  + `Optional`params: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts)>

    Optional parameters to customize the execution

  #### Returns Promise<void>

  #### Remarks

  Since 0.0.7

  + Defined in [packages/fast-check/src/check/runner/Runner.ts:146](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/Runner.ts#L146)
* assert<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts-1)>(property: [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts-1)>, params?: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts-1)>): void

  Run the property, throw in case of failure

  It can be called directly from describe/it blocks of Mocha.
  No meaningful results are produced in case of success.

  #### Type Parameters

  + Ts

  #### Parameters

  + property: [IProperty](https://fast-check.dev/api-reference/interfaces/IProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts-1)>

    Synchronous property to be checked
  + `Optional`params: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts-1)>

    Optional parameters to customize the execution

  #### Returns void

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/check/runner/Runner.ts:159](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/Runner.ts#L159)
* assert<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts-2)>(
      property: [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts-2)>,
      params?: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts-2)>,
  ): void | Promise<void>

  Run the property, throw in case of failure

  It can be called directly from describe/it blocks of Mocha.
  No meaningful results are produced in case of success.

  WARNING: Returns a promise to be awaited if the property is asynchronous

  #### Type Parameters

  + Ts

  #### Parameters

  + property: [IRawProperty](https://fast-check.dev/api-reference/interfaces/IRawProperty.html)<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts-2)>

    Synchronous or asynchronous property to be checked
  + `Optional`params: [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<[Ts](https://fast-check.dev/api-reference/functions/assert.html#assertts-2)>

    Optional parameters to customize the execution

  #### Returns void | Promise<void>

  #### Remarks

  Since 0.0.7

  + Defined in [packages/fast-check/src/check/runner/Runner.ts:174](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/Runner.ts#L174)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
