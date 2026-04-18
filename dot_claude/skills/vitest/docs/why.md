---
title: "Why Browser Mode | Browser Mode | Vitest"
source_url: "https://vitest.dev/guide/browser/why"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



Are you an LLM? You can read better optimized documentation at /guide/browser/why.md for this page in Markdown format

# Why Browser Mode [​](https://vitest.dev/guide/browser/why.html#why-browser-mode)

## Motivation [​](https://vitest.dev/guide/browser/why.html#motivation)

We developed the Vitest browser mode feature to help improve testing workflows and achieve more accurate and reliable test results. This addition to our testing API allows developers to run tests in a native browser environment. In this section, we'll explore the motivations behind this feature and its benefits for testing.

### Different Ways of Testing [​](https://vitest.dev/guide/browser/why.html#different-ways-of-testing)

There are different ways to test JavaScript code. Some testing frameworks simulate browser environments in Node.js, while others run tests in real browsers. In this context, [jsdom](https://www.npmjs.com/package/jsdom) is an example of a spec implementation that simulates a browser environment by being used with a test runner like Jest or Vitest, while other testing tools such as [WebdriverIO](https://webdriver.io/) or [Cypress](https://www.cypress.io/) allow developers to test their applications in a real browser or in case of [Playwright](https://playwright.dev/) provide you a browser engine.

### The Simulation Caveat [​](https://vitest.dev/guide/browser/why.html#the-simulation-caveat)

Testing JavaScript programs in simulated environments such as jsdom or happy-dom has simplified the test setup and provided an easy-to-use API, making them suitable for many projects and increasing confidence in test results. However, it is crucial to keep in mind that these tools only simulate a browser environment and not an actual browser, which may result in some discrepancies between the simulated environment and the real environment. Therefore, false positives or negatives in test results may occur.

To achieve the highest level of confidence in our tests, it's crucial to test in a real browser environment. This is why we developed the browser mode feature in Vitest, allowing developers to run tests natively in a browser and gain more accurate and reliable test results. With browser-level testing, developers can be more confident that their application will work as intended in a real-world scenario.

## Drawbacks [​](https://vitest.dev/guide/browser/why.html#drawbacks)

When using Vitest browser, it is important to consider the following drawbacks:

### Early Development [​](https://vitest.dev/guide/browser/why.html#early-development)

The browser mode feature of Vitest is still in its early stages of development. As such, it may not yet be fully optimized, and there may be some bugs or issues that have not yet been ironed out. It is recommended that users augment their Vitest browser experience with a standalone browser-side test runner like WebdriverIO, Cypress or Playwright.

### Longer Initialization [​](https://vitest.dev/guide/browser/why.html#longer-initialization)

Vitest browser requires spinning up the provider and the browser during the initialization process, which can take some time. This can result in longer initialization times compared to other testing patterns.
