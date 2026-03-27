---
name: jj-create-pr
description: Create a GitHub pull request from a jj workflow. Use when the user wants to generate a behavior-focused PR body in Japanese, push a bookmark safely to origin, and open a PR with gh CLI from the current jj change stack.
argument-hint: "[HEAD=<bookmark>] [PR_TITLE=\"<title>\"]"
allowed-tools: Read, Grep, Bash
---

# JJ Create PR

Create a GitHub pull request for a repository managed with `jj` bookmarks. This
skill gathers the change context, writes a behavior-focused PR body in Japanese,
pushes safely, and opens the PR with `gh`.

## When to Use

Use this skill when:

- The repository uses `jj` and the PR should be based on `@-`
- The user wants you to push a bookmark and create a PR in one flow
- The PR description should focus on behavior changes, not only file edits

Do not use this skill when:

- The user only wants a draft PR description without push/PR creation
- The task starts from unstaged work that still needs to be committed
- The repository is plain `git` and there is no `jj` workflow to rely on

## Inputs

- `HEAD=$HEAD`
  - Optional bookmark name to use as the PR head
  - If omitted, infer a safe bookmark name from `jj workspace list`, the
    current working directory, parent commit summary, and existing bookmarks
  - If no good candidate can be inferred, fall back to
    `jj git push -c "@-" --remote origin` and parse the created bookmark name
- `PR_TITLE=$PR_TITLE`
  - Optional PR title
  - If omitted, generate a concise title from the main behavior change

## Safety Rules

- Never use `git push --force` or `git push --force-with-lease`
- Never use `jj git push --all`
- Never use `--no-verify`
- Always use `origin` as the remote
- Detect the base branch before push or PR creation
- If `HEAD` resolves to the base branch name itself, stop and warn instead of
  pushing directly to the base branch

## Workflow

### 1. Preconditions

Run:

```bash
gh auth status
git rev-parse --git-dir
git status
git branch --show-current
```

If `jj` is available, also run:

```bash
jj root
jj status
jj workspace list
```

### 2. Resolve remote and base branch

- Remote is always `origin`
- Resolve the base branch with:

```bash
git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@'
```

- If that fails, fall back to `main`
- Keep the resolved base branch name for the push safety check and `gh pr create`

### 3. Gather change context

Use `@-` as the review target because the working-copy commit may be empty.

Run:

```bash
jj status
jj bookmark list
jj bookmark list --tracked
jj log -r "trunk()..@-" -G
jj diff --from trunk() --to "@-"
```

If `jj bookmark list --tracked` is unsupported, continue without it.

### 4. Write the PR body

Generate the PR body in this exact format:

```markdown
## Summary
(1-3 lines)

## Behavior Changes
- Before: ...
- After: ...

## Test plan
- ...
```

Rules:

- Write the PR body in Japanese
- Focus on behavior changes, not implementation trivia
- Call out user-facing, API, performance, and failure-mode changes when they
  exist
- If behavior is unchanged, say so explicitly and focus on maintainability,
  safety, or observability improvements

### 5. Prepare the head bookmark and push command

If `HEAD` is provided, use it. Otherwise:

1. Inspect `jj workspace list` and the current working directory
2. If the workspace name looks like `repo.TICKET-slug`, drop the `repo.` prefix
   and use `TICKET-slug`
3. Otherwise infer a short ASCII-safe bookmark name from the workspace name,
   parent commit summary, and existing bookmark names
4. If you still cannot infer a good candidate, run:

```bash
jj git push -c "@-" --remote origin
```

Parse the created bookmark name from the output and use it as `HEAD`.

If `HEAD` is known before push, do the explicit bookmark flow:

```bash
jj bookmark set -r "@-" "<HEAD>"
```

If `set` is unavailable, try:

```bash
jj bookmark create "<HEAD>" -r "@-"
```

If that fails because the bookmark already exists, use:

```bash
jj bookmark move "<HEAD>" --to "@-"
```

Track the bookmark for `origin`. Try these in order and stop on the first
success:

```bash
jj bookmark track "<HEAD>@origin"
jj bookmark track "<HEAD>" --remote "origin"
jj bookmark track "<HEAD>"
```

Then push with:

```bash
jj git push --bookmark "<HEAD>" --remote "origin"
```

### 6. Create the PR with gh

If `PR_TITLE` is present, use it. Otherwise generate a concise title from the
main behavior change.

Use:

```bash
gh pr create --base "<BASE>" --head "<HEAD>" --title "<TITLE>" --body "<BODY>"
```

If `gh` cannot detect the repository because the `jj` repo is non-colocated,
retry with:

```bash
GIT_DIR=.jj/repo/store/git gh pr create --base "<BASE>" --head "<HEAD>" --title "<TITLE>" --body "<BODY>"
```

### 7. Execute and report

Execution order is fixed:

1. Push the bookmark
2. Create the PR

After success, report:

- PR URL
- `BASE` and `HEAD`
- Whether `HEAD` was user-provided or auto-suggested
- A short recap of `Behavior Changes`
- A short recap of `Test plan`

## Failure Handling

- If `gh auth status` fails, stop and report the authentication issue
- If the repository is not a Git repository, stop
- If the resolved `HEAD` equals the base branch, stop before push
- If bookmark setup fails for every supported command, stop and show the
  attempted commands
- If `gh pr create` fails both normally and with `GIT_DIR=.jj/repo/store/git`,
  report both failures and do not retry further
