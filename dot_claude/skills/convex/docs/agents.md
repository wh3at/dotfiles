---
title: "AI Agents | Convex Developer Hub"
source_url: "https://docs.convex.dev/agents"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



Copy as Markdown

Copied!

On this page

## Building AI Agents with Convex[​](https://docs.convex.dev/agents.html#building-ai-agents-with-convex "Direct link to Building AI Agents with Convex")

Convex provides powerful building blocks for building agentic AI applications,
leveraging Components and existing Convex features.

With Convex, you can separate your long-running agentic workflows from your UI,
without the user losing reactivity and interactivity. The message history with
an LLM is persisted by default, live updating on every client, and easily
composed with other Convex features using code rather than configuration.

## Agent Component[​](https://docs.convex.dev/agents.html#agent-component "Direct link to Agent Component")

The Agent component is a core building block for building AI agents. It manages
threads and messages, around which your Agents can cooperate in static or
dynamic workflows.

[Agent Component YouTube
Video](https://www.youtube.com/embed/tUKMPUlOCHY?si=ce-M8pt6EWDZ8tfd)

### Core Concepts[​](https://docs.convex.dev/agents.html#core-concepts "Direct link to Core Concepts")

* Agents organize LLM prompting with associated models, prompts, and
  [Tools](https://docs.convex.dev/agents/tools.html). They can generate and stream both text and objects.
* Agents can be used in any Convex action, letting you write your agentic code
  alongside your other business logic with all the abstraction benefits of using
  code rather than static configuration.
* [Threads](https://docs.convex.dev/agents/threads.html) persist [messages](https://docs.convex.dev/agents/messages.html) and can be
  shared by multiple users and agents (including
  [human agents](https://docs.convex.dev/agents/human-agents.html)).
* [Conversation context](https://docs.convex.dev/agents/context.html) is automatically included in each LLM
  call, including built-in hybrid vector/text search for messages.

### Advanced Features[​](https://docs.convex.dev/agents.html#advanced-features "Direct link to Advanced Features")

* [Workflows](https://docs.convex.dev/agents/workflows.html) allow building multi-step operations that can
  span agents, users, durably and reliably.
* [RAG](https://docs.convex.dev/agents/rag.html) techniques are also supported for prompt augmentation
  either up front or as tool calls using the
  [RAG Component](https://www.convex.dev/components/rag).
* [Files](https://docs.convex.dev/agents/files.html) can be used in the chat history with automatic saving
  to [file storage](https://docs.convex.dev/file-storage.html).

### Debugging and Tracking[​](https://docs.convex.dev/agents.html#debugging-and-tracking "Direct link to Debugging and Tracking")

* [Debugging](https://docs.convex.dev/agents/debugging.html) is supported, including the
  [agent playground](https://docs.convex.dev/agents/playground.html) where you can inspect all metadata and
  iterate on prompts and context settings.
* [Usage tracking](https://docs.convex.dev/agents/usage-tracking.html) enables usage billing for users and
  teams.
* [Rate limiting](https://docs.convex.dev/agents/rate-limiting.html) helps control the rate at which users
  can interact with agents and keep you from exceeding your LLM provider's
  limits.

[## Build your first Agent](https://docs.convex.dev/agents/getting-started.html)

Learn more about the motivation by reading:
[AI Agents with Built-in Memory](https://stack.convex.dev/ai-agents).

Sample code:

```
import { Agent } from "@convex-dev/agents";
import { openai } from "@ai-sdk/openai";
import { components } from "./_generated/api";
import { action } from "./_generated/server";

// Define an agent
const supportAgent = new Agent(components.agent, {
  name: "Support Agent",
  chat: openai.chat("gpt-4o-mini"),
  instructions: "You are a helpful assistant.",
  tools: { accountLookup, fileTicket, sendEmail },
});

// Use the agent from within a normal action:
export const createThread = action({
  args: { prompt: v.string() },
  handler: async (ctx, { prompt }) => {
    const { threadId, thread } = await supportAgent.createThread(ctx);
    const result = await thread.generateText({ prompt });
    return { threadId, text: result.text };
  },
});

// Pick up where you left off, with the same or a different agent:
export const continueThread = action({
  args: { prompt: v.string(), threadId: v.string() },
  handler: async (ctx, { prompt, threadId }) => {
    // This includes previous message history from the thread automatically.
    const { thread } = await anotherAgent.continueThread(ctx, { threadId });
    const result = await thread.generateText({ prompt });
    return result.text;
  },
});
```

[Previous

Convex MCP Server](https://docs.convex.dev/ai/convex-mcp-server.html)[Next

Getting Started](https://docs.convex.dev/agents/getting-started.html)

* [Building AI Agents with Convex](https://docs.convex.dev/agents.html#building-ai-agents-with-convex)
* [Agent Component](https://docs.convex.dev/agents.html#agent-component)
  + [Core Concepts](https://docs.convex.dev/agents.html#core-concepts)
  + [Advanced Features](https://docs.convex.dev/agents.html#advanced-features)
  + [Debugging and Tracking](https://docs.convex.dev/agents.html#debugging-and-tracking)
