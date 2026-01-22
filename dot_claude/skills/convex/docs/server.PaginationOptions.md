---
title: "Interface: PaginationOptions | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.PaginationOptions"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* PaginationOptions

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).PaginationOptions

The options passed to [paginate](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#paginate).

To use this type in [argument validation](https://docs.convex.dev/functions/validation.html),
use the [paginationOptsValidator](https://docs.convex.dev/api/modules/server.html#paginationoptsvalidator).

## Properties[​](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html#properties "Direct link to Properties")

### numItems[​](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html#numitems "Direct link to numItems")

• **numItems**: `number`

Number of items to load in this page of results.

Note: This is only an initial value!

If you are running this paginated query in a reactive query function, you
may receive more or less items than this if items were added to or removed
from the query range.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html#defined-in "Direct link to Defined in")

[server/pagination.ts:78](https://github.com/get-convex/convex-js/blob/main/src/server/pagination.ts#L78)

---

### cursor[​](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html#cursor "Direct link to cursor")

• **cursor**: `null` | `string`

A [Cursor](https://docs.convex.dev/api/modules/server.html#cursor) representing the start of this page or `null` to start
at the beginning of the query results.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html#defined-in-1 "Direct link to Defined in")

[server/pagination.ts:84](https://github.com/get-convex/convex-js/blob/main/src/server/pagination.ts#L84)

[Previous

OrderedQuery](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html)[Next

PaginationResult](https://docs.convex.dev/api/interfaces/server.PaginationResult.html)

* [Properties](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html#properties)
  + [numItems](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html#numitems)
  + [cursor](https://docs.convex.dev/api/interfaces/server.PaginationOptions.html#cursor)
