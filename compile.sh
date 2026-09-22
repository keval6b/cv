#!/usr/bin/env bash
set -euo pipefail

ROLE="${1:-${ROLE:-general}}"
LOCATION="${2:-${LOCATION:-malaysia}}"

case "$ROLE" in
  general|cloud|ai) ;;
  *)
    echo "Unknown role: $ROLE (general|cloud|ai)" >&2
    exit 1
    ;;
esac

case "$LOCATION" in
  malaysia|uk) ;;
  *)
    echo "Unknown location: $LOCATION (malaysia|uk)" >&2
    exit 1
    ;;
esac

mkdir -p out out/aux
job="keval-kapdee-cv-${ROLE}-${LOCATION}"
src="\\def\\cvrole{${ROLE}}\\def\\cvlocation{${LOCATION}}\\input{keval-kapdee-cv.tex}"

# TeX Live xelatex has no -aux-directory; keep aux/log here and move the PDF out.
xelatex -output-directory=out/aux -jobname="$job" "$src"
xelatex -output-directory=out/aux -jobname="$job" "$src"
mv -f "out/aux/${job}.pdf" "out/${job}.pdf"
