#!/usr/bin/env bash
set -euo pipefail

export CONTROL_PLANE_API_KEY
CONTROL_PLANE_API_KEY=$(pass-cli item view \
  --vault-name CLI \
  --item-title "OpenAI MCP Tunnel API key" \
  --field "APIキー")

tunnel-client run --profile konnect
