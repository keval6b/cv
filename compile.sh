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

mkdir -p out
job="keval-kapdee-cv-${ROLE}-${LOCATION}"
src="\\def\\cvrole{${ROLE}}\\def\\cvlocation{${LOCATION}}\\input{keval-kapdee-cv.tex}"

xelatex -output-directory=out -jobname="$job" "$src"
xelatex -output-directory=out -jobname="$job" "$src"
