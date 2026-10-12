---
title: "Create a Flow template"
source_url: "https://shopify.dev/docs/apps/build/flow/templates/create-a-template"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [Requirements](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#requirements)
* [Step 1: Create a workflow](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-1-create-a-workflow)
* [Step 2: Create a Flow template extension](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-2-create-a-flow-template-extension)
* [Step 3: Configure extension](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-3-configure-extension)
* [Step 4: Preview extension](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-4-preview-extension)
* [Step 5: Deploy extension](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-5-deploy-extension)

A template in Shopify Flow is an example workflow that can be copied into a merchant's shop. Templates help merchants automate a specific use case with minimal or no additional configuration. Flow's template library offers hundreds of templates with features to filter, browse, and search. You can  create a template  for Shopify Flow that showcases your custom triggers and actions and help merchants do more.

To create a workflow template that merchants can add to their workflow list, you need to add a Flow template extension to your app.

---

## [Anchor to Requirements](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#requirements)Requirements

* A [dev store](https://shopify.dev/docs/apps/build/dev-dashboard/development-stores) that has [Shopify Flow](https://apps.shopify.com/flow) and your app installed.
* Your existing custom triggers and actions are connected to your instance of Shopify Flow.
* [Shopify CLI](https://shopify.dev/docs/apps/build/cli-for-apps) installed with a version of `3.49` or higher.

---

## [Anchor to Step 1: Create a workflow](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-1-create-a-workflow)Step 1: Create a workflow

A workflow is the foundation of a Flow template.

1. In your dev store navigate to **Apps** > **Flow**.
2. Click **Create workflow**.
3. In the workflow editor, build a workflow that solves a merchant use case and showcases your custom trigger and or actions.
4. Optional: Tailor your template to a wider audience by [localizing your custom step descriptions](https://shopify.dev/docs/apps/build/flow/templates/reference#step-descriptions).
5. After you're satisfied with your workflow, [export the workflow](https://help.shopify.com/en/manual/shopify-flow/manage#export-a-workflow) and save the `.flow` file locally.

Note

* Test your workflow thoroughly, ensuring the trigger, condition(s), and action(s) used provide the intended result.
* Always test the experience for your template by importing it into another store. This will help you identify any shop-specific data that may not work for all merchants.
* In some cases, templates may not make sense without shop-specific data. You may leave these fields in place, and Flow will highlight them as requiring a change after the template is installed.
* Avoid using placeholders for concepts like tag names. Instead, either use a recommended tag name, or leave the field blank.
* Don't edit `.flow` files directly. Only make changes within the Flow app and export the updated workflow.

---

## [Anchor to Step 2: Create a Flow template extension](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-2-create-a-flow-template-extension)Step 2: Create a Flow template extension

Use the Shopify CLI to generate a new extension:

1. Navigate to your app directory.
2. Run the following command:

$

$

$

#!/bin/bash

shopify app generate extension

3. Select the `Flow Template` as the type of extension.
4. Provide a meaningful name for your extension.



Follow these guidelines when choosing a name:

* Don't use punctuation.
* Separate words using spaces.

After you've followed the prompts, Shopify CLI generates the extension's file representation in your app's `/extensions` directory and returns a success message. You can then go into your app's `/extensions` directory and start editing your new extension.

Note

Each Flow template extension can contain only a single template. To deploy multiple templates, you will need to create an extension for each template.

The file structure of your extension should look like the following:

9

1

2

3

4

5

6

/your-extension-name

/locales

en.default.json

fr.json

shopify.extension.toml

template.flow

To learn more about the extensions file structure, refer to our [app structure](https://shopify.dev/docs/apps/build/cli-for-apps/app-structure) documentation and the [documentation](https://shopify.dev/docs/apps/build/flow/templates/reference) for the Flow template extension type.

---

## [Anchor to Step 3: Configure extension](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-3-configure-extension)Step 3: Configure extension

Configure your template extension to include information describing it's function for merchants, and settings that control visibility.

1. Update the [shopify.extension.toml configuration file](https://shopify.dev/docs/apps/build/flow/templates/reference#toml).
2. Update and add any additional locales. [Localization reference](https://shopify.dev/docs/apps/build/flow/templates/reference#localization).
3. Replace `template.flow` with the workflow [that you exported](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-1-create-a-workflow).
4. Be sure to update the filename to match your chosen file path in the `shopify.extension.toml` file. `template.flow` is the default.

---

## [Anchor to Step 4: Preview extension](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-4-preview-extension)Step 4: Preview extension

Preview your template extension to see how it will be displayed to merchants before deploying and requesting review.

1. Run the following command in Shopify CLI:

$

$

$

#!/bin/bash

shopify app dev

2. In your dev store's Shopify admin, navigate to [`/flow/editor/templates/dev`](https://admin.shopify.com/apps/flow/editor/templates/dev). From here you can preview your workflow, template card, and custom step descriptions.
3. Refer to our [approval criteria](https://shopify.dev/docs/apps/build/flow/templates/reference#approval-process) to ensure that your extension meets our requirements.

---

## [Anchor to Step 5: Deploy extension](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-5-deploy-extension)Step 5: Deploy extension

Use Shopify CLI to deploy your extension.

1. Navigate to your app directory.
2. Run the following command to start deploying your extension(s):

$

$

$

#!/bin/bash

shopify app deploy

3. Follow the command prompts

When you receive confirmation that the deploy was successful, the template extension enters the review queue. After the [approval process](https://shopify.dev/docs/apps/build/flow/templates/reference#approval-process) is complete and the template extension has been approved, your templates will display in Flow's template library.

---

Was this page helpful?

YesNo

* [Requirements](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#requirements)
* [Step 1: Create a workflow](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-1-create-a-workflow)
* [Step 2: Create a Flow template extension](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-2-create-a-flow-template-extension)
* [Step 3: Configure extension](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-3-configure-extension)
* [Step 4: Preview extension](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-4-preview-extension)
* [Step 5: Deploy extension](https://shopify.dev/docs/apps/build/flow/templates/create-a-template#step-5-deploy-extension)
