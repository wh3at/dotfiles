---
title: "Multiple Repositories | Convex Developer Hub"
source_url: "https://docs.convex.dev/production/multiple-repos"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Production](https://docs.convex.dev/production.html)
* Multiple Repositories

Copy as Markdown

Copied!

On this page

Your TypeScript clients can call Convex functions in a type-safe way outside of
the repository where your Convex functions are defined. By following the steps
below, you can generate a file similar to `convex/_generated/api.d.ts` that you
can check in and use in a separate repository.

TypeScript API generation is in beta

TypeScript API generation is currently a [beta
feature](https://docs.convex.dev/production/state/index.html#beta-features). If you have feedback or feature
requests, [let us know on Discord](https://convex.dev/community)!

1. Install the Convex Helpers npm package

   Install the `convex-helpers` package, which contains a CLI command to generate an api file.

   ```
   npm install convex-helpers
   ```
2. Run a command to generate a TypeScript API file

   Running this command will call into your configured Convex deployment and generate an `api.ts` file based
   on it. You can see additional flags by passing `--help` to the command.

   ```
   npx convex-helpers ts-api-spec
   ```

## Example[​](https://docs.convex.dev/production/multiple-repos.html#example "Direct link to Example")

Below are code snippets of what this workflow looks like in action. These
snippets include three different files:

* `convex/messages.ts` - contains Convex function definitions
* `api.ts` - a generated file from running the command above
* `src/App.tsx` - frontend code in a separate repository where `api.ts` is
  checked in

convex/messages.ts

TS

```
import { v } from "convex/values";
import { mutation } from "./_generated/server";

export const send = mutation({
  args: { body: v.string(), author: v.string() },
  returns: v.null(),
  handler: async (ctx, { body, author }) => {
    const message = { body, author };
    await ctx.db.insert("messages", message);
  },
});
```

api.ts

TS

```
import { FunctionReference, anyApi } from "convex/server";

export const api: PublicApiType = anyApi as unknown as PublicApiType;

export type PublicApiType = {
  messages: {
    send: FunctionReference<
      "mutation",
      "public",
      { author: string; body: string },
      null
    >;
  };
};
```

src/App.tsx

TS

```
import { FormEvent, useState } from "react";
import { useMutation } from "convex/react";
// Note: This file is importing from the file we generated,`api`,
// and not from `../convex/_generated/api`
import { api } from "../api";

export default function App() {
  const [newMessageText, setNewMessageText] = useState("");
  const sendMessage = useMutation(api.messages.send);

  const [name] = useState(() => "User " + Math.floor(Math.random() * 10000));
  async function handleSendMessage(event: FormEvent) {
    event.preventDefault();
    await sendMessage({ body: newMessageText, author: name });
    setNewMessageText("");
  }
  return (
    <main>
      <h1>Send Messages</h1>
      <form onSubmit={handleSendMessage}>
        <input
          value={newMessageText}
          onChange={(event) => setNewMessageText(event.target.value)}
          placeholder="Write a message…"
        />
        <input type="submit" value="Send" disabled={!newMessageText} />
      </form>
    </main>
  );
}
```

## Limits[​](https://docs.convex.dev/production/multiple-repos.html#limits "Direct link to Limits")

* Argument and return value validators are not required, but they will enrich
  the types of your TypeScript API. Where validators aren't defined, we default
  to `v.any()` as the validator.
* You cannot call internal functions from outside of your Convex deployment.

[Previous

Pausing a Deployment](https://docs.convex.dev/production/pause-deployment.html)[Next

Contact Us](https://docs.convex.dev/production/contact.html)

* [Example](https://docs.convex.dev/production/multiple-repos.html#example)
* [Limits](https://docs.convex.dev/production/multiple-repos.html#limits)
