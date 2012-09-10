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
PDFVIEWER = okular 
GLOSSARYINDEXER = makeglossaries

# Archive the document
ARCHNAME = $(DOCUMENT)-$(shell date +%y%m%d)
ARCHFILES = paper.bib $(DOCUMENT).pdf $(DOCUMENT).Rnw subdocuments data graphics makefile

# Clean up the document folder
CLEANFILES = Bilder/*.tikz cache/* *.xdy *tikzDictionary *.idx *.mtc* *.glo *.maf *.ptc *.tikz *.lot *.dpth *.figlist *.dep *.log *.makefile *.out *.map *.pdf *.tex *.toc *.aux *.tmp *.bbl *.blg *.lof *.acn *.acr *.alg *.glg *.gls *.ilg *.ind *.ist *.slg *.syg *.syi minimal.acn minimal.dvi minimal.ist minimal.syg minimal.synctex.gz *.bcf *.run.xml *-blx.bib  

# General rules
all: $(DOCUMENT).pdf 

$(DOCUMENT).pdf: $(DOCUMENT).Rnw $(DOCUMENT).tex subdocuments/open_science_paper.cls subdocuments/*.tex $(DOCUMENT).tex
	$(KNITR) $(DOCUMENT).Rnw $(DOCUMENT).tex --pdf
	$(PDFLATEX) $(DOCUMENT).tex
	$(BIBTEX) $(DOCUMENT)
	$(PDFLATEX) $(DOCUMENT).tex

# Special rules
noknit:
	$(PDFLATEX) $(DOCUMENT).Rnw
	$(BIBTEX) $(DOCUMENT)
	$(PDFLATEX) $(DOCUMENT).Rnw

init:
	$(KNITR) $(DOCUMENT).Rnw $(DOCUMENT).tex --pdf
	$(BIBTEX) $(DOCUMENT)
	$(PDFLATEX) $(DOCUMENT).tex

gloss:	
	$(PDFLATEX) $(DOCUMENT).tex
	$(GLOSSARYINDEXER) $(DOCUMENT)
	$(PDFLATEX) $(DOCUMENT).tex

final:	
	$(KNITR) $(DOCUMENT).Rnw $(DOCUMENT).tex --pdf
	$(PDFLATEX) $(DOCUMENT).tex
	$(BIBTEX) $(DOCUMENT)
	$(PDFLATEX) $(DOCUMENT).tex
	$(GLOSSARYINDEXER) $(DOCUMENT)
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

shrinkpdf:
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=Shrink$(DOCUMENT).pdf $(DOCUMENT).pdf 

archive:
	zip -r $(ARCHNAME).zip $(ARCHFILES)

clean:
	@-rm -r $(CLEANFILES)	
