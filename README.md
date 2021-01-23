# TeXLive日本語環境コンテナ

## 使い方

1. `git clone https://github.com/pine18/texlive-ja`
2. README.mdと.gitを削除．（使用しないなら）.devcontainerも削除
3. texファイルを配置

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

### Visual Studio Code(devcontainer)

- ms-ceintl.vscode-language-pack-ja
- hediet.vscode-drawio
- oderwat.indent-rainbow
- james-yu.latex-workshop
- donjayamanne.githistory
