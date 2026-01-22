---
title: "GlobalParameters | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/GlobalParameters"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [GlobalParameters](https://fast-check.dev/api-reference/types/GlobalParameters.html)

# Type Alias GlobalParameters

GlobalParameters: Pick<
    [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<unknown>,
    Exclude<keyof [Parameters](https://fast-check.dev/api-reference/interfaces/Parameters.html)<unknown>, "path" | "examples">,
> & {
    afterEach?: [GlobalPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalPropertyHookFunction.html);
    asyncAfterEach?: [GlobalAsyncPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalAsyncPropertyHookFunction.html);
    asyncBeforeEach?: [GlobalAsyncPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalAsyncPropertyHookFunction.html);
    baseSize?: [Size](https://fast-check.dev/api-reference/types/Size.html);
    beforeEach?: [GlobalPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalPropertyHookFunction.html);
    defaultSizeToMaxWhenMaxSpecified?: boolean;
}

Type describing the global overrides

#### Type Declaration

* ##### `Optional`afterEach?: [GlobalPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalPropertyHookFunction.html)

  Specify a function that will be called after each execution of a property.
  It behaves as-if you manually called `afterEach` method on all the properties you execute with fast-check.

  The function will be used for both fast-check#property and fast-check#asyncProperty.
  This global override should never be used in conjunction with `asyncAfterEach`.

  #### Remarks

  Since 2.3.0
* ##### `Optional`asyncAfterEach?: [GlobalAsyncPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalAsyncPropertyHookFunction.html)

  Specify a function that will be called after each execution of an asynchronous property.
  It behaves as-if you manually called `afterEach` method on all the asynchronous properties you execute with fast-check.

  The function will be used only for fast-check#asyncProperty. It makes synchronous properties created by fast-check#property unable to run.
  This global override should never be used in conjunction with `afterEach`.

  #### Remarks

  Since 2.3.0
* ##### `Optional`asyncBeforeEach?: [GlobalAsyncPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalAsyncPropertyHookFunction.html)

  Specify a function that will be called before each execution of an asynchronous property.
  It behaves as-if you manually called `beforeEach` method on all the asynchronous properties you execute with fast-check.

  The function will be used only for fast-check#asyncProperty. It makes synchronous properties created by fast-check#property unable to run.
  This global override should never be used in conjunction with `beforeEach`.

  #### Remarks

  Since 2.3.0
* ##### `Optional`baseSize?: [Size](https://fast-check.dev/api-reference/types/Size.html)

  Define the base size to be used by arbitraries.

  By default arbitraries not specifying any size will default to it (except in some cases when used defaultSizeToMaxWhenMaxSpecified is true).
  For some arbitraries users will want to override the default and either define another size relative to this one,
  or a fixed one.

  #### Default Value

  `"small"`

  #### Remarks

  Since 2.22.0
* ##### `Optional`beforeEach?: [GlobalPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalPropertyHookFunction.html)

  Specify a function that will be called before each execution of a property.
  It behaves as-if you manually called `beforeEach` method on all the properties you execute with fast-check.

  The function will be used for both fast-check#property and fast-check#asyncProperty.
  This global override should never be used in conjunction with `asyncBeforeEach`.

  #### Remarks

  Since 2.3.0
* ##### `Optional`defaultSizeToMaxWhenMaxSpecified?: boolean

  When set to `true` and if the size has not been defined for this precise instance,
  it will automatically default to `"max"` if the user specified a upper bound for the range
  (applies to length and to depth).

  When `false`, the size will be defaulted to `baseSize` even if the user specified
  a upper bound for the range.

  #### Remarks

  Since 2.22.0

#### Remarks

Since 1.18.0

* Defined in [packages/fast-check/src/check/runner/configuration/GlobalParameters.ts:25](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/runner/configuration/GlobalParameters.ts#L25)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
