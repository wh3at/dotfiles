---
description: Create a GitHub PR (git or jj) with a behavior-focused PR body, then push safely
argument-hint: '[HEAD=<branch_or_bookmark>] [PR_TITLE="<title>"]'
---

You are helping me create a GitHub Pull Request using **gh CLI**.
This repo may be managed either with **git branches** or **jj (Jujutsu) bookmarks**.
Your job: collect info (log/diff), write a PR body focused on behavior changes in Japanese, safely push, then create the PR.

## Read arguments (named args)
Use the provided values when present:
- HEAD=$HEAD (git branch name OR jj bookmark name). Optional.
- PR_TITLE=$PR_TITLE (optional).

If any arg is missing, choose a safe default and proceed without asking unless absolutely necessary.

## Safety rules (MUST)
- Never use git push --force / --force-with-lease.
- Never use jj git push --all.
- Never use --no-verify.
- Warn and stop if trying to push directly to the base branch (main/master/etc).

## 1) Preconditions
Run:
- gh auth status
- git rev-parse --git-dir

Then probe:
- git status
- git branch --show-current
- (optional) jj root (if jj is installed / available)
- (optional) jj status
- (optional) jj workspace list

## 2) Determine REMOTE and BASE branch
REMOTE:
- Always use `origin`.

BASE branch:
- Detect via:
  `git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@'`
  If that fails, fall back to `main`.

Remember the resolved BASE branch name (e.g. main/master).

## 3) Collect change info for PR description
- Use `REV=@-` (common because working-copy commit itself may be empty after jj commit).
- Show:
  - jj status
  - jj bookmark list
  - jj bookmark list --tracked (if supported)
- Collect:
  - jj log -r "trunk()..@-" -G
  - jj diff --from trunk() --to "@-"

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
- If HEAD is empty, generate a suggested bookmark name first:
  - Inspect the current workspace name from `jj workspace list` and the current working directory.
  - If the workspace name looks like `repo.TICKET-slug`, prefer dropping the `repo.` prefix and use `TICKET-slug`.
  - Otherwise, use the workspace name, parent commit summary, and existing bookmark names to infer one concise bookmark name that would look natural in this repo.
  - Keep the suggestion ASCII-friendly, short, and safe for bookmark/branch usage (no spaces).
  - If you can infer a good candidate, set `HEAD` to that value and continue with the manual flow below.
  - If you cannot infer a good candidate confidently, fall back to `jj git push -c "@-" --remote origin`, parse the created bookmark name (e.g. "Creating bookmark <name>"), and use that bookmark name as HEAD for the PR.

If HEAD is provided or successfully suggested, do the manual flow (safe + explicit):
1) Ensure bookmark points at `@-` (create or update)
   - Prefer: `jj bookmark set -r "@-" "<HEAD>"`
   - If `set` is not available, use `jj bookmark create "<HEAD>" -r "@-"` and if it fails because it exists, fall back to `jj bookmark move "<HEAD>" --to "@-"`.
2) Track it for remote push
   Try in this order (stop when one works):
   - `jj bookmark track "<HEAD>@origin"`
   - `jj bookmark track "<HEAD>" --remote "origin"`
   - `jj bookmark track "<HEAD>"`
3) Prepare push command:
   `jj git push --bookmark "<HEAD>" --remote "origin"`

### 5b) Prepare PR command with gh
Title:
- If PR_TITLE is provided, use it.
- Else generate a concise title based on the main behavior change.

Command template:
`gh pr create --base "<BASE>" --head "<HEAD>" --title "<TITLE>" --body "<BODY>"`

Notes:
- HEAD should be the bookmark name (maps to a git branch on the remote).

If `gh` fails to detect the repo in a non-colocated jj repo:
- Retry with GIT_DIR pointed at the backing git dir:
  `GIT_DIR=.jj/repo/store/git gh pr create ...`

### 5c) Execute both
After preparing both commands:
- Execute push first, then create PR

## 6) Final output
After creating the PR, print:
- PR URL
- BASE and HEAD used
- Whether HEAD was user-provided or auto-suggested
- A short recap of Behavior Changes + Test plan
