## Pi subagent budgets and timeouts

When calling the `subagent` tool with `agent: "worker"`, omit `turnBudget`, `timeoutMs`, and `maxRuntimeMs` unless I explicitly request a per-run override. Rely on the user-configured pi-subagents turn budget and allow the worker to run without a caller-imposed runtime deadline instead of inventing limits.
