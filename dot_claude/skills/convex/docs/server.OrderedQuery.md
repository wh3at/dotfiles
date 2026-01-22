---
title: "Interface: OrderedQuery<TableInfo> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.OrderedQuery"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* OrderedQuery

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).OrderedQuery

A [Query](https://docs.convex.dev/api/interfaces/server.Query.html) with an order that has already been defined.

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#type-parameters "Direct link to Type parameters")

| Name | Type |
| --- | --- |
| `TableInfo` | extends [`GenericTableInfo`](https://docs.convex.dev/api/modules/server.html#generictableinfo) |

## Hierarchy[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#hierarchy "Direct link to Hierarchy")

* `AsyncIterable`<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>>

  ↳ **`OrderedQuery`**

  ↳↳ [`Query`](https://docs.convex.dev/api/interfaces/server.Query.html)

## Methods[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#methods "Direct link to Methods")

### [asyncIterator][​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#asynciterator "Direct link to [asyncIterator]")

▸ **[asyncIterator]**(): `AsyncIterator`<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>, `any`, `undefined`>

#### Returns[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#returns "Direct link to Returns")

`AsyncIterator`<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>, `any`, `undefined`>

#### Inherited from[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#inherited-from "Direct link to Inherited from")

AsyncIterable.[asyncIterator]

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#defined-in "Direct link to Defined in")

../../common/temp/node\_modules/.pnpm/typescript@5.0.4/node\_modules/typescript/lib/lib.es2018.asynciterable.d.ts:38

---

### filter[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#filter "Direct link to filter")

▸ **filter**(`predicate`): [`OrderedQuery`](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html)<`TableInfo`>

Filter the query output, returning only the values for which `predicate` evaluates to true.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#parameters "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `predicate` | (`q`: [`FilterBuilder`](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html)<`TableInfo`>) => [`ExpressionOrValue`](https://docs.convex.dev/api/modules/server.html#expressionorvalue)<`boolean`> | An [Expression](https://docs.convex.dev/api/classes/server.Expression.html) constructed with the supplied [FilterBuilder](https://docs.convex.dev/api/interfaces/server.FilterBuilder.html) that specifies which documents to keep. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#returns-1 "Direct link to Returns")

[`OrderedQuery`](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html)<`TableInfo`>

* A new [OrderedQuery](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html) with the given filter predicate applied.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#defined-in-1 "Direct link to Defined in")

[server/query.ts:165](https://github.com/get-convex/convex-js/blob/main/src/server/query.ts#L165)

---

### paginate[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#paginate "Direct link to paginate")

▸ **paginate**(`paginationOpts`): `Promise`<[`PaginationResult`](https://docs.convex.dev/api/interfaces/server.PaginationResult.html)<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>>>

Load a page of `n` results and obtain a [Cursor](https://docs.convex.dev/api/modules/server.html#cursor) for loading more.

Note: If this is called from a reactive query function the number of
results may not match `paginationOpts.numItems`!

`paginationOpts.numItems` is only an initial value. After the first invocation,
`paginate` will return all items in the original query range. This ensures
that all pages will remain adjacent and non-overlapping.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#parameters-1 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `paginationOpts` | [`PaginationOptions`](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html) | A [PaginationOptions](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html) object containing the number of items to load and the cursor to start at. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#returns-2 "Direct link to Returns")

`Promise`<[`PaginationResult`](https://docs.convex.dev/api/interfaces/server.PaginationResult.html)<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>>>

A [PaginationResult](https://docs.convex.dev/api/interfaces/server.PaginationResult.html) containing the page of results and a
cursor to continue paginating.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#defined-in-2 "Direct link to Defined in")

[server/query.ts:194](https://github.com/get-convex/convex-js/blob/main/src/server/query.ts#L194)

---

### collect[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#collect "Direct link to collect")

▸ **collect**(): `Promise`<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>[]>

Execute the query and return all of the results as an array.

Note: when processing a query with a lot of results, it's often better to use the `Query` as an
`AsyncIterable` instead.

#### Returns[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#returns-3 "Direct link to Returns")

`Promise`<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>[]>

* An array of all of the query's results.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#defined-in-3 "Direct link to Defined in")

[server/query.ts:206](https://github.com/get-convex/convex-js/blob/main/src/server/query.ts#L206)

---

### take[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#take "Direct link to take")

▸ **take**(`n`): `Promise`<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>[]>

Execute the query and return the first `n` results.

#### Parameters[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `n` | `number` | The number of items to take. |

#### Returns[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#returns-4 "Direct link to Returns")

`Promise`<[`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>[]>

* An array of the first `n` results of the query (or less if the
  query doesn't have `n` results).

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#defined-in-4 "Direct link to Defined in")

[server/query.ts:215](https://github.com/get-convex/convex-js/blob/main/src/server/query.ts#L215)

---

### first[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#first "Direct link to first")

▸ **first**(): `Promise`<`null` | [`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>>

Execute the query and return the first result if there is one.

#### Returns[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#returns-5 "Direct link to Returns")

`Promise`<`null` | [`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>>

* The first value of the query or `null` if the query returned no results.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#defined-in-5 "Direct link to Defined in")

[server/query.ts:222](https://github.com/get-convex/convex-js/blob/main/src/server/query.ts#L222)

---

### unique[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#unique "Direct link to unique")

▸ **unique**(): `Promise`<`null` | [`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>>

Execute the query and return the singular result if there is one.

**`Throws`**

Will throw an error if the query returns more than one result.

#### Returns[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#returns-6 "Direct link to Returns")

`Promise`<`null` | [`DocumentByInfo`](https://docs.convex.dev/api/modules/server.html#documentbyinfo)<`TableInfo`>>

* The single result returned from the query or null if none exists.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#defined-in-6 "Direct link to Defined in")

[server/query.ts:230](https://github.com/get-convex/convex-js/blob/main/src/server/query.ts#L230)

[Previous

IndexRangeBuilder](https://docs.convex.dev/api/interfaces/server.IndexRangeBuilder.html)[Next

PaginationOptions](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#type-parameters)
* [Hierarchy](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#hierarchy)
* [Methods](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#methods)
  + [[asyncIterator]](server.OrderedQuery.html#asynciterator)
  + [filter](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#filter)
  + [paginate](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#paginate)
  + [collect](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#collect)
  + [take](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#take)
  + [first](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#first)
  + [unique](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#unique)
