# Secret Handling Baseline

This repo keeps secret values out of templates and data files.

## Rules

- Do not store plaintext secrets in `.chezmoidata.toml` or `*.tmpl`.
- Keep `PROTON_PASS_ENCRYPTION_KEY` outside dotfiles (`~/.config/proton-pass/key.env`).
- Keep secret values ephemeral: store only `pass://` references and resolve them at runtime.

## Current Runtime Flow

- `.zshrc` sources `~/.config/proton-pass/key.env` for Proton Pass CLI runtime.
- `.zshrc` exports shared refs (`*_PASS_REF`).
- `glm`/`gog` read secret references from `~/.config/proton-pass/*.env`.
- `glm`/`gog`/`cx`/`notify` resolve refs with `pass-cli show`.
- `ANTHROPIC_BASE_URL` is non-secret template data.

## Required Rotation

Values previously stored in plaintext must be rotated immediately:

- Proton Pass encryption key (if leaked)
- API tokens previously committed to local template data

## Quick Audit Commands

```sh
cd ~/.local/share/chezmoi
rg -n --glob '!dot_claude/**' --glob '!*.md' "PROTON_PASS_ENCRYPTION_KEY=|ANTHROPIC_AUTH_TOKEN='|api_key\\s*=\\s*\""
rg -n "PROTON_PASS_(KEY_PROVIDER|ENCRYPTION_KEY)=" ~/.zshrc ~/.config/proton-pass/key.env ~/.config/proton-pass/claude.env ~/.config/proton-pass/gog.env
```
