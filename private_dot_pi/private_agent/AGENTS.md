## Pi subagent budgets and timeouts

When calling the `subagent` tool with `agent: "worker"`, omit `turnBudget`, `timeoutMs`, and `maxRuntimeMs` unless I explicitly request a per-run override. Allow the worker to run without caller-imposed turn or runtime limits instead of inventing them.

## Coding rules

IMPORTANT: Do not write overly defensive code. Always prefer simplicity over pathological complexity.

## UI rules

操作対象が明らかな場合、ラベルは動詞のみ

## Local web previews

ユーザーにローカルWeb画面を提示する場合:

1. `0.0.0.0`へバインドし、長時間セッションで起動する
2. `tailscale ip -4`から閲覧URLを作る
3. `curl -fsS -o /dev/null "$URL"`で接続を確認する
4. 確認済みのURLを提示する
5. 終了時は起動時に得た識別子で停止する
