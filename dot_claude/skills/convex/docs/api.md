---
title: "api.js | Convex Developer Hub"
source_url: "https://docs.convex.dev/generated-api/api"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Generated Code](https://docs.convex.dev/generated-api/index.html)
* api.js

Copy as Markdown

Copied!

On this page

This code is generated

These exports are not directly available in the `convex` package!

Instead you need to run `npx convex dev` to create `convex/_generated/api.js`
and `convex/_generated/api.d.ts`.

These types require running code generation because they are specific to the
Convex functions you define for your app.

If you aren't using code generation, you can use
[`makeFunctionReference`](https://docs.convex.dev/api/modules/server.html#makefunctionreference) instead.

### api[​](https://docs.convex.dev/generated-api/api.html#api "Direct link to api")

An object of type `API` describing your app's public Convex API.

Its `API` type includes information about the arguments and return types of your
app's Convex functions.

The api object is used by client-side React hooks and Convex functions that run
or schedule other functions.

src/App.jsx

```
import { api } from "../convex/_generated/api";
import { useQuery } from "convex/react";

const data = useQuery(api.messages.list);
```

### internal[​](https://docs.convex.dev/generated-api/api.html#internal "Direct link to internal")

Another object of type `API` describing your app's internal Convex API.

convex/upgrade.js

```
import { action } from "../_generated/server";
import { internal } from "../_generated/api";

export default action({
  handler: async ({ runMutation }, { planId, ... }) => {
    // Call out to payment provider (e.g. Stripe) to charge customer
    const response = await fetch(...);
    if (response.ok) {
      // Mark the plan as "professional" in the Convex DB
      await runMutation(internal.plans.markPlanAsProfessional, { planId });
    }
  },
});
```

[Previous

dataModel.d.ts](https://docs.convex.dev/generated-api/data-model.html)[Next

server.js](https://docs.convex.dev/generated-api/server.html)

* [api](https://docs.convex.dev/generated-api/api.html#api)
* [internal](https://docs.convex.dev/generated-api/api.html#internal)
