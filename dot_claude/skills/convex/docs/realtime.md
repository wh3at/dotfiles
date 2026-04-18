---
title: "Realtime | Convex Developer Hub"
source_url: "https://docs.convex.dev/realtime"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



Copy as Markdown

Copied!

On this page

Turns out Convex is automatically realtime! You don’t have to do anything
special if you are already using [query functions](https://docs.convex.dev/understanding/convex-fundamentals/functions.html),
[database](https://docs.convex.dev/database.html), and [client libraries](https://docs.convex.dev/client/react/index.html) in your app.
Convex tracks the dependencies to your query functions, including database
changes, and triggers the subscription in the client libraries.

![Convex is automatically reactive and realtime](https://docs.convex.dev/assets/images/realtime-3197272a21b075792f6ac922af228378.gif)

Aside from building a highly interactive app with ease, there are other benefits
to the realtime architecture of Convex:

## Automatic caching[​](https://docs.convex.dev/realtime.html#automatic-caching "Direct link to Automatic caching")

Convex automatically caches the result of your query functions so that future
calls just read from the cache. The cache is updated if the data ever changes.
You don't get charged for database bandwidth for cached reads.

This requires no work or bookkeeping from you.

## Consistent data across your app[​](https://docs.convex.dev/realtime.html#consistent-data-across-your-app "Direct link to Consistent data across your app")

Every client subscription gets updated simultaneously to the same snapshot of
the database. Your app always displays the most consistent view of your data.

This avoids bugs like increasing the number of items in the shopping cart and
not showing that an item is sold out.

## Learn more[​](https://docs.convex.dev/realtime.html#learn-more "Direct link to Learn more")

Learn how to work with realtime and reactive queries in Convex on
[Stack](https://stack.convex.dev/tag/Reactivity).

Related posts from [![Stack](https://docs.convex.dev/img/stack-logo-dark.svg)![Stack](https://docs.convex.dev/img/stack-logo-light.svg)](https://stack.convex.dev/)

[Previous

OCC and Atomicity](https://docs.convex.dev/database/advanced/occ.html)[Next

Authentication](https://docs.convex.dev/auth.html)

* [Automatic caching](https://docs.convex.dev/realtime.html#automatic-caching)
* [Consistent data across your app](https://docs.convex.dev/realtime.html#consistent-data-across-your-app)
* [Learn more](https://docs.convex.dev/realtime.html#learn-more)
