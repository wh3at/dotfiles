---
title: "Class: HttpRouter | Convex Developer Hub"
source_url: "https://docs.convex.dev/api/classes/server.HttpRouter"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Convex API](https://docs.convex.dev/api/index.html)
* [convex/server](https://docs.convex.dev/api/modules/server.html)
* HttpRouter

Copy as Markdown

Copied!

On this page

[server](https://docs.convex.dev/api/modules/server.html).HttpRouter

HTTP router for specifying the paths and methods of [httpActionGeneric](https://docs.convex.dev/api/modules/server.html#httpactiongeneric)s

An example `convex/http.js` file might look like this.

```
import { httpRouter } from "convex/server";
import { getMessagesByAuthor } from "./getMessagesByAuthor";
import { httpAction } from "./_generated/server";

const http = httpRouter();

// HTTP actions can be defined inline...
http.route({
  path: "/message",
  method: "POST",
  handler: httpAction(async ({ runMutation }, request) => {
    const { author, body } = await request.json();

    await runMutation(api.sendMessage.default, { body, author });
    return new Response(null, {
      status: 200,
    });
  })
});

// ...or they can be imported from other files.
http.route({
  path: "/getMessagesByAuthor",
  method: "GET",
  handler: getMessagesByAuthor,
});

// Convex expects the router to be the default export of `convex/http.js`.
export default http;
```

## Constructors[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#constructors "Direct link to Constructors")

### constructor[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#constructor "Direct link to constructor")

• **new HttpRouter**()

## Properties[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#properties "Direct link to Properties")

### exactRoutes[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#exactroutes "Direct link to exactRoutes")

• **exactRoutes**: `Map`<`string`, `Map`<`"GET"` | `"POST"` | `"PUT"` | `"DELETE"` | `"OPTIONS"` | `"PATCH"`, [`PublicHttpAction`](https://docs.convex.dev/api/modules/server.html#publichttpaction)>>

#### Defined in[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#defined-in "Direct link to Defined in")

[server/router.ts:143](https://github.com/get-convex/convex-js/blob/main/src/server/router.ts#L143)

---

### prefixRoutes[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#prefixroutes "Direct link to prefixRoutes")

• **prefixRoutes**: `Map`<`"GET"` | `"POST"` | `"PUT"` | `"DELETE"` | `"OPTIONS"` | `"PATCH"`, `Map`<`string`, [`PublicHttpAction`](https://docs.convex.dev/api/modules/server.html#publichttpaction)>>

#### Defined in[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#defined-in-1 "Direct link to Defined in")

[server/router.ts:144](https://github.com/get-convex/convex-js/blob/main/src/server/router.ts#L144)

---

### isRouter[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#isrouter "Direct link to isRouter")

• **isRouter**: `true`

#### Defined in[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#defined-in-2 "Direct link to Defined in")

[server/router.ts:145](https://github.com/get-convex/convex-js/blob/main/src/server/router.ts#L145)

## Methods[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#methods "Direct link to Methods")

### route[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#route "Direct link to route")

▸ **route**(`spec`): `void`

Specify an HttpAction to be used to respond to requests
for an HTTP method (e.g. "GET") and a path or pathPrefix.

Paths must begin with a slash. Path prefixes must also end in a slash.

```
// matches `/profile` (but not `/profile/`)
http.route({ path: "/profile", method: "GET", handler: getProfile})

// matches `/profiles/`, `/profiles/abc`, and `/profiles/a/c/b` (but not `/profile`)
http.route({ pathPrefix: "/profile/", method: "GET", handler: getProfile})
```

#### Parameters[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#parameters "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `spec` | [`RouteSpec`](https://docs.convex.dev/api/modules/server.html#routespec) |

#### Returns[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#returns "Direct link to Returns")

`void`

#### Defined in[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#defined-in-3 "Direct link to Defined in")

[server/router.ts:161](https://github.com/get-convex/convex-js/blob/main/src/server/router.ts#L161)

---

### getRoutes[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#getroutes "Direct link to getRoutes")

▸ **getRoutes**(): readonly [`string`, `"GET"` | `"POST"` | `"PUT"` | `"DELETE"` | `"OPTIONS"` | `"PATCH"`, [`PublicHttpAction`](https://docs.convex.dev/api/modules/server.html#publichttpaction)][]

Returns a list of routed HTTP actions.

These are used to populate the list of routes shown in the Functions page of the Convex dashboard.

#### Returns[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#returns-1 "Direct link to Returns")

readonly [`string`, `"GET"` | `"POST"` | `"PUT"` | `"DELETE"` | `"OPTIONS"` | `"PATCH"`, [`PublicHttpAction`](https://docs.convex.dev/api/modules/server.html#publichttpaction)][]

* an array of [path, method, endpoint] tuples.

#### Defined in[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#defined-in-4 "Direct link to Defined in")

[server/router.ts:229](https://github.com/get-convex/convex-js/blob/main/src/server/router.ts#L229)

---

### lookup[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#lookup "Direct link to lookup")

▸ **lookup**(`path`, `method`): `null` | readonly [[`PublicHttpAction`](https://docs.convex.dev/api/modules/server.html#publichttpaction), `"GET"` | `"POST"` | `"PUT"` | `"DELETE"` | `"OPTIONS"` | `"PATCH"`, `string`]

Returns the appropriate HTTP action and its routed request path and method.

The path and method returned are used for logging and metrics, and should
match up with one of the routes returned by `getRoutes`.

For example,

```
http.route({ pathPrefix: "/profile/", method: "GET", handler: getProfile});

http.lookup("/profile/abc", "GET") // returns [getProfile, "GET", "/profile/*"]
```

#### Parameters[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#parameters-1 "Direct link to Parameters")

| Name | Type |
| --- | --- |
| `path` | `string` |
| `method` | `"GET"` | `"POST"` | `"PUT"` | `"DELETE"` | `"OPTIONS"` | `"PATCH"` | `"HEAD"` |

#### Returns[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#returns-2 "Direct link to Returns")

`null` | readonly [[`PublicHttpAction`](https://docs.convex.dev/api/modules/server.html#publichttpaction), `"GET"` | `"POST"` | `"PUT"` | `"DELETE"` | `"OPTIONS"` | `"PATCH"`, `string`]

* a tuple [[PublicHttpAction](https://docs.convex.dev/api/modules/server.html#publichttpaction), method, path] or null.

#### Defined in[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#defined-in-5 "Direct link to Defined in")

[server/router.ts:275](https://github.com/get-convex/convex-js/blob/main/src/server/router.ts#L275)

---

### runRequest[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#runrequest "Direct link to runRequest")

▸ **runRequest**(`argsStr`, `requestRoute`): `Promise`<`string`>

Given a JSON string representation of a Request object, return a Response
by routing the request and running the appropriate endpoint or returning
a 404 Response.

#### Parameters[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#parameters-2 "Direct link to Parameters")

| Name | Type | Description |
| --- | --- | --- |
| `argsStr` | `string` | a JSON string representing a Request object. |
| `requestRoute` | `string` | - |

#### Returns[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#returns-3 "Direct link to Returns")

`Promise`<`string`>

* a Response object.

#### Defined in[​](https://docs.convex.dev/api/classes/server.HttpRouter.html#defined-in-6 "Direct link to Defined in")

[server/router.ts:304](https://github.com/get-convex/convex-js/blob/main/src/server/router.ts#L304)

[Previous

FilterExpression](https://docs.convex.dev/api/classes/server.FilterExpression.html)[Next

IndexRange](https://docs.convex.dev/api/classes/server.IndexRange.html)

* [Constructors](https://docs.convex.dev/api/classes/server.HttpRouter.html#constructors)
  + [constructor](https://docs.convex.dev/api/classes/server.HttpRouter.html#constructor)
* [Properties](https://docs.convex.dev/api/classes/server.HttpRouter.html#properties)
  + [exactRoutes](https://docs.convex.dev/api/classes/server.HttpRouter.html#exactroutes)
  + [prefixRoutes](https://docs.convex.dev/api/classes/server.HttpRouter.html#prefixroutes)
  + [isRouter](https://docs.convex.dev/api/classes/server.HttpRouter.html#isrouter)
* [Methods](https://docs.convex.dev/api/classes/server.HttpRouter.html#methods)
  + [route](https://docs.convex.dev/api/classes/server.HttpRouter.html#route)
  + [getRoutes](https://docs.convex.dev/api/classes/server.HttpRouter.html#getroutes)
  + [lookup](https://docs.convex.dev/api/classes/server.HttpRouter.html#lookup)
  + [runRequest](https://docs.convex.dev/api/classes/server.HttpRouter.html#runrequest)
