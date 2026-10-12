---
title: "DepthSize | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/DepthSize"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [DepthSize](https://fast-check.dev/api-reference/types/DepthSize.html)

# Type Alias DepthSize

DepthSize: RelativeSize | [Size](https://fast-check.dev/api-reference/types/Size.html) | "max" | number | undefined

Superset of [Size](https://fast-check.dev/api-reference/types/Size.html) to override the default defined for size.
It can either be based on a numeric value manually selected by the user (not recommended)
or rely on presets based on size (recommended).

This size will be used to infer a bias to limit the depth, used as follow within recursive structures:
While going deeper, the bias on depth will increase the probability to generate small instances.

When used with [Size](https://fast-check.dev/api-reference/types/Size.html), the larger the size the deeper the structure.
When used with numeric values, the larger the number (floating point number >= 0),
the deeper the structure. `+0` means extremelly biased depth meaning barely impossible to generate
deep structures, while `Number.POSITIVE_INFINITY` means "depth has no impact".

Using `max` or `Number.POSITIVE_INFINITY` is fully equivalent.

#### Remarks

Since 2.25.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/helpers/MaxLengthFromMinLength.ts:68](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/helpers/MaxLengthFromMinLength.ts#L68)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
