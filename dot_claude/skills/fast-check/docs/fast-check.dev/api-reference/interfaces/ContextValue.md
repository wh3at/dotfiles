---
title: "ContextValue | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/ContextValue"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [ContextValue](https://fast-check.dev/api-reference/interfaces/ContextValue.html)

# Interface ContextValue

Execution context attached to one predicate run

#### Remarks

Since 2.2.0

interface ContextValue {
    [log](https://fast-check.dev/api-reference/interfaces/ContextValue.html#log-1)(data: string): void;
    [size](https://fast-check.dev/api-reference/interfaces/ContextValue.html#size-1)(): number;
}

* Defined in [packages/fast-check/src/arbitrary/context.ts:10](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/context.ts#L10)

##### Index

### Methods

[log](https://fast-check.dev/api-reference/interfaces/ContextValue.html#log)
[size](https://fast-check.dev/api-reference/interfaces/ContextValue.html#size)

## Methods

### log

* log(data: string): void

  Log execution details during a test.
  Very helpful when troubleshooting failures

  #### Parameters

  + data: string

    Data to be logged into the current context

  #### Returns void

  #### Remarks

  Since 1.8.0

  + Defined in [packages/fast-check/src/arbitrary/context.ts:17](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/context.ts#L17)

### size

* size(): number

  Number of logs already logged into current context

  #### Returns number

  #### Remarks

  Since 1.8.0

  + Defined in [packages/fast-check/src/arbitrary/context.ts:22](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/context.ts#L22)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Methods

[log](https://fast-check.dev/api-reference/interfaces/ContextValue.html#log)[size](https://fast-check.dev/api-reference/interfaces/ContextValue.html#size)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
