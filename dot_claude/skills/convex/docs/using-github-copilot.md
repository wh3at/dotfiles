---
title: "Using GitHub Copilot with Convex | Convex Developer Hub"
source_url: "https://docs.convex.dev/ai/using-github-copilot"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [AI Code Gen](https://docs.convex.dev/ai.html)
* Using GitHub Copilot

Copy as Markdown

Copied!

On this page

[GitHub Copilot](https://github.com/features/copilot), the AI built into VS
Code, makes it easy to write and maintain apps built with Convex. Let's walk
through how to setup GitHub Copilot for the best possible results with Convex.

## Add Convex Instructions[​](https://docs.convex.dev/ai/using-github-copilot.html#add-convex-instructions "Direct link to Add Convex Instructions")

Add the following
[instructions](https://code.visualstudio.com/docs/copilot/copilot-customization#_instruction-files)
file to your `.github/instructions` directory in your project and it will
automatically be included when working with TypeScript or JavaScript files:

* [convex.instructions.md](https://convex.link/convex_github_copilot_instructions)

![Showing Where to Put GitHub Copilot Instructions](https://docs.convex.dev/assets/images/showing-where-to-put-convex-instructions-1d22c1b802b42443b4808e0dd27f0746.png)

If you would rather that the instructions file is NOT automatically pulled into
context then open the file in your editor and alter the `applyTo` field at the
top. Read more about instructions files here:
<https://code.visualstudio.com/docs/copilot/copilot-customization#_use-instructionsmd-files>

We're constantly working on improving the quality of these rules for Convex by
using rigorous evals. You can help by
[contributing to our evals repo](https://github.com/get-convex/convex-evals).

## Setup the Convex MCP Server[​](https://docs.convex.dev/ai/using-github-copilot.html#setup-the-convex-mcp-server "Direct link to Setup the Convex MCP Server")

The Convex CLI comes with a
[Convex Model Context Protocol](https://docs.convex.dev/ai/convex-mcp-server.html) (MCP) server built
in. The Convex MCP server gives your AI coding agent access to the your Convex
deployment to query and optimize your project.

To get started with
[MCP in VS Code](https://code.visualstudio.com/docs/copilot/chat/mcp-servers)
then create a file in `.vscode/mcp.json` and add the following:

```
{
  "servers": {
    "convex-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "convex@latest", "mcp", "start"]
    }
  }
}
```

Once this is done it will take a few seconds to start up the MCP server and then
you should see the Convex tool listed in the codelens:

![Convex Tool in Codelens](https://docs.convex.dev/assets/images/convex-tool-in-codelens-0cf36ed79938643797e93dd08ef3565c.png)

and in the selection of tools that the model has access to in chat:

![Convex Tool in Chat](https://docs.convex.dev/assets/images/convex-tools-in-chat-eef97848e328479e7e1b06452b7934ea.png)

Now start asking it questions like:

* Evaluate and convex schema and suggest improvements
* What are this app's public endpoints?
* Run the `my_convex_function` query

If you want to use the MCP server globally for all your projects then you can
add it to your user settings, please see these docs for more information:
<https://code.visualstudio.com/docs/copilot/chat/mcp-servers#_add-an-mcp-server-to-your-user-settings>

[Previous

Using Cursor](https://docs.convex.dev/ai/using-cursor.html)[Next

Using Windsurf](https://docs.convex.dev/ai/using-windsurf.html)

* [Add Convex Instructions](https://docs.convex.dev/ai/using-github-copilot.html#add-convex-instructions)
* [Setup the Convex MCP Server](https://docs.convex.dev/ai/using-github-copilot.html#setup-the-convex-mcp-server)
