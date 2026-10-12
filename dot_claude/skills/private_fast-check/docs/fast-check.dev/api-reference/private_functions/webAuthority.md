---
title: "webAuthority | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/webAuthority"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [webAuthority](https://fast-check.dev/api-reference/functions/webAuthority.html)

# Function webAuthority

* webAuthority(constraints?: [WebAuthorityConstraints](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  For web authority

  According to [RFC 3986](https://www.ietf.org/rfc/rfc3986.txt) - `authority = [ userinfo "@" ] host [ ":" port ]`

  #### Parameters

  + `Optional`constraints: [WebAuthorityConstraints](https://fast-check.dev/api-reference/interfaces/WebAuthorityConstraints.html)

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  #### Remarks

  Since 1.14.0

  + Defined in [packages/fast-check/src/arbitrary/webAuthority.ts:103](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webAuthority.ts#L103)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
