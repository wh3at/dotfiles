---
title: "CloneValue | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/CloneValue"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [CloneValue](https://fast-check.dev/api-reference/types/CloneValue.html)

# Type Alias CloneValue<T, N, Rest>

CloneValue: [number] extends [[N](https://fast-check.dev/api-reference/types/CloneValue.html#n)]
    ? [T](https://fast-check.dev/api-reference/types/CloneValue.html#t)[]
    : [Rest](https://fast-check.dev/api-reference/types/CloneValue.html#rest)["length"] extends [N](https://fast-check.dev/api-reference/types/CloneValue.html#n) ? [Rest](https://fast-check.dev/api-reference/types/CloneValue.html#rest) : [CloneValue](https://fast-check.dev/api-reference/types/CloneValue.html)<[T](https://fast-check.dev/api-reference/types/CloneValue.html#t), [N](https://fast-check.dev/api-reference/types/CloneValue.html#n), [[T](https://fast-check.dev/api-reference/types/CloneValue.html#t), ...[Rest](https://fast-check.dev/api-reference/types/CloneValue.html#rest)]>

Type of the value produced by [clone](https://fast-check.dev/api-reference/functions/clone.html)

#### Type Parameters

* T
* N extends number
* Rest extends [T](https://fast-check.dev/api-reference/types/CloneValue.html#t)[] = []

#### Remarks

Since 2.5.0

* Defined in [packages/fast-check/src/arbitrary/clone.ts:9](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/clone.ts#L9)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
