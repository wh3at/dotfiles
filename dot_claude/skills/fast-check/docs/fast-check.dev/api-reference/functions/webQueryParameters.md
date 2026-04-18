---
title: "webQueryParameters | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/webQueryParameters"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [webQueryParameters](https://fast-check.dev/api-reference/functions/webQueryParameters.html)

# Function webQueryParameters

* webQueryParameters(
      constraints?: [WebQueryParametersConstraints](https://fast-check.dev/api-reference/interfaces/WebQueryParametersConstraints.html),
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  For query parameters of an URI (web included)

  According to [RFC 3986](https://www.ietf.org/rfc/rfc3986.txt)

  eg.: In the url `https://domain/plop/?hello=1&world=2`, `?hello=1&world=2` are query parameters

  #### Parameters

  + constraints: [WebQueryParametersConstraints](https://fast-check.dev/api-reference/interfaces/WebQueryParametersConstraints.html) = {}

    Constraints to apply when building instances (since 2.22.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  #### Remarks

  Since 1.14.0

  + Defined in [packages/fast-check/src/arbitrary/webQueryParameters.ts:30](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/webQueryParameters.ts#L30)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
