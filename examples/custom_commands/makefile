.PHONY: clean

readme.pdf: readme.tex
	latexmk -pdf -f $<

clean:
	latexmk -C readme.tex