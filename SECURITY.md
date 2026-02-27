# Secret Handling Baseline

This repo keeps secret values out of templates and data files.

## Rules

- Do not store plaintext secrets in `.chezmoidata.toml` or `*.tmpl`.
- Keep `PROTON_PASS_ENCRYPTION_KEY` outside dotfiles (`~/.config/proton-pass/key.env`).
- Keep secret values ephemeral: store only secret references (`pass://...`, temporary `op://...`) and resolve them at runtime.
- Use `PASS_MIGRATION_MODE=legacy` only as a temporary fallback.

## Current Runtime Flow

- `.zshrc` sources `~/.config/proton-pass/key.env` for Proton Pass CLI runtime.
- `.zshrc` exports shared refs (`*_PASS_REF`) and keeps `*_OP_REF` for temporary fallback.
- `glm`/`gog` read secret references from `~/.config/proton-pass/*.env`.
- `glm`/`gog`/`cx`/`notify` resolve refs with `pass show` (or `op read` in legacy mode).
- `ANTHROPIC_BASE_URL` is non-secret template data.

## Required Rotation

Values previously stored in plaintext must be rotated immediately:

- Proton Pass encryption key (if leaked)
- API tokens previously committed to local template data
- 1Password service account token if legacy mode was used with exposed credentials

## Quick Audit Commands

```sh
cd ~/.local/share/chezmoi
rg -n --glob '!dot_claude/**' --glob '!*.md' "PROTON_PASS_ENCRYPTION_KEY=|OP_SERVICE_ACCOUNT_TOKEN=|ops_[A-Za-z0-9]|ANTHROPIC_AUTH_TOKEN='|api_key\\s*=\\s*\""
rg -n "PROTON_PASS_(KEY_PROVIDER|ENCRYPTION_KEY)=|OP_SERVICE_ACCOUNT_TOKEN=|ops_[A-Za-z0-9]" ~/.zshrc ~/.config/proton-pass/key.env ~/.config/proton-pass/claude.env ~/.config/proton-pass/gog.env ~/.config/op/service-account.env
```
