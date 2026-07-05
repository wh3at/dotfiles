# Secret Handling Baseline

This repo keeps secret values out of templates and data files.

## Rules

- Do not store plaintext secrets in `.chezmoidata.toml` or `*.tmpl`.
- Keep Proton Pass provider overrides outside dotfiles (`~/.config/proton-pass/key.env`).
- Keep secret values ephemeral: store only `pass://` references and resolve them at runtime.

## Current Runtime Flow

- `.zshrc`/`.zprofile` default `PROTON_PASS_KEY_PROVIDER=fs` for Proton Pass CLI runtime.
- Interactive CLI wrappers (`glm`/`cx`/`gog_op`/`linear_cli`) resolve secrets at `chezmoi apply` time via `chezmoi-get-secret` and `pass-cli item view --vault-name --item-title --field` (avoids `pass-cli run` TTY issue).
- `notify.js` resolves Pushover secrets at runtime via `pass-cli run --env-file` (file-based, no TTY).
- `ANTHROPIC_BASE_URL` is non-secret template data.

## Required Rotation

Values previously stored in plaintext must be rotated immediately:

- API tokens previously committed to local template data

## Quick Audit Commands

```sh
cd ~/.local/share/chezmoi
rg -n --glob '!dot_claude/**' --glob '!*.md' "ANTHROPIC_AUTH_TOKEN='|api_key\\s*=\\s*\""
rg -n "PROTON_PASS_KEY_PROVIDER=" ~/.zprofile ~/.zshrc ~/.config/proton-pass/key.env
```
