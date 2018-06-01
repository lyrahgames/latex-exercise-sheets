DATABASE_DIRECTORY = ../database
CATALOG = catalog
CATALOG_IMPORT_LIST = catalog_import_list

EXERCISE_FILES = $(shell find $(DATABASE_DIRECTORY) -mindepth 2 -name "*.tex")
EXERCISE_FILES := $(shell realpath --relative-to $(DATABASE_DIRECTORY) $(EXERCISE_FILES))
# $(info EXERCISE_FILES = $(EXERCISE_FILES))

.PHONY: build catalog $(EXERCISE_FILES) clean $(CATALOG_IMPORT_LIST).tex

build: catalog

clean:
	latexmk -C $(CATALOG).tex

# rm $(CATALOG_IMPORT_LIST).tex
catalog: $(EXERCISE_FILES)
	@latexmk -pdf -f $(CATALOG).tex

# @echo "Add \"$@\""
$(EXERCISE_FILES): $(CATALOG_IMPORT_LIST).tex
	@echo "\\noindent \\textbf{Kommando zum Importieren der Aufgabe:}\\\\" >> $<
	@echo "{\\noindent\\footnotesize\\verb:\\atiImportTask{:\\%\\\\" >> $<
	@echo "\\verb:\\atiDatabaseDirectory/:\\%\\\\ \\verb:$(@D)/:\\%\\\\" >> $<
	@echo "\\verb:}{$(@F)}:}\\bigskip" >> $<
	@echo "\\par\\atiImportTask{\\atiDatabaseDirectory/$(@D)/}{$(@F)}" >> $<
	@echo "\\cleardoublepage" >> $<
	@echo "" >> $<

$(CATALOG_IMPORT_LIST).tex:
	@echo -n "" > $@