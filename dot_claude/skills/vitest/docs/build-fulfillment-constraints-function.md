---
title: "Build a fulfillment constraints function"
source_url: "https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [Scenario](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#scenario)
* [What you'll learn](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#requirements)
* [Step 1: Create the fulfillment constraint rule function](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#step-1-create-the-fulfillment-constraint-rule-function)
* [Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#step-2-preview-the-function-on-a-dev-store)
* [Step 3: Test the fulfillment constraint rule](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#step-3-test-the-fulfillment-constraint-rule)
* [Next steps](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#next-steps)

You can use fulfillment constraints to customize fulfillment and delivery strategies throughout the fulfillment process. In this tutorial, you'll use [Shopify Functions](https://shopify.dev/docs/api/functions/current) to create a function which ensures that certain products that are purchased together are always fulfilled from a specific store location.

---

## [Anchor to Scenario](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#scenario)Scenario

You have three products which can be sold individually. The products are fulfilled from your warehouse location, which has been set as a shipping origin within your [shipping profile](https://help.shopify.com/manual/shipping/setting-up-and-managing-your-shipping/shipping-profiles/setting-up-shipping-profiles). You want to group and ship the three products in a special package only when they're purchased together. The grouping of the products should only be assembled at your physical store location in Ottawa.

The function you'll build in this tutorial adjusts the fulfillment location for the three products only when they are purchased together.

---

## [Anchor to What you'll learn](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#what-youll-learn)What you'll learn

In this tutorial, you'll learn how to do the following tasks:

* Generate starter code for Shopify Functions.
* Use GraphQL to define the input of your function.
* Deploy functions to the Shopify platform.
* Setup your app to register your fulfillment constraint rule with your Shopify store.
* Review logs for your function.

---

## [Anchor to Requirements](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#requirements)Requirements

* You're a [user with app development permissions](https://shopify.dev/docs/apps/build/dev-dashboard/user-permissions).
* You've created a [development store](https://shopify.dev/docs/api/development-stores#create-a-development-store-to-test-your-app) and enabled the [Checkout and Customer Accounts Extensibility](https://shopify.dev/docs/api/feature-previews#checkout-and-customer-accounts-extensibility-feature-preview) feature preview.
* You've [created an app](https://shopify.dev/docs/apps/build/scaffold-app) using Shopify CLI. If you previously installed Shopify CLI, then make sure that you're using the [latest version](https://shopify.dev/docs/api/shopify-cli#upgrade). If you plan to create a UI for your extension, then start with the [React Router app template](https://shopify.dev/docs/api#app-templates).
* You've installed [Node.js](https://nodejs.org/en/download) 16 or higher.
* You've [installed your app](https://shopify.dev/docs/apps/build/scaffold-app#step-3-install-your-app-on-your-development-store) on the development store with the [Checkout and Customer Accounts Extensibility](https://shopify.dev/docs/api/feature-previews#checkout-and-customer-accounts-extensibility-feature-preview) feature preview enabled.

* You're using API version 2025-07 or higher for your function.

### [Anchor to Rust-specific requirements](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#rust-specific-requirements)Rust-specific requirements

The following requirements are specific to Rust-based development with Shopify Functions.

* You've installed [Rust](https://www.rust-lang.org/tools/install).

  On Windows, Rust requires the [Microsoft C++ Build Tools](https://docs.microsoft.com/en-us/windows/dev-environment/rust/setup). Make sure to select the **Desktop development with C++** workload when installing the tools.
* You've installed the [`wasm32-unknown-unknown` target](https://doc.rust-lang.org/rustc/platform-support/wasm32-unknown-unknown.html):

  $

  $

  rustup target add wasm32-unknown-unknown

---

## [Anchor to Step 1: Create the fulfillment constraint rule function](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#step-1-create-the-fulfillment-constraint-rule-function)Step 1: Create the fulfillment constraint rule function

To create your fulfillment constraint rule function, you can use Shopify CLI to [generate](https://shopify.dev/docs/api/shopify-cli/app/app-generate-extension) a starter function, specify the inputs for your function using an [input query](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries), and implement your function logic using Rust.

1. Navigate to your app directory:

   $

   $

   cd <directory>
2. Run the following command to create a new fulfillment constraint rule extension:

   $

   $

   shopify app generate extension --template fulfillment\_constraints --name my-fulfillment-constraint-function

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

3. Navigate to `extensions/my-fulfillment-constraint-function`:

   $

   $

   cd extensions/my-fulfillment-constraint-function
4. Replace the contents of `src/run.graphql` file with the following code:

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

   query Input {

   cart {

   deliverableLines {

   id

   merchandise {

   \_\_typename

   ...on ProductVariant {

   id

   product {

   hasAnyTag(tags: ["Promotional candle"])

   }

   }

   }

   }

   }

   locations(names: ["Ottawa Store"]) {

   id

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

   query RunInput {

   cart {

   deliverableLines {

   id

   merchandise {

   \_\_typename

   ...on ProductVariant {

   id

   product {

   hasAnyTag(tags: ["Promotional candle"])

   }

   }

   }

   }

   }

   locations(names: ["Ottawa Store"]) {

   id

   name

   }

   }

   ##### Rust input query

   ```
   query Input {
     cart {
       deliverableLines {
         id
         merchandise  {
           __typename
           ...on ProductVariant {
             id
             product {
               hasAnyTag(tags: ["Promotional candle"])
             }
           }
         }
       }
     }
     locations(names: ["Ottawa Store"]) {
       id
       name
     }
   }
   ```

   ##### JavaScript input query

   ```
   query RunInput {
     cart {
       deliverableLines {
         id
         merchandise  {
           __typename
           ...on ProductVariant {
             id
             product {
               hasAnyTag(tags: ["Promotional candle"])
             }
           }
         }
       }
     }
     locations(names: ["Ottawa Store"]) {
       id
       name
     }
   }
   ```

   Tip

   If a store has many locations, then running this query can result in a big input to parse. To optimize performance, consider using the `identifier` and `names` input options to fetch only relevant locations.
5. If you're using JavaScript, then run the following command to regenerate types based on your input query:

   $

   $

   shopify app function typegen
6. Replace the `src/run.rs` or `src/run.js` file with the following code:

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

   43

   44

   45

   46

   47

   48

   49

   50

   use crate::schema;

   use shopify\_function::prelude::\*;

   use shopify\_function::Result;

   #[shopify\_function]

   fn run(input: schema::run::Input) -> Result<schema::CartFulfillmentConstraintsGenerateRunResult> {

   // Find deliverable cart line ids of all products with the specific tag.

   let deliverable\_line\_ids: Vec<String> = input

   .cart()

   .deliverable\_lines()

   .iter()

   .filter\_map(|deliverable\_line| {

   if let schema::run::input::cart::deliverable\_lines::Merchandise::ProductVariant(variant) = deliverable\_line.merchandise() {

   if \*variant.product().has\_any\_tag() {

   return Some(deliverable\_line.id().clone());

   }

   }

   None

   })

   .collect();

   // Short-circuit and return no operations unless we have at least one tagged product.

   if deliverable\_line\_ids.is\_empty() {

   return Ok(no\_fulfillment\_constraints\_result());

   }

   // Find the location representing our Ottawa store.

   let ottawa\_location = input

   .locations()

   .iter()

   .find(|location| location.name() == "Ottawa Store");

   // Short-circuit and return no operations if the fulfillment location does not exist.

   if ottawa\_location.is\_none() {

   return Ok(no\_fulfillment\_constraints\_result());

   }

   // Construct the operations, including our DeliverableLinesMustFulfillFromAddOperation fulfillment constraint.

   let operations = vec![schema::Operation::DeliverableLinesMustFulfillFromAddOperation(schema::DeliverableLinesMustFulfillFromAddOperation {

   deliverable\_line\_ids: Some(deliverable\_line\_ids),

   location\_ids: vec![ottawa\_location.unwrap().id().clone()],

   })];

   // Return the operation.

   Ok(schema::CartFulfillmentConstraintsGenerateRunResult { operations })

   }

   fn no\_fulfillment\_constraints\_result() -> schema::CartFulfillmentConstraintsGenerateRunResult {

   schema::CartFulfillmentConstraintsGenerateRunResult { operations: vec![] }

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

   38

   39

   40

   41

   42

   43

   44

   45

   46

   47

   48

   49

   50

   51

   52

   // @ts-check

   /\*\*

   \* @typedef {import("../generated/api").RunInput} RunInput

   \* @typedef {import("../generated/api").CartFulfillmentConstraintsGenerateRunResult} CartFulfillmentConstraintsGenerateRunResult

   \*/

   /\*\*

   \* @type {CartFulfillmentConstraintsGenerateRunResult}

   \*/

   const NO\_CHANGES = {

   operations: [],

   };

   /\*\*

   \* @param {RunInput} input

   \* @returns {CartFulfillmentConstraintsGenerateRunResult}

   \*/

   export function run(input) {

   let deliverableLineIds = [];

   // Find deliverable cart line ids of all products with the specific tag.

   for (const deliverableLine of input.cart.deliverableLines) {

   if (deliverableLine.merchandise.\_\_typename == "ProductVariant" &&

   deliverableLine.merchandise.product.hasAnyTag) {

   deliverableLineIds.push(deliverableLine.id);

   }

   }

   // Short-circuit and return no operations unless we have at least three tagged products.

   if (deliverableLineIds.length < 3) { return NO\_CHANGES; }

   // Find the location representing our Ottawa store.

   let ottawaLocation = input.locations.find(location => location.name == "Ottawa Store");

   // Short-circuit and return no operations if the fulfillment location does not exist.

   if (ottawaLocation === undefined) { return NO\_CHANGES; }

   // Construct the operations, including our DeliverableLinesMustFulfillFromAddOperation fulfillment constraint.

   let operations = [

   {

   deliverableLinesMustFulfillFromAddOperation: {

   deliverableLineIds: deliverableLineIds,

   locationIds: [ottawaLocation.id]

   }

   }

   ];

   // Return the operation.

   return { operations: operations };

   };

   ##### Rust

   ```
   use crate::schema;
   use shopify_function::prelude::*;
   use shopify_function::Result;

   #[shopify_function]
   fn run(input: schema::run::Input) -> Result<schema::CartFulfillmentConstraintsGenerateRunResult> {
       // Find deliverable cart line ids of all products with the specific tag.
       let deliverable_line_ids: Vec<String> = input
           .cart()
           .deliverable_lines()
           .iter()
           .filter_map(|deliverable_line| {
               if let schema::run::input::cart::deliverable_lines::Merchandise::ProductVariant(variant) = deliverable_line.merchandise() {
                   if *variant.product().has_any_tag() {
                       return Some(deliverable_line.id().clone());
                   }
               }
               None
           })
           .collect();

       // Short-circuit and return no operations unless we have at least one tagged product.
       if deliverable_line_ids.is_empty() {
           return Ok(no_fulfillment_constraints_result());
       }

       // Find the location representing our Ottawa store.
       let ottawa_location = input
           .locations()
           .iter()
           .find(|location| location.name() == "Ottawa Store");

       // Short-circuit and return no operations if the fulfillment location does not exist.
       if ottawa_location.is_none() {
           return Ok(no_fulfillment_constraints_result());
       }

       // Construct the operations, including our DeliverableLinesMustFulfillFromAddOperation fulfillment constraint.
       let operations = vec![schema::Operation::DeliverableLinesMustFulfillFromAddOperation(schema::DeliverableLinesMustFulfillFromAddOperation {
           deliverable_line_ids: Some(deliverable_line_ids),
           location_ids: vec![ottawa_location.unwrap().id().clone()],
       })];

       // Return the operation.
       Ok(schema::CartFulfillmentConstraintsGenerateRunResult { operations })
   }

   fn no_fulfillment_constraints_result() -> schema::CartFulfillmentConstraintsGenerateRunResult {
       schema::CartFulfillmentConstraintsGenerateRunResult { operations: vec![] }
   }
   ```

   ##### JavaScript

   ```
   // @ts-check

   /**
    * @typedef {import("../generated/api").RunInput} RunInput
    * @typedef {import("../generated/api").CartFulfillmentConstraintsGenerateRunResult} CartFulfillmentConstraintsGenerateRunResult
    */

   /**
    * @type {CartFulfillmentConstraintsGenerateRunResult}
    */
   const NO_CHANGES = {
     operations: [],
   };

   /**
    * @param {RunInput} input
    * @returns {CartFulfillmentConstraintsGenerateRunResult}
    */
   export function run(input) {
     let deliverableLineIds = [];

     // Find deliverable cart line ids of all products with the specific tag.
     for (const deliverableLine of input.cart.deliverableLines) {
       if (deliverableLine.merchandise.__typename == "ProductVariant" &&
         deliverableLine.merchandise.product.hasAnyTag) {

         deliverableLineIds.push(deliverableLine.id);
       }
     }

     // Short-circuit and return no operations unless we have at least three tagged products.
     if (deliverableLineIds.length < 3) { return NO_CHANGES; }

     // Find the location representing our Ottawa store.
     let ottawaLocation = input.locations.find(location => location.name == "Ottawa Store");

     // Short-circuit and return no operations if the fulfillment location does not exist.
     if (ottawaLocation === undefined) { return NO_CHANGES; }

     // Construct the operations, including our DeliverableLinesMustFulfillFromAddOperation fulfillment constraint.
     let operations = [
       {
         deliverableLinesMustFulfillFromAddOperation: {
           deliverableLineIds: deliverableLineIds,
           locationIds: [ottawaLocation.id]
         }
       }
     ];

     // Return the operation.
     return { operations: operations };
   };
   ```
7. If you're using Rust, then build the function's Wasm module:

   $

   $

   cargo build --target=wasm32-unknown-unknown --release

---

## [Anchor to Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#step-2-preview-the-function-on-a-dev-store)Step 2: Preview the function on a dev store

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

## [Anchor to Step 3: Test the fulfillment constraint rule](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#step-3-test-the-fulfillment-constraint-rule)Step 3: Test the fulfillment constraint rule

You can test your fulfillment constraint rule to ensure it's working as expected, and review logs for your function.

1. Use your function handle in GraphQL mutations instead of querying for the function ID.

   Your function handle is defined in `shopify.extension.toml` as `handle`:

   9

   1

   2

   3

   4

   5

   [[extensions]]

   name = "my-fulfillment-constraint-function"

   handle = "function-handle"

   type = "function"

   uid = "3d664979-ccd6-e9dd-4497-41289ece62373715032a"

   Note

   If you're upgrading to API version 2025-10 or later, you no longer need to query for function IDs. Use your stable function handle instead, which remains consistent across environments.

1. From within your app, use the handle of your function to invoke the [`fulfillmentConstraintRuleCreate`](https://shopify.dev/docs/api/admin-graphql/latest/mutations/fulfillmentConstraintRuleCreate) mutation to register the `FulfillmentConstraintRule`. The app needs to be the same app that deployed the function and has the `write_fulfillment_constraint_rules` access scope. You can check out this [doc](https://shopify.dev/docs/apps/build/cli-for-apps/app-configuration) on how to set access scopes for the app.
2. From your dev store's admin, set up the **Ottawa Store** location along with three or more products with the **Promotional candle** tag.
3. Open your dev store and build a cart containing three or more of the products you created, and then proceed through checkout.
4. Open your dev store's admin, and find your new order. The products should be assigned to your **Ottawa Store** location.
   If you change one of the product's inventory locations, then checkout won't return any shipping rates and buyers won't be able to complete checkout.

   ![All products have been assigned to the Ottawa Store location](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/api/functions/fulfillment-constraints/tutorial-result-DnjeGh82.png)

1. Open your terminal where `shopify app dev` is running, and review your function executions.

   When [testing functions on development stores](https://shopify.dev/docs/apps/build/functions/test-debug-functions#test-your-function-on-a-development-store), the output of `dev` includes executions of your functions, any debug logging you have added to them, and a link to a local file with the full function execution details.
2. In a new terminal window, use the Shopify CLI [`app function replay`](https://shopify.dev/docs/api/shopify-cli/app/app-function-replay) command to [replay a function execution locally](https://shopify.dev/docs/apps/build/functions/test-debug-functions#execute-the-function-locally-using-shopify-cli), and debug your function without the need to re-trigger the function execution on Shopify.

$

$

shopify app function replay

1. Select the function execution from the top of the list. Press `q` to quit when you are finished debugging.

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#next-steps)Next steps

* Learn more about how [Shopify Functions](https://shopify.dev/docs/api/functions/current) work and the benefits of using Shopify Functions.
* Consult the [API references for Shopify Functions](https://shopify.dev/docs/api/functions).
* Learn how to use [variables](https://shopify.dev/docs/apps/build/functions/input-queries/use-variables-input-queries) in your input query.

---

Was this page helpful?

YesNo

* [Scenario](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#scenario)
* [What you'll learn](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#requirements)
* [Step 1: Create the fulfillment constraint rule function](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#step-1-create-the-fulfillment-constraint-rule-function)
* [Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#step-2-preview-the-function-on-a-dev-store)
* [Step 3: Test the fulfillment constraint rule](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#step-3-test-the-fulfillment-constraint-rule)
* [Next steps](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function#next-steps)
