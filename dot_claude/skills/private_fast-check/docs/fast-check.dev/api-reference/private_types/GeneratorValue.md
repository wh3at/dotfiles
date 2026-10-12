---
title: "GeneratorValue | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/GeneratorValue"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [GeneratorValue](https://fast-check.dev/api-reference/types/GeneratorValue.html)

# Type Alias GeneratorValue

GeneratorValue: GeneratorValueFunction & GeneratorValueMethods

An instance of [GeneratorValue](https://fast-check.dev/api-reference/types/GeneratorValue.html) can be leveraged within predicates themselves to produce extra random values
while preserving part of the shrinking capabilities on the produced values.

It can be seen as a way to start property based testing within something looking closer from what users will
think about when thinking about random in tests. But contrary to raw random, it comes with many useful strengths
such as: ability to re-run the test (seeded), shrinking...

#### Remarks

Since 3.8.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/builders/GeneratorValueBuilder.ts:45](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/builders/GeneratorValueBuilder.ts#L45)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
