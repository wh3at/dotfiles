---
title: "Properties | fast-check"
source_url: "https://fast-check.dev/docs/core-blocks/properties/index"
fetched_at: "2025-12-29T00:47:28.315028+00:00"
---



* * [Core Blocks](https://fast-check.dev/docs/core-blocks/index.html)* Properties

On this page

Define your properties.

## Introduction[​](https://fast-check.dev/docs/core-blocks/properties/index.html#introduction "Direct link to Introduction")

Properties bring together arbitrary generators and predicates. They are a key building block for property based testing frameworks.

They can be summarized by:

> for any (x, y, ...)
> such that precondition(x, y, ...) holds
> predicate(x, y, ...) is true

Equivalence in fast-check

Each part of the definition can be achieved directly within fast-check:

* "*for any (x, y, ...)*" via [arbitraries](https://fast-check.dev/docs/core-blocks/arbitraries/index.html)
* "*such that precondition(x, y, ...) holds*" via `fc.pre` or `.filter`
* "*predicate(x, y, ...) is true*" via the predicate

## Synchronous properties[​](https://fast-check.dev/docs/core-blocks/properties/index.html#synchronous-properties "Direct link to Synchronous properties")

### Basic[​](https://fast-check.dev/docs/core-blocks/properties/index.html#basic "Direct link to Basic")

Synchronous properties define synchronous predicates. They can be declared by calling `fc.property(...arbitraries, predicate)`.

The syntax is the following:

```
fc.property(...arbitraries, (...args) => {});
```

When passing N arbitraries, the predicate will receive N arguments: first argument being produced by the first arbitrary, second argument by the second arbitrary...

The predicate can:

* either throw in case of failure by relying on `assert`, `expect` or even directly throwing,
* or return `true` or `undefined` for success and `false` for failure.

Beware of side effects

The predicate function should not change the inputs it received. If it needs to, it has to clone them before going on. Impacting the inputs might led to bad shrinking and wrong display on error.

### Advanced[​](https://fast-check.dev/docs/core-blocks/properties/index.html#advanced "Direct link to Advanced")

The built-in property comes with two methods that can be leveraged whenever you need to run setup or teardown steps.

```
fc.property(...arbitraries, (...args) => {})
  .beforeEach((previousBeforeEach) => {})
  .afterEach((previousAfterEach) => {});
```

They both only accept synchronous functions and give the user the ability to call the previously defined hook function if any. The before-each (respectively: after-each) function will be launched before (respectively: after) each execution of the predicate.

Independent

No need to define both. You may only call `beforeEach` or `afterEach` without the other.

Share them

Consider using `fc.configureGlobal` to share your `beforeEach` and `afterEach` functions across multiple properties.

### Example[​](https://fast-check.dev/docs/core-blocks/properties/index.html#example "Direct link to Example")

Let's imagine we have a function called `crop` taking a string and the maximal length we accept. We can write the following property:

```
fc.property(fc.nat(), fc.string(), (maxLength, label) => {
  fc.pre(label.length <= maxLength); // any label such label.length > maxLength, will be dropped
  return crop(label, maxLength) === label; // true is success, false is failure
});
```

The property defined above is relying on `fc.pre` to filter out invalid entries and is returning boolean values to indicate failures.

It can also be written with `.filter` and `expect`:

```
fc.property(
  fc
    .record({
      maxLength: fc.nat(),
      label: fc.string(),
    })
    .filter(({ maxLength, label }) => label.length <= maxLength),
  ({ maxLength, label }) => {
    expect(crop(label, maxLength)).toBe(label);
  },
);
```

Filtering and performance

Whatever the filtering solution you chose between `fc.pre` or `.filter`, they both consist into generating values and then dropping them. When filter is too strict it means that plenty of values could be rejected for only a few kept.

As a consequence, whenever feasible it's recommended to prefer relying on options directly providing by the arbitraries rather than filtering them. For instance, if you want to generate strings having at least two characters you should prefer `fc.string({ minLength: 2 })` over `fc.string().filter(s => s.length >= 2)`.

## Asynchronous properties[​](https://fast-check.dev/docs/core-blocks/properties/index.html#asynchronous-properties "Direct link to Asynchronous properties")

### Basic[​](https://fast-check.dev/docs/core-blocks/properties/index.html#basic-1 "Direct link to Basic")

Similarly to their synchronous counterpart, aynchronous properties define asynchronous predicates. They can be declared by calling `fc.asyncProperty(...arbitraries, asyncPredicate)`.

The syntax is the following:

```
fc.asyncProperty(...arbitraries, async (...args) => {});
```

### Advanced[​](https://fast-check.dev/docs/core-blocks/properties/index.html#advanced-1 "Direct link to Advanced")

They also accept `beforeEach` and `afterEach` functions to be provided: the passed functions can either be synchronous or asynchronous.

Lifecycle

The `beforeEach` and `afterEach` functions will always be executed, regardless of whether the property times out. It's important to note that the `timeout` option passed to `fc.assert` only measures the time taken by the actual property test, not the setup and teardown phases.

[Previous

Others](https://fast-check.dev/docs/core-blocks/arbitraries/others/index.html)[Next

Runners](https://fast-check.dev/docs/core-blocks/runners/index.html)

* [Introduction](https://fast-check.dev/docs/core-blocks/properties/index.html#introduction)* [Synchronous properties](https://fast-check.dev/docs/core-blocks/properties/index.html#synchronous-properties)
    + [Basic](https://fast-check.dev/docs/core-blocks/properties/index.html#basic)+ [Advanced](https://fast-check.dev/docs/core-blocks/properties/index.html#advanced)+ [Example](https://fast-check.dev/docs/core-blocks/properties/index.html#example)* [Asynchronous properties](https://fast-check.dev/docs/core-blocks/properties/index.html#asynchronous-properties)
      + [Basic](https://fast-check.dev/docs/core-blocks/properties/index.html#basic-1)+ [Advanced](https://fast-check.dev/docs/core-blocks/properties/index.html#advanced-1)
