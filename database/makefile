SOURCE_DIRECTORY = $(shell pwd)
TEX_DIR = $(HOME)/texmf/tex/latex
PACKAGE_NAME = atidatabase
PACKAGE_TEMPLATE = package_template
DATABASE_COMMAND = atiDatabaseDirectory


.PHONY: install
install: $(TEX_DIR)/$(PACKAGE_NAME).sty

$(TEX_DIR)/$(PACKAGE_NAME).sty: $(PACKAGE_NAME).sty $(TEX_DIR)
	cp $< $@

$(PACKAGE_NAME).sty: $(PACKAGE_TEMPLATE)
	sed 's/PACKAGE_NAME/$(PACKAGE_NAME)/' $< > $@
	sed -i 's/DATABASE_COMMAND/\\$(DATABASE_COMMAND)/' $@
	sed -i 's:DATABASE_DIRECTORY:$(SOURCE_DIRECTORY):' $@

$(TEX_DIR):
	mkdir -p $@