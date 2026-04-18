---
title: "Track Flow lifecycle events"
source_url: "https://shopify.dev/docs/apps/build/flow/track-lifecycle-events"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [How trigger lifecycle callbacks work](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#how-trigger-lifecycle-callbacks-work)
* [Step 1: Configure your web server](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#step-1-configure-your-web-server)
* [Step 2: Process and store callback data](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#step-2-process-and-store-callback-data)
* [Step 3: Configure and test the callback](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#step-3-configure-and-test-the-callback)
* [Step 4: Deploy your extension](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#step-4-deploy-your-extension)
* [Next steps](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#next-steps)

This guide explains how to configure your app to receive trigger lifecycle callbacks from Shopify Flow.

When [creating a trigger](https://shopify.dev/docs/apps/build/flow/triggers/create), configuring a lifecycle callback enables your app to receive notifications from Shopify Flow about stores using the trigger and communicate changes in workflow status (e.g., enabling or disabling a workflow) back to the app. This helps optimize app performance by ensuring that trigger-related operations are only performed for stores that actually need them.

Apps must be properly configured to respond to trigger lifecycle callbacks. When a merchant attempts to enable a workflow that uses the trigger, Shopify Flow sends a lifecycle callback to the app's web server. If it doesn't promptly receive a response or receives a response with an HTTP status code that isn't `2xx`, then the merchant can't enable the workflow and make use of the trigger.

Note

Legacy trigger discovery webhook extensions created using the Partner Dashboard are deprecated and must [migrate to the CLI](https://shopify.dev/docs/apps/build/flow/migrate-legacy-extensions) before they can be edited.

---

## [Anchor to How trigger lifecycle callbacks work](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#how-trigger-lifecycle-callbacks-work)How trigger lifecycle callbacks work

Trigger lifecycle callbacks contain identifying information about the trigger and the store using it and indicate whether the trigger is being used. You can use this information to track the stores that are currently using your triggers and then send trigger requests to only those stores.

### [Anchor to Properties](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#properties)Properties

The trigger lifecycle callback (HTTP POST request) is formatted in JSON and it contains the following properties:

| Property | Data type | Description | Example |
| --- | --- | --- | --- |
| `flow_trigger_definition_id` | String | The unique identifier for your Shopify Flow trigger. | Add row to spreadsheet |
| `has_enabled_flow` | Boolean | Whether the store has an enabled workflow that uses your trigger. Valid values:  * `true`: There is at least one workflow that is enabled and that uses your trigger. * `false`: There are no enabled workflows that use your trigger. | true |
| `shop_id` | Number | The unique identifier for the Shopify store. | 690933842 |
| `shopify_domain` | String | The myshopify domain of the Shopify store. | johnsapparel.myshopify.com |
| `timestamp` | [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and timestamp | The time when the notification was created. Notifications with newer timestamps should take precedence. If you already have a timestamp in your datastore and you receive a newer timestamp, then overwrite this payload's information in your datastore. Conversely, if you receive a timestamp that is older than the information in your datastore, then ignore this payload. | 2019-01-25T16:44:10.999Z |

The following is an example body of a usage notification (HTTP POST) request:

9

1

2

3

4

5

6

7

{

"flow\_trigger\_definition\_id": "Add row to spreadsheet",

"has\_enabled\_flow": false,

"shop\_id": "690933842",

"shopify\_domain": "johnapparel.myshopify.com",

"timestamp": "2019-01-25T16:44:10.999Z"

}

### [Anchor to Callback events](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#callback-events)Callback events

Shopify Flow sends trigger lifecycle callbacks when the following events occur:

* When a merchant activates a workflow that uses your trigger, the callback contains `"has_enabled_flow": true`.
* When a merchant deactivates a workflow that uses your trigger, the callback contains `"has_enabled_flow": false`.

### [Anchor to Web server response time and status codes](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#web-server-response-time-and-status-codes)Web server response time and status codes

When a merchant tries to enable a workflow that uses your trigger, Shopify Flow sends a trigger lifecycle callback to your web server. If your web server doesn't respond within five seconds, or if it responds with a different status code, then the merchant can't enable that workflow. The merchant receives a notification in the Shopify Flow app that tells them to try enabling the workflow at a later time.

---

## [Anchor to Step 1: Configure your web server](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#step-1-configure-your-web-server)Step 1: Configure your web server

To begin, configure your web server to listen for Shopify Flow callbacks.

1. Configure a URL in your web server to listen for the trigger lifecycle callbacks from Shopify Flow.
2. Configure your web server to verify the HMAC header in the trigger lifecycle callback with your client secret.

   The HMAC header is located in the following HTTP header: `x-shopify-hmac-sha256`. If you are using a Ruby-based web framework, then the header is `http-x-shopify-hmac-sha256`.
3. Configure your web server to respond within 5 seconds when it receives a trigger lifecycle callback.

---

## [Anchor to Step 2: Process and store callback data](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#step-2-process-and-store-callback-data)Step 2: Process and store callback data

After you've added support to listen for Shopify Flow callbacks, you can configure your web server to process and store the callback data.

1. Save the list of stores that are using your triggers in a persistent datastore. Use the `timestamp` property to make sure that you don't overwrite an existing entry with older information.
2. Edit your application to send your triggers only to stores that are using your triggers.

---

## [Anchor to Step 3: Configure and test the callback](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#step-3-configure-and-test-the-callback)Step 3: Configure and test the callback

Finally, configure the callback in the CLI:

1. Run `shopify app generate extension`.
2. Select `Flow trigger lifecycle callback`.
3. Change the URL in the generated TOML to the URL configured on the web server.
4. Save your extension configuration. If `app dev` is running, the changes will be applied automatically. If not, start the command to build and preview your app:

   $

   $

   shopify app dev
5. Create a workflow that uses your trigger.

---

## [Anchor to Step 4: Deploy your extension](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#step-4-deploy-your-extension)Step 4: Deploy your extension

Note

Deploying extensions using the `app deploy` command also publishes the extensions. We recommend testing changes by using [`app dev`](https://shopify.dev/docs/api/shopify-cli/app/app-dev) or deploying to a test app before deploying them to a production app.

Use Shopify CLI to deploy your extensions:

1. Navigate to your app directory.
2. Run the following command to deploy your extension(s):

   $

   $

   shopify app deploy
3. Follow the prompts.

When you receive confirmation that the deploy was successful, your extensions have been released.

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#next-steps)Next steps

* Familiarize yourself with [Shopify Flow](https://shopify.dev/docs/apps/build/flow) and learn about building connectors.
* Connect your app to Shopify Flow so that events that occur in your app can [trigger workflows](https://shopify.dev/docs/apps/build/flow/triggers).
* Connect your app to Shopify Flow so that your app receives data and information when a [workflow action](https://shopify.dev/docs/apps/build/flow/actions) runs.

---

Was this page helpful?

YesNo

* [How trigger lifecycle callbacks work](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#how-trigger-lifecycle-callbacks-work)
* [Step 1: Configure your web server](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#step-1-configure-your-web-server)
* [Step 2: Process and store callback data](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#step-2-process-and-store-callback-data)
* [Step 3: Configure and test the callback](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#step-3-configure-and-test-the-callback)
* [Step 4: Deploy your extension](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#step-4-deploy-your-extension)
* [Next steps](https://shopify.dev/docs/apps/build/flow/track-lifecycle-events#next-steps)
