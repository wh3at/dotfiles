---
title: "infiniteStream | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/infiniteStream"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [infiniteStream](https://fast-check.dev/api-reference/functions/infiniteStream.html)

# Function infiniteStream

* infiniteStream<[T](https://fast-check.dev/api-reference/functions/infiniteStream.html#infinitestreamt)>(
      arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/infiniteStream.html#infinitestreamt)>,
      constraints?: InfiniteStreamConstraints,
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/functions/infiniteStream.html#infinitestreamt)>>

  Produce an infinite stream of values

  WARNING: By default, infiniteStream remembers all values it has ever
  generated. This causes unbounded memory growth during large tests.
  Set noHistory to disable.

  WARNING: Requires Object.assign

  #### Type Parameters

  + T

  #### Parameters

  + arb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/infiniteStream.html#infinitestreamt)>

    Arbitrary used to generate the values
  + `Optional`constraints: InfiniteStreamConstraints

    Constraints to apply when building instances (since 4.3.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Stream](https://fast-check.dev/api-reference/classes/Stream.html)<[T](https://fast-check.dev/api-reference/functions/infiniteStream.html#infinitestreamt)>>

  #### Remarks

  Since 1.8.0

  + Defined in [packages/fast-check/src/arbitrary/infiniteStream.ts:35](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/infiniteStream.ts#L35)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
