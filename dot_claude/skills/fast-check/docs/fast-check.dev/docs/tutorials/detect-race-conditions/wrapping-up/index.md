---
title: "Wrapping up | fast-check"
source_url: "https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index"
fetched_at: "2025-12-29T00:50:44.267866+00:00"
---



* * [Tutorials](https://fast-check.dev/docs/tutorials/index.html)* [Detect race conditions](https://fast-check.dev/docs/tutorials/detect-race-conditions/index.html)* Wrapping up

On this page

Wanna play?

Want to directly try out the final result? Skip ahead to the [Have fun!](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#have-fun) section to play with the code snippets we've created.

## Zoom on previous test[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#zoom-on-previous-test "Direct link to Zoom on previous test")

Congratulations! You have learned how to detect race conditions using fast-check library. We explored the concept of race conditions, discussed their potential dangers, and demonstrated various techniques to identify them. By leveraging the powerful features of fast-check, such as property-based testing and shrinking, you now have a robust tool at your disposal to uncover and fix race conditions in your code. Remember to apply these techniques in your projects to ensure the reliability and stability of your software.

Throughout this tutorial, we gradually added race condition detection and expanded its coverage. The final iteration brings us close to fully addressing all possible edge cases of a `queue`.

One important aspect of the last added test is that it covers a specification point we had overlooked in previous iterations. The main change involved ensuring that we never get called twice simultaneously but always get queued. We accomplished this by replacing:

```
//...
const scheduledCall = s.scheduleFunction(call);
const queued = queue(scheduledCall);
//...
expect(concurrentQueriesDetected).toBe(false);
//...
```

with:

```
//...
const scheduledCall = s.scheduleFunction(call);
let concurrentQueriesDetected = false;
let queryPending = false;
const monitoredScheduledCall = (...args) => {
  concurrentQueriesDetected ||= queryPending;
  queryPending = true;
  return scheduledCall(...args).finally(() => (queryPending = false));
};
const queued = queue(monitoredScheduledCall);
//...
expect(concurrentQueriesDetected).toBe(false);
//...
```

The above change ensures that we can detect whenever `scheduledCall` is called before the previous calls to it have resolved.

## Towards next test[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#towards-next-test "Direct link to Towards next test")

Although we have covered the majority of the `queue` algorithm, there are always subtle aspects that we may want to address. In this section, we will provide you with some ideas to ensure that your implementation of `queue` is perfect. All the suggested changes have been implemented in the [CodeSandbox playground below](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#have-fun), allowing you to see how they can be achieved. The tests associated with this section have been named `*.pnext.v*` and are stacked on top of each other, with the final test incorporating all the suggestions described in this section.

### Synchronous calls[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#synchronous-calls "Direct link to Synchronous calls")

While we previously rejected the approach in the [first part](https://fast-check.dev/docs/tutorials/detect-race-conditions/your-first-race-condition-test/index.html) of the tutorial, we could have considered that calls are expected to be fired synchronously. To achieve this, we can rely on `waitAll` and eliminate any code responsible to wait for the batch to be executed or for promises to resolve.

Here is what we mean by not firing calls synchronously: this snippet does not execute calls in a synchronous manner. Instead, each call is queued and executed after the previous one has resolved:

```
let previous = Promise.resolve();
function fireCall(call) {
  previous = previous.then(() => call());
}
```

To demonstrate this behavior, you can run the following snippet locally:

```
console.log('before fireCall');
fireCall(async () => console.log('call'));
console.log('after fireCall');

// Results:
// >  before fireCall
// >  after fireCall
// >  call
```

Let's explore different iterations attempting to enhance this snippet. Here's a naive attempt that addresses the issue for the first call, but it is still incomplete:

```
let previous = undefined;
function fireCall(call) {
  if (previous === undefined) {
    previous = call();
  } else {
    previous = previous.then(() => call());
  }
}
```

While the above solution improves the situation for the first call, it doesn't handle subsequent calls properly. The issue on second call is highlighted by the following snippet:

```
function runOne() {
  return new Promise((resolve) => {
    console.log('before fireCall');
    fireCall(async () => {
      console.log('call');
      resolve();
    });
    console.log('after fireCall');
  });
}
await runOne();
await runOne();

// Results:
// >  before fireCall
// >  call
// >  after fireCall
// >  before fireCall
// >  after fireCall
// >  call
```

Here is a more advanced but still not perfect implementation of `fireCall`:

```
let callId = 0;
let previous = undefined;
function fireCall(call) {
  const currentCallId = ++callId;
  const next = previous === undefined ? call() : previous.then(() => call());
  previous = next.then(() => {
    if (callId === currentCallId) {
      previous = undefined;
    }
  });
}
```

This last iteration, implemented in `src/queue.v4.js`, represents the most advanced solution we will show in that section. However, if you examine the CodeSandbox playground](#have-fun), you'll notice that even this implementation misses some cases and can be fixed.

### Support exceptions[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#support-exceptions "Direct link to Support exceptions")

When working with asynchronous code, it is common to encounter situations where code can potentially throw errors. As this scenario may occur in production code, it is essential to test our helper against such cases as well.

To enhance our existing tests with this capability, we can modify our mock `call` implementation to simulate both successful executions and error throws. Consequently, our expectations need to be adjusted, but the underlying idea remains the same: both successes and failures should be received in an ordered manner.

## Have fun![​](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#have-fun "Direct link to Have fun!")

src

queue.jsqueue.v0.jsqueue.v1.jsqueue.v2.jsqueue.v3.jsqueue.v4.jsqueue.v5.js

tests

queue.p0.spec.jsqueue.p1.spec.jsqueue.p1.v2.spec.jsqueue.p2.spec.jsqueue.p3.spec.jsqueue.p3.v2.spec.jsqueue.p4.spec.jsqueue.pnext.v1.spec.jsqueue.pnext.v2.spec.js

package.json

queue.p4.spec.js

queue.js

```
// Test suggested for the part:
// > The missing part

import {queue} from './../src/queue.js';
import fc from 'fast-check';

test('should resolve in call order', async () => {
  await fc.assert(fc.asyncProperty(fc.scheduler(), fc.array(fc.integer({min: 1, max: 10}), {minLength: 1}), async (s, batches) => {
    // Arrange
    const pendingQueries = [];
    const seenAnswers = [];
    const expectedAnswers = [];
    const call = jest.fn()
      .mockImplementation(v => Promise.resolve(v));
    const scheduledCall = s.scheduleFunction(call);
    let concurrentQueriesDetected = false;
    let queryPending = false;
    const monitoredScheduledCall = (...args) => {
      concurrentQueriesDetected ||= queryPending;
      queryPending = true;
      return scheduledCall(...args).finally(() => (queryPending = false));
    };

    // Act
    const queued = queue(monitoredScheduledCall);
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
    expect(concurrentQueriesDetected).toBe(false);
  }))
})
```

Tests

VerboseWatch

[Open in CodeSandbox](https://codesandbox.io/api/v1/sandboxes/define?undefined&environment=undefined "Open in CodeSandbox")

The files

The playground provided includes source files extracted from the previous sections of this tutorial.

Inside the `src` directory, you will find various implementations of the `queue` algorithm that you encountered and attempted to defeat throughout the tutorial. For example, `src/queue.v0.js` represents the initial implementation you encountered in part 1, while `src/queue.v1.js` would pass the tests from part 1 but fail those from part 2.

The `queue` implementation currently running in the playground is expected to pass all the tests. However, if you wish to test one of the legacy versions, you can simply edit the `src/queue.js` file and import the desired legacy implementation.

In the `tests` directory, you will find all the suggested tests and some variations discussed throughout the tutorial. Feel free to explore and experiment with them.

## Testing user interfaces[​](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#testing-user-interfaces "Direct link to Testing user interfaces")

The pattern we have introduced in this tutorial can be extended to address race conditions that may occur in user interfaces. Whether you are working with React components, Vue components, or any other frameworks, you can apply the techniques covered here without any issues.

In fact, the concepts and principles discussed in this tutorial are applicable beyond the scope of the specific examples provided. By leveraging property-based testing and incorporating race condition detection into your UI development workflow, you can enhance the reliability and stability of your applications.

To delve deeper into this extension and gain a comprehensive understanding of applying these concepts on user interfaces, you can watch the following video:

[Previous

The missing part](https://fast-check.dev/docs/tutorials/detect-race-conditions/the-missing-part/index.html)[Next

Setting up your Test Environment](https://fast-check.dev/docs/tutorials/setting-up-your-test-environment/index.html)

* [Zoom on previous test](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#zoom-on-previous-test)* [Towards next test](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#towards-next-test)
    + [Synchronous calls](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#synchronous-calls)+ [Support exceptions](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#support-exceptions)* [Have fun!](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#have-fun)* [Testing user interfaces](https://fast-check.dev/docs/tutorials/detect-race-conditions/wrapping-up/index.html#testing-user-interfaces)
