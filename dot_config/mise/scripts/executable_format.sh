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

{
    echo '以下のログを行番号とフォーマット装飾のみ削除してmarkdown形式に整形して'
    echo ''
    echo '# 削除対象'
    echo '- 行番号（行頭の数字と区切り文字、例: "    424|"、"   527|"）'
    echo '- 行番号区切り文字（|）'
    echo '- エラー箇所を示すキャレット行'
    echo ''
    echo '# 整形ルール'
    echo '- エラーメッセージ、ファイルパス、テスト名などの重要な情報は保持'
    echo '- コードブロックは元の形式を維持し、行番号のみ削除'
    echo '- 元のログから最小限の変更のみ適用'
    echo ''
    echo '# ログ'
    echo '```'
    echo "$text"
    echo '```'
} | opencode run --model zai-coding-plan/glm-4.7
