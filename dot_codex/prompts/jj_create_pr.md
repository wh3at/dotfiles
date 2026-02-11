---
description: Create a GitHub PR (git or jj) with a behavior-focused PR body, then push safely
argument-hint: '[HEAD=<branch_or_bookmark>] [BASE=<base_branch>] [REMOTE=<remote>] [REV=<revset>] [DRAFT=true|false] [PR_TITLE="<title>"]'
---

You are helping me create a GitHub Pull Request using **gh CLI**.
This repo may be managed either with **git branches** or **jj (Jujutsu) bookmarks**.
Your job: collect info (log/diff), write a PR body focused on behavior changes in Japanese, safely push, then create the PR.

## Read arguments (named args)
Use the provided values when present:
- HEAD=$HEAD (git branch name OR jj bookmark name). Optional.
- BASE=$BASE (base branch name). Optional.
- REMOTE=$REMOTE (default: origin). Optional.
- REV=$REV (jj revset to push/diff; default: @-). Optional.
- DRAFT=$DRAFT (true|false; default: false). Optional.
- PR_TITLE=$PR_TITLE (optional).

If any arg is missing, choose a safe default and proceed without asking unless absolutely necessary.

## Safety rules (MUST)
- Never use git push --force / --force-with-lease.
- Never use jj git push --all.
- Never use --no-verify.
- Warn and stop if trying to push directly to the base branch (main/master/etc).
- Before executing push and gh pr create, show both exact commands and ask for my explicit approval once (single approval for both operations).

## 1) Preconditions
Run:
- gh auth status
- git rev-parse --git-dir

Then probe:
- git status
- git branch --show-current
- (optional) jj root (if jj is installed / available)
- (optional) jj status

## 2) Determine REMOTE and BASE branch
REMOTE:
- If REMOTE is provided, use it; else use `origin`.

BASE branch:
- If BASE is provided, use it.
- Else detect via:
  `git symbolic-ref refs/remotes/<REMOTE>/HEAD 2>/dev/null | sed 's@^refs/remotes/<REMOTE>/@@'`
  If that fails, fall back to `main`.

Remember the resolved BASE branch name (e.g. main/master).

## 3) Collect change info for PR description
- Decide REV:
  - If REV is provided, use it.
  - Else use `@-` (common because working-copy commit itself may be empty after jj commit).
- Show:
  - jj status
  - jj bookmark list
  - jj bookmark list --tracked (if supported)
- Collect:
  - jj log -r "trunk()..$REV" -G
  - jj diff --from trunk() --to "$REV"

## 4) Write PR body (behavior-focused)
Analyze the diff and produce a PR body in EXACT format:

## Summary
(1-3 lines)

## Behavior Changes
- Before: ...
- After: ...

## Test plan
- ...

Rules:
- Focus on behavior changes, not just code changes.
- Be explicit about user-facing / API / performance / failure-mode changes.
- If no behavior change, say so and focus on internal quality (maintainability, safety, observability).

## 5) Prepare and execute push + PR creation
### 5a) Prepare head ref + push command
HEAD (bookmark name):
- If HEAD is provided, use it.
- If HEAD is empty, prefer auto-generated bookmark:
  - Run: `jj git push -c "$REV" --remote <REMOTE>`
  - Parse output to find the created bookmark name (e.g. "Creating bookmark <name>").
  - Use that bookmark name as HEAD for the PR.

If HEAD is provided, do the manual flow (safe + explicit):
1) Ensure bookmark points at REV (create or update)
   - Prefer: `jj bookmark set -r "$REV" "<HEAD>"`
   - If `set` is not available, use `jj bookmark create "<HEAD>" -r "$REV"` and if it fails because it exists, fall back to `jj bookmark move "<HEAD>" --to "$REV"`.
2) Track it for remote push
   Try in this order (stop when one works):
   - `jj bookmark track "<HEAD>@<REMOTE>"`
   - `jj bookmark track "<HEAD>" --remote "<REMOTE>"`
   - `jj bookmark track "<HEAD>"`
3) Prepare push command:
   `jj git push --bookmark "<HEAD>" --remote "<REMOTE>"`

### 5b) Prepare PR command with gh
Title:
- If PR_TITLE is provided, use it.
- Else generate a concise title based on the main behavior change.

Draft:
- If DRAFT == "true", add `--draft`, else do not.

Command template:
`gh pr create --base "<BASE>" --head "<HEAD>" --title "<TITLE>" --body "<BODY>" [--draft]`

Notes:
- HEAD should be the bookmark name (maps to a git branch on the remote).

If `gh` fails to detect the repo in a non-colocated jj repo:
- Retry with GIT_DIR pointed at the backing git dir:
  `GIT_DIR=.jj/repo/store/git gh pr create ...`

### 5c) Execute both
After preparing both commands:
- Show both exact commands
- Ask for approval once
- Execute push first, then create PR

## 6) Final output
After creating the PR, print:
- PR URL
- BASE and HEAD used
- A short recap of Behavior Changes + Test plan
