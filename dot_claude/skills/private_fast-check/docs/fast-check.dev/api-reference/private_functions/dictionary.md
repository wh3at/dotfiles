---
title: "dictionary | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/dictionary"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [dictionary](https://fast-check.dev/api-reference/functions/dictionary.html)

# Function dictionary

* dictionary<[T](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryt)>(
      keyArb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>,
      valueArb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryt)>,
      constraints?: [DictionaryConstraints](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html),
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Record<string, [T](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryt)>>

  For dictionaries with keys produced by `keyArb` and values from `valueArb`

  #### Type Parameters

  + T

  #### Parameters

  + keyArb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<string>

    Arbitrary used to generate the keys of the object
  + valueArb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryt)>

    Arbitrary used to generate the values of the object
  + `Optional`constraints: [DictionaryConstraints](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Record<string, [T](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryt)>>

  #### Remarks

  Since 1.0.0

  + Defined in [packages/fast-check/src/arbitrary/dictionary.ts:67](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/dictionary.ts#L67)
* dictionary<[K](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryk) extends PropertyKey, [V](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryv)>(
      keyArb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[K](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryk)>,
      valueArb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[V](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryv)>,
      constraints?: [DictionaryConstraints](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html),
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Record<[K](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryk), [V](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryv)>>

  For dictionaries with keys produced by `keyArb` and values from `valueArb`

  #### Type Parameters

  + K extends PropertyKey
  + V

  #### Parameters

  + keyArb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[K](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryk)>

    Arbitrary used to generate the keys of the object
  + valueArb: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[V](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryv)>

    Arbitrary used to generate the values of the object
  + `Optional`constraints: [DictionaryConstraints](https://fast-check.dev/api-reference/interfaces/DictionaryConstraints.html)

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<Record<[K](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryk), [V](https://fast-check.dev/api-reference/functions/dictionary.html#dictionaryv)>>

  #### Remarks

  Since 4.4.0

  + Defined in [packages/fast-check/src/arbitrary/dictionary.ts:81](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/dictionary.ts#L81)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
