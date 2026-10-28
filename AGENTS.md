# Agent notes

Build the CV with the justfile. Those recipes run `compile.sh` inside the `texlive/texlive` Docker image. Do not call `xelatex` on the host.

```bash
just compile platform    # out/keval-kapdee-cv-platform.pdf
just compile product     # out/keval-kapdee-cv-product.pdf
just compile-all         # both PDFs
just watch               # rebuild both when a .tex file changes
```
