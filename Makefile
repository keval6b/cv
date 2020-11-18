compile:
	cat index.md | grep -v "+44" > temp.md
	pandoc temp.md -s -c style.css -o index.html
	rm temp.md
	pandoc index.md --template=template.tex --pdf-engine=xelatex -o keval-kapdee-cv.pdf
