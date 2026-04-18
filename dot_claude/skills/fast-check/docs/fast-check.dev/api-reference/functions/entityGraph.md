---
title: "entityGraph | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/functions/entityGraph"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [entityGraph](https://fast-check.dev/api-reference/functions/entityGraph.html)

# Function entityGraph

* entityGraph<
      [TEntityFields](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityfields),
      [TEntityRelations](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityrelations) extends [EntityGraphRelations](https://fast-check.dev/api-reference/types/EntityGraphRelations.html)<[TEntityFields](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityfields)>,
  >(
      arbitraries: [EntityGraphArbitraries](https://fast-check.dev/api-reference/types/EntityGraphArbitraries.html)<[TEntityFields](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityfields)>,
      relations: [TEntityRelations](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityrelations),
      constraints?: [EntityGraphContraints](https://fast-check.dev/api-reference/types/EntityGraphContraints.html)<[TEntityFields](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityfields)>,
  ): [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[EntityGraphValue](https://fast-check.dev/api-reference/types/EntityGraphValue.html)<[TEntityFields](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityfields), [TEntityRelations](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityrelations)>>

  Generates interconnected entities with relationships based on a schema definition.

  This arbitrary creates structured data where entities can reference each other through defined
  relationships. The generated values automatically include links between entities, making it
  ideal for testing graph structures, relational data, or interconnected object models.

  The output is an object where each key corresponds to an entity type and the value is an array
  of entities of that type. Entities contain both their data fields and relationship links.

  #### Type Parameters

  + TEntityFields
  + TEntityRelations extends [EntityGraphRelations](https://fast-check.dev/api-reference/types/EntityGraphRelations.html)<[TEntityFields](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityfields)>

  #### Parameters

  + arbitraries: [EntityGraphArbitraries](https://fast-check.dev/api-reference/types/EntityGraphArbitraries.html)<[TEntityFields](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityfields)>

    Defines the data fields for each entity type (non-relational properties)
  + relations: [TEntityRelations](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityrelations)

    Defines how entities reference each other (relational properties)
  + constraints: [EntityGraphContraints](https://fast-check.dev/api-reference/types/EntityGraphContraints.html)<[TEntityFields](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityfields)> = {}

    Optional configuration to customize generation behavior

  #### Returns [Arbitrary](https://fast-check.dev/api-reference/classes/Arbitrary.html)<[EntityGraphValue](https://fast-check.dev/api-reference/types/EntityGraphValue.html)<[TEntityFields](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityfields), [TEntityRelations](https://fast-check.dev/api-reference/functions/entityGraph.html#entitygraphtentityrelations)>>

  #### Example

  ```
  // Generate a simple directed graph where nodes link to other nodes
  fc.entityGraph(
    { node: { id: fc.stringMatching(/^[A-Z][a-z]*$/) } },
    { node: { linkTo: { arity: 'many', type: 'node' } } },
  )
  // Produces: { node: [{ id: "Abc", linkTo: [<node#1>, <node#0>] }, ...] }
  Copy
  ```

  #### Example

  ```
  // Generate employees with managers and teams
  fc.entityGraph(
    {
      employee: { name: fc.string() },
      team: { name: fc.string() }
    },
    {
      employee: {
        manager: { arity: '0-1', type: 'employee' },  // Optional manager
        team: { arity: '1', type: 'team' }           // Required team
      },
      team: {}
    }
  )
  Copy
  ```

  #### Remarks

  Since 4.5.0

  + Defined in [packages/fast-check/src/arbitrary/entityGraph.ts:112](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/entityGraph.ts#L112)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
