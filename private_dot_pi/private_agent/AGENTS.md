## Pi subagent budgets and timeouts

When calling the `subagent` tool with `agent: "worker"`, omit `turnBudget`, `timeoutMs`, and `maxRuntimeMs` unless I explicitly request a per-run override. Allow the worker to run without caller-imposed turn or runtime limits instead of inventing them.
