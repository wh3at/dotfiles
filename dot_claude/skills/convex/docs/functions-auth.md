---
title: "Auth in Functions | Convex Developer Hub"
source_url: "https://docs.convex.dev/auth/functions-auth"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Authentication](https://docs.convex.dev/auth.html)
* Functions

Copy as Markdown

Copied!

On this page

*If you're using Convex Auth, see the
[authorization doc](https://labs.convex.dev/auth/authz#use-authentication-state-in-backend-functions).*

Within a Convex [function](https://docs.convex.dev/functions.html), you can access information about the
currently logged-in user by using the [`auth`](https://docs.convex.dev/api/interfaces/server.Auth.html)
property of the [`QueryCtx`](https://docs.convex.dev/generated-api/server.html#queryctx),
[`MutationCtx`](https://docs.convex.dev/generated-api/server.html#mutationctx), or
[`ActionCtx`](https://docs.convex.dev/generated-api/server.html#actionctx) object:

convex/myFunctions.ts

TS

```
import { mutation } from "./_generated/server";

export const myMutation = mutation({
  args: {
    // ...
  },
  handler: async (ctx, args) => {
    const identity = await ctx.auth.getUserIdentity();
    if (identity === null) {
      throw new Error("Unauthenticated call to mutation");
    }
    //...
  },
});
```

## User identity fields[​](https://docs.convex.dev/auth/functions-auth.html#user-identity-fields "Direct link to User identity fields")

The [UserIdentity](https://docs.convex.dev/api/interfaces/server.UserIdentity.html) object returned by
`getUserIdentity` is guaranteed to have `tokenIdentifier`, `subject` and
`issuer` fields. Which other fields it will include depends on the identity
provider used and the configuration of JWT tokens and
[OpenID scopes](https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims).

`tokenIdentifier` is a combination of `subject` and `issuer` to ensure
uniqueness even when multiple providers are used.

If you followed one of our integrations with Clerk or Auth0 at least the
following fields will be present: `familyName`, `givenName`, `nickname`,
`pictureUrl`, `updatedAt`, `email`, `emailVerified`. See their corresponding
standard definition in the
[OpenID docs](https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims).

convex/myFunctions.ts

TS

```
import { mutation } from "./_generated/server";

export const myMutation = mutation({
  args: {
    // ...
  },
  handler: async (ctx, args) => {
    const identity = await ctx.auth.getUserIdentity();
    const { tokenIdentifier, name, email } = identity!;
    //...
  },
});
```

### Clerk claims configuration[​](https://docs.convex.dev/auth/functions-auth.html#clerk-claims-configuration "Direct link to Clerk claims configuration")

If you're using Clerk, the fields returned by `getUserIdentity` are determined
by your JWT template's *Claims* config. If you've set custom claims, they will
be returned by `getUserIdentity` as well.

### Custom JWT Auth[​](https://docs.convex.dev/auth/functions-auth.html#custom-jwt-auth "Direct link to Custom JWT Auth")

If you're using [Custom JWT auth](https://docs.convex.dev/auth/advanced/custom-jwt.html) instead of
OpenID standard fields you'll find each nested field available at
dot-containing-string field names like `identity["properties.email"]`.

## HTTP Actions[​](https://docs.convex.dev/auth/functions-auth.html#http-actions "Direct link to HTTP Actions")

You can also access the user identity from an HTTP action
[`ctx.auth.getUserIdentity()`](https://docs.convex.dev/api/interfaces/server.Auth.html#getuseridentity), by
calling your endpoint with an `Authorization` header including a JWT token:

myPage.ts

TS

```
const jwtToken = "...";

fetch("https://<deployment name>.convex.site/myAction", {
  headers: {
    Authorization: `Bearer ${jwtToken}`,
  },
});
```

Related posts from [![Stack](https://docs.convex.dev/img/stack-logo-dark.svg)![Stack](https://docs.convex.dev/img/stack-logo-light.svg)](https://stack.convex.dev/)

[Previous

Auth0](https://docs.convex.dev/auth/auth0.html)[Next

Database](https://docs.convex.dev/auth/database-auth.html)

* [User identity fields](https://docs.convex.dev/auth/functions-auth.html#user-identity-fields)
  + [Clerk claims configuration](https://docs.convex.dev/auth/functions-auth.html#clerk-claims-configuration)
  + [Custom JWT Auth](https://docs.convex.dev/auth/functions-auth.html#custom-jwt-auth)
* [HTTP Actions](https://docs.convex.dev/auth/functions-auth.html#http-actions)
