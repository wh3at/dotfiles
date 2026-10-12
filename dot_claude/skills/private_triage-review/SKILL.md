---
name: triage-review
description: Triage unresolved GitHub Pull Request review threads for the current branch using gh CLI. Use when a user asks to fetch the oldest unresolved PR review comment, resolve the thread immediately, assess the comment's validity, propose minimal next-action choices by number, and optionally implement code changes + tests, then ask about committing per project rules.
---

# GitHub PR Review Triage (Current Branch)

## Overview
Triage exactly one unresolved review thread on the current-branch PR: fetch the oldest unresolved thread, resolve it immediately, assess validity, propose minimal next actions, and execute the user’s selection.

## Workflow

### 1) Preconditions
- Work inside a git repo with a GitHub PR for the current branch.
- Use `gh` CLI. If auth/repo is missing, report and stop.
- If a repo has AGENTS.md, follow it for any project rules (including tests and commit conventions).

### 2) Fetch the oldest unresolved review thread and resolve it immediately
- Run the script; it selects the oldest unresolved thread across all pages and resolves it.
- If a thread is outdated, the script resolves it and skips to the next thread automatically.
- If no unresolved threads, report and stop.

Run:
```bash
python3 ~/.claude/skills/triage-review/scripts/triage_oldest_thread.py
```

Optional flags:
- `--dry-run` to select without resolving
- `--self-test` to run a non-network test

The script prints JSON with PR and thread details:
- `thread.id`, `thread.createdAt`, `thread.path`, `thread.line`
- `thread.firstComment`, `thread.lastComment`
- `resolved` (empty on dry-run)

### 3) Review context and assess validity
- Inspect the referenced file and line range; also inspect the PR diff for that path.
- Decide if the comment is valid, partially valid, or likely incorrect.
- Keep the assessment concise and grounded in code evidence.

### 4) Present minimal next actions (numbered)
Offer the smallest viable set of options, for example:
1) Implement fix + tests
2) 保留（スレッドを未解決に戻す）
3) 何もしない

Always wait for the user to choose by number.
Always present the numbered action choices in Japanese (the rest of the response can follow the user's language).
Based on the Assessment, mark exactly one recommended option by appending a clear marker (e.g., "←おすすめ").

### 6) If the user chooses “Implement fix + tests”
- Apply the minimal code change needed.
- Run tests according to project rules (AGENTS.md / CONTRIBUTING / package scripts). If unclear, ask which tests to run.
- Summarize what changed and the test results.
- If tests pass, commit the changes following the project’s commit rules (do not ask).

### 7) If the user chooses a non-code option
- Do not modify code.
- If replying on the PR thread, keep it brief and focused; keep the thread resolved.

## Resources
- `scripts/triage_oldest_thread.py`: Fetch oldest unresolved review thread for current-branch PR and resolve it immediately.

## Output Template
Note: Next actionの選択肢では、必ずおすすめの選択肢の末尾に「←おすすめ」を付ける（テンプレート本文には含めない）。
Use this structure in responses:

```
- レビュー内容: <レビュー内容の要約>
- スレッド: <id> (<createdAt>)
- ファイル: <path>:<line>
- 最初のコメント: <author> — <summary>
- 最新コメント: <author> — <summary>

Assessment
- 妥当性: <妥当 / 一部妥当 / 妥当性が低い>
- 根拠: <コード根拠の1–3項目>

Next action (choose one)
1) 修正を実装＋テスト
2) 保留（スレッドを未解決に戻す）
3) 何もしない
```
