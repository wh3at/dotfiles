---
title: "Create deploy key | Convex Developer Hub"
source_url: "https://docs.convex.dev/management-api/create-deploy-key"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Management API](https://docs.convex.dev/management-api.html)
* Create deploy key

Copy as Markdown

Copied!

# Create deploy key

```
POST

## /deployments/:deployment_name/create_deploy_key
```

Create a deploy key like "dev:happy-animal-123|ey..." which can be
used with the Convex CLI to develop against or deploy code.

When access to the deployment is granted through an OAuth token this
deploy key will use the same OAuth-granted token.

When access to the deployment is granted any other way a new token will be
created which grants access only to this deployment.

## Request[​](https://docs.convex.dev/management-api/create-deploy-key.html#request "Direct link to Request")

## Responses[​](https://docs.convex.dev/management-api/create-deploy-key.html#responses "Direct link to Responses")

* 200

[Previous

Delete project](https://docs.convex.dev/management-api/delete-project.html)[Next

Get token details](https://docs.convex.dev/management-api/get-token-details.html)
