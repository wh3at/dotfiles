---
title: "RecordConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/RecordConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [RecordConstraints](https://fast-check.dev/api-reference/types/RecordConstraints.html)

# Type Alias RecordConstraints<T>

Constraints to be applied on [record](https://fast-check.dev/api-reference/functions/record.html)

#### Remarks

Since 0.0.12

type RecordConstraints<[T](https://fast-check.dev/api-reference/types/RecordConstraints.html#t) = unknown> = {
    [noNullPrototype](https://fast-check.dev/api-reference/types/RecordConstraints.html#nonullprototype)?: boolean;
    [requiredKeys](https://fast-check.dev/api-reference/types/RecordConstraints.html#requiredkeys)?: [T](https://fast-check.dev/api-reference/types/RecordConstraints.html#t)[];
}

#### Type Parameters

* T = unknown

* Defined in [packages/fast-check/src/arbitrary/record.ts:12](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/record.ts#L12)

##### Index

### Properties

[noNullPrototype?](https://fast-check.dev/api-reference/types/RecordConstraints.html#nonullprototype)
[requiredKeys?](https://fast-check.dev/api-reference/types/RecordConstraints.html#requiredkeys)

## Properties

### `Optional`noNullPrototype

noNullPrototype?: boolean

Do not generate records with null prototype

#### Default Value

```
false
Copy
```

#### Remarks

Since 3.13.0

* Defined in [packages/fast-check/src/arbitrary/record.ts:29](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/record.ts#L29)

### `Optional`requiredKeys

requiredKeys?: [T](https://fast-check.dev/api-reference/types/RecordConstraints.html#t)[]

List keys that should never be deleted.

Remark:
You might need to use an explicit typing in case you need to declare symbols as required (not needed when required keys are simple strings).
With something like `{ requiredKeys: [mySymbol1, 'a'] as [typeof mySymbol1, 'a'] }` when both `mySymbol1` and `a` are required.

#### Default Value

```
Array containing all keys of recordModel
Copy
```

#### Remarks

Since 2.11.0

* Defined in [packages/fast-check/src/arbitrary/record.ts:23](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/record.ts#L23)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[noNullPrototype](https://fast-check.dev/api-reference/types/RecordConstraints.html#nonullprototype)[requiredKeys](https://fast-check.dev/api-reference/types/RecordConstraints.html#requiredkeys)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
