---
title: "domain | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/domain"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [domain](https://fast-check.dev/api-reference/functions/domain.html)

# Function domain

* domain(constraints?: [DomainConstraints](https://fast-check.dev/api-reference/interfaces/DomainConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  For domains
  having an extension with at least two lowercase characters

  According to [RFC 1034](https://www.ietf.org/rfc/rfc1034.txt),
  [RFC 1035](https://www.ietf.org/rfc/rfc1035.txt),
  [RFC 1123](https://www.ietf.org/rfc/rfc1123.txt) and
  [WHATWG URL Standard](https://url.spec.whatwg.org/)

  #### Parameters

  + constraints: [DomainConstraints](https://fast-check.dev/api-reference/interfaces/DomainConstraints.html) = {}

    Constraints to apply when building instances (since 2.22.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  #### Remarks

  Since 1.14.0

  + Defined in [packages/fast-check/src/arbitrary/domain.ts:115](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/domain.ts#L115)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
