---
title: "record | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/record"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [record](https://fast-check.dev/api-reference/functions/record.html)

# Function record

* record<[T](https://fast-check.dev/api-reference/functions/record.html#recordt), [K](https://fast-check.dev/api-reference/functions/record.html#recordk) extends string | number | symbol = keyof [T](https://fast-check.dev/api-reference/functions/record.html#recordt)>(
      model: { [K in string | number | symbol]: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/record.html#recordt)[K]> },
      constraints?: [RecordConstraints](https://fast-check.dev/api-reference/types/RecordConstraints.html)<[K](https://fast-check.dev/api-reference/functions/record.html#recordk)>,
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<
      {
          [K in string
          | number
          | symbol]: (Partial<[T](https://fast-check.dev/api-reference/functions/record.html#recordt)> & Pick<[T](https://fast-check.dev/api-reference/functions/record.html#recordt), [K](https://fast-check.dev/api-reference/functions/record.html#recordk) & keyof [T](https://fast-check.dev/api-reference/functions/record.html#recordt)>)[K]
      },
  >

  For records following the `recordModel` schema

  #### Type Parameters

  + T
  + K extends string | number | symbol = keyof [T](https://fast-check.dev/api-reference/functions/record.html#recordt)

  #### Parameters

  + model: { [K in string | number | symbol]: [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[T](https://fast-check.dev/api-reference/functions/record.html#recordt)[K]> }
  + `Optional`constraints: [RecordConstraints](https://fast-check.dev/api-reference/types/RecordConstraints.html)<[K](https://fast-check.dev/api-reference/functions/record.html#recordk)>

    Contraints on the generated record

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<     {         [K in string         | number         | symbol]: (Partial<[T](https://fast-check.dev/api-reference/functions/record.html#recordt)> & Pick<[T](https://fast-check.dev/api-reference/functions/record.html#recordt), [K](https://fast-check.dev/api-reference/functions/record.html#recordk) & keyof [T](https://fast-check.dev/api-reference/functions/record.html#recordt)>)[K]     }, >

  #### Example

  ```
  record({ x: someArbitraryInt, y: someArbitraryInt }, {requiredKeys: []}): Arbitrary<{x?:number,y?:number}>
  // merge two integer arbitraries to produce a {x, y}, {x}, {y} or {} record
  Copy
  ```

  #### Remarks

  Since 0.0.12

  + Defined in [packages/fast-check/src/arbitrary/record.ts:56](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/record.ts#L56)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
