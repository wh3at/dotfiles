---
title: "Writing Data | Convex Developer Hub"
source_url: "https://docs.convex.dev/database/writing-data"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Database](https://docs.convex.dev/database.html)
* Writing Data

Copy as Markdown

Copied!

On this page

[Mutations](https://docs.convex.dev/functions/mutation-functions.html) can insert, update, and remove
data from database tables.

## Inserting new documents[​](https://docs.convex.dev/database/writing-data.html#inserting-new-documents "Direct link to Inserting new documents")

You can create new documents in the database with the
[`db.insert`](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#insert) method:

convex/tasks.ts

TS

```
import { mutation } from "./_generated/server";
import { v } from "convex/values";

export const createTask = mutation({
  args: { text: v.string() },
  handler: async (ctx, args) => {
    const taskId = await ctx.db.insert("tasks", { text: args.text });
    // do something with `taskId`
  },
});
```

The second argument to `db.insert` is a JavaScript object with data for the new
document.

The same types of values that can be passed into and returned from
[queries](https://docs.convex.dev/understanding/convex-fundamentals/functions.html) and
[mutations](https://docs.convex.dev/functions/mutation-functions.html) can be written into the database.
See [Data Types](https://docs.convex.dev/using/types.html) for the full list of supported types.

The `insert` method returns a globally unique ID for the newly inserted
document.

## Updating existing documents[​](https://docs.convex.dev/database/writing-data.html#updating-existing-documents "Direct link to Updating existing documents")

Given an existing document ID the document can be updated using the following
methods:

1. The [`db.patch`](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#patch) method
   will patch an existing document, shallow merging it with the given partial
   document. New fields are added. Existing fields are overwritten. Fields set
   to `undefined` are removed.

convex/tasks.ts

TS

```
import { mutation } from "./_generated/server";
import { v } from "convex/values";

export const updateTask = mutation({
  args: { id: v.id("tasks") },
  handler: async (ctx, args) => {
    const { id } = args;
    console.log(await ctx.db.get(id));
    // { text: "foo", status: { done: true }, _id: ... }

    // Add `tag` and overwrite `status`:
    await ctx.db.patch(id, { tag: "bar", status: { archived: true } });
    console.log(await ctx.db.get(id));
    // { text: "foo", tag: "bar", status: { archived: true }, _id: ... }

    // Unset `tag` by setting it to `undefined`
    await ctx.db.patch(id, { tag: undefined });
    console.log(await ctx.db.get(id));
    // { text: "foo", status: { archived: true }, _id: ... }
  },
});
```

2. The [`db.replace`](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#replace)
   method will replace the existing document entirely, potentially removing
   existing fields:

convex/tasks.ts

TS

```
import { mutation } from "./_generated/server";
import { v } from "convex/values";

export const replaceTask = mutation({
  args: { id: v.id("tasks") },
  handler: async (ctx, args) => {
    const { id } = args;
    console.log(await ctx.db.get(id));
    // { text: "foo", _id: ... }

    // Replace the whole document
    await ctx.db.replace(id, { invalid: true });
    console.log(await ctx.db.get(id));
    // { invalid: true, _id: ... }
  },
});
```

## Deleting documents[​](https://docs.convex.dev/database/writing-data.html#deleting-documents "Direct link to Deleting documents")

Given an existing document ID the document can be removed from the table with
the [`db.delete`](https://docs.convex.dev/api/interfaces/server.GenericDatabaseWriter.html#delete) method.

convex/tasks.ts

TS

```
import { mutation } from "./_generated/server";
import { v } from "convex/values";

export const deleteTask = mutation({
  args: { id: v.id("tasks") },
  handler: async (ctx, args) => {
    await ctx.db.delete(args.id);
  },
});
```

## Bulk inserts or updates[​](https://docs.convex.dev/database/writing-data.html#bulk-inserts-or-updates "Direct link to Bulk inserts or updates")

If you are used to SQL you might be looking for some sort of bulk insert or bulk
update statement. In Convex the entire `mutation` function is automatically a
single transaction.

You can just insert or update in a loop in the mutation function. Convex queues
up all database changes in the function and executes them all in a single
transaction when the function ends, leading to a single efficient change to the
database.

```
/**
 * Bulk insert multiple products into the database.
 *
 * Equivalent to the SQL:
 * ```sql
 * INSERT INTO products (product_id, product_name, category, price, in_stock)
 * VALUES
 *     ('Laptop Pro', 'Electronics', 1299.99, true),
 *     ('Wireless Mouse', 'Electronics', 24.95, true),
 *     ('Ergonomic Keyboard', 'Electronics', 89.50, true),
 *     ('Ultra HD Monitor', 'Electronics', 349.99, false),
 *     ('Wireless Headphones', 'Audio', 179.99, true);
 * ```
 */
export const bulkInsertProducts = mutation({
  args: {
    products: v.array(
      v.object({
        product_name: v.string(),
        category: v.string(),
        price: v.number(),
        in_stock: v.boolean(),
      }),
    ),
  },
  handler: async (ctx, args) => {
    const { products } = args;

    // Insert in a loop. This is efficient because Convex queues all the changes
    // to be executed in a single transaction when the mutation ends.
    for (const product of products) {
      const id = await ctx.db.insert("products", {
        product_name: product.product_name,
        category: product.category,
        price: product.price,
        in_stock: product.in_stock,
      });
    }
  },
});
```

## Migrations[​](https://docs.convex.dev/database/writing-data.html#migrations "Direct link to Migrations")

Database migrations are done through the migration component. The component is
designed to run online migrations to safely evolve your database schema over
time. It allows you to resume from failures, and validate changes with dry runs.

[Convex Component

### Migrations

Framework for long running data migrations of live data.](https://www.convex.dev/components/migrations)

## Write performance and limits[​](https://docs.convex.dev/database/writing-data.html#write-performance-and-limits "Direct link to Write performance and limits")

To prevent accidental writes of large amounts of records, queries and mutations
enforce limits detailed [here](https://docs.convex.dev/production/state/limits.html#transactions).

[Previous

Filters](https://docs.convex.dev/database/reading-data/filters.html)[Next

Schemas](https://docs.convex.dev/database/schemas.html)

* [Inserting new documents](https://docs.convex.dev/database/writing-data.html#inserting-new-documents)
* [Updating existing documents](https://docs.convex.dev/database/writing-data.html#updating-existing-documents)
* [Deleting documents](https://docs.convex.dev/database/writing-data.html#deleting-documents)
* [Bulk inserts or updates](https://docs.convex.dev/database/writing-data.html#bulk-inserts-or-updates)
* [Migrations](https://docs.convex.dev/database/writing-data.html#migrations)
* [Write performance and limits](https://docs.convex.dev/database/writing-data.html#write-performance-and-limits)
