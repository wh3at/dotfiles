---
title: "Convex React | Convex Developer Hub"
source_url: "https://docs.convex.dev/client/react/index"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



Copy as Markdown

Copied!

On this page

Convex React is the client library enabling your React application to interact
with your Convex backend. It allows your frontend code to:

1. Call your [queries](https://docs.convex.dev/understanding/convex-fundamentals/functions.html),
   [mutations](https://docs.convex.dev/functions/mutation-functions.html) and
   [actions](https://docs.convex.dev/functions/actions.html)
2. Upload and display files from [File Storage](https://docs.convex.dev/file-storage.html)
3. Authenticate users using [Authentication](https://docs.convex.dev/auth.html)
4. Implement full text [Search](https://docs.convex.dev/search.html) over your data

The Convex React client is open source and available on
[GitHub](https://github.com/get-convex/convex-js).

Follow the [React Quickstart](https://docs.convex.dev/quickstart/react.html) to get started with React
using [Vite](https://vitejs.dev/).

## Installation[​](https://docs.convex.dev/client/react/index.html#installation "Direct link to Installation")

Convex React is part of the `convex` npm package:

```
npm install convex
```

## Connecting to a backend[​](https://docs.convex.dev/client/react/index.html#connecting-to-a-backend "Direct link to Connecting to a backend")

The [`ConvexReactClient`](https://docs.convex.dev/api/classes/react.ConvexReactClient.html) maintains a
connection to your Convex backend, and is used by the React hooks described
below to call your functions.

First you need to create an instance of the client by giving it your backend
deployment URL. See [Configuring Deployment URL](https://docs.convex.dev/client/react/deployment-urls.html)
on how to pass in the right value:

```
import { ConvexProvider, ConvexReactClient } from "convex/react";

const convex = new ConvexReactClient("https://<your domain here>.convex.cloud");
```

And then you make the client available to your app by passing it in to a
[`ConvexProvider`](https://docs.convex.dev/api/modules/react.html#convexprovider) wrapping your component
tree:

```
reactDOMRoot.render(
  <React.StrictMode>
    <ConvexProvider client={convex}>
      <App />
    </ConvexProvider>
  </React.StrictMode>,
);
```

## Fetching data[​](https://docs.convex.dev/client/react/index.html#fetching-data "Direct link to Fetching data")

Your React app fetches data using the [`useQuery`](https://docs.convex.dev/api/modules/react.html#usequery)
React hook by calling your [queries](https://docs.convex.dev/understanding/convex-fundamentals/functions.html) via an
[`api`](https://docs.convex.dev/generated-api/api.html#api) object.

The `npx convex dev` command generates this api object for you in the
`convex/_generated/api.js` module to provide better autocompletion in JavaScript
and end-to-end type safety in
[TypeScript](https://docs.convex.dev/understanding/best-practices/typescript.html):

src/App.tsx

TS

```
import { useQuery } from "convex/react";
import { api } from "../convex/_generated/api";

export function App() {
  const data = useQuery(api.functions.myQuery);
  return data ?? "Loading...";
}
```

The `useQuery` hook returns `undefined` while the data is first loading and
afterwards the return value of your query.

### Query arguments[​](https://docs.convex.dev/client/react/index.html#query-arguments "Direct link to Query arguments")

Arguments to your query follow the query name:

src/App.tsx

TS

```
export function App() {
  const a = "Hello world";
  const b = 4;
  const data = useQuery(api.functions.myQuery, { a, b });
  //...
}
```

### Reactivity[​](https://docs.convex.dev/client/react/index.html#reactivity "Direct link to Reactivity")

The `useQuery` hook makes your app automatically reactive: when the underlying
data changes in your database, your component rerenders with the new query
result.

The first time the hook is used it creates a subscription to your backend for a
given query and any arguments you pass in. When your component unmounts, the
subscription is canceled.

### Consistency[​](https://docs.convex.dev/client/react/index.html#consistency "Direct link to Consistency")

Convex React ensures that your application always renders a consistent view of
the query results based on a single state of the underlying database.

Imagine a mutation changes some data in the database, and that 2 different
`useQuery` call sites rely on this data. Your app will never render in an
inconsistent state where only one of the `useQuery` call sites reflects the new
data.

### Paginating queries[​](https://docs.convex.dev/client/react/index.html#paginating-queries "Direct link to Paginating queries")

See
[Paginating within React Components](https://docs.convex.dev/database/pagination.html#paginating-within-react-components).

### Skipping queries[​](https://docs.convex.dev/client/react/index.html#skipping-queries "Direct link to Skipping queries")

Advanced: Loading a query conditionally

With React it can be tricky to dynamically invoke a hook, because hooks cannot
be placed inside conditionals or after early returns:

src/App.tsx

TS

```
import { useQuery } from "convex/react";
import { api } from "../convex/_generated/api";

export function App() {
  // the URL `param` might be null
  const param = new URLSearchParams(window.location.search).get("param");
  // ERROR! React Hook "useQuery" is called conditionally. React Hooks must
  // be called in the exact same order in every component render.
  const data = param !== null ? useQuery(api.functions.read, { param }) : null;
  //...
}
```

For this reason `useQuery` can be "disabled" by passing in `"skip"` instead of
its arguments:

src/App.tsx

TS

```
import { useQuery } from "convex/react";
import { api } from "../convex/_generated/api";

export function App() {
  const param = new URLSearchParams(window.location.search).get("param");
  const data = useQuery(
    api.functions.read,
    param !== null ? { param } : "skip",
  );
  //...
}
```

When `"skip"` is used the `useQuery` doesn't talk to your backend at all and
returns `undefined`.

### One-off queries[​](https://docs.convex.dev/client/react/index.html#one-off-queries "Direct link to One-off queries")

Advanced: Fetching a query from a callback

Sometimes you might want to read state from the database in response to a user
action, for example to validate given input, without making any changes to the
database. In this case you can use a one-off
[`query`](https://docs.convex.dev/api/classes/react.ConvexReactClient.html#query) call, similarly to calling
mutations and actions.

The async method `query` is exposed on the `ConvexReactClient`, which you can
reference in your components via the
[`useConvex()`](https://docs.convex.dev/api/modules/react.html#useconvex) hook.

src/App.tsx

TS

```
import { useConvex } from "convex/react";
import { api } from "../convex/_generated/api";

export function App() {
  const convex = useConvex();
  return (
    <button
      onClick={async () => {
        console.log(await convex.query(api.functions.myQuery));
      }}
    >
      Check
    </button>
  );
}
```

## Editing data[​](https://docs.convex.dev/client/react/index.html#editing-data "Direct link to Editing data")

Your React app edits data using the
[`useMutation`](https://docs.convex.dev/api/modules/react.html#usemutation) React hook by calling your
[mutations](https://docs.convex.dev/functions/mutation-functions.html).

The `convex dev` command generates this api object for you in the
`convex/_generated/api.js` module to provide better autocompletion in JavaScript
and end-to-end type safety in
[TypeScript](https://docs.convex.dev/understanding/best-practices/typescript.html):

src/App.tsx

TS

```
import { useMutation } from "convex/react";
import { api } from "../convex/_generated/api";

export function App() {
  const doSomething = useMutation(api.functions.doSomething);
  return <button onClick={() => doSomething()}>Click me</button>;
}
```

The hook returns an `async` function which performs the call to the mutation.

### Mutation arguments[​](https://docs.convex.dev/client/react/index.html#mutation-arguments "Direct link to Mutation arguments")

Arguments to your mutation are passed to the `async` function returned from
`useMutation`:

src/App.tsx

TS

```
export function App() {
  const a = "Hello world";
  const b = 4;
  const doSomething = useMutation(api.functions.doSomething);
  return <button onClick={() => doSomething({ a, b })}>Click me</button>;
}
```

### Mutation response and error handling[​](https://docs.convex.dev/client/react/index.html#mutation-response-and-error-handling "Direct link to Mutation response and error handling")

The mutation can optionally return a value or throw errors, which you can
[`await`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/await):

src/App.tsx

TS

```
export function App() {
  const doSomething = useMutation(api.functions.doSomething);
  const onClick = () => {
    async function callBackend() {
      try {
        const result = await doSomething();
      } catch (error) {
        console.error(error);
      }
      console.log(result);
    }
    void callBackend();
  };
  return <button onClick={onClick}>Click me</button>;
}
```

Or handle as a
[`Promise`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise):

src/App.tsx

TS

```
export function App() {
  const doSomething = useMutation(api.functions.doSomething);
  const onClick = () => {
    doSomething()
      .catch((error) => {
        console.error(error);
      })
      .then((result) => {
        console.log(result);
      });
  };
  return <button onClick={onClick}>Click me</button>;
}
```

Learn more about [Error Handling](https://docs.convex.dev/functions/error-handling/index.html)
in functions.

### Retries[​](https://docs.convex.dev/client/react/index.html#retries "Direct link to Retries")

Convex React automatically retries mutations until they are confirmed to have
been written to the database. The Convex backend ensures that despite multiple
retries, every mutation call only executes once.

Additionally, Convex React will warn users if they try to close their browser
tab while there are outstanding mutations. This means that when you call a
Convex mutation, you can be sure that the user's edits won't be lost.

### Optimistic updates[​](https://docs.convex.dev/client/react/index.html#optimistic-updates "Direct link to Optimistic updates")

Convex queries are fully reactive, so all query results will be automatically
updated after a mutation. Sometimes you may want to update the UI before the
mutation changes propagate back to the client. To accomplish this, you can
configure an *optimistic update* to execute as part of your mutation.

Optimistic updates are temporary, local changes to your query results which are
used to make your app more responsive.

See [Optimistic Updates](https://docs.convex.dev/using/optimistic-updates.html) on how to
configure them.

## Calling third-party APIs[​](https://docs.convex.dev/client/react/index.html#calling-third-party-apis "Direct link to Calling third-party APIs")

Your React app can read data, call third-party services, and write data with a
single backend call using the [`useAction`](https://docs.convex.dev/api/modules/react.html#useaction) React
hook by calling your [actions](https://docs.convex.dev/functions/actions.html).

Like `useQuery` and `useMutation`, this hook is used with the `api` object
generated for you in the `convex/_generated/api.js` module to provide better
autocompletion in JavaScript and end-to-end type safety in
[TypeScript](https://docs.convex.dev/understanding/best-practices/typescript.html):

src/App.tsx

TS

```
import { useAction } from "convex/react";
import { api } from "../convex/_generated/api";

export function App() {
  const doSomeAction = useAction(api.functions.doSomeAction);
  return <button onClick={() => doSomeAction()}>Click me</button>;
}
```

The hook returns an `async` function which performs the call to the action.

### Action arguments[​](https://docs.convex.dev/client/react/index.html#action-arguments "Direct link to Action arguments")

Action arguments work exactly the same as
[mutation arguments](https://docs.convex.dev/client/react/index.html#mutation-arguments).

### Action response and error handling[​](https://docs.convex.dev/client/react/index.html#action-response-and-error-handling "Direct link to Action response and error handling")

Action response and error handling work exactly the same as
[mutation response and error handling](https://docs.convex.dev/client/react/index.html#mutation-response-and-error-handling).

Actions do not support automatic retries or optimistic updates.

## Under the hood[​](https://docs.convex.dev/client/react/index.html#under-the-hood "Direct link to Under the hood")

The [`ConvexReactClient`](https://docs.convex.dev/api/classes/react.ConvexReactClient.html) connects to your
Convex deployment by creating a
[`WebSocket`](https://developer.mozilla.org/en-US/docs/Web/API/WebSocket). The
WebSocket provides a 2-way communication channel over TCP. This allows Convex to
push new query results reactively to the client without the client needing to
poll for updates.

If the internet connection drops, the client will handle reconnecting and
re-establishing the Convex session automatically.

[Previous

Embedding the dashboard](https://docs.convex.dev/platform-apis/embedded-dashboard.html)[Next

Deployment URLs](https://docs.convex.dev/client/react/deployment-urls.html)

* [Installation](https://docs.convex.dev/client/react/index.html#installation)
* [Connecting to a backend](https://docs.convex.dev/client/react/index.html#connecting-to-a-backend)
* [Fetching data](https://docs.convex.dev/client/react/index.html#fetching-data)
  + [Query arguments](https://docs.convex.dev/client/react/index.html#query-arguments)
  + [Reactivity](https://docs.convex.dev/client/react/index.html#reactivity)
  + [Consistency](https://docs.convex.dev/client/react/index.html#consistency)
  + [Paginating queries](https://docs.convex.dev/client/react/index.html#paginating-queries)
  + [Skipping queries](https://docs.convex.dev/client/react/index.html#skipping-queries)
  + [One-off queries](https://docs.convex.dev/client/react/index.html#one-off-queries)
* [Editing data](https://docs.convex.dev/client/react/index.html#editing-data)
  + [Mutation arguments](https://docs.convex.dev/client/react/index.html#mutation-arguments)
  + [Mutation response and error handling](https://docs.convex.dev/client/react/index.html#mutation-response-and-error-handling)
  + [Retries](https://docs.convex.dev/client/react/index.html#retries)
  + [Optimistic updates](https://docs.convex.dev/client/react/index.html#optimistic-updates)
* [Calling third-party APIs](https://docs.convex.dev/client/react/index.html#calling-third-party-apis)
  + [Action arguments](https://docs.convex.dev/client/react/index.html#action-arguments)
  + [Action response and error handling](https://docs.convex.dev/client/react/index.html#action-response-and-error-handling)
* [Under the hood](https://docs.convex.dev/client/react/index.html#under-the-hood)
