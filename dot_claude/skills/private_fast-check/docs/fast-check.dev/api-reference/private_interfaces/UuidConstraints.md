---
title: "UuidConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/UuidConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [UuidConstraints](https://fast-check.dev/api-reference/interfaces/UuidConstraints.html)

# Interface UuidConstraints

Constraints to be applied on [uuid](https://fast-check.dev/api-reference/functions/uuid.html)

#### Remarks

Since 3.21.0

interface UuidConstraints {
    [version](https://fast-check.dev/api-reference/interfaces/UuidConstraints.html#version)?:
        | 2
        | 1
        | 3
        | 4
        | 5
        | 6
        | 7
        | 8
        | 9
        | 10
        | 11
        | 12
        | 13
        | 14
        | 15
        | (1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15)[];
}

* Defined in [packages/fast-check/src/arbitrary/uuid.ts:13](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/uuid.ts#L13)

##### Index

### Properties

[version?](https://fast-check.dev/api-reference/interfaces/UuidConstraints.html#version)

## Properties

### `Optional`version

version?:
    | 2
    | 1
    | 3
    | 4
    | 5
    | 6
    | 7
    | 8
    | 9
    | 10
    | 11
    | 12
    | 13
    | 14
    | 15
    | (1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15)[]

Define accepted versions in the [1-15] according to [RFC 9562](https://datatracker.ietf.org/doc/html/rfc9562#name-version-field)

#### Default Value

```
[1,2,3,4,5,6,7,8]
Copy
```

#### Remarks

Since 3.21.0

* Defined in [packages/fast-check/src/arbitrary/uuid.ts:19](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/uuid.ts#L19)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[version](https://fast-check.dev/api-reference/interfaces/UuidConstraints.html#version)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
