---
title: "Migrate legacy Flow extensions"
source_url: "https://shopify.dev/docs/apps/build/flow/migrate-legacy-extensions"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [Step 1: Import your Flow task extension locally](https://shopify.dev/docs/apps/build/flow/migrate-legacy-extensions#step-1-import-your-flow-task-extension-locally)
* [Step 2: Migrate your extension](https://shopify.dev/docs/apps/build/flow/migrate-legacy-extensions#step-2-migrate-your-extension)

If you have existing Flow extensions that were created through the Partner Dashboard, then you can import these extensions into your codebase. After you deploy the extensions that you’ve imported into Shopify CLI, Shopify CLI manages those extensions going forward.

Note

Extensions that are migrated to Shopify CLI use the `handle` properties. The `handle` property is a unique string that identifies your extension and that's used when interacting with the Shopify Flow API. For more information, refer to the [triggers](https://shopify.dev/docs/apps/build/flow/triggers/create#step-4-test-your-trigger) and [actions](https://shopify.dev/docs/apps/build/flow/actions/endpoints#request) runtime payloads.

A `handle` property is created in the extension's TOML configuration file after running the import command. Note that you can't change the `handle` property of the extensions that are present in your app's codebase after you've run the `dev` or `deploy` commands.

### [Anchor to Requirements](https://shopify.dev/docs/apps/build/flow/migrate-legacy-extensions#requirements)Requirements

* Be a [user with app development permissions](https://shopify.dev/docs/apps/build/dev-dashboard/user-permissions).
* [Scaffold an app that uses the latest Shopify CLI](https://shopify.dev/docs/apps/build/scaffold-app), or update to [the latest version of Shopify CLI](https://shopify.dev/docs/api/shopify-cli#upgrade).
* [Migrate a Dashboard-managed app](https://shopify.dev/docs/apps/build/cli-for-apps/migrate-from-dashboard).

---

## [Anchor to Step 1: Import your Flow task extension locally](https://shopify.dev/docs/apps/build/flow/migrate-legacy-extensions#step-1-import-your-flow-task-extension-locally)Step 1: Import your Flow task extension locally

Note

The command in this procedure only generates the local file representation of your Partner Dashboard extensions. Running the `deploy` command migrates your extensions to CLI managed-extensions. You can only import extensions that have versions. The published version is imported, if one exists. Otherwise, the latest version is imported.

1. Navigate to your app directory.
2. To start importing your Flow extension, run the following command:

   $

   $

   $

   #!/bin/bash

   shopify app import-extensions
3. Select the `Flow Extensions` option.
4. Select an extension from the list of extensions that are available to import.

After you’ve selected the extension to import, Shopify CLI automatically generates the file representation in your application’s `/extensions` directory and displays a success message.

You can then go into your application’s `/extensions` directory and start editing your extension. The file structure of your extension should look like the following:

9

1

2

/my-flow-extension

shopify.extension.toml

To learn more about the extensions file structure, refer to [App structure](https://shopify.dev/docs/apps/build/cli-for-apps/app-structure) and the documentation for your extension type.

### [Anchor to Available Flags](https://shopify.dev/docs/apps/build/flow/migrate-legacy-extensions#available-flags)Available Flags

#### [Anchor to [object Object]](/docs/apps/build/flow/migrate-legacy-extensions#client_id)`client_id`

An application’s `client_id`. The ID enables you to target a specific application when running the import command.

$

$

$

#!/bin/bash

shopify app import-extensions --client\_id abc123

---

## [Anchor to Step 2: Migrate your extension](https://shopify.dev/docs/apps/build/flow/migrate-legacy-extensions#step-2-migrate-your-extension)Step 2: Migrate your extension

After you've imported the extension, you can migrate your extension by using Shopify CLI's `deploy` command.

Note

Deploying extensions using the `app deploy` command also publishes the extensions. We recommend testing changes by using [`app dev`](https://shopify.dev/docs/api/shopify-cli/app/app-dev) or deploying to a test app before deploying them to a production app.

Use Shopify CLI to deploy your extensions:

1. Navigate to your app directory.
2. Run the following command to deploy your extension(s):

   $

   $

   shopify app deploy
3. Follow the prompts.

When you receive confirmation that the deploy was successful, your extensions have been released.

---

Was this page helpful?

YesNo

* [Step 1: Import your Flow task extension locally](https://shopify.dev/docs/apps/build/flow/migrate-legacy-extensions#step-1-import-your-flow-task-extension-locally)
* [Step 2: Migrate your extension](https://shopify.dev/docs/apps/build/flow/migrate-legacy-extensions#step-2-migrate-your-extension)
