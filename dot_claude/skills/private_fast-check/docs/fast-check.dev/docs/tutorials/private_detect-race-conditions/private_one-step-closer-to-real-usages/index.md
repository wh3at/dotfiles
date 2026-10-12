---
title: "One step closer to real usages | fast-check"
source_url: "https://fast-check.dev/docs/tutorials/detect-race-conditions/one-step-closer-to-real-usages/index"
fetched_at: "2025-12-29T00:50:44.267866+00:00"
---



* * [Tutorials](https://fast-check.dev/docs/tutorials/index.html)* [Detect race conditions](https://fast-check.dev/docs/tutorials/detect-race-conditions/index.html)* One step closer to real usages

On this page

## Zoom on previous test[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/one-step-closer-to-real-usages/index.html#zoom-on-previous-test "Direct link to Zoom on previous test")

### What to schedule?[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/one-step-closer-to-real-usages/index.html#what-to-schedule "Direct link to What to schedule?")

One approach to solve the problem we discussed earlier is to follow a common pattern that we recommend when integrating a scheduler into existing tests. This involves replacing the original occurrences of the asynchronous API with scheduled versions of it. In our case, we replaced the line of code:

```
const queued = queue(call);
```

with:

```
const queued = queue(s.scheduleFunction(call));
```

### What to wait?[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/one-step-closer-to-real-usages/index.html#what-to-wait "Direct link to What to wait?")

Once we've replaced raw asynchronous API calls with scheduled versions, the next step is to wait for them to complete. There are several ways to achieve this, but the recommended approach is to use `waitFor` to wait for all queries to resolve:

```
const queued = queue(s.scheduleFunction(call));
pendingQueries.push(queued(1).then((v) => seenAnswers.push(v)));
pendingQueries.push(queued(2).then((v) => seenAnswers.push(v)));
await s.waitFor(Promise.all(pendingQueries));
```

An alternative would have been to use `waitAll` instead of `waitFor` but it comes with a precise requirement: promises have to be already scheduled by the time we request the scheduler. In other words, if our code delays a little bit the call to `call`, the scheduler might not wait enough.

Given the fact that `call` being fired synchronously is not a requirement for our current function, we can relax the constraint in our test to make evolving this implementation easier.

A `waitAll` version of the code above would be:

```
const queued = queue(s.scheduleFunction(call));
queued(1).then((v) => seenAnswers.push(v));
queued(2).then((v) => seenAnswers.push(v));
await s.waitAll();
```

## Towards next test[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/one-step-closer-to-real-usages/index.html#towards-next-test "Direct link to Towards next test")

The current implementation of our test only involves running two calls, but there may be potential issues that arise when more calls are made. To capture these scenarios, we will update the test to run an arbitrary number of calls. This will allow us to detect race conditions on a wider range of scenarios, including those with 3, 4, or even more calls.

## Your turn![​](https://fast-check.dev/docs/tutorials/detect-race-conditions/one-step-closer-to-real-usages/index.html#your-turn "Direct link to Your turn!")

queue.js

queue.spec.js

```
import {queue} from './queue.js';
import fc from 'fast-check';

test('should resolve in call order', async () => {
  await fc.assert(fc.asyncProperty(fc.scheduler(), async (s) => {
    // Arrange
    const pendingQueries = [];
    const seenAnswers = [];
    const call = jest.fn()
      .mockImplementation(v => Promise.resolve(v));

    // Act
    const queued = queue(s.scheduleFunction(call));
    pendingQueries.push(queued(1).then(v => (seenAnswers.push(v))));
    pendingQueries.push(queued(2).then(v => (seenAnswers.push(v))));
    await s.waitFor(Promise.all(pendingQueries));

    // Assert
    expect(seenAnswers).toEqual([1, 2]);
  }))
})
```

Tests

VerboseWatch

[Open in CodeSandbox](https://codesandbox.io/api/v1/sandboxes/define?undefined&environment=undefined "Open in CodeSandbox")

What to expect?

Your test should help us to detect a bug in our current implementation of `queue`.

Hint #1

`fc.scheduler` alone will not be enough! You'll have to generate another entry to be able to properly control the number of calls to `call` function.

Hint #2

Some possible options for generating additional test scenarios include:

* Using `fc.integer({min: 1, max: 10})` to generate a variable `numCalls` that determines how many times to call `call`. It's important to set a maximal value via `max` to prevent an excessively high number of calls.
* Using `fc.array(fc.nat(), {minLength: 1})` to generate the list of calls to issue against `call`.
* Using `fc.func(fc.boolean())` to generate a function that determines when to stop issuing calls.

And there are plenty others…

[Previous

Your first race condition test](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html)[Next

Multiple batches of calls](https://fast-check.dev/docs/tutorials/detect-race-conditions/multiple-batches-of-calls/index.html)

* [Zoom on previous test](https://fast-check.dev/docs/tutorials/detect-race-conditions/one-step-closer-to-real-usages/index.html#zoom-on-previous-test)
  + [What to schedule?](https://fast-check.dev/docs/tutorials/detect-race-conditions/one-step-closer-to-real-usages/index.html#what-to-schedule)+ [What to wait?](https://fast-check.dev/docs/tutorials/detect-race-conditions/one-step-closer-to-real-usages/index.html#what-to-wait)* [Towards next test](https://fast-check.dev/docs/tutorials/detect-race-conditions/one-step-closer-to-real-usages/index.html#towards-next-test)* [Your turn!](https://fast-check.dev/docs/tutorials/detect-race-conditions/one-step-closer-to-real-usages/index.html#your-turn)
