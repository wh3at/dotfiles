#!/usr/bin/env bash
set -euo pipefail

text="$1"

if [[ -z "$text" ]]; then
    echo "Error: Text cannot be empty" >&2
    exit 1
fi

opencode run --model zai-coding-plan/glm-4.7 "$(cat <<'PROMPT'
以下のログをjsonlに整形して

# 削除対象
- 行番号
- jsonlで意味を持たない空白文字

# ログ
````
$text
````
PROMPT
)"
