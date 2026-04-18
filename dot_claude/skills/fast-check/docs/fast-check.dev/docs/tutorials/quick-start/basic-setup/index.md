---
title: "Basic Setup | fast-check"
source_url: "https://fast-check.dev/docs/tutorials/quick-start/basic-setup/index"
fetched_at: "2025-12-29T00:50:44.267866+00:00"
---



* * [Tutorials](https://fast-check.dev/docs/tutorials/index.html)* [Quick Start](https://fast-check.dev/docs/tutorials/quick-start/index.html)* Basic Setup

On this page

Setup your environment

## Setup the project[​](https://fast-check.dev/docs/tutorials/quick-start/basic-setup/index.html#setup-the-project "Direct link to Setup the project")

In this tutorial, you'll need to have [Node.js](https://nodejs.org/en/download/) installed.

We will start from an already bootstrapped project to focus on our target: writing our first test.

Setup

You may want to refer to our [Getting Started](https://fast-check.dev/docs/introduction/getting-started/) section to setup fast-check in an existing project or without tutorial related code.

* npm* Yarn* pnpm* Bun

```
npx degit dubzzz/fast-check/website/templates/fast-check-tutorial fast-check-tutorial
cd fast-check-tutorial
npm i
```

```
yarn dlx degit dubzzz/fast-check/website/templates/fast-check-tutorial fast-check-tutorial
cd fast-check-tutorial
npm i
```

```
pnpm dlx degit dubzzz/fast-check/website/templates/fast-check-tutorial fast-check-tutorial
cd fast-check-tutorial
npm i
```

```
bun x degit dubzzz/fast-check/website/templates/fast-check-tutorial fast-check-tutorial
cd fast-check-tutorial
npm i
```

## Project structure[​](https://fast-check.dev/docs/tutorials/quick-start/basic-setup/index.html#project-structure "Direct link to Project structure")

Our tutorial project is rather small, it contains the following files:

* `package.json` — the dependencies, scripts… used by the project
* `sort.mjs` — the code we want to test
* `sort.test.mjs` — our test file

This project is relying on [Vitest](https://vitest.dev/) to run the tests.

Test runners

Whether you prefer using [Jest](https://jestjs.io/), [Vitest](https://vitest.dev/), [Ava](https://github.com/avajs/ava#readme) or any other, choice is yours! fast-check is designed to be independent of the test runner you use, so you can choose the runner that works best for your project.

## Run the tests[​](https://fast-check.dev/docs/tutorials/quick-start/basic-setup/index.html#run-the-tests "Direct link to Run the tests")

You can run the tests written in the test file with:

* npm* Yarn* pnpm* Bun

```
npm test
```

```
yarn test
```

```
pnpm test
```

```
bun run test
```

We are now ready to start!

[Previous

Quick Start](https://fast-check.dev/docs/tutorials/quick-start/index.html)[Next

Our first Property-Based Test](https://fast-check.dev/docs/tutorials/quick-start/our-first-property-based-test/index.html)

* [Setup the project](https://fast-check.dev/docs/tutorials/quick-start/basic-setup/index.html#setup-the-project)* [Project structure](https://fast-check.dev/docs/tutorials/quick-start/basic-setup/index.html#project-structure)* [Run the tests](https://fast-check.dev/docs/tutorials/quick-start/basic-setup/index.html#run-the-tests)
