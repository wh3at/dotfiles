# Daily Cheat Sheet (chezmoi + 1Password SA)

## What changed for users

- `glm` no longer embeds API tokens in dotfiles.
- `OP_SERVICE_ACCOUNT_TOKEN` is loaded from `~/.config/op/service-account.env`.
- Secret refs are stored as `op://...` paths (no plaintext secrets in dotfiles).
- `glm/gog/cx/notify` resolve secrets at runtime with `op read`.
- `~/.zshrc` exports shared non-secret refs:
  - `CONTEXT7_API_KEY_REF`
  - `PUSHOVER_TOKEN_OP_REF`
  - `PUSHOVER_USER_OP_REF`

## One-time setup

1. Put a valid 1Password secret reference in `~/.config/op/claude.env` (vault is `CLI`).
   `ANTHROPIC_AUTH_TOKEN=op://CLI/Zai Key OpenClaw/credential`
   Use field id (`credential`) in the path, not field label (`認証情報`).
2. Create a local-only file for the service account token (outside dotfiles):
   ```sh
   umask 077
   cat > ~/.config/op/service-account.env <<'EOF'
   export OP_SERVICE_ACCOUNT_TOKEN=ops_xxx
   EOF
   chmod 600 ~/.config/op/service-account.env
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

# 4) service account file exists?
ls -l ~/.config/op/service-account.env
```

If `glm/gog/cx` fail, run:

```sh
source ~/.zshrc
glms
```

## Security hygiene

```sh
cd ~/.local/share/chezmoi
rg -n --glob '!dot_claude/**' --glob '!*.md' "service_acc_token|ops_[A-Za-z0-9]|ANTHROPIC_AUTH_TOKEN='|api_key\\s*=\\s*\"|OP_SERVICE_ACCOUNT_TOKEN=\""
```

Keep `~/.config/op/service-account.env` out of git and rotate leaked tokens immediately.
