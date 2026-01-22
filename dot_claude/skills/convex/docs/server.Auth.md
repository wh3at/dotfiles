---
title: "Interface: Auth | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/interfaces/server.Auth"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* Auth

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).Auth

An interface to access information about the currently authenticated user
within Convex query and mutation functions.

## Methods[​](https://docs.convex.dev/api/interfaces/server.Auth.html#methods "Direct link to Methods")

### getUserIdentity[​](https://docs.convex.dev/api/interfaces/server.Auth.html#getuseridentity "Direct link to getUserIdentity")

▸ **getUserIdentity**(): `Promise`<`null` | [`UserIdentity`](https://docs.convex.dev/api/interfaces/server.UserIdentity.html)>

Get details about the currently authenticated user.

#### Returns[​](https://docs.convex.dev/api/interfaces/server.Auth.html#returns "Direct link to Returns")

`Promise`<`null` | [`UserIdentity`](https://docs.convex.dev/api/interfaces/server.UserIdentity.html)>

A promise that resolves to a [UserIdentity](https://docs.convex.dev/api/interfaces/server.UserIdentity.html) if the Convex
client was configured with a valid ID token, or if not, will:

* returns `null` on Convex queries, mutations, actions.
* `throw` on HTTP Actions.

#### Defined in[​](https://docs.convex.dev/api/interfaces/server.Auth.html#defined-in "Direct link to Defined in")

[server/authentication.ts:236](https://github.com/get-convex/convex-js/blob/main/src/server/authentication.ts#L236)

[Previous

TableDefinition](https://docs.convex.dev/api/classes/server.TableDefinition.html)[Next

BaseTableReader](https://docs.convex.dev/api/interfaces/server.BaseTableReader.html)

* [Methods](https://docs.convex.dev/api/interfaces/server.Auth.html#methods)
  + [getUserIdentity](https://docs.convex.dev/api/interfaces/server.Auth.html#getuseridentity)
