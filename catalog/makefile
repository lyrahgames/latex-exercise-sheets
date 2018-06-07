DATABASE_DIRECTORY = ../database
CATALOG = catalog
CATALOG_IMPORT_LIST = catalog_import_list

EXERCISE_FILES = $(shell find $(DATABASE_DIRECTORY) -mindepth 2 -name "*.tex")
EXERCISE_FILES := $(subst $(DATABASE_DIRECTORY)/,,$(EXERCISE_FILES))
# $(info EXERCISE_FILES = $(EXERCISE_FILES))

.PHONY: build catalog $(EXERCISE_FILES) clean $(CATALOG_IMPORT_LIST).tex

build: catalog

clean:
	latexmk -C $(CATALOG).tex

# rm $(CATALOG_IMPORT_LIST).tex
catalog: $(EXERCISE_FILES)
	@latexmk -pdf -f $(CATALOG).tex

$(EXERCISE_FILES): $(CATALOG_IMPORT_LIST).tex
	$(file >>$<,\noindent\textbf{Kommando zum Importieren der Aufgabe:}\\)
	$(file >>$<,{\noindent\footnotesize\verb:\atiImportTask{:\%\\)
	$(file >>$<,\verb:\atiDatabaseDirectory/:\%\\ \verb:$(@D)/:\%\\)
	$(file >>$<,\verb:}{$(@F)}:}\bigskip)
	$(file >>$<,\par\atiImportTask{\atiDatabaseDirectory/$(@D)/}{$(@F)})
	$(file >>$<,\cleardoublepage)
	$(file >>$<,)

$(CATALOG_IMPORT_LIST).tex:
	$(file >$@)