---
title: "Create the payments function"
source_url: "https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [What you'll learn](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#requirements)
* [Limitations](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#limitations)
* [Step 1: Create the payment customization function](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#step-1-create-the-payment-customization-function)
* [Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#step-2-preview-the-function-on-a-dev-store)
* [Step 3: Create the payment customization with GraphiQL](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#step-3-create-the-payment-customization-with-graphiql)
* [Step 4: Test the payment customization](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#step-4-test-the-payment-customization)
* [Next steps](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#next-steps)

You can build payment customizations that hide, reorder, and rename the payment options available to buyers at checkout with Shopify Functions. This tutorial shows how to use Shopify Functions to hide a payment option offered to customers at checkout, based on the total value of their cart.

---

## [Anchor to What you'll learn](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#what-youll-learn)What you'll learn

In this tutorial, you'll learn how to do the following tasks:

* Generate starter code for Shopify Functions.
* Use GraphQL to define the input of your function.
* Deploy functions to the Shopify platform.
* Review logs for your function.

![Screenshot that shows a hidden payment method](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/apps/checkout/payment-customization-before-and-after-BNTcZDT6.png)

---

## [Anchor to Requirements](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#requirements)Requirements

* You're a [user with app development permissions](https://shopify.dev/docs/apps/build/dev-dashboard/user-permissions).
* You've created a [development store](https://shopify.dev/docs/api/development-stores#create-a-development-store-to-test-your-app).
* You've [created an app](https://shopify.dev/docs/apps/build/scaffold-app) using Shopify CLI. If you previously installed Shopify CLI, then make sure that you're using the [latest version](https://shopify.dev/docs/api/shopify-cli#upgrade). If you plan to create a UI for your extension, then start with the [React Router app template](https://shopify.dev/docs/api#app-templates).
* You've installed [Node.js](https://nodejs.org/en/download) 16 or higher.
* You've [installed your app](https://shopify.dev/docs/apps/build/scaffold-app#step-3-install-your-app-on-your-development-store) on the development store.

* You're using API version 2025-07 or higher for your function.

### [Anchor to Rust-specific requirements](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#rust-specific-requirements)Rust-specific requirements

The following requirements are specific to Rust-based development with Shopify Functions.

* You've installed [Rust](https://www.rust-lang.org/tools/install).

  On Windows, Rust requires the [Microsoft C++ Build Tools](https://docs.microsoft.com/en-us/windows/dev-environment/rust/setup). Make sure to select the **Desktop development with C++** workload when installing the tools.
* You've installed the [`wasm32-unknown-unknown` target](https://doc.rust-lang.org/rustc/platform-support/wasm32-unknown-unknown.html):

  $

  $

  rustup target add wasm32-unknown-unknown

---

## [Anchor to Limitations](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#limitations)Limitations

* Plan and geographical restrictions apply. [Learn more](https://help.shopify.com/en/manual/checkout-settings/checkout-customization#understanding-payment-method-customizations)
  + When the Payment Customization API usage is restricted, the function [input](https://shopify.dev/docs/api/functions/reference/payment-customization/graphql/input) will still contain all payment methods, however [output](https://shopify.dev/docs/api/functions/reference/payment-customization/graphql/functionrunresult) [operations](https://shopify.dev/docs/api/functions/reference/payment-customization/graphql/common-objects/operation) that target restricted payment methods will not take effect on the checkout.
* You can't rename payment methods that have logos as a name, such as **Shop Pay**, **Apple Pay** and **Google Pay**. This also includes all wallets and the Shopify native gift card field.
* In Point of Sale, Payment Customization Functions don't currently run, and operations aren't applied.
* In Shop Pay, payment customization functions do not apply operations on any payment methods except the native gift card field.
* You can remove wallets from the **Express** or payment method section of checkout, but you can't reorder them.
* You can activate a maximum of twenty-five payment customization functions on each store.
* When setting payment terms on checkout, consider the following things:
  + Payment terms only apply to the specific order being processed and don't change the buyer's default payment terms.
  + Existing payment terms aren't provided in the function input and can't be referenced when setting new payment terms.
  + Payment terms can only be set if the shop is on a [Shopify Plus plan](https://help.shopify.com/manual/intro-to-shopify/pricing-plans/plans-features/shopify-plus-plan).
  + Payment terms can't be set on accelerated checkouts.
  + D2C checkouts with payment terms don't support pay now options—buyers only see deferred payment options. B2B checkouts have additional deferred payment options, including vaulted credit cards.
  + Event-based payment terms and automatic payment capture work differently for B2B and D2C:
    - **D2C checkouts**: When the store has the **Automatically when fulfilling** setting enabled, payments are captured automatically based on the event trigger (`FULFILLMENT_CREATED` captures per fulfillment, `ORDER_FULFILLED` captures when the entire order is fulfilled) set by the function.
    - **B2B checkouts**: Automatic payment capture isn't supported. Merchants must manually capture payments when the fulfillment event occurs.
* Adding a review requirement to checkout has the following limitations:
  + You can apply a review requirement only to B2B checkouts.
  + A review requirement cannot be applied to orders and draft order invoice checkouts.
  + A review requirement cannot be applied to [Draft order calculation](https://shopify.dev/docs/apps/build/b2b/draft-orders) flows in Shopify admin.

---

## [Anchor to Step 1: Create the payment customization function](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#step-1-create-the-payment-customization-function)Step 1: Create the payment customization function

To create your payment customization function, use Shopify CLI to [generate](https://shopify.dev/docs/api/shopify-cli/app/app-generate-extension) a starter function, specify the inputs for your function using an [input query](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries), and implement your function logic using JavaScript or Rust.

1. Navigate to your app directory:

   $

   $

   cd <directory>
2. Run the following command to create a new payment customization extension:

   $

   $

   shopify app generate extension --template payment\_customization --name payment-customization

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

3. Navigate to `extensions/payment-customization`:

   $

   $

   cd extensions/payment-customization
4. Replace the contents of `src/cart_payment_methods_transform_run.graphql` file with the following code.

   `cart_payment_methods_transform_run.graphql` defines the input for the function. You need the cart total and the available checkout payment methods.

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

   cost {

   totalAmount {

   amount

   }

   }

   }

   paymentMethods {

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

   query CartPaymentMethodsTransformRunInput {

   cart {

   cost {

   totalAmount {

   amount

   }

   }

   }

   paymentMethods {

   id

   name

   }

   }

   ##### Rust input query

   ```
   query Input {
     cart {
       cost {
         totalAmount {
           amount
         }
       }
     }
     paymentMethods {
       id
       name
     }
   }
   ```

   ##### JavaScript input query

   ```
   query CartPaymentMethodsTransformRunInput {
     cart {
       cost {
         totalAmount {
           amount
         }
       }
     }
     paymentMethods {
       id
       name
     }
   }
   ```
5. If you're using JavaScript, then run the following command to regenerate types based on your input query:

   $

   $

   shopify app function typegen
6. Replace the `src/cart_payment_methods_transform_run.rs` or `src/cart_payment_methods_transform_run.js` file with the following code.

   This function logic will hide a payment method with a name containing `Cash on Delivery` when the cart total purchase amount is above `100`.

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

   use super::schema;

   use shopify\_function::prelude::\*;

   use shopify\_function::Result;

   #[shopify\_function]

   fn cart\_payment\_methods\_transform\_run(input: schema::run::Input) -> Result<schema::CartPaymentMethodsTransformRunResult> {

   let no\_changes = schema::CartPaymentMethodsTransformRunResult { operations: vec![] };

   // Get the cart total from the function input, and return early if it's below 100

   let cart\_total: f64 = input.cart().cost().total\_amount().amount().as\_f64();

   if cart\_total < 100.0 {

   log!("Cart total is not high enough, no need to hide the payment method.");

   return Ok(no\_changes);

   }

   // Find the payment method to hide, and create a hide output operation from it

   let operations = input

   .payment\_methods()

   .iter()

   .find(|&method| method.name() == "Cash on Delivery")

   .map(|method| {

   vec![schema::Operation::Hide(schema::PaymentMethodHideOperation {

   payment\_method\_id: method.id().to\_string(),

   placements: None,

   })]

   })

   .unwrap\_or\_default();

   Ok(schema::CartPaymentMethodsTransformRunResult { operations })

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

   // @ts-check

   // Use JSDoc annotations for type safety

   /\*\*

   \* @typedef {import("../generated/api").CartPaymentMethodsTransformRunInput} CartPaymentMethodsTransformRunInput

   \* @typedef {import("../generated/api").CartPaymentMethodsTransformRunResult} CartPaymentMethodsTransformRunResult

   \*/

   /\*\*

   \* @type {CartPaymentMethodsTransformRunResult}

   \*/

   const NO\_CHANGES = {

   operations: [],

   };

   // The configured entrypoint for the 'cart.payment-methods.transform.run' extension target

   /\*\*

   \* @param {CartPaymentMethodsTransformRunInput} input

   \* @returns {CartPaymentMethodsTransformRunResult}

   \*/

   export function cartPaymentMethodsTransformRun(input) {

   // Get the cart total from the function input, and return early if it's below 100

   const cartTotal = parseFloat(input.cart.cost.totalAmount.amount ?? "0.0");

   if (cartTotal < 100) {

   // You can use debug logs in your function

   console.error("Cart total is not high enough, no need to hide the payment method.");

   return NO\_CHANGES;

   }

   // Find the payment method to hide

   const hidePaymentMethod = input.paymentMethods

   .find(method => method.name.includes("Cash on Delivery"));

   if (!hidePaymentMethod) {

   return NO\_CHANGES;

   }

   return {

   operations: [{

   paymentMethodHide: {

   paymentMethodId: hidePaymentMethod.id

   }

   }]

   };

   };

   ##### Rust

   ```
   use super::schema;
   use shopify_function::prelude::*;
   use shopify_function::Result;

   #[shopify_function]
   fn cart_payment_methods_transform_run(input: schema::run::Input) -> Result<schema::CartPaymentMethodsTransformRunResult> {
       let no_changes = schema::CartPaymentMethodsTransformRunResult { operations: vec![] };

       // Get the cart total from the function input, and return early if it's below 100
       let cart_total: f64 = input.cart().cost().total_amount().amount().as_f64();
       if cart_total < 100.0 {
           log!("Cart total is not high enough, no need to hide the payment method.");
           return Ok(no_changes);
       }

       // Find the payment method to hide, and create a hide output operation from it
       let operations = input
           .payment_methods()
           .iter()
           .find(|&method| method.name() == "Cash on Delivery")
           .map(|method| {
               vec![schema::Operation::Hide(schema::PaymentMethodHideOperation {
                   payment_method_id: method.id().to_string(),
                   placements: None,
               })]
           })
           .unwrap_or_default();

       Ok(schema::CartPaymentMethodsTransformRunResult { operations })
   }
   ```

   ##### JavaScript

   ```
   // @ts-check

   // Use JSDoc annotations for type safety
   /**
    * @typedef {import("../generated/api").CartPaymentMethodsTransformRunInput} CartPaymentMethodsTransformRunInput
    * @typedef {import("../generated/api").CartPaymentMethodsTransformRunResult} CartPaymentMethodsTransformRunResult
    */

   /**
    * @type {CartPaymentMethodsTransformRunResult}
    */
   const NO_CHANGES = {
     operations: [],
   };

   // The configured entrypoint for the 'cart.payment-methods.transform.run' extension target
   /**
    * @param {CartPaymentMethodsTransformRunInput} input
    * @returns {CartPaymentMethodsTransformRunResult}
    */
   export function cartPaymentMethodsTransformRun(input) {
     // Get the cart total from the function input, and return early if it's below 100
     const cartTotal = parseFloat(input.cart.cost.totalAmount.amount ?? "0.0");
     if (cartTotal < 100) {
       // You can use debug logs in your function
       console.error("Cart total is not high enough, no need to hide the payment method.");
       return NO_CHANGES;
     }

     // Find the payment method to hide
     const hidePaymentMethod = input.paymentMethods
       .find(method => method.name.includes("Cash on Delivery"));

     if (!hidePaymentMethod) {
       return NO_CHANGES;
     }

     return {
       operations: [{
         paymentMethodHide: {
           paymentMethodId: hidePaymentMethod.id
         }
       }]
     };
   };
   ```

   Tip

   If you're selling to multiple markets, then you might need to update this logic to include conversion to the store's default currency. Refer to [function development practices for money](https://shopify.dev/docs/apps/build/functions/localization-practices-shopify-functions#converting-money-values) for more information.

---

## [Anchor to Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#step-2-preview-the-function-on-a-dev-store)Step 2: Preview the function on a dev store

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

## [Anchor to Step 3: Create the payment customization with GraphiQL](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#step-3-create-the-payment-customization-with-graphiql)Step 3: Create the payment customization with GraphiQL

To activate your function, you must create a payment customization on the store where you installed your app. You can do this using the [`paymentCustomizationCreate`](https://shopify.dev/docs/api/admin-graphql/current/mutations/paymentCustomizationCreate) GraphQL mutation.

In subsequent tutorials, you'll use metafields on this payment customization to configure your function, and create a user interface so merchants can configure the function themselves.

1. Install the [Shopify GraphiQL app](https://shopify-graphiql-app.shopifycloud.com/) on your store. If you've already installed GraphiQL, then you should do so again to select the necessary access scopes for payment customizations.

   Note

   Make sure to select the `read_payment_customizations` and `write_payment_customizations` access scopes for the Admin API.
2. In the GraphiQL app, in the **API Version** field, select the latest stable version.

1. Use your function handle in GraphQL mutations instead of querying for the function ID.

   Your function handle is defined in `shopify.extension.toml` as `handle`:

   9

   1

   2

   3

   4

   5

   [[extensions]]

   name = "payment-customization"

   handle = "payment-customization"

   type = "function"

   uid = "3d664979-ccd6-e9dd-4497-41289ece62373715032a"

   Note

   If you're upgrading to API version 2025-10 or later, you no longer need to query for function IDs. Use your stable function handle instead, which remains consistent across environments.

3. Execute the following mutation and replace `YOUR_FUNCTION_HANDLE_HERE` with the ID of your function:

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

   paymentCustomizationCreate(paymentCustomization: {

   title: "Hide payment method by cart total",

   enabled: true,

   functionHandle: "YOUR\_FUNCTION\_HANDLE\_HERE",

   }) {

   paymentCustomization {

   id

   }

   userErrors {

   message

   }

   }

   }

   You should receive a GraphQL response that includes the ID of the created payment customization. If the response includes any messages under `userErrors`, then review the errors, check that your mutation and `functionHandle` are correct, and try the request again.

   Tip

   If you receive a `Could not find Function` error, then confirm the following:

   * `shopify app dev` is running.
   * The function handle is correct.

---

## [Anchor to Step 4: Test the payment customization](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#step-4-test-the-payment-customization)Step 4: Test the payment customization

1. From the Shopify admin, go to **Settings** > **Payments**.
2. Check the **Payment customizations** section. You should find the **Hide payment method by cart total** payment customization that you created with GraphiQL.
3. From the **Manual payment methods** section, click **Add manual payment method** and then click **Cash on Delivery (COD)**.
4. Click **Activate**.

1. Open your development store and build a cart with a total (including shipping and tax) under 100. The **Cash on Delivery** payment method should display in checkout.
2. Add additional items to your cart to raise the total over 100. Your payment function should now hide the **Cash on Delivery** payment option.

1. Open your terminal where `shopify app dev` is running, and review your function executions.

   When [testing functions on development stores](https://shopify.dev/docs/apps/build/functions/test-debug-functions#test-your-function-on-a-development-store), the output of `dev` includes executions of your functions, any debug logging you have added to them, and a link to a local file with the full function execution details.
2. In a new terminal window, use the Shopify CLI [`app function replay`](https://shopify.dev/docs/api/shopify-cli/app/app-function-replay) command to [replay a function execution locally](https://shopify.dev/docs/apps/build/functions/test-debug-functions#execute-the-function-locally-using-shopify-cli), and debug your function without the need to re-trigger the function execution on Shopify.

$

$

shopify app function replay

1. Select the function execution from the top of the list. Press `q` to quit when you are finished debugging.

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#next-steps)Next steps

* [Add configuration](https://shopify.dev/docs/apps/build/checkout/payments/add-configuration) to your payment customization using metafields.

---

Was this page helpful?

YesNo

* [What you'll learn](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#requirements)
* [Limitations](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#limitations)
* [Step 1: Create the payment customization function](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#step-1-create-the-payment-customization-function)
* [Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#step-2-preview-the-function-on-a-dev-store)
* [Step 3: Create the payment customization with GraphiQL](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#step-3-create-the-payment-customization-with-graphiql)
* [Step 4: Test the payment customization](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#step-4-test-the-payment-customization)
* [Next steps](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function#next-steps)
