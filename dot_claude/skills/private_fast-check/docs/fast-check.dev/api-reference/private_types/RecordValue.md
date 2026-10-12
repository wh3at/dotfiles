---
title: "RecordValue | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/RecordValue"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [RecordValue](https://fast-check.dev/api-reference/types/RecordValue.html)

# Type Alias RecordValue<T, K>

RecordValue: Prettify<Partial<[T](https://fast-check.dev/api-reference/types/RecordValue.html#t)> & Pick<[T](https://fast-check.dev/api-reference/types/RecordValue.html#t), [K](https://fast-check.dev/api-reference/types/RecordValue.html#k) & keyof [T](https://fast-check.dev/api-reference/types/RecordValue.html#t)>>

Infer the type of the Arbitrary produced by record
given the type of the source arbitrary and constraints to be applied

#### Type Parameters

* T
* K

#### Remarks

Since 2.2.0

* Defined in [packages/fast-check/src/arbitrary/record.ts:39](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/record.ts#L39)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
