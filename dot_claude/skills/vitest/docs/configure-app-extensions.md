---
title: "Configure app extensions"
source_url: "https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [How it works](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#how-it-works)
* [Extension types](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#extension-types)
* [Targets](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#targets)
* [Common properties](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#common-properties)
* [Extension-specific properties](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#extension-specific-properties)
* [Differences in TOML file names](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#differences-in-toml-file-names)

When you [generate an app extension](https://shopify.dev/docs/api/shopify-cli/app/app-generate-extension), a TOML configuration file named `shopify.extension.toml` is automatically generated in your app's extension directory.

Some extension types use different TOML structures and are documented in other topics:

* [Post-purchase UI](https://shopify.dev/docs/api/checkout-extensions/post-purchase/configuration)
* [Product subscription](https://shopify.dev/docs/apps/build/purchase-options/product-subscription-app-extensions/start-building)
* [Shopify Functions](https://shopify.dev/docs/api/functions/latest#configuration)
* [Theme app extensions](https://shopify.dev/docs/apps/build/online-store/theme-app-extensions/build)
* [Web pixel](https://shopify.dev/docs/apps/build/marketing-analytics/build-web-pixels)

---

## [Anchor to How it works](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#how-it-works)How it works

[Shopify CLI](https://shopify.dev/docs/apps/build/cli-for-apps) builds and serves app extensions using information defined in a TOML file named `shopify.extension.toml`. The TOML file is located in a directory within the [`extensions/` directory](https://shopify.dev/docs/apps/build/cli-for-apps/app-structure#directory-structure) of your app project.

The following example shows a `shopify.extension.toml` file that contains configuration settings for a [checkout UI extension](https://shopify.dev/docs/api/checkout-ui-extensions).

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

api\_version = "2025-10"

[[extensions]]

name = "My UI extension"

description = "A UI extension"

handle = "my-ui-extension"

type = "ui\_extension"

uid = "1aafc25d-8448-218e-9373-b3d91ac2a0af75f73e12"

[extensions.capabilities]

api\_access = true

block\_progress = true

network\_access = true

[[extensions.targeting]]

module = "./src/CheckoutDynamicRender.js"

target = "purchase.checkout.block.render"

[[extensions.targeting.metafields]]

key = "my-key"

namespace = "my-namespace"

[settings]

[[settings.fields]]

key = "banner\_title"

type = "single\_line\_text\_field"

name = "Banner title"

description = "Enter a title for the banner"

---

## [Anchor to Extension types](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#extension-types)Extension types

Some extensions require specific configurations. To accommodate this, Shopify CLI groups extensions into different types in the TOML file:

| Extension | `type` value in the TOML file | `--template` flag value in the generate command |
| --- | --- | --- |
| [Admin action](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action) | `ui_extension` | `admin_action` |
| [Admin block](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block) | `ui_extension` | `admin_block` |
| [Customer Account UI](https://shopify.dev/docs/api/customer-account-ui-extensions) | `ui_extension` | `customer_account_ui` |
| [Checkout UI](https://shopify.dev/docs/api/checkout-ui-extensions) | `ui_extension` | `checkout_ui` |
| [Editor extension collection](https://shopify.dev/docs/apps/build/customer-accounts/editor-extension-collections) | `editor_extension_collection` | `editor_extension_collection` |
| [Product configuration](https://shopify.dev/docs/apps/build/product-merchandising/bundles/product-configuration-extension/add-merchant-config-ui) | `ui_extension` | `product_configuration` |
| [Shopify Flow action](https://shopify.dev/docs/apps/build/flow/actions) | `flow_action` | `flow_action` |
| [Shopify Flow template](https://shopify.dev/docs/apps/build/flow/templates) | `flow_template` | `flow_template` |
| [Shopify Flow trigger](https://shopify.dev/docs/apps/build/flow/triggers) | `flow_trigger` | `flow_trigger` |
| [POS UI](https://shopify.dev/docs/api/pos-ui-extensions) | `ui_extension` | `pos_ui` |
| [Functions](https://shopify.dev/docs/api/functions) | `function` | Varies by [Functions API](https://shopify.dev/docs/api/functions) |

---

## [Anchor to Targets](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#targets)Targets

A target is an identifier in `shopify.extension.toml` that specifies where you're injecting code into Shopify APIs, or other parts of the Shopify platform.

Each target is composed of three to four namespaces. The name begins with a broad Shopify context and ends with the behavior of the extensible element. For example, a checkout UI extension that renders a shipping address form has a target named `purchase.checkout.delivery-address.render-before`:

* `purchase`: The broad Shopify context.
* `checkout`: The targeted page.
* `delivery-address`: The element that the extension will be positioned near.
* `render-before`: An action verb that describes the behavior of the extensible element.

### [Anchor to Supported targets](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#supported-targets)Supported targets

The following table provides links to documentation on the supported targets associated with each app extension type.

| Extension type | Documentation on supported targets |
| --- | --- |
| Admin UI | [Admin UI targets](https://shopify.dev/docs/api/admin-extensions/extension-targets) |
| Checkout UI | [Checkout UI targets](https://shopify.dev/docs/api/checkout-ui-extensions/current/targets) |
| Customer Account UI | [Customer Account UI targets](https://shopify.dev/docs/api/customer-account-ui-extensions/targets) |
| POS UI | [POS UI targets](https://shopify.dev/docs/api/pos-ui-extensions/extension-targets-overview) |
| Product configuration | Product configuration app extensions use the [admin.product-details.configuration.render](https://shopify.dev/docs/api/admin-extensions/extension-targets#extensiontargets-propertydetail-adminproductdetailsconfigurationrender) or [admin.product-variant-details.configuration.render](https://shopify.dev/docs/api/admin-extensions/extension-targets#extensiontargets-propertydetail-adminproductvariantdetailsconfigurationrender) target. |
| Functions | [Functions targets](https://shopify.dev/docs/api/functions/latest#function-extension-target-types) |

---

## [Anchor to Common properties](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#common-properties)Common properties

This section describes the configuration settings in `shopify.extension.toml` that are common to [Checkout UI](https://shopify.dev/docs/apps/build/checkout/technologies), [Admin UI](https://shopify.dev/docs/api/admin-extensions), [product configuration](https://shopify.dev/docs/apps/build/product-merchandising/bundles/product-configuration-extension/add-merchant-config-ui), [Shopify Flow triggers](https://shopify.dev/docs/apps/build/flow/triggers), [Shopify Flow actions](https://shopify.dev/docs/apps/build/flow/actions), and [Shopify Flow templates](https://shopify.dev/docs/apps/build/flow/templates) extensions.

Note

[POS UI extensions](https://shopify.dev/docs/api/pos-ui-extensions) only support the required properties listed in the table.

| Property | Description |
| --- | --- |
| `api_version` | The version of the API that's being used for the extension. If provided in the `[[extensions]]` array, then the specified API version is used instead of the root level `api_version`. |
| `[[extensions]]` | The name of the array that contains all extensions listed in the TOML file. Contains the following properties: |
| `[settings]` optional | The name of the array that defines settings that a merchant can set values for. If provided in the `[[extensions]]` array, then the specified settings are used instead of the root level `settings`. |
| `[[settings.fields]]` optional | The name of the array that contains the [settings fields](https://shopify.dev/docs/api/checkout-ui-extensions/latest/configuration#settings-definition). |
| `[[extensions.targeting]]` required | The name of the array that contains a target and path to the related extension code. Contains the following required properties:   * `target`:required An identifier that specifies where you're injecting code into Shopify APIs, or other parts of the Shopify platform. For more information, refer to [Targets](#targets). * `module`:required The file that contains the extension code. |

---

## [Anchor to Extension-specific properties](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#extension-specific-properties)Extension-specific properties

This section describes the configuration settings in `shopify.extension.toml` that are specific to the following extensions:

* [Checkout UI extensions](#checkout-ui-extensions)
* [Customer Account UI extensions](#customer-account-ui-extensions)
* [Editor extension collection](#editor-extension-collection)
* [Admin UI extensions](#admin-ui-extensions)
* [Product configuration extensions](#product-configuration-extensions)
* [Shopify Flow actions](#shopify-flow-actions)
* [Shopify Flow triggers](#shopify-flow-triggers)
* [Shopify Flow templates](#shopify-flow-templates)

### [Anchor to Checkout UI extensions](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#checkout-ui-extensions)Checkout UI extensions

The following example TOML file contains configuration settings for a [checkout UI extension](https://shopify.dev/docs/api/checkout-ui-extensions):

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

api\_version = "2025-10"

[[extensions]]

name = "My UI extension"

description = "A UI extension"

handle = "my-ui-extension"

type = "ui\_extension"

uid = "1aafc25d-8448-218e-9373-b3d91ac2a0af75f73e12"

[extensions.capabilities]

api\_access = true

block\_progress = true

network\_access = true

[[extensions.targeting]]

module = "./src/CheckoutDynamicRender.js"

target = "purchase.checkout.block.render"

default\_placement = "WALLETS1"

[[extensions.targeting.metafields]]

key = "my-key"

namespace = "my-namespace"

[settings]

[[settings.fields]]

key = "banner\_title"

type = "single\_line\_text\_field"

name = "Banner title"

description = "Enter a title for the banner"

The following table describes the properties in the TOML file that are specific to checkout UI extensions:

| Property | Description |
| --- | --- |
| `[extensions.capabilities]` | The name of the array that contains the checkout UI extension's capabilities:  * `api_access`:optional Whether your app extension can [query the Storefront API](https://shopify.dev/docs/api/checkout-ui-extensions/latest/configuration#api-access). * `block_progress`:optional Whether your app extension can [block the customer's progress](https://shopify.dev/docs/api/checkout-ui-extensions/latest/configuration#block-progress). * `network_access`:optional Whether your app extension can make [external network calls](https://shopify.dev/docs/api/checkout-ui-extensions/latest/configuration#network-access). |
| `[extensions.metafields]` | An array that sets the default for each `[[extensions.targeting.metafields]]`, if `[[extensions.targeting.metafields]]` isn't specified. |
| `[[extensions.targeting.metafields]]` | The [metafields](https://shopify.dev/docs/api/checkout-ui-extensions/latest/targets/block/purchase-thank-you-block-render#standardapi-propertydetail-metafields) that your extension target needs to read:  * `key`:optional The name for the metafield. * `namespace`:optional A container for a group of metafields. Grouping metafields within a namespace prevents your metafields from conflicting with other metafields with the same key name.  You can specify up to five `key` and `namespace` pairs in the configuration file. When the extension is executed, Shopify looks for the metafields in each resource and returns their contents. |
| `[[extensions.targeting.default_placement]]` | Defines which location of a block extension target an extension is placed in when added. After adding the extension, the merchant can move it to other locations. Value must be a checkout [block extension target](https://shopify.dev/docs/apps/build/checkout/test-checkout-ui-extensions#block-extension targets). |

### [Anchor to Customer account UI extensions](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#customer-account-ui-extensions)Customer account UI extensions

The following example TOML files contain configuration settings for [a static and a full page extension](https://shopify.dev/docs/api/customer-account-ui-extensions/extension-targets-overview). The properties in the TOML files are similar to [checkout UI extensions](#checkout-ui-extensions):

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

api\_version = "2025-10"

[[extensions]]

type = "ui\_extension"

uid = "9ebaa5f0-a0d8-25bf-6290-c55f579e4dfac7c7fcd2"

name = "customer-account-ui"

handle = "customer-account-ui"

[[extensions.targeting]]

module = "./src/CustomerAccountOrderIndexExtension.tsx"

target = "customer-account.order-index.block.render"

default\_placement = "ORDER\_INDEX"

[[extensions.targeting]]

module = "./src/CustomerAccountExtensionFullPage.tsx"

target = "customer-account.page.render"

The following table describes the properties in the TOML file that are specific to customer account UI extensions:

| Property | Description |
| --- | --- |
| `[extensions.capabilities]` | The name of the array that contains the checkout UI extension's capabilities:  * `api_access`: Whether your app extension can [query the Storefront API](https://shopify.dev/docs/api/customer-account-ui-extensions/configuration#api-access). * `network_access`: Whether your app extension can make [external network calls](https://shopify.dev/docs/api/customer-account-ui-extensions/configuration#network-access). |
| `[extensions.metafields]` | An array that sets the default for each `[[extensions.targeting.metafields]]`, if `[[extensions.targeting.metafields]]` isn't specified. |
| `[[extensions.targeting.metafields]]` | The [metafields](https://shopify.dev/docs/api/customer-account-ui-extensions/latest/targets/order-status/customer-account-order-status-block-render#orderstatusapi-propertydetail-metafields) that your extension target needs to read:  * `key`: The name for the metafield. * `namespace`: A container for a group of metafields. Grouping metafields within a namespace prevents your metafields from conflicting with other metafields with the same key name.  You can specify up to five `key` and `namespace` pairs in the configuration file. When the extension is executed, Shopify looks for the metafields in each resource and returns their contents. |
| `[[extensions.targeting.default_placement]]` | Defines which location of a block extension target an extension is placed in when added. After adding the extension, the merchant can move it to other locations. Value must be one of the [customer account placements](https://shopify.dev/docs/apps/build/customer-accounts/extension-placement#define-default-placement) for the block extension target. |

### [Anchor to Editor extension collection](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#editor-extension-collection)Editor extension collection

The following example TOML files contain configuration settings for an [editor extension collection](https://shopify.dev/docs/apps/build/customer-accounts/editor-extension-collections):

9

1

2

3

4

5

6

[[extensions]]

name = "t:collection\_name"

type = "editor\_extension\_collection"

uid = "8723da04-b91d-e812-2091-52c161b3b2892fa89479"

handle = "editor-extension-collection"

includes=["customer-account-ui", "checkout-ui-extension"]

The following table describes the properties in the TOML file that are specific to editor extension collections:

| Property | Required? | Description |
| --- | --- | --- |
| `[extensions.includes]` | Yes | An array that sets the supported extensions that belong in the editor extension collection. |

### [Anchor to Admin UI extensions](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#admin-ui-extensions)Admin UI extensions

The following example TOML files contain configuration settings for [an action and a block extension](https://shopify.dev/docs/apps/build/admin/actions-blocks). The properties in the TOML files are similar to [checkout UI extensions](#checkout-ui-extensions):

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

api\_version = "2025-10"

[[extensions]]

name = "My feature"

handle = "action-extension"

type = "ui\_extension"

uid = "3e9ce641-7624-b901-fdef-cc194f77a8720c5af6e5"

[[extensions.targeting]]

module = "actionExtension.jsx"

target = "admin.product.item.action.render"

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

api\_version = "2025-10"

[[extensions]]

name = "My block extension"

handle = "block-extension"

type = "ui\_extension"

uid = "f62f100d-15e6-9866-eda9-23f99de4b5d26e347042"

[[extensions.targeting]]

module = "blockExtension.jsx"

target = "admin.product.item.block.render"

### [Anchor to Product configuration extensions](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#product-configuration-extensions)Product configuration extensions

The following example TOML file contains configuration settings for a [product configuration extension](https://shopify.dev/docs/apps/build/product-merchandising/bundles/product-configuration-extension/add-merchant-config-ui). The properties in the TOML file are similar to a [checkout UI extension](#checkout-ui-extensions):

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

api\_version = "2025-10"

[[extensions]]

name = "My product config extension"

handle = "my-product-config-extension"

type = "ui\_extension"

uid = "8a8e0c98-1efb-7556-dfbb-04bdcfea1662b066ab00"

[[extensions.targeting]]

module = "./src/ProductDetailsConfigurationExtension.tsx"

target = "admin.product-details.configuration.render"

[[extensions.targeting]]

module = "./src/ProductVariantDetailsConfigurationExtension.tsx"

target = "admin.product-variant-details.configuration.render"

### [Anchor to Shopify Flow actions](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#shopify-flow-actions)Shopify Flow actions

The following example TOML file contains configuration settings for a [Shopify Flow action](https://shopify.dev/docs/apps/build/flow/actions):

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

[[extensions]]

name = "Send email action"

description = "Send an email to a customer."

handle = "send-email-action"

type = "flow\_action"

uid = "e75268dd-a0bf-45f9-2c95-b988a06f307920b6602c"

runtime\_url = "https://runtime-endpoint.com"

schema = "./schema.graphql"

return\_type\_ref = "EmailDelivered"

validation\_url = "https://validation-url"

config\_page\_url = "https://url.com/config"

config\_page\_preview\_url = "https://url.com/config/preview"

[settings]

[[settings.fields]]

description = "The email address to send to"

key = "email\_address"

name = "Email address"

type = "single\_line\_text\_field"

required = true

[[settings.fields]]

description = "The subject of the email"

key = "subject"

name = "Subject"

type = "single\_line\_text\_field"

required = true

[[settings.fields]]

description = "The body of the email"

key = "body"

name = "Body"

type = "multi\_line\_text\_field"

required = true

The following table describes the properties in the TOML file that are specific to a Shopify Flow action:

| Property | Description |
| --- | --- |
| `[[extensions]]` | The name of the array that contains all extensions listed in the TOML file. Contains the following properties: |
| `[[settings.fields]]` | The name of the array that contains the settings fields. Contains the following property: |

### [Anchor to Shopify Flow triggers](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#shopify-flow-triggers)Shopify Flow triggers

The following example TOML file contains configuration settings for a [Shopify Flow trigger](https://shopify.dev/docs/apps/build/flow/triggers). The properties in the TOML file are similar to a [Shopify Flow action](#shopify-flow-actions):

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

[[extensions]]

name = "Shopify Email sent"

description = "Triggered when an email is sent from Shopify"

handle = "shopify-email-sent"

type = "flow\_trigger"

uid = "1b625187-49cd-77d4-524b-5cfbb4582529885aa0fe"

[settings]

[[settings.fields]]

description = "The customer who received the email."

key = "customer\_id"

name = "Customer ID"

type = "customer\_reference"

[[settings.fields]]

description = "The marketing campaign ID."

key = "campaign\_id"

name = "Campaign ID"

type = "single\_line\_text\_field"

### [Anchor to Shopify Flow templates](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#shopify-flow-templates)Shopify Flow templates

The following example TOML file contains configuration settings for a [Shopify Flow template](https://shopify.dev/docs/apps/build/flow/templates).

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

[[extensions]]

name = "t:name"

type = "flow\_template"

uid = "7fec5c80-7dd4-5fbc-1eb5-203e4bd8e1bfe9ec810a"

handle = "example-handle"

description = "t:description"

[extensions.template]

categories = ["orders", "risk"]

module = "./template.flow"

require\_app = false

discoverable = true

enabled = true

The following table describes the properties in the TOML file that are specific to a Shopify Flow template:

| Property | Description |
| --- | --- |
| `[extensions.template]` | Settings related to the template. Contains the following properties: |

---

## [Anchor to Differences in TOML file names](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#differences-in-toml-file-names)Differences in TOML file names

TOML file names can differ, depending on when you generated an extension:

* If you generated an extension before July 26, 2023, then your TOML file maps to one of the following names:

  + **Checkout UI**: `shopify.ui.extension.toml`
  + **Bundles UI extension**: `shopify.ui.extension.toml` (maps to a [product configuration extension](https://shopify.dev/docs/apps/build/product-merchandising/bundles/product-configuration-extension/add-merchant-config-ui))
  + **Post-purchase UI**: `shopify.ui.extension.toml`
  + **Product subscription**: `shopify.ui.extension.toml`
  + **Web pixel**: `shopify.ui.extension.toml`
  + **Shopify POS UI**: `shopify.ui.extension.toml`
  + **Theme app extensions**: `shopify.theme.extension.toml`
* If you generated an extension after July 26, 2023, then the TOML file is named `shopify.extension.toml`.

---

Was this page helpful?

YesNo

* [How it works](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#how-it-works)
* [Extension types](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#extension-types)
* [Targets](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#targets)
* [Common properties](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#common-properties)
* [Extension-specific properties](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#extension-specific-properties)
* [Differences in TOML file names](https://shopify.dev/docs/apps/build/app-extensions/configure-app-extensions#differences-in-toml-file-names)
