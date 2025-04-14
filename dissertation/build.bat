@echo off
setlocal

echo [1/4] Running pdflatex...
pdflatex -shell-escape dissertation.tex

echo [2/4] Running bibtex...
bibtex dissertation

echo [3/4] Running pdflatex again...
pdflatex -shell-escape dissertation.tex

echo [4/4] Final pass...
pdflatex -shell-escape dissertation.tex

echo Done. Check dissertation.pdf for output.