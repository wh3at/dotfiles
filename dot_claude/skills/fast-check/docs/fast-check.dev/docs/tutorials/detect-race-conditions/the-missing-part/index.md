---
title: "The missing part | fast-check"
source_url: "https://fast-check.dev/docs/tutorials/detect-race-conditions/the-missing-part/index"
fetched_at: "2025-12-29T00:50:44.267866+00:00"
---



* * [Tutorials](https://fast-check.dev/docs/tutorials/index.html)* [Detect race conditions](https://fast-check.dev/docs/tutorials/detect-race-conditions/index.html)* The missing part

On this page

## Zoom on previous test[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/the-missing-part/index.html#zoom-on-previous-test "Direct link to Zoom on previous test")

As mentioned earlier, the decision to use sequences was largely driven by the desire to cover most of the scheduler's APIs in this tutorial. However, there are alternative ways of achieving our goals.

One of the issues we wanted to address was the need to trigger queries asynchronously. Although this functionality is not yet built into fast-check, we could use the technique outlined in [scheduling a function call](https://fast-check.dev/docs/advanced/race-conditions/#scheduling-a-function-call). If we were to take this approach, we would update:

```
for (let id = 0; id !== numCalls; ++id) {
  expectedAnswers.push(id);
  pendingQueries.push(queued(id).then((v) => seenAnswers.push(v)));
}
```

into:

```
for (let id = 0; id !== numCalls; ++id) {
  pendingQueries.push(
    s
      .schedule(Promise.resolve(`Fire the call for ${id}`))
      .then(() => {
        expectedAnswers.push(id);
        return queued(id);
      })
      .then((v) => seenAnswers.push(v)),
  );
}
```

Comparison

Contrary to the batch approach, the ordering of ids will not be ensured. For that reason, we decided to include it in the reports by scheduling a resolved promise with a value featuring this id.

## Towards next test[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/the-missing-part/index.html#towards-next-test "Direct link to Towards next test")

Our tests may be incomplete because we are not taking into account all aspects of the specification:

> Its purpose is to wrap an asynchronous function and queue subsequent calls to it in two ways:
>
> * Promises returned by the function will resolve in order, with the first call resolving before the second one, the second one resolving before the third one, and so on.
> * Concurrent calls are not allowed, meaning that a call will always wait for the previously started one to finish before being fired.

Although we thoroughly tested the first point, we may have overlooked the second point in the specification. Therefore, in the final section of this tutorial, we will focus on validating the second requirement.

## Your turn![​](https://fast-check.dev/docs/tutorials/detect-race-conditions/the-missing-part/index.html#your-turn "Direct link to Your turn!")

queue.js

queue.spec.js

```
import {queue} from './queue.js';
import fc from 'fast-check';

test('should resolve in call order', async () => {
  await fc.assert(fc.asyncProperty(fc.scheduler(), fc.array(fc.integer({min: 1, max: 10}), {minLength: 1}), async (s, batches) => {
    // Arrange
    const pendingQueries = [];
    const seenAnswers = [];
    const expectedAnswers = [];
    const call = jest.fn()
      .mockImplementation(v => Promise.resolve(v));

    // Act
    const queued = queue(s.scheduleFunction(call));
    let lastId = 0;
    const { task } = s.scheduleSequence(batches.map((batch, index) => {
      return {
        label: `Fire batch #${index + 1} (${batch} calls)`,
        builder: async () => {
          for (let id = 0 ; id !== batch ; ++id, ++lastId) {
            expectedAnswers.push(lastId);
            pendingQueries.push(queued(lastId).then(v => (seenAnswers.push(v))));
          }
        },
      }
    }));
    await s.waitFor(task);
    await s.waitFor(Promise.all(pendingQueries));

    // Assert
    expect(seenAnswers).toEqual(expectedAnswers);
  }))
})
```

Tests

VerboseWatch

[Open in CodeSandbox](https://codesandbox.io/api/v1/sandboxes/define?undefined&environment=undefined "Open in CodeSandbox")

What to expect?

Your test should help us to detect a bug in our current implementation of `queue`.

Hint #1

One potential solution is to wrap the scheduled API in an additional layer that sets a flag to `true` when the API is called, directly invokes the scheduled API, and then resets the flag to `false` when the API resolves. If the flag is already set to `true` when the wrapper layer is invoked, it should cause the test to fail.

[Previous

Multiple batches of calls](https://fast-check.dev/docs/tutorials/detect-race-conditions/multiple-batches-of-calls/index.html)[Next

Wrapping up](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html)

* [Zoom on previous test](https://fast-check.dev/docs/tutorials/detect-race-conditions/the-missing-part/index.html#zoom-on-previous-test)* [Towards next test](https://fast-check.dev/docs/tutorials/detect-race-conditions/the-missing-part/index.html#towards-next-test)* [Your turn!](https://fast-check.dev/docs/tutorials/detect-race-conditions/the-missing-part/index.html#your-turn)
