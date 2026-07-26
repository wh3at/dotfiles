## Pi subagent budgets and timeouts

When calling the `subagent` tool with `agent: "worker"`, omit `turnBudget`, `timeoutMs`, and `maxRuntimeMs` unless I explicitly request a per-run override. Allow the worker to run without caller-imposed turn or runtime limits instead of inventing them.

## Coding rules

IMPORTANT: Do not write overly defensive code. Always prefer simplicity over pathological complexity.

## UI rules

操作対象が明らかな場合、ラベルは動詞のみ
