SHEET_TEX_FILES = $(shell find . -name "*.tex")
SHEET_BASENAMES = $(basename $(SHEET_TEX_FILES))
SHEET_TARGETS = $(addsuffix .pdf,$(SHEET_BASENAMES))
# $(info SHEET_TARGETS = $(SHEET_TARGETS))

.PHONY: all clean

all: $(SHEET_TARGETS)

%.pdf: %.tex
	latexmk -f -pdf -cd $<

clean:
	latexmk -cd -C $(SHEET_TEX_FILES)