---
title: "Build the delivery options function"
source_url: "https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [What you'll learn](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#requirements)
* [Limitations](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#limitations)
* [Sample code](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#sample-code)
* [Step 1: Create the delivery customization function](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#step-1-create-the-delivery-customization-function)
* [Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#step-2-preview-the-function-on-a-dev-store)
* [Step 3: Create the delivery customization with GraphiQL](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#step-3-create-the-delivery-customization-with-graphiql)
* [Step 4: Test the delivery customization](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#step-4-test-the-delivery-customization)
* [Next steps](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#next-steps)

With Shopify Functions, you can customize delivery options. This allows you to hide, reorder, or rename the delivery options available to buyers at checkout. This tutorial demonstrates how to use Shopify Functions to rename a checkout delivery option based on shipping destination.

---

## [Anchor to What you'll learn](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#what-youll-learn)What you'll learn

In this tutorial, you'll learn how to do the following tasks:

* Generate starter code for Shopify Functions.
* Use GraphQL to define the input of your function.
* Deploy functions to the Shopify platform.
* Review logs for your function.

![Screenshot that shows a renamed delivery option](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/apps/checkout/delivery-customization-rename-screenshot-D24cIT-k.png)

---

## [Anchor to Requirements](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#requirements)Requirements

* You're a [user with app development permissions](https://shopify.dev/docs/apps/build/dev-dashboard/user-permissions).
* You've created a [development store](https://shopify.dev/docs/api/development-stores#create-a-development-store-to-test-your-app).
* You've [created an app](https://shopify.dev/docs/apps/build/scaffold-app) using Shopify CLI. If you previously installed Shopify CLI, then make sure that you're using the [latest version](https://shopify.dev/docs/api/shopify-cli#upgrade). If you plan to create a UI for your extension, then start with the [React Router app template](https://shopify.dev/docs/api#app-templates).
* You've installed [Node.js](https://nodejs.org/en/download) 16 or higher.
* You've [installed your app](https://shopify.dev/docs/apps/build/scaffold-app#step-3-install-your-app-on-your-development-store) on the development store.

* You're using API version 2025-07 or higher for your function.

### [Anchor to Rust-specific requirements](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#rust-specific-requirements)Rust-specific requirements

The following requirements are specific to Rust-based development with Shopify Functions.

* You've installed [Rust](https://www.rust-lang.org/tools/install).

  On Windows, Rust requires the [Microsoft C++ Build Tools](https://docs.microsoft.com/en-us/windows/dev-environment/rust/setup). Make sure to select the **Desktop development with C++** workload when installing the tools.
* You've installed the [`wasm32-unknown-unknown` target](https://doc.rust-lang.org/rustc/platform-support/wasm32-unknown-unknown.html):

  $

  $

  rustup target add wasm32-unknown-unknown

---

## [Anchor to Limitations](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#limitations)Limitations

* In the Delivery Customization API, the carrier name is automatically prepended to the shipping method title at checkout when using the [`DeliveryOptionRenameOperation`](https://shopify.dev/docs/api/functions/reference/delivery-customization/graphql/common-objects/deliveryoptionrenameoperation) object, and can't be altered or omitted through the API. For example, if the carrier name is `UPS` and the method is `Standard`, you could change `UPS Standard` to `UPS Standard Shipping`, but you couldn't change `UPS Standard` to `Standard Shipping`.

---

## [Anchor to Sample code](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#sample-code)Sample code

If you want to quickly get started, then you can get the sample code by completing the following steps. This tutorial describes the sample code step by step.

1. Clone the delivery customizations sample app:

   $

   $

   shopify app init --template https://github.com/Shopify/function-examples/sample-apps/delivery-customizations

   Note

   You can [view the source code for the delivery customizations sample app](https://github.com/Shopify/function-examples/tree/main/sample-apps/delivery-customizations) in GitHub.

1. Enter a name for your app project.
2. Navigate to your app directory:

$

$

cd <directory>

1. Link your app configuration:

$

$

shopify app config link

1. Start a local server for your app:

$

$

shopify app dev

1. With the server running, open the **Preview URL** in the terminal output.

   When you open the URL, you're prompted to install the app on your development store.
2. Click **Install app** to install the app on the store.

1. [Create and test your delivery customization](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-ui#step-5-create-and-test-your-delivery-customization).

---

## [Anchor to Step 1: Create the delivery customization function](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#step-1-create-the-delivery-customization-function)Step 1: Create the delivery customization function

To create your delivery customization function, you can use Shopify CLI to [generate](https://shopify.dev/docs/api/shopify-cli/app/app-generate-extension) a starter function, specify the inputs for your function using an [input query](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries), and implement your function logic using JavaScript or Rust.

1. Navigate to your app directory:

   $

   $

   cd <directory>
2. Run the following command to create a new delivery customization extension:

   $

   $

   shopify app generate extension --template delivery\_customization --name delivery-customization

1. Choose the language that you want to use. For this tutorial, you should select either **Rust** or **JavaScript**.

   Shopify defaults to Rust as the most performant and recommended language choice to stay within the platform limits. For more information, refer to [language considerations](https://shopify.dev/docs/apps/build/functions/programming-languages).

   $

   $

   $

   $

   $

   $

   ? What would you like to work in?

   > (1) Rust

   (2) JavaScript

   (3) TypeScript

   (4) Wasm

1. Navigate to `extensions/delivery-customization`:

   $

   $

   cd extensions/delivery-customization
2. Replace the contents of `src/run.graphql` file with the following code.

   `run.graphql` defines the input for the function. You need the cart delivery groups, with the delivery state/province code and available delivery options.

   The query differs slightly in Rust and JavaScript due to code generation requirements.

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

   query Input {

   cart {

   deliveryGroups {

   deliveryAddress {

   provinceCode

   }

   deliveryOptions {

   handle

   title

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

   query RunInput {

   cart {

   deliveryGroups {

   deliveryAddress {

   provinceCode

   }

   deliveryOptions {

   handle

   title

   }

   }

   }

   }

   ##### Rust input query

   ```
   query Input {
     cart {
       deliveryGroups {
         deliveryAddress {
           provinceCode
         }
         deliveryOptions {
           handle
           title
         }
       }
     }
   }
   ```

   ##### JavaScript input query

   ```
   query RunInput {
     cart {
       deliveryGroups {
         deliveryAddress {
           provinceCode
         }
         deliveryOptions {
           handle
           title
         }
       }
     }
   }
   ```
3. If you're using JavaScript, then run the following command to regenerate types based on your input query:

   $

   $

   shopify app function typegen
4. Replace the `src/run.rs` or `src/run.js` file with the following code.

   This function logic appends a message to all delivery options if the shipping address state or province code is `NC`. You can adjust this to the state or province of your choice.

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

   24

   25

   26

   27

   28

   29

   30

   31

   32

   33

   34

   35

   36

   use super::schema;

   use shopify\_function::prelude::\*;

   use shopify\_function::Result;

   #[shopify\_function]

   fn run(input: schema::run::Input) -> Result<schema::CartDeliveryOptionsTransformRunResult> {

   let message = "May be delayed due to weather conditions";

   let operations = input

   .cart()

   .delivery\_groups()

   .iter()

   .filter\_map(|group| {

   if let Some(address) = group.delivery\_address() {

   if address.province\_code() == Some(&"NC".to\_string()) {

   return Some(

   group.delivery\_options().iter().map(|option| {

   schema::Operation::Rename(schema::DeliveryOptionRenameOperation {

   delivery\_option\_handle: option.handle().to\_string(),

   title: match option.title() {

   Some(title) => format!("{} - {}", title, message),

   None => message.to\_string(),

   },

   })

   })

   .collect::<Vec<\_>>(),

   );

   }

   }

   None

   })

   .flatten()

   .collect();

   Ok(schema::FunctionRunResult { operations })

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

   23

   24

   25

   26

   27

   28

   29

   30

   31

   32

   33

   34

   35

   36

   // @ts-check

   // Use JSDoc annotations for type safety

   /\*\*

   \* @typedef {import("../generated/api").RunInput} RunInput

   \* @typedef {import("../generated/api").CartDeliveryOptionsTransformRunResult} CartDeliveryOptionsTransformRunResult

   \* @typedef {import("../generated/api").Operation} Operation

   \*/

   // The configured entrypoint for the 'cart.delivery-options.transform.run' extension target

   /\*\*

   \* @param {RunInput} input

   \* @returns {CartDeliveryOptionsTransformRunResult}

   \*/

   export function run(input) {

   // The message to be added to the delivery option

   const message = "May be delayed due to weather conditions";

   let toRename = input.cart.deliveryGroups

   // Filter for delivery groups with a shipping address containing the affected state or province

   .filter(group => group.deliveryAddress?.provinceCode &&

   group.deliveryAddress.provinceCode == "NC")

   // Collect the delivery options from these groups

   .flatMap(group => group.deliveryOptions)

   // Construct a rename operation for each, adding the message to the option title

   .map(option => /\*\* @type {Operation} \*/({

   deliveryOptionRename: {

   deliveryOptionHandle: option.handle,

   title: option.title ? `${option.title} - ${message}` : message

   }

   }));

   return {

   operations: toRename

   };

   };

   ##### Rust

   ```
   use super::schema;
   use shopify_function::prelude::*;
   use shopify_function::Result;

   #[shopify_function]
   fn run(input: schema::run::Input) -> Result<schema::CartDeliveryOptionsTransformRunResult> {
       let message = "May be delayed due to weather conditions";

       let operations = input
           .cart()
           .delivery_groups()
           .iter()
           .filter_map(|group| {
               if let Some(address) = group.delivery_address() {
                   if address.province_code() == Some(&"NC".to_string()) {
                       return Some(
                           group.delivery_options().iter().map(|option| {
                               schema::Operation::Rename(schema::DeliveryOptionRenameOperation {
                                   delivery_option_handle: option.handle().to_string(),
                                   title: match option.title() {
                                       Some(title) => format!("{} - {}", title, message),
                                       None => message.to_string(),
                                   },
                               })
                           })
                           .collect::<Vec<_>>(),
                       );
                   }
               }
               None
           })
           .flatten()
           .collect();

       Ok(schema::FunctionRunResult { operations })
   }
   ```

   ##### JavaScript

   ```
   // @ts-check

   // Use JSDoc annotations for type safety
   /**
    * @typedef {import("../generated/api").RunInput} RunInput
    * @typedef {import("../generated/api").CartDeliveryOptionsTransformRunResult} CartDeliveryOptionsTransformRunResult
    * @typedef {import("../generated/api").Operation} Operation
    */

   // The configured entrypoint for the 'cart.delivery-options.transform.run' extension target
   /**
    * @param {RunInput} input
    * @returns {CartDeliveryOptionsTransformRunResult}
    */
   export function run(input) {
       // The message to be added to the delivery option
       const message = "May be delayed due to weather conditions";

       let toRename = input.cart.deliveryGroups
         // Filter for delivery groups with a shipping address containing the affected state or province
         .filter(group => group.deliveryAddress?.provinceCode &&
           group.deliveryAddress.provinceCode == "NC")
         // Collect the delivery options from these groups
         .flatMap(group => group.deliveryOptions)
         // Construct a rename operation for each, adding the message to the option title
         .map(option => /** @type {Operation} */({
           deliveryOptionRename: {
             deliveryOptionHandle: option.handle,
             title: option.title ? `${option.title} - ${message}` : message
           }
         }));

       return {
         operations: toRename
       };
   };
   ```

---

## [Anchor to Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#step-2-preview-the-function-on-a-dev-store)Step 2: Preview the function on a dev store

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

## [Anchor to Step 3: Create the delivery customization with GraphiQL](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#step-3-create-the-delivery-customization-with-graphiql)Step 3: Create the delivery customization with GraphiQL

To activate your function, you must create a delivery customization on the store where you installed your app. You can do this using the [`deliveryCustomizationCreate`](https://shopify.dev/docs/api/admin-graphql/current/mutations/deliveryCustomizationCreate) GraphQL mutation.

In subsequent tutorials, you'll use metafields on this delivery customization to configure your function, and create a user interface so merchants can configure the function themselves.

1. Install the [Shopify GraphiQL app](https://shopify-graphiql-app.shopifycloud.com/) on your store. If you've already installed GraphiQL, then you should do so again to select the necessary access scopes for delivery customizations.

   Note

   Make sure to select the `read_delivery_customizations` and `write_delivery_customizations` access scopes for the Admin API.
2. In the GraphiQL app, in the **API Version** field, select the **2025-10** version.

1. Use your function handle in GraphQL mutations instead of querying for the function ID.

   Your function handle is defined in `shopify.extension.toml` as `handle`:

   9

   1

   2

   3

   4

   5

   [[extensions]]

   name = "delivery-customization"

   handle = "function-handle"

   type = "function"

   uid = "3d664979-ccd6-e9dd-4497-41289ece62373715032a"

   Note

   If you're upgrading to API version 2025-10 or later, you no longer need to query for function IDs. Use your stable function handle instead, which remains consistent across environments.

1. Execute the following mutation and replace `YOUR_FUNCTION_HANDLE_HERE` with the handle of your function:

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

   mutation {

   deliveryCustomizationCreate(deliveryCustomization: {

   functionHandle: "YOUR\_FUNCTION\_HANDLE\_HERE"

   title: "Add message to delivery options for state/province"

   enabled: true

   }) {

   deliveryCustomization {

   id

   }

   userErrors {

   message

   }

   }

   }

   You should receive a GraphQL response that includes the ID of the created delivery customization. If the response includes any messages under `userErrors`, then review the errors, check that your mutation and `functionHandle` are correct, and try the request again.

   Tip

   If you receive a `Could not find Function` error, then confirm the following:

   * `shopify app dev` is running.
   * The function handle is correct.

---

## [Anchor to Step 4: Test the delivery customization](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#step-4-test-the-delivery-customization)Step 4: Test the delivery customization

1. From the Shopify admin, go to **Settings** > **Shipping and delivery**.
2. Check the **Delivery customizations** section. You should find the **Add message to delivery options for state/province** delivery customization that you created with GraphiQL.

1. Open your development store, build a cart, and proceed to checkout.
2. Enter a delivery address that doesn't use the specified state/province code. You shouldn't see any additional messaging on the delivery options.
3. Change your shipping address to use your chosen state/province code. Your delivery options should now have the additional messaging.

1. Open your terminal where `shopify app dev` is running, and review your function executions.

   When [testing functions on development stores](https://shopify.dev/docs/apps/build/functions/test-debug-functions#test-your-function-on-a-development-store), the output of `dev` includes executions of your functions, any debug logging you have added to them, and a link to a local file with the full function execution details.
2. In a new terminal window, use the Shopify CLI [`app function replay`](https://shopify.dev/docs/api/shopify-cli/app/app-function-replay) command to [replay a function execution locally](https://shopify.dev/docs/apps/build/functions/test-debug-functions#execute-the-function-locally-using-shopify-cli), and debug your function without the need to re-trigger the function execution on Shopify.

$

$

shopify app function replay

1. Select the function execution from the top of the list. Press `q` to quit when you are finished debugging.

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#next-steps)Next steps

* [Add configuration](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/add-configuration) to your delivery customization using metafields.

---

Was this page helpful?

YesNo

* [What you'll learn](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#requirements)
* [Limitations](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#limitations)
* [Sample code](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#sample-code)
* [Step 1: Create the delivery customization function](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#step-1-create-the-delivery-customization-function)
* [Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#step-2-preview-the-function-on-a-dev-store)
* [Step 3: Create the delivery customization with GraphiQL](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#step-3-create-the-delivery-customization-with-graphiql)
* [Step 4: Test the delivery customization](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#step-4-test-the-delivery-customization)
* [Next steps](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function#next-steps)
