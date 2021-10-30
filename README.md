# TeXLive日本語環境コンテナ

[![dockeri.co](https://dockeri.co/image/pine318/texlive-ja)](https://hub.docker.com/repository/docker/pine318/texlive-ja)

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
2. `npm install`で関連パッケージをインストール

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
