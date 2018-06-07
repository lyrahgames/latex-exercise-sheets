# latex exercise sheets

## Requirements
- find (shell tool)
- sed (shell tool)
- GNU Make
- pdflatex
- latexmk

## Cloning the repository
    git clone https://gitlab.com/Sambesi/latex-exercise-sheets.git

## Build everything
    cd latex-exercise-sheets
    make

## Build only parts
    make packages # install custom packages
    make database # install package for database directory
    make catalog  # generate task catalog
    make examples # build all examples
    make sheets   # build all sheets

## Clean parts
The following can be done for every folder in the main directory.
Here we use the example folder 'packages'.

    cd packages
    make clean

## Contributors
- Markus Pawellek (markuspawellek@gmail.com)
- Agnes Sambale (agnes.sambale@uni-jena.de)