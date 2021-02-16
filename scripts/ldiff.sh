#!/bin/sh

dst="tmp"
outname="ldiff"
docker_image="pine318/texlive-ja:latest"
uid="$(id -u):$(id -g)"

# 差分tex作成
diff_tex=$(docker run -i --rm -u ${uid} -w "$(pwd)" -v "$(pwd):$(pwd)" ${docker_image} latexdiff-vc -e utf8 --git --flatten -t CFONT -r "$@" | cut -d" " -f 4)

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
  cd ${dst}/${diffid}
  # 中間ファイル削除
  ls | grep -v -E ".pdf$" | grep -v -E ".tex$" | xargs rm
fi