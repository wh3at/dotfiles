---
title: "Deployment Platform API | Convex Developer Hub"
source_url: "https://docs.convex.dev/deployment-platform-api"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Deployment API](https://docs.convex.dev/deployment-api.html)
* Platform

Copy as Markdown

Copied!

info

The Convex Deployment API is openly available in Beta. Please contact
[platforms@convex.dev](mailto:platforms@convex.dev) if your use case requires additional capabilities.

Unlike HTTP endpoints which expose application-specific functionality to
clients, management API endpoints configure deployments (e.g. modifying
environment variables).

## Authorization[​](https://docs.convex.dev/deployment-platform-api.html#authorization "Direct link to Authorization")

The Deployment Management API requires a Authorization header with a key that
grants admin access to that deployment.

[Deployment keys](https://docs.convex.dev/cli/deploy-key-types.html#development-deploy-keys)
created in the
[dashboard](https://docs.convex.dev/dashboard/deployments/deployment-settings.html#url-and-deploy-key)
or by API calls can be used for these APIs.

[Team Access Tokens](https://docs.convex.dev/platform-apis.html#managing-your-own-projects) and
[OAuth Application Tokens](https://docs.convex.dev/platform-apis/oauth-applications.html) can also be used
in depending on whether you are using the Management API on behalf of your own
team or on behalf of the team of a user of a Convex integration you've built.

Whatever type of key, add the string `"Convex "` to the front.

```
const token = "ey...0=";
const response = await fetch(
  "https://happy-otter-123.convex.cloud/api/v1/list_environment_variables
  {
    headers: {
      Authorization: `Convex ${token}`,
    },
  },
);
console.log(await response.json());
```

[Previous

Streaming Import](https://docs.convex.dev/streaming-import-api.html)[Next

Update environment variables](https://docs.convex.dev/deployment-api/update-environment-variables.html)
