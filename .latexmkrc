#!/usr/bin/env perl

$latex = 'platex %O -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %S';
$pdflatex = 'pdflatex %O -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %S';
$lualatex = 'lualatex %O -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %S';
$xelatex = 'xelatex %O -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %S';
$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex = 'pbibtex %O %B';
$makeindex = 'upmendex %O -o %D %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$dvips = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf = 'ps2pdf %O %S %D';
$max_repeat = 5;

# 0: PDF を作成しない
# 1: $pdflatex
# 2: $ps2pdf
# 3: $dvipdf
# 4: $lualatex
# 5: xdvipdfmx
$pdf_mode = 3;