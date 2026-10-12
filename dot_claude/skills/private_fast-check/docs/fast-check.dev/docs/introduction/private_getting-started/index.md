---
title: "Getting Started | fast-check"
source_url: "https://fast-check.dev/docs/introduction/getting-started/index"
fetched_at: "2025-12-29T00:45:52.267108+00:00"
---



* * [Introduction](https://fast-check.dev/docs/introduction/index.html)* Getting Started

On this page

Get started with fast-check in an existing project.

## Install the package[​](https://fast-check.dev/docs/introduction/getting-started/index.html#install-the-package "Direct link to Install the package")

fast-check can be installed into any existing project by running the following command:

* npm* Yarn* pnpm* Bun

```
npm install --save-dev fast-check
```

```
yarn add --dev fast-check
```

```
pnpm add --save-dev fast-check
```

```
bun add --dev fast-check
```

Experimental versions

All versions of fast-check, including experimental ones, are published to [pkg.pr.new](https://github.com/stackblitz-labs/pkg.pr.new). This means you can try out the latest features without waiting for an official release.

Keep in mind that these versions may include unfinished APIs or unstable behaviors. They’re provided for convenience only, and we kindly ask you not to report any bug related to them.

As an example, you can install the latest HEAD by running:

* npm* Yarn* pnpm* Bun

```
npm install --save-dev https://pkg.pr.new/fast-check@main
```

```
yarn add --dev https://pkg.pr.new/fast-check@main
```

```
pnpm add --save-dev https://pkg.pr.new/fast-check@main
```

```
bun add --dev https://pkg.pr.new/fast-check@main
```

Integration with test runners

fast-check is agnostic of the test runner you rely on. It works with any test runner without needing any specific change.

## Simple property[​](https://fast-check.dev/docs/introduction/getting-started/index.html#simple-property "Direct link to Simple property")

Now, that you've it in your project you can start playing with it on any property. Here is an example of property:

```
import fc from 'fast-check';

// Code under test
const contains = (text, pattern) => text.indexOf(pattern) >= 0;

// Properties
describe('properties', () => {
  // string text always contains itself
  it('should always contain itself', () => {
    fc.assert(
      fc.property(fc.string(), (text) => {
        return contains(text, text);
      }),
    );
  });

  // string a + b + c always contains b, whatever the values of a, b and c
  it('should always contain its substrings', () => {
    fc.assert(
      fc.property(fc.string(), fc.string(), fc.string(), (a, b, c) => {
        // Alternatively: no return statement and direct usage of expect or assert
        return contains(a + b + c, b);
      }),
    );
  });
});
```

Hands on Property-Based Testing

If you want to quickly get started with property-based testing, you may check our tutorials and our [quick start guide](https://fast-check.dev/docs/tutorials/quick-start/).

## Walk through the test[​](https://fast-check.dev/docs/introduction/getting-started/index.html#walk-through-the-test "Direct link to Walk through the test")

Let's quickly walk through the core building blocks we had to leverage in the code snippet above. If you want to dig further into each of these building blocks, they will be covered into more details in the following pages of this guide.

### Runner[​](https://fast-check.dev/docs/introduction/getting-started/index.html#runner "Direct link to Runner")

fast-check has several runners. Runners are responsible to interpret and possibly execute the properties or at least part of them. The runner used in the snippet above is `fc.assert`.

`fc.assert` takes a property and runs it multiple times. In case of failure, it will try to reduce the case that caused the failure into something easily readable for a human. For instance, if the test "*should always contain itself*" failed for some inputs, instead of stopping itself when it failed for the first time, `fc.assert` will try to find the smallest value responsible for the error. The reduction capacity will be referred as shrinking in the next sections.

### Property[​](https://fast-check.dev/docs/introduction/getting-started/index.html#property "Direct link to Property")

A property describes:

1. what the user wants to assess — *via a predicate*
2. how to generate the inputs of the predicate — *via arbitraries*

The snippet above declared synchronous properties by calling `fc.property`. Synchronous properties can only deal with synchronous predicates. For asynchronous predicates, users should go for `fc.asyncProperty` instead of `fc.property`.

Whatever the helper you take, the structure to declare a property is the same:

```
fc.property(
  ...arbitraries // how to generate the values received as inputs of the predicate
  predicate // how to check if the code worked
);
```

The predicate is a function taking the values produced by the declared arbitraries as inputs and returning either a boolean value or directly asserting. For instance, our first property could also have leveraged assertions by using the following predicate:

```
(text) => {
  expect(contains(text, text)).toBe(true);
  // return contains(text, text); // <-- the boolean version
};
```

### Arbitrary[​](https://fast-check.dev/docs/introduction/getting-started/index.html#arbitrary "Direct link to Arbitrary")

An arbitrary is responsible to generate random values in a seeded way and to shrink them in case it's requested. Here we only used one kind of arbitrary: `fc.string()`. There are many other built-in ones, and an infinite number can be produced by combining existing ones.

The arbitrary called `fc.string()` is responsible to generate and shrink strings.

[Previous

Introduction](https://fast-check.dev/docs/introduction/index.html)[Next

Why Property-Based?](https://fast-check.dev/docs/introduction/why-property-based/index.html)

* [Install the package](https://fast-check.dev/docs/introduction/getting-started/index.html#install-the-package)* [Simple property](https://fast-check.dev/docs/introduction/getting-started/index.html#simple-property)* [Walk through the test](https://fast-check.dev/docs/introduction/getting-started/index.html#walk-through-the-test)
      + [Runner](https://fast-check.dev/docs/introduction/getting-started/index.html#runner)+ [Property](https://fast-check.dev/docs/introduction/getting-started/index.html#property)+ [Arbitrary](https://fast-check.dev/docs/introduction/getting-started/index.html#arbitrary)
