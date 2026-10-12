---
title: "Application Errors | Convex Developer Hub"
source_url: "https://docs.convex.dev/functions/error-handling/application-errors"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Functions](https://docs.convex.dev/functions.html)
* [Error Handling](https://docs.convex.dev/functions/error-handling/index.html)
* Application Errors

Copy as Markdown

Copied!

On this page

If you have expected ways your functions might fail, you can either return
different values or throw `ConvexError`s.

## Returning different values[​](https://docs.convex.dev/functions/error-handling/application-errors.html#returning-different-values "Direct link to Returning different values")

If you're using TypeScript different return types can enforce that you're
handling error scenarios.

For example, a `createUser` mutation could return

```
Id<"users"> | { error: "EMAIL_ADDRESS_IN_USE" };
```

to express that either the mutation succeeded or the email address was already
taken.

This ensures that you remember to handle these cases in your UI.

## Throwing application errors[​](https://docs.convex.dev/functions/error-handling/application-errors.html#throwing-application-errors "Direct link to Throwing application errors")

You might prefer to throw errors for the following reasons:

* You can use the exception bubbling mechanism to throw from a deeply nested
  function call, instead of manually propagating error results up the call
  stack. This will work for `runQuery`, `runMutation` and `runAction` calls in
  [actions](https://docs.convex.dev/functions/actions.html) too.
* In [mutations](https://docs.convex.dev/functions/mutation-functions.html), throwing an error will
  prevent the mutation transaction from committing
* On the client, it might be simpler to handle all kinds of errors, both
  expected and unexpected, uniformly

Convex provides an error subclass,
[`ConvexError`](https://docs.convex.dev/api/classes/values.ConvexError.html), which can be used to carry
information from the backend to the client:

convex/myFunctions.ts

TS

```
import { ConvexError } from "convex/values";
import { mutation } from "./_generated/server";

export const assignRole = mutation({
  args: {
    // ...
  },
  handler: (ctx, args) => {
    const isTaken = isRoleTaken(/* ... */);
    if (isTaken) {
      throw new ConvexError("Role is already taken");
    }
    // ...
  },
});
```

### Application error `data` payload[​](https://docs.convex.dev/functions/error-handling/application-errors.html#application-error-data-payload "Direct link to application-error-data-payload")

You can pass the same [data types](https://docs.convex.dev/using/types.html) supported by function
arguments, return types and the database, to the `ConvexError` constructor. This
data will be stored on the `data` property of the error:

```
// error.data === "My fancy error message"
throw new ConvexError("My fancy error message");

// error.data === {message: "My fancy error message", code: 123, severity: "high"}
throw new ConvexError({
  message: "My fancy error message",
  code: 123,
  severity: "high",
});

// error.data === {code: 123, severity: "high"}
throw new ConvexError({
  code: 123,
  severity: "high",
});
```

Error payloads more complicated than a simple `string` are helpful for more
structured error logging, or for handling sets of errors differently on the
client.

## Handling application errors on the client[​](https://docs.convex.dev/functions/error-handling/application-errors.html#handling-application-errors-on-the-client "Direct link to Handling application errors on the client")

On the client, application errors also use the `ConvexError` class, and the data
they carry can be accessed via the `data` property:

src/App.tsx

TS

```
import { ConvexError } from "convex/values";
import { useMutation } from "convex/react";
import { api } from "../convex/_generated/api";

export function MyApp() {
  const doSomething = useMutation(api.myFunctions.mutateSomething);
  const handleSomething = async () => {
    try {
      await doSomething({ a: 1, b: 2 });
    } catch (error) {
      const errorMessage =
        // Check whether the error is an application error
        error instanceof ConvexError
          ? // Access data and cast it to the type we expect
            (error.data as { message: string }).message
          : // Must be some developer error,
            // and prod deployments will not
            // reveal any more information about it
            // to the client
            "Unexpected error occurred";
      // do something with `errorMessage`
    }
  };
  // ...
}
```

[Previous

Error Handling](https://docs.convex.dev/functions/error-handling/index.html)[Next

Runtimes](https://docs.convex.dev/functions/runtimes.html)

* [Returning different values](https://docs.convex.dev/functions/error-handling/application-errors.html#returning-different-values)
* [Throwing application errors](https://docs.convex.dev/functions/error-handling/application-errors.html#throwing-application-errors)
  + [Application error `data` payload](https://docs.convex.dev/functions/error-handling/application-errors.html#application-error-data-payload)
* [Handling application errors on the client](https://docs.convex.dev/functions/error-handling/application-errors.html#handling-application-errors-on-the-client)
