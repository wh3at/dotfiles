---
title: "gen | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/gen"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [gen](https://fast-check.dev/api-reference/functions/gen.html)

# Function gen

* gen(): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[GeneratorValue](https://fast-check.dev/api-reference/types/GeneratorValue.html)>

  Generate values within the test execution itself by leveraging the strength of `gen`

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[GeneratorValue](https://fast-check.dev/api-reference/types/GeneratorValue.html)>

  #### Example

  ```
  fc.assert(
    fc.property(fc.gen(), gen => {
      const size = gen(fc.nat, {max: 10});
      const array = [];
      for (let index = 0 ; index !== size ; ++index) {
        array.push(gen(fc.integer));
      }
      // Here is an array!
      // Note: Prefer fc.array(fc.integer(), {maxLength: 10}) if you want to produce such array
    })
  )
  Copy
  ```

  ⚠️ WARNING:
  While `gen` is easy to use, it may not shrink as well as tailored arbitraries based on `filter` or `map`.

  ⚠️ WARNING:
  Additionally it cannot run back the test properly when attempting to replay based on a seed and a path.
  You'll need to limit yourself to the seed and drop the path from the options if you attempt to replay something
  implying it. More precisely, you may keep the very first part of the path but have to drop anything after the
  first ":".

  ⚠️ WARNING:
  It also does not support custom examples.

  #### Remarks

  Since 3.8.0

  + Defined in [packages/fast-check/src/arbitrary/gen.ts:40](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/gen.ts#L40)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
