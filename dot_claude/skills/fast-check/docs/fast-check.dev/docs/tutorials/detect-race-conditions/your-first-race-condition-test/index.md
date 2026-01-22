---
title: "Your first race condition test | fast-check"
source_url: "https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index"
fetched_at: "2025-12-29T00:50:44.267866+00:00"
---



* * [Tutorials](https://fast-check.dev/docs/tutorials/index.html)* [Detect race conditions](https://fast-check.dev/docs/tutorials/detect-race-conditions/index.html)* Your first race condition test

On this page

## Code under test[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html#code-under-test "Direct link to Code under test")

For the next few pages, we will focus on a function called `queue`. Its purpose is to wrap an asynchronous function and queue subsequent calls to it in two ways:

* Promises returned by the function will resolve in order, with the first call resolving before the second one, the second one resolving before the third one, and so on.
* Concurrent calls are not allowed, meaning that a call will always wait for the previously started one to finish before being fired.

In the context of this tutorial you'll never have to edit `queue`. The function will be provided to you.

## Understand current test[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html#understand-current-test "Direct link to Understand current test")

Fortunately, we don't have to start from scratch. The function already has a test in place that ensures queries will consistently resolve in the correct order. The test appears rather simple and currently passes.

```
test('should resolve in call order', async () => {
  // Arrange
  const seenAnswers = [];
  const call = jest.fn().mockImplementation((v) => Promise.resolve(v));

  // Act
  const queued = queue(call);
  await Promise.all([queued(1).then((v) => seenAnswers.push(v)), queued(2).then((v) => seenAnswers.push(v))]);

  // Assert
  expect(seenAnswers).toEqual([1, 2]);
});
```

If we look closer to the test, we can observe that the wrapped function is relatively straightforward in that it merely returns a resolved promise whose value corresponds to the provided input.

```
const call = jest.fn().mockImplementation((v) => Promise.resolve(v));
```

We can also see that we assess the order of results by confirming that the values pushed into `seenAnswers` are properly ordered. It's worth noting that `seenAnswers` does not represent the same thing as `await Promise.all([queued(1), queued(2)])`. This alternative notation does not evaluate the order in which the resolutions are received, but rather only confirms that each query resolves to its expected value.

## Towards next test[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html#towards-next-test "Direct link to Towards next test")

The test above has some limitations. Namely, the promises and their `.then()` callbacks happen to resolve in the correct order only because they were instantiated in the correct order and they did not `await` to yield control back to the JavaScript event loop (because we use `Promise.resolve()`). In other words, we are just testing that the JavaScript event loop is queueing and processing promises in the correct order, which is hopefully already true!

In order to address this limitation, our updated test should ensure that promises resolve later rather than instantly.

## First glance at schedulers[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html#first-glance-at-schedulers "Direct link to First glance at schedulers")

When adding fast-check into a race condition test, the recommended initial step is to update the test code as follows:

```
test('should resolve in call order', async () => {
  await fc.assert(fc.asyncProperty(fc.scheduler(), async (s) => { // <-- added
    // ...unchanged code...
  }));                                                            // <-- added
});
```

This modification runs the test using the fast-check runner. By doing so, any bugs that arise during the predicate will be caught by fast-check.

In the context of race conditions, we want fast-check to provide us with a scheduler instance that is capable of re-ordering asynchronous operations. This is why we added the `fc.scheduler()` argument: it creates an instance of a scheduler that we refer to as `s`. The first important thing to keep in mind for our new test is that we don't want to change the value returned by the API. But we want to change when it gets returned. We want to give the scheduler the responsibility of resolving API calls. To achieve this, the scheduler exposes a method called `scheduleFunction`. This method wraps a function in a scheduled or controlled version of itself.

After pushing scheduled calls into the scheduler, we must execute and release them at some point. This is typically done using `waitAll` or `waitFor`. These APIs simply wait for `waitX` to resolve, indicating that what we were waiting for has been accomplished.

Which wait is the best?

For this first iteration, both of them will be ok, but we will see later that `waitFor` is probably a better fit in that specific example.

More

For a comprehensive list of methods exposed on the scheduler, you can checkout the [official documentation for race conditions](https://fast-check.dev/docs/advanced/race-conditions/).

## Your turn![​](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html#your-turn "Direct link to Your turn!")

queue.js

queue.spec.js

```
import {queue} from './queue.js';

test('should resolve in call order', async () => {
  // Arrange
  const seenAnswers = [];
  const call = jest.fn()
    .mockImplementation(v => Promise.resolve(v));

  // Act
  const queued = queue(call);
  await Promise.all([
    queued(1).then(v => (seenAnswers.push(v))),
    queued(2).then(v => (seenAnswers.push(v))),
  ]);

  // Assert
  expect(seenAnswers).toEqual([1, 2]);
})
```

Tests

VerboseWatch

[Open in CodeSandbox](https://codesandbox.io/api/v1/sandboxes/define?undefined&environment=undefined "Open in CodeSandbox")

What to expect?

Your test should help us to detect a bug in our current implementation of `queue`.

Hint #1

You have to run the test via the `assert` runner provided by fast-check. For more details, you may refer to the section [First glance at schedulers](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html#first-glance-at-schedulers) of this page.

Hint #2

No need to touch `call` itself. The function should still return the inputs it received. But, instead of queueing it, we should queue a scheduled version of it. You may refer to [`scheduleFunction`](https://fast-check.dev/docs/advanced/race-conditions/#schedulefunction) for more details.

Hint #3

Our test should think as a user of the API would think. It has to wait for all queued calls to be resolved before being able to assert anything on the output. You may want to use pass such condition to `waitFor` so that everything gets properly awaited before running any assertion.

[Previous

Detect race conditions](https://fast-check.dev/docs/tutorials/detect-race-conditions/index.html)[Next

One step closer to real usages](https://fast-check.dev/docs/tutorials/detect-race-conditions/one-step-closer-to-real-usages/index.html)

* [Code under test](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html#code-under-test)* [Understand current test](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html#understand-current-test)* [Towards next test](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html#towards-next-test)* [First glance at schedulers](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html#first-glance-at-schedulers)* [Your turn!](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html#your-turn)
