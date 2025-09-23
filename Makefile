compile:
	mkdir out || true
	xelatex -output-directory=out keval-kapdee-cv.tex
	xelatex -output-directory=out keval-kapdee-cv.tex

docker:
	docker run -v ./:/wd --user $(id -u):$(id -g) -w /wd texlive/texlive make compile
