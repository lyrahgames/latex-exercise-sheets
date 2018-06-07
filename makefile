SUBDIRECTORIES = packages database catalog examples sheets # the order is important
FILES = atistandard.sty
TEX_DIRECTORY = $(HOME)/texmf/tex/latex
COPY_FILES = $(addprefix $(TEX_DIRECTORY)/, $(FILES))

.PHONY: all $(SUBDIRECTORIES) install

all: install $(SUBDIRECTORIES)

$(SUBDIRECTORIES):
	$(MAKE) -C $@

install: $(COPY_FILES)

$(TEX_DIRECTORY)/%.sty: %.sty $(TEX_DIRECTORY)
	cp $< $@

$(TEX_DIRECTORY):
	mkdir -p $@