compile: clean
	xelatex keval-kapdee-cv.tex
clean:
	rm *.pdf *.aux *.log *.out *.fdb_latexmk *.fls *.gz __* || true
