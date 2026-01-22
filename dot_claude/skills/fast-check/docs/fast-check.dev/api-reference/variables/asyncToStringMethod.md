---
title: "asyncToStringMethod | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/variables/asyncToStringMethod"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [asyncToStringMethod](https://fast-check.dev/api-reference/variables/asyncToStringMethod.html)

# Variable asyncToStringMethod`Const`

asyncToStringMethod: unique symbol = ...

Use this symbol to define a custom serializer for your instances.
Serializer must be a function returning a promise of string (see [WithAsyncToStringMethod](https://fast-check.dev/api-reference/types/WithAsyncToStringMethod.html)).

Please note that:

1. It will only be useful for asynchronous properties.
2. It has to return barely instantly.

#### Remarks

Since 2.17.0

* Defined in [packages/fast-check/src/utils/stringify.ts:67](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/utils/stringify.ts#L67)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
