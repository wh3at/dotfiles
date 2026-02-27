# Secret Handling Baseline

This repo keeps secret values out of templates and data files.

## Rules

- Do not store plaintext secrets in `.chezmoidata.toml` or `*.tmpl`.
- Keep `OP_SERVICE_ACCOUNT_TOKEN` outside dotfiles (local-only env file).
- Keep secret values ephemeral: store only `op://` references in dotfiles and resolve values at runtime with `op read`.

## Current Runtime Flow

- `.zshrc` sources `~/.config/op/service-account.env` for `OP_SERVICE_ACCOUNT_TOKEN`.
- `.zshrc` exports shared refs (`CONTEXT7_API_KEY_REF`, `PUSHOVER_*_OP_REF`).
- `glm`/`gog` read secret references from `~/.config/op/*.env`.
- `glm`/`gog`/`cx`/`notify` resolve refs with `op read` at runtime.
- `ANTHROPIC_BASE_URL` is non-secret template data.

## Required Rotation

Values previously stored in plaintext must be rotated immediately:

- 1Password Service Account token
- API tokens previously committed to local template data

## Quick Audit Commands

```sh
cd ~/.local/share/chezmoi
rg -n --glob '!dot_claude/**' --glob '!*.md' "service_acc_token|ops_[A-Za-z0-9]|ANTHROPIC_AUTH_TOKEN='|api_key\\s*=\\s*\"|OP_SERVICE_ACCOUNT_TOKEN=\""
rg -n "OP_SERVICE_ACCOUNT_TOKEN=|ANTHROPIC_AUTH_TOKEN='|ops_[A-Za-z0-9]" ~/.zshrc ~/.config/op/claude.env ~/.config/op/service-account.env
```
