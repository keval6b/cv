compile:
	mkdir out || true
	xelatex -output-directory=out keval-kapdee-cv.tex
	xelatex -output-directory=out keval-kapdee-cv.tex
	@grep -q "Output written on .* (1 page)" out/keval-kapdee-cv.log || (echo "Error: Document exceeds one page" && exit 1)

docker:
	docker run -v ./:/wd --user $(id -u):$(id -g) -w /wd texlive/texlive make compile
	@grep -q "Output written on .* (1 page)" out/keval-kapdee-cv.log || (echo "Error: Document exceeds one page" && exit 1)
