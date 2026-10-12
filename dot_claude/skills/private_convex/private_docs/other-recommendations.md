---
title: "Other Recommendations | Convex Developer Hub"
source_url: "https://docs.convex.dev/understanding/best-practices/other-recommendations"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Understand Convex](https://docs.convex.dev/understanding/index.html)
* [Best Practices](https://docs.convex.dev/understanding/best-practices/index.html)
* Other Recommendations

Copy as Markdown

Copied!

On this page

Here's a collection of our recommendations on how best to use Convex to build
your application. If you want guidance specific to your app's needs or have
discovered other ways of using Convex,
[message us on Discord](https://convex.dev/community)!

## Use [TypeScript](https://docs.convex.dev/understanding/best-practices/typescript.html)[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-typescript "Direct link to use-typescript")

All Convex libraries have complete type annotations and using theses types is a
great way to learn the framework.

Even better, Convex supports [code generation](https://docs.convex.dev/generated-api/index.html) to create types
that are specific to your app's [schema](https://docs.convex.dev/database/schemas.html) and
[Convex functions](https://docs.convex.dev/functions.html).

Code generation is run automatically by
[`npx convex dev`](https://docs.convex.dev/using/cli.html#run-the-convex-dev-server).

## Check generated code into version control[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#check-generated-code-into-version-control "Direct link to Check generated code into version control")

Inside the convex folder is a `_generated/` directory containing code customized
to your convex functions. Check this folder in to your git repo. That way your
code will typecheck without needing to run `npx convex codegen` or
`npx convex dev` (which includes codegen) first.

This also allows developers to make changes to a project that uses convex by
running it against the production deployment by setting an environment variable,
without ever needing to run the Convex CLI tool. To run against a production
deployment set an environment variable like VITE\_CONVEX\_URL (the exact variable
name depends on the framework you use) to a production deployment URL like
`https://happy-otter-123.convex.cloud` found in project's production deployment
settings in the dashboard. Most frameworks search for variables like this in a
file called `.env` or `.env.production`.

## Functions[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#functions "Direct link to Functions")

### Use [argument validation](https://docs.convex.dev/functions/validation.html) in all public functions.[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-argument-validation-in-all-public-functions "Direct link to use-argument-validation-in-all-public-functions")

Argument validation prevents malicious users from calling your functions with
the wrong types of arguments. It's okay to skip argument validation for
[internal functions](https://docs.convex.dev/functions/internal-functions.html) because they are not
publicly accessible.

### Use `console.log` to debug your Convex functions.[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-consolelog-to-debug-your-convex-functions "Direct link to use-consolelog-to-debug-your-convex-functions")

All server-side logs from Convex functions are shown on the
[dashboard Logs page](https://docs.convex.dev/dashboard/deployments/logs.html). If a server-side
exception occurs, it will also be logged as an error event.

On a **dev deployment** the logs will also be forwarded to the client and will
show up in the browser developer tools Console for the user who invoked the
function call, including full server error messages and server-side stack
traces.

### Use helper functions to write shared code.[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-helper-functions-to-write-shared-code "Direct link to Use helper functions to write shared code.")

Write helper functions in your `convex/` directory and use them within your
Convex functions. Helpers can be a powerful way to share business logic,
authorization code, and more.

Helper functions allow sharing code while still executing the entire query or
mutation in a single transaction. For actions, sharing code via helper functions
instead of using `ctx.runAction` reduces function calls and resource usage.

See the [TypeScript page](https://docs.convex.dev/understanding/best-practices/typescript.html) for
useful types.

convex/teams.ts

TS

```
import { QueryCtx, mutation } from "./_generated/server";
import { v } from "convex/values";
import { getCurrentUser } from "./userHelpers";
import { Doc, Id } from "./_generated/dataModel";

export const remove = mutation({
  args: { teamId: v.id("teams") },
  handler: async (ctx, { teamId }) => {
    const currentUser = await getCurrentUser(ctx);
    await ensureTeamAdmin(ctx, currentUser, teamId);
    await ctx.db.delete(teamId);
  },
});

async function ensureTeamAdmin(
  ctx: QueryCtx,
  user: Doc<"users">,
  teamId: Id<"teams">,
) {
  // use `ctx.db` to check that `user` is a team admin and throw an error otherwise
}
```

convex/userHelpers.ts

TS

```
import { Doc } from "./_generated/dataModel";
import { QueryCtx } from "./_generated/server";

export async function getCurrentUser(ctx: QueryCtx): Promise<Doc<"users">> {
  // load user details using `ctx.auth` and `ctx.db`
}
```

### Prefer queries and mutations over actions[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#prefer-queries-and-mutations-over-actions "Direct link to Prefer queries and mutations over actions")

You should generally avoid using actions when the same goal can be achieved
using queries or mutations. Since actions can have side effects, they can't be
automatically retried nor their results cached. Actions should be used in more
limited scenarios, such as calling third-party services.

## Database[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#database "Direct link to Database")

### Use indexes or paginate all large database queries.[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-indexes-or-paginate-all-large-database-queries "Direct link to Use indexes or paginate all large database queries.")

[Database indexes](https://docs.convex.dev/database/reading-data/indexes/index.html) with
[range expressions](https://docs.convex.dev/database/reading-data/indexes/index.html#querying-documents-using-indexes)
allow you to write efficient database queries that only scan a small number of
documents in the table. [Pagination](https://docs.convex.dev/database/pagination.html) allows you to
quickly display incremental lists of results. If your table could contain more
than a few thousand documents, you should consider pagination or an index with a
range expression to ensure that your queries stay fast.

For more details, check out our
[Introduction to Indexes and Query Performance](https://docs.convex.dev/database/indexes/indexes-and-query-perf.html)
article.

### Use tables to separate logical object types.[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-tables-to-separate-logical-object-types "Direct link to Use tables to separate logical object types.")

Even though Convex does support nested documents, it is often better to put
separate objects into separate tables and use `Id`s to create references between
them. This will give you more flexibility when loading and
[querying documents](https://docs.convex.dev/database/reading-data/index.html).

You can read more about this at [Document IDs](https://docs.convex.dev/database/document-ids.html).

## UI patterns[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#ui-patterns "Direct link to UI patterns")

### Check for `undefined` to determine if a query is loading.[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#check-for-undefined-to-determine-if-a-query-is-loading "Direct link to check-for-undefined-to-determine-if-a-query-is-loading")

The [`useQuery` React hook](https://docs.convex.dev/api/modules/react.html#usequery) will return `undefined`
when it is first mounted, before the query has been loaded from Convex. Once a
query is loaded it will never be `undefined` again (even as the data reactively
updates). `undefined` is not a valid return type for queries (you can see the
types that Convex supports at [Data Types](https://docs.convex.dev/using/types.html))

You can use this as a signal for when to render loading indicators and
placeholder UI.

### Add optimistic updates for the interactions you want to feel snappy.[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#add-optimistic-updates-for-the-interactions-you-want-to-feel-snappy "Direct link to Add optimistic updates for the interactions you want to feel snappy.")

By default all relevant `useQuery` hooks will update automatically after a
mutation is synced from Convex. If you would like some interactions to happen
even faster, you can add
[optimistic updates](https://docs.convex.dev/using/optimistic-updates.html) to your `useMutation`
calls so that the UI updates instantaneously.

### Use an exception handling service and error boundaries to manage errors.[​](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-an-exception-handling-service-and-error-boundaries-to-manage-errors "Direct link to Use an exception handling service and error boundaries to manage errors.")

Inevitably, your Convex functions will have bugs and hit exceptions. If you have
an exception handling service and error boundaries configured, you can ensure
that you hear about these errors and your users see appropriate UI.

See [Error Handling](https://docs.convex.dev/functions/error-handling/index.html) for more
information.

[Previous

TypeScript](https://docs.convex.dev/understanding/best-practices/typescript.html)

* [Use TypeScript](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-typescript)
* [Check generated code into version control](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#check-generated-code-into-version-control)
* [Functions](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#functions)
  + [Use argument validation in all public functions.](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-argument-validation-in-all-public-functions)
  + [Use `console.log` to debug your Convex functions.](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-consolelog-to-debug-your-convex-functions)
  + [Use helper functions to write shared code.](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-helper-functions-to-write-shared-code)
  + [Prefer queries and mutations over actions](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#prefer-queries-and-mutations-over-actions)
* [Database](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#database)
  + [Use indexes or paginate all large database queries.](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-indexes-or-paginate-all-large-database-queries)
  + [Use tables to separate logical object types.](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-tables-to-separate-logical-object-types)
* [UI patterns](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#ui-patterns)
  + [Check for `undefined` to determine if a query is loading.](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#check-for-undefined-to-determine-if-a-query-is-loading)
  + [Add optimistic updates for the interactions you want to feel snappy.](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#add-optimistic-updates-for-the-interactions-you-want-to-feel-snappy)
  + [Use an exception handling service and error boundaries to manage errors.](https://docs.convex.dev/understanding/best-practices/other-recommendations.html#use-an-exception-handling-service-and-error-boundaries-to-manage-errors)
