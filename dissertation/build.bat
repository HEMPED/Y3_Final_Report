@echo off
cls
setlocal

echo [1/4] Running pdflatex...
pdflatex -shell-escape dissertation.tex

echo [2/4] Running bibtex...
bibtex dissertation.aux

echo [3/4] Running pdflatex again...
pdflatex -shell-escape dissertation.tex > NUL 2>&1

echo [4/4] Final pass...
pdflatex -shell-escape dissertation.tex > NUL 2>&1

echo Done. Check dissertation.pdf for output.

echo.
echo ================================================
echo Calculating wordcount ...
echo ================================================

REM count_words.bat – print a summary line and then format texcount’s brief output

powershell -NoProfile -Command ^
  "Write-Output ' Words   Headers  Captions  #Headers  #Floats  #InlineMath  #DisplayedMath  File';" ^
  "texcount -inc -brief 'dissertation.tex' | ForEach-Object {" ^
    "  if ($_ -match '(\d+)\+(\d+)\+(\d+) \((\d+)\/(\d+)\/(\d+)\/(\d+)\).*?:\s*(.+)') {" ^
    "    '{0,7} {1,8} {2,9} {3,10} {4,8} {5,12} {6,15} {7}' -f " ^
    "      $matches[1],$matches[2],$matches[3],$matches[4],$matches[5],$matches[6],$matches[7],$matches[8]" ^
    "  }" ^
  "}"

echo.