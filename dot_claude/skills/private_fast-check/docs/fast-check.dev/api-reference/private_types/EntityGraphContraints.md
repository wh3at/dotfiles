---
title: "EntityGraphContraints | API Reference | fast-check | Property based testing framework"
source_url: "https://fast-check.dev/api-reference/types/EntityGraphContraints"
fetched_at: "2025-12-29T00:52:54.722856+00:00"
---



* [EntityGraphContraints](https://fast-check.dev/api-reference/types/EntityGraphContraints.html)

# Type Alias EntityGraphContraints<TEntityFields>

Constraints to be applied on [entityGraph](https://fast-check.dev/api-reference/functions/entityGraph.html)

#### Remarks

Since 4.5.0

type EntityGraphContraints<[TEntityFields](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#tentityfields)> = {
    [initialPoolConstraints](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#initialpoolconstraints)?: {
        [EntityName in keyof [TEntityFields](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#tentityfields)]?: [ArrayConstraints](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html)
    };
    [noNullPrototype](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#nonullprototype)?: boolean;
    [unicityConstraints](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#unicityconstraints)?: {
        [EntityName in keyof [TEntityFields](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#tentityfields)]?: [UniqueArrayConstraintsRecommended](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsRecommended.html)<
            [TEntityFields](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#tentityfields)[EntityName],
            unknown,
        >["selector"]
    };
}

#### Type Parameters

* TEntityFields

* Defined in [packages/fast-check/src/arbitrary/entityGraph.ts:20](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/entityGraph.ts#L20)

##### Index

### Properties

[initialPoolConstraints?](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#initialpoolconstraints)
[noNullPrototype?](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#nonullprototype)
[unicityConstraints?](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#unicityconstraints)

## Properties

### `Optional`initialPoolConstraints

initialPoolConstraints?: {
    [EntityName in keyof [TEntityFields](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#tentityfields)]?: [ArrayConstraints](https://fast-check.dev/api-reference/interfaces/ArrayConstraints.html)
}

Controls the minimum number of entities generated for each entity type in the initial pool.

The initial pool defines the baseline set of entities that are created before any relationships
are established. Other entities may be created later to satisfy relationship requirements.

#### Example

```
// Ensure at least 2 employees and at most 5 teams in the initial pool
// But possibly more than 5 teams at the end
{ initialPoolConstraints: { employee: { minLength: 2 }, team: { maxLength: 5 } } }
Copy
```

#### Default Value

When unspecified, defaults from [array](https://fast-check.dev/api-reference/functions/array.html) are used for each entity type

#### Remarks

Since 4.5.0

* Defined in [packages/fast-check/src/arbitrary/entityGraph.ts:37](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/entityGraph.ts#L37)

### `Optional`noNullPrototype

noNullPrototype?: boolean

Do not generate values with null prototype

#### Default Value

```
false
Copy
```

#### Remarks

Since 4.5.0

* Defined in [packages/fast-check/src/arbitrary/entityGraph.ts:64](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/entityGraph.ts#L64)

### `Optional`unicityConstraints

unicityConstraints?: {
    [EntityName in keyof [TEntityFields](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#tentityfields)]?: [UniqueArrayConstraintsRecommended](https://fast-check.dev/api-reference/types/UniqueArrayConstraintsRecommended.html)<
        [TEntityFields](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#tentityfields)[EntityName],
        unknown,
    >["selector"]
}

Defines uniqueness criteria for entities of each type to prevent duplicate values.

The selector function extracts a key from each entity. Entities with identical keys
(compared using `Object.is`) are considered duplicates and only one instance will be kept.

#### Example

```
// Ensure employees have unique names
{ unicityConstraints: { employee: (emp) => emp.name } }
Copy
```

#### Default Value

```
All entities are considered unique (no deduplication is performed)
Copy
```

#### Remarks

Since 4.5.0

* Defined in [packages/fast-check/src/arbitrary/entityGraph.ts:53](https://github.com/dubzzz/fast-check/blob/0053f7651f2ff4e6f259d946651a7ca7ff5a9115/packages/fast-check/src/arbitrary/entityGraph.ts#L53)

### Settings

Member Visibility

* Protected
* Inherited
* External

ThemeOSLightDark

### On This Page

Properties

[initialPoolConstraints](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#initialpoolconstraints)[noNullPrototype](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#nonullprototype)[unicityConstraints](https://fast-check.dev/api-reference/types/EntityGraphContraints.html#unicityconstraints)

[API Reference | fast-check | Property based testing framework](https://fast-check.dev/api-reference/index.html)

* Loading...
