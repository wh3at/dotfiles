---
title: "Create checkout validation"
source_url: "https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-server-side-validation-function"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [What you'll learn](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#requirements)
* [Step 1: Create the validation function](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#step-1-create-the-validation-function)
* [Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#step-2-preview-the-function-on-a-dev-store)
* [Step 3: Activate the validation](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#step-3-activate-the-validation)
* [Step 4: Test the validation](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#step-4-test-the-validation)
* [Next steps](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#next-steps)

You can build validation functions to ensure that purchases meet certain criteria before checking out or completing an order. In this tutorial, you'll use [Shopify Functions](https://shopify.dev/docs/api/functions/current) to enforce an order maximum for buyers with insufficient order history, preventing them from placing their order.

Note

Errors from validation functions are exposed to the Storefront API's [`Cart`](https://shopify.dev/docs/storefronts/headless/building-with-the-storefront-api/cart/manage) object, in themes using the [`cart` template](https://shopify.dev/docs/storefronts/themes/architecture/templates/cart), and during checkout.

---

## [Anchor to What you'll learn](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#what-youll-learn)What you'll learn

In this tutorial, you'll learn how to do the following tasks:

* Generate starter code for Shopify Functions.
* Use GraphQL to define the input of your function.
* Deploy functions to the Shopify platform.
* Review logs for your function.

![Checkout page displaying a validation error message stating there is an order maximum of $1,000 for customers without established order history](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/apps/checkout/validation/cart-checkout-validation-screenshot-CoRfSKGQ.png)

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

{

"data": {

"cartLinesAdd": {

"cart": null,

"userErrors": [

{

"code": "VALIDATION\_CUSTOM",

"field": [

"cartId"

],

"message": "There is an order maximum of $1,000 for customers without established order history"

}

]

}

}

}

---

## [Anchor to Requirements](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#requirements)Requirements

Tip

Shopify defaults to Rust as the most performant and recommended language choice to stay within the platform limits. For more information, refer to [language considerations](https://shopify.dev/docs/apps/build/functions/programming-languages).

* You're a [user with app development permissions](https://shopify.dev/docs/apps/build/dev-dashboard/user-permissions).
* You've created a [development store](https://shopify.dev/docs/api/development-stores#create-a-development-store-to-test-your-app) and enabled the [Checkout and Customer Accounts Extensibility](https://shopify.dev/docs/api/feature-previews#checkout-and-customer-accounts-extensibility-feature-preview) feature preview.
* You've [created an app](https://shopify.dev/docs/apps/build/scaffold-app) using Shopify CLI. If you previously installed Shopify CLI, then make sure that you're using the [latest version](https://shopify.dev/docs/api/shopify-cli#upgrade). If you plan to create a UI for your extension, then start with the [React Router app template](https://shopify.dev/docs/api#app-templates).
* You've installed [Node.js](https://nodejs.org/en/download) 16 or higher.
* You've [installed your app](https://shopify.dev/docs/apps/build/scaffold-app#step-3-install-your-app-on-your-development-store) on the development store with the [Checkout and Customer Accounts Extensibility](https://shopify.dev/docs/api/feature-previews#checkout-and-customer-accounts-extensibility-feature-preview) feature preview enabled.

* You're using API version 2025-07 or higher for your function.

### [Anchor to Rust-specific requirements](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#rust-specific-requirements)Rust-specific requirements

The following requirements are specific to Rust-based development with Shopify Functions.

* You've installed [Rust](https://www.rust-lang.org/tools/install).

  On Windows, Rust requires the [Microsoft C++ Build Tools](https://docs.microsoft.com/en-us/windows/dev-environment/rust/setup). Make sure to select the **Desktop development with C++** workload when installing the tools.
* You've installed the [`wasm32-unknown-unknown` target](https://doc.rust-lang.org/rustc/platform-support/wasm32-unknown-unknown.html):

  $

  $

  rustup target add wasm32-unknown-unknown

---

## [Anchor to Step 1: Create the validation function](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#step-1-create-the-validation-function)Step 1: Create the validation function

To create your validation function, you can use Shopify CLI to [generate](https://shopify.dev/docs/api/shopify-cli/app/app-generate-extension) a starter function, specify the inputs for your function using an [input query](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries), and implement your function logic using JavaScript or Rust.

1. Navigate to your app directory:

   $

   $

   cd <directory>
2. Run the following command to create a new validation function:

   $

   $

   shopify app generate extension --template cart\_checkout\_validation --name cart-checkout-validation

   Tip

   Shopify Functions support any language that compiles to WebAssembly (Wasm), such as Rust, AssemblyScript, or TinyGo. You specify the Wasm template option when you're using a language other than Rust and can conform to the Wasm API. [Learn more about the Wasm API](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions).

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
3. Navigate to `extensions/cart-checkout-validation`:

   $

   $

   cd extensions/cart-checkout-validation
4. Replace the contents of `src/cart_validations_generate_run.graphql` file with the following code.

   `cart_validations_generate_run.graphql` defines the input for the function. You need the customer's order count and current cart subtotal.

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

   query Input {

   cart {

   buyerIdentity {

   customer {

   numberOfOrders

   }

   }

   cost {

   subtotalAmount {

   amount

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

   query CartValidationsGenerateRunInput {

   cart {

   buyerIdentity {

   customer {

   numberOfOrders

   }

   }

   cost {

   subtotalAmount {

   amount

   }

   }

   }

   }

   ##### Rust input query

   ```
   query Input {
         cart {
           buyerIdentity {
             customer {
               numberOfOrders
             }
           }
           cost {
             subtotalAmount {
               amount
             }
           }
         }
       }
   ```

   ##### JavaScript input query

   ```
   query CartValidationsGenerateRunInput {
         cart {
           buyerIdentity {
             customer {
               numberOfOrders
             }
           }
           cost {
             subtotalAmount {
               amount
             }
           }
         }
       }
   ```
5. If you're using JavaScript, then run the following command to regenerate types based on your input query:

   $

   $

   shopify app function typegen
6. Replace the `src/cart_validations_generate_run.rs` or `src/cart_validations_generate_run.js` file with the following code.

   This function logic checks for order subtotals greater than a set value and errors when a new customer is detected. You can adjust the subtotal limit or new customer detection logic as needed.

   Tip

   You can associate a validation error with a specific checkout UI field by specifying the `target` property. The `target` property follows the pattern that's provided in the [Validation API reference](https://shopify.dev/docs/api/functions/reference/cart-checkout-validation/graphql#supported-checkout-field-targets). For example, `$.cart.deliveryGroups[0].deliveryAddress.postalCode`.

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

   fn run(input: schema::run::Input) -> Result<schema::CartValidationsGenerateRunResult> {

   let mut operations = Vec::new();

   let mut errors = Vec::new();

   let error = schema::ValidationError {

   message:

   "There is an order maximum of $1,000 for customers without established order history"

   .to\_owned(),

   target: "cart".to\_owned(),

   };

   let order\_subtotal: f64 = input.cart().cost().subtotal\_amount().amount().as\_f64();

   if order\_subtotal > 1000.0 {

   if let Some(buyer\_identity) = input.cart().buyer\_identity() {

   if let Some(customer) = buyer\_identity.customer() {

   if \*customer.number\_of\_orders() < 5 {

   errors.push(error);

   }

   } else {

   errors.push(error);

   }

   } else {

   errors.push(error);

   }

   }

   let operation = schema::ValidationAddOperation { errors };

   operations.push(schema::Operation::ValidationAdd(operation));

   Ok(schema::CartValidationsGenerateRunResult { operations })

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

   // @ts-check

   // Use JSDoc annotations for type safety

   /\*\*

   \* @typedef {import("../generated/api").CartValidationsGenerateRunInput} CartValidationsGenerateRunInput

   \* @typedef {import("../generated/api").CartValidationsGenerateRunResult} CartValidationsGenerateRunResult

   \*/

   // The configured entrypoint for the 'cart.validations.generate.run' extension target

   /\*\*

   \* @param {CartValidationsGenerateRunInput} input

   \* @returns {CartValidationsGenerateRunResult}

   \*/

   export function cartValidationsGenerateRun(input) {

   // The error

   const error = {

   message:

   "There is an order maximum of $1,000 for customers without established order history",

   target: "cart"

   };

   // Parse the decimal (serialized as a string) into a float.

   const orderSubtotal = parseFloat(input.cart.cost.subtotalAmount.amount);

   const errors = [];

   // Orders with subtotals greater than $1,000 are available only to established customers.

   if (orderSubtotal > 1000.0) {

   // If the customer has ordered less than 5 times in the past,

   // then treat them as a new customer.

   const numberOfOrders = input.cart.buyerIdentity?.customer?.numberOfOrders ?? 0;

   if (numberOfOrders < 5) {

   errors.push(error);

   }

   }

   // A single validation operation

   const operations = [

   {

   validationAdd: {

   errors

   },

   },

   ];

   return { operations };

   };

   ##### Rust

   ```
   use super::schema;
       use shopify_function::prelude::*;
       use shopify_function::Result;

       #[shopify_function]
       fn run(input: schema::run::Input) -> Result<schema::CartValidationsGenerateRunResult> {
           let mut operations = Vec::new();
           let mut errors = Vec::new();
           let error = schema::ValidationError {
               message:
                   "There is an order maximum of $1,000 for customers without established order history"
                       .to_owned(),
               target: "cart".to_owned(),
           };

           let order_subtotal: f64 = input.cart().cost().subtotal_amount().amount().as_f64();

           if order_subtotal > 1000.0 {
               if let Some(buyer_identity) = input.cart().buyer_identity() {
                   if let Some(customer) = buyer_identity.customer() {
                       if *customer.number_of_orders() < 5 {
                           errors.push(error);
                       }
                   } else {
                       errors.push(error);
                   }
               } else {
                   errors.push(error);
               }
           }

           let operation = schema::ValidationAddOperation { errors };
           operations.push(schema::Operation::ValidationAdd(operation));

           Ok(schema::CartValidationsGenerateRunResult { operations })
       }
   ```

   ##### JavaScript

   ```
   // @ts-check

       // Use JSDoc annotations for type safety
       /**
       * @typedef {import("../generated/api").CartValidationsGenerateRunInput} CartValidationsGenerateRunInput
       * @typedef {import("../generated/api").CartValidationsGenerateRunResult} CartValidationsGenerateRunResult
     */

       // The configured entrypoint for the 'cart.validations.generate.run' extension target
       /**
       * @param {CartValidationsGenerateRunInput} input
       * @returns {CartValidationsGenerateRunResult}
     */
     export function cartValidationsGenerateRun(input) {
         // The error
         const error = {
           message:
               "There is an order maximum of $1,000 for customers without established order history",
           target: "cart"
         };
         // Parse the decimal (serialized as a string) into a float.
         const orderSubtotal = parseFloat(input.cart.cost.subtotalAmount.amount);
         const errors = [];

         // Orders with subtotals greater than $1,000 are available only to established customers.
         if (orderSubtotal > 1000.0) {
           // If the customer has ordered less than 5 times in the past,
           // then treat them as a new customer.
           const numberOfOrders = input.cart.buyerIdentity?.customer?.numberOfOrders ?? 0;

           if (numberOfOrders < 5) {
             errors.push(error);
           }
         }

         // A single validation operation
         const operations = [
           {
             validationAdd: {
               errors
             },
           },
         ];

         return { operations };
       };
   ```

---

## [Anchor to Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#step-2-preview-the-function-on-a-dev-store)Step 2: Preview the function on a dev store

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

## [Anchor to Step 3: Activate the validation](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#step-3-activate-the-validation)Step 3: Activate the validation

1. From the Shopify admin, go to **Settings** > **Checkout**.
2. In the **Checkout Rules** section of the page, click **Add rule**.

   A dialog opens and shows the `cart-checkout-validation` function that you just deployed.
3. To add a validation, click **Add rule** and select the validation.
4. To activate the validation, click **Activate**.
5. Click **Save**.
6. Optional: Control how checkout behaves when encountering runtime exceptions by clicking on the validation and selecting or deselecting **Allow all customers to submit checkout**.

---

## [Anchor to Step 4: Test the validation](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#step-4-test-the-validation)Step 4: Test the validation

1. From your online store, without logging in, create a cart with more than $1,000 in merchandise.
2. Proceed to **Checkout** and verify that a warning message displays.
3. Verify that checkout progress is blocked. Clicking the **Continue to shipping** button shouldn't allow the user to progress to the next step in checkout.
4. Using the Storefront API [`cartLinesAdd` mutation](https://shopify.dev/docs/api/storefront/latest/mutations/cartLinesAdd), confirm that the mutation's `userErrors` field contains the function's error message, and that executing the mutation was unsuccessful.

1. Open your terminal where `shopify app dev` is running, and review your function executions.

   When [testing functions on development stores](https://shopify.dev/docs/apps/build/functions/test-debug-functions#test-your-function-on-a-development-store), the output of `dev` includes executions of your functions, any debug logging you have added to them, and a link to a local file with the full function execution details.
2. In a new terminal window, use the Shopify CLI [`app function replay`](https://shopify.dev/docs/api/shopify-cli/app/app-function-replay) command to [replay a function execution locally](https://shopify.dev/docs/apps/build/functions/test-debug-functions#execute-the-function-locally-using-shopify-cli), and debug your function without the need to re-trigger the function execution on Shopify.

$

$

shopify app function replay

1. Select the function execution from the top of the list. Press `q` to quit when you are finished debugging.

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#next-steps)Next steps

* Learn more about how [Shopify Functions](https://shopify.dev/docs/api/functions/current) work and the benefits of using Shopify Functions.
* Consult the [API references for Shopify Functions](https://shopify.dev/docs/api/functions).
* Learn how to use [variables](https://shopify.dev/docs/apps/build/functions/input-queries/use-variables-input-queries) in your input query.

---

Was this page helpful?

YesNo

* [What you'll learn](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#requirements)
* [Step 1: Create the validation function](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#step-1-create-the-validation-function)
* [Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#step-2-preview-the-function-on-a-dev-store)
* [Step 3: Activate the validation](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#step-3-activate-the-validation)
* [Step 4: Test the validation](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#step-4-test-the-validation)
* [Next steps](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-checkout-validation#next-steps)
