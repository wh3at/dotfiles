---
title: "WebUrlConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/WebUrlConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [WebUrlConstraints](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html)

# Interface WebUrlConstraints

Constraints to be applied on [webUrl](https://fast-check.dev/api-reference/functions/webUrl.html)

#### Remarks

Since 1.14.0

interface WebUrlConstraints {
    [authoritySettings](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#authoritysettings)?: [WebAuthorityConstraints](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html);
    [size](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#size)?: [Size](https://fast-check.dev/api-reference/types/Size.html) | RelativeSize;
    [validSchemes](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#validschemes)?: string[];
    [withFragments](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#withfragments)?: boolean;
    [withQueryParameters](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#withqueryparameters)?: boolean;
}

* Defined in [packages/fast-check/src/arbitrary/webUrl.ts:20](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webUrl.ts#L20)

##### Index

### Properties

[authoritySettings?](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#authoritysettings)
[size?](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#size)
[validSchemes?](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#validschemes)
[withFragments?](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#withfragments)
[withQueryParameters?](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#withqueryparameters)

## Properties

### `Optional`authoritySettings

authoritySettings?: [WebAuthorityConstraints](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html)

Settings for [webAuthority](https://fast-check.dev/api-reference/functions/webAuthority.html)

#### Default Value

```
&#123;&#125;
Copy
```

#### Remarks

Since 1.14.0

* Defined in [packages/fast-check/src/arbitrary/webUrl.ts:32](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webUrl.ts#L32)

### `Optional`size

size?: [Size](https://fast-check.dev/api-reference/types/Size.html) | RelativeSize

Define how large the generated values should be (at max)

#### Remarks

Since 2.22.0

* Defined in [packages/fast-check/src/arbitrary/webUrl.ts:49](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webUrl.ts#L49)

### `Optional`validSchemes

validSchemes?: string[]

Enforce specific schemes, eg.: http, https

#### Default Value

```
['http', 'https']
Copy
```

#### Remarks

Since 1.14.0

* Defined in [packages/fast-check/src/arbitrary/webUrl.ts:26](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webUrl.ts#L26)

### `Optional`withFragments

withFragments?: boolean

Enable fragments in the generated url

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.14.0

* Defined in [packages/fast-check/src/arbitrary/webUrl.ts:44](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webUrl.ts#L44)

### `Optional`withQueryParameters

withQueryParameters?: boolean

Enable query parameters in the generated url

#### Default Value

```
false
Copy
```

#### Remarks

Since 1.14.0

* Defined in [packages/fast-check/src/arbitrary/webUrl.ts:38](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webUrl.ts#L38)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[authoritySettings](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#authoritysettings)[size](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#size)[validSchemes](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#validschemes)[withFragments](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#withfragments)[withQueryParameters](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html#withqueryparameters)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
