---
title: "Bun | Convex Developer Hub"
source_url: "https://docs.convex.dev/client/javascript/bun"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [JavaScript](https://docs.convex.dev/client/javascript.html)
* Bun

Copy as Markdown

Copied!

On this page

[Bun](https://bun.sh/) can be used to run scripts and servers that use Convex
clients and can even run the Convex CLI.

Convex supports point-in-time queries, mutations and actions (see
[HTTP client](https://docs.convex.dev/api/classes/browser.ConvexHttpClient.html)) and those plus query
subscriptions (see [ConvexClient](https://docs.convex.dev/api/classes/browser.ConvexClient.html)) in Bun.

```
import { ConvexHttpClient, ConvexClient } from "convex/browser";
import { api } from "./convex/_generated/api.js";

// HTTP client
const httpClient = new ConvexHttpClient(process.env.CONVEX_URL);
httpClient.query(api.messages.list).then((messages) => {
  console.log(messages);
});

// Subscription client
const client = new ConvexClient(process.env.CONVEX_URL);
const unsubscribe = client.onUpdate(api.messages.list, {}, (messages) =>
  console.log(messages),
);
await Bun.sleep(1000);
client.mutate(api.messages.send, {}, { body: "hello!", author: "me" });
await Bun.sleep(1000);
```

## Using Convex with Bun without codegen[​](https://docs.convex.dev/client/javascript/bun.html#using-convex-with-bun-without-codegen "Direct link to Using Convex with Bun without codegen")

You can always use the `anyApi` object or strings if you don't have the Convex
functions and api file handy. An api reference like `api.folder.file.exportName`
becomes `anyApi.folder.file.exportName` or `"folder/file:exportName"`.

[Previous

Script Tag](https://docs.convex.dev/client/javascript/script-tag.html)[Next

Vue](https://docs.convex.dev/client/vue.html)

* [Using Convex with Bun without codegen](https://docs.convex.dev/client/javascript/bun.html#using-convex-with-bun-without-codegen)
