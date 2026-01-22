---
title: "Module: react-clerk | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/modules/react_clerk"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* convex/react-clerk

Copy as Markdown

Copied!

On this page

React login component for use with Clerk.

## Functions[​](https://docs.convex.dev/api/modules/react_clerk.html#functions "Direct link to Functions")

### ConvexProviderWithClerk[​](https://docs.convex.dev/api/modules/react_clerk.html#convexproviderwithclerk "Direct link to ConvexProviderWithClerk")

▸ **ConvexProviderWithClerk**(`«destructured»`): `Element`

A wrapper React component which provides a [ConvexReactClient](https://docs.convex.dev/api/classes/react.ConvexReactClient.html)
authenticated with Clerk.

It must be wrapped by a configured `ClerkProvider`, from
`@clerk/clerk-react`, `@clerk/clerk-expo`, `@clerk/nextjs` or
another React-based Clerk client library and have the corresponding
`useAuth` hook passed in.

See [Convex Clerk](https://docs.convex.dev/auth/clerk.html) on how to set up
Convex with Clerk.

#### Parameters[​](https://docs.convex.dev/api/modules/react_clerk.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `«destructured»` | `Object` |
| › `children` | `ReactNode` |
| › `client` | `IConvexReactClient` |
| › `useAuth` | `UseAuth` |

#### Returns[​](https://docs.convex.dev/api/modules/react_clerk.html#returns "Direct link to Returns")

`Element`

#### Defined in[​](https://docs.convex.dev/api/modules/react_clerk.html#defined-in "Direct link to Defined in")

[react-clerk/ConvexProviderWithClerk.tsx:41](https://github.com/get-convex/convex-js/blob/main/src/react-clerk/ConvexProviderWithClerk.tsx#L41)

[Previous

convex/react-auth0](https://docs.convex.dev/api/modules/react_auth0.html)[Next

convex/nextjs](https://docs.convex.dev/api/modules/nextjs)

* [Functions](https://docs.convex.dev/api/modules/react_clerk.html#functions)
  + [ConvexProviderWithClerk](https://docs.convex.dev/api/modules/react_clerk.html#convexproviderwithclerk)
