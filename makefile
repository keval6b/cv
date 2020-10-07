compile:
	pandoc index.md -s -c style.css -o index.html
	pandoc index.md --template=template.tex --pdf-engine=xelatex -o keval-kapdee-cv.pdf
