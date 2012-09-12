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
% usage:
%  \enquote{} to put a text in the right quotes


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

%%%-------------------------------------------------%%%
%%% List options %%%
%%%-------------------------------------------------%%%

\RequirePackage[neverdecrease]{paralist}

\let\itemize\compactitem
\let\enditemize\endcompactitem
\let\enumerate\compactenum
\let\endenumerate\endcompactenum
\let\description\compactdesc
\let\enddescription\endcompactdesc

\pltopsep=\medskipamount
\setdefaultenum{1.}{a)~}{i.~}{A)~}%
\setdefaultleftmargin{1.5em}{1.2em}{1.2em}{1.2em}{1.2em}{1.2em}%
\setdefaultitem{$\circ$}{\textbullet}{\textperiodcentered}{--}%

%%%-------------------------------------------------%%%
%%% Graphics options %%%
%%%-------------------------------------------------%%%

%% Use and create graphics %%
\RequirePackage{graphicx}
\RequirePackage{overpic}
\RequirePackage{tikz}

%% Load some tikz libraries %%
\usetikzlibrary{spy,external,automata,patterns,shadows,trees,mindmap,arrows,decorations.pathmorphing,backgrounds,positioning,fit,petri}
\pgfdeclarelayer{background}
\pgfdeclarelayer{foreground}
\pgfsetlayers{background,main,foreground}

%% Define tikz styles %%
\tikzstyle{pictureframe} = [rectangle, rounded corners, draw]
\tikzstyle{signbackground} = [rectangle, fill=gray!3, rounded corners, draw=gray, very thin]

%% Create sub figures (check if already obsolete!) %%
\RequirePackage{subfig}

%%%-------------------------------------------------%%%
%%% Control floatings and captions %%%
%%%-------------------------------------------------%%%

%% Control floating placement %%
\RequirePackage{float} 

%% Control caption layout %%
\RequirePackage[format=plain, margin=7pt, font={small,it}, labelformat=default, labelfont=bf]{caption}

%%%-------------------------------------------------%%%
%%% Table related options %%%
%%%-------------------------------------------------%%%

%% Professional tables %%
\RequirePackage{booktabs}
% useage:
%	\toprule
%	\midrule
%	\bottomrule
% 	\cmidrule{from column #. - to column #}

%% Extended table functions %%
\RequirePackage{tabularx}

%% Aggregate column cells %%
\RequirePackage{multirow}
% usage:
%  Horizontal aggregation of table cells
%	 \multicolumn{columns}{alignment}{text}
%  Vertical aggregation of table cells  
%	 \multirow{rows}{width}{text}

%%%-------------------------------------------------%%%
%%% Multi column documents %%%
%%%-------------------------------------------------%%%

\RequirePackage{multicol}

%%%-------------------------------------------------%%%
%%% Bibliography options %%%
%%%-------------------------------------------------%%%

%% citation management %%
\RequirePackage[backend=biber, natbib=true,style=authoryear,bibstyle=authoryear,hyperref=true]{biblatex}

%% additional bib options %%
\ExecuteBibliographyOptions{
url=false,
isbn=false,
doi=false,
firstinits=false,
bibencoding=utf8
}

%% add a BibTeX bibliography file %%
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
%%% Display LaTeX code compiled %%%
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

%\titleformat{\chapter}
%{\normalfont\sffamily\huge\bfseries}{%\chaptertitlename\ 
%\thechapter}{20pt}{\Huge}

%\titleformat{\section}
%{\normalfont\sffamily\Large\bfseries}{\thesection}{1em}{}

\titleformat{\subsection}
{\normalfont\sffamily\large\bfseries}{\thesubsection}{1em}{}

%\titleformat{\subsubsection}
%{\normalfont\sffamily\normalsize\bfseries}{\thesubsubsection}{1em}{}

\titleformat{\paragraph}[runin]
{\normalfont\sffamily\normalsize\bfseries}{\theparagraph}{1em}{}

%\titleformat{\subparagraph}[runin]
%{\normalfont\sffamily\normalsize\bfseries}{\thesubparagraph}{1em}{}

%\titlespacing*{\chapter}
% {0pt}{50pt}{40pt}
%\titlespacing*{\section}
% {0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsection}
 {0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
%\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\paragraph}
 {0pt}{3.25ex plus 1ex minus .2ex}{1em}
%\titlespacing*{\subparagraph} {\parindent}{3.25ex plus 1ex minus .2ex}{1em}


%%%-------------------------------------------------%%%
%%% Typographical fine-tuning %%%
%%%-------------------------------------------------%%%

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

%% Microtype fine-tuning of typesetting %%
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
