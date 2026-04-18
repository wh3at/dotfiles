---
title: "MixedCaseConstraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/interfaces/MixedCaseConstraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [MixedCaseConstraints](https://fast-check.dev/api-reference/interfaces/MixedCaseConstraints.html)

# Interface MixedCaseConstraints

Constraints to be applied on [mixedCase](https://fast-check.dev/api-reference/functions/mixedCase.html)

#### Remarks

Since 1.17.0

interface MixedCaseConstraints {
    [toggleCase](https://fast-check.dev/api-reference/interfaces/MixedCaseConstraints.html#togglecase)?: (rawChar: string) => string;
    [untoggleAll](https://fast-check.dev/api-reference/interfaces/MixedCaseConstraints.html#untoggleall)?: (toggledString: string) => string;
}

* Defined in [packages/fast-check/src/arbitrary/mixedCase.ts:10](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/mixedCase.ts#L10)

##### Index

### Properties

[toggleCase?](https://fast-check.dev/api-reference/interfaces/MixedCaseConstraints.html#togglecase)
[untoggleAll?](https://fast-check.dev/api-reference/interfaces/MixedCaseConstraints.html#untoggleall)

## Properties

### `Optional`toggleCase

toggleCase?: (rawChar: string) => string

Transform a character to its upper and/or lower case version

#### Default Value

try `toUpperCase` on the received code-point, if no effect try `toLowerCase`

#### Remarks

Since 1.17.0

* Defined in [packages/fast-check/src/arbitrary/mixedCase.ts:16](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/mixedCase.ts#L16)

### `Optional`untoggleAll

untoggleAll?: (toggledString: string) => string

In order to be fully reversable (only in case you want to shrink user definable values)
you should provide a function taking a string containing possibly toggled items and returning its
untoggled version.

* Defined in [packages/fast-check/src/arbitrary/mixedCase.ts:22](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/mixedCase.ts#L22)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[toggleCase](https://fast-check.dev/api-reference/interfaces/MixedCaseConstraints.html#togglecase)[untoggleAll](https://fast-check.dev/api-reference/interfaces/MixedCaseConstraints.html#untoggleall)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
