# CV

One master file, [`keval-kapdee-cv.tex`](keval-kapdee-cv.tex). Role and location are compile-time flags; edit facts once and every PDF follows.

| Flag | Values | Default |
| --- | --- | --- |
| role | `general`, `cloud`, `ai` | `general` |
| location | `malaysia`, `uk` | `malaysia` |

```bash
./compile.sh                  # general + malaysia
./compile.sh cloud uk
just compile ai uk
just docker cloud malaysia
just compile-all              # all six PDFs locally
```

Output is `out/keval-kapdee-cv-{role}-{location}.pdf`. Push to `main` builds the matrix and attaches every PDF to the `latest` GitHub release.

Do not fork content onto per-company git branches. Add another `\ifcvrole` / `\ifcvlocation` (or a later company flag) in the master instead.
