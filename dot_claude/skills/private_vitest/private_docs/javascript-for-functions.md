---
title: "JavaScript for Functions"
source_url: "https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [How it works](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#how-it-works)
* [Available JavaScript APIs](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#available-javascript-apis)
* [JavaScript functions and Shopify CLI](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#javascript-functions-and-shopify-cli)
* [Sample apps](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#sample-apps)
* [Tutorials](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#tutorials)
* [Next steps](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#next-steps)

You can write your functions in JavaScript. This guide describes the process of building a Shopify Function using JavaScript or TypeScript.

Caution

For prototyping ideas, JavaScript is a good starting point if you're familiar with the language. However, expect to run into instruction limits sooner than if you wrote the equivalent function logic in a language that compiles to WebAssembly directly, such as [Rust](https://shopify.dev/docs/apps/build/functions/programming-languages/rust-for-functions). Shopify strongly recommends [Rust](https://shopify.dev/docs/apps/build/functions/programming-languages/rust-for-functions).

---

## [Anchor to How it works](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#how-it-works)How it works

Shopify CLI compiles your JavaScript code using [Javy](https://github.com/bytecodealliance/javy), our JavaScript-to-WebAssembly toolchain. To make development easier, we've also published a [Shopify Functions JavaScript library](https://npm.im/@shopify/shopify_function).

Note

To write functions in JavaScript, you must install [Node.js](https://nodejs.org/en/download) 16 or higher. If you previously installed Shopify CLI, then make sure you're using the [latest version](https://shopify.dev/docs/api/shopify-cli#upgrade).

To achieve smaller binary sizes and faster function execution, ensure you are using the [latest version of Shopify CLI](https://shopify.dev/docs/api/shopify-cli#upgrade) and v2.0.0 or higher of the `@shopify/shopify_function` JavaScript package.

### [Anchor to Javy](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#javy)Javy

Javy is part build tool, and part runtime engine:

* **Build tool**: The build tool part takes a JavaScript file and compiles it into a WebAssembly module, which contains both your code and a full JavaScript engine embedded.
* **Runtime engine**: JavaScript by itself is lacking some APIs to meaningfully interact with the environment it is running in. Javy implements a handful of APIs that are required to make JavaScript work well for Shopify Functions.

### [Anchor to Shopify Functions JavaScript library](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#shopify-functions-javascript-library)Shopify Functions JavaScript library

The Shopify Functions JavaScript library provides convenient functions and hides repetitive boilerplate in your function code. If you create your JavaScript function using Shopify CLI, then it will set up the library for you.

The library includes a TypeScript type generator that inspects your GraphQL query to allow your IDE (Integrated Development Environment) to provide autocomplete suggestions.

[![](https://shopify.dev/images/icons/48/npm.png)![](https://shopify.dev/images/icons/48/npm-dark.png)

Shopify Functions JavaScript library

Read the documentation of our JavaScript library for Shopify Functions.

Shopify Functions JavaScript library

Read the documentation of our JavaScript library for Shopify Functions.](https://npm.im/@shopify/shopify_function)

[Shopify Functions JavaScript library


Read the documentation of our JavaScript library for Shopify Functions.](https://npm.im/@shopify/shopify_function)

---

## [Anchor to Available JavaScript APIs](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#available-javascript-apis)Available JavaScript APIs

Javy and Shopify Functions provide access to the following APIs and globals:

* [ECMAScript 2020](#ecmascript-2020)
* [Javy globals](#javy-globals)

### [Anchor to ECMAScript 2020](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#ecmascript-2020)ECMAScript 2020

The Javy runtime implements the [ECMAScript 2020 specification](https://262.ecma-international.org/11.0/). However, Javy doesn't enable [JavaScript's event loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop). This means that `async`/`await` and promises will compile fine, but will throw an error when your function executes:

9

1

thread '<unnamed>' panicked at 'called `Result::unwrap()` on an `Err` value: Adding tasks to the event queue is not supported

### [Anchor to Javy globals](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#javy-globals)Javy globals

Javy exposes [additional IO globals](https://github.com/bytecodealliance/javy/blob/93766d87d8036c2e4244530544d8249e591a7b3b/crates/apis/src/stream_io/io.js) for reading and writing from `STDIO`. The [`javy` npm package](https://www.npmjs.com/package/javy) provides convenience methods over the built-in functions.

Javy also exposes an [encoding API](https://developer.mozilla.org/en-US/docs/Web/API/Encoding_API) which is W3C-compatible, with the following exceptions:

* Support for UTF-8 encoding exclusively
* No support for `TextEncoderStream` or `TextDecoderStream`
* No support for `TextEncoder.encodeInto`
* No support setting the `stream` property to `true` in `TextDecoder.decode`

### [Anchor to Not available in Javy or Shopify Functions](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#not-available-in-javy-or-shopify-functions)Not available in Javy or Shopify Functions

The following JavaScript APIs aren't available:

* [Web-specific browser APIs](https://developer.mozilla.org/en-US/docs/Web/API) such as `setTimeout`, `fetch`, `crypto`, or `URL`.
  + An exception to this is `TextEncoder` and `TextDecoder`, which Javy provides.
* Node.js-specific globals and imports such as `process`, `node:buffer`, `node:http`, or `node:util`.

---

## [Anchor to JavaScript functions and Shopify CLI](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#javascript-functions-and-shopify-cli)JavaScript functions and Shopify CLI

The quickest way to get started with JavaScript for Shopify Functions is to use the [Shopify Functions JavaScript library](https://npm.im/@shopify/shopify_function) with Shopify CLI.

Shopify CLI helps you scaffold projects and uses [ESBuild](https://esbuild.github.io/) to preprocess JavaScript and TypeScript. This means that you can install and import `npm` dependencies, just like you would in regular JavaScript. The dependencies will be bundled before everything gets compiled to WebAssembly.

Shopify CLI also supports TypeScript and type annotations from [GraphQL schemas](https://shopify.dev/docs/api/functions/current#graphql-schema-and-versioning) and [input queries](https://shopify.dev/docs/api/functions/current#input).

Shopify CLI uses Javy to compile a WebAssembly module that conforms to the [WebAssembly requirements](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#requirements), automatically generating exports from targets in the [function extension configuration](https://shopify.dev/docs/api/functions/configuration#properties).

### [Anchor to Compatibility with earlier versions](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#compatibility-with-earlier-versions)Compatibility with earlier versions

Shopify CLI provides support for backwards compatibility with API versions 2023-07 and earlier. It uses Javy to compile a WebAssembly module that exports a `_start` function to conform to previous [WebAssembly requirements](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions#requirements).

---

## [Anchor to Sample apps](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#sample-apps)Sample apps

Explore sample apps that contain functions written in JavaScript.

[![](https://shopify.dev/images/icons/48/github.png)![](https://shopify.dev/images/icons/48/github-dark.png)

Discounts

View a sample discounts app that contains functions written in JavaScript.

Discounts

View a sample discounts app that contains functions written in JavaScript.](https://github.com/Shopify/function-examples/tree/main/sample-apps/discounts)

[Discounts


View a sample discounts app that contains functions written in JavaScript.](https://github.com/Shopify/function-examples/tree/main/sample-apps/discounts)

[![](https://shopify.dev/images/icons/48/github.png)![](https://shopify.dev/images/icons/48/github-dark.png)

Payment customizations

View a sample payment customization that contains functions written in JavaScript.

Payment customizations

View a sample payment customization that contains functions written in JavaScript.](https://github.com/Shopify/function-examples/tree/main/sample-apps/payment-customizations)

[Payment customizations


View a sample payment customization that contains functions written in JavaScript.](https://github.com/Shopify/function-examples/tree/main/sample-apps/payment-customizations)

[![](https://shopify.dev/images/icons/48/github.png)![](https://shopify.dev/images/icons/48/github-dark.png)

Delivery customizations

View a sample delivery customization that contains functions written in JavaScript.

Delivery customizations

View a sample delivery customization that contains functions written in JavaScript.](https://github.com/Shopify/function-examples/tree/main/sample-apps/delivery-customizations)

[Delivery customizations


View a sample delivery customization that contains functions written in JavaScript.](https://github.com/Shopify/function-examples/tree/main/sample-apps/delivery-customizations)

---

## [Anchor to Tutorials](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#tutorials)Tutorials

Learn how to use JavaScript with Shopify Functions by following one of our use case tutorials:

[![](https://shopify.dev/images/icons/48/heart.png)![](https://shopify.dev/images/icons/48/heart-dark.png)

Build a discounts function

Use Shopify Functions to create a new discount type for users.

Build a discounts function

Use Shopify Functions to create a new discount type for users.](/docs/apps/build/discounts/build-discount-function)

[Build a discounts function


Use Shopify Functions to create a new discount type for users.](https://shopify.dev/docs/apps/build/discounts/build-discount-function)

[![](https://shopify.dev/images/icons/48/coin.png)![](https://shopify.dev/images/icons/48/coin-dark.png)

Create a payments function

Use Shopify Functions to hide a payment option offered to customers at checkout.

Create a payments function

Use Shopify Functions to hide a payment option offered to customers at checkout.](/docs/apps/build/checkout/payments/create-payments-function)

[Create a payments function


Use Shopify Functions to hide a payment option offered to customers at checkout.](https://shopify.dev/docs/apps/build/checkout/payments/create-payments-function)

[![](https://shopify.dev/images/icons/48/globe.png)![](https://shopify.dev/images/icons/48/globe-dark.png)

Build a delivery options function

Use Shopify Functions to rename a delivery option offered to customers at checkout.

Build a delivery options function

Use Shopify Functions to rename a delivery option offered to customers at checkout.](/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function)

[Build a delivery options function


Use Shopify Functions to rename a delivery option offered to customers at checkout.](https://shopify.dev/docs/apps/build/checkout/delivery-shipping/delivery-options/build-function)

[![](https://shopify.dev/images/icons/48/custom-storefronts.png)![](https://shopify.dev/images/icons/48/custom-storefronts-dark.png)

Create server-side validation

Use Shopify Functions to block progress on a checkout when the cart line quantities exceed a limit.

Create server-side validation

Use Shopify Functions to block progress on a checkout when the cart line quantities exceed a limit.](/docs/apps/build/checkout/cart-checkout-validation/create-server-side-validation-function)

[Create server-side validation


Use Shopify Functions to block progress on a checkout when the cart line quantities exceed a limit.](https://shopify.dev/docs/apps/build/checkout/cart-checkout-validation/create-server-side-validation-function)

[![](https://shopify.dev/images/icons/48/tutorial.png)![](https://shopify.dev/images/icons/48/tutorial-dark.png)

Build fulfillment constraints

Use Shopify Functions to customize fulfillment and delivery strategies.

Build fulfillment constraints

Use Shopify Functions to customize fulfillment and delivery strategies.](/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function)

[Build fulfillment constraints


Use Shopify Functions to customize fulfillment and delivery strategies.](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/build-fulfillment-constraints-function)

[![](https://shopify.dev/images/icons/48/growth.png)![](https://shopify.dev/images/icons/48/growth-dark.png)

Build a location rule function

Use Shopify Functions to choose a different order location during checkout.

Build a location rule function

Use Shopify Functions to choose a different order location during checkout.](/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function)

[Build a location rule function


Use Shopify Functions to choose a different order location during checkout.](https://shopify.dev/docs/apps/build/orders-fulfillment/order-routing-apps/location-rules/build-location-rule-function)

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#next-steps)Next steps

* Learn about how data is [input to and output from Shopify Functions](https://shopify.dev/docs/api/functions/current#function-anatomy).
* Explore [the references for each Function API](https://shopify.dev/docs/api/functions).
* Get familiar with [testing and debugging practices](https://shopify.dev/docs/apps/build/functions/test-debug-functions) that pertain to Shopify Functions.

---

Was this page helpful?

YesNo

* [How it works](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#how-it-works)
* [Available JavaScript APIs](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#available-javascript-apis)
* [JavaScript functions and Shopify CLI](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#javascript-functions-and-shopify-cli)
* [Sample apps](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#sample-apps)
* [Tutorials](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#tutorials)
* [Next steps](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions#next-steps)
