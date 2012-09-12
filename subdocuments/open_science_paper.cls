%%------------------------------------------------------------------------------------%%
%%------------------------------------------------------------------------------------%%
%% Content : Open-Science-Paper LateX-Class 
%% Use : Open-Sciene-Paper formatting 
%% Author : Claas-Thido Pfaff
%%------------------------------------------------------------------------------------%%
%%------------------------------------------------------------------------------------%%

%%%-------------------------------------------------%%%
%%% Class requires format %%%
%%%-------------------------------------------------%%%

\NeedsTeXFormat{LaTeX2e}

%%%-------------------------------------------------%%%
%%% Provides class. Load options from class call %%%
%%%-------------------------------------------------%%%

\ProvidesClass{open-science-paper}[2012/09/10 version 0.1 LaTeX class Open-Science-Paper]

\LoadClassWithOptions{scrartcl}

%%%-------------------------------------------------%%%
%%% Input encodings fonts and symbols %%%
%%%-------------------------------------------------%%%

%% input and font encoding %%
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

%% Fonts and math symbols %%
\RequirePackage{lmodern}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{textcomp}

%%%-------------------------------------------------%%%
%%% Patch some LaTeX problems %%%
%%%-------------------------------------------------%%%

\RequirePackage{fixltx2e}
\RequirePackage{scrhack}
\RequirePackage{etex}
\reserveinserts{30}

%%%-------------------------------------------------%%%
%%% Language adaption of the document %%%
%%%-------------------------------------------------%%%

\RequirePackage[ngerman,english]{babel} 
\RequirePackage[autostyle]{csquotes}

%%%-------------------------------------------------%%%
%%% Blindtext %%%
%%%-------------------------------------------------%%%

\RequirePackage{lipsum}

%%%-------------------------------------------------%%%
%%% Color options %%%
%%%-------------------------------------------------%%%

\RequirePackage{xcolor} 
% Some standards
% 	green 
%  blue
%  cyan
%  magenta
%  red
%  yellow
%  black
%  white
%  darkgray
%  gray
%  lightgray

%% Color definitions %%
\xdefinecolor{ListingBackgroundColor}{gray}{.95}
\xdefinecolor{ListingCommentstyleColor}{gray}{.60}
\xdefinecolor{LinkColor}{rgb}{0,0,0.4}

\xdefinecolor{ListingBackgroundColor}{gray}{.95}
\xdefinecolor{ListingCommentstyleColor}{gray}{.60}


%%%-------------------------------------------------%%%
%%% Graphics options %%%
%%%-------------------------------------------------%%%

%% Use and create graphics %%
\RequirePackage{graphicx}
\RequirePackage{overpic}
\RequirePackage{tikz}

%% Load tikz-libraries, extend the functionality %%
\usetikzlibrary{spy,external,automata,patterns,shadows,trees,mindmap,arrows,decorations.pathmorphing,backgrounds,positioning,fit,petri}
\pgfdeclarelayer{background}
\pgfdeclarelayer{foreground}
\pgfsetlayers{background,main,foreground}

%% Define block styles %%
\tikzstyle{pictureframe} = [rectangle, rounded corners, draw]
\tikzstyle{signbackground} = [rectangle, fill=gray!3, rounded corners, draw=gray, very thin]

%% Create subfigures (check if already obsolete!) %%
\RequirePackage{subfig}

%%%-------------------------------------------------%%%
%%% Control floatings and captions %%%
%%%-------------------------------------------------%%%

%% Control floating placement %%
\RequirePackage{float} 
% Note:
%  This packages introduces the float parameter "H" which must be used in "multicol" 
%  environments because they do not allow floating	

%% Control caption layout %%
% \RequirePackage[margin=10pt, font={small,it}, format=hang, labelformat=default, labelsep=endash, justification=centering, singlelinecheck=false]{caption}
\RequirePackage[format=plain, margin=7pt, font={small,it}, labelformat=default, labelfont=bf]{caption}

%%%-------------------------------------------------%%%
%%% Table related options %%%
%%%-------------------------------------------------%%%

%% Professional tables
\RequirePackage{booktabs}
% useage:
%	\toprule
%	\midrule
%	\bottomrule
% 	\cmidrule{from column #. - to column #}

%% Extended table functions
\RequirePackage{tabularx}
%implementiert:
%	Spaltentyp (X)
%	etc...

%% Aggregate column cells %%
\RequirePackage{multirow}
% usage:
%  Horizontal aggregation of table cells
%	 \multicolumn{columns}{alignment}{text}
%  Vertical aggregation of table cells  
%	 \multirow{rows}{width}{text}

% Use color in tables 
%\RequirePackage{array}          
%\RequirePackage{colortbl}       

%% Multi column documents %%
\RequirePackage{multicol}

%%%-------------------------------------------------%%%
%%% Bibliography Options %%%
%%%-------------------------------------------------%%%

%% citation management %%
\RequirePackage[backend=biber, natbib=true,style=authoryear,bibstyle=authoryear,hyperref=true]{biblatex}

%% additional options %%
\ExecuteBibliographyOptions{
url=false,
isbn=false,
doi=false,
firstinits=false,
bibencoding=utf8
}

%% add a BibTeX file %%
\addbibresource{subdocuments/paper_bibliography.bib}

% usage:
%  \citet{jon90} ⇒ Jones et al. (1990)
%  \citet[chap.~2]{jon90} ⇒ Jones et al. (1990, chap. 2)
%  \citep{jon90} ⇒ (Jones et al., 1990)
%  \citep[chap.~2]{jon90} ⇒ (Jones et al., 1990, chap. 2)
%  \citep[see][]{jon90} ⇒ (see Jones et al., 1990)
%  \citep[see][chap.~2]{jon90} ⇒ (see Jones et al., 1990, chap. 2)
%  \citet*{jon90} ⇒ Jones, Baker, and Williams (1990)
%  \citep*{jon90} ⇒ (Jones, Baker, and Williams, 1990)

%%%-------------------------------------------------%%%
%%% Typesetting of units %%%
%%%-------------------------------------------------%%%

\RequirePackage{siunitx}
% usage:
%  \si{kg.m/s^2}
%  \num{12345}
%  \num{0,1234}
%  \num{.12345}
%  \ang{12.3}
%  \ang{1;2;3}
%  \ang{;;-1}
%  \SI{-29}{\degreeCelsius}   
%  \SI{30000}{\kilogram}


%%%-------------------------------------------------%%%
%%% Teaching LaTeX %%%
%%%-------------------------------------------------%%%

%% Source code and compiled LaTeX document next to each other %%
\RequirePackage{showexpl}

%%%-------------------------------------------------%%%
%%% Options for references in the document %%%
%%%-------------------------------------------------%%%

\RequirePackage{prettyref}

\newrefformat{fig}{figure~\ref{#1}}
\newrefformat{Fig}{Figure~\lowercase{\ref{#1}}}
\newrefformat{cha}{chapter~\ref{#1}}
\newrefformat{Cha}{Chapter~\lowercase{\ref{#1}}}
\newrefformat{sec}{chapter~\ref{#1}}
\newrefformat{Sec}{Chapter~\lowercase{\ref{#1}}}
\newrefformat{sub}{chapter~\ref{#1}}
\newrefformat{Sub}{Chapter~\lowercase{\ref{#1}}}
\newrefformat{subs}{chapter~\ref{#1}}
\newrefformat{Subs}{Chapter~\lowercase{\ref{#1}}}
\newrefformat{tab}{table~\ref{#1}}
\newrefformat{Tab}{Table~\lowercase{\ref{#1}}}
\newrefformat{lst}{listing~\ref{#1}}
\newrefformat{Lst}{Listing~\lowercase{\ref{#1}}}
\newrefformat{equ}{equation~\ref{#1}}
\newrefformat{Equ}{Equation~\lowercase{\ref{#1}}}

%%%-------------------------------------------------%%%
%%% Options for code listings in your document %%%
%%%-------------------------------------------------%%%

\RequirePackage{listings}

\lstset{
   backgroundcolor=\color{ListingBackgroundColor},
   basicstyle=\scriptsize\ttfamily,
   keywordstyle=\bfseries\ttfamily\color{ListingKeywordstyleColor},
   stringstyle=\color{ListingStringstyleColor}\ttfamily,
   commentstyle=\color{ListingCommentstyleColor}\ttfamily,
   emph={word1}, 
   emphstyle=\color{ListingEmphstyleColor}\texttt, %for word 1
   emph={[2]word2,word3},
   emphstyle={[2]\color{ListingEmphstyleColor}\texttt}, %for word 2
   showstringspaces=false,
   flexiblecolumns=false,
   tabsize=3,
   numbers=left,
   breaklines=true,
   numberstyle=\tiny,
   numberblanklines=true,
   stepnumber=1,
   numbersep=10pt,
   xleftmargin=15pt
 }

%% Note: Only needed when writing in German 
\lstset{literate=%
{Ö}{{\"O}}1
{Ä}{{\"A}}1
{Ü}{{\"U}}1
{ß}{{\ss}}2 
{ü}{{\"u}}1
{ä}{{\"a}}1
{ö}{{\"o}}1
{~}{{\textasciitilde}}1
}

%%%-------------------------------------------------%%%
%%% Definition of environments %%%
%%%-------------------------------------------------%%%

%% Defines the abstract %%
\RequirePackage{abstract}

%%%-------------------------------------------------%%%
%%% Typographical options of the headings %%%
%%%-------------------------------------------------%%%

\RequirePackage[noindentafter,calcwidth]{titlesec}  

%%%-------------------------------------------------%%%
%%% Typographical fine-tuning %%%
%%%-------------------------------------------------%%%

%% Enlarge the skip between paragraphs %%
\setlength{\parskip}{0.5ex plus0.0ex minus0ex}  

%% Slightly smaller listing element distance %%
\setlength{\itemsep}{0ex minus0.2ex} 

%% No indent for new paragraph %%
\setlength{\parindent}{0em} 

%% correction of white spaces %%
\RequirePackage{ellipsis}

%% right spaces after macros %%
\RequirePackage{xspace}

%% TeX typesetting parameters %%
\clubpenalty = 9999 % No "Schusterjungen"
\widowpenalty = 9999 % No "Hurenkinder"
\displaywidowpenalty = 9999
\tolerance = 200
\hbadness = 1414
\emergencystretch = 1.5em
\hfuzz = 0.3pt

%% Micro type fine-tuning of typesetting %%
\RequirePackage[protrusion=true,%
expansion=true,%
babel=true,%
tracking=true,% 
spacing=false]{microtype}     

\DeclareMicrotypeSet*[tracking]{my}% 
       { font = */*/*/sc/* }% 
\SetTracking{ encoding = *, shape = sc }{40}

%%%-------------------------------------------------%%%
%%% PDF Options %%%
%%%-------------------------------------------------%%%

% Define the hyperref link color 
\xdefinecolor{LinkColor}{rgb}{0,0,0.4}

\RequirePackage[%
  plainpages=false,%
  bookmarks=true,%
  bookmarksopen=true,%
  pdfborder={0 0 0},%
  pdfpagemode=UseNone,%
  colorlinks=false,%
  linkcolor=LinkColor,
  citecolor=LinkColor,%
  filecolor=LinkColor,%
  menucolor=LinkColor,%	
  urlcolor=LinkColor,%
  breaklinks=true,%
  raiselinks=true,%
  pdfauthor={Your name here},
  pdfcreator={Your name here},
  pdfsubject={Your subject here},
  pdfkeywords={LaTeX, Tikz, Knitr, Scientific paper, Open science}
  ]{hyperref}

%% Examples:
% \href{URL}{text} 
% \url{URL}
% \nolinkurl{URL}

%%%-------------------------------------------------%%%
%%% Todo before the document starts %%%
%%%-------------------------------------------------%%%

%% Set typesetting area with last chosen options
\KOMAoptions{DIV=last}
