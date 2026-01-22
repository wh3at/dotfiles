---
title: "Interface: PaginationResult<T> | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.PaginationResult"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* PaginationResult

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).PaginationResult

The result of paginating using [paginate](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#paginate).

## Type parameters[​](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#type-parameters "Direct link to Type parameters")

| Name |
| --- |
| `T` |

## Properties[​](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#properties "Direct link to Properties")

### page[​](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#page "Direct link to page")

• **page**: `T`[]

The page of results.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#defined-in "Direct link to Defined in")

[server/pagination.ts:32](https://github.com/get-convex/convex-js/blob/main/src/server/pagination.ts#L32)

---

### isDone[​](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#isdone "Direct link to isDone")

• **isDone**: `boolean`

Have we reached the end of the results?

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#defined-in-1 "Direct link to Defined in")

[server/pagination.ts:37](https://github.com/get-convex/convex-js/blob/main/src/server/pagination.ts#L37)

---

### continueCursor[​](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#continuecursor "Direct link to continueCursor")

• **continueCursor**: `string`

A [Cursor](https://docs.convex.dev/api/modules/server.html#cursor) to continue loading more results.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#defined-in-2 "Direct link to Defined in")

[server/pagination.ts:42](https://github.com/get-convex/convex-js/blob/main/src/server/pagination.ts#L42)

---

### splitCursor[​](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#splitcursor "Direct link to splitCursor")

• `Optional` **splitCursor**: `null` | `string`

A [Cursor](https://docs.convex.dev/api/modules/server.html#cursor) to split the page into two, so the page from
(cursor, continueCursor] can be replaced by two pages (cursor, splitCursor]
and (splitCursor, continueCursor].

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#defined-in-3 "Direct link to Defined in")

[server/pagination.ts:49](https://github.com/get-convex/convex-js/blob/main/src/server/pagination.ts#L49)

---

### pageStatus[​](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#pagestatus "Direct link to pageStatus")

• `Optional` **pageStatus**: `null` | `"SplitRecommended"` | `"SplitRequired"`

When a query reads too much data, it may return 'SplitRecommended' to
indicate that the page should be split into two with `splitCursor`.
When a query reads so much data that `page` might be incomplete, its status
becomes 'SplitRequired'.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#defined-in-4 "Direct link to Defined in")

[server/pagination.ts:57](https://github.com/get-convex/convex-js/blob/main/src/server/pagination.ts#L57)

[Previous

PaginationOptions](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html)[Next

Query](https://docs.convex.dev/api/interfaces/server.Query.html)

* [Type parameters](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#type-parameters)
* [Properties](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#properties)
  + [page](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#page)
  + [isDone](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#isdone)
  + [continueCursor](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#continuecursor)
  + [splitCursor](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#splitcursor)
  + [pageStatus](https://docs.convex.dev/api/interfaces/server.PaginationResult.html#pagestatus)
