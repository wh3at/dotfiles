---
title: "PropertyHookFunction | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/PropertyHookFunction"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [PropertyHookFunction](https://fast-check.dev/api-reference/types/PropertyHookFunction.html)

# Type Alias PropertyHookFunction

PropertyHookFunction: (globalHookFunction: [GlobalPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalPropertyHookFunction.html)) => void

Type of legal hook function that can be used to call `beforeEach` or `afterEach`
on a [IPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html)

#### Type Declaration

* + (globalHookFunction: [GlobalPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalPropertyHookFunction.html)): void
  + #### Parameters

    - globalHookFunction: [GlobalPropertyHookFunction](https://fast-check.dev/api-reference/types/GlobalPropertyHookFunction.html)

    #### Returns void

#### Remarks

Since 2.2.0

* Defined in [packages/fast-check/src/check/property/Property.generic.ts:23](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/Property.generic.ts#L23)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
