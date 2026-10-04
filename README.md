# CV

One master file, [`keval-kapdee-cv.tex`](keval-kapdee-cv.tex). Role is a compile-time flag; edit facts once and every PDF follows. Location is not a variant: every PDF says UK-based, remote, London hybrid with work-from-anywhere, or relocation to Malaysia.

| Role | Title |
| --- | --- |
| `platform` | Cloud / Platform Engineer |
| `product` | Founding / Product Engineer |

```bash
./compile.sh platform
./compile.sh product
just compile platform
just docker product
just compile-all              # both PDFs locally, in parallel
```

Output is `out/keval-kapdee-cv-{role}.pdf`. Push to `main` builds the matrix and attaches every PDF to the `latest` GitHub release.
