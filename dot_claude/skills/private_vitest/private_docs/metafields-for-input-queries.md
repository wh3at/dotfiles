---
title: "Metafields for input queries"
source_url: "https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [How it works](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#how-it-works)
* [Creating your merchant interface](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#creating-your-merchant-interface)
* [Reading metafields with input queries](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#reading-metafields-with-input-queries)
* [Best practices](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#best-practices)
* [Next steps](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#next-steps)

To make your code reusable, you can replace hard-coded variables in your function with metafield values. Using [metafields](https://shopify.dev/docs/apps/build/custom-data/metafields) enables merchants and staff to customize your function by entering values and options in interfaces provided by your app.

This guide introduces how input queries and metafields work in Shopify Functions. For an overview of how data is input to and output from Shopify Functions, refer to [Function input and output](https://shopify.dev/docs/api/functions/latest#function-anatomy).

---

## [Anchor to How it works](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#how-it-works)How it works

Shopify Functions belong to and can affect the behavior of objects in the Shopify data model. The object associated with a function is known as the **function owner**. For example, the owner of a Discount API function is a discount.

You use an [Admin UI extension](https://shopify.dev/docs/api/admin-extensions) or [embedded app page](https://shopify.dev/docs/apps/build/app-surfaces#embedded-app-pages) to create merchant interfaces for managing function owners and their metafields. Refer to the [available APIs documentation](https://shopify.dev/docs/api/functions#apis-in-developer-preview) for specifics on what's supported by each Function API. Then, you use input queries to provide the metafields as input to your function.

![A diagram showing the relationship between a function, an app, and metafields, as used when configuring functions](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/api/functions/configuration-BHn_gxrd.png)

Tip

You can also use metafield values from anywhere within Shopify's data model to build your function's logic. For example, you can use metafields on products in the cart or the current customer.

---

## [Anchor to Creating your merchant interface](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#creating-your-merchant-interface)Creating your merchant interface

Some Function APIs enable you to create a merchant interface for configuring your function using either [embedded app pages](https://shopify.dev/docs/apps/build/app-surfaces#embedded-app-pages) or [Admin UI extensions](https://shopify.dev/docs/api/admin-extensions). Refer to the [available APIs documentation](https://shopify.dev/docs/api/functions#apis-in-developer-preview) for specifics on what's supported by each Function API.

You need to configure specific properties in your [function extension configuration](https://shopify.dev/docs/api/functions/configuration) based on the method that you use for creating a merchant interface.

### [Anchor to Using Admin UI extensions](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#using-admin-ui-extensions)Using Admin UI extensions

Some Function APIs enable you to create a merchant interface to create and edit the function owner using [Admin UI extensions](https://shopify.dev/docs/api/admin-extensions).

To configure a UI extension to be used for configuring your function, you must specify the `extension.ui.handle` property in your `shopify.extension.toml` file. Ensure that the value for `extension.ui.handle` matches the handle property of the corresponding UI extension in your app.

The following example shows the properties in the `shopify.extension.toml` file:

9

1

2

[extension.ui]

handle = "ui-extension-handle"

### [Anchor to Using embedded app pages](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#using-embedded-app-pages)Using embedded app pages

Some [Function APIs](https://shopify.dev/docs/api/functions) enable you to create a merchant interface using [embedded app pages](https://shopify.dev/docs/apps/build/app-surfaces#embedded-app-pages). Use [App Bridge](https://shopify.dev/docs/api/app-bridge) and [Polaris](https://shopify.dev/docs/api/polaris) to create a seamless merchant experience within the Shopify admin.

You have the option to configure the routes in your application that merchants will use to create and edit the function owner, such as a discount. The default path for both properties is the root directory of your app (`/`).

| Property | Description | Example |
| --- | --- | --- |
| `ui.paths.create` | The route to create a new function owner. | `/my-discount-type` |
| `ui.paths.details` | The route to edit the function owner. | `/my-discount-type/:id` |

The following example shows the properties in the `shopify.extension.toml` file:

9

1

2

3

[extensions.ui.paths]

create = "/my-discount-type/function-handle"

details = "/my-discount-type/function-handle/:id"

#### [Anchor to Dynamic ID values](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#dynamic-id-values)Dynamic ID values

If you specify the `:id` in the `ui.paths` properties in `shopify.extension.toml`, then the URL is updated with the following values:

| URL Path | Update | Availability |
| --- | --- | --- |
| `:id` | The `:id` is dynamically replaced by the ID of the function owner. | `ui.paths.details` |

The ID values are needed as input to the create, update, and delete mutations for your customizations. By using dynamic IDs, you can avoid managing hardcoded values in your app.

### [Anchor to Creating Metafields with GraphQL](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#creating-metafields-with-graphql)Creating Metafields with GraphQL

You can use the [GraphQL Admin API](https://shopify.dev/docs/api/admin-graphql) to create and update your function owner and its metafields. [Metafields](https://shopify.dev/docs/apps/build/custom-data/metafields) are supported on all function owner types, and can be used to store custom values for your function logic.

The following is an example of a mutation that would set metafields on a discount function owner, when implementing a Discount API function.

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

mutation CreateDiscount {

discountAutomaticAppCreate(automaticAppDiscount: {

functionId: "f0c17828-da1a-4748-810d-3c3cab2bc977",

title: "My Discount",

startsAt: "2022-06-01T00:00:00Z",

metafields: [

{

namespace: "$app:my-function",

type: "json",

key: "function-configuration",

value: "{\"value\":\"42\"}"

}

]

}) {

automaticAppDiscount {

discountId

}

userErrors {

field

message

}

}

}

### [Anchor to Configuring creation workflows for function owners](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#configuring-creation-workflows-for-function-owners)Configuring creation workflows for function owners

There are some cases where you might not want the merchant to create a function owner themselves. For example, the function could be an implementation detail of a bigger feature and it could make more sense for the bigger feature to manage the function owner lifecycle.

You can configure the function to opt-out of the default function owner creation workflow. This means that the app will solely be responsible for creating the function owner. While this means the merchant can't create a function owner in the Shopify admin, they can still edit, activate, or deactivate one created by the app.

You can configure this with the following property in your [function extension configuration](https://shopify.dev/docs/api/functions/configuration).

| Property | Description | Type |
| --- | --- | --- |
| `ui.enable_create` | Whether the merchant can create a function owner in the Shopify admin. The default value is `true`. | Boolean |

---

## [Anchor to Reading metafields with input queries](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#reading-metafields-with-input-queries)Reading metafields with input queries

All [Function APIs](https://shopify.dev/docs/api/functions) provide access to the function owner, and its metafields, as part of their GraphQL schema. This means that you can access the metafield values set by merchants using input queries, and use those values in your function's logic.

The following is an example of an input query that would retrieve a metafield on a discount function owner, when implementing a Discount API function.

9

1

2

3

4

5

6

7

{

discountNode {

metafield(namespace: "$app:my-function", key: "function-configuration") {

value

}

}

}

---

## [Anchor to Best practices](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#best-practices)Best practices

This section provides some best practices for using metafields for function input.

### [Anchor to Use a reserved prefix in your metafield namespace](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#use-a-reserved-prefix-in-your-metafield-namespace)Use a reserved prefix in your metafield namespace

You should use a [reserved prefix](https://shopify.dev/docs/apps/build/custom-data/ownership#reserved-prefixes) in your metafield namespace, so that other apps can't use your metafields.

### [Anchor to Use JSON metafields for complex configurations](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#use-json-metafields-for-complex-configurations)Use JSON metafields for complex configurations

Metafields support many [types of data](https://shopify.dev/docs/apps/build/custom-data/metafields/list-of-data-types), but functions will often require nested and/or repeating data structures. Using a single JSON metafield can simplify the management and querying of your configuration.

### [Anchor to Manage configuration changes with new metafields](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#manage-configuration-changes-with-new-metafields)Manage configuration changes with new metafields

If you need to make breaking changes to your function configuration data, then you can implement the [Parallel Change (Expand and Contract)](https://martinfowler.com/bliki/ParallelChange.html) pattern using additional metafields:

1. Update your function's logic to simultaneously read configuration from your existing and new metafields, preferring the newer data, if present.
2. Change your function UI to simultaneously update both your existing and new metafields.
3. Use the GraphQL Admin API to [migrate existing data](https://shopify.dev/docs/apps/build/custom-data/metafields/manage-metafields) from your old metafields to your new metafields.
4. After you've finished the migration, remove any UI and function logic for your old metafields.
5. Use the GraphQL Admin API to remove your old metafields.

Tip

To edit metafields outside of a merchant's web session, such as in an offline maintenance job, you can request an [offline access token](https://shopify.dev/docs/apps/build/authentication-authorization/access-tokens/offline-access-tokens) during app installation.

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#next-steps)Next steps

* Learn how to [use variables in input queries](https://shopify.dev/docs/apps/build/functions/input-queries/use-variables-input-queries) with Shopify Functions.

---

Was this page helpful?

YesNo

* [How it works](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#how-it-works)
* [Creating your merchant interface](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#creating-your-merchant-interface)
* [Reading metafields with input queries](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#reading-metafields-with-input-queries)
* [Best practices](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#best-practices)
* [Next steps](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries#next-steps)
