---
title: "Scheduling | Convex Developer Hub"
source_url: "https://docs.convex.dev/scheduling"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



Copy as Markdown

Copied!

Convex lets you easily schedule a function to run once or repeatedly in the
future. This allows you to build durable workflows like sending a welcome email
a day after someone joins or regularly reconciling your accounts with Stripe.
Convex provides two different features for scheduling:

* [Scheduled Functions](https://docs.convex.dev/scheduling/scheduled-functions.html) can be scheduled
  durably by any other function to run at a later point in time. You can
  schedule functions minutes, days, and even months in the future.
* [Cron Jobs](https://docs.convex.dev/scheduling/cron-jobs.html) schedule functions to run on a
  recurring basis, such as daily.

## Durable function components[​](https://docs.convex.dev/scheduling.html#durable-function-components "Direct link to Durable function components")

Built-in scheduled functions and crons work well for simpler apps and workflows.
If you're operating at high scale or need more specific guarantees, use the
following higher-level [components](https://docs.convex.dev/components.html) for durable functions.

[Convex Component

### Workpool

Workpool give critical tasks priority by organizing async operations into separate, customizable queues.](https://www.convex.dev/components/workpool)[Convex Component

### Workflow

Simplify programming long running code flows. Workflows execute durably with configurable retries and delays.](https://www.convex.dev/components/workflow)[Convex Component

### Action Retrier

Add reliability to an unreliable external service. Retry idempotent calls a set number of times.](https://www.convex.dev/components/retrier)[Convex Component

### Crons

Use cronspec to run functions on a repeated schedule at runtime.](https://www.convex.dev/components/crons)

Related posts from [![Stack](https://docs.convex.dev/img/stack-logo-dark.svg)![Stack](https://docs.convex.dev/img/stack-logo-light.svg)](https://stack.convex.dev/)

[Previous

Authentication](https://docs.convex.dev/auth.html)[Next

Scheduled Functions](https://docs.convex.dev/scheduling/scheduled-functions.html)
