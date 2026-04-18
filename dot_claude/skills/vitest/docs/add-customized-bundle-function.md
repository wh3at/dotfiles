---
title: "Add a customized bundle function"
source_url: "https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [Requirements](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#requirements)
* [Metafields versus line item properties](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#metafields-versus-line-item-properties)
* [Limitations](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#limitations)
* [Step 1: Generate a new extension](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-1-generate-a-new-extension)
* [Step 2: Define the input of your function](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-2-define-the-input-of-your-function)
* [Step 3: Define the business logic of your function](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-3-define-the-business-logic-of-your-function)
* [Step 4: Update your app access scopes](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-4-update-your-app-access-scopes)
* [Step 5: Create the cartTransform object](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-5-create-the-carttransform-object)
* [Step 6: Create metafield definition to store bundle components](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-6-create-metafield-definition-to-store-bundle-components)
* [Step 7: Create bundle products along with the components](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-7-create-bundle-products-along-with-the-components)
* [Step 8: Install the extension on a dev store](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-8-install-the-extension-on-a-dev-store)
* [Step 9: Preview the function](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-9-preview-the-function)
* [Step 10: Deploy the extension](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-10-deploy-the-extension)
* [Next steps](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#next-steps)

Customized bundles can be used by merchants to create complex product bundle offerings, such as letting customers mix and match items or select from a wider range of bundling options.

This guide shows you how to add a customized bundle using [Shopify Functions](https://shopify.dev/docs/api/functions/current).

# What you'll learn

In this tutorial, you'll learn how to do the following tasks:

* Set up your environment to use functions.
* Create a [`cart_transform` function](https://shopify.dev/docs/api/functions/reference/cart-transform).

---

## [Anchor to Requirements](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#requirements)Requirements

* You're a [user with app development permissions](https://shopify.dev/docs/apps/build/dev-dashboard/user-permissions).
* You've created a [development store](https://shopify.dev/docs/api/development-stores#create-a-development-store-to-test-your-app).
* You've [created an app](https://shopify.dev/docs/apps/build/scaffold-app) using Shopify CLI. If you previously installed Shopify CLI, then make sure that you're using the [latest version](https://shopify.dev/docs/api/shopify-cli#upgrade). If you plan to create a UI for your extension, then start with the [React Router app template](https://shopify.dev/docs/api#app-templates).
* You've installed [Node.js](https://nodejs.org/en/download) 16 or higher.
* You've [installed your app](https://shopify.dev/docs/apps/build/scaffold-app#step-3-install-your-app-on-your-development-store) on the development store.

* You're familiar with the [Cart Transform Function API](https://shopify.dev/docs/api/functions/reference/cart-transform).

* You're using API version 2025-07 or higher for your function.

### [Anchor to Rust-specific requirements](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#rust-specific-requirements)Rust-specific requirements

The following requirements are specific to Rust-based development with Shopify Functions.

* You've installed [Rust](https://www.rust-lang.org/tools/install).

  On Windows, Rust requires the [Microsoft C++ Build Tools](https://docs.microsoft.com/en-us/windows/dev-environment/rust/setup). Make sure to select the **Desktop development with C++** workload when installing the tools.
* You've installed the [`wasm32-unknown-unknown` target](https://doc.rust-lang.org/rustc/platform-support/wasm32-unknown-unknown.html):

  $

  $

  rustup target add wasm32-unknown-unknown

---

## [Anchor to Metafields versus line item properties](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#metafields-versus-line-item-properties)Metafields versus line item properties

When you build custom bundles with cart transforms, you can store bundle data using metafields or line item properties. Choose metafields when you need secure, merchant-defined bundles with fixed compositions. Choose line item properties when you need flexible, buyer-customizable bundles, but ensure you implement proper validation and don't rely solely on the properties for critical business logic.

|  |  |  |
| --- | --- | --- |
|  | Metafields | Line item properties |
| Best for | Fixed bundles where the bundle composition is predetermined by the merchant | Mix-and-match bundles where buyers can customize the bundle composition |
| Pros | * More secure as metafield data cannot be modified by the browser * Bundles with a fixed-set of merchant defined components means you know exactly what each bundle contains and don't need to validate that the bundle contains permitted variants and quantities selected | * Enables dynamic bundle creation based on buyer selections * Supports mix-and-match functionality without predefined variants * Allows buyers to customize quantities and variants within a bundle * More flexible for complex bundle configurations |
| Cons | * Buyers cannot pick and choose the quantities or variants unless those combinations are pre-defined * Requires creating and managing metafield definitions * Each bundle variation needs to be predefined as a separate product variant | * Line item properties can be modified by the browser, so they should not be relied upon for security or validation purposes * Requires additional validation logic in your cart transform function * May need extra UI components to manage bundle selections |

---

## [Anchor to Limitations](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#limitations)Limitations

* A bundle can have up to 150 components.
* Bundles can have up to three options. Combined options are considered one option.
* You can't combine quantity options.
* After an app has assigned components to a bundle, only that app can manage the components of the bundle.
* Nested bundles aren't supported. A bundle can't have components and be part of another bundle simultaneously.

---

## [Anchor to Step 1: Generate a new extension](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-1-generate-a-new-extension)Step 1: Generate a new extension

To create a cart transform extension, you can use Shopify CLI, which generates starter code for building your extension and automates common development tasks.

1. Navigate to your app directory:

   $

   $

   cd <directory>
2. Run the following command to create the app extension:

   $

   $

   shopify app generate extension --template cart\_transform --name demo-cart-transform-extension

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

4. Navigate to `extensions/demo-cart-transform-extension`:

   $

   $

   cd extensions/demo-cart-transform-extension

---

## [Anchor to Step 2: Define the input of your function](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-2-define-the-input-of-your-function)Step 2: Define the input of your function

`run.graphql` defines the input for the function [`target`](https://shopify.dev/docs/api/functions/reference/cart-transform/graphql#extension-targets).
The following example shows an input that retrieves information about buyer's cart like merchandise, quantity etc.

Replace the contents of `src/run.graphql` file with the following code.

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

lines {

id

quantity

merchandise {

\_\_typename

... on ProductVariant {

id

component\_reference: metafield(

namespace: "custom"

key: "component\_reference"

) {

jsonValue

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

23

24

25

26

27

{

"cart": {

"lines": [

{

"id": "gid://shopify/CartLine/1",

"quantity": 1,

"merchandise": {

"\_\_typename": "ProductVariant",

"id": "gid://shopify/ProductVariant/1099",

"title": "Something not bundled"

}

},

{

"id": "gid://shopify/CartLine/4",

"quantity": 9,

"merchandise": {

"\_\_typename": "ProductVariant",

"id": "gid://shopify/ProductVariant/1111",

"title": "A neat bundle",

"component\_reference": {

"jsonValue": ["gid://shopify/ProductVariant/111","gid://shopify/ProductVariant/222"]

}

}

}

]

}

}

The [`Function API references`](https://shopify.dev/docs/api/functions/reference/cart-transform/graphql/input) provide information on the available fields for the input query.

Note

`CartTransform` only supports a subset of cart fields. For the list of supported cart fields, refer to the [`cart`](https://shopify.dev/docs/api/functions/reference/cart-transform/graphql/common-objects/cart) input field.

---

## [Anchor to Step 3: Define the business logic of your function](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-3-define-the-business-logic-of-your-function)Step 3: Define the business logic of your function

In this example, our function will output expand operations for cart lines where merchandise has a metafield referencing other bundle components.

Replace the contents of `src/main.rs` file with the following code.

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

use shopify\_function::prelude::\*;

use std::process;

pub mod run;

#[typegen("schema.graphql")]

pub mod schema {

#[query("src/run.graphql", custom\_scalar\_overrides = {

"Input.cart.lines.merchandise.component\_reference.jsonValue" => super::run::ComponentReferences,

})]

pub mod run {}

}

fn main() {

log!("Please invoke a named export.");

process::abort();

}

Replace the contents of `src/run.rs` file with the following code.

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

use super::schema;

use std::borrow::Cow;

use shopify\_function::prelude::\*;

use shopify\_function::Result;

#[shopify\_function]

fn run(input: schema::run::Input) -> Result<schema::CartTransformRunResult> {

let cart\_operations: Vec<schema::Operation> = get\_expand\_cart\_operations(&input.cart());

Ok(schema::CartTransformRunResult {

operations: cart\_operations,

})

}

// expand operation logic

fn get\_expand\_cart\_operations(cart: &schema::run::input::Cart) -> Vec<schema::Operation> {

let mut result: Vec<schema::Operation> = Vec::new();

for line in cart.lines().iter() {

let variant = match &line.merchandise() {

schema::run::input::cart::lines::Merchandise::ProductVariant(variant) => Some(variant),

\_ => None,

};

if variant.is\_none() {

continue;

}

if let Some(merchandise) = &variant {

let component\_references = get\_component\_references(&merchandise);

if component\_references.is\_empty() {

continue;

}

let mut expand\_relationships: Vec<schema::ExpandedItem> = Vec::new();

for reference in component\_references.iter() {

let expand\_relationship = schema::ExpandedItem {

merchandise\_id: reference.clone(),

quantity: 1,

price: None,

attributes: None,

};

expand\_relationships.push(expand\_relationship);

}

let expand\_operation = schema::LineExpandOperation {

cart\_line\_id: line.id().clone(),

expanded\_cart\_items: expand\_relationships,

price: None,

image: None,

title: None,

};

result.push(schema::CartOperation::Expand(expand\_operation));

}

}

return result;

}

pub type ComponentReferences = Vec<schema::Id>;

fn get\_component\_references(

variant: &schema::run::input::cart::lines::merchandise::ProductVariant,

) -> Cow<[schema::Id]> {

if let Some(component\_reference\_metafield) = &variant.component\_reference() {

return component\_reference\_metafield.json\_value().into();

}

return Vec::new().into();

}

Tip

Explore more examples in the [`function-examples` repository](https://github.com/Shopify/function-examples/tree/main/sample-apps).

---

## [Anchor to Step 4: Update your app access scopes](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-4-update-your-app-access-scopes)Step 4: Update your app access scopes

You need to request the `write_cart_transforms` and `write_products` [access scopes](https://shopify.dev/docs/api/usage/access-scopes) to run the mutations in this guide.

1. In `shopify.app.toml` in the root of your app, add the `write_cart_transforms` scope.

   9

   1

   2

   3

   # This file stores configurations for your Shopify app.

   scopes = "write\_cart\_transforms,write\_products"
2. Save your configuration file. If [`app dev`](https://shopify.dev/docs/api/shopify-cli/app/app-dev) is running, the scope changes will be applied automatically. If not, start the command:

   $

   $

   shopify app dev

---

## [Anchor to Step 5: Create the cartTransform object](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-5-create-the-carttransform-object)Step 5: Create the cartTransform object

To activate your function, create a [`cartTransform`](https://shopify.dev/docs/api/admin-graphql/unstable/objects/CartTransform)
object on the store where you installed your app. You can do this using the [`cartTransformCreate`](https://shopify.dev/docs/api/admin-graphql/unstable/mutations/cartTransformCreate) GraphQL mutation.

Note

You can use [curl](https://shopify.dev/docs/api/admin-graphql) to make following GraphQL requests.
Only use the access token of the app for which you are building this extension.

1. Use your function handle in GraphQL mutations instead of querying for the function ID.

   Your function handle is defined in `shopify.extension.toml` as `handle`:

   9

   1

   2

   3

   4

   5

   [[extensions]]

   name = "your-cart-transform-name"

   handle = "your-function-handle"

   type = "function"

   uid = "3d664979-ccd6-e9dd-4497-41289ece62373715032a"

   Note

   If you're upgrading to API version 2025-10 or later, you no longer need to query for function IDs. Use your stable function handle instead, which remains consistent across environments.

1. Run the following mutation. Replace `YOUR_FUNCTION_HANDLE_HERE` with the handle of your function:

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

   mutation {

   cartTransformCreate(functionHandle: "YOUR\_FUNCTION\_HANDLE\_HERE") {

   cartTransform {

   id

   functionId

   }

   userErrors {

   field

   message

   }

   }

   }

   You should receive a GraphQL response that includes the ID of the new `cartTransform` object.

   Tip

   If you receive a `Could not find Function` error, then confirm the following:

   * `shopify app dev` is running.
   * The function handle is correct.
   * Your app has the `write_cart_transforms` access scope.

---

## [Anchor to Step 6: Create metafield definition to store bundle components](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-6-create-metafield-definition-to-store-bundle-components)Step 6: Create metafield definition to store bundle components

9

1

2

3

4

5

6

7

mutation definitionCreate($definition: MetafieldDefinitionInput!) {

metafieldDefinitionCreate(definition: $definition){

createdDefinition {

id

}

}

}

9

1

2

3

4

5

6

7

8

9

{

"definition": {

"key": "component\_reference",

"type": "list.variant\_reference",

"namespace": "custom",

"name": "bundle component reference",

"ownerType": "PRODUCTVARIANT"

}

}

---

## [Anchor to Step 7: Create bundle products along with the components](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-7-create-bundle-products-along-with-the-components)Step 7: Create bundle products along with the components

In this tutorial, we will take the example of a meal bundle which contains a burger and fries.

Note

You can use [curl](https://shopify.dev/docs/api/admin-graphql) to make following GraphQL requests.
Only use access token of the app for which you are building this extension.

1. Create bundle component products, i.e. burger and fries.

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

   mutation($productInput: ProductInput!) {

   productCreate(input: $productInput) {

   product {

   variants(first: 1) {

   edges {

   node {

   id

   }

   }

   }

   }

   }

   }

   9

   1

   2

   3

   4

   5

   6

   7

   {

   "productInput": {

   "status": "ACTIVE",

   "published": true,

   "title": "Burger"

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

   mutation($productInput: ProductInput!) {

   productCreate(input: $productInput) {

   product {

   variants(first: 1) {

   edges {

   node {

   id

   }

   }

   }

   }

   }

   }

   9

   1

   2

   3

   4

   5

   6

   7

   {

   "productInput": {

   "status": "ACTIVE",

   "published": true,

   "title": "Fries"

   }

   }
2. Create a bundle parent product, i.e. Meal Bundle. This example sets [`requires_components`](https://shopify.dev/docs/api/admin-graphql/unstable/objects/ProductVariant#field-productvariant-requiresComponents) on the variant of the bundle to `true`. This is required when the variants is meant to be sold as a bundle only. It prevents the variant from being sold as a regular product in case the function doesn't output an operation. For example, the variant `Meal Bundle` should always be sold as a bundle with components and not as a regular product.

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

   mutation($productInput: ProductInput!) {

   productCreate(input: $productInput) {

   product {

   variants(first: 1) {

   edges {

   node {

   id

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

   23

   {

   "productInput": {

   "status": "ACTIVE",

   "published": true,

   "title": "Meal Bundle",

   "variants": [

   {

   "requiresComponents": true,

   "metafields": [

   {

   "namespace": "custom",

   "key": "component\_reference",

   "type": "list.variant\_reference",

   "value": "[\"gid://shopify/ProductVariant/BURGER\_VARIANT\_ID\", \"gid://shopify/ProductVariant/FRIES\_VARIANT\_ID\"]"

   }

   ]

   }

   ],

   "claimOwnership": {

   "bundles": true

   }

   }

   }

Note

We are claiming the ownership of the bundle parent product here. This is required if you need to render the [product configuration extension](https://shopify.dev/docs/apps/build/product-merchandising/bundles/product-configuration-extension/add-merchant-config-ui) in admin.

---

## [Anchor to Step 8: Install the extension on a dev store](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-8-install-the-extension-on-a-dev-store)Step 8: Install the extension on a dev store

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

## [Anchor to Step 9: Preview the function](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-9-preview-the-function)Step 9: Preview the function

Follow the steps below to test your function on your dev store.

1. Navigate to your online storefront.
2. Add the meal bundle product to your cart.
3. Navigate to checkout.
4. You will now see that your meal bundle product is converted into a bundle which includes a burger and fries.

![An image showing a checkout including customized bundle.](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/images/apps/bundles/function-customized-bundle-checkout-CUpBJVMr.png)

---

## [Anchor to Step 10: Deploy the extension](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-10-deploy-the-extension)Step 10: Deploy the extension

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

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#next-steps)Next steps

* Learn how to [add a product configuration extension for bundles](https://shopify.dev/docs/apps/build/product-merchandising/bundles/product-configuration-extension/add-merchant-config-ui) in the Shopify admin.
* Learn how to use [variables](https://shopify.dev/docs/apps/build/functions/input-queries/use-variables-input-queries) in your input query.

---

Was this page helpful?

YesNo

* [Requirements](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#requirements)
* [Metafields versus line item properties](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#metafields-versus-line-item-properties)
* [Limitations](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#limitations)
* [Step 1: Generate a new extension](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-1-generate-a-new-extension)
* [Step 2: Define the input of your function](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-2-define-the-input-of-your-function)
* [Step 3: Define the business logic of your function](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-3-define-the-business-logic-of-your-function)
* [Step 4: Update your app access scopes](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-4-update-your-app-access-scopes)
* [Step 5: Create the cartTransform object](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-5-create-the-carttransform-object)
* [Step 6: Create metafield definition to store bundle components](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-6-create-metafield-definition-to-store-bundle-components)
* [Step 7: Create bundle products along with the components](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-7-create-bundle-products-along-with-the-components)
* [Step 8: Install the extension on a dev store](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-8-install-the-extension-on-a-dev-store)
* [Step 9: Preview the function](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-9-preview-the-function)
* [Step 10: Deploy the extension](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#step-10-deploy-the-extension)
* [Next steps](https://shopify.dev/docs/apps/build/product-merchandising/bundles/add-customized-bundle-function#next-steps)
