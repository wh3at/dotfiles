---
title: "JavaScript | Convex Developer Hub"
source_url: "https://docs.convex.dev/client/javascript"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



Copy as Markdown

Copied!

On this page

Convex applications can be accessed from Node.js or any JavaScript runtime that
implements [`fetch`](https://developer.mozilla.org/en-US/docs/Web/API/fetch) or
[`WebSocket`](https://developer.mozilla.org/en-US/docs/Web/API/WebSocket). The
reactive [Convex Client](https://docs.convex.dev/api/classes/browser.ConvexClient.html) allows web
applications and long-running Node.js servers to subscribe to updates on Convex
queries, while the [Convex HTTP client](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html)
is typically used for server-side rendering, migrations, administrative scripts,
and serverless functions to run queries at a single point in time.

If you're using React, see the dedicated
[`ConvexReactClient`](https://docs.convex.dev/api/classes/browser.ConvexClient.html) described in
[React](https://docs.convex.dev/client/react.html).

## Convex Client[​](https://docs.convex.dev/client/javascript.html#convex-client "Direct link to Convex Client")

The [`ConvexClient`](https://docs.convex.dev/api/classes/browser.ConvexClient.html) provides subscriptions
to queries in Node.js and any JavaScript environment that supports WebSockets.

script.ts

TS

```
import { ConvexClient } from "convex/browser";
import { api } from "../convex/_generated/api";

const client = new ConvexClient(process.env.CONVEX_URL!);

// subscribe to query results
client.onUpdate(api.messages.listAll, {}, (messages) =>
  console.log(messages.map((msg) => msg.body)),
);

// execute a mutation
function hello() {
  client.mutation(api.messages.sendAnon, {
    body: `hello at ${new Date()}`,
  });
}
```

The Convex client is open source and available on
[GitHub](https://github.com/get-convex/convex-js).

See the [Script Tag Quickstart](https://docs.convex.dev/quickstart/script-tag.html) to get started.

## HTTP client[​](https://docs.convex.dev/client/javascript.html#http-client "Direct link to HTTP client")

The [`ConvexHttpClient`](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html) works in the
browser, Node.js, and any JavaScript environment with `fetch`.

See the [Node.js Quickstart](https://docs.convex.dev/quickstart/nodejs).

script.ts

TS

```
import { ConvexHttpClient } from "convex/browser";
import { api } from "./convex/_generated/api";

const client = new ConvexHttpClient(process.env["CONVEX_URL"]);

// either this
const count = await client.query(api.counter.get);
// or this
client.query(api.counter.get).then((count) => console.log(count));
```

## Using Convex without generated `convex/_generated/api.js`[​](https://docs.convex.dev/client/javascript.html#using-convex-without-generated-convex_generatedapijs "Direct link to using-convex-without-generated-convex_generatedapijs")

If the source code for your Convex function isn't located in the same project or
in the same monorepos you can use the untyped `api` object called `anyApi`.

script.ts

TS

```
import { ConvexClient } from "convex/browser";
import { anyApi } from "convex/server";

const CONVEX_URL = "http://happy-otter-123";
const client = new ConvexClient(CONVEX_URL);
client.onUpdate(anyApi.messages.list, {}, (messages) =>
  console.log(messages.map((msg) => msg.body)),
);
setInterval(
  () =>
    client.mutation(anyApi.messages.send, {
      body: `hello at ${new Date()}`,
      author: "me",
    }),
  5000,
);
```

[Previous

React Native](https://docs.convex.dev/client/react-native.html)[Next

Node.js](https://docs.convex.dev/client/javascript/node.html)

* [Convex Client](https://docs.convex.dev/client/javascript.html#convex-client)
* [HTTP client](https://docs.convex.dev/client/javascript.html#http-client)
* [Using Convex without generated `convex/_generated/api.js`](https://docs.convex.dev/client/javascript.html#using-convex-without-generated-convex_generatedapijs)
