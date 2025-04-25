@echo off
cls
setlocal

latexmk -pdf -interaction=nonstopmode -shell-escape .\dissertation.tex

echo Calculating wordcount...
texcount -inc -total .\dissertation.tex