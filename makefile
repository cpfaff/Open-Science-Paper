##------------------------------------------------------------------------------------##
##------------------------------------------------------------------------------------##
## Content: Open-Science-Paper LaTeX-Makefile
## Usage: Compile Open-Science-Papers  
## Author: Claas-Thido Pfaff
##------------------------------------------------------------------------------------##
##------------------------------------------------------------------------------------##

#Maindocument
DOCUMENT = open_science_paper

#Used Programs
KNITR = knit
BIBTEX = biber
PDFLATEX = pdflatex 
ZIP= zip -r
PDFVIEWER = okular 

# Archive the document
ARCHNAME = $(DOCUMENT)-$(shell date +%y%m%d)
ARCHFILES = $(DOCUMENT).pdf $(DOCUMENT).Rnw subdocuments data graphics makefile

# Clean up the document folder
CLEANFILES = Bilder/*.tikz cache/* *.xdy *tikzDictionary *.idx *.mtc* *.glo *.maf *.ptc *.tikz *.lot *.dpth *.figlist *.dep *.log *.makefile *.out *.map *.pdf *.tex *.toc *.aux *.tmp *.bbl *.blg *.lof *.acn *.acr *.alg *.glg *.gls *.ilg *.ind *.ist *.slg *.syg *.syi minimal.acn minimal.dvi minimal.ist minimal.syg minimal.synctex.gz *.bcf *.run.xml *-blx.bib  

# General rules
all: $(DOCUMENT).pdf 

$(DOCUMENT).pdf: $(DOCUMENT).Rnw subdocuments/open_science_paper.cls subdocuments/*.tex 
	$(KNITR) $(DOCUMENT).Rnw $(DOCUMENT).tex --pdf
	$(PDFLATEX) $(DOCUMENT).tex
	$(BIBTEX) $(DOCUMENT)
	$(PDFLATEX) $(DOCUMENT).tex

showpdf:
	$(PDFVIEWER) $(DOCUMENT).pdf & 

warnings:
	@-echo "----------------------------------------------------o"
	@-echo "Multiple defined lables!"
	@-echo ""
	@-grep 'multiply defined' $(DOCUMENT).log
	@-echo "----------------------------------------------------o"
	@-echo "Undefined lables!"
	@-echo ""
	@-grep 'undefined' $(DOCUMENT).log
	@-echo "----------------------------------------------------o"
	@-echo "Warnings!"
	@-echo ""
	@-grep 'Warning' $(DOCUMENT).log
	@-echo "----------------------------------------------------o"
	@-echo "Over- and Underfull boxes!"
	@-echo ""
	@-grep 'Overfull' $(DOCUMENT).log
	@-grep 'Underfull' $(DOCUMENT).log
	@-echo "----------------------------------------------------o"

archive:
	$(ZIP) $(ARCHNAME) $(ARCHFILES)

clean:
	@-rm -r $(CLEANFILES)	
