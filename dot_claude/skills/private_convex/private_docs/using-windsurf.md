---
title: "Using Windsurf with Convex | Convex Developer Hub"
source_url: "https://docs.convex.dev/ai/using-windsurf"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [AI Code Gen](https://docs.convex.dev/ai.html)
* Using Windsurf

Copy as Markdown

Copied!

On this page

[Windsurf](https://codeium.com/windsurf), the AI code editor, makes it easy to
write and maintain apps built with Convex. Let's walk through how to setup
Windsurf for the best possible results with Convex.

## Add Convex Rules[​](https://docs.convex.dev/ai/using-windsurf.html#add-convex-rules "Direct link to Add Convex Rules")

Add the following rules file to your project and refer to it directly when
prompting for changes:

* [Convex Rules](https://convex.link/convex_rules.txt)

We're constantly working on improving the quality of these rules for Convex by
using rigorous evals. You can help by
[contributing to our evals repo](https://github.com/get-convex/convex-evals).

## Setup the Convex MCP Server[​](https://docs.convex.dev/ai/using-windsurf.html#setup-the-convex-mcp-server "Direct link to Setup the Convex MCP Server")

The Convex CLI comes with a
[Convex Model Context Protocol](https://docs.convex.dev/ai/convex-mcp-server.html) (MCP) server built
in. The Convex MCP server gives your AI coding agent access to the your Convex
deployment to query and optimize your project.

To get started with Windsurf, open "Windsurf Settings > Cascade > Model Context
Protocol (MCP) Servers", click on "Add Server", click "Add custom server", and
add the following configuration for Convex.

```
{
  "mcpServers": {
    "convex": {
      "command": "npx",
      "args": ["-y", "convex@latest", "mcp", "start"]
    }
  }
}
```

After adding the server return to the "Windsurf Settings > Cascade > Model
Context Protocol (MCP) Servers" screen an click "Refresh" button for Windsurf to
pick up the new server.

Once this is done you should see the Convex tool listed in the servers:

![Chat UI](https://docs.convex.dev/assets/images/windsurf_convex_mcp-ed91858fc5df64ae0b900f95b69ae2ad.png)

Now start asking it questions like:

* Evaluate and convex schema and suggest improvements
* What are this app's public endpoints?
* Run the `my_convex_function` query

[Previous

Using GitHub Copilot](https://docs.convex.dev/ai/using-github-copilot.html)[Next

Convex MCP Server](https://docs.convex.dev/ai/convex-mcp-server.html)

* [Add Convex Rules](https://docs.convex.dev/ai/using-windsurf.html#add-convex-rules)
* [Setup the Convex MCP Server](https://docs.convex.dev/ai/using-windsurf.html#setup-the-convex-mcp-server)
