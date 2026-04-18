---
title: "Errors and Warnings | Convex Developer Hub"
source_url: "https://docs.convex.dev/error"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



Copy as Markdown

Copied!

On this page

This page explains specific errors thrown by Convex.

See [Error Handling](https://docs.convex.dev/functions/error-handling/index.html) to learn
about handling errors in general.

## Write conflict: Optimistic concurrency control[​](https://docs.convex.dev/error.html#1 "Direct link to Write conflict: Optimistic concurrency control")

This system error is thrown when a mutation repeatedly fails due to conflicting
changes from parallel mutation executions.

### Example A[​](https://docs.convex.dev/error.html#example-a "Direct link to Example A")

A mutation `updateCounter` always updates the same document:

```
export const updateCounter = mutation({
  args: {},
  handler: async (ctx) => {
    const doc = await ctx.db.get(process.env.COUNTER_ID);
    await ctx.db.patch(doc._id, { value: doc.value + 1 });
  },
});
```

If this mutation is called many times per second, many of its executions will
conflict with each other. Convex internally does several retries to mitigate
this concern, but if the mutation is called more rapidly than Convex can execute
it, some of the invocations will eventually throw this error:

> failure `updateCounter`
>
> Documents read from or written to the table "counters" changed while this
> mutation was being run and on every subsequent retry. Another call to this
> mutation changed the document with ID "123456789101112".

The error message will note the table name, which mutation caused the conflict
(in this example its another call to the same mutation), and one document ID
which was part of the conflicting change.

### Example B[​](https://docs.convex.dev/error.html#example-b "Direct link to Example B")

Mutation `writeCount` depends on the entire `tasks` table:

```
export const writeCount = mutation({
  args: {
    target: v.id("counts"),
  },
  handler: async (ctx, args) => {
    const tasks = await ctx.db.query("tasks").collect();
    await ctx.db.patch(args.target, { value: tasks });
  },
});

export const addTask = mutation({
  args: {
    text: v.string(),
  },
  handler: async (ctx, args) => {
    await ctx.db.insert("tasks", { text: args.text });
  },
});
```

If the mutation `writeCount` is called at the same time as many calls to
`addTask` are made, either of the mutations can fail with this error. This is
because any change to the `"tasks"` table will conflict with the `writeCount`
mutation:

> failure `writeCount`
>
> Documents read from or written to the table "tasks" changed while this
> mutation was being run and on every subsequent retry. A call to "addTask"
> changed the document with ID "123456789101112".

### Remediation[​](https://docs.convex.dev/error.html#remediation "Direct link to Remediation")

To fix this issue:

1. Make sure that your mutations only read the data they need. Consider reducing
   the amount of data read by using indexed queries with
   [selective index range expressions](https://docs.convex.dev/database/indexes/index.html).
2. Make sure you are not calling a mutation an unexpected number of times,
   perhaps from an action inside a loop.
3. Design your data model such that it doesn't require making many writes to the
   same document.

### Resources[​](https://docs.convex.dev/error.html#resources "Direct link to Resources")

* Learn more about [optimistic concurrency control](https://docs.convex.dev/database/advanced/occ.html).
* See this [Stack post](https://stack.convex.dev/waitlist) for an example of
  designing an app to avoid mutation conflicts.

### Related Components[​](https://docs.convex.dev/error.html#related-components "Direct link to Related Components")

[Convex Component

### Workpool

Workpool give critical tasks priority by organizing async operations into separate, customizable queues.](https://www.convex.dev/components/workpool)[Convex Component

### Sharded Counter

High-throughput counter enables denormalized counts without write conflicts by spreading writes over multiple documents.](https://www.convex.dev/components/sharded-counter)[Convex Component

### Action Cache

Cache frequently run actions. By leveraging the `force` parameter to keep the cache populated, you can ensure that the cache is always up to date and avoid data races.](https://www.convex.dev/components/action-cache)

[Previous

List custom domains](https://docs.convex.dev/management-api/list-custom-domains.html)[Next

ESLint](https://docs.convex.dev/eslint.html)

* [Write conflict: Optimistic concurrency control](https://docs.convex.dev/error.html#1)
  + [Example A](https://docs.convex.dev/error.html#example-a)
  + [Example B](https://docs.convex.dev/error.html#example-b)
  + [Remediation](https://docs.convex.dev/error.html#remediation)
  + [Resources](https://docs.convex.dev/error.html#resources)
  + [Related Components](https://docs.convex.dev/error.html#related-components)
