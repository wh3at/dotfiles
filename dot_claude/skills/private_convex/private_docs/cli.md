---
title: "CLI | Convex Developer Hub"
source_url: "https://docs.convex.dev/using/cli"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



Copy as Markdown

Copied!

On this page

The Convex command-line interface (CLI) is your interface for managing Convex
projects and Convex functions.

To install the CLI, run:

```
npm install convex
```

You can view the full list of commands with:

```
npx convex
```

## Configure[​](https://docs.convex.dev/using/cli.html#configure "Direct link to Configure")

### Create a new project[​](https://docs.convex.dev/using/cli.html#create-a-new-project "Direct link to Create a new project")

The first time you run

```
npx convex dev
```

it will ask you to log in your device and create a new Convex project. It will
then create:

1. The `convex/` directory: This is the home for your query and mutation
   functions.
2. `.env.local` with `CONVEX_DEPLOYMENT` variable: This is the main
   configuration for your Convex project. It is the name of your development
   deployment.

### Recreate project configuration[​](https://docs.convex.dev/using/cli.html#recreate-project-configuration "Direct link to Recreate project configuration")

Run

```
npx convex dev
```

in a project directory without a set `CONVEX_DEPLOYMENT` to configure a new or
existing project.

### Log out[​](https://docs.convex.dev/using/cli.html#log-out "Direct link to Log out")

```
npx convex logout
```

Remove the existing Convex credentials from your device, so subsequent commands
like `npx convex dev` can use a different Convex account.

## Develop[​](https://docs.convex.dev/using/cli.html#develop "Direct link to Develop")

### Run the Convex dev server[​](https://docs.convex.dev/using/cli.html#run-the-convex-dev-server "Direct link to Run the Convex dev server")

```
npx convex dev
```

Watches the local filesystem. When you change a [function](https://docs.convex.dev/functions.html) or
the [schema](https://docs.convex.dev/database/schemas.html), the new versions are pushed to your dev
deployment and the [generated types](https://docs.convex.dev/generated-api/index.html) in `convex/_generated` are
updated. By default, logs from your dev deployment are displayed in the
terminal.

It's also possible to
[run a Convex deployment locally](https://docs.convex.dev/cli/local-deployments.html) for
development.

### Open the dashboard[​](https://docs.convex.dev/using/cli.html#open-the-dashboard "Direct link to Open the dashboard")

```
npx convex dashboard
```

Open the [Convex dashboard](https://docs.convex.dev/dashboard.html).

### Open the docs[​](https://docs.convex.dev/using/cli.html#open-the-docs "Direct link to Open the docs")

```
npx convex docs
```

Get back to these docs!

### Run Convex functions[​](https://docs.convex.dev/using/cli.html#run-convex-functions "Direct link to Run Convex functions")

```
npx convex run <functionName> [args]
```

Run a public or internal Convex query, mutation, or action on your development
deployment.

Arguments are specified as a JSON object.

```
npx convex run messages:send '{"body": "hello", "author": "me"}'
```

Add `--watch` to live update the results of a query. Add `--push` to push local
code to the deployment before running the function.

Use `--prod` to run functions in the production deployment for a project.

### Tail deployment logs[​](https://docs.convex.dev/using/cli.html#tail-deployment-logs "Direct link to Tail deployment logs")

You can choose how to pipe logs from your dev deployment to your console:

```
# Show all logs continuously
npx convex dev --tail-logs always

# Pause logs during deploys to see sync issues (default)
npx convex dev

# Don't display logs while developing
npx convex dev --tail-logs disable

# Tail logs without deploying
npx convex logs
```

Use `--prod` with `npx convex logs` to tail the prod deployment logs instead.

### Import data from a file[​](https://docs.convex.dev/using/cli.html#import-data-from-a-file "Direct link to Import data from a file")

```
npx convex import --table <tableName> <path>
npx convex import <path>.zip
```

See description and use-cases:
[data import](https://docs.convex.dev/database/import-export/import.html).

### Export data to a file[​](https://docs.convex.dev/using/cli.html#export-data-to-a-file "Direct link to Export data to a file")

```
npx convex export --path <directoryPath>
npx convex export --path <filePath>.zip
npx convex export --include-file-storage --path <path>
```

See description and use-cases:
[data export](https://docs.convex.dev/database/import-export/export.html).

### Display data from tables[​](https://docs.convex.dev/using/cli.html#display-data-from-tables "Direct link to Display data from tables")

```
npx convex data  # lists tables
npx convex data <table>
```

Display a simple view of the
[dashboard data page](https://docs.convex.dev/dashboard/deployments/data.html) in the command line.

The command supports `--limit` and `--order` flags to change data displayed. For
more complex filters, use the dashboard data page or write a
[query](https://docs.convex.dev/database/reading-data/index.html).

The `npx convex data <table>` command works with
[system tables](https://docs.convex.dev/database/advanced/system-tables.html), such as `_storage`, in
addition to your own tables.

### Read and write environment variables[​](https://docs.convex.dev/using/cli.html#read-and-write-environment-variables "Direct link to Read and write environment variables")

```
npx convex env list
npx convex env get <name>
npx convex env set <name> <value>
npx convex env remove <name>
```

See and update the deployment environment variables which you can otherwise
manage on the dashboard
[environment variables settings page](https://docs.convex.dev/dashboard/deployments/deployment-settings.html#environment-variables).

## Deploy[​](https://docs.convex.dev/using/cli.html#deploy "Direct link to Deploy")

### Deploy Convex functions to production[​](https://docs.convex.dev/using/cli.html#deploy-convex-functions-to-production "Direct link to Deploy Convex functions to production")

```
npx convex deploy
```

The target deployment to push to is determined like this:

1. If the `CONVEX_DEPLOY_KEY` environment variable is set (typical in CI), then
   it is the deployment associated with that key.
2. If the `CONVEX_DEPLOYMENT` environment variable is set (typical during local
   development), then the target deployment is the production deployment of the
   project that the deployment specified by `CONVEX_DEPLOYMENT` belongs to. This
   allows you to deploy to your prod deployment while developing against your
   dev deployment.

This command will:

1. Run a command if specified with `--cmd`. The command will have CONVEX\_URL (or
   similar) environment variable available:

   ```
   npx convex deploy --cmd "npm run build"
   ```

   You can customize the URL environment variable name with
   `--cmd-url-env-var-name`:

   ```
   npx convex deploy --cmd 'npm run build' --cmd-url-env-var-name CUSTOM_CONVEX_URL
   ```
2. Typecheck your Convex functions.
3. Regenerate the [generated code](https://docs.convex.dev/generated-api/index.html) in the `convex/_generated`
   directory.
4. Bundle your Convex functions and their dependencies.
5. Push your functions, [indexes](https://docs.convex.dev/database/reading-data/indexes/index.html),
   and [schema](https://docs.convex.dev/database/schemas.html) to production.

Once this command succeeds the new functions will be available immediately.

### Deploy Convex functions to a [preview deployment](https://docs.convex.dev/production/hosting/preview-deployments.html)[​](https://docs.convex.dev/using/cli.html#deploy-convex-functions-to-a-preview-deployment "Direct link to deploy-convex-functions-to-a-preview-deployment")

```
npx convex deploy
```

When run with the `CONVEX_DEPLOY_KEY` environment variable containing a
[Preview Deploy Key](https://docs.convex.dev/cli/deploy-key-types.html#deploying-to-preview-deployments),
this command will:

1. Create a new Convex deployment. `npx convex deploy` will infer the Git branch
   name for Vercel, Netlify, GitHub, and GitLab environments, or the
   `--preview-create` option can be used to customize the name associated with
   the newly created deployment.

   ```
   npx convex deploy --preview-create my-branch-name
   ```
2. Run a command if specified with `--cmd`. The command will have CONVEX\_URL (or
   similar) environment variable available:

   ```
   npx convex deploy --cmd "npm run build"
   ```

   You can customize the URL environment variable name with
   `--cmd-url-env-var-name`:

   ```
   npx convex deploy --cmd 'npm run build' --cmd-url-env-var-name CUSTOM_CONVEX_URL
   ```
3. Typecheck your Convex functions.
4. Regenerate the [generated code](https://docs.convex.dev/generated-api/index.html) in the `convex/_generated`
   directory.
5. Bundle your Convex functions and their dependencies.
6. Push your functions, [indexes](https://docs.convex.dev/database/reading-data/indexes/index.html),
   and [schema](https://docs.convex.dev/database/schemas.html) to the deployment.
7. Run a function specified by `--preview-run` (similar to the `--run` option
   for `npx convex dev`).

   ```
   npx convex deploy --preview-run myFunction
   ```

See the [Vercel](https://docs.convex.dev/production/hosting/vercel.html#preview-deployments) or
[Netlify](https://docs.convex.dev/production/hosting/netlify.html#deploy-previews) hosting guide for
setting up frontend and backend previews together.

### Update generated code[​](https://docs.convex.dev/using/cli.html#update-generated-code "Direct link to Update generated code")

```
npx convex codegen
```

The [generated code](https://docs.convex.dev/generated-api/index.html) in the `convex/_generated` directory
includes types required for a TypeScript typecheck. This code is generated
whenever necessary while running `npx convex dev` and this code should be
committed to the repo (your code won't typecheck without it!).

In the rare cases it's useful to regenerate code (e.g. in CI to ensure that the
correct code was checked it) you can use this command.

Generating code can require communicating with a convex deployment in order to
evaluate configuration files in the Convex JavaScript runtime. This doesn't
modify the code running on the deployment.

[Previous

Settings](https://docs.convex.dev/dashboard/deployments/deployment-settings.html)[Next

Local Deployments](https://docs.convex.dev/cli/local-deployments.html)

* [Configure](https://docs.convex.dev/using/cli.html#configure)
  + [Create a new project](https://docs.convex.dev/using/cli.html#create-a-new-project)
  + [Recreate project configuration](https://docs.convex.dev/using/cli.html#recreate-project-configuration)
  + [Log out](https://docs.convex.dev/using/cli.html#log-out)
* [Develop](https://docs.convex.dev/using/cli.html#develop)
  + [Run the Convex dev server](https://docs.convex.dev/using/cli.html#run-the-convex-dev-server)
  + [Open the dashboard](https://docs.convex.dev/using/cli.html#open-the-dashboard)
  + [Open the docs](https://docs.convex.dev/using/cli.html#open-the-docs)
  + [Run Convex functions](https://docs.convex.dev/using/cli.html#run-convex-functions)
  + [Tail deployment logs](https://docs.convex.dev/using/cli.html#tail-deployment-logs)
  + [Import data from a file](https://docs.convex.dev/using/cli.html#import-data-from-a-file)
  + [Export data to a file](https://docs.convex.dev/using/cli.html#export-data-to-a-file)
  + [Display data from tables](https://docs.convex.dev/using/cli.html#display-data-from-tables)
  + [Read and write environment variables](https://docs.convex.dev/using/cli.html#read-and-write-environment-variables)
* [Deploy](https://docs.convex.dev/using/cli.html#deploy)
  + [Deploy Convex functions to production](https://docs.convex.dev/using/cli.html#deploy-convex-functions-to-production)
  + [Deploy Convex functions to a preview deployment](https://docs.convex.dev/using/cli.html#deploy-convex-functions-to-a-preview-deployment)
  + [Update generated code](https://docs.convex.dev/using/cli.html#update-generated-code)
