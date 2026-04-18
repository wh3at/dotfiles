---
title: "EntityGraphRelations | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/EntityGraphRelations"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [EntityGraphRelations](https://fast-check.dev/api-reference/types/EntityGraphRelations.html)

# Type Alias EntityGraphRelations<TEntityFields>

EntityGraphRelations: {
    [TEntityName in keyof [TEntityFields](https://fast-check.dev/api-reference/types/EntityGraphRelations.html#tentityfields)]: {
        [TField in string]: Relationship<keyof [TEntityFields](https://fast-check.dev/api-reference/types/EntityGraphRelations.html#tentityfields)>
    }
}

Defines all relationships between entity types for [entityGraph](https://fast-check.dev/api-reference/functions/entityGraph.html).

This is the second argument to [entityGraph](https://fast-check.dev/api-reference/functions/entityGraph.html) and specifies how entities reference each other.
Each entity type can have zero or more relationship fields, where each field defines a link
to other entities.

#### Type Parameters

* TEntityFields

#### Example

```
{
  employee: {
    manager: { arity: '0-1', type: 'employee' },
    team: { arity: '1', type: 'team' }
  },
  team: {}
}
Copy
```

#### Remarks

Since 4.5.0

* Defined in [packages/fast-check/src/arbitrary/\_internals/interfaces/EntityGraphTypes.ts:165](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/_internals/interfaces/EntityGraphTypes.ts#L165)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
