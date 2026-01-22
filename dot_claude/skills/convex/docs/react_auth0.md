---
title: "Module: react-auth0 | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/modules/react_auth0"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* convex/react-auth0

Copy as Markdown

Copied!

On this page

React login component for use with Auth0.

## Functions[​](https://docs.convex.dev/api/modules/react_auth0.html#functions "Direct link to Functions")

### ConvexProviderWithAuth0[​](https://docs.convex.dev/api/modules/react_auth0.html#convexproviderwithauth0 "Direct link to ConvexProviderWithAuth0")

▸ **ConvexProviderWithAuth0**(`«destructured»`): `Element`

A wrapper React component which provides a [ConvexReactClient](https://docs.convex.dev/api/classes/react.ConvexReactClient.html)
authenticated with Auth0.

It must be wrapped by a configured `Auth0Provider` from `@auth0/auth0-react`.

See [Convex Auth0](https://docs.convex.dev/auth/auth0.html) on how to set up
Convex with Auth0.

#### Parameters[​](https://docs.convex.dev/api/modules/react_auth0.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `«destructured»` | `Object` |
| › `children` | `ReactNode` |
| › `client` | `IConvexReactClient` |

#### Returns[​](https://docs.convex.dev/api/modules/react_auth0.html#returns "Direct link to Returns")

`Element`

#### Defined in[​](https://docs.convex.dev/api/modules/react_auth0.html#defined-in "Direct link to Defined in")

[react-auth0/ConvexProviderWithAuth0.tsx:26](https://github.com/get-convex/convex-js/blob/main/src/react-auth0/ConvexProviderWithAuth0.tsx#L26)

[Previous

WatchQueryOptions](https://docs.convex.dev/api/interfaces/react.WatchQueryOptions.html)[Next

convex/react-clerk](https://docs.convex.dev/api/modules/react_clerk.html)

* [Functions](https://docs.convex.dev/api/modules/react_auth0.html#functions)
  + [ConvexProviderWithAuth0](https://docs.convex.dev/api/modules/react_auth0.html#convexproviderwithauth0)
