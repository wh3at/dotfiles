---
title: "Management API | Convex Developer Hub"
source_url: "https://docs.convex.dev/management-api"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



Copy as Markdown

Copied!

info

The Convex Management API is openly available in Beta. Please contact
[platforms@convex.dev](mailto:platforms@convex.dev) if your use case requires additional capabilities.

You can provision and manage Convex projects and deployments with the Management
API.

## Authorization[​](https://docs.convex.dev/management-api.html#authorization "Direct link to Authorization")

The Management API uses a Bearer token Authorization header.

```
const token = "ey...0=";
const response = await fetch(
  "https://api.convex.dev/v1/teams/41/list_projects",
  {
    headers: {
      Authorization: `Bearer ${token}`,
    },
  },
);
console.log(await response.json());
```

[Team Access Tokens](https://docs.convex.dev/platform-apis.html#managing-your-own-projects) and
[OAuth Application Tokens](https://docs.convex.dev/platform-apis/oauth-applications.html) can be used in
Bearer tokens depending on whether you are using the Management API on behalf of
your own team or on behalf of the team of a user of a Convex integration you've
built.

## Required Parameters[​](https://docs.convex.dev/management-api.html#required-parameters "Direct link to Required Parameters")

Most Management APIs require a team ID or project ID.

When creating a Team Access Token the team ID will be available in the Convex
dashboard.

OAuth applications may request the team (or project, if using project-scoped
tokens) ID by calling the [Token Details](https://docs.convex.dev/management-api/get-token-details.html)
endpoint.

When using a team token, projects will be assigned IDs upon creation. The
[List Projects](https://docs.convex.dev/management-api/list-projects.html) endpoint may also be used to
retrieve the ID for a project.

## Responses[​](https://docs.convex.dev/management-api.html#responses "Direct link to Responses")

All API responses are in JSON format.

## Endpoints[​](https://docs.convex.dev/management-api.html#endpoints "Direct link to Endpoints")

An OpenAPI spec for the Management API is available at
<https://api.convex.dev/v1/openapi.json>.

[Previous

Get canonical URLs](https://docs.convex.dev/deployment-api/get-canonical-urls.html)[Next

Create project](https://docs.convex.dev/management-api/create-project.html)
