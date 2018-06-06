TEX_FILES = \
	readme.tex \
	import_01.tex \
	standalonetask_01.tex \
	standalonetask_02.tex

PDF_FILES = $(addsuffix .pdf,$(basename $(TEX_FILES)))

.PHONY: all clean

all: $(PDF_FILES)

%.pdf: %.tex
	latexmk -pdf -f $<

clean:
	latexmk -C $(TEX_FILES)