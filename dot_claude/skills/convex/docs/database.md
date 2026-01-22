---
title: "Database | Convex Developer Hub"
source_url: "https://docs.convex.dev/database"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



Copy as Markdown

Copied!

The Convex database provides a relational data model, stores JSON-like
documents, and can be used with or without a schema. It "just works," giving you
predictable query performance in an easy-to-use interface.

Query and mutation [functions](https://docs.convex.dev/functions.html) read and write data through a
lightweight JavaScript API. There is nothing to set up and no need to write any
SQL. Just use JavaScript to express your app's needs.

Start by learning about the basics of [tables](https://docs.convex.dev/database.html#tables), [documents](https://docs.convex.dev/database.html#documents)
and [schemas](https://docs.convex.dev/database.html#schemas) below, then move on to
[Reading Data](https://docs.convex.dev/database/reading-data/index.html) and
[Writing Data](https://docs.convex.dev/database/writing-data.html).

As your app grows more complex you'll need more from your database:

* Relational data modeling with [Document IDs](https://docs.convex.dev/database/document-ids.html)
* Fast querying with [Indexes](https://docs.convex.dev/database/reading-data/indexes/index.html)
* Exposing large datasets with [Paginated Queries](https://docs.convex.dev/database/pagination.html)
* Type safety by [Defining a Schema](https://docs.convex.dev/database/schemas.html)
* Interoperability with data
  [Import & Export](https://docs.convex.dev/database/import-export/index.html)

## Tables[​](https://docs.convex.dev/database.html#tables "Direct link to Tables")

Your Convex deployment contains tables that hold your app's data. Initially,
your deployment contains no tables or documents.

Each table springs into existence as soon as you add the first document to it.

```
// `friends` table doesn't exist.
await ctx.db.insert("friends", { name: "Jamie" });
// Now it does, and it has one document.
```

You do not have to specify a schema upfront or create tables explicitly.

## Documents[​](https://docs.convex.dev/database.html#documents "Direct link to Documents")

Tables contain documents. Documents are very similar to JavaScript objects. They
have fields and values, and you can nest arrays or objects within them.

These are all valid Convex documents:

```
{}
{"name": "Jamie"}
{"name": {"first": "Ari", "second": "Cole"}, "age": 60}
```

They can also contain references to other documents in other tables. See
[Data Types](https://docs.convex.dev/using/types.html) to learn more about the types supported in
Convex and [Document IDs](https://docs.convex.dev/database/document-ids.html) to learn about how to use
those types to model your data.

## Schemas[​](https://docs.convex.dev/database.html#schemas "Direct link to Schemas")

Though optional, schemas ensure that your data looks exactly how you want. For a
simple chat app, the schema will look like this:

```
import { defineSchema, defineTable } from "convex/server";
import { v } from "convex/values";

// @snippet start schema
export default defineSchema({
  messages: defineTable({
    author: v.id("users"),
    body: v.string(),
  }),
});
```

You can choose to be as flexible as you want by using types such as `v.any()` or
as specific as you want by precisely describing a `v.object()`.

See [the schema documentation](https://docs.convex.dev/database/schemas.html) to learn more about
schemas.

[## Next: Reading Data

Query and read data from Convex database tables](https://docs.convex.dev/using/database-queries.html)

Related posts from [![Stack](https://docs.convex.dev/img/stack-logo-dark.svg)![Stack](https://docs.convex.dev/img/stack-logo-light.svg)](https://stack.convex.dev/)

[Previous

Functions](https://docs.convex.dev/functions.html)[Next

Reading Data](https://docs.convex.dev/database/reading-data/index.html)
