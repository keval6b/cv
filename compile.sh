#!/usr/bin/env bash
set -euo pipefail

compile_one() {
  local role="$1"
  local location="$2"

  case "$role" in
    general|cloud|ai) ;;
    *)
      echo "Unknown role: $role (general|cloud|ai)" >&2
      return 1
      ;;
  esac

  case "$location" in
    malaysia|uk) ;;
    *)
      echo "Unknown location: $location (malaysia|uk)" >&2
      return 1
      ;;
  esac

  local job="keval-kapdee-cv-${role}-${location}"
  local auxdir="out/aux/${role}-${location}"
  local src="\\def\\cvrole{${role}}\\def\\cvlocation{${location}}\\input{keval-kapdee-cv.tex}"

  mkdir -p out "$auxdir"
  # TeX Live xelatex has no -aux-directory; keep aux/log here and move the PDF out.
  xelatex -output-directory="$auxdir" -jobname="$job" "$src"
  xelatex -output-directory="$auxdir" -jobname="$job" "$src"
  mv -f "${auxdir}/${job}.pdf" "out/${job}.pdf"
}

compile_all() {
  local pids=()
  local pid
  local fail=0

  for role in general cloud ai; do
    for location in malaysia uk; do
      compile_one "$role" "$location" &
      pids+=("$!")
    done
  done

  for pid in "${pids[@]}"; do
    wait "$pid" || fail=1
  done

  return "$fail"
}

if [[ "${1:-}" == --all ]]; then
  compile_all
else
  compile_one "${1:-${ROLE:-general}}" "${2:-${LOCATION:-malaysia}}"
fi
