---
title: "ESLint rules | Convex Developer Hub"
source_url: "https://docs.convex.dev/eslint"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



Copy as Markdown

Copied!

On this page

ESLint rules for Convex functions enforce best practices. Let us know if there's
a rule you would find helpful!

## Setup[​](https://docs.convex.dev/eslint.html#setup "Direct link to Setup")

For ESLint 9 (flat config, using `eslint.config.js`), install the rules with:

```
npm i @convex-dev/eslint-plugin --save-dev
```

and add this to your `eslint.config.js` file:

```
import convexPlugin from "@convex-dev/eslint-plugin";
import { defineConfig } from "eslint/config";

export default defineConfig([
  // Other configurations

  ...convexPlugin.configs.recommended,
]);
```

If you’re using the deprecated `.eslintrc.js` format

Install these two libraries:

```
npm i @typescript-eslint/eslint-plugin @convex-dev/eslint-plugin --save-dev
```

In `.eslintrc.js`, add:

```
module.exports =
  extends: [
    // Other configurations
    "plugin:@typescript-eslint/recommended",
    "plugin:@convex-dev/recommended",
  ],
  ignorePatterns: ["node_modules/", "dist/", "build/"],
};
```

If your Convex functions are in a directory other than `convex`

By default, the Convex ESLint plugin will only apply rules in the `convex`
directory.

If you’re
[customizing the Convex directory location](https://docs.convex.dev/production/project-configuration.html#changing-the-convex-folder-name-or-location),
here’s how to adapt your ESLint configuration:

```
// eslint.config.js

import convexPlugin from "@convex-dev/eslint-plugin";

const recommendedConfig = convexPlugin.configs.recommended[0];
const recommendedRules = recommendedConfig.rules;

export default [
  // Other configurations go here...

  // Custom configuration with modified directory pattern
  {
    files: ["**/src/convex/**/*.ts"],
    plugins: {
      "@convex-dev": convexPlugin,
    },
    rules: recommendedRules,
  },
];
```

If you’re using the `next lint` command from Next.js

For `next lint` to run ESLint on your `convex` directory you need to add that
directory to the default set of directories. Add this section to your
`next.config.ts`:

```
const nextConfig: NextConfig = {
  /* other options here */

  eslint: {
    dirs: ["pages", "app", "components", "lib", "src", "convex"],
  },
};
```

## Rules[​](https://docs.convex.dev/eslint.html#rules "Direct link to Rules")

| Rule | Recommended | Auto-fixable |
| --- | --- | --- |
| [`@convex-dev/no-old-registered-function-syntax`](https://docs.convex.dev/eslint.html#no-old-registered-function-syntax) Prefer object syntax for registered functions | ✅ | 🔧 |
| [`@convex-dev/require-argument-validators`](https://docs.convex.dev/eslint.html#require-argument-validators) Require argument validators for Convex functions | ✅ | 🔧 |
| [`@convex-dev/import-wrong-runtime`](https://docs.convex.dev/eslint.html#import-wrong-runtime) Prevent Convex runtime files from importing from Node runtime files |  |  |

### no-old-registered-function-syntax[​](https://docs.convex.dev/eslint.html#no-old-registered-function-syntax "Direct link to no-old-registered-function-syntax")

Prefer object syntax for registered functions.

Convex queries, mutations, and actions can be defined with a single function or
with an object containing a handler property. Using the objects makes it
possible to add argument and return value validators, so is always preferable.

```
// ✅ Allowed by this rule:
export const list = query({
  handler: async (ctx) => {
    const data = await ctx.db.query("messages").collect();
    ...
  },
});

// ❌ Not allowed by this rule:
export const list = query(async (ctx) => {
  const data = await ctx.db.query("messages").collect();
  ...
});
```

### require-argument-validators[​](https://docs.convex.dev/eslint.html#require-argument-validators "Direct link to require-argument-validators")

Require argument validators for Convex functions.

Convex queries, mutations, and actions can validate their arguments before
beginning to run the handler function. Besides being a concise way to validate,
the types of arguments, using argument validators enables generating more
descriptive function specs and therefore OpenAPI bindings.

```
// ✅ Allowed by this rule:
export const list = query({
  args: {},
  handler: async (ctx) => {
    ...
  },
});

// ✅ Allowed by this rule:
export const list = query({
  args: { channel: v.id('channel') },
  handler: async (ctx, { channel }) => {
    ...
  },
});

// ❌ Not allowed with option { ignoreUnusedArguments: false } (default)
// ✅ Allowed with option { ignoreUnusedArguments: true }
export const list = query({
  handler: async (ctx) => {
    ...
  },
});

// ❌ Not allowed by this rule:
export const list = query({
  handler: async (ctx, { channel }: { channel: Id<"channel"> }) => {
    ...
  },
});
```

This rule can be customized to tolerate functions that don’t define an argument
validator but don’t use their arguments. Here’s how you can set up the rule to
work this way:

```
// eslint.config.js

export default defineConfig([
  // Your other rules…

  {
    files: ["**/convex/**/*.ts"],
    rules: {
      "@convex-dev/require-args-validator": [
        "error",
        {
          ignoreUnusedArguments: true,
        },
      ],
    },
  },
]);
```

### import-wrong-runtime[​](https://docs.convex.dev/eslint.html#import-wrong-runtime "Direct link to import-wrong-runtime")

Prevent Convex runtime files from importing from Node runtime files (files with
a `"use node"` directive).

This rule is experimental. Please let us know if you find it helpful!

```
// In a file that doesn’t use `"use node"`:

// ✅ Allowed by this rule:
import { someFunction } from "./someOtherFile"; // where someOtherFile doesn't use `"use node"`

// ❌ Not allowed by this rule:
import { someFunction } from "./someNodeFile"; // where someNodeFile uses `"use node"`
```

[Previous

Errors](https://docs.convex.dev/error.html)

* [Setup](https://docs.convex.dev/eslint.html#setup)
* [Rules](https://docs.convex.dev/eslint.html#rules)
  + [no-old-registered-function-syntax](https://docs.convex.dev/eslint.html#no-old-registered-function-syntax)
  + [require-argument-validators](https://docs.convex.dev/eslint.html#require-argument-validators)
  + [import-wrong-runtime](https://docs.convex.dev/eslint.html#import-wrong-runtime)
