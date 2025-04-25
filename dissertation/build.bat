@echo off
cls
setlocal

echo [1/4] Running pdflatex...
pdflatex -shell-escape dissertation.tex 

echo [2/4] Running bibtex...
bibtex dissertation.aux

echo [3/4] Running pdflatex again...
pdflatex -shell-escape dissertation.tex 

echo [4/4] Final pass...
pdflatex -shell-escape dissertation.tex

echo Done. Check dissertation.pdf for output.

echo Calculating wordcount...
texcount -inc -total dissertation.tex