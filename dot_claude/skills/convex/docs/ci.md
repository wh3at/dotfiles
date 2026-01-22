---
title: "Continuous Integration | Convex Developer Hub"
source_url: "https://docs.convex.dev/testing/ci"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Testing](https://docs.convex.dev/testing.html)
* CI

Copy as Markdown

Copied!

On this page

Continuous integration allows your team to move fast by combining changes from
all team members and automatically testing them on a remote machine.

## Testing in GitHub Actions[​](https://docs.convex.dev/testing/ci.html#testing-in-github-actions "Direct link to Testing in GitHub Actions")

It's easy if you're using [GitHub](https://docs.github.com/en/actions) to set up
[CI](https://docs.github.com/en/actions/automating-builds-and-tests/about-continuous-integration)
workflow for running your test suite:

.github/workflows/test.yml

```
name: Run Tests

on: [pull_request, push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
      - run: npm ci
      - run: npm run test
```

After you commit and push this file to your repository, GitHub will run
`npm run test` every time you create a pull request or push a new commit.

[Previous

Local Backend](https://docs.convex.dev/testing/convex-backend.html)[Next

Deploying Your App to Production](https://docs.convex.dev/production.html)

* [Testing in GitHub Actions](https://docs.convex.dev/testing/ci.html#testing-in-github-actions)
