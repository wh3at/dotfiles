---
title: "Remove an app extension"
source_url: "https://shopify.dev/docs/apps/build/app-extensions/remove-app-extension"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [Remove an app extension](https://shopify.dev/docs/apps/build/app-extensions/remove-app-extension#remove-an-app-extension)
* [Restore a removed app extension](https://shopify.dev/docs/apps/build/app-extensions/remove-app-extension#restore-a-removed-app-extension)

If you no longer want users to use an app extension, or you want to temporarily disable an app extension, then you can remove it.

---

## [Anchor to Remove an app extension](https://shopify.dev/docs/apps/build/app-extensions/remove-app-extension#remove-an-app-extension)Remove an app extension

The contents of each app version reflect the extensions available in your local development environment.

To remove an extension from your app, you need to remove the extension from your local environment.

1. Remove the relevant files from your app's `/extensions` directory.

   If you're using custom extension directories, then remove the files from the path specified in your [`shopify.app.toml`](https://shopify.dev/docs/apps/build/cli-for-apps/app-structure#root-configuration-files) `extension_directories` property, or remove the path from your `extension_directories` property.
2. Release a new app version by running the following command.

   Optionally, you can provide a name or message for the version using the `--version` and `--message` flags.

   $

   $

   shopify app deploy

   You're prompted to confirm that you want to release a new app version. Shopify CLI lists the extensions that are being removed in the new app version.
3. Select **Yes, release this new version** to confirm.

---

## [Anchor to Restore a removed app extension](https://shopify.dev/docs/apps/build/app-extensions/remove-app-extension#restore-a-removed-app-extension)Restore a removed app extension

You can [roll back to a previous app version](https://shopify.dev/docs/apps/launch/deployment/deploy-app-versions#release-an-existing-app-version) to restore a removed app extension.

If you're rolling back to a previous app version to restore an extension, and you want to include the extension in subsequent app releases, then you need to make the extension code available in your local environment before you deploy again using Shopify CLI. For example, you might revert to a previous iteration of your project using your version control tool.

---

Was this page helpful?

YesNo

* [Remove an app extension](https://shopify.dev/docs/apps/build/app-extensions/remove-app-extension#remove-an-app-extension)
* [Restore a removed app extension](https://shopify.dev/docs/apps/build/app-extensions/remove-app-extension#restore-a-removed-app-extension)
