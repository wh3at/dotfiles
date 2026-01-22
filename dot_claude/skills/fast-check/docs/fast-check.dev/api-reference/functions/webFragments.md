---
title: "webFragments | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/webFragments"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [webFragments](https://fast-check.dev/api-reference/functions/webFragments.html)

# Function webFragments

* webFragments(constraints?: [WebFragmentsConstraints](https://fast-check.dev/api-reference/interfaces/WebFragmentsConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  For fragments of an URI (web included)

  According to [RFC 3986](https://www.ietf.org/rfc/rfc3986.txt)

  eg.: In the url `https://domain/plop?page=1#hello=1&world=2`, `?hello=1&world=2` are query parameters

  #### Parameters

  + constraints: [WebFragmentsConstraints](https://fast-check.dev/api-reference/interfaces/WebFragmentsConstraints.html) = {}

    Constraints to apply when building instances (since 2.22.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  #### Remarks

  Since 1.14.0

  + Defined in [packages/fast-check/src/arbitrary/webFragments.ts:30](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webFragments.ts#L30)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
