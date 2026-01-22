---
title: "asyncProperty | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/asyncProperty"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [asyncProperty](https://fast-check.dev/api-reference/functions/asyncProperty.html)

# Function asyncProperty

* asyncProperty<[Ts](https://fast-check.dev/api-reference/functions/asyncProperty.html#asyncpropertyts) extends [unknown, ...unknown[]]>(
      ...args: [
          ...arbitraries: {
              [K in string
              | number
              | symbol]: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Ts](https://fast-check.dev/api-reference/functions/asyncProperty.html#asyncpropertyts)[K<K>]>
          }[],
          predicate: (...args: [Ts](https://fast-check.dev/api-reference/functions/asyncProperty.html#asyncpropertyts)) => Promise<boolean | void>,
      ],
  ): [IAsyncPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/functions/asyncProperty.html#asyncpropertyts)>

  Instantiate a new fast-check#IAsyncProperty

  #### Type Parameters

  + Ts extends [unknown, ...unknown[]]

  #### Parameters

  + ...args: [
        ...arbitraries: { [K in string
        | number
        | symbol]: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Ts](https://fast-check.dev/api-reference/functions/asyncProperty.html#asyncpropertyts)[K<K>]> }[],
        predicate: (...args: [Ts](https://fast-check.dev/api-reference/functions/asyncProperty.html#asyncpropertyts)) => Promise<boolean | void>,
    ]

  #### Returns [IAsyncPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IAsyncPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/functions/asyncProperty.html#asyncpropertyts)>

  #### Remarks

  Since 0.0.7

  + Defined in [packages/fast-check/src/check/property/AsyncProperty.ts:15](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/AsyncProperty.ts#L15)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
