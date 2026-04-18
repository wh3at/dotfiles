---
title: "Cron Jobs | Convex Developer Hub"
source_url: "https://docs.convex.dev/scheduling/cron-jobs"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Scheduling](https://docs.convex.dev/scheduling.html)
* Cron Jobs

Copy as Markdown

Copied!

On this page

Convex allows you to schedule functions to run on a recurring basis. For
example, cron jobs can be used to clean up data at a regular interval, send a
reminder email at the same time every month, or schedule a backup every
Saturday.

**Example:**
[Cron Jobs](https://github.com/get-convex/convex-demos/tree/main/cron-jobs)

## Defining your cron jobs[​](https://docs.convex.dev/scheduling/cron-jobs.html#defining-your-cron-jobs "Direct link to Defining your cron jobs")

Cron jobs are defined in a `crons.ts` file in your `convex/` directory and look
like:

convex/crons.ts

TS

```
import { cronJobs } from "convex/server";
import { internal } from "./_generated/api";

const crons = cronJobs();

crons.interval(
  "clear messages table",
  { minutes: 1 }, // every minute
  internal.messages.clearAll,
);

crons.monthly(
  "payment reminder",
  { day: 1, hourUTC: 16, minuteUTC: 0 }, // Every month on the first day at 8:00am PST
  internal.payments.sendPaymentEmail,
  { email: "my_email@gmail.com" }, // argument to sendPaymentEmail
);

// An alternative way to create the same schedule as above with cron syntax
crons.cron(
  "payment reminder duplicate",
  "0 16 1 * *",
  internal.payments.sendPaymentEmail,
  { email: "my_email@gmail.com" }, // argument to sendPaymentEmail
);

export default crons;
```

The first argument is a unique identifier for the cron job.

The second argument is the schedule at which the function should run, see
[Supported schedules](https://docs.convex.dev/scheduling/cron-jobs.html#supported-schedules) below.

The third argument is the name of the public function or
[internal function](https://docs.convex.dev/functions/internal-functions.html), either a
[mutation](https://docs.convex.dev/functions/mutation-functions.html) or an
[action](https://docs.convex.dev/functions/actions.html).

## Supported schedules[​](https://docs.convex.dev/scheduling/cron-jobs.html#supported-schedules "Direct link to Supported schedules")

* [`crons.interval()`](https://docs.convex.dev/api/classes/server.Crons.html#interval) runs a function every
  specified number of `seconds`, `minutes`, or `hours`. The first run occurs
  when the cron job is first deployed to Convex. Unlike traditional crons, this
  option allows you to have seconds-level granularity.
* [`crons.cron()`](https://docs.convex.dev/api/classes/server.Crons.html#cron) the traditional way of
  specifying cron jobs by a string with five fields separated by spaces
  (e.g. `"* * * * *"`). Times in cron syntax are in the UTC
  timezone. [Crontab Guru](https://crontab.guru/) is a helpful resource for
  understanding and creating schedules in this format.
* [`crons.hourly()`](https://docs.convex.dev/api/classes/server.Crons.html#cron),
  [`crons.daily()`](https://docs.convex.dev/api/classes/server.Crons.html#daily),
  [`crons.weekly()`](https://docs.convex.dev/api/classes/server.Crons.html#weekly),
  [`crons.monthly()`](https://docs.convex.dev/api/classes/server.Crons.html#monthly) provide an alternative
  syntax for common cron schedules with explicitly named arguments.

## Viewing your cron jobs[​](https://docs.convex.dev/scheduling/cron-jobs.html#viewing-your-cron-jobs "Direct link to Viewing your cron jobs")

You can view all your cron jobs in the
[Convex dashboard cron jobs view](https://docs.convex.dev/dashboard/deployments/schedules.html#cron-jobs-ui).
You can view added, updated, and deleted cron jobs in the logs and history view.
Results of previously executed runs of the cron jobs are also available in the
logs view.

## Error handling[​](https://docs.convex.dev/scheduling/cron-jobs.html#error-handling "Direct link to Error handling")

Mutations and actions have the same guarantees that are described in
[Error handling](https://docs.convex.dev/scheduling/scheduled-functions.html#error-handling) for
scheduled functions.

At most one run of each cron job can be executing at any moment. If the function
scheduled by the cron job takes too long to run, following runs of the cron job
may be skipped to avoid execution from falling behind. Skipping a scheduled run
of a cron job due to the previous run still executing logs a message visible in
the logs view of the dashboard.

[Previous

Scheduled Functions](https://docs.convex.dev/scheduling/scheduled-functions.html)[Next

File Storage](https://docs.convex.dev/file-storage.html)

* [Defining your cron jobs](https://docs.convex.dev/scheduling/cron-jobs.html#defining-your-cron-jobs)
* [Supported schedules](https://docs.convex.dev/scheduling/cron-jobs.html#supported-schedules)
* [Viewing your cron jobs](https://docs.convex.dev/scheduling/cron-jobs.html#viewing-your-cron-jobs)
* [Error handling](https://docs.convex.dev/scheduling/cron-jobs.html#error-handling)
