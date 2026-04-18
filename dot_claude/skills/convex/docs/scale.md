---
title: "Convex Tutorial: Scaling Your App | Convex Developer Hub"
source_url: "https://docs.convex.dev/tutorial/scale"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Tutorial](https://docs.convex.dev/tutorial/index.html)
* 3. Scaling your app

Copy as Markdown

Copied!

Convex was designed from the ground up for scale. In the previous section we
already talked about how keeping your actions small and most of your logic in
queries and mutations are crucial to building fast scalable backends.

Let's talk about a few other ways to keep your app fast and scalable.

## Indexed queries[​](https://docs.convex.dev/tutorial/scale.html#indexed-queries "Direct link to Indexed queries")

Indexes tell the database to create a lookup structure to make it really fast to
filter data. If, in our chat app we wanted to build a way to look up `messages`
from just one user, we'd tell Convex to index the `user` field in the `messages`
table and write the query with the `withIndex` syntax.

[Learn how to use indexes](https://docs.convex.dev/database/reading-data/indexes/index.html).

## Too many writes on the same document[​](https://docs.convex.dev/tutorial/scale.html#too-many-writes-on-the-same-document "Direct link to Too many writes on the same document")

Let's say you decide to show a counter in your app. You may write a mutation
that reads a number field, adds 1, and updates the same field in the database.
At some point, this pattern may cause an
[optimistic concurrency control conflict](https://docs.convex.dev/error.html#1). That means that the
database isn't able to handle updating the document that fast. All databases
have trouble with this sort of pattern.

There are a [few ways to deal with this](https://docs.convex.dev/error.html#remediation), including building
something called a sharded counter...

But before you go learn advanced scaling techniques on your own, there is a
better way with [Convex Components](https://docs.convex.dev/components.html).

## Scaling best practices with Convex Components[​](https://docs.convex.dev/tutorial/scale.html#scaling-best-practices-with-convex-components "Direct link to Scaling best practices with Convex Components")

In the case of the counter above, the Convex team has already built a
[scalable counter](https://www.convex.dev/components/sharded-counter) Convex
component for you to use.

Convex Components are deployed along with your Convex backend but have their own
tables and functions.

As you build more complicated features like [AI agents](https://docs.convex.dev/agents.html),
[workflows](https://www.convex.dev/components/workflow),
[leaderboards](https://www.convex.dev/components/aggregate),
[feature flags](https://www.convex.dev/components/launchdarkly) or
[rate limiters](https://www.convex.dev/components/rate-limiter), you may find
that there is already a Convex Component that solves this problem.
[Learn more about Convex Components here](https://docs.convex.dev/components.html).

[## Components directory](https://www.convex.dev/components)

## Wrap up[​](https://docs.convex.dev/tutorial/scale.html#wrap-up "Direct link to Wrap up")

We've covered a lot of ground in this tutorial. We started by
[building a chat app](https://docs.convex.dev/tutorial/index.html) with queries, mutations and the
database that form the fundamental building blocks of the Convex sync engine. We
then called an [external API](https://docs.convex.dev/tutorial/actions.html) from our backend, using the
scheduler to coordinate the work. Finally, we learned that
[Convex Components](https://docs.convex.dev/components.html) give you scaling best practices in neat
packages.

If you are looking for more tips, read our
[best practices](https://docs.convex.dev/understanding/best-practices/index.html) and join the
[community](https://www.convex.dev/community).

Convex enables you to build your MVP fast and then scale to new heights. Many
great products have already done so. You're in good company.

[Previous

2. Calling external services](https://docs.convex.dev/tutorial/actions.html)[Next

Quickstarts](https://docs.convex.dev/quickstarts.html)
