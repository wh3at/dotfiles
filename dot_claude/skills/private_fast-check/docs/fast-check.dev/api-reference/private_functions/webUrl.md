---
title: "webUrl | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/webUrl"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [webUrl](https://fast-check.dev/api-reference/functions/webUrl.html)

# Function webUrl

* webUrl(constraints?: [WebUrlConstraints](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  For web url

  According to [RFC 3986](https://www.ietf.org/rfc/rfc3986.txt) and
  [WHATWG URL Standard](https://url.spec.whatwg.org/)

  #### Parameters

  + `Optional`constraints: [WebUrlConstraints](https://fast-check.dev/api-reference/interfaces/WebUrlConstraints.html)

    Constraints to apply when building instances

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  #### Remarks

  Since 1.14.0

  + Defined in [packages/fast-check/src/arbitrary/webUrl.ts:63](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webUrl.ts#L63)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
