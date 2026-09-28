# CV

One master file, [`keval-kapdee-cv.tex`](keval-kapdee-cv.tex). Role is a compile-time flag; edit facts once and every PDF follows. Location is not a variant: every PDF says UK-based, remote, London hybrid with work-from-anywhere, or relocation to Malaysia.

| Flag | Values | Default |
| --- | --- | --- |
| role | `general`, `cloud`, `ai` | `general` |

```bash
./compile.sh                  # general
./compile.sh cloud
just compile ai
just docker cloud
just compile-all              # all three PDFs locally, in parallel
```

Output is `out/keval-kapdee-cv-{role}.pdf`. Push to `main` builds the matrix and attaches every PDF to the `latest` GitHub release.
