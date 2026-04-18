---
title: "Mutations | Convex Developer Hub"
source_url: "https://docs.convex.dev/functions/mutation-functions"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Functions](https://docs.convex.dev/functions.html)
* Mutations

Copy as Markdown

Copied!

On this page

Mutations insert, update and remove data from the database, check authentication
or perform other business logic, and optionally return a response to the client
application.

This is an example mutation, taking in named arguments, writing data to the
database and returning a result:

convex/myFunctions.ts

TS

```
import { mutation } from "./_generated/server";
import { v } from "convex/values";

// Create a new task with the given text
export const createTask = mutation({
  args: { text: v.string() },
  handler: async (ctx, args) => {
    const newTaskId = await ctx.db.insert("tasks", { text: args.text });
    return newTaskId;
  },
});
```

Read on to understand how to build mutations yourself.

## Mutation names[​](https://docs.convex.dev/functions/mutation-functions.html#mutation-names "Direct link to Mutation names")

Mutations follow the same naming rules as queries, see
[Query names](https://docs.convex.dev/understanding/convex-fundamentals/functions.html#query-names).

Queries and mutations can be defined in the same file when using named exports.

## The `mutation` constructor[​](https://docs.convex.dev/functions/mutation-functions.html#the-mutation-constructor "Direct link to the-mutation-constructor")

To declare a mutation in Convex use the `mutation` constructor function. Pass it
an object with a `handler` function, which performs the mutation:

convex/myFunctions.ts

TS

```
import { mutation } from "./_generated/server";

export const mutateSomething = mutation({
  args: {},
  handler: () => {
    // implementation will be here
  },
});
```

Unlike a query, a mutation can but does not have to return a value.

### Mutation arguments[​](https://docs.convex.dev/functions/mutation-functions.html#mutation-arguments "Direct link to Mutation arguments")

Just like queries, mutations accept named arguments, and the argument values are
accessible as fields of the second parameter of the `handler` function:

convex/myFunctions.ts

TS

```
import { mutation } from "./_generated/server";

export const mutateSomething = mutation({
  handler: (_, args: { a: number; b: number }) => {
    // do something with `args.a` and `args.b`

    // optionally return a value
    return "success";
  },
});
```

Arguments and responses are automatically serialized and deserialized, and you
can pass and return most value-like JavaScript data to and from your mutation.

To both declare the types of arguments and to validate them, add an `args`
object using `v` validators:

convex/myFunctions.ts

TS

```
import { mutation } from "./_generated/server";
import { v } from "convex/values";

export const mutateSomething = mutation({
  args: { a: v.number(), b: v.number() },
  handler: (_, args) => {
    // do something with `args.a` and `args.b`
  },
});
```

See [argument validation](https://docs.convex.dev/functions/validation.html) for the full list of
supported types and validators.

The first parameter to the handler function is reserved for the mutation
context.

### Mutation responses[​](https://docs.convex.dev/functions/mutation-functions.html#mutation-responses "Direct link to Mutation responses")

Queries can return values of any supported
[Convex type](https://docs.convex.dev/functions/validation.html) which will be automatically serialized
and deserialized.

Mutations can also return `undefined`, which is not a valid Convex value. When a
mutation returns `undefined` **it is translated to `null`** on the client.

### Mutation context[​](https://docs.convex.dev/functions/mutation-functions.html#mutation-context "Direct link to Mutation context")

The `mutation` constructor enables writing data to the database, and other
Convex features by passing a [MutationCtx](https://docs.convex.dev/generated-api/server.html#mutationctx)
object to the handler function as the first parameter:

convex/myFunctions.ts

TS

```
import { mutation } from "./_generated/server";
import { v } from "convex/values";

export const mutateSomething = mutation({
  args: { a: v.number(), b: v.number() },
  handler: (ctx, args) => {
    // Do something with `ctx`
  },
});
```

Which part of the mutation context is used depends on what your mutation needs
to do:

* To read from and write to the database use the `db` field. Note that we make
  the handler function an `async` function so we can `await` the promise
  returned by `db.insert()`:

  convex/myFunctions.ts

  TS

  ```
  import { mutation } from "./_generated/server";
  import { v } from "convex/values";

  export const addItem = mutation({
    args: { text: v.string() },
    handler: async (ctx, args) => {
      await ctx.db.insert("tasks", { text: args.text });
    },
  });
  ```

  Read on about [Writing Data](https://docs.convex.dev/database/writing-data.html).
* To generate upload URLs for storing files use the `storage` field. Read on
  about [File Storage](https://docs.convex.dev/file-storage.html).
* To check user authentication use the `auth` field. Read on about
  [Authentication](https://docs.convex.dev/auth.html).
* To schedule functions to run in the future, use the `scheduler` field. Read on
  about [Scheduled Functions](https://docs.convex.dev/scheduling/scheduled-functions.html).

## Splitting up mutation code via helpers[​](https://docs.convex.dev/functions/mutation-functions.html#splitting-up-mutation-code-via-helpers "Direct link to Splitting up mutation code via helpers")

When you want to split up the code in your mutation or reuse logic across
multiple Convex functions you can define and call helper

TypeScript

functions:

convex/myFunctions.ts

TS

```
import { v } from "convex/values";
import { mutation, MutationCtx } from "./_generated/server";

export const addItem = mutation({
  args: { text: v.string() },
  handler: async (ctx, args) => {
    await ctx.db.insert("tasks", { text: args.text });
    await trackChange(ctx, "addItem");
  },
});

async function trackChange(ctx: MutationCtx, type: "addItem" | "removeItem") {
  await ctx.db.insert("changes", { type });
}
```

Mutations can call helpers that take a
[QueryCtx](https://docs.convex.dev/generated-api/server.html#queryctx) as argument, since the mutation
context can do everything query context can.

You can `export` helpers to use them across multiple files. They will not be
callable from outside of your Convex functions.

See
[Type annotating server side helpers](https://docs.convex.dev/understanding/best-practices/typescript.html#type-annotating-server-side-helpers)
for more guidance on TypeScript types.

## Using NPM packages[​](https://docs.convex.dev/functions/mutation-functions.html#using-npm-packages "Direct link to Using NPM packages")

Mutations can import NPM packages installed in `node_modules`. Not all NPM
packages are supported, see
[Runtimes](https://docs.convex.dev/functions/runtimes.html#default-convex-runtime) for more details.

```
npm install @faker-js/faker
```

convex/myFunctions.ts

TS

```
import { faker } from "@faker-js/faker";
import { mutation } from "./_generated/server";

export const randomName = mutation({
  args: {},
  handler: async (ctx) => {
    faker.seed();
    await ctx.db.insert("tasks", { text: "Greet " + faker.person.fullName() });
  },
});
```

## Calling mutations from clients[​](https://docs.convex.dev/functions/mutation-functions.html#calling-mutations-from-clients "Direct link to Calling mutations from clients")

To call a mutation from [React](https://docs.convex.dev/client/react.html) use the
[`useMutation`](https://docs.convex.dev/client/react.html#editing-data) hook along with the generated
[`api`](https://docs.convex.dev/generated-api/api.html) object.

src/myApp.tsx

TS

```
import { useMutation } from "convex/react";
import { api } from "../convex/_generated/api";

export function MyApp() {
  const mutateSomething = useMutation(api.myFunctions.mutateSomething);
  const handleClick = () => {
    mutateSomething({ a: 1, b: 2 });
  };
  // pass `handleClick` to a button
  // ...
}
```

See the [React](https://docs.convex.dev/client/react.html) client documentation for all the ways queries
can be called.

When mutations are called from the [React](https://docs.convex.dev/client/react.html) or
[Rust](https://docs.convex.dev/client/rust.html) clients, they are executed one at a time in a single,
ordered queue. You don't have to worry about mutations editing the database in a
different order than they were triggered.

## Transactions[​](https://docs.convex.dev/functions/mutation-functions.html#transactions "Direct link to Transactions")

Mutations run **transactionally**. This means that:

1. All database reads inside the transaction get a consistent view of the data
   in the database. You don't have to worry about a concurrent update changing
   the data in the middle of the execution.
2. All database writes get committed together. If the mutation writes some data
   to the database, but later throws an error, no data is actually written to
   the database.

For this to work, similarly to queries, mutations must be deterministic, and
cannot call third party APIs. To call third party APIs, use
[actions](https://docs.convex.dev/functions/actions.html).

## Limits[​](https://docs.convex.dev/functions/mutation-functions.html#limits "Direct link to Limits")

Mutations have a limit to the amount of data they can read and write at once to
guarantee good performance. Learn more in
[Read/write limit errors](https://docs.convex.dev/functions/error-handling/index.html#readwrite-limit-errors).

For information on other limits, see [Limits](https://docs.convex.dev/production/state/limits.html).

[Previous

Queries](https://docs.convex.dev/understanding/convex-fundamentals/functions.html)[Next

Actions](https://docs.convex.dev/functions/actions.html)

* [Mutation names](https://docs.convex.dev/functions/mutation-functions.html#mutation-names)
* [The `mutation` constructor](https://docs.convex.dev/functions/mutation-functions.html#the-mutation-constructor)
  + [Mutation arguments](https://docs.convex.dev/functions/mutation-functions.html#mutation-arguments)
  + [Mutation responses](https://docs.convex.dev/functions/mutation-functions.html#mutation-responses)
  + [Mutation context](https://docs.convex.dev/functions/mutation-functions.html#mutation-context)
* [Splitting up mutation code via helpers](https://docs.convex.dev/functions/mutation-functions.html#splitting-up-mutation-code-via-helpers)
* [Using NPM packages](https://docs.convex.dev/functions/mutation-functions.html#using-npm-packages)
* [Calling mutations from clients](https://docs.convex.dev/functions/mutation-functions.html#calling-mutations-from-clients)
* [Transactions](https://docs.convex.dev/functions/mutation-functions.html#transactions)
* [Limits](https://docs.convex.dev/functions/mutation-functions.html#limits)
