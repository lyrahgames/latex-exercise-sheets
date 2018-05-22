SOURCE_DIRECTORY = $(shell pwd)
TEX_DIR = $(HOME)/texmf/tex/latex
PACKAGE_NAME = exercisedatabase
PACKAGE_TEMPLATE = package_template
DATABASE_COMMAND = databaseDirectory

EXERCISE_FILES = $(shell find -name "*.tex")
$(info EXERCISE_FILES = $(EXERCISE_FILES))

DIRECTORIES = $(sort $(dir $(EXERCISE_FILES)))
$(info DIRECTORIES = $(DIRECTORIES))

# .PHONY: $(EXERCISE_FILES)

# $(EXERCISE_FILES): %.tex: catalog.tex
# 	sed -i 's:%EXERCISES:\\input{$@}\n%EXERCISES:' catalog.tex

# catalog.tex:
# 	cp catalog_template catalog.tex


# catalog.tex: $(EXERCISE_FILES)
# 	cp catalog_template catalog.tex
# 	for f in $(EXERCISE_FILES); do sed -i 's:%EXERCISES:\\input{\$f}\n%EXERCISES:' $@; done


$(TEX_DIR)/$(PACKAGE_NAME).sty: $(PACKAGE_NAME).sty $(TEX_DIR)
	cp $< $@

$(PACKAGE_NAME).sty: $(PACKAGE_TEMPLATE)
	sed 's/PACKAGE_NAME/$(PACKAGE_NAME)/' $< > $@
	sed -i 's/DATABASE_COMMAND/\\$(DATABASE_COMMAND)/' $@
	sed -i 's:DATABASE_DIRECTORY:$(SOURCE_DIRECTORY):' $@

$(TEX_DIR):
	mkdir -p $@