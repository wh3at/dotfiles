# Daily Cheat Sheet (chezmoi + Proton Pass CLI)

## What changed for users

- `glm/gog/cx/notify` now resolve runtime secrets from Proton Pass (`pass://...`).
- Runtime key material is loaded from `~/.config/proton-pass/key.env`.
- Secret refs are stored in env files as `pass://...` paths (no plaintext secrets in dotfiles).
- `PASS_MIGRATION_MODE` controls fallback behavior:
  - `native` (default): prefer Proton Pass
  - `legacy`: prefer 1Password fallback (`op://...`)

## One-time setup

1. Create local-only key config for Proton Pass CLI:
   ```sh
   umask 077
   mkdir -p ~/.config/proton-pass
   cat > ~/.config/proton-pass/key.env <<'EOF_KEY'
   export PROTON_PASS_KEY_PROVIDER=env
   export PROTON_PASS_ENCRYPTION_KEY=<set-a-random-32-byte-plus-secret>
   EOF_KEY
   chmod 600 ~/.config/proton-pass/key.env
   ```
2. Put secret references in Proton Pass env files:
   ```sh
   cat > ~/.config/proton-pass/claude.env <<'EOF_CLAUDE'
   ANTHROPIC_AUTH_TOKEN=pass://CLI/Zai Key OpenClaw/credential
   EOF_CLAUDE

   cat > ~/.config/proton-pass/gog.env <<'EOF_GOG'
   GOG_KEYRING_PASSWORD=pass://CLI/GOG_KEYRING_PASSWORD/credential
   EOF_GOG
   chmod 600 ~/.config/proton-pass/claude.env ~/.config/proton-pass/gog.env
   ```
3. Run `source ~/.zshrc`.
4. Run `glms` and confirm all checks are `[ok]`.

## Daily commands

```sh
# preflight
glms

# normal usage
glm
glm --help
glm -p "..."
```

## If commands fail

```sh
# 1) pass available?
pass --version

# 2) key provider configured?
echo "${PROTON_PASS_KEY_PROVIDER:-unset}"
echo "${PROTON_PASS_ENCRYPTION_KEY:+set}"

# 3) env files exist?
ls -l ~/.config/proton-pass/claude.env ~/.config/proton-pass/gog.env
```

Then run:

```sh
source ~/.zshrc
glms
```

## Legacy fallback (temporary)

If you need to temporarily use `op://` references:

```sh
export PASS_MIGRATION_MODE=legacy
source ~/.zshrc
glms
```

## Security hygiene

```sh
cd ~/.local/share/chezmoi
rg -n --glob '!dot_claude/**' --glob '!*.md' "PROTON_PASS_ENCRYPTION_KEY=|OP_SERVICE_ACCOUNT_TOKEN=|ops_[A-Za-z0-9]|ANTHROPIC_AUTH_TOKEN='|api_key\\s*=\\s*\""
```

Keep `~/.config/proton-pass/key.env` out of git and rotate leaked keys immediately.
