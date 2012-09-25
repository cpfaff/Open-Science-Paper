##------------------------------------------------------------------------------------##
##------------------------------------------------------------------------------------##
## Content: Open-Science-Paper LaTeX-Makefile
## Usage: Compile Open-Science-Papers  
## Author: Claas-Thido Pfaff
##------------------------------------------------------------------------------------##
##------------------------------------------------------------------------------------##

# Maindocument
DOCUMENT = open_science_paper

# Dependencies maindocument
DEPENDENCIES = $(DOCUMENT).Rnw subdocuments/open_science_paper.cls subdocuments/*.Rnw 

# Used Programs
KNITR = knit
BIBTEX = biber
PDFLATEX = pdflatex
PACKER= tar -czf
REMOVER = @-rm -r
PRINTER = @-echo 
GREPPER = @-grep
COPY = @-cp
PDFVIEWER = okular
DATE = $(shell date +%y%m%d)

# Example and Empty files  
SUBDOCFOLDER = subdocuments/
EXMPLDOCS = subdocuments/exmpl/* 
TEMPDOCS = subdocuments/temp/*

# Archive document
ARCHNAME = $(DOCUMENT)_$(DATE).tar.gz
ARCHFILES = $(DOCUMENT).pdf $(DOCUMENT).Rnw subdocuments data graphics makefile

# Clean up the document folder
CLEANFILES = graphics/dynamic/* cache/* *.xdy *tikzDictionary *.idx *.mtc* *.glo *.maf *.ptc *.tikz *.lot *.dpth *.figlist *.dep *.log *.makefile *.out *.map *.tex *.toc *.aux *.tmp *.bbl *.blg *.lof *.acn *.acr *.alg *.glg *.gls *.ilg *.ind *.ist *.slg *.syg *.syi minimal.acn minimal.dvi minimal.ist minimal.syg minimal.synctex.gz *.bcf *.run.xml *-blx.bib  

# General rule
all: $(DOCUMENT).pdf 

$(DOCUMENT).pdf: $(DEPENDENCIES)  
	$(KNITR) $(DOCUMENT).Rnw $(DOCUMENT).tex --pdf
	$(PDFLATEX) $(DOCUMENT).tex
	$(BIBTEX) $(DOCUMENT)
	$(PDFLATEX) $(DOCUMENT).tex

# Special rules
showpdf:
	$(PDFVIEWER) $(DOCUMENT).pdf & 

warnings:
	$(PRINTER) "----------------------------------------------------o"
	$(PRINTER) "Multiple defined lables!"
	$(PRINTER) ""
	$(GREPPER) 'multiply defined' $(DOCUMENT).log
	$(PRINTER) "----------------------------------------------------o"
	$(PRINTER) "Undefined lables!"
	$(PRINTER) ""
	$(GREPPER) 'undefined' $(DOCUMENT).log
	$(PRINTER) "----------------------------------------------------o"
	$(PRINTER) "Warnings!"
	$(PRINTER) ""
	$(GREPPER) 'Warning' $(DOCUMENT).log
	$(PRINTER) "----------------------------------------------------o"
	$(PRINTER) "Over- and Underfull boxes!"
	$(PRINTER) ""
	$(GREPPER) 'Overfull' $(DOCUMENT).log
	$(GREPPER) 'Underfull' $(DOCUMENT).log
	$(PRINTER) "----------------------------------------------------o"

archive:
	$(PACKER) $(ARCHNAME) $(ARCHFILES)

clean:
	$(REMOVER) $(CLEANFILES)	

expldoc:
	$(COPY) $(EXMPLDOCS) $(SUBDOCFOLDER) 

tmpdoc:
	$(COPY) $(TEMPDOCS) $(SUBDOCFOLDER) 
