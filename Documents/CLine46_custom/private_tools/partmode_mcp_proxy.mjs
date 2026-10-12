#!/usr/bin/env node

import { createInterface } from "node:readline";

const endpoint = "https://partmode.com/mcp";
const upstreamProtocol = "2025-11-25";
const agentKey = process.env.PARTMODE_AGENT_KEY;

if (!agentKey) {
  console.error("PARTMODE_AGENT_KEY is not set");
  process.exit(1);
}

async function forward(message) {
  const clientProtocol = message.params?.protocolVersion;
  const upstreamMessage =
    message.method === "initialize"
      ? {
          ...message,
          params: { ...message.params, protocolVersion: upstreamProtocol },
        }
      : message;

  const response = await fetch(endpoint, {
    method: "POST",
    headers: {
      Accept: "application/json, text/event-stream",
      Authorization: `Bearer ${agentKey}`,
      "Content-Type": "application/json",
      "MCP-Protocol-Version": upstreamProtocol,
    },
    body: JSON.stringify(upstreamMessage),
  });

  if (response.status === 202 || response.status === 204) return;

  const text = await response.text();
  if (!text) return;

  const result = JSON.parse(text);
  if (message.method === "initialize" && result.result && clientProtocol) {
    result.result.protocolVersion = clientProtocol;
  }
  process.stdout.write(`${JSON.stringify(result)}\n`);
}

const lines = createInterface({ input: process.stdin, crlfDelay: Infinity });

for await (const line of lines) {
  if (!line.trim()) continue;
  try {
    await forward(JSON.parse(line));
  } catch (error) {
    console.error(error instanceof Error ? error.message : String(error));
  }
}
