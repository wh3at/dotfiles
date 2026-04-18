---
title: "About Shopify CLI for apps"
source_url: "https://shopify.dev/docs/apps/build/cli-for-apps"
fetched_at: "2025-12-11T04:47:39.153021+00:00"
---



ExpandOn this page

* [Features](https://shopify.dev/docs/apps/build/cli-for-apps#features)
* [Requirements](https://shopify.dev/docs/apps/build/cli-for-apps#requirements)
* [Getting started](https://shopify.dev/docs/apps/build/cli-for-apps#getting-started)
* [App structure](https://shopify.dev/docs/apps/build/cli-for-apps#app-structure)
* [Using Shopify CLI for continuous integration](https://shopify.dev/docs/apps/build/cli-for-apps#using-shopify-cli-for-continuous-integration)
* [Migrate from a Dev Dashboard-managed app](https://shopify.dev/docs/apps/build/cli-for-apps#migrate-from-a-dev-dashboard-managed-app)
* [Usage reporting](https://shopify.dev/docs/apps/build/cli-for-apps#usage-reporting)
* [Switch to a global executable or local dependency](https://shopify.dev/docs/apps/build/cli-for-apps#switch-to-a-global-executable-or-local-dependency)
* [Where to get help](https://shopify.dev/docs/apps/build/cli-for-apps#where-to-get-help)
* [Command reference](https://shopify.dev/docs/apps/build/cli-for-apps#command-reference)

Shopify CLI is a command-line interface tool that helps you build Shopify apps. It quickly generates Shopify apps and generates app extensions. You can also use it to automate many common development tasks.

This documentation explains how to use Shopify CLI for app development. To learn how to use Shopify CLI for other tasks, refer to the following documentation:

* [Shopify CLI for themes](https://shopify.dev/docs/storefronts/themes/tools/cli/cli-2/commands)
* [Shopify CLI for Hydrogen storefronts](https://shopify.dev/docs/api/shopify-cli/hydrogen)

---

## [Anchor to Features](https://shopify.dev/docs/apps/build/cli-for-apps#features)Features

Shopify CLI accelerates your app development process with the following features:

* Creates new apps using [app templates](https://shopify.dev/docs/api#app-templates)
* Generates [app extensions](https://shopify.dev/docs/apps/build/app-extensions) in your app
* Creates app records in the [Dev Dashboard](https://dev.shopify.com/dashboard)
* Builds your app and extensions, and creates a tunnel to let you preview your work in a dev store
* Deploys your app configuration and app extensions
* Lets you search the Shopify Dev Docs

---

## [Anchor to Requirements](https://shopify.dev/docs/apps/build/cli-for-apps#requirements)Requirements

* You're using the latest version of [Shopify CLI](https://shopify.dev/docs/api/shopify-cli).
* You're using the latest version of [Chrome](https://www.google.com/chrome/) or [Firefox](https://www.mozilla.org/).

---

## [Anchor to Getting started](https://shopify.dev/docs/apps/build/cli-for-apps#getting-started)Getting started

Because Shopify CLI requires a conventional directory structure, you should run this command to initialize your app:

$

$

shopify app init

Tip

You can specify the [app template](https://shopify.dev/docs/api#app-templates) that you want to use with the `--template` flag. You can specify a Shopify app template, or pass a URL to a template hosted in GitHub.

If you have an existing app that wasn't built using Shopify CLI, you should consider [migrating your app to Shopify CLI](https://shopify.dev/docs/apps/build/cli-for-apps/migrate-from-dashboard) for a fully integrated development experience.

Refer to the following tutorials for additional details about creating an app that works with Shopify CLI, or to learn how to work on an existing app that uses Shopify CLI 3.0 or higher:

[![](https://shopify.dev/images/icons/48/globe.png)![](https://shopify.dev/images/icons/48/globe-dark.png)

Scaffold an app

Learn how to set up your app development environment and start building.

Scaffold an app

Learn how to set up your app development environment and start building.](/docs/apps/build/scaffold-app)

[Scaffold an app


Learn how to set up your app development environment and start building.](https://shopify.dev/docs/apps/build/scaffold-app)

[![](https://shopify.dev/images/icons/48/build.png)![](https://shopify.dev/images/icons/48/build-dark.png)

Build an app

After creating your app, follow this in-depth tutorial to learn how to add features to your app using Shopify templates, tools, and libraries.

Build an app

After creating your app, follow this in-depth tutorial to learn how to add features to your app using Shopify templates, tools, and libraries.](/docs/apps/build/build)

[Build an app


After creating your app, follow this in-depth tutorial to learn how to add features to your app using Shopify templates, tools, and libraries.](https://shopify.dev/docs/apps/build/build)

---

## [Anchor to App structure](https://shopify.dev/docs/apps/build/cli-for-apps#app-structure)App structure

To offer a better and more integrated development experience, apps created using Shopify CLI follow a conventional directory structure. This structure allows you to serve and deploy your web app and [app extensions](https://shopify.dev/docs/apps/build/app-extensions) at the same time, easily generate new app extensions, and manage all of your app's dependencies in one place.

[Learn more about the structure of apps built with Shopify CLI](https://shopify.dev/docs/apps/build/cli-for-apps/app-structure).

---

## [Anchor to Using Shopify CLI for continuous integration](https://shopify.dev/docs/apps/build/cli-for-apps#using-shopify-cli-for-continuous-integration)Using Shopify CLI for continuous integration

If you have app configuration and extensions that you want to deploy to Shopify regularly, then you can integrate Shopify CLI into your CI/CD pipeline to programmatically deploy your app components using the `deploy` command.

[Learn more about running Shopify CLI in a CI/CD pipeline](https://shopify.dev/docs/apps/launch/deployment/deploy-in-ci-cd-pipeline).

---

## [Anchor to Migrate from a Dev Dashboard-managed app](https://shopify.dev/docs/apps/build/cli-for-apps#migrate-from-a-dev-dashboard-managed-app)Migrate from a Dev Dashboard-managed app

If you've been using the Dev Dashboard to manage your app, then you should consider importing it and [use the Shopify CLI to manage it instead](https://shopify.dev/docs/apps/build/cli-for-apps/migrate-from-dashboard).

---

## [Anchor to Usage reporting](https://shopify.dev/docs/apps/build/cli-for-apps#usage-reporting)Usage reporting

Anonymous usage statistics are collected by default. To opt out, you can use the environment variable `SHOPIFY_CLI_NO_ANALYTICS=1`.

---

## [Anchor to Switch to a global executable or local dependency](https://shopify.dev/docs/apps/build/cli-for-apps#switch-to-a-global-executable-or-local-dependency)Switch to a global executable or local dependency

Shopify CLI can be globally installed or used as a local dependency when working with Shopify apps. This following sections explains the reasons for using each installation method and the process for switching between them.

### [Anchor to Switch to a global Shopify CLI executable](https://shopify.dev/docs/apps/build/cli-for-apps#switch-to-a-global-shopify-cli-executable)Switch to a global Shopify CLI executable

Global installation is the default recommended approach for using Shopify CLI. Global installation has the advantage of a single install and upgrade point for all your Shopify app, theme, and Hydrogen development.

If you have an existing app which has Shopify CLI as a local dependency in its `package.json`, use the following steps to move to a global install:

1. Use your package manager to delete `@shopify/cli` and (if present) `@shopify/app` from your dependencies:

$

$

npm uninstall -D @shopify/cli @shopify/app

$

$

yarn remove -D @shopify/cli @shopify/app

$

$

pnpm remove -D @shopify/cli @shopify/app

##### npm

```
npm uninstall -D @shopify/cli @shopify/app
```

##### Yarn

```
yarn remove -D @shopify/cli @shopify/app
```

##### pnpm

```
pnpm remove -D @shopify/cli @shopify/app
```

2. [Install Shopify CLI](https://shopify.dev/docs/api/shopify-cli) as a global package.
3. Invoke Shopify CLI directly when working in your app. For example:

$

$

shopify app generate extension

### [Anchor to Switch an app to a local Shopify CLI dependency](https://shopify.dev/docs/apps/build/cli-for-apps#switch-an-app-to-a-local-shopify-cli-dependency)Switch an app to a local Shopify CLI dependency

Adding Shopify CLI as a local dependency is useful if you wish to synchronize Shopify CLI versions within a team, or use different Shopify CLI versions across multiple apps in your development environment.

To switch an app to use Shopify CLI as a local dependency:

1. Install the `@shopify/cli` package with one of the following commands.

$

$

npm install -D @shopify/cli

$

$

yarn add -D @shopify/cli

$

$

pnpm add -D @shopify/cli

##### npm

```
npm install -D @shopify/cli
```

##### Yarn

```
yarn add -D @shopify/cli
```

##### pnpm

```
pnpm add -D @shopify/cli
```

Note

As of Shopify CLI version `3.59.0`, you no longer need to install the `@shopify/app` package as it is bundled with `@shopify/cli`.

2. Invoke Shopify CLI commands with your package manager. For example:

$

$

npm run shopify app generate extension

$

$

yarn shopify app generate extension

$

$

pnpm shopify app generate extension

##### npm

```
npm run shopify app generate extension
```

##### Yarn

```
yarn shopify app generate extension
```

##### pnpm

```
pnpm shopify app generate extension
```

---

## [Anchor to Where to get help](https://shopify.dev/docs/apps/build/cli-for-apps#where-to-get-help)Where to get help

* **[Open a GitHub issue](https://github.com/shopify/cli/issues)** - To report bugs or request new features, open an issue in the Shopify CLI repository.
* **[.dev Community](https://community.shopify.dev/)** - Visit our forums to connect with the community and learn more about Shopify CLI development.

---

## [Anchor to Command reference](https://shopify.dev/docs/apps/build/cli-for-apps#command-reference)Command reference

[![](https://shopify.dev/images/icons/48/clicode.png)![](https://shopify.dev/images/icons/48/clicode-dark.png)

Shopify CLI app commands

Explore the commands available to build apps with Shopify CLI.

Shopify CLI app commands

Explore the commands available to build apps with Shopify CLI.](/docs/api/shopify-cli/app)

[Shopify CLI app commands


Explore the commands available to build apps with Shopify CLI.](https://shopify.dev/docs/api/shopify-cli/app)

---

Was this page helpful?

YesNo

* [Features](https://shopify.dev/docs/apps/build/cli-for-apps#features)
* [Requirements](https://shopify.dev/docs/apps/build/cli-for-apps#requirements)
* [Getting started](https://shopify.dev/docs/apps/build/cli-for-apps#getting-started)
* [App structure](https://shopify.dev/docs/apps/build/cli-for-apps#app-structure)
* [Using Shopify CLI for continuous integration](https://shopify.dev/docs/apps/build/cli-for-apps#using-shopify-cli-for-continuous-integration)
* [Migrate from a Dev Dashboard-managed app](https://shopify.dev/docs/apps/build/cli-for-apps#migrate-from-a-dev-dashboard-managed-app)
* [Usage reporting](https://shopify.dev/docs/apps/build/cli-for-apps#usage-reporting)
* [Switch to a global executable or local dependency](https://shopify.dev/docs/apps/build/cli-for-apps#switch-to-a-global-executable-or-local-dependency)
* [Where to get help](https://shopify.dev/docs/apps/build/cli-for-apps#where-to-get-help)
* [Command reference](https://shopify.dev/docs/apps/build/cli-for-apps#command-reference)
