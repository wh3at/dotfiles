---
title: "Language considerations"
source_url: "https://shopify.dev/docs/apps/build/functions/programming-languages"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



ExpandOn this page

* [Functions environment](https://shopify.dev/docs/apps/build/functions/programming-languages#functions-environment)
* [Choosing a language](https://shopify.dev/docs/apps/build/functions/programming-languages#choosing-a-language)
* [Available language support](https://shopify.dev/docs/apps/build/functions/programming-languages#available-language-support)
* [Next steps](https://shopify.dev/docs/apps/build/functions/programming-languages#next-steps)

Shopify Functions support any language that compiles to WebAssembly (Wasm), such as Rust, Zig, or TinyGo. Functions that are compiled to Wasm need to meet our [WebAssembly API specifications](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions), and our [platform binary and performance limitations](https://shopify.dev/docs/api/functions/current#other-limitations).

This guide introduces the language support and tooling that's available in Shopify Functions.

---

## [Anchor to Functions environment](https://shopify.dev/docs/apps/build/functions/programming-languages#functions-environment)Functions environment

Shopify Functions operates in critical buyer flows such as Checkout. For a given Checkout request there may be multiple functions executed, each one adding to the overall latency of the checkout request. For this reason, Shopify places a number of [platform limits](https://shopify.dev/docs/api/functions/current#other-limitations), many of which can be measured locally using [Shopify CLI](https://shopify.dev/docs/apps/build/functions/test-debug-functions#execute-the-function-locally-using-shopify-cli).

---

## [Anchor to Choosing a language](https://shopify.dev/docs/apps/build/functions/programming-languages#choosing-a-language)Choosing a language

Languages that compile directly to WebAssembly, such as Rust, perform better than dynamic languages, such as JavaScript. If your function targets a public app, expects to operate on a large number of line items, or is computationally complex, then choose Rust to stay within the Shopify Functions [instruction count requirements](https://shopify.dev/docs/api/functions/current#other-limitations).

For prototyping ideas, JavaScript is a good starting point if you're familiar with the language. However, expect to run into instruction limits sooner than if you wrote the equivalent function logic in a language that compiles to WebAssembly directly, such as Rust.

---

## [Anchor to Available language support](https://shopify.dev/docs/apps/build/functions/programming-languages#available-language-support)Available language support

[![](https://shopify.dev/images/icons/48/rust.png)![](https://shopify.dev/images/icons/48/rust-dark.png)

Rust

Learn about the support for Rust in Shopify Functions.

Rust

Learn about the support for Rust in Shopify Functions.](/docs/apps/build/functions/programming-languages/rust-for-functions)

[Rust


Learn about the support for Rust in Shopify Functions.](https://shopify.dev/docs/apps/build/functions/programming-languages/rust-for-functions)

[![](https://shopify.dev/images/icons/48/javascript.png)![](https://shopify.dev/images/icons/48/javascript-dark.png)

JavaScript

Learn about the support for JavaScript and TypeScript in Shopify Functions.

JavaScript

Learn about the support for JavaScript and TypeScript in Shopify Functions.](/docs/apps/build/functions/programming-languages/javascript-for-functions)

[JavaScript


Learn about the support for JavaScript and TypeScript in Shopify Functions.](https://shopify.dev/docs/apps/build/functions/programming-languages/javascript-for-functions)

[![](https://shopify.dev/images/icons/48/webassembly.png)![](https://shopify.dev/images/icons/48/webassembly-dark.png)

WebAssembly

Learn about the using other languages that support WebAssembly in Shopify Functions.

WebAssembly

Learn about the using other languages that support WebAssembly in Shopify Functions.](/docs/apps/build/functions/programming-languages/webassembly-for-functions)

[WebAssembly


Learn about the using other languages that support WebAssembly in Shopify Functions.](https://shopify.dev/docs/apps/build/functions/programming-languages/webassembly-for-functions)

---

## [Anchor to Next steps](https://shopify.dev/docs/apps/build/functions/programming-languages#next-steps)Next steps

* Learn about how data is [input to and output from Shopify Functions](https://shopify.dev/docs/api/functions/latest#function-anatomy).
* Explore [the references for each Function API](https://shopify.dev/docs/api/functions).
* Get familiar with [testing and debugging practices](https://shopify.dev/docs/apps/build/functions/test-debug-functions) that pertain to Shopify Functions.

---

Was this page helpful?

YesNo

* [Functions environment](https://shopify.dev/docs/apps/build/functions/programming-languages#functions-environment)
* [Choosing a language](https://shopify.dev/docs/apps/build/functions/programming-languages#choosing-a-language)
* [Available language support](https://shopify.dev/docs/apps/build/functions/programming-languages#available-language-support)
* [Next steps](https://shopify.dev/docs/apps/build/functions/programming-languages#next-steps)
