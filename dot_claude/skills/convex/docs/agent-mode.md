---
title: "Agent Mode | Convex Developer Hub"
source_url: "https://docs.convex.dev/cli/agent-mode"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [CLI](https://docs.convex.dev/using/cli.html)
* Agent Mode

Copy as Markdown

Copied!

When logged in on your own machine, agents like Cursor and Claude Code can run
CLI commands like `npx convex env list` that use your logged-in credentials run
commands against your personal dev environment as if you ran the commands
yourself. This works well when you're collaborating with an agent; just like
when the agent runs `git commit -am "Fix."`, the commit will use your local git
credentials.

But when cloud-based coding agents like Jules, Devin, Codex, or Cursor
background agents run Convex CLI commands, they can't log in. And if you do log
in for them, the agent will use your default dev deployment to develop,
conflicting with your own changes!

Instead, set `CONVEX_AGENT_MODE=anonymous` in this environment, causing the
agent to use [anonymous development](https://docs.convex.dev/cli/local-deployments.html) to
run a separate Convex backend on the VM where the agent is working.

Convex Agent Mode is in beta

Convex Agent Mode is currently a [beta
feature](https://docs.convex.dev/production/state/index.html#beta-features). If you have feedback or feature
requests, [let us know on Discord](https://convex.dev/community)!

You can set this variable in .env.local or set it in the agent's environment.

```
CONVEX_AGENT_MODE=anonymous npx convex dev
```

In the future `CONVEX_AGENT_MODE` may support other behaviors like allowing
agents to provision their own short-lived cloud deployments.

[Previous

Local Deployments](https://docs.convex.dev/cli/local-deployments.html)[Next

Deploy keys](https://docs.convex.dev/cli/deploy-key-types.html)
