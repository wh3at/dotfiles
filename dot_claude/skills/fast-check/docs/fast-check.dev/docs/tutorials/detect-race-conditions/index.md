---
title: "Detect race conditions | fast-check"
source_url: "https://fast-check.dev/docs/tutorials/detect-race-conditions/index"
fetched_at: "2025-12-29T00:50:44.267866+00:00"
---



* * [Tutorials](https://fast-check.dev/docs/tutorials/index.html)* Detect race conditions

On this page

Learn how to detect race conditions in your code through clear and instructive examples

Already familiar with race conditions?

This tutorial teaches techniques to detect race conditions in code testing, using specific algorithms and tools related to fast-check. It includes examples designed to initially pass the tests, and each section introduces new concepts.

➡️ You already know what are race conditions? **Let's start immediately with [the first section](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html)!** 🚀

## Tutorial structure[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/index.html#tutorial-structure "Direct link to Tutorial structure")

This tutorial aims to equip you with techniques to write tests that can detect race conditions. To achieve this, it will cover specific algorithms and introduce helpful concepts and tools related to fast-check and its race condition detection mechanisms. By the end of this tutorial, you will be able to apply these techniques and tools to your own tests.

Throughout this tutorial, the examples have been crafted to ensure that tests pass initially on the code being tested. Your objective will be to make the tests fail by implementing the suggested changes. Each section will introduce new concepts and provide the necessary information to apply these learnings to code beyond the scope of this tutorial. Each page will come with its own puzzle.

[## 📄️ Your first race condition test

First iteration, build your first test able to detect race conditions](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html)

[## 📄️ One step closer to real usages

Second iteration, make the test closer and detect even more race conditions](https://fast-check.dev/docs/tutorials/detect-race-conditions/one-step-closer-to-real-usages/index.html)

[## 📄️ Multiple batches of calls

Third iteration, not only one batch firing all queries but multiple batches](https://fast-check.dev/docs/tutorials/detect-race-conditions/multiple-batches-of-calls/index.html)

[## 📄️ The missing part

Fourth iteration, check all the points of the specification](https://fast-check.dev/docs/tutorials/detect-race-conditions/the-missing-part/index.html)

[## 📄️ Wrapping up

Key learnings and summary of all our steps](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html)

## Definition of a race condition[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/index.html#definition-of-a-race-condition "Direct link to Definition of a race condition")

Let's align our understanding of the concept

While this section is fully optional, it has the benefit to make sure that we all align on the definition of race condition throughout this tutorial.

Taking the Wikipedia definition: *"A race condition […] is the condition […] where the system's substantive behavior is dependent on the sequence or timing of other uncontrollable events."* (source: <https://en.wikipedia.org/wiki/Race_condition>). This definition highlights two main reasons why race conditions are prevalent in JavaScript:

* sequence of events,
* events being out-of-control.

Consider a front-end application where a user types into a text field. User will focus and emit several keypress events. In addition, if the text field is connected to a backend API, it will receive updates over time. As none of these events are under our control, we may face race conditions. Indeed, we cannot predict when the user will type or what they will type, nor when our APIs will respond.

JavaScript, being event-based by nature, is prone to race conditions when asynchronous operations or events are used. Despite the language being single-threaded, it does not prevent the occurrence of race conditions.

## Race condition explained through an example[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/index.html#race-condition-explained-through-an-example "Direct link to Race condition explained through an example")

To help grasp the concept of a race condition, let's look at a real-world example involving an autocomplete field. As previously discussed, the unpredicable events occuring in the autocomplete field can trigger a race condition. As an example, in the animated image below, we can see that while the user is typing, outdated suggestions appear and disappear in a flickering manner. It makes it difficult for the user to select any option before the input stabilizes. The suggestions seem to appear out of order, causing confusion and frustration for the user.

![Dancing autocomplete field](https://fast-check.dev/assets/images/autocomplete-bug-a8bc5041ff8e1bcfe12e6c16e4852f25.gif)

Even worse, if we wait long enough, the autocomplete field may stabilize itself but on a past result. This means that the suggestions being displayed do not match the current query, leading to confusion and a poor user experience.

![Inconsistent results in autocomplete field](https://fast-check.dev/assets/images/autocomplete-bug-screenshot-eb8a0f3a6d94542f6d4be5792aa2f9bb.png)

To zoom in on what happened, we can summarize the issue with the help of this small diagram:

![Autocomplete race explained](https://fast-check.dev/assets/images/autocomplete-race-explained-511ce4ebafc2b9186190ac81a18e11f7.png)

In other words, the issue occurred as the user performed two searches subsequently: one for 'London' followed immediately by one for 'Paris'. However, the response for 'Paris' (the second request) came back before the response for 'London' (the first request), and our component did not handle it properly. This delay in responses is expected from an API perspective. There could be multiple reasons for this behavior, such as queries not being routed to the same servers with one server being heavily utilized and resulting in longer response times.

As we have seen in this simple example, race conditions are easy to create, as they only require two concurrent events, and can cause significant problems from a user's perspective. It is worth noting that the example we took for this section was only a visual glitch, but race conditions can have much more critical impacts than just a wrong display.

How to solve them?

This tutorial is designed to guide you in adding tests to your codebase, ensuring the absence race condition issues in the future. It will not directly focus on giving you keys to solve them. For more in-depth information on solving race conditions and useful techniques for identifying them outsite of tests, refer to the article ["Handling API request race conditions in React" by Sébastien Lorber](https://sebastienlorber.com/handling-api-request-race-conditions-in-react).

[Previous

Read test reports](https://fast-check.dev/docs/tutorials/quick-start/read-test-reports/index.html)[Next

Your first race condition test](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html)

* [Tutorial structure](https://fast-check.dev/docs/tutorials/detect-race-conditions/index.html#tutorial-structure)* [Definition of a race condition](https://fast-check.dev/docs/tutorials/detect-race-conditions/index.html#definition-of-a-race-condition)* [Race condition explained through an example](https://fast-check.dev/docs/tutorials/detect-race-conditions/index.html#race-condition-explained-through-an-example)
