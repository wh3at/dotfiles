---
title: "Local Deployments for Development | Convex Developer Hub"
source_url: "https://docs.convex.dev/cli/local-deployments"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [CLI](https://docs.convex.dev/using/cli.html)
* Local Deployments

Copy as Markdown

Copied!

On this page

Instead of syncing code to a Convex dev deployment hosted in the cloud, you can
develop against a deployment running on your own computer. You can even use the
Convex dashboard with local deployments!

## Background on deployments in Convex[​](https://docs.convex.dev/cli/local-deployments.html#background-on-deployments-in-convex "Direct link to Background on deployments in Convex")

Each Convex deployment contains its own data, functions, scheduled functions,
etc. A project has one production deployment, up to one cloud deployment for
development per team member, and potentially many transient
[preview deployments](https://docs.convex.dev/production/hosting/preview-deployments.html).

You can also develop with Convex using a deployment running on your own machine.
Since the deployment is running locally, code sync is faster and means resources
like functions calls and database bandwidth don't count against
[the quotas for your Convex plan](https://www.convex.dev/pricing).

You can use local deployments with an existing Convex project, and view your
deployment in the Convex dashboard under your project. You can also use local
deployments without a Convex account and debug and inspect them with a locally
running version of the Convex dashboard.

## Using local deployments[​](https://docs.convex.dev/cli/local-deployments.html#using-local-deployments "Direct link to Using local deployments")

Local deployments are in beta

Local deployments are currently a [beta
feature](https://docs.convex.dev/production/state/index.html#beta-features). If you have feedback or feature
requests, [let us know on Discord](https://convex.dev/community)!

While using local deployments, the local Convex backend runs as a subprocess of
the `npx convex dev` command and exits when that command is stopped. This means
a `convex dev` command must be running in order to run other commands like
`npx convex run` against this local deployment or for your frontend to connect
to this deployment.

State for local backends is stored the `~/.convex/` directory.

### Anonymous development[​](https://docs.convex.dev/cli/local-deployments.html#anonymous-development "Direct link to Anonymous development")

You can use local deployments to develop with Convex without having to create an
account. Whenever you want to create an account to deploy your app to production
or to use more Convex features, you can use `npx convex login` to link your
local deployments with your account.

### Local deployments for an existing project[​](https://docs.convex.dev/cli/local-deployments.html#local-deployments-for-an-existing-project "Direct link to Local deployments for an existing project")

To use a local deployment for an existing project, run:

```
npx convex dev --local --once
```

You'll also always be given the option for a local deployment if you run
`npx convex dev --configure`. Other flows may assume you want a cloud deployment
in some situations, for example when connecting to a project for which you
already have a cloud development deployment.

## Local deployments vs. production[​](https://docs.convex.dev/cli/local-deployments.html#local-deployments-vs-production "Direct link to Local deployments vs. production")

Local deployments are not recommended for production use: they're development
deployments, i.e. logs for function results and full stack traces for error
responses are sent to connected clients.

For running a production application, you can use a production deployment hosted
on the Convex cloud. Learn more about deploying to production
[here](https://docs.convex.dev/production.html).

Alternatively, you can self-host a production deployment using the
[open source convex-backend repo](https://github.com/get-convex/convex-backend).

### Disabling[​](https://docs.convex.dev/cli/local-deployments.html#disabling "Direct link to Disabling")

To stop using local developments for a project, run the following:

```
npx convex disable-local-deployments
```

Remember your cloud dev deployment and each local dev deployment are completely
separate, so contain different data. When switching between deployments you may
wish to [export and re-import](https://docs.convex.dev/database/import-export/index.html) the
data to keep using it.

## Limitations[​](https://docs.convex.dev/cli/local-deployments.html#limitations "Direct link to Limitations")

* **No Public URL** - Cloud deployments have public URL to receive incoming HTTP
  requests from services like Twilio, but local deployments listen for HTTP
  requests on your own computer. Similarly, you can't power websites with Convex
  WebSocket connections unless your users browsers know how to reach your
  computer. Set up a proxy like ngrok or use a cloud deployment for these uses
  cases.
* **Node actions require specific Node.js versions** - Running Node.js actions
  (actions defined in files with `"use node;"`) requires having Node.js 18
  installed, since this is the version of Node.js used in production when
  Node.js actions run in AWS Lambda functions. To resolve this you can install
  and set up [nvm](https://github.com/nvm-sh/nvm) and then install Node.js
  version 18. You don't need to use Node.js 18 for the rest of your project.
* **Node.js actions run directly on your computer** - Like a normal Node.js
  server, code running in Node.js actions has unrestricted filesystem access.
  Queries, mutations, and Convex runtime actions still run in isolated
  environments.
* Logs get cleared out every time a `npx convex dev` command is restarted.
* **Using the dashboard with Safari**: Safari [blocks
  requests to localhost](https://bugs.webkit.org/show_bug.cgi?id=171934), which
  prevents the dashboard from working with local deployments. We recommend using
  another browser if you’re using local deployments.
* **Using the dashboard with Brave**: Brave [blocks requests
  to localhost by
  default](https://brave.com/privacy-updates/27-localhost-permission/), which
  prevents the dashboard from working with local deployments. You can use the
  following workaround:

  + Go to `brave://flags/`
  + Enable the `#brave-localhost-access-permission` flag
  + Go back to the Convex dashboard
  + Click on **View Site Information**
    (![View Site Information icon](https://docs.convex.dev/screenshots/brave-site-information.png))
    in the URL bar, then on **Site settings**
  + Change the setting for **Localhost access** to **Allow**

[Previous

CLI](https://docs.convex.dev/using/cli.html)[Next

Agent Mode](https://docs.convex.dev/cli/agent-mode.html)

* [Background on deployments in Convex](https://docs.convex.dev/cli/local-deployments.html#background-on-deployments-in-convex)
* [Using local deployments](https://docs.convex.dev/cli/local-deployments.html#using-local-deployments)
  + [Anonymous development](https://docs.convex.dev/cli/local-deployments.html#anonymous-development)
  + [Local deployments for an existing project](https://docs.convex.dev/cli/local-deployments.html#local-deployments-for-an-existing-project)
* [Local deployments vs. production](https://docs.convex.dev/cli/local-deployments.html#local-deployments-vs-production)
  + [Disabling](https://docs.convex.dev/cli/local-deployments.html#disabling)
* [Limitations](https://docs.convex.dev/cli/local-deployments.html#limitations)
