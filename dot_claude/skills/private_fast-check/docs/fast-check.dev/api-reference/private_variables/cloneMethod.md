---
title: "cloneMethod | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/variables/cloneMethod"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [cloneMethod](https://fast-check.dev/api-reference/variables/cloneMethod.html)

# Variable cloneMethod`Const`

cloneMethod: unique symbol = ...

Generated instances having a method [cloneMethod]
will be automatically cloned whenever necessary

This is pretty useful for statefull generated values.
For instance, whenever you use a Stream you directly impact it.
Implementing [cloneMethod] on the generated Stream would force
the framework to clone it whenever it has to re-use it
(mainly required for chrinking process)

#### Remarks

Since 1.8.0

* Defined in [packages/fast-check/src/check/symbols.ts:14](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/symbols.ts#L14)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
