# Secret Handling Baseline

This repo keeps secret values out of templates and data files.

## Rules

- Do not store plaintext secrets in `.chezmoidata.toml` or `*.tmpl`.
- Keep Proton Pass provider overrides outside dotfiles (`~/.config/proton-pass/key.env`).
- Keep secret values ephemeral: store only `pass://` references and resolve them at runtime.

## Current Runtime Flow

- `.zshrc`/`.zprofile` default `PROTON_PASS_KEY_PROVIDER=fs` for Proton Pass CLI runtime.
- `.zshrc` exports shared refs (`*_PASS_REF`).
- `glm`/`gog` read secret references from `~/.config/proton-pass/*.env`.
- `glm`/`gog`/`cx`/`notify` resolve refs with `pass-cli run`.
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
