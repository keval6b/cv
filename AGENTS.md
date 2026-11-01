# Agent notes

Build the CV with the justfile. Those recipes run `compile.sh` inside the `texlive/texlive` Docker image. Do not call `xelatex` on the host.

```bash
just compile platform    # out/keval-kapdee-cv-platform.pdf
just compile product     # out/keval-kapdee-cv-product.pdf
just compile-all         # platform and product
just watch               # rebuild both when a .tex file changes
```

## Applications

The phone number for job forms is in `.private/phone`. That file is gitignored. Read it when a form asks for a phone number. Do not copy the number into tracked files or commits.

CV PDFs:

- `out/keval-kapdee-cv-product.pdf` for founding, product, forward-deployed, and applied-AI roles
- `out/keval-kapdee-cv-platform.pdf` for cloud-cost and infrastructure roles whose scope is AWS, Terraform, CI, and cost
