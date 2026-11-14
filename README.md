# TeXLive日本語環境コンテナ

[![dockeri.co](https://dockeri.co/image/pine318/texlive-ja)](https://hub.docker.com/r/pine318/texlive-ja)

## Dockerイメージ

- Docker Hub: [pine318/texlive-ja](https://hub.docker.com/r/pine318/texlive-ja)
- タグ
  - `latest`：最新のTeX Live
  - `2026` など：TeX Liveの年版
- 対応アーキテクチャ：`linux/amd64`，`linux/arm64`（Apple Silicon等）
- ベースイメージ：`perl:5-trixie`（Debian 13）

```sh
docker pull pine318/texlive-ja
```

### 自動ビルド

GitHub Actions（`.github/workflows/docker-publish.yml`）で以下のタイミングにビルドし，Docker Hubへpushする．

- `master`ブランチの`Dockerfile`変更時
- 毎月1日（TeX Liveパッケージの最新化）
- 手動実行（Actions画面の「Run workflow」）

リポジトリのSecretsに`DOCKERHUB_USERNAME`と`DOCKERHUB_TOKEN`（Docker HubのPersonal Access Token）の登録が必要．

## 使い方

1. `git clone https://github.com/pine318/texlive-ja`
2. README.mdと.gitを削除．（使用しないなら）.devcontainerも削除
3. texファイルを配置

## latexdiff

- 修正前を赤文字，修正後を青文字にし，差分を表示
- `scripts`内にスクリプトを配置

### 使用法（gitを用いた差分表示）

- rev1，rev2にコミットIDやファイル名を入れる

```sh
./scripts/ldiff.sh [rev1] [rev2]
```

## textlint

- [textlint](https://github.com/textlint/textlint)で文章校正が可能
- [latex用のプラグイン](https://github.com/textlint/textlint-plugin-latex2e)を使用
  - まだ安定動作しないかも
- 設定ファイルは`.textlintrc`に記述

### 導入法

1. VSCode用拡張機能（[vscode-textlint](https://github.com/taichi/vscode-textlint)）をインストール
2. `yarn install`で関連パッケージをインストール
3. CLIで実行する場合は`npx textlint main.tex`

## 使用パッケージ

### TeXLive(Docker内)

- collection-fontsrecommended
- collection-langcjk
- collection-langjapanese
- collection-latexextra
- collection-mathscience
- latexmk
- latexindent
- pdfcrop
- latexdiff
- newtx
