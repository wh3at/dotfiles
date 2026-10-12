---
title: "WebAuthorityConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [WebAuthorityConstraints](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html)

# Interface WebAuthorityConstraints

Constraints to be applied on [webAuthority](https://fast-check.dev/api-reference/functions/webAuthority.html)

#### Remarks

Since 1.14.0

interface WebAuthorityConstraints {
    [size](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#size)?: [Size](https://fast-check.dev/api-reference/types/Size.html) | RelativeSize;
    [withIPv4](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withipv4)?: boolean;
    [withIPv4Extended](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withipv4extended)?: boolean;
    [withIPv6](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withipv6)?: boolean;
    [withPort](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withport)?: boolean;
    [withUserInfo](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withuserinfo)?: boolean;
}

* Defined in [packages/fast-check/src/arbitrary/webAuthority.ts:55](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webAuthority.ts#L55)

##### Index

### Properties

[size?](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#size)
[withIPv4?](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withipv4)
[withIPv4Extended?](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withipv4extended)
[withIPv6?](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withipv6)
[withPort?](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withport)
[withUserInfo?](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withuserinfo)

## Properties

### `Optional`size

size?: [Size](https://fast-check.dev/api-reference/types/Size.html) | RelativeSize

Define how large the generated values should be (at max)

#### Remarks

Since 2.22.0

* Defined in [packages/fast-check/src/arbitrary/webAuthority.ts:90](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webAuthority.ts#L90)

### `Optional`withIPv4

withIPv4?: boolean

Enable IPv4 in host

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.14.0

* Defined in [packages/fast-check/src/arbitrary/webAuthority.ts:61](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webAuthority.ts#L61)

### `Optional`withIPv4Extended

withIPv4Extended?: boolean

Enable extended IPv4 format

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.17.0

* Defined in [packages/fast-check/src/arbitrary/webAuthority.ts:73](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webAuthority.ts#L73)

### `Optional`withIPv6

withIPv6?: boolean

Enable IPv6 in host

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.14.0

* Defined in [packages/fast-check/src/arbitrary/webAuthority.ts:67](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webAuthority.ts#L67)

### `Optional`withPort

withPort?: boolean

Enable port suffix

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.14.0

* Defined in [packages/fast-check/src/arbitrary/webAuthority.ts:85](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webAuthority.ts#L85)

### `Optional`withUserInfo

withUserInfo?: boolean

Enable user information prefix

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.14.0

* Defined in [packages/fast-check/src/arbitrary/webAuthority.ts:79](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webAuthority.ts#L79)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[size](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#size)[withIPv4](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withipv4)[withIPv4Extended](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withipv4extended)[withIPv6](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withipv6)[withPort](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withport)[withUserInfo](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html#withuserinfo)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
