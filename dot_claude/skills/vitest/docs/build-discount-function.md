---
title: "Build a Discount Function"
source_url: "https://shopify.dev/docs/apps/build/discounts/build-discount-function"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



With [Shopify Functions](https://shopify.dev/docs/apps/build/functions), you can create a new type of discount that applies to cart lines, order subtotal, and shipping rates.

In this tutorial, you'll use Shopify Functions to create a new type of discount that does three things:

* Reduces the price of a cart line by 20%
* Discounts the order subtotal by 10%
* Provides free shipping

After creating the discount, you can test it out in your store.

Migrate your existing discount functions

To learn how to migrate your existing Discount Functions to use the [Discount API](https://shopify.dev/docs/api/functions/reference/discount), refer to [Migrate to the Discount API](https://shopify.dev/docs/apps/build/discounts/migrate-discount-api).

## [Anchor to What you'll learn](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#what-youll-learn)What you'll learn

In this tutorial, you'll learn how to do the following tasks:

* Use the Shopify CLI to add a Discount Function to an app
* Review the configuration of your discount function
* Review the input queries associated with your discount function
* Review the function logic associated with your discount function
* Use GraphiQL to create a discount and configure it to work with your function
* Test your discount function and view its logs

![A checkout summary that lists discounts for all three classes](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/apps/discounts/multi-class-DqNqJQCF.png)

## Requirements

[Create a Partner account](https://www.shopify.com/partners)

[Create a dev store](https://shopify.dev/docs/apps/tools/development-stores#create-a-development-store-to-test-your-app)

[Create an app](https://shopify.dev/docs/apps/getting-started/create)

Create an that has the `write_discounts` and `read_products` [access
scopes](https://shopify.dev/docs/api/usage/access-scopes), using the [latest version of Shopify CLI](https://shopify.dev/docs/api/shopify-cli#upgrade).

[Install Node.js](https://nodejs.org/en/download)

Install Node.js 22 or higher.

[You've installed rust](https://www.rust-lang.org/tools/install)

On Windows, Rust requires the [Microsoft C++ Build Tools](https://docs.microsoft.com/en-us/windows/dev-environment/rust/setup). Make sure to select the **Desktop development with C++** workload when installing the tools.

[You've installed the `wasm32-unknown-unknown` target](https://doc.rust-lang.org/rustc/platform-support/wasm32-unknown-unknown.html)

To ensure compatibility with the latest version of Rust, install the `wasm32-unknown-unknown` target.

## Project

Extension:

Rust JavaScript

![](https://shopify.dev/images/logos/Rust.svg)![](https://shopify.dev/images/logos/Rust-dark.svg)

Rust

[View on GitHub](https://github.com/Shopify/discounts-reference-app/blob/main/examples/rust/default)

## [Anchor to Create the Discount Function](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#create-the-discount-function)Create the Discount Function

To create a Discount Function, you'll use the Shopify CLI, which generates starter code for your Function.

1. Navigate to your app's directory:

   9

   1

   cd directory
2. Run the following command to create a new Discount Function:

   9

   1

   shopify app generate extension --template discount --name discount-function-rs
3. Choose the language that you want to use. For this tutorial, select `Rust`.

Info

Steps 2-4 review the generated code. To proceed directly to deploying and testing your Discount Function, jump to [Step 5](#update-your-apps-access-scopes).

## [Anchor to Review the Discount Function Configuration](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#review-the-discount-function-configuration)Review the Discount Function Configuration

The `shopify.extension.toml` file defines the Discount Function's metadata, targets, and build configuration.

### [Anchor to Metadata](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#metadata)Metadata

The `[[extensions]]` section defines the Function metadata. This includes the Function's handle, name, description, and type. The `name` and `description` are displayed on the **Discount** page of your Shopify admin.

Info

Shopify provides localization tools, and you can use them to localize the name and description of Discount Functions. To learn more, refer to [localizing your Shopify app](https://shopify.dev/docs/apps/build/localize-your-app).

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

api\_version = "2025-04"

[[extensions]]

name = "t:name"

handle = "discount-function-rs"

type = "function"

description = "t:description"

[[extensions.targeting]]

target = "cart.lines.discounts.generate.run"

input\_query = "src/cart\_lines\_discounts\_generate\_run.graphql"

export = "cart\_lines\_discounts\_generate\_run"

[[extensions.targeting]]

target = "cart.delivery-options.discounts.generate.run"

input\_query = "src/cart\_delivery\_options\_discounts\_generate\_run.graphql"

export = "cart\_delivery\_options\_discounts\_generate\_run"

[extensions.build]

command = "cargo build --target=wasm32-wasip1 --release"

path = "target/wasm32-wasip1/release/discount-function-rs.wasm"

watch = [ "src/\*\*/\*.rs" ]

### [Anchor to Targets](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#targets)Targets

The `[[extensions.targeting]]` sections define the Function targets. Each section includes a `target`, `input_query`, and `export` property.

The [`target`](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#targets) property defines where the Function is applied. The Discount API has two [`run` targets](https://shopify.dev/docs/api/functions/reference/discount/graphql):

* `cart.lines.discounts.generate.run` - The Function can apply discounts to cart lines and order subtotals.
* `cart.delivery-options.discounts.generate.run` - The Function can apply discounts to shipping rates.

The `input_query` property is the path to the Function's input query file. This file defines the Function's [input parameters](https://shopify.dev/docs/api/functions/reference/discount/graphql/input).

The `export` property specifies the build entrypoint that will run for a specified target. This will usually be the function name of your main export.

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

api\_version = "2025-04"

[[extensions]]

name = "t:name"

handle = "discount-function-rs"

type = "function"

description = "t:description"

[[extensions.targeting]]

target = "cart.lines.discounts.generate.run"

input\_query = "src/cart\_lines\_discounts\_generate\_run.graphql"

export = "cart\_lines\_discounts\_generate\_run"

[[extensions.targeting]]

target = "cart.delivery-options.discounts.generate.run"

input\_query = "src/cart\_delivery\_options\_discounts\_generate\_run.graphql"

export = "cart\_delivery\_options\_discounts\_generate\_run"

[extensions.build]

command = "cargo build --target=wasm32-wasip1 --release"

path = "target/wasm32-wasip1/release/discount-function-rs.wasm"

watch = [ "src/\*\*/\*.rs" ]

### [Anchor to Build configuration](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#build-configuration)Build configuration

The `[extensions.build]` section defines the build configuration for your Function. This includes the build `command`, the build `path` and a `watch` property which allows you to watch for changes to the Function. Refer to Shopify Functions [configuration properties](https://shopify.dev/docs/api/functions/latest#configuration) for more information.

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

api\_version = "2025-04"

[[extensions]]

name = "t:name"

handle = "discount-function-rs"

type = "function"

description = "t:description"

[[extensions.targeting]]

target = "cart.lines.discounts.generate.run"

input\_query = "src/cart\_lines\_discounts\_generate\_run.graphql"

export = "cart\_lines\_discounts\_generate\_run"

[[extensions.targeting]]

target = "cart.delivery-options.discounts.generate.run"

input\_query = "src/cart\_delivery\_options\_discounts\_generate\_run.graphql"

export = "cart\_delivery\_options\_discounts\_generate\_run"

[extensions.build]

command = "cargo build --target=wasm32-wasip1 --release"

path = "target/wasm32-wasip1/release/discount-function-rs.wasm"

watch = [ "src/\*\*/\*.rs" ]

## [Anchor to Review the input queries for your Function](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#review-the-input-queries-for-your-function)Review the input queries for your Function

[Input queries](https://shopify.dev/docs/apps/build/functions/input-output) are used to define the input that the Discount Function needs. The result of those queries will be given as input parameters to the export functions.

### [Anchor to [object Object], input](/docs/apps/build/discounts/build-discount-function?extension=rust#cart_lines_discounts_generate_rungraphql-input)`cart_lines_discounts_generate_run.graphql` input

The result of this query is provided as input to the `cart.lines.discounts.generate.run` target. Refer to [Discount API](https://shopify.dev/docs/api/functions/reference/discount) for more information about the input data available to your Function.

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

query Input {

cart {

lines {

id

cost {

subtotalAmount {

amount

}

}

}

}

discount {

discountClasses

}

}

### [Anchor to [object Object], input](/docs/apps/build/discounts/build-discount-function?extension=rust#cart_delivery_options_discounts_generate_rungraphql-input)`cart_delivery_options_discounts_generate_run.graphql` input

The result of this query is provided as input to the `cart.delivery-options.discounts.generate.run` Function. Refer to [Discount API](https://shopify.dev/docs/api/functions/reference/discount) for more information about the input data available to your Function.

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

query Input {

cart {

deliveryGroups {

id

}

}

discount {

discountClasses

}

}

## [Anchor to Review the logic of your Function](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#review-the-logic-of-your-function)Review the logic of your Function

To specify how a Discount Function should apply discounts, update its logic. This logic can make use of the input parameters provided to the Function, and should output discount operations.

Note

Your Function should only return operations for `discountClasses` that the discount applies to. For example, if the discount is configured to apply to `PRODUCT` and `ORDER`, but not `SHIPPING`, your Function should only return operations for `PRODUCT` and `ORDER`.

### [Anchor to Review your cart run Function logic](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#review-your-cart-run-function-logic)Review your cart run Function logic

This is the entry point for cart line and order subtotal discount calculation logic. The name must match the `export` property in the `[[extensions.targeting]]` section of your Function's configuration and must output [`CartOperations`](https://shopify.dev/docs/api/functions/reference/discount/graphql/common-objects/cartoperation).

In this example, the Function checks whether the discount applies to `PRODUCT` and `ORDER` and applies two discounts: 10% off the entire order subtotal, plus an additional 20% off the highest cart line subtotal.

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

58

59

60

61

62

63

64

65

66

67

68

69

70

71

72

73

74

75

76

77

78

79

80

81

82

83

use super::schema;

use shopify\_function::prelude::\*;

use shopify\_function::Result;

#[shopify\_function]

fn cart\_lines\_discounts\_generate\_run(

input: schema::cart\_lines\_discounts\_generate\_run::Input,

) -> Result<schema::CartLinesDiscountsGenerateRunResult> {

let max\_cart\_line = input

.cart()

.lines()

.iter()

.max\_by(|a, b| {

a.cost()

.subtotal\_amount()

.amount()

.partial\_cmp(b.cost().subtotal\_amount().amount())

.unwrap\_or(std::cmp::Ordering::Equal)

})

.ok\_or("No cart lines found")?;

let has\_order\_discount\_class = input

.discount()

.discount\_classes()

.contains(&schema::DiscountClass::Order);

let has\_product\_discount\_class = input

.discount()

.discount\_classes()

.contains(&schema::DiscountClass::Product);

if !has\_order\_discount\_class && !has\_product\_discount\_class {

return Ok(schema::CartLinesDiscountsGenerateRunResult { operations: vec![] });

}

let mut operations = vec![];

// Check if the discount has the ORDER class

if has\_order\_discount\_class {

operations.push(schema::CartOperation::OrderDiscountsAdd(

schema::OrderDiscountsAddOperation {

selection\_strategy: schema::OrderDiscountSelectionStrategy::First,

candidates: vec![schema::OrderDiscountCandidate {

targets: vec![schema::OrderDiscountCandidateTarget::OrderSubtotal(

schema::OrderSubtotalTarget {

excluded\_cart\_line\_ids: vec![],

},

)],

message: Some("10% OFF ORDER".to\_string()),

value: schema::OrderDiscountCandidateValue::Percentage(schema::Percentage {

value: Decimal(10.0),

}),

conditions: None,

associated\_discount\_code: None,

}],

},

));

}

// Check if the discount has the PRODUCT class

if has\_product\_discount\_class {

operations.push(schema::CartOperation::ProductDiscountsAdd(

schema::ProductDiscountsAddOperation {

selection\_strategy: schema::ProductDiscountSelectionStrategy::First,

candidates: vec![schema::ProductDiscountCandidate {

targets: vec![schema::ProductDiscountCandidateTarget::CartLine(

schema::CartLineTarget {

id: max\_cart\_line.id().clone(),

quantity: None,

},

)],

message: Some("20% OFF PRODUCT".to\_string()),

value: schema::ProductDiscountCandidateValue::Percentage(schema::Percentage {

value: Decimal(20.0),

}),

associated\_discount\_code: None,

}],

},

));

}

Ok(schema::CartLinesDiscountsGenerateRunResult { operations })

}

### [Anchor to Review your delivery run Function logic](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#review-your-delivery-run-function-logic)Review your delivery run Function logic

This is the entry point for shipping rate discount calculation logic. The name must match the `export` property in the `[[extensions.targeting]]` section of your Function's configuration and must output [`DeliveryOperations`](https://shopify.dev/docs/api/functions/reference/discount/graphql/common-objects/deliveryoperation).

In this example, the Function checks whether the discount applies to `SHIPPING` and reduces the first delivery group by 100%, offering free shipping.

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

use super::schema;

use shopify\_function::prelude::\*;

use shopify\_function::Result;

#[shopify\_function]

fn cart\_delivery\_options\_discounts\_generate\_run(

input: schema::cart\_delivery\_options\_discounts\_generate\_run::Input,

) -> Result<schema::CartDeliveryOptionsDiscountsGenerateRunResult> {

let has\_shipping\_discount\_class = input

.discount()

.discount\_classes()

.contains(&schema::DiscountClass::Shipping);

if !has\_shipping\_discount\_class {

return Ok(schema::CartDeliveryOptionsDiscountsGenerateRunResult { operations: vec![] });

}

let first\_delivery\_group = input

.cart()

.delivery\_groups()

.first()

.ok\_or("No delivery groups found")?;

Ok(schema::CartDeliveryOptionsDiscountsGenerateRunResult {

operations: vec![schema::DeliveryOperation::DeliveryDiscountsAdd(

schema::DeliveryDiscountsAddOperation {

selection\_strategy: schema::DeliveryDiscountSelectionStrategy::All,

candidates: vec![schema::DeliveryDiscountCandidate {

targets: vec![schema::DeliveryDiscountCandidateTarget::DeliveryGroup(

schema::DeliveryGroupTarget {

id: first\_delivery\_group.id().clone(),

},

)],

value: schema::DeliveryDiscountCandidateValue::Percentage(schema::Percentage {

value: Decimal(100.0),

}),

message: Some("FREE DELIVERY".to\_string()),

associated\_discount\_code: None,

}],

},

)],

})

}

## [Anchor to Update your app's access scopes](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#update-your-apps-access-scopes)Update your app's access scopes

You must request the `write_discounts` [access scope](https://shopify.dev/docs/api/usage/access-scopes) to give your app the permissions that it needs to create and update discounts.

In `shopify.app.toml`, located in the root of your app, add the `write_discounts` scope to the `access_scopes` array.

9

1

2

3

4

5

6

# This file stores configurations for your Shopify app.

# It must exist at the root of your app.

scopes = "write\_discounts"

name="Example Discount App"

### [Anchor to Start your app to preview changes](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#start-your-app-to-preview-changes)Start your app to preview changes

1. Save your updated configuration TOML file.
2. Start `app dev` if it's not already running:

   9

   1

   shopify app dev

   The configuration TOML file changes will be applied automatically on the development store.

Note

The `app dev` command automatically watches files that match the [build.watch](https://shopify.dev/docs/api/functions/configuration#properties) glob pattern. When it detects a change, it builds your Function and updates the Function extension's draft so that you can preview changes immediately.

## [Anchor to Create a discount in your store](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#create-a-discount-in-your-store)Create a discount in your store

In this step, you'll use GraphiQL, an in-browser tool for testing GraphQL, to create a discount that applies a line-item price adjustment, an order-wide percentage discount, and free shipping. Then you'll link this discount to the Function that you created.
GraphiQL is an in-browser tool for writing, validating, and testing GraphQL queries.

Info

You can also build a discount interface using [Admin UI Extensions](https://shopify.dev/docs/apps/build/discounts/build-ui-extension) and configure your Functions using [Metafields](https://shopify.dev/docs/api/functions/reference/discount/graphql/common-objects/metafield).

### [Anchor to Open the GraphiQL interface for the Shopify Admin API](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#open-the-graphiql-interface-for-the-shopify-admin-api)Open the GraphiQL interface for the Shopify Admin API

1. Open the GraphiQL interface by pressing `g` in the terminal window where you started your app.
2. On the GraphiQL interface, for **API Version**, select the latest stable release.

### [Anchor to Get the handle of your Function](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#get-the-handle-of-your-function)Get the handle of your Function

1. Use your function handle in GraphQL mutations instead of querying for the function ID.

   Your function handle is defined in `shopify.extension.toml` as `handle`:

   9

   1

   2

   3

   4

   5

   [[extensions]]

   name = "discount-function"

   handle = "discount-function-rs"

   type = "function"

   uid = "3d664979-ccd6-e9dd-4497-41289ece62373715032a"

   Note

   If you're upgrading to API version 2025-10 or later, you no longer need to query for function IDs. Use your stable function handle instead, which remains consistent across environments.

### [Anchor to Create the discount](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#create-the-discount)Create the discount

To create a discount in your store, use the [`discountAutomaticAppCreate`](https://shopify.dev/docs/api/admin-graphql/latest/mutations/discountAutomaticAppCreate) mutation.

1. For `functionHandle`, provide the Function handle from the [previous step](#get-the-handle-of-your-function).
2. Add the [`discountClasses`](https://shopify.dev/docs/api/functions/reference/discount/graphql/common-objects/discountclass) field to your mutation based on the business requirements.

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

mutation {

discountAutomaticAppCreate(

automaticAppDiscount: {

title: "Cart line, Order, Shipping discount"

functionHandle: "YOUR\_FUNCTION\_HANDLE\_HERE"

discountClasses: [PRODUCT, ORDER, SHIPPING]

startsAt: "2025-01-01T00:00:00"

}

) {

automaticAppDiscount {

discountId

}

userErrors {

field

message

}

}

}

Troubleshooting

If you receive a `Could not find Function` error, then confirm the following:

* `shopify app dev` is running.
* The function handle is correct.
* Your app has the `write_discounts` access scope.

## [Anchor to Test the Discount Function](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#test-the-discount-function)Test the Discount Function

### [Anchor to View your discount](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#view-your-discount)View your discount

In your Shopify admin, go to **Discounts**. You should now see the **Cart line, Order, and Shipping discount** that you created.

![A list of all active discounts for the store.](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/apps/discounts/functions-discount-list-multi-class-bMqqn_8b.png)

### [Anchor to Deactivate other discounts](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#deactivate-other-discounts)Deactivate other discounts

Deactivate or delete all other discounts, to ensure that the **Cart line, Order, and Shipping** discount is the only active discount.

### [Anchor to Build a cart](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#build-a-cart)Build a cart

Open your dev store and build a cart with a single item in it.

### [Anchor to Validate discount application](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#validate-discount-application)Validate discount application

On the cart page, you should see that your Discount Function has applied a discount to a cart line and the order subtotal.
Once you navigate to the checkout page and fill in your shipping address, you will see the discounts applied to the shipping rates.

![A checkout summary that shows cart line, subtotal, and shipping discounts](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/apps/discounts/multi-class-DqNqJQCF.png)

### [Anchor to Review the Function execution](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#review-the-function-execution)Review the Function execution

1. In the terminal where `shopify app dev` is running, review your Function executions.

   When [testing Functions on development stores](https://shopify.dev/docs/apps/build/functions/test-debug-functions#test-your-function-on-a-development-store), the `dev` output shows Function executions, debug logs you've added, and a link to a local file containing full execution details.
2. In a new terminal window, use the Shopify CLI command [`app function replay`](https://shopify.dev/docs/api/shopify-cli/app/app-function-replay) to [replay a Function execution locally](https://shopify.dev/docs/apps/build/functions/test-debug-functions#execute-the-function-locally-using-shopify-cli). This lets you debug your Function without triggering it again on Shopify.

   $

   $

   shopify app function replay
3. Select the Function execution from the top of the list. Press `q` to quit when you are finished debugging.

## [Anchor to Deploy your app](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#deploy-your-app)Deploy your app

When you're ready to release your changes to users, you can create and release an [app version](https://shopify.dev/docs/apps/launch/deployment/app-versions). An app version is a snapshot of your app configuration and all extensions.

1. Navigate to your app directory.
2. Run the following command.

   Optionally, you can provide a name or message for the version using the `--version` and `--message` flags.

   $

   $

   shopify app deploy

Releasing an app version replaces the current active version that's served to stores that have your app installed. It might take several minutes for app users to be upgraded to the new version.

Tip

If you want to create a version, but avoid releasing it to users, then run the `deploy` command with a `--no-release` flag.
You can release the unreleased app version using Shopify CLI's [`release`](https://shopify.dev/docs/api/shopify-cli/app/app-release) command, or through the Dev Dashboard.

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

api\_version = "2025-04"

[[extensions]]

name = "t:name"

handle = "discount-function-rs"

type = "function"

description = "t:description"

[[extensions.targeting]]

target = "cart.lines.discounts.generate.run"

input\_query = "src/cart\_lines\_discounts\_generate\_run.graphql"

export = "cart\_lines\_discounts\_generate\_run"

[[extensions.targeting]]

target = "cart.delivery-options.discounts.generate.run"

input\_query = "src/cart\_delivery\_options\_discounts\_generate\_run.graphql"

export = "cart\_delivery\_options\_discounts\_generate\_run"

[extensions.build]

command = "cargo build --target=wasm32-wasip1 --release"

path = "target/wasm32-wasip1/release/discount-function-rs.wasm"

watch = [ "src/\*\*/\*.rs" ]

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

query Input {

cart {

lines {

id

cost {

subtotalAmount {

amount

}

}

}

}

discount {

discountClasses

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

query Input {

cart {

deliveryGroups {

id

}

}

discount {

discountClasses

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

58

59

60

61

62

63

64

65

66

67

68

69

70

71

72

73

74

75

76

77

78

79

80

81

82

83

use super::schema;

use shopify\_function::prelude::\*;

use shopify\_function::Result;

#[shopify\_function]

fn cart\_lines\_discounts\_generate\_run(

input: schema::cart\_lines\_discounts\_generate\_run::Input,

) -> Result<schema::CartLinesDiscountsGenerateRunResult> {

let max\_cart\_line = input

.cart()

.lines()

.iter()

.max\_by(|a, b| {

a.cost()

.subtotal\_amount()

.amount()

.partial\_cmp(b.cost().subtotal\_amount().amount())

.unwrap\_or(std::cmp::Ordering::Equal)

})

.ok\_or("No cart lines found")?;

let has\_order\_discount\_class = input

.discount()

.discount\_classes()

.contains(&schema::DiscountClass::Order);

let has\_product\_discount\_class = input

.discount()

.discount\_classes()

.contains(&schema::DiscountClass::Product);

if !has\_order\_discount\_class && !has\_product\_discount\_class {

return Ok(schema::CartLinesDiscountsGenerateRunResult { operations: vec![] });

}

let mut operations = vec![];

// Check if the discount has the ORDER class

if has\_order\_discount\_class {

operations.push(schema::CartOperation::OrderDiscountsAdd(

schema::OrderDiscountsAddOperation {

selection\_strategy: schema::OrderDiscountSelectionStrategy::First,

candidates: vec![schema::OrderDiscountCandidate {

targets: vec![schema::OrderDiscountCandidateTarget::OrderSubtotal(

schema::OrderSubtotalTarget {

excluded\_cart\_line\_ids: vec![],

},

)],

message: Some("10% OFF ORDER".to\_string()),

value: schema::OrderDiscountCandidateValue::Percentage(schema::Percentage {

value: Decimal(10.0),

}),

conditions: None,

associated\_discount\_code: None,

}],

},

));

}

// Check if the discount has the PRODUCT class

if has\_product\_discount\_class {

operations.push(schema::CartOperation::ProductDiscountsAdd(

schema::ProductDiscountsAddOperation {

selection\_strategy: schema::ProductDiscountSelectionStrategy::First,

candidates: vec![schema::ProductDiscountCandidate {

targets: vec![schema::ProductDiscountCandidateTarget::CartLine(

schema::CartLineTarget {

id: max\_cart\_line.id().clone(),

quantity: None,

},

)],

message: Some("20% OFF PRODUCT".to\_string()),

value: schema::ProductDiscountCandidateValue::Percentage(schema::Percentage {

value: Decimal(20.0),

}),

associated\_discount\_code: None,

}],

},

));

}

Ok(schema::CartLinesDiscountsGenerateRunResult { operations })

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

use super::schema;

use shopify\_function::prelude::\*;

use shopify\_function::Result;

#[shopify\_function]

fn cart\_delivery\_options\_discounts\_generate\_run(

input: schema::cart\_delivery\_options\_discounts\_generate\_run::Input,

) -> Result<schema::CartDeliveryOptionsDiscountsGenerateRunResult> {

let has\_shipping\_discount\_class = input

.discount()

.discount\_classes()

.contains(&schema::DiscountClass::Shipping);

if !has\_shipping\_discount\_class {

return Ok(schema::CartDeliveryOptionsDiscountsGenerateRunResult { operations: vec![] });

}

let first\_delivery\_group = input

.cart()

.delivery\_groups()

.first()

.ok\_or("No delivery groups found")?;

Ok(schema::CartDeliveryOptionsDiscountsGenerateRunResult {

operations: vec![schema::DeliveryOperation::DeliveryDiscountsAdd(

schema::DeliveryDiscountsAddOperation {

selection\_strategy: schema::DeliveryDiscountSelectionStrategy::All,

candidates: vec![schema::DeliveryDiscountCandidate {

targets: vec![schema::DeliveryDiscountCandidateTarget::DeliveryGroup(

schema::DeliveryGroupTarget {

id: first\_delivery\_group.id().clone(),

},

)],

value: schema::DeliveryDiscountCandidateValue::Percentage(schema::Percentage {

value: Decimal(100.0),

}),

message: Some("FREE DELIVERY".to\_string()),

associated\_discount\_code: None,

}],

},

)],

})

}

9

1

2

3

4

5

6

# This file stores configurations for your Shopify app.

# It must exist at the root of your app.

scopes = "write\_discounts"

name="Example Discount App"

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

mutation {

discountAutomaticAppCreate(

automaticAppDiscount: {

title: "Cart line, Order, Shipping discount"

functionHandle: "YOUR\_FUNCTION\_HANDLE\_HERE"

discountClasses: [PRODUCT, ORDER, SHIPPING]

startsAt: "2025-01-01T00:00:00"

}

) {

automaticAppDiscount {

discountId

}

userErrors {

field

message

}

}

}

## [Anchor to Tutorial complete!](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#tutorial-complete)Tutorial complete!

You've successfully created a discount function using Shopify Functions. You can now use this Function to apply discounts targeting cart lines, order subtotals, and shipping rates.

---

### [Anchor to Next Steps](https://shopify.dev/docs/apps/build/discounts/build-discount-function?extension=rust#next-steps)Next Steps

[![](https://shopify.dev/images/icons/32/build.png)![](https://shopify.dev/images/icons/32/build-dark.png)

Build a UI extension to configure your discount Function

Add configuration to your discounts experience using metafields and build a user interface for your Function.

Build a UI extension to configure your discount Function

Add configuration to your discounts experience using metafields and build a user interface for your Function.](/docs/apps/build/discounts/build-ui-extension)

[Build a UI extension to configure your discount Function](https://shopify.dev/docs/apps/build/discounts/build-ui-extension)

[![](https://shopify.dev/images/icons/32/gear.png)![](https://shopify.dev/images/icons/32/gear-dark.png)

Build a React Router app to configure your discount Function

Add configuration to your discounts experience using metafields and build a user interface for your Function.

Build a React Router app to configure your discount Function

Add configuration to your discounts experience using metafields and build a user interface for your Function.](/docs/apps/build/discounts/build-ui-with-react-router)

[Build a React Router app to configure your discount Function](https://shopify.dev/docs/apps/build/discounts/build-ui-with-react-router)

[![](https://shopify.dev/images/icons/32/tutorial.png)![](https://shopify.dev/images/icons/32/tutorial-dark.png)

Add network access to your discount Function

Learn how to add network access to your discount Function to query an external system for discount code validation.

Add network access to your discount Function

Learn how to add network access to your discount Function to query an external system for discount code validation.](/docs/apps/build/discounts/network-access)

[Add network access to your discount Function](https://shopify.dev/docs/apps/build/discounts/network-access)

[![](https://shopify.dev/images/icons/32/tutorial.png)![](https://shopify.dev/images/icons/32/tutorial-dark.png)

Learn more about discount code rejections

Learn how to build a Discount Function that rejects invalid discount codes and displays custom error messages.

Learn more about discount code rejections

Learn how to build a Discount Function that rejects invalid discount codes and displays custom error messages.](/docs/apps/build/discounts/discount-rejections)

[Learn more about discount code rejections](https://shopify.dev/docs/apps/build/discounts/discount-rejections)

[![](https://shopify.dev/images/icons/32/gear.png)![](https://shopify.dev/images/icons/32/gear-dark.png)

Review the UX guidelines

Review the UX guidelines to learn how to implement discounts in user interfaces.

Review the UX guidelines

Review the UX guidelines to learn how to implement discounts in user interfaces.](/docs/apps/build/discounts/ux-for-discounts)

[Review the UX guidelines](https://shopify.dev/docs/apps/build/discounts/ux-for-discounts)

[![](https://shopify.dev/images/icons/32/app.png)![](https://shopify.dev/images/icons/32/app-dark.png)

Learn more about deploying app versions

Learn more about deploying app versions to Shopify

Learn more about deploying app versions

Learn more about deploying app versions to Shopify](/docs/apps/launch/deployment/deploy-app-versions)

[Learn more about deploying app versions](https://shopify.dev/docs/apps/launch/deployment/deploy-app-versions)

Was this page helpful?

YesNo
