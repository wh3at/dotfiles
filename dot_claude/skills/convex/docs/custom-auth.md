---
title: "Custom OIDC Provider | Convex Developer Hub"
source_url: "https://docs.convex.dev/auth/advanced/custom-auth"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Authentication](https://docs.convex.dev/auth.html)
* Advanced
* Custom OIDC Provider

Copy as Markdown

Copied!

On this page

**Note: This is an advanced feature!** We recommend sticking with the
[supported third-party authentication providers](https://docs.convex.dev/auth.html).

Convex can be integrated with any identity provider supporting the
[OpenID Connect](https://openid.net/connect/) protocol. At minimum this means
that the provider can issue
[ID tokens](https://openid.net/specs/openid-connect-core-1_0.html#IDToken) and
exposes the corresponding
[JWKS](https://auth0.com/docs/secure/tokens/json-web-tokens/json-web-key-sets).
The ID token is passed from the client to your Convex backend which ensures that
the token is valid and enables you to query the user information embedded in the
token, as described in [Auth in Functions](https://docs.convex.dev/auth/functions-auth.html).

## Server-side integration[​](https://docs.convex.dev/auth/advanced/custom-auth.html#server-side-integration "Direct link to Server-side integration")

Just like with [Clerk](https://docs.convex.dev/auth/clerk.html) and [Auth0](https://docs.convex.dev/auth/auth0.html), the
backend needs to be aware of the domain of the Issuer and your application's
specific applicationID for a given identity provider.

Add these to your `convex/auth.config.ts` file:

convex/auth.config.ts

TS

```
import { AuthConfig } from "convex/server";

export default {
  providers: [
    {
      domain: "https://your.issuer.url.com",
      applicationID: "your-application-id",
    },
  ],
} satisfies AuthConfig;
```

The `applicationID` property must exactly match the `aud` field of your JWT and
the `domain` property must exactly match the `iss` field of the JWT. Use a tool
like [jwt.io](https://jwt.io/) to view an JWT and confirm these fields match
exactly.

If multiple providers are provided, the first one fulfilling the above criteria
will be used.

If you're not able to obtain tokens with an `aud` field, you'll need to instead
configure a [Custom JWT](https://docs.convex.dev/auth/advanced/custom-jwt.html). If you're not sure if
your token is an OIDC ID token, check
[the spec](https://openid.net/specs/openid-connect-core-1_0-final.html#rfc.section.2)
for a list of all required fields.

OIDC requires the routes `${domain}/.well-known/jwks.json` and
`${domain}/.well-known/openid-configuration`. `domain` may include a path like
`https://your.issuer.url.com/api/auth`. This isn't common for third party auth
providers but may be useful if you're implementing OIDC on your own server.

## Client-side integration[​](https://docs.convex.dev/auth/advanced/custom-auth.html#client-side-integration "Direct link to Client-side integration")

### Integrating a new identity provider[​](https://docs.convex.dev/auth/advanced/custom-auth.html#integrating-a-new-identity-provider "Direct link to Integrating a new identity provider")

The [`ConvexProviderWithAuth`](https://docs.convex.dev/api/modules/react.html#convexproviderwithauth)
component provides a convenient abstraction for building an auth integration
similar to the ones Convex provides for [Clerk](https://docs.convex.dev/auth/clerk.html) and
[Auth0](https://docs.convex.dev/auth/auth0.html).

In the following example we build an integration with an imaginary "ProviderX",
whose React integration includes `AuthProviderXReactProvider` and
`useProviderXAuth` hook.

First we replace `ConvexProvider` with `AuthProviderXReactProvider` wrapping
`ConvexProviderWithAuth` at the root of our app:

src/index.js

```
import { AuthProviderXReactProvider } from "providerX";
import { ConvexProviderWithAuth } from "convex/react";

root.render(
  <StrictMode>
    <AuthProviderXReactProvider>
      <ConvexProviderWithAuth client={convex} useAuth={useAuthFromProviderX}>
        <App />
      </ConvexProviderWithAuth>
    </AuthProviderXReactProvider>
  </StrictMode>,
);
```

All we really need is to implement the `useAuthFromProviderX` hook which gets
passed to the `ConvexProviderWithAuth` component.

This `useAuthFromProviderX` hook provides a translation between the auth
provider API and the [`ConvexReactClient`](https://docs.convex.dev/api/classes/react.ConvexReactClient.html)
API, which is ultimately responsible for making sure that the ID token is passed
down to your Convex backend.

src/ConvexProviderWithProviderX.js

```
function useAuthFromProviderX() {
  const { isLoading, isAuthenticated, getToken } = useProviderXAuth();
  const fetchAccessToken = useCallback(
    async ({ forceRefreshToken }) => {
      // Here you can do whatever transformation to get the ID Token
      // or null
      // Make sure to fetch a new token when `forceRefreshToken` is true
      return await getToken({ ignoreCache: forceRefreshToken });
    },
    // If `getToken` isn't correctly memoized
    // remove it from this dependency array
    [getToken],
  );
  return useMemo(
    () => ({
      // Whether the auth provider is in a loading state
      isLoading: isLoading,
      // Whether the auth provider has the user signed in
      isAuthenticated: isAuthenticated ?? false,
      // The async function to fetch the ID token
      fetchAccessToken,
    }),
    [isLoading, isAuthenticated, fetchAccessToken],
  );
}
```

### Using the new provider[​](https://docs.convex.dev/auth/advanced/custom-auth.html#using-the-new-provider "Direct link to Using the new provider")

If you successfully follow the steps above you can now use the standard Convex
utilities for checking the authentication state: the
[`useConvexAuth()`](https://docs.convex.dev/api/modules/react.html#useconvexauth) hook and the
[`Authenticated`](https://docs.convex.dev/api/modules/react.html#authenticated),
[`Unauthenticated`](https://docs.convex.dev/api/modules/react.html#authenticated) and
[`AuthLoading`](https://docs.convex.dev/api/modules/react.html#authloading) helper components.

### Debugging[​](https://docs.convex.dev/auth/advanced/custom-auth.html#debugging "Direct link to Debugging")

See [Debugging Authentication](https://docs.convex.dev/auth/debug.html).

Related posts from [![Stack](https://docs.convex.dev/img/stack-logo-dark.svg)![Stack](https://docs.convex.dev/img/stack-logo-light.svg)](https://stack.convex.dev/)

[Previous

Debugging](https://docs.convex.dev/auth/debug.html)[Next

Custom JWT Provider](https://docs.convex.dev/auth/advanced/custom-jwt.html)

* [Server-side integration](https://docs.convex.dev/auth/advanced/custom-auth.html#server-side-integration)
* [Client-side integration](https://docs.convex.dev/auth/advanced/custom-auth.html#client-side-integration)
  + [Integrating a new identity provider](https://docs.convex.dev/auth/advanced/custom-auth.html#integrating-a-new-identity-provider)
  + [Using the new provider](https://docs.convex.dev/auth/advanced/custom-auth.html#using-the-new-provider)
  + [Debugging](https://docs.convex.dev/auth/advanced/custom-auth.html#debugging)
