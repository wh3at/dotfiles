---
title: "Property Based Testing with Deno test runner | fast-check"
source_url: "https://fast-check.dev/docs/tutorials/setting-up-your-test-environment/property-based-testing-with-deno-test-runner/index"
fetched_at: "2025-12-29T00:50:44.267866+00:00"
---



* * [Tutorials](https://fast-check.dev/docs/tutorials/index.html)* [Setting up your Test Environment](https://fast-check.dev/docs/tutorials/setting-up-your-test-environment/index.html)* With Deno test runner

On this page

Want to start playing with property-based testing in [Deno](https://deno.com/)? Welcome to this short and concise tutorial on integrating fast-check within Deno.

## Your first test[​](https://fast-check.dev/docs/tutorials/setting-up-your-test-environment/property-based-testing-with-deno-test-runner/index.html#your-first-test "Direct link to Your first test")

Let's write a test for [FizzBuzz](https://en.wikipedia.org/wiki/Fizz_buzz) using fast-check.

fizzbuzz.test.ts

```
import { assertStringIncludes } from "jsr:@std/assert";
import fc from "npm:fast-check";

Deno.test({
  name: "should print Fizz whenever divisible by 3",
  fn() {
    fc.assert(
      fc.property(
        fc.nat().map((n) => n * 3),
        (n) => {
          assertStringIncludes(fizzbuzz(n), "Fizz");
        }
      )
    );
  },
});

// Code under test: should rather be imported from another file
function fizzbuzz(n: number): string {
  return n % 3 === 0
    ? n % 5 === 0
      ? "Fizz Buzz"
      : "Fizz"
    : n % 5 === 0
    ? "Buzz"
    : String(n);
}
```

You can now execute it by running the following command in a terminal:

```
deno test
```

You've written and executed your first Property-Based Test using the Deno test runner 🚀

## Going further[​](https://fast-check.dev/docs/tutorials/setting-up-your-test-environment/property-based-testing-with-deno-test-runner/index.html#going-further "Direct link to Going further")

Property-based testing can be leveraged to test complex systems. This snippet was just a simple Hello-World example to give you a basic starting point. Our documentation provides advanced tricks to push the technique further, including [detecting race conditions](https://fast-check.dev/docs/tutorials/detect-race-conditions/index.html) and [finding vulnerabilities](https://fast-check.dev/blog/2023/09/21/detect-prototype-pollution-automatically/).

FizzBuzz alone can also be extended with more properties. You may want to refer to [this article](https://dev.to/dubzzz/advent-of-pbt-2021-day-3-solution-366l) for more ideas.

[Previous

With Bun test runner](https://fast-check.dev/docs/tutorials/setting-up-your-test-environment/property-based-testing-with-bun-test-runner/index.html)[Next

With Node.js test runner](https://fast-check.dev/docs/tutorials/setting-up-your-test-environment/property-based-testing-with-nodejs-test-runner/index.html)

* [Your first test](https://fast-check.dev/docs/tutorials/setting-up-your-test-environment/property-based-testing-with-deno-test-runner/index.html#your-first-test)* [Going further](https://fast-check.dev/docs/tutorials/setting-up-your-test-environment/property-based-testing-with-deno-test-runner/index.html#going-further)
