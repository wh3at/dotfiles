---
title: "Reading Data | Convex Developer Hub"
source_url: "https://docs.convex.dev/database/reading-data"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Database](https://docs.convex.dev/database.html)
* Reading Data

Copy as Markdown

Copied!

On this page

[Query](https://docs.convex.dev/understanding/convex-fundamentals/functions.html) and
[mutation](https://docs.convex.dev/functions/mutation-functions.html) functions can read data from
database tables using *document ids* and *document queries*.

## Reading a single document[​](https://docs.convex.dev/using/database-queries.html#reading-a-single-document "Direct link to Reading a single document")

Given a single document's id you can read its data with the
[`db.get`](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#get) method:

convex/tasks.ts

TS

```
import { query } from "./_generated/server";
import { v } from "convex/values";

export const getTask = query({
  args: { taskId: v.id("tasks") },
  handler: async (ctx, args) => {
    const task = await ctx.db.get(args.taskId);
    // do something with `task`
  },
});
```

**Note**: You should use the `v.id` validator like in the example above to make
sure you are not exposing data from tables other than the ones you intended.

## Querying documents[​](https://docs.convex.dev/using/database-queries.html#querying-documents "Direct link to Querying documents")

Document queries always begin by choosing the table to query with the
[`db.query`](https://docs.convex.dev/api/interfaces/server.GenericDatabaseReader.html#query) method:

convex/tasks.ts

TS

```
import { query } from "./_generated/server";

export const listTasks = query({
  args: {},
  handler: async (ctx) => {
    const tasks = await ctx.db.query("tasks").collect();
    // do something with `tasks`
  },
});
```

Then you can:

1. filter
2. order
3. and `await` the results

We'll see how this works in the examples below.

## Filtering your query[​](https://docs.convex.dev/using/database-queries.html#filtering-your-query "Direct link to Filtering your query")

The best way to filter in Convex is to use indexes. Indexes build a special
internal structure in your database to speed up lookups.

There are two steps to using indexes:

1. Define the index in your `convex/schema.ts` file.
2. Query via the `withIndex()` syntax.

### 1. Define the index[​](https://docs.convex.dev/using/database-queries.html#1-define-the-index "Direct link to 1. Define the index")

If you aren't familiar with how to create a Convex schema, read the
[schema doc](https://docs.convex.dev/database/schemas.html).

Let’s assume you’re building a chat app and want to get all messages in a
particular channel. You can define a new index called `by_channel` on the
`messages` table by using the `.index()` method in your schema.

convex/schema.ts

```
import { defineSchema, defineTable } from "convex/server";
import { v } from "convex/values";

// Define a messages table with an index.
export default defineSchema({
  messages: defineTable({
    channel: v.id("channels"),
    body: v.string(),
    user: v.id("users"),
  }).index("by_channel", ["channel"]),
});
```

### 2. Filter a query with an index[​](https://docs.convex.dev/using/database-queries.html#2-filter-a-query-with-an-index "Direct link to 2. Filter a query with an index")

In your query function, you can now filter your `messages` table by using the
`by_channel` index.

```
const messages = await ctx.db
  .query("messages")
  .withIndex("by_channel", (q) => q.eq("channel", channel))
  .collect();
```

In Convex, you must explicitly use the `withIndex()` syntax to ensure your
database uses the index. This differs from a more traditional SQL database,
where the database implicitly chooses to use an index based on heuristics. The
Convex approach leads to fewer surprises in the long run.

You can create an index across multiple fields at once, query a specific range
of data, and change the order of your query result.
[Read the complete index documentation](https://docs.convex.dev/database/reading-data/indexes/index.html)
to learn more.

Convex also supports a slower filtering mechanism that effectively loops through
the table to match the filter. This can be useful if you know your table will be
small (low thousands of rows), you're prototyping, or you want to filter an
index query further. You can read more about filters
[here](https://docs.convex.dev/database/reading-data/filters.html).

## Ordering[​](https://docs.convex.dev/using/database-queries.html#ordering "Direct link to Ordering")

By default Convex always returns documents ordered by
[`_creationTime`](https://docs.convex.dev/using/types.html#system-fields).

You can use [`.order("asc" | "desc")`](https://docs.convex.dev/api/interfaces/server.Query.html#order) to
pick whether the order is ascending or descending. If the order isn't specified,
it defaults to ascending.

```
// Get all messages, oldest to newest.
const messages = await ctx.db.query("messages").order("asc").collect();
```

```
// Get all messages, newest to oldest.
const messages = await ctx.db.query("messages").order("desc").collect();
```

If you need to sort on a field other than `_creationTime` and your document
query returns a small number of documents (on the order of hundreds rather than
thousands of documents), consider sorting in JavaScript:

```
// Get top 10 most liked messages, assuming messages is a fairly small table:
const messages = await ctx.db.query("messages").collect();
const topTenMostLikedMessages = recentMessages
  .sort((a, b) => b.likes - a.likes)
  .slice(0, 10);
```

For document queries that return larger numbers of documents, you'll want to use
an [index](https://docs.convex.dev/database/reading-data/indexes/index.html) to improve the
performance. Document queries that use indexes will be
[ordered based on the columns in the index](https://docs.convex.dev/database/reading-data/indexes/index.html#sorting-with-indexes)
and can avoid slow table scans.

```
// Get the top 20 most liked messages of all time, using the "by_likes" index.
const messages = await ctx.db
  .query("messages")
  .withIndex("by_likes")
  .order("desc")
  .take(20);
```

See [Limits](https://docs.convex.dev/database/reading-data/indexes/index.html#limits) for details.

### Ordering of different types of values[​](https://docs.convex.dev/using/database-queries.html#ordering-of-different-types-of-values "Direct link to Ordering of different types of values")

A single field can have values of any [Convex type](https://docs.convex.dev/using/types.html). When
there are values of different types in an indexed field, their ascending order
is as follows:

No value set (`undefined`) < Null (`null`) < Int64 (`bigint`) <
Float64 (`number`) < Boolean (`boolean`) < String (`string`) <
Bytes (`ArrayBuffer`) < Array (`Array`) < Object (`Object`)

The same ordering is used by the filtering comparison operators `q.lt()`,
`q.lte()`, `q.gt()` and `q.gte()`.

## Retrieving results[​](https://docs.convex.dev/using/database-queries.html#retrieving-results "Direct link to Retrieving results")

Most of our previous examples have ended the document query with the
[`.collect()`](https://docs.convex.dev/api/interfaces/server.Query.html#collect) method, which returns all
the documents that match your filters. Here are the other options for retrieving
results.

### Taking `n` results[​](https://docs.convex.dev/using/database-queries.html#taking-n-results "Direct link to taking-n-results")

[`.take(n)`](https://docs.convex.dev/api/interfaces/server.Query.html#take) selects only the first `n`
results that match your query.

```
const users = await ctx.db.query("users").take(5);
```

### Finding the first result[​](https://docs.convex.dev/using/database-queries.html#finding-the-first-result "Direct link to Finding the first result")

[`.first()`](https://docs.convex.dev/api/interfaces/server.Query.html#first) selects the first document that
matches your query and returns `null` if no documents were found.

```
// We expect only one user with that email address.
const userOrNull = await ctx.db
  .query("users")
  .withIndex("by_email", (q) => q.eq("email", "test@example.com"))
  .first();
```

### Using a unique result[​](https://docs.convex.dev/using/database-queries.html#using-a-unique-result "Direct link to Using a unique result")

[`.unique()`](https://docs.convex.dev/api/interfaces/server.Query.html#unique) selects the single document
from your query or returns `null` if no documents were found. If there are
multiple results it will throw an exception.

```
// Our counter table only has one document.
const counterOrNull = await ctx.db.query("counter").unique();
```

### Loading a page of results[​](https://docs.convex.dev/using/database-queries.html#loading-a-page-of-results "Direct link to Loading a page of results")

[`.paginate(opts)`](https://docs.convex.dev/api/interfaces/server.OrderedQuery.html#paginate) loads a page
of results and returns a [`Cursor`](https://docs.convex.dev/api/modules/server.html#cursor) for loading
additional results.

See [Paginated Queries](https://docs.convex.dev/database/pagination.html) to learn more.

## More complex queries[​](https://docs.convex.dev/using/database-queries.html#more-complex-queries "Direct link to More complex queries")

Convex prefers to have a few, simple ways to walk through and select documents
from tables. In Convex, there is no specific query language for complex logic
like a join, an aggregation, or a group by.

Instead, you can write the complex logic in JavaScript! Convex guarantees that
the results will be consistent.

### Join[​](https://docs.convex.dev/using/database-queries.html#join "Direct link to Join")

Table join might look like:

convex/events.ts

TS

```
import { query } from "./_generated/server";
import { v } from "convex/values";

export const eventAttendees = query({
  args: { eventId: v.id("events") },
  handler: async (ctx, args) => {
    const event = await ctx.db.get(args.eventId);
    return Promise.all(
      (event?.attendeeIds ?? []).map((userId) => ctx.db.get(userId)),
    );
  },
});
```

### Aggregation[​](https://docs.convex.dev/using/database-queries.html#aggregation "Direct link to Aggregation")

Here's an example of computing an average:

convex/purchases.ts

TS

```
import { query } from "./_generated/server";
import { v } from "convex/values";

export const averagePurchasePrice = query({
  args: { email: v.string() },
  handler: async (ctx, args) => {
    const userPurchases = await ctx.db
      .query("purchases")
      .withIndex("by_buyer", (q) => q.eq("buyer", args.email))
      .collect();
    const sum = userPurchases.reduce((a, { value: b }) => a + b, 0);
    return sum / userPurchases.length;
  },
});
```

> If you need more scalable aggregate options (for example to handle frequent
> updates or large tables), consider using the
> [Sharded Counter](https://www.convex.dev/components/sharded-counter) or
> [Aggregate](https://www.convex.dev/components/aggregate) components. These
> components can help you handle high-throughput counters, sums, or computations
> without looping through the whole table.

### Group by[​](https://docs.convex.dev/using/database-queries.html#group-by "Direct link to Group by")

Here's an example of grouping and counting:

convex/purchases.ts

TS

```
import { query } from "./_generated/server";
import { v } from "convex/values";

export const numPurchasesPerBuyer = query({
  args: { email: v.string() },
  handler: async (ctx, args) => {
    const userPurchases = await ctx.db.query("purchases").collect();

    return userPurchases.reduce(
      (counts, { buyer }) => ({
        ...counts,
        [buyer]: counts[buyer] ?? 0 + 1,
      }),
      {} as Record<string, number>,
    );
  },
});
```

## Explore the syntax on the dashboard[​](https://docs.convex.dev/using/database-queries.html#explore-the-syntax-on-the-dashboard "Direct link to Explore the syntax on the dashboard")

You can try out the syntax described above directly from the dashboard by
[writing a custom test query](https://docs.convex.dev/dashboard/deployments/data.html#writing-custom-queries).

[Previous

Database](https://docs.convex.dev/database.html)[Next

Indexes](https://docs.convex.dev/database/reading-data/indexes/index.html)

* [Reading a single document](https://docs.convex.dev/using/database-queries.html#reading-a-single-document)
* [Querying documents](https://docs.convex.dev/using/database-queries.html#querying-documents)
* [Filtering your query](https://docs.convex.dev/using/database-queries.html#filtering-your-query)
  + [1. Define the index](https://docs.convex.dev/using/database-queries.html#1-define-the-index)
  + [2. Filter a query with an index](https://docs.convex.dev/using/database-queries.html#2-filter-a-query-with-an-index)
* [Ordering](https://docs.convex.dev/using/database-queries.html#ordering)
  + [Ordering of different types of values](https://docs.convex.dev/using/database-queries.html#ordering-of-different-types-of-values)
* [Retrieving results](https://docs.convex.dev/using/database-queries.html#retrieving-results)
  + [Taking `n` results](https://docs.convex.dev/using/database-queries.html#taking-n-results)
  + [Finding the first result](https://docs.convex.dev/using/database-queries.html#finding-the-first-result)
  + [Using a unique result](https://docs.convex.dev/using/database-queries.html#using-a-unique-result)
  + [Loading a page of results](https://docs.convex.dev/using/database-queries.html#loading-a-page-of-results)
* [More complex queries](https://docs.convex.dev/using/database-queries.html#more-complex-queries)
  + [Join](https://docs.convex.dev/using/database-queries.html#join)
  + [Aggregation](https://docs.convex.dev/using/database-queries.html#aggregation)
  + [Group by](https://docs.convex.dev/using/database-queries.html#group-by)
* [Explore the syntax on the dashboard](https://docs.convex.dev/using/database-queries.html#explore-the-syntax-on-the-dashboard)
