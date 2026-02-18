# Secret Handling Baseline

This repo keeps secret values out of templates and data files.

## Rules

- Do not store plaintext secrets in `.chezmoidata.toml` or `*.tmpl`.
- Keep `OP_SERVICE_ACCOUNT_TOKEN` outside dotfiles (external secret store only).
- Use `op run` for command-scoped injection of runtime secrets.

## Current Runtime Flow

- `glm` reads secret references from `~/.config/op/claude.env`.
- `glm` runs `claude` through `op run --env-file`.
- `ANTHROPIC_BASE_URL` is non-secret template data.

## Required Rotation

Values previously stored in plaintext must be rotated immediately:

- 1Password Service Account token
- API tokens previously committed to local template data

## Quick Audit Commands

```sh
cd ~/.local/share/chezmoi
rg -n --glob '!dot_claude/**' --glob '!*.md' "service_acc_token|ops_[A-Za-z0-9]|ANTHROPIC_AUTH_TOKEN='|api_key\\s*=\\s*\"|OP_SERVICE_ACCOUNT_TOKEN=\""
rg -n "OP_SERVICE_ACCOUNT_TOKEN=|ANTHROPIC_AUTH_TOKEN='|ops_[A-Za-z0-9]" ~/.zshrc ~/.config/op/claude.env
```
