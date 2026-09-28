#!/usr/bin/env bash
set -euo pipefail

compile_one() {
  local role="$1"

  case "$role" in
    general|cloud|ai) ;;
    *)
      echo "Unknown role: $role (general|cloud|ai)" >&2
      return 1
      ;;
  esac

  local job="keval-kapdee-cv-${role}"
  local auxdir="out/aux/${role}"
  local src="\\def\\cvrole{${role}}\\input{keval-kapdee-cv.tex}"

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
    compile_one "$role" &
    pids+=("$!")
  done

  for pid in "${pids[@]}"; do
    wait "$pid" || fail=1
  done

  return "$fail"
}

if [[ "${1:-}" == --all ]]; then
  compile_all
else
  compile_one "${1:-${ROLE:-general}}"
fi
