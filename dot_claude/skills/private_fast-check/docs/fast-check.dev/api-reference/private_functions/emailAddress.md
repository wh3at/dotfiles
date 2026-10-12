---
title: "emailAddress | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/emailAddress"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [emailAddress](https://fast-check.dev/api-reference/functions/emailAddress.html)

# Function emailAddress

* emailAddress(constraints?: [EmailAddressConstraints](https://fast-check.dev/api-reference/interfaces/EmailAddressConstraints.html)): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  For email address

  According to [RFC 2821](https://www.ietf.org/rfc/rfc2821.txt),
  [RFC 3696](https://www.ietf.org/rfc/rfc3696.txt) and
  [RFC 5322](https://www.ietf.org/rfc/rfc5322.txt)

  #### Parameters

  + constraints: [EmailAddressConstraints](https://fast-check.dev/api-reference/interfaces/EmailAddressConstraints.html) = {}

    Constraints to apply when building instances (since 2.22.0)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

  #### Remarks

  Since 1.14.0

  + Defined in [packages/fast-check/src/arbitrary/emailAddress.ts:73](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/emailAddress.ts#L73)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
