#!/usr/bin/env bash
set -euo pipefail

mkdir -p out
xelatex -output-directory=out keval-kapdee-cv.tex
xelatex -output-directory=out keval-kapdee-cv.tex
