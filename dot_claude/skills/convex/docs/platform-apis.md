---
title: "Platform APIs | Convex Developer Hub"
source_url: "https://docs.convex.dev/platform-apis"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



Copy as Markdown

Copied!

On this page

info

Convex Platform APIs are in openly available in Beta. Please contact
[platforms@convex.dev](mailto:platforms@convex.dev) if your use case requires additional capabilities.

This guide is for products that want to orchestrate multiple Convex projects in
their accounts or manage projects in their users' accounts. These APIs are most
often used by AI app builders, such as [Bloom](https://bloom.diy/) or
[A0](https://a0.dev/).

These guides assume a good understanding of Convex cloud hierarchy (teams,
projects, and deployments) as well as the
[development workflow](https://docs.convex.dev/understanding/workflow.html).

## Managing your own projects[​](https://docs.convex.dev/platform-apis.html#managing-your-own-projects "Direct link to Managing your own projects")

This means that you are creating projects, deployments, and pushing code
programmatically in the context of the team you own.

To manage projects in your own team, you need to get a team-scoped token and ID
from your
[Team Settings](https://dashboard.convex.dev/team/settings/access-tokens).

caution

These tokens are owned by the team member that's logged into the Convex
dashboard when you retrieve them.

This means that this user owns any dev deployments created by using these
tokens. If this user leaves the team, that also deletes all of their dev
deployments from the team.

We recommend creating a separate service account that's added as a team member.
Retrieve the token after logging in as this service account.

## Managing your users' projects[​](https://docs.convex.dev/platform-apis.html#managing-your-users-projects "Direct link to Managing your users' projects")

This means your users authorize your product to manage their own Convex team or
projects.

To do this, you need to create an OAuth 2.0 application so that the user can
grant your product the necessary permissions.

Follow the [OAuth Applications](https://docs.convex.dev/platform-apis/oauth-applications.html) guide to
create an OAuth application and request a relevant token.

## APIs to manage projects[​](https://docs.convex.dev/platform-apis.html#apis-to-manage-projects "Direct link to APIs to manage projects")

Once you have obtained a token from one of the methods above, you can use it to
call the relevant APIs to manage Convex projects and deployments.

[Management API Reference](https://docs.convex.dev/management-api.html)

## Pushing code to a deployment[​](https://docs.convex.dev/platform-apis.html#pushing-code-to-a-deployment "Direct link to Pushing code to a deployment")

Working with your deployment should be scripted primarily with the existing
Convex CLI. The Convex CLI manages a lot of the heavy lifting: bundling code,
properly handling responses, etc.

The examples here assume you are working in a container with shell and file
system access from which you can drive the app building process. You likely
already have this if you're generating frontend code.

Set [`CONVEX_DEPLOY_KEY`](https://docs.convex.dev/cli/deploy-key-types.html) is the value returned
by the [Create deploy key](https://docs.convex.dev/management-api/create-deploy-key.html) API.

### Pushing code to the dev Convex backend[​](https://docs.convex.dev/platform-apis.html#pushing-code-to-the-dev-convex-backend "Direct link to Pushing code to the dev Convex backend")

```
CONVEX_DEPLOY_KEY="YOUR_DEPLOY_KEY" npx convex dev --once
```

### Pushing code to the prod Convex backend[​](https://docs.convex.dev/platform-apis.html#pushing-code-to-the-prod-convex-backend "Direct link to Pushing code to the prod Convex backend")

```
CONVEX_DEPLOY_KEY="YOUR_DEPLOY_KEY" npx convex deploy
```

To view the full list of commands, refer to the [CLI documentation](https://docs.convex.dev/using/cli.html).

[Previous

Self Hosting](https://docs.convex.dev/self-hosting.html)[Next

OAuth Applications](https://docs.convex.dev/platform-apis/oauth-applications.html)

* [Managing your own projects](https://docs.convex.dev/platform-apis.html#managing-your-own-projects)
* [Managing your users' projects](https://docs.convex.dev/platform-apis.html#managing-your-users-projects)
* [APIs to manage projects](https://docs.convex.dev/platform-apis.html#apis-to-manage-projects)
* [Pushing code to a deployment](https://docs.convex.dev/platform-apis.html#pushing-code-to-a-deployment)
  + [Pushing code to the dev Convex backend](https://docs.convex.dev/platform-apis.html#pushing-code-to-the-dev-convex-backend)
  + [Pushing code to the prod Convex backend](https://docs.convex.dev/platform-apis.html#pushing-code-to-the-prod-convex-backend)
