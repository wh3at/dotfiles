---
title: "Update environment variables | Convex Developer Hub"
source_url: "https://docs.convex.dev/deployment-api/update-environment-variables"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Deployment API](https://docs.convex.dev/deployment-api.html)
* [Platform](https://docs.convex.dev/deployment-platform-api.html)
* Update environment variables

Copy as Markdown

Copied!

# Update environment variables

```
POST

## /update_environment_variables
```

Update one or many environment variables in a deployment.
This will invalidate all subscriptions, since environment variables
are accessible in queries but are not part of the cache key of a query
result.

## Request[​](https://docs.convex.dev/deployment-api/update-environment-variables.html#request "Direct link to Request")

## Responses[​](https://docs.convex.dev/deployment-api/update-environment-variables.html#responses "Direct link to Responses")

* 200

[Previous

Deployment Platform API](https://docs.convex.dev/deployment-platform-api.html)[Next

List environment variables](https://docs.convex.dev/deployment-api/list-environment-variables.html)
