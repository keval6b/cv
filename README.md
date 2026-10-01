# CV

One master file, [`keval-kapdee-cv.tex`](keval-kapdee-cv.tex), tailored for the OpenAI Deployment Company Forward Deployed Engineer roles. Location is a compile-time flag; the experience is shared.

| Flag | Values | Default |
| --- | --- | --- |
| location | `uk`, `sg` | `uk` |

```bash
./compile.sh                  # uk
./compile.sh sg
just compile-all              # both PDFs locally, in parallel
```

Output is `out/keval-kapdee-cv-{location}.pdf`.
