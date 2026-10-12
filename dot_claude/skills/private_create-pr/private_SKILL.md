---
name: create-pr
description: |
  GitHub Pull Requestの作成をサポート。gh CLIを使用してPRを作成し、
  コミット履歴とdiffから振る舞いの変更点を説明するPR説明文を自動生成する。
  PRを作成したい時、プルリクエストを出したい時にこのスキルを使用する。
---

# Pull Request作成スキル

gh CLIを使用してGitHub PRを作成する。振る舞いの変更を明確に説明するPR説明文を自動生成する。

## ワークフロー

### 1. 前提条件確認

```bash
# gitリポジトリ内か確認
git rev-parse --git-dir

# gh CLI認証確認
gh auth status
```

### 2. 情報収集（並列実行可）

```bash
# 現在の状態
git status
git branch --show-current

# ベースブランチ特定（main or master）
git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@' || echo "main"

# コミット履歴とdiff
git log [base]...HEAD --oneline
git diff [base]...HEAD
```

### 3. PR説明文生成

変更内容を分析し、以下のフォーマットで説明文を生成する：

```markdown
## Summary
<変更の要約を1-3行で>

## Behavior Changes
<システムの振る舞いがどう変わるか>
- Before: <変更前の動作>
- After: <変更後の動作>

## Test plan
<変更を検証する方法>
```

**重要**: PR説明は「何を変えたか」ではなく「振る舞いがどう変わったか」を重視する。
AIエージェントが実装したコードを人間がレビューする際、コードの変更点より動作の変化が重要。

### 4. PR作成

```bash
# リモートにpush（必要な場合）
git push -u origin [branch-name]

# PR作成
gh pr create --title "[タイトル]" --body "$(cat <<'EOF'
[PR説明文]
EOF
)"
```

## 安全規則

- `--force` や `--force-with-lease` は絶対に使用しない
- main/masterへの直接pushは警告を出す
- pushやPR作成の前にユーザーの確認を得る
- `--no-verify` フラグは使用しない
