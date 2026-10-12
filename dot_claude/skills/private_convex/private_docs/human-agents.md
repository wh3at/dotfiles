---
title: "Human Agents | Convex Developer Hub"
source_url: "https://docs.convex.dev/agents/human-agents"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



* [Home](https://docs.convex.dev/index.html)
* [Agents](https://docs.convex.dev/agents.html)
* Human Agents

Copy as Markdown

Copied!

On this page

The Agent component generally takes a prompt from a human or agent, and uses an
LLM to generate a response.

However, there are cases where you want to generate the reply from a human
acting as an agent, such as for customer support.

For full code, check out
[chat/human.ts](https://github.com/get-convex/agent/blob/main/example/convex/chat/human.ts)

## Saving a user message without generating a reply[​](https://docs.convex.dev/agents/human-agents.html#saving-a-user-message-without-generating-a-reply "Direct link to Saving a user message without generating a reply")

You can save a message from a user without generating a reply by using the
`saveMessage` function.

```
import { saveMessage } from "@convex-dev/agent";
import { components } from "./_generated/api";

await saveMessage(ctx, components.agent, {
  threadId,
  prompt: "The user message",
});
```

## Saving a message from a human as an agent[​](https://docs.convex.dev/agents/human-agents.html#saving-a-message-from-a-human-as-an-agent "Direct link to Saving a message from a human as an agent")

Similarly, you can save a message from a human as an agent in the same way,
using the `message` field to specify the role and agent name:

```
import { saveMessage } from "@convex-dev/agent";
import { components } from "./_generated/api";

await saveMessage(ctx, components.agent, {
  threadId,
  agentName: "Alex",
  message: { role: "assistant", content: "The human reply" },
});
```

## Storing additional metadata about human agents[​](https://docs.convex.dev/agents/human-agents.html#storing-additional-metadata-about-human-agents "Direct link to Storing additional metadata about human agents")

You can store additional metadata about human agents by using the `saveMessage`
function, and adding the `metadata` field.

```
await saveMessage(ctx, components.agent, {
  threadId,
  agentName: "Alex",
  message: { role: "assistant", content: "The human reply" },
  metadata: {
    provider: "human",
    providerMetadata: {
      human: {
        /* ... */
      },
    },
  },
});
```

## Deciding who responds next[​](https://docs.convex.dev/agents/human-agents.html#deciding-who-responds-next "Direct link to Deciding who responds next")

You can choose whether the LLM or human responds next in a few ways:

1. Explicitly store in the database whether the user or LLM is assigned to the
   thread.
2. Using a call to a cheap and fast LLM to decide if the user question requires
   a human response.
3. Using vector embeddings of the user question and message history to make the
   decision, based on a corpus of sample questions and what questions are better
   handled by humans.
4. Have the LLM generate an object response that includes a field indicating
   whether the user question requires a human response.
5. Providing a tool to the LLM to decide if the user question requires a human
   response. The human response is then the tool response message.

## Human responses as tool calls[​](https://docs.convex.dev/agents/human-agents.html#human-responses-as-tool-calls "Direct link to Human responses as tool calls")

You can have the LLM generate a tool call to a human agent to provide context to
answer the user question by providing a tool that doesn't have a handler. Note:
this generally happens when the LLM still intends to answer the question, but
needs human intervention to do so, such as confirmation of a fact.

```
import { tool } from "ai";
import { z } from "zod/v3";

const askHuman = tool({
  description: "Ask a human a question",
  parameters: z.object({
    question: z.string().describe("The question to ask the human"),
  }),
});

export const ask = action({
  args: { question: v.string(), threadId: v.string() },
  handler: async (ctx, { question, threadId }) => {
    const result = await agent.generateText(
      ctx,
      { threadId },
      {
        prompt: question,
        tools: { askHuman },
      },
    );
    const supportRequests = result.toolCalls
      .filter((tc) => tc.toolName === "askHuman")
      .map(({ toolCallId, args: { question } }) => ({
        toolCallId,
        question,
      }));
    if (supportRequests.length > 0) {
      // Do something so the support agent knows they need to respond,
      // e.g. save a message to their inbox
      // await ctx.runMutation(internal.example.sendToSupport, {
      //   threadId,
      //   supportRequests,
      // });
    }
  },
});

export const humanResponseAsToolCall = internalAction({
  args: {
    humanName: v.string(),
    response: v.string(),
    toolCallId: v.string(),
    threadId: v.string(),
    messageId: v.string(),
  },
  handler: async (ctx, args) => {
    await agent.saveMessage(ctx, {
      threadId: args.threadId,
      message: {
        role: "tool",
        content: [
          {
            type: "tool-result",
            result: args.response,
            toolCallId: args.toolCallId,
            toolName: "askHuman",
          },
        ],
      },
      metadata: {
        provider: "human",
        providerMetadata: {
          human: { name: args.humanName },
        },
      },
    });
    // Continue generating a response from the LLM
    await agent.generateText(
      ctx,
      { threadId: args.threadId },
      {
        promptMessageId: args.messageId,
      },
    );
  },
});
```

[Previous

Workflows](https://docs.convex.dev/agents/workflows.html)[Next

Files](https://docs.convex.dev/agents/files.html)

* [Saving a user message without generating a reply](https://docs.convex.dev/agents/human-agents.html#saving-a-user-message-without-generating-a-reply)
* [Saving a message from a human as an agent](https://docs.convex.dev/agents/human-agents.html#saving-a-message-from-a-human-as-an-agent)
* [Storing additional metadata about human agents](https://docs.convex.dev/agents/human-agents.html#storing-additional-metadata-about-human-agents)
* [Deciding who responds next](https://docs.convex.dev/agents/human-agents.html#deciding-who-responds-next)
* [Human responses as tool calls](https://docs.convex.dev/agents/human-agents.html#human-responses-as-tool-calls)
