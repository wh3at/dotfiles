---
title: "Build a location rule function"
source_url: "https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [What you'll learn](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#requirements)
* [Step 1: Create the location rule function](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#step-1-create-the-location-rule-function)
* [Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#step-2-preview-the-function-on-a-dev-store)
* [Step 3: Test the location rule](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#step-3-test-the-location-rule)
* [Next steps](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#next-steps)

You can use location rules to rank the possible locations for a line item during checkout. In this tutorial, you'll use [Shopify Functions](https://shopify.dev/docs/api/functions/current) to create a function that prioritizes locations in a particular country.

Beta

Location rules is a new feature that's only available by request. Reach out to [Shopify Plus Support](https://help.shopify.com/en/support/plus) to know more about your eligibility and the requirements for the beta program.

---

## [Anchor to What you'll learn](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#what-youll-learn)What you'll learn

In this tutorial, you'll learn how to do the following tasks:

* Generate starter code for Shopify Functions.
* Use GraphQL to define the input of your function.
* Deploy functions to the Shopify platform.
* Use the order routing settings to create a location rule in a Shopify store.
* Review logs for your function.

---

## [Anchor to Requirements](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#requirements)Requirements

Refer to [Build location rules](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules#requirements).

---

## [Anchor to Step 1: Create the location rule function](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#step-1-create-the-location-rule-function)Step 1: Create the location rule function

To create your location rule function, you can use Shopify CLI to [generate](https://shopify.dev/docs/api/shopify-cli/app/app-generate-extension) a starter function, specify the inputs for your function using an [input query](https://shopify.dev/docs/apps/build/functions/input-queries/metafields-for-input-queries), and implement your function logic using Rust.

1. Navigate to your app directory:

   $

   $

   cd <directory>
2. Run the following command to create a new location rule extension:

   $

   $

   shopify app generate extension --template order\_routing\_location\_rule --name location-rule

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

3. Navigate to `extensions/location-rule`:

   $

   $

   cd extensions/location-rule
4. Replace the contents of `src/run.graphql` file with the following code:

   `run.graphql` defines the input for the function. You need the fulfillment groups, with the available locations for the items in the group.

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

   query Input {

   fulfillmentGroups {

   handle

   inventoryLocationHandles

   }

   locations {

   handle

   address {

   countryCode

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

   query RunInput {

   fulfillmentGroups {

   handle

   inventoryLocationHandles

   }

   locations {

   handle

   address {

   countryCode

   }

   }

   }

   ##### Rust input query

   ```
   query Input {
     fulfillmentGroups {
       handle
       inventoryLocationHandles
     }
     locations {
       handle
       address {
         countryCode
       }
     }
   }
   ```

   ##### JavaScript input query

   ```
   query RunInput {
     fulfillmentGroups {
       handle
       inventoryLocationHandles
     }
     locations {
       handle
       address {
         countryCode
       }
     }
   }
   ```

   Tip

   If a store has many locations, then running this query can result in a big input to parse. To optimize performance, consider loading the location in the input and querying the inventory locations by ID.
5. If you're using JavaScript, then run the following command to regenerate types based on your input query:

   $

   $

   shopify app function typegen
6. Replace the `src/run.rs` or `src/run.js` file with the following code.

   The function logic sorts the locations in your store, putting locations in Canada first.

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

   53

   54

   55

   use super::schema;

   use shopify\_function::prelude::\*;

   use shopify\_function::Result;

   use schema::FulfillmentGroupRankedLocations;

   use crate::schema::Handle;

   #[shopify\_function]

   fn run(input: schema::run::Input) -> Result<schema::CartFulfillmentGroupsLocationRankingsGenerateRunResult> {

   // Load the fulfillment groups and generate the rank operations for each one

   let operations = input

   .fulfillment\_groups()

   .into\_iter()

   .map(|fulfillment\_group| schema::Operation {

   fulfillment\_group\_location\_ranking\_add: build\_rank\_operation(fulfillment\_group, &input.locations()),

   })

   .collect();

   // Return the operations

   Ok(schema::CartFulfillmentGroupsLocationRankingsGenerateRunResult { operations })

   }

   fn build\_rank\_operation(

   input: &schema::run::input::FulfillmentGroups,

   locations: &[schema::run::input::Locations],

   ) -> FulfillmentGroupLocationRankingAddOperation {

   FulfillmentGroupLocationRankingAddOperation {

   fulfillment\_group\_handle: input.handle().to\_string(),

   rankings: prioritize\_canadian\_locations(input.inventory\_location\_handles().to\_vec(), locations),

   }

   }

   fn prioritize\_canadian\_locations(

   handles: Vec<Handle>,

   locations: &[schema::run::input::Locations],

   ) -> Vec<schema::RankedLocation> {

   // Load the inventory locations for the fulfillment group

   handles

   .into\_iter()

   .map(|location\_handle| {

   let location = locations.iter().find(|&loc| \*loc.handle() == location\_handle);

   // Rank the location as 0 if the country code is CA, otherwise rank it as 1

   schema::RankedLocation {

   location\_handle,

   rank: match location {

   Some(location) => {

   if location.address().country\_code() == Some("CA".to\_string()).as\_ref() {

   0

   } else {

   1

   }

   }

   None => 1,

   },

   }

   })

   .collect()

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

   53

   54

   55

   56

   57

   // @ts-check

   /\*\*

   \* @typedef {import("../generated/api").RunInput} RunInput

   \* @typedef {import("../generated/api").RunInput["fulfillmentGroups"][0]} FulfillmentGroup

   \* @typedef {import("../generated/api").RunInput["locations"][0]} Location

   \* @typedef {import("../generated/api").CartFulfillmentGroupsLocationRankingsGenerateRunResult} CartFulfillmentGroupsLocationRankingsGenerateRunResult

   \* @typedef {import("../generated/api").Operation} Operation

   \* @typedef {import("../generated/api").FulfillmentGroupLocationRankingAddOperation} FulfillmentGroupLocationRankingAddOperation

   \* @typedef {import("../generated/api").RankedLocation} RankedLocation

   \*/

   /\*\*

   \* @param {RunInput} input

   \* @returns {CartFulfillmentGroupsLocationRankingsGenerateRunResult}

   \*/

   export function run(input) {

   // Load the fulfillment groups and generate the rank operations for each one

   let operations = input.fulfillmentGroups

   .map(fulfillmentGroup => /\*\* @type {Operation} \*/(

   {

   fulfillment\_group\_location\_ranking\_add: buildRankOperation(fulfillmentGroup, input.locations)

   }

   ));

   // Return the operations

   return { operations: operations };

   };

   /\*\*

   \* @param {FulfillmentGroup} fulfillmentGroup

   \* @param {Location[]} locations

   \* @returns {FulfillmentGroupLocationRankingAddOperation}

   \*/

   function buildRankOperation(fulfillmentGroup, locations) {

   return {

   fulfillmentGroupHandle: fulfillmentGroup.handle,

   rankings: prioritizeCanadianLocations(fulfillmentGroup.inventoryLocationHandles, locations),

   };

   };

   /\*\*

   \* @param {string[]} locationHandles

   \* @param {Location[]} locations

   \* @returns {RankedLocation[]}

   \*/

   function prioritizeCanadianLocations(locationHandles, locations) {

   // Load the inventory locations for the fulfillment group

   return locationHandles.map(locationHandle => {

   const location = locations.find((loc) => loc.handle == locationHandle);

   return {

   locationHandle,

   // Rank the location as 0 if the country code is CA, otherwise rank it as 1

   fulfillment\_group\_location\_ranking\_add: location?.address.countryCode === "CA" ? 0 : 1,

   }

   });

   };

   ##### Rust

   ```
   use super::schema;
   use shopify_function::prelude::*;
   use shopify_function::Result;
   use schema::FulfillmentGroupRankedLocations;
   use crate::schema::Handle;

   #[shopify_function]
   fn run(input: schema::run::Input) -> Result<schema::CartFulfillmentGroupsLocationRankingsGenerateRunResult> {
       // Load the fulfillment groups and generate the rank operations for each one
       let operations = input
           .fulfillment_groups()
           .into_iter()
           .map(|fulfillment_group| schema::Operation {
             fulfillment_group_location_ranking_add: build_rank_operation(fulfillment_group, &input.locations()),
           })
           .collect();
       // Return the operations
       Ok(schema::CartFulfillmentGroupsLocationRankingsGenerateRunResult { operations })
   }
   fn build_rank_operation(
       input: &schema::run::input::FulfillmentGroups,
       locations: &[schema::run::input::Locations],
   ) -> FulfillmentGroupLocationRankingAddOperation {
       FulfillmentGroupLocationRankingAddOperation {
           fulfillment_group_handle: input.handle().to_string(),
           rankings: prioritize_canadian_locations(input.inventory_location_handles().to_vec(), locations),
       }
   }

   fn prioritize_canadian_locations(
       handles: Vec<Handle>,
       locations: &[schema::run::input::Locations],
   ) -> Vec<schema::RankedLocation> {
       // Load the inventory locations for the fulfillment group
       handles
           .into_iter()
           .map(|location_handle| {
               let location = locations.iter().find(|&loc| *loc.handle() == location_handle);
               // Rank the location as 0 if the country code is CA, otherwise rank it as 1
               schema::RankedLocation {
                   location_handle,
                   rank: match location {
                       Some(location) => {
                           if location.address().country_code() == Some("CA".to_string()).as_ref() {
                               0
                           } else {
                               1
                           }
                       }
                       None => 1,
                   },
               }
           })
           .collect()
   }
   ```

   ##### JavaScript

   ```
   // @ts-check

   /**
   * @typedef {import("../generated/api").RunInput} RunInput
   * @typedef {import("../generated/api").RunInput["fulfillmentGroups"][0]} FulfillmentGroup
   * @typedef {import("../generated/api").RunInput["locations"][0]} Location
   * @typedef {import("../generated/api").CartFulfillmentGroupsLocationRankingsGenerateRunResult} CartFulfillmentGroupsLocationRankingsGenerateRunResult
   * @typedef {import("../generated/api").Operation} Operation
   * @typedef {import("../generated/api").FulfillmentGroupLocationRankingAddOperation} FulfillmentGroupLocationRankingAddOperation
   * @typedef {import("../generated/api").RankedLocation} RankedLocation
   */

   /**
   * @param {RunInput} input
   * @returns {CartFulfillmentGroupsLocationRankingsGenerateRunResult}
   */
   export function run(input) {
       // Load the fulfillment groups and generate the rank operations for each one
       let operations = input.fulfillmentGroups
         .map(fulfillmentGroup => /** @type {Operation} */(
           {
             fulfillment_group_location_ranking_add: buildRankOperation(fulfillmentGroup, input.locations)
           }
         ));

       // Return the operations
       return { operations: operations };
   };

   /**
   * @param {FulfillmentGroup} fulfillmentGroup
   * @param {Location[]} locations
   * @returns {FulfillmentGroupLocationRankingAddOperation}
   */
   function buildRankOperation(fulfillmentGroup, locations) {
       return {
         fulfillmentGroupHandle: fulfillmentGroup.handle,
         rankings: prioritizeCanadianLocations(fulfillmentGroup.inventoryLocationHandles, locations),
       };
   };

   /**
   * @param {string[]} locationHandles
   * @param {Location[]} locations
   * @returns {RankedLocation[]}
   */
   function prioritizeCanadianLocations(locationHandles, locations) {
       // Load the inventory locations for the fulfillment group
       return locationHandles.map(locationHandle => {
         const location = locations.find((loc) => loc.handle == locationHandle);
         return {
           locationHandle,
           // Rank the location as 0 if the country code is CA, otherwise rank it as 1
           fulfillment_group_location_ranking_add: location?.address.countryCode === "CA" ? 0 : 1,
         }
       });
   };
   ```
7. If you're using Rust, then build the function's Wasm module:

   $

   $

   cargo build --target=wasm32-unknown-unknown --release

   If you encounter any errors, then ensure that you've [installed Rust and the `wasm32-unknown-unknown` target](#requirements).

---

## [Anchor to Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#step-2-preview-the-function-on-a-dev-store)Step 2: Preview the function on a dev store

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

## [Anchor to Step 3: Test the location rule](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#step-3-test-the-location-rule)Step 3: Test the location rule

You can test your location rule to ensure it's working as expected, and review logs for your function.

Before you test the location rule, make sure that you have the following:

* Two [locations](https://help.shopify.com/manual/locations/setting-up-your-locations) in your store in different countries, one of them in Canada.
* One product that is stocked on multiple locations.

1. From the Shopify admin, go to **Settings** > **Shipping and delivery**.
2. In the **Order routing** section, click **Manage**.
3. Click **Add rule**.

   Your new rule should be an available option.
4. Add your new rule and drag it to the top to make it your highest priority location rule.
5. Open your dev store.
6. Add products to your cart. At least one product should be stocked at multiple locations, including your Canadian location.
7. Proceed through checkout.
8. Open your dev store's admin, and find your new order. This should be assigned to your Canadian location.

1. Open your terminal where `shopify app dev` is running, and review your function executions.

   When [testing functions on development stores](https://shopify.dev/docs/apps/build/functions/test-debug-functions#test-your-function-on-a-development-store), the output of `dev` includes executions of your functions, any debug logging you have added to them, and a link to a local file with the full function execution details.
2. In a new terminal window, use the Shopify CLI [`app function replay`](https://shopify.dev/docs/api/shopify-cli/app/app-function-replay) command to [replay a function execution locally](https://shopify.dev/docs/apps/build/functions/test-debug-functions#execute-the-function-locally-using-shopify-cli), and debug your function without the need to re-trigger the function execution on Shopify.

$

$

shopify app function replay

1. Select the function execution from the top of the list. Press `q` to quit when you are finished debugging.

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#next-steps)Next steps

* [Add configuration](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/add-configuration) to your location rules using metafields.

---

Was this page helpful?

YesNo

* [What you'll learn](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#what-youll-learn)
* [Requirements](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#requirements)
* [Step 1: Create the location rule function](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#step-1-create-the-location-rule-function)
* [Step 2: Preview the function on a dev store](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#step-2-preview-the-function-on-a-dev-store)
* [Step 3: Test the location rule](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#step-3-test-the-location-rule)
* [Next steps](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function#next-steps)
