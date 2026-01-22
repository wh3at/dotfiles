---
title: "Generate pickup points"
source_url: "https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [What you'll learn](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#requirements)
* [Step 1: Create the pickup point delivery option generator function](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-1-create-the-pickup-point-delivery-option-generator-function)
* [Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-2-preview-the-function-on-a-dev-store)
* [Step 3: Set up shipping to pickup points](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-3-set-up-shipping-to-pickup-points)
* [Step 4: Test the pickup point delivery option generator](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-4-test-the-pickup-point-delivery-option-generator)
* [Step 5 (Optional): Debug the function](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-5-optional-debug-the-function)
* [Step 6: Retrieve the pickup point from an order](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-6-retrieve-the-pickup-point-from-an-order)
* [Step 7 (Optional): Edit the selected pickup point](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-7-optional-edit-the-selected-pickup-point)
* [Next steps](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#next-steps)

Early access

The Pickup Points Delivery Option Generator API is a feature that's available by request to merchants on the [Shopify Plus plan](https://help.shopify.com/manual/intro-to-shopify/pricing-plans/plans-features/shopify-plus-plan). Merchants must be enrolled in the Partner program in order to deploy custom solutions they have developed for themselves. To request access, contact [pickup-point-generator-early-access@shopify.com](mailto:pickup-point-generator-early-access@shopify.com). You can test the Pickup Points Delivery Option Generator API on Partner development stores without requesting access.

Customers can choose to have their order sent to a [pickup point](https://shopify.dev/docs/apps/build/checkout/delivery-shipping#pickup-points) instead of to their address.

In this guide, you'll learn how to generate custom pickup point options using [Shopify Functions](https://shopify.dev/docs/api/functions/current). You'll create a starter function with some logic to support pickup points for a specific location. You'll also learn how to retrieve the pickup point that the customer selected, using the [GraphQL Admin API](https://shopify.dev/docs/api/admin-graphql).

Tip

Explore an [end-to-end example](https://github.com/Shopify/function-examples/tree/main/order-routing/rust/pickup-point-delivery-option-generators/default), and consult the [Pickup Point Delivery Option Generator API reference](https://shopify.dev/docs/api/functions/reference/pickup-point-delivery-option-generator).

---

## [Anchor to What you'll learn](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#what-youll-learn)What you'll learn

In this tutorial, you'll learn how to do the following tasks:

* Generate starter code for Shopify Functions
* Use GraphQL to define the input of your function
* Test the delivery option generator and review function logs
* Retrieve the selected pickup point for an order, using the GraphQL Admin API
* Deploy your function to the Shopify platform.

---

## [Anchor to Requirements](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#requirements)Requirements

Plus

Only custom apps that are built for stores on the [Shopify Plus plan](https://help.shopify.com/manual/intro-to-shopify/pricing-plans/plans-features/shopify-plus-plan) have access to the [Pickup Point Delivery Option Generator API](https://shopify.dev/docs/api/functions/reference/pickup-point-delivery-option-generator). Public apps in the Shopify App Store and custom apps built for stores on non-Plus plans don't have access.

* You're a [user with app development permissions](https://shopify.dev/docs/apps/build/dev-dashboard/user-permissions).
* You've created a [development store](https://shopify.dev/docs/api/development-stores#create-a-development-store-to-test-your-app).
* You've [created an app](https://shopify.dev/docs/apps/build/scaffold-app) using Shopify CLI. If you previously installed Shopify CLI, then make sure that you're using the [latest version](https://shopify.dev/docs/api/shopify-cli#upgrade).
* You've installed [Node.js](https://nodejs.org/en/download) 16 or higher.
* You've [installed your app](https://shopify.dev/docs/apps/build/scaffold-app#step-3-install-your-app-on-your-development-store) on the development store.

### [Anchor to Rust-specific requirements](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#rust-specific-requirements)Rust-specific requirements

The following requirements are specific to Rust-based development with Shopify Functions.

* You've installed [Rust](https://www.rust-lang.org/tools/install).

  On Windows, Rust requires the [Microsoft C++ Build Tools](https://docs.microsoft.com/en-us/windows/dev-environment/rust/setup). Make sure to select the **Desktop development with C++** workload when installing the tools.
* You've installed the [`wasm32-unknown-unknown` target](https://doc.rust-lang.org/rustc/platform-support/wasm32-unknown-unknown.html):

  $

  $

  rustup target add wasm32-unknown-unknown

---

## [Anchor to Step 1: Create the pickup point delivery option generator function](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-1-create-the-pickup-point-delivery-option-generator-function)Step 1: Create the pickup point delivery option generator function

Use Shopify CLI to [generate](https://shopify.dev/docs/api/shopify-cli/app/app-generate-extension) a pickup point delivery option generator starter function. Shopify CLI generates the function, specifies the function's inputs using an [input query](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries), and implements the function logic. [Learn more about the function that's generated](https://github.com/Shopify/function-examples/blob/main/order-routing/rust/pickup-point-delivery-option-generators/default).

1. Navigate to your app directory:

   $

   $

   cd <directory>
2. Create a new pickup point delivery option generator extension with the following command:

   $

   $

   shopify app generate extension --template pickup\_point\_delivery\_option\_generator --name pickup-points-generator
3. Choose the language to use. For this tutorial, you should select either **Rust** or **JavaScript**.

   For handling large data payloads, consider using Rust, as it may help avoid exceeding Shopify's instruction limit, potentially preventing an [InstructionCountLimitExceededError](https://shopify.dev/docs/apps/build/functions/monitoring-and-errors).

   Tip

   Shopify Functions support any language that compiles to WebAssembly (Wasm), such as Rust, AssemblyScript, or TinyGo. You specify the Wasm template option when you're using a language other than Rust and can conform to the Wasm API. [Learn more about the Wasm API](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions).
4. Navigate to `extensions/pickup-points-generator`:

   $

   $

   cd extensions/pickup-points-generator

---

## [Anchor to Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-2-preview-the-function-on-a-dev-store)Step 2: Preview the function on a dev store

To test your function, you need to make it available to your dev store.

1. If you're developing a function in a language other than JavaScript or TypeScript, ensure you have configured `build.watch` in your [function extension configuration](https://shopify.dev/docs/api/functions/configuration#properties).

1. Navigate back to your app root:

   $

   $

   cd ../..

1. Use the Shopify CLI [`dev` command](https://shopify.dev/docs/api/shopify-cli/app/app-dev) to start the dev preview:

   $

   $

   shopify app dev

   You can keep the preview running as you work on your function. When you make changes to a watched file, Shopify CLI rebuilds your function and updates the function extension's drafts, so you can immediately test your changes.
2. Follow the CLI prompts to preview your app on your development store.

---

## [Anchor to Step 3: Set up shipping to pickup points](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-3-set-up-shipping-to-pickup-points)Step 3: Set up shipping to pickup points

For pickup points to be available at checkout, your store needs to have at least one location with pickup points enabled.

1. In the Shopify admin, go to **Settings** > **Shipping and delivery**.
2. Under **Shipping to pickup points**, select a location.
3. Enable the option to ship to pickup points from the location.
4. Click **Edit rate**.
5. Under **Apply rate to pickup points provided by**, select your extension.
6. Click **Done**.
7. Click **Save**.

---

## [Anchor to Step 4: Test the pickup point delivery option generator](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-4-test-the-pickup-point-delivery-option-generator)Step 4: Test the pickup point delivery option generator

You can test your pickup point delivery option generator to ensure that it's working as expected.

1. In your dev store, add a product to your cart and proceed to checkout.

   The product must be available from the configured location.
2. In checkout, select **Ship to pickup point**.
3. Type an address in Canada, and click **Search**. If you're in Canada, then you can use your location.
4. To view available pickup points, select either **Map** or **List**.
5. Select a location.
6. Click **Continue to payment**.

   The **Payment** page displays the address that you selected.

---

## [Anchor to Step 5 (Optional): Debug the function](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-5-optional-debug-the-function)Step 5 (Optional): Debug the function

To [debug your function](https://shopify.dev/docs/apps/build/functions/monitoring-and-errors#debug-a-function), or view its output, you can review its logs.

1. Log in to your [Dev Dashboard](https://dev.shopify.com/dashboard/).
2. Navigate to **Apps** and select your app.
3. Click **Logs** > **Functions**.
4. Click on any function run to view its input, output, and any logs written.

---

## [Anchor to Step 6: Retrieve the pickup point from an order](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-6-retrieve-the-pickup-point-from-an-order)Step 6: Retrieve the pickup point from an order

You can retrieve a pickup point from an order with the GraphQL Admin API.

To query the pickup point, you need to [request access to protected customer data](https://shopify.dev/docs/apps/launch/protected-customer-data#request-access-to-protected-customer-data) in the Partner Dashboard. Your app also needs to meet specific [requirements](https://shopify.dev/docs/apps/launch/protected-customer-data#requirements) to ensure customer privacy and security.

### [Anchor to Set access scopes](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#set-access-scopes)Set access scopes

Add the `read_orders` and `read_merchant_managed_fulfillment_orders` [access scopes](https://shopify.dev/docs/apps/structure/configuration#access_scopes) to your app.

1. In `shopify.app.toml`, update `scopes` to include the required access scopes. The following is an example:

   9

   1

   scopes = "read\_products,read\_merchant\_managed\_fulfillment\_orders,read\_orders"
2. Save your configuration file. If [`app dev`](https://shopify.dev/docs/api/shopify-cli/app/app-dev) is running, the scope changes will be applied automatically. If not, start the command:

   $

   $

   shopify app dev

### [Anchor to Retrieve the pickup point](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#retrieve-the-pickup-point)Retrieve the pickup point

Request the pickup point from the GraphQL Admin API's `DeliveryMethod` object. You'll request data from the [`deliveryOptionGeneratorPickupPoint`](https://shopify.dev/docs/api/admin-graphql/unstable/objects/DeliveryMethod#field-deliverymethod-deliveryoptiongeneratorpickuppoint) field.

1. Complete [the order that you started](#step-4-test-the-pickup-point-delivery-option-generator).
2. In Shopify CLI, where your server is running, press `g` to open GraphiQL in your browser.
3. In GraphiQL, run the following query, with the ID of the order that you created.

   This example returns the IDs of the pickup point and the function that generated the pickup point option.

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

   query {

   order(id: "gid://shopify/Order/{ORDER\_ID}") {

   id

   fulfillmentOrders(first: 10, displayable: true) {

   edges {

   node {

   deliveryMethod {

   methodType

   deliveryOptionGeneratorPickupPoint {

   externalId

   functionId

   }

   }

   }

   }

   }

   }

   }

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

   {

   "data": {

   "order": {

   "id": "gid://shopify/Order/1",

   "fulfillmentOrders": {

   "edges": [

   {

   "node": {

   "deliveryMethod": {

   "methodType": "PICKUP\_POINT",

   "deliveryOptionGeneratorPickupPoint": {

   "externalId": "1",

   "functionId": "f0c17828-da1a-4748-810d-3c3cab2bc977"

   }

   }

   }

   }

   ]

   }

   }

   }

   }

---

## [Anchor to Step 7 (Optional): Edit the selected pickup point](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-7-optional-edit-the-selected-pickup-point)Step 7 (Optional): Edit the selected pickup point

You can edit the selected pickup point option, either on the order or on the fulfillment page for a pickup order that's completed using pickup points functions.

1. In the Shopify admin, go to **Orders** page.
2. Click [the order you just completed using pickup points](#step-4-test-the-pickup-point-delivery-option-generator).
3. Next to **Pickup point address**, click the pencil icon.

   In the modal that displays, edit the pickup point address.
4. After you've edited the address, click **Search**.

   Installed pickup points functions will run and a list of pickup points will be returned.
5. Select a new pickup point delivery option.
6. Click **Done**.

To edit the selected pickup point option on the fulfillment page, fulfill the order and repeat the steps above.

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#next-steps)Next steps

* Review the [UX guidelines](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/ux-for-pickup-points) for pickup points, to seamlessly integrate your app into the checkout experience.
* Learn more about how [Shopify Functions](https://shopify.dev/docs/apps/build/functions) work and the benefits of using Shopify Functions.
* Learn how to use [variables](https://shopify.dev/docs/apps/build/functions/input-queries/use-variables-input-queries) in your input query.
* Review the [developer tools and resources](https://shopify.dev/docs/apps/build/checkout/delivery-shipping#developer-tools-and-resources) to build for pickup points, including the Pickup Point Delivery Option Generator API reference.

---

Was this page helpful?

YesNo

* [What you'll learn](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#requirements)
* [Step 1: Create the pickup point delivery option generator function](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-1-create-the-pickup-point-delivery-option-generator-function)
* [Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-2-preview-the-function-on-a-dev-store)
* [Step 3: Set up shipping to pickup points](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-3-set-up-shipping-to-pickup-points)
* [Step 4: Test the pickup point delivery option generator](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-4-test-the-pickup-point-delivery-option-generator)
* [Step 5 (Optional): Debug the function](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-5-optional-debug-the-function)
* [Step 6: Retrieve the pickup point from an order](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-6-retrieve-the-pickup-point-from-an-order)
* [Step 7 (Optional): Edit the selected pickup point](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#step-7-optional-edit-the-selected-pickup-point)
* [Next steps](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-methods/generate-pickup-points#next-steps)
