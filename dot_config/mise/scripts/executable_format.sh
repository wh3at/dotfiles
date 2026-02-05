#!/usr/bin/env bash
set -euo pipefail

echo "Enter text (type 'END' to finish):"
text=""
while IFS= read -r line; do
    if [[ "$line" == "END" ]]; then
        break
    fi
    text+="$line"$'\n'
done

if [[ -z "$text" ]]; then
    echo "Error: Text cannot be empty" >&2
    exit 1
fi

opencode run --model zai-coding-plan/glm-4.7 <<PROMPT
以下のログをjsonlに整形して

# 削除対象
- コード装飾要素（行番号、行番号区切り文字、エラー箇所を示す記号、区切り線など）
- jsonlで意味を持たない空白文字

# 整形ルール
- code snippetは純粋なコードのみ抽出し、全てのフォーマット装飾を削除
- ログの種類（テスト失敗、ビルドエラー等）に関わらずコード本体だけを抽出

# ログ
````
$text
````
PROMPT
