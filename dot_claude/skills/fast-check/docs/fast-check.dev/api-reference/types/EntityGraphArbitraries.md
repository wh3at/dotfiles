---
title: "EntityGraphArbitraries | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/EntityGraphArbitraries"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [EntityGraphArbitraries](https://fast-check.dev/api-reference/types/EntityGraphArbitraries.html)

# Type Alias EntityGraphArbitraries<TEntityFields>

EntityGraphArbitraries: {
    [TEntityName in keyof [TEntityFields](https://fast-check.dev/api-reference/types/EntityGraphArbitraries.html#tentityfields)]: ArbitraryStructure<
        [TEntityFields](https://fast-check.dev/api-reference/types/EntityGraphArbitraries.html#tentityfields)[TEntityName],
    >
}

Defines all entity types and their data fields for [entityGraph](https://fast-check.dev/api-reference/functions/entityGraph.html).

This is the first argument to [entityGraph](https://fast-check.dev/api-reference/functions/entityGraph.html) and specifies the non-relational properties
of each entity type. Each key is the name of an entity type and its value defines the
arbitraries for that entity.

#### Type Parameters

* TEntityFields

#### Example

```
{
  employee: { name: fc.string(), age: fc.nat(100) },
  team: { name: fc.string(), size: fc.nat(50) }
}
Copy
```

#### Remarks

Since 4.5.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/EntityGraphTypes.ts:38](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/EntityGraphTypes.ts#L38)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
