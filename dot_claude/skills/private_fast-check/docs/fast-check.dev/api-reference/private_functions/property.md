---
title: "property | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/property"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [property](https://fast-check.dev/api-reference/functions/property.html)

# Function property

* property<[Ts](https://fast-check.dev/api-reference/functions/property.html#propertyts) extends [unknown, ...unknown[]]>(
      ...args: [
          ...arbitraries: {
              [K in string
              | number
              | symbol]: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Ts](https://fast-check.dev/api-reference/functions/property.html#propertyts)[K<K>]>
          }[],
          predicate: (...args: [Ts](https://fast-check.dev/api-reference/functions/property.html#propertyts)) => boolean | void,
      ],
  ): [IPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/functions/property.html#propertyts)>

  Instantiate a new fast-check#IProperty

  #### Type Parameters

  + Ts extends [unknown, ...unknown[]]

  #### Parameters

  + ...args: [
        ...arbitraries: { [K in string
        | number
        | symbol]: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[Ts](https://fast-check.dev/api-reference/functions/property.html#propertyts)[K<K>]> }[],
        predicate: (...args: [Ts](https://fast-check.dev/api-reference/functions/property.html#propertyts)) => boolean | void,
    ]

  #### Returns [IPropertyWithHooks](https://fast-check.dev/api-reference/interfaces/IPropertyWithHooks.html)<[Ts](https://fast-check.dev/api-reference/functions/property.html#propertyts)>

  #### Remarks

  Since 0.0.1

  + Defined in [packages/fast-check/src/check/property/Property.ts:15](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/check/property/Property.ts#L15)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
