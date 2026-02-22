# Daily Cheat Sheet (chezmoi + 1Password SA)

## What changed for users

- `glm` no longer embeds API tokens in dotfiles.
- `glm` now uses `op run --env-file ~/.config/op/claude.env`.
- `OP_SERVICE_ACCOUNT_TOKEN` is no longer auto-exported by `.zshrc`.
- Secret refs live in `~/.config/op/claude.env` as `op://...`.

## One-time setup

1. Put a valid 1Password secret reference in `~/.config/op/claude.env` (vault is `CLI`).
   `ANTHROPIC_AUTH_TOKEN=op://CLI/Zai Key OpenClaw/credential`
   Use field id (`credential`) in the path, not field label (`認証情報`).
2. Store `OP_SERVICE_ACCOUNT_TOKEN` in OS keyring once (outside dotfiles):
   ```sh
   source ~/.zshrc
   op_sa_set
   ```
3. Run `source ~/.zshrc`.
4. Run `glms` and confirm all checks are `[ok]`.

## Daily commands

```sh
# preflight
glms

# normal usage (same entrypoint as before)
glm
glm --help
glm -p "..."
```

## If `glm` fails

```sh
# 1) token present?
echo "${OP_SERVICE_ACCOUNT_TOKEN:+set}"

# 2) op available?
op --version

# 3) env file exists?
ls -l ~/.config/op/claude.env
```

If you see `Input must be provided ... when using --print`, run:

```sh
source ~/.zshrc
glm
```

Why: `op run` is non-TTY. `glm` now uses `op read` for no-arg interactive launch.

If you're in a non-interactive context (pipe/script), use:

```sh
glm -p "your prompt"
```

## Security hygiene

```sh
cd ~/.local/share/chezmoi
rg -n --glob '!dot_claude/**' --glob '!*.md' "service_acc_token|ops_[A-Za-z0-9]|ANTHROPIC_AUTH_TOKEN='|api_key\\s*=\\s*\"|OP_SERVICE_ACCOUNT_TOKEN=\""
```

Rotate leaked or previously committed tokens immediately.
