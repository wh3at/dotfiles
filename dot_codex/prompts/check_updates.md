# ライブラリ更新可否調査
## 概要
プロジェクトの依存ライブラリのアップデート可能性を調査し、各ライブラリの更新安全性を評価してレポートを生成します。
## Context
- Current datetime: `TZ='Asia/Tokyo' date`
## 実行プロセス
### Step 1: 初期分析とワークスペース情報取得 (2 subtasks)
プロジェクトの現在の依存関係とワークスペース構造を分析：
```bash
# ワークスペース別アップデート可能なパッケージをJSON形式で取得
pnpm -r outdated --json
# ワークスペース情報も取得
pnpm list -r --json
``` 
アップデート可能なパッケージのリストを作成し、`$ARGUMENTS` に応じてフィルタリング：
- `--major-only`: メジャーアップデートのみ
- `--minor-only`: マイナーアップデートのみ
- （指定なし）: すべてのアップデート

ワークスペース別依存関係マッピング：
- 各パッケージがどのワークスペースで使用されているかを特定
- ワークスペース間の依存関係を分析
- 共通依存関係と個別依存関係を分類

### Step 2: 影響範囲評価
各ライブラリを順次評価し、進捗は `update_plan` で追跡：
- バージョン差分の確認（npm registry、changelog、リリースノート）
- プロジェクト内の影響範囲分析（コード検索: `rg` など）
  - 使用箇所の洗い出し／影響ファイルの特定／型変更の影響評価
  - ワークスペース別影響分析（影響を受けるWS、使用パターン、波及効果）
- 150-250語の結果サマリー
  - 現在/推奨バージョン、Breaking changes有無
  - ワークスペース別の影響サマリー（WS名、影響ファイル数、固有リスク）
  - 初期安全性評価（Safe/Caution/Risky）
### Step 3: 安全性評価の統合 (using Step 2 results)
Step 2 の結果を基に総合評価：

1. 安全性レベルの決定
   - Safe (✅): パッチ版または後方互換性のあるマイナー版
   - Caution (⚠️): API の変更あり、または依存関係に注意が必要
   - Risky (❌): メジャー版で Breaking changes を含む
2. ワークスペース別リスク評価
   - 各ワークスペースでの影響度評価
   - ワークスペース間依存関係を考慮したリスク分析
   - クリティカルパスの特定
3. 同一メジャーバージョンの確認（必要な場合）
   - メジャー版が異なる場合、同じメジャーバージョンの最新版を調査
   - 段階的アップデートプランの作成
4. 推奨アップデート順序の決定
   - 依存関係を考慮した更新順序
   - リスクレベルに基づくグループ分け
   - ワークスペース別更新戦略（独立更新可／同期必須／段階的更新）
### Step 4: レポート生成
`.scratch` ディレクトリに Markdown 形式のレポートを生成：

```markdown
# ライブラリ更新可否調査レポート
生成日時: [timestamp]

## サマリー
- 総ワークスペース数: X
- 総パッケージ数: Y
- アップデート可能: Z
- 安全にアップデート可能: W

## ワークスペース別サマリー
### [workspace-name]
- 固有依存関係: X 個
- アップデート可能: Y 個
- 高リスク更新: Z 個

## 詳細分析
### 共通依存関係
- 複数ワークスペースで使用される依存関係
- 更新時の影響範囲が広いパッケージ

### ワークスペース固有依存関係: [ライブラリ名]
- 現在のバージョン: X.Y.Z
- 推奨バージョン: X.Y.Z+1
- 最新バージョン: X+1.0.0
- 更新タイプ: patch/minor/major
- 安全性評価: ✅ Safe / ⚠️ Caution / ❌ Risky
- Breaking Changes: なし / あり（詳細）
- ワークスペース別影響範囲:
  - [workspace-name]: 影響ファイル数 X、主な使用箇所 [usage examples]、固有リスク [specific risks]
  - [workspace-name2]: 影響ファイル数 Y、主な使用箇所 [usage examples]、固有リスク [specific risks]

## 推奨アクション
- 全ワークスペース: `pnpm -r update package@version`
- 個別ワークスペース: `pnpm --filter [workspace] update package@version`
- 段階的更新: [step by step plan]
- 注意事項: [specific notes]
```

### Step 5: 実行結果の表示
最後に生成したレポートのパスを表示し、重要な推奨事項をサマリーとして出力します。

## Step Review and Adaptation
各ステップ完了後に計画を再検討：

- Step 2 後:
  - アップデート可能なパッケージが 0 の場合 → Step 3, 4 をスキップ
  - Breaking changes が多数発見された場合 → Step 3 で詳細分析を追加
  - すべてパッチ版の場合 → Step 3 を簡略化

- Step 3 後:
  - リスクの高いパッケージが多い場合 → 段階的更新プランを追加
  - 依存関係の競合が発見された場合 → 解決策の調査を追加

## Implementation Notes

1. update_plan の活用
   - Step 1a: "Analyze outdated packages in all workspaces"
   - Step 1b: "Map workspace dependencies"
   - Step 2: 各ライブラリごとに「評価→要約」を順次実施
   - Step 3: "Integrate safety assessments with workspace-specific risks"
   - Step 4: "Generate workspace-aware report"

2. 逐次実行の最適化
   - Step 2はループ処理で順次評価（並列化は行わない）
   - 必要最小限の情報（パッケージ名、バージョン、ワークスペース情報）で評価
   - 150-250語の簡潔なサマリー（ワークスペース別情報を含む）を作成

3. コンテキストの管理
   - Step 1 の結果（パッケージリスト + ワークスペースマッピング）を Step 2 に渡す
   - Step 2 の結果（各パッケージのワークスペース別サマリー）を Step 3 に渡す
   - Step 3 の結果（ワークスペース考慮の総合評価）を Step 4 に渡す

## 実行例

```
/check-updates
→ Step 1a: 3 個のワークスペースで 6 個のアップデート可能なパッケージを発見
→ Step 1b: ワークスペース依存関係マッピング完了
→ Step 2: 6 個を順次評価（ワークスペース別影響分析を含む）...
→ Step 3: ワークスペース別安全性評価を統合中...
→ Step 4: ワークスペース対応レポートを生成しました: .scratch/library-update-report-{YYYYMMDD-HHmm}.md
```

## 注意事項

- メジャーバージョンアップデートは慎重に評価
- 同一メジャーバージョンの最新版を優先的に推奨
- Breaking changes がある場合は詳細な影響分析を実施
- テストスイートの実行を推奨
