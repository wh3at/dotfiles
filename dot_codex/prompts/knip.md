## Context

- Unused components: `pnpm knip --no-progress`
- Timestamp: !`date '+%Y%m%d-%H%M%S'`

## Your tasks

- 未使用項目の特定
- リファクタの計画を立てる
- 計画を".scratch/"ディレクトリに保存する

## Report file naming

knip-report-{Timestamp}.md

## Report contents

1. **未使用であると判断された理由**
   例：どのファイルからもインポート／参照されていない等

2. **定義されているファイルパス**

3. **安全に削除できるかどうかについての考察**
   削除による影響範囲や、追加で確認すべき点があれば記述してください

4. **未使用になった経緯**
   gitの履歴から未使用になった経緯を記述
