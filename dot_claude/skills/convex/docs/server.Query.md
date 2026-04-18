---
title: "Interface: Query<TableInfo> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.Query"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* Query

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).Query

The [Query](https://docs.convex.dev/api/interfaces/server.Query.html) interface allows functions to read values out of the database.

**If you only need to load an object by ID, use `db.get(id)` instead.**

Executing a query consists of calling

1. (Optional) [order](https://docs.convex.dev/api/interfaces/server.Query.html#order) to define the order
2. (Optional) [filter](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#filter) to refine the results
3. A *consumer* method to obtain the results

Queries are lazily evaluated. No work is done until iteration begins, so constructing and
extending a query is free. The query is executed incrementally as the results are iterated over,
so early terminating also reduces the cost of the query.

It is more efficient to use `filter` expression rather than executing JavaScript to filter.

|  |  |
| --- | --- |
| **Ordering** |  |
| [`order("asc")`](https://docs.convex.dev/api/interfaces/server.Query.html#order) | Define the order of query results. |
|  |  |
| **Filtering** |  |
| [`filter(...)`](https://docs.convex.dev/api/interfaces/server.Query.html#filter) | Filter the query results to only the values that match some condition. |
|  |  |
| **Consuming** | Execute a query and return results in different ways. |
| [`[Symbol.asyncIterator]()`](server.Query.html#asynciterator) | The query's results can be iterated over using a `for await..of` loop. |
| [`collect()`](https://docs.convex.dev/api/interfaces/server.Query.html#collect) | Return all of the results as an array. |
| [`take(n: number)`](https://docs.convex.dev/api/interfaces/server.Query.html#take) | Return the first `n` results as an array. |
| [`first()`](https://docs.convex.dev/api/interfaces/server.Query.html#first) | Return the first result. |
| [`unique()`](https://docs.convex.dev/api/interfaces/server.Query.html#unique) | Return the only result, and throw if there is more than one result. |

To learn more about how to write queries, see [Querying the Database](https://docs.convex.dev/using/database-queries.html).

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.Query.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableInfo` | extends [`GenericTableInfo`](https://docs.convex.dev/api/modules/server.html#generictableinfo) |

## Hierarchy[​](https://docs.convex.dev/api/interfaces/server.Query.html#hierarchy "Direct link to Hierarchy")

* [`OrderedQuery`](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html)<`TableInfo`>

  ↳ **`Query`**

  ↳↳ [`QueryInitializer`](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html)

## Methods[​](https://docs.convex.dev/api/interfaces/server.Query.html#methods "Direct link to Methods")

### [asyncIterator][​](https://docs.convex.dev/api/interfaces/server.Query.html#asynciterator "Direct link to [asyncIterator]")

▸ **[asyncIterator]**(): `AsyncIterator`<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>, `any`, `undefined`>

#### Returns[​](https://docs.convex.dev/api/interfaces/server.Query.html#returns "Direct link to Returns")

`AsyncIterator`<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>, `any`, `undefined`>

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.Query.html#inherited-from "Direct link to Inherited from")

[OrderedQuery](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html).[[asyncIterator]](server.OrderedQuery.html#%5Basynciterator%5D)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.Query.html#defined-in "Direct link to Defined in")

../../common/temp/node\_modules/.pnpm/typescript@5.0.4/node\_modules/typescript/lib/lib.es2018.asynciterable.d.ts:38

---

### order[​](https://docs.convex.dev/api/interfaces/server.Query.html#order "Direct link to order")

▸ **order**(`order`): [`OrderedQuery`](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html)<`TableInfo`>

Define the order of the query output.

Use `"asc"` for an ascending order and `"desc"` for a descending order. If not specified, the order defaults to ascending.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.Query.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `order` | `"asc"` | `"desc"` | The order to return results in. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.Query.html#returns-1 "Direct link to Returns")

[`OrderedQuery`](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html)<`TableInfo`>

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.Query.html#defined-in-1 "Direct link to Defined in")

[server/query.ts:149](https://github.com/get-convex/convex-js/blob/main/src/server/query.ts#L149)

---

### filter[​](https://docs.convex.dev/api/interfaces/server.Query.html#filter "Direct link to filter")

▸ **filter**(`predicate`): [`Query`](https://docs.convex.dev/api/interfaces/server.Query.html)<`TableInfo`>

Filter the query output, returning only the values for which `predicate` evaluates to true.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.Query.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `predicate` | (`q`: [`FilterBuilder`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html)<`TableInfo`>) => [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`boolean`> | An [Expression](https://docs.convex.dev/api/classes/server.Expression.html) constructed with the supplied [FilterBuilder](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html) that specifies which documents to keep. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.Query.html#returns-2 "Direct link to Returns")

[`Query`](https://docs.convex.dev/api/interfaces/server.Query.html)<`TableInfo`>

* A new [OrderedQuery](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html) with the given filter predicate applied.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.Query.html#inherited-from-1 "Direct link to Inherited from")

[OrderedQuery](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html).[filter](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#filter)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.Query.html#defined-in-2 "Direct link to Defined in")

[server/query.ts:165](https://github.com/get-convex/convex-js/blob/main/src/server/query.ts#L165)

---

### paginate[​](https://docs.convex.dev/api/interfaces/server.Query.html#paginate "Direct link to paginate")

▸ **paginate**(`paginationOpts`): `Promise`<[`PaginationResult`](https://docs.convex.dev/api/interfaces/server.PaginationResult.html)<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>>>

Load a page of `n` results and obtain a [Cursor](https://docs.convex.dev/api/modules/server.html#cursor) for loading more.

Note: If this is called from a reactive query function the number of
results may not match `paginationOpts.numItems`!

`paginationOpts.numItems` is only an initial value. After the first invocation,
`paginate` will return all items in the original query range. This ensures
that all pages will remain adjacent and non-overlapping.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.Query.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `paginationOpts` | [`PaginationOptions`](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html) | A [PaginationOptions](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html) object containing the number of items to load and the cursor to start at. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.Query.html#returns-3 "Direct link to Returns")

`Promise`<[`PaginationResult`](https://docs.convex.dev/api/interfaces/server.PaginationResult.html)<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>>>

A [PaginationResult](https://docs.convex.dev/api/interfaces/server.PaginationResult.html) containing the page of results and a
cursor to continue paginating.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.Query.html#inherited-from-2 "Direct link to Inherited from")

[OrderedQuery](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html).[paginate](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#paginate)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.Query.html#defined-in-3 "Direct link to Defined in")

[server/query.ts:194](https://github.com/get-convex/convex-js/blob/main/src/server/query.ts#L194)

---

### collect[​](https://docs.convex.dev/api/interfaces/server.Query.html#collect "Direct link to collect")

▸ **collect**(): `Promise`<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>[]>

Execute the query and return all of the results as an array.

Note: when processing a query with a lot of results, it's often better to use the `Query` as an
`AsyncIterable` instead.

#### Returns[​](https://docs.convex.dev/api/interfaces/server.Query.html#returns-4 "Direct link to Returns")

`Promise`<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>[]>

* An array of all of the query's results.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.Query.html#inherited-from-3 "Direct link to Inherited from")

[OrderedQuery](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html).[collect](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#collect)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.Query.html#defined-in-4 "Direct link to Defined in")

[server/query.ts:206](https://github.com/get-convex/convex-js/blob/main/src/server/query.ts#L206)

---

### take[​](https://docs.convex.dev/api/interfaces/server.Query.html#take "Direct link to take")

▸ **take**(`n`): `Promise`<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>[]>

Execute the query and return the first `n` results.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.Query.html#parameters-3 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `n` | `number` | The number of items to take. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.Query.html#returns-5 "Direct link to Returns")

`Promise`<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>[]>

* An array of the first `n` results of the query (or less if the
  query doesn't have `n` results).

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.Query.html#inherited-from-4 "Direct link to Inherited from")

[OrderedQuery](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html).[take](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#take)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.Query.html#defined-in-5 "Direct link to Defined in")

[server/query.ts:215](https://github.com/get-convex/convex-js/blob/main/src/server/query.ts#L215)

---

### first[​](https://docs.convex.dev/api/interfaces/server.Query.html#first "Direct link to first")

▸ **first**(): `Promise`<`null` | [`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>>

Execute the query and return the first result if there is one.

#### Returns[​](https://docs.convex.dev/api/interfaces/server.Query.html#returns-6 "Direct link to Returns")

`Promise`<`null` | [`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>>

* The first value of the query or `null` if the query returned no results.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.Query.html#inherited-from-5 "Direct link to Inherited from")

[OrderedQuery](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html).[first](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#first)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.Query.html#defined-in-6 "Direct link to Defined in")

[server/query.ts:222](https://github.com/get-convex/convex-js/blob/main/src/server/query.ts#L222)

---

### unique[​](https://docs.convex.dev/api/interfaces/server.Query.html#unique "Direct link to unique")

▸ **unique**(): `Promise`<`null` | [`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>>

Execute the query and return the singular result if there is one.

**`Throws`**

Will throw an error if the query returns more than one result.

#### Returns[​](https://docs.convex.dev/api/interfaces/server.Query.html#returns-7 "Direct link to Returns")

`Promise`<`null` | [`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>>

* The single result returned from the query or null if none exists.

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.Query.html#inherited-from-6 "Direct link to Inherited from")

[OrderedQuery](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html).[unique](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#unique)

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.Query.html#defined-in-7 "Direct link to Defined in")

[server/query.ts:230](https://github.com/get-convex/convex-js/blob/main/src/server/query.ts#L230)

[Previous

PaginationResult](https://docs.convex.dev/api/interfaces/server.PaginationResult.html)[Next

QueryInitializer](https://docs.convex.dev/api/interfaces/server.QueryInitializer.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.Query.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/interfaces/server.Query.html#hierarchy)
* [Methods](https://docs.convex.dev/api/interfaces/server.Query.html#methods)
  + [[asyncIterator]](server.Query.html#asynciterator)
  + [order](https://docs.convex.dev/api/interfaces/server.Query.html#order)
  + [filter](https://docs.convex.dev/api/interfaces/server.Query.html#filter)
  + [paginate](https://docs.convex.dev/api/interfaces/server.Query.html#paginate)
  + [collect](https://docs.convex.dev/api/interfaces/server.Query.html#collect)
  + [take](https://docs.convex.dev/api/interfaces/server.Query.html#take)
  + [first](https://docs.convex.dev/api/interfaces/server.Query.html#first)
  + [unique](https://docs.convex.dev/api/interfaces/server.Query.html#unique)
