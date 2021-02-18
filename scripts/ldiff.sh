#!/bin/sh

dst="tmp"
outname="ldiff"
uid="$(id -u):$(id -g)"
pandocref="ipsj"

# 差分tex作成(PDF)
diff_tex=$(docker run -i --rm -u ${uid} -w "$(pwd)" -v "$(pwd):$(pwd)" pine318/texlive-ja:latest latexdiff-vc -e utf8 --git --flatten -t CFONT -r "$@" | cut -d" " -f 4)

if [ $? = 0 ]; then
  # ファイル名から拡張子除去
  diffid=${diff_tex%.tex}
  # ファイル名変更
  mv ${diff_tex} ${outname}.tex
  # PDF化
  docker run -i --rm -u ${uid} -w "$(pwd)" -v "$(pwd):$(pwd)" pine318/texlive-ja:latest latexmk ${outname}.tex
  # ファイルを移動
  mkdir -p ${dst}/${diffid}
  mv ${outname}.* ${dst}/${diffid}
  # pdf以外削除
  ls -d ${dst}/${diffid}/* | grep -v -E ".pdf$" | xargs rm
fi

# 差分tex作成(docx)
diff_tex=$(docker run -i --rm -u ${uid} -w "$(pwd)" -v "$(pwd):$(pwd)" pine318/texlive-ja:latest latexdiff-vc -e utf8 --git --flatten -t BOLD -r "$@" | cut -d" " -f 4)

if [ $? = 0 ]; then
  # ファイル名から拡張子除去
  diffid=${diff_tex%.tex}
  # ファイル名変更
  mv ${diff_tex} ${outname}.tex
  # docx化
  pandoc -d pandoc/${pandocref}/tex_to_docx.yml ${outname}.tex -o ${dst}/${diffid}/${outname}.docx
  # tex削除
  rm ${outname}.tex
fi