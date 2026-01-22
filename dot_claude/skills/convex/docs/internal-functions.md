---
title: "Internal Functions | Convex Developer Hub"
source_url: "https://docs.convex.dev/functions/internal-functions"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Functions](https://docs.convex.dev/functions.html)
* Internal Functions

Copy as Markdown

Copied!

On this page

Internal functions can only be called by other [functions](https://docs.convex.dev/functions.html) and
cannot be called directly from a [Convex client](https://docs.convex.dev/client/react.html).

By default your Convex functions are public and accessible to clients. Public
functions may be called by malicious users in ways that cause surprising
results. Internal functions help you mitigate this risk. We recommend using
internal functions any time you're writing logic that should not be called from
a client.

While internal functions help mitigate risk by reducing the public surface area
of your application, you can still validate internal invariants using
[argument validation](https://docs.convex.dev/functions/validation.html) and/or
[authentication](https://docs.convex.dev/auth/functions-auth.html).

## Use cases for internal functions[​](https://docs.convex.dev/functions/internal-functions.html#use-cases-for-internal-functions "Direct link to Use cases for internal functions")

Leverage internal functions by:

* Calling them from [actions](https://docs.convex.dev/functions/actions.html#action-context) via
  `runQuery` and `runMutation`
* Calling them from [HTTP actions](https://docs.convex.dev/functions/http-actions.html) via `runQuery`,
  `runMutation`, and `runAction`
* [Scheduling](https://docs.convex.dev/scheduling/scheduled-functions.html) them from other functions to
  run in the future
* Scheduling them to run periodically from
  [cron jobs](https://docs.convex.dev/scheduling/cron-jobs.html)
* Running them using the
  [Dashboard](https://docs.convex.dev/dashboard/deployments/functions.html#running-functions)
* Running them from the [CLI](https://docs.convex.dev/using/cli.html#run-convex-functions)

## Defining internal functions[​](https://docs.convex.dev/functions/internal-functions.html#defining-internal-functions "Direct link to Defining internal functions")

An internal function is defined using `internalQuery`, `internalMutation`, or
`internalAction`. For example:

convex/plans.ts

TS

```
import { internalMutation } from "./_generated/server";
import { v } from "convex/values";

export const markPlanAsProfessional = internalMutation({
  args: { planId: v.id("plans") },
  handler: async (ctx, args) => {
    await ctx.db.patch(args.planId, { planType: "professional" });
  },
});
```

If you need to pass complicated objects to internal functions you might prefer
to not use argument validation. Note though that if you're using `internalQuery`
or `internalMutation` it's a better idea to pass around document IDs instead of
documents, to ensure the query or mutation is working with the up-to-date state
of the database.

Internal function without argument validation

convex/plans.ts

TS

```
import { internalAction } from "./_generated/server";
import { Doc } from "./_generated/dataModel";

export const markPlanAsProfessional = internalAction({
  handler: async (actionCtx, args) => {
    // perform an action, perhaps calling a third-party API
  },
});
```

## Calling internal functions[​](https://docs.convex.dev/functions/internal-functions.html#calling-internal-functions "Direct link to Calling internal functions")

Internal functions can be called from actions and scheduled from actions and
mutation using the [`internal`](https://docs.convex.dev/generated-api/api.html#internal) object.

For example, consider this public `upgrade` action that calls the internal
`plans.markPlanAsProfessional` mutation we defined above:

convex/changes.ts

TS

```
import { action } from "./_generated/server";
import { internal } from "./_generated/api";
import { v } from "convex/values";

export const upgrade = action({
  args: {
    planId: v.id("plans"),
  },
  handler: async (ctx, args) => {
    // Call out to payment provider (e.g. Stripe) to charge customer
    const response = await fetch("https://...");
    if (response.ok) {
      // Mark the plan as "professional" in the Convex DB
      await ctx.runMutation(internal.plans.markPlanAsProfessional, {
        planId: args.planId,
      });
    }
  },
});
```

In this example a user should not be able to directly call
`internal.plans.markPlanAsProfessional` without going through the `upgrade`
action — if they did, then they would get a free upgrade.

You can define public and internal functions in the same file.

[Previous

HTTP Actions](https://docs.convex.dev/functions/http-actions.html)[Next

Validation](https://docs.convex.dev/functions/validation.html)

* [Use cases for internal functions](https://docs.convex.dev/functions/internal-functions.html#use-cases-for-internal-functions)
* [Defining internal functions](https://docs.convex.dev/functions/internal-functions.html#defining-internal-functions)
* [Calling internal functions](https://docs.convex.dev/functions/internal-functions.html#calling-internal-functions)
