---
title: "Build a local pickup options function"
source_url: "https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [What you'll learn](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#requirements)
* [Step 1: Create the local pickup delivery option generator function](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#step-1-create-the-local-pickup-delivery-option-generator-function)
* [Step 2: Preview the function on a development store](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#step-2-preview-the-function-on-a-development-store)
* [Step 3: Test the local pickup delivery option generator](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#step-3-test-the-local-pickup-delivery-option-generator)
* [Next steps](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#next-steps)

To generate custom local pickup options that are available to customers during checkout, use a local pickup delivery option generator.

Local pickup is an option that allows customers to pick up their orders from your physical location. You can activate it in the [Shipping and delivery settings](https://www.shopify.com/admin/settings/shipping) in the Shopify admin. Customers can then choose the local pickup option at checkout. To learn more, visit the [Shopify Help Center](https://help.shopify.com/manual/shipping/setting-up-and-managing-your-shipping/local-methods/local-pickup).

In this tutorial series, you'll use [Shopify Functions](https://shopify.dev/docs/api/functions/current) to create a function that adds a price to local pickup options when the cart contains bulky items. You can use this tutorial as a guide to creating other functions that generate local pickup charges.

---

## [Anchor to What you'll learn](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#what-youll-learn)What you'll learn

In this tutorial, you’ll learn how to do the following tasks:

* Generate starter code for Shopify Functions.
* Use GraphQL to define the input of your function.
* Deploy a local pickup delivery option generator function to the Shopify platform.
* Review logs for your function.

---

## [Anchor to Requirements](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#requirements)Requirements

Plus

Only stores on the [Shopify Plus](https://www.shopify.com/plus) plan can use local pickup delivery option generators.

* You're a [user with app development permissions](https://shopify.dev/docs/apps/build/dev-dashboard/user-permissions).
* You've created a [development store](https://shopify.dev/docs/api/development-stores#create-a-development-store-to-test-your-app).
* You've [created an app](https://shopify.dev/docs/apps/build/scaffold-app) using Shopify CLI. If you previously installed Shopify CLI, then make sure that you're using the [latest version](https://shopify.dev/docs/api/shopify-cli#upgrade). If you plan to create a UI for your extension, then start with the [React Router app template](https://shopify.dev/docs/api#app-templates).
* You've installed [Node.js](https://nodejs.org/en/download) 16 or higher.
* You've [installed your app](https://shopify.dev/docs/apps/build/scaffold-app#step-3-install-your-app-on-your-development-store) on the development store.

### [Anchor to Rust-specific requirements](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#rust-specific-requirements)Rust-specific requirements

The following requirements are specific to Rust-based development with Shopify Functions.

* You've installed [Rust](https://www.rust-lang.org/tools/install).

  On Windows, Rust requires the [Microsoft C++ Build Tools](https://docs.microsoft.com/en-us/windows/dev-environment/rust/setup). Make sure to select the **Desktop development with C++** workload when installing the tools.
* You've installed the [`wasm32-unknown-unknown` target](https://doc.rust-lang.org/rustc/platform-support/wasm32-unknown-unknown.html):

  $

  $

  rustup target add wasm32-unknown-unknown

---

## [Anchor to Step 1: Create the local pickup delivery option generator function](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#step-1-create-the-local-pickup-delivery-option-generator-function)Step 1: Create the local pickup delivery option generator function

To create your local pickup delivery option generator function, you can use Shopify CLI to [generate](https://shopify.dev/docs/api/shopify-cli/app/app-generate-extension) a starter function, specify the inputs for your function using an [input query](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries), and implement your function logic.

1. Navigate to your app directory:

   $

   $

   cd <directory>
2. Run the following command to create a new local pickup delivery option generator extension:

   $

   $

   shopify app generate extension --template local\_pickup\_delivery\_option\_generator --name local-pickup-generator

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

   Tip

   Shopify Functions support any language that compiles to WebAssembly (Wasm), such as Rust, AssemblyScript, or TinyGo. You specify the Wasm template option when you're using a language other than Rust and can conform to the Wasm API. [Learn more about the Wasm API](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions).
3. Navigate to `extensions/local-pickup-generator`:

   $

   $

   cd extensions/local-pickup-generator
4. Replace the contents of the `src/run.graphql` file with the following code:

   `run.graphql` defines the input for the function.

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

   query Input {

   cart {

   lines {

   id

   merchandise {

   \_\_typename

   ...on ProductVariant

   {

   id

   product {

   productType

   hasAnyTag(tags: ["bulky"])

   }

   }

   }

   }

   }

   locations {

   id

   handle

   name

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

   23

   query RunInput {

   cart {

   lines {

   id

   merchandise {

   \_\_typename

   ...on ProductVariant

   {

   id

   product {

   productType

   hasAnyTag(tags: ["bulky"])

   }

   }

   }

   }

   }

   locations {

   id

   handle

   name

   }

   }

   ##### Rust input query

   ```
   query Input {
         cart {
           lines {
             id
             merchandise {
               __typename
               ...on ProductVariant
               {
                 id
                 product {
                   productType
                   hasAnyTag(tags: ["bulky"])
                 }
               }
             }
           }
         }
         locations {
           id
           handle
           name
         }
       }
   ```

   ##### JavaScript input query

   ```
   query RunInput {
         cart {
           lines {
             id
             merchandise {
               __typename
               ...on ProductVariant
               {
                 id
                 product {
                   productType
                   hasAnyTag(tags: ["bulky"])
                 }
               }
             }
           }
         }
         locations {
           id
           handle
           name
         }
       }
   ```
5. If you're using JavaScript, then run the following command to regenerate types based on your input query:

   $

   $

   shopify app function typegen
6. Replace the `src/run.rs` or `src/run.js` file with the following code.

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

   37

   38

   39

   40

   41

   42

   use super::schema;

   use shopify\_function::prelude::\*;

   use shopify\_function::Result;

   #[shopify\_function]

   fn run(input: schema::run::Input) -> Result<schema::FunctionRunResult> {

   let has\_bulky\_variant = input.cart().lines().into\_iter().any(|line| {

   match line.merchandise() {

   schema::run::input::cart::lines::Merchandise::ProductVariant(variant) => \*variant.product().has\_any\_tag(),

   \_ => false, // Default case for any other merchandise types

   }

   });

   let item\_cost;

   let pickup\_instruction\_text;

   if has\_bulky\_variant {

   item\_cost = Decimal(2.99);

   pickup\_instruction\_text = String::from("Ready for pickup next business day.");

   } else {

   item\_cost = Decimal(0.00);

   pickup\_instruction\_text = String::from("Ready for pickup now!");

   }

   let operations: Vec<schema::Operation> = input.locations()

   .iter()

   .map(|location\_data| {

   schema::Operation {

   add: schema::LocalPickupDeliveryOption {

   title: Some(location\_data.name().clone()),

   cost: Some(item\_cost),

   pickup\_location: schema::PickupLocation {

   location\_handle: location\_data.handle().clone(),

   pickup\_instruction: Some(pickup\_instruction\_text.clone()),

   },

   metafields: None,

   }

   }

   })

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

   37

   // @ts-check

   /\*\*

   \* @typedef {import("../generated/api").RunInput} RunInput

   \* @typedef {import("../generated/api").FunctionRunResult} FunctionRunResult

   \*/

   /\*\*

   \* @param {RunInput} input

   \* @returns {FunctionRunResult}

   \*/

   export function run(input) {

   const hasBulkyVariant = input.cart.lines.some(line => {

   if (line.merchandise.\_\_typename === 'ProductVariant') {

   return line.merchandise.product.hasAnyTag;

   }

   return false;

   });

   const cost = hasBulkyVariant ? 2.99 : 0.00;

   const pickupInstruction = hasBulkyVariant

   ? "Ready for pickup next business day."

   : "Ready for pickup now!";

   return {

   operations: input.locations.map(location => ({

   add: {

   title: location.name,

   cost: cost,

   pickupLocation: {

   locationHandle: location.handle,

   pickupInstruction: pickupInstruction

   }

   }

   }))

   };

   }

   ##### Rust

   ```
   use super::schema;
       use shopify_function::prelude::*;
       use shopify_function::Result;

       #[shopify_function]
       fn run(input: schema::run::Input) -> Result<schema::FunctionRunResult> {
           let has_bulky_variant = input.cart().lines().into_iter().any(|line| {
               match line.merchandise() {
                 schema::run::input::cart::lines::Merchandise::ProductVariant(variant) => *variant.product().has_any_tag(),
                 _ => false, // Default case for any other merchandise types
               }
           });

           let item_cost;
           let pickup_instruction_text;
           if has_bulky_variant {
               item_cost = Decimal(2.99);
               pickup_instruction_text = String::from("Ready for pickup next business day.");
           } else {
               item_cost = Decimal(0.00);
               pickup_instruction_text = String::from("Ready for pickup now!");
           }

           let operations: Vec<schema::Operation> = input.locations()
               .iter()
               .map(|location_data| {
                   schema::Operation {
                       add: schema::LocalPickupDeliveryOption {
                           title: Some(location_data.name().clone()),
                           cost: Some(item_cost),
                           pickup_location: schema::PickupLocation {
                               location_handle: location_data.handle().clone(),
                               pickup_instruction: Some(pickup_instruction_text.clone()),
                           },
                           metafields: None,
                       }
                   }
               })
               .collect();

           Ok(schema::FunctionRunResult { operations })
       }
   ```

   ##### JavaScript

   ```
   // @ts-check

       /**
       * @typedef {import("../generated/api").RunInput} RunInput
       * @typedef {import("../generated/api").FunctionRunResult} FunctionRunResult
     */

       /**
       * @param {RunInput} input
       * @returns {FunctionRunResult}
     */
     export function run(input) {
         const hasBulkyVariant = input.cart.lines.some(line => {
           if (line.merchandise.__typename === 'ProductVariant') {
             return line.merchandise.product.hasAnyTag;
           }
           return false;
         });

         const cost = hasBulkyVariant ? 2.99 : 0.00;
         const pickupInstruction = hasBulkyVariant
           ? "Ready for pickup next business day."
           : "Ready for pickup now!";

         return {
           operations: input.locations.map(location => ({
             add: {
               title: location.name,
               cost: cost,
               pickupLocation: {
                 locationHandle: location.handle,
                 pickupInstruction: pickupInstruction
               }
             }
           }))
         };
       }
   ```
7. If you're using Rust, then build the function's Wasm module:

   $

   $

   cargo build --target=wasm32-unknown-unknown --release

   If you encounter any errors, then ensure that you've [installed Rust and the `wasm32-unknown-unknown` target](#requirements).

---

## [Anchor to Step 2: Preview the function on a development store](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#step-2-preview-the-function-on-a-development-store)Step 2: Preview the function on a development store

To test your function, you need to make it available to your development store.

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

## [Anchor to Step 3: Test the local pickup delivery option generator](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#step-3-test-the-local-pickup-delivery-option-generator)Step 3: Test the local pickup delivery option generator

You can test your local pickup delivery option generator to ensure it's working as expected, and review logs for your function.

1. From the Shopify admin, go to **Settings** > **Shipping and delivery**.

   Make sure you have at least one location in your store with local pickup enabled.
2. [Activate a pickup service](https://help.shopify.com/manual/fulfillment/setup/delivery-methods/pickup-in-store#activate-a-pickup-service) connected to your function.
3. Open your development store, add a product with the "bulky" tag to your cart, proceed through checkout, and select **Pick up**.

   You should see a charge of $2.99 added to the local pickup option.
4. Try again with a product without the "bulky" tag.

   You should see no additional charge for local pickup.

1. Open your terminal where `shopify app dev` is running, and review your function executions.

   When [testing functions on development stores](https://shopify.dev/docs/apps/build/functions/test-debug-functions#test-your-function-on-a-development-store), the output of `dev` includes executions of your functions, any debug logging you have added to them, and a link to a local file with the full function execution details.
2. In a new terminal window, use the Shopify CLI [`app function replay`](https://shopify.dev/docs/api/shopify-cli/app/app-function-replay) command to [replay a function execution locally](https://shopify.dev/docs/apps/build/functions/test-debug-functions#execute-the-function-locally-using-shopify-cli), and debug your function without the need to re-trigger the function execution on Shopify.

$

$

shopify app function replay

1. Select the function execution from the top of the list. Press `q` to quit when you are finished debugging.

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#next-steps)Next steps

* Learn more about how [Shopify Functions](https://shopify.dev/docs/api/functions/current) work and the benefits of using Shopify Functions.
* Consult the [API references for Shopify Functions](https://shopify.dev/docs/api/functions).
* Learn how to use [variables](https://shopify.dev/docs/apps/build/functions/input-queries/use-variables-input-queries) in your input query.

---

Was this page helpful?

YesNo

* [What you'll learn](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#requirements)
* [Step 1: Create the local pickup delivery option generator function](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#step-1-create-the-local-pickup-delivery-option-generator-function)
* [Step 2: Preview the function on a development store](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#step-2-preview-the-function-on-a-development-store)
* [Step 3: Test the local pickup delivery option generator](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#step-3-test-the-local-pickup-delivery-option-generator)
* [Next steps](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-local-pickup-options-function#next-steps)
