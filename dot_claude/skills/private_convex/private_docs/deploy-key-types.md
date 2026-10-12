---
title: "Deploy keys | Convex Developer Hub"
source_url: "https://docs.convex.dev/cli/deploy-key-types"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [CLI](https://docs.convex.dev/using/cli.html)
* Deploy keys

Copy as Markdown

Copied!

On this page

When you can't log in or use the CLI interactively to specify a project or
deployment, for example in a production build environment, the environment
variable `CONVEX_DEPLOY_KEY` can be set to a deploy key to make convex CLI
commands run non-interactively.

Deploy keys identify a deployment, project, or team; confer permission to take
certain actions with those resources; and can change the behavior of the convex
CLI.

### Developing locally does not require a deploy key[​](https://docs.convex.dev/cli/deploy-key-types.html#developing-locally-does-not-require-a-deploy-key "Direct link to Developing locally does not require a deploy key")

Running `npx convex dev` on a new machine offers the choice to log in or run
Convex locally without an account.

Logging in stores a *user token* at `~/.convex/config.json` which is used
automatically for all CLI use going forward on that machine. This token grants
permission to push code to and read/write data from any deployment this user has
access to.

Using Convex locally without logging in
([anonymous development](https://docs.convex.dev/cli/local-deployments.html#anonymous-development))
creates a deployment locally and records this preference for this project in the
`.env.local` file in the project directory. The *admin key* for this anonymous
backend is stored in `~/.convex/anonymous-convex-backend-state/` along with its
serialized data.

In either of these cases, there's no reason to set `CONVEX_DEPLOY_KEY`.

### How to set a deploy key[​](https://docs.convex.dev/cli/deploy-key-types.html#how-to-set-a-deploy-key "Direct link to How to set a deploy key")

Generally deploys keys are set in a dashboard of the service that needs the key
but in most shells you can set it right before the command, like

```
CONVEX_DEPLOY_KEY='key goes here' npx convex dev
```

or export it before you run the command

```
export CONVEX_DEPLOY_KEY='key goes here'
npx convex dev
```

or add it to your `.env.local` file where it will be found by `npx convex` when
run in that directory.

# Common uses of deploy keys

### Deploying from build pipelines[​](https://docs.convex.dev/cli/deploy-key-types.html#deploying-from-build-pipelines "Direct link to Deploying from build pipelines")

A *production deploy key* specifies the production deployment of a project and
grants permissions to deploy code to it.

> `prod:qualified-jaguar-123|eyJ2...0=`

You can deploying code from a build pipeline where you can't log in (e.g.
Vercel, Netlify, Cloudflare build pipelines)

Read more about
[deploying to production](https://docs.convex.dev/production/hosting/index.html).

### Deploying to preview deployments[​](https://docs.convex.dev/cli/deploy-key-types.html#deploying-to-preview-deployments "Direct link to Deploying to preview deployments")

A *preview deploy key* looks like this:

> `preview:team-slug:project-slug|eyJ2...0=`

Use a preview deploy key to change the behavior of a normal `npx convex deploy`
command to deploy to a preview branch.

Read more about [preview deployments](https://docs.convex.dev/production/hosting/preview-deployments.html).

### Admin keys[​](https://docs.convex.dev/cli/deploy-key-types.html#admin-keys "Direct link to Admin keys")

An admin key provides complete control over a deployment.

An admin key might look like

> `bold-hyena-681|01c2...c09c`

Unlike other types of deploy key, an admin key does not require a network
connection to <https://convex.dev> to be used since it's a irrevocable secret
baked into the deployment when created.

These keys are used to control
[anonymous](https://docs.convex.dev/cli/local-deployments.html#anonymous-development)
Convex deployments locally without logging in, but rarely need to be set
explicitly.

Setting `CONVEX_DEPLOY_KEY` to one will cause the Convex CLI to run against that
deployment instead of offering a choice.

## Rarer types of deploy keys[​](https://docs.convex.dev/cli/deploy-key-types.html#rarer-types-of-deploy-keys "Direct link to Rarer types of deploy keys")

### Project tokens[​](https://docs.convex.dev/cli/deploy-key-types.html#project-tokens "Direct link to Project tokens")

A *project token* grants total control over a project to a convex CLI and
carries with it the permission to create and use development and production
deployments in that project.

> `project:team-slug:project-slug|eyJ2...0=`

Project tokens are obtained when a user grants an permission to use a project to
an organization via an Convex OAuth application. Actions made with the token are
on behalf of the user so if a user loses access to a project the token no longer
grant access to it.

### Development deploy keys[​](https://docs.convex.dev/cli/deploy-key-types.html#development-deploy-keys "Direct link to Development deploy keys")

A *dev deploy key* might be used to provide an agent full access to a single
deployment for development.

> `dev:joyful-jaguar-123|eyJ2...0=`

This can help limit the blast radius when developing with an agent.

To give an agent exclusive access to its own dev deployment, see
[Agent Mode](https://docs.convex.dev/cli/agent-mode.html).

[Previous

Agent Mode](https://docs.convex.dev/cli/agent-mode.html)[Next

convex](https://docs.convex.dev/api/index.html)

* [Developing locally does not require a deploy key](https://docs.convex.dev/cli/deploy-key-types.html#developing-locally-does-not-require-a-deploy-key)
* [How to set a deploy key](https://docs.convex.dev/cli/deploy-key-types.html#how-to-set-a-deploy-key)
* [Deploying from build pipelines](https://docs.convex.dev/cli/deploy-key-types.html#deploying-from-build-pipelines)
* [Deploying to preview deployments](https://docs.convex.dev/cli/deploy-key-types.html#deploying-to-preview-deployments)
* [Admin keys](https://docs.convex.dev/cli/deploy-key-types.html#admin-keys)
* [Rarer types of deploy keys](https://docs.convex.dev/cli/deploy-key-types.html#rarer-types-of-deploy-keys)
  + [Project tokens](https://docs.convex.dev/cli/deploy-key-types.html#project-tokens)
  + [Development deploy keys](https://docs.convex.dev/cli/deploy-key-types.html#development-deploy-keys)
