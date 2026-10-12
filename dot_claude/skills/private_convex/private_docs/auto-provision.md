---
title: "Automatic AuthKit Configuration | Convex Developer Hub"
source_url: "https://docs.convex.dev/auth/authkit/auto-provision"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Authentication](https://docs.convex.dev/auth.html)
* [WorkOS AuthKit](https://docs.convex.dev/auth/authkit/index.html)
* Automatic Config

Copy as Markdown

Copied!

On this page

AuthKit configuration can be automated for cloud dev deployments: each Convex
deployment gets its own WorkOS environment configured and has local environment
variables added to `.env.local` and Convex deployment environment variables set
for it.

This integration is in active development and will change as it continues to
improve. Today the integration works with the two AuthKit templates offered when
running `npm create convex@latest`.

## Creating WorkOS environments on-demand[​](https://docs.convex.dev/auth/authkit/auto-provision.html#creating-workos-environments-on-demand "Direct link to Creating WorkOS environments on-demand")

Automatically provisioning a WorkOS environment for a Convex deployment is
enabled by creating a new WorkOS account and team to associate with a Convex
team. Once this account has been created, any member of the Convex team can
create a WorkOS environment for their development deployments on each of the
team's projects.

This happens automatically whenever the `WORKOS_CLIENT_ID` environment variable
is read in the `convex/auth.config.ts` file but not set on the deployment during
a `convex dev`.

The CLI then makes AuthKit-related configuration changes that replace the
[manual configuration steps](https://docs.convex.dev/auth/authkit/index.html#configuring-an-existing-workos-account)
required to configure AuthKit for a development Convex deployment.

Currently this configures the following with the assumed local development
domain:

* redirect endpoint URI
* CORS origin

The following local environment variables may be set in `.env.local`:

* `VITE_WORKOS_CLIENT_ID` (Vite only)
* `WORKOS_CLIENT_ID` (Next.js only)
* `*_WORKOS_REDIRECT_URI` (e.g. `VITE_WORKOS_REDIRECT_URI`)
* `WORKOS_API_KEY` (Next.js only)
* `WORKOS_COOKIE_PASSWORD` (Next.js only)

### Limitations[​](https://docs.convex.dev/auth/authkit/auto-provision.html#limitations "Direct link to Limitations")

WorkOS environments can currently only be created for cloud development
deployments. Preview and production deployments must be manually configured.

To manually configure the production deployment, visit the WorkOS page for the
production environment for this project and
[follow these steps](https://docs.convex.dev/auth/authkit/index.html#configuring-an-existing-workos-account).
Only one production deployment exists by default per WorkOS team so additional
project may need to use separate WorkOS teams.

[Previous

WorkOS AuthKit](https://docs.convex.dev/auth/authkit/index.html)[Next

Auth0](https://docs.convex.dev/auth/auth0.html)

* [Creating WorkOS environments on-demand](https://docs.convex.dev/auth/authkit/auto-provision.html#creating-workos-environments-on-demand)
  + [Limitations](https://docs.convex.dev/auth/authkit/auto-provision.html#limitations)
