#My LaTeX-Makefile

#Maindocument
DOCUMENT = maindoc_paper

MAPDIR = maps/
MAPFILES = $(wildcard maps/Map*.pdf)
MAPNAMES = $(notdir $(MAPFILES))

#MULTIDOCS = doc1 doc2 doc3 usw...

#Programs
SWEAVE = R CMD Sweave
PGFSWEAVE = R CMD pgfsweave -s -p 2
KNITR = knit
BIBTEX = biber
PDFLATEX = pdflatex 
PDFVIEWER = okular 
GLOSSARYINDEXER = makeglossaries

#Archive the document
ARCHNAME = $(DOCUMENT)-$(shell date +%y%m%d)
ARCHFILES = bibliography distmap.r distmap.sh $(DOCUMENT).pdf $(DOCUMENT).Rnw maps subdocuments rawdata pictures scripts myclass2012de.cls species.list makefile tinyurl.sh startdevel.sh

CLEANFILES = Bilder/*.tikz cache/* *.xdy *tikzDictionary *.idx *.mtc* *.glo *.maf *.ptc *.tikz *.lot *.dpth *.figlist *.dep *.log *.makefile *.out *.map *.pdf *.tex *.toc *.aux *.tmp *.bbl *.blg *.lof *.acn *.acr *.alg *.glg *.gls *.ilg *.ind *.ist *.slg *.syg *.syi minimal.acn minimal.dvi minimal.ist minimal.syg minimal.synctex.gz *.bcf *.run.xml *-blx.bib  

CLEANSWP = .*.swp subdocuments/.*.swp

all: $(DOCUMENT).pdf 

$(DOCUMENT).pdf: $(DOCUMENT).Rnw $(DOCUMENT).tex praeambel.tex subdocuments/*.tex $(DOCUMENT).tex
	$(KNITR) $(DOCUMENT).Rnw $(DOCUMENT).tex --pdf
	$(PDFLATEX) $(DOCUMENT).tex
	$(BIBTEX) $(DOCUMENT)
	$(PDFLATEX) $(DOCUMENT).tex

nosint:
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

maps: distmap.r species.list
	./distmap.sh -u

clipmaps:
	for map in $(MAPNAMES); do pdfcrop --margins '1 5 1 5' --clip $(MAPDIR)$${map} $(MAPDIR)cl$${map}; done
	@-rm tmp-pdfcrop*.pdf

tinyurl: tinyurl.sh
	./tinyurl.sh

shrinkpdf:
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=Shrink$(DOCUMENT).pdf $(DOCUMENT).pdf 

archive:
	zip -r $(ARCHNAME).zip $(ARCHFILES)

clean:
	@-rm -r $(CLEANFILES)

swpclean:
	@-rm $(CLEANSWP)
	
