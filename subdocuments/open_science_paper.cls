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

\ProvidesClass{open-science-paper}[2012/09/10 version 0.2 LaTeX class of the Open-Science-Paper]

\LoadClassWithOptions{scrartcl}

%%%-------------------------------------------------%%%
%%% Input encodings fonts and symbols %%%
%%%-------------------------------------------------%%% 

%% input and font encoding %%
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

%% Fonts and math symbols %%
% \RequirePackage{lmodern}  
\RequirePackage{libertine}
\RequirePackage{amsmath}
\RequirePackage[libertine]{newtxmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb} 
\RequirePackage{textcomp}

%%%-------------------------------------------------%%%
%%% Patch some LaTeX problems %%%
%%%-------------------------------------------------%%%

\RequirePackage{fixltx2e}
\RequirePackage{scrhack}
\RequirePackage{etex} 
\RequirePackage{etoolbox} 
\reserveinserts{30}

%%%-------------------------------------------------%%%
%%% Useful tools %%%
%%%-------------------------------------------------%%%

\RequirePackage{calc}

%%%-------------------------------------------------%%%
%%% Language adaption of the document %%%
%%%-------------------------------------------------%%%

\RequirePackage[ngerman, english]{babel} 
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

\RequirePackage[svgnames]{xcolor} 
% Some defaults:
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

\colorlet{HeaderRuleColor}{LightGray}
\colorlet{TitleColor}{DarkRed}
\colorlet{AbstractSectionColor}{gray}  

\colorlet{SubsectionColor}{DarkOrange}
\colorlet{ParagraphColor}{gray}
\colorlet{BibliographySectionColor}{DarkOrange}

\colorlet{CapitalLetterColor}{gray}

\colorlet{FootRuleColor}{LightGray}
\colorlet{FootContentColor}{DarkGray} 

\colorlet{PageNumberingColor}{DarkGray}

\xdefinecolor{ListingBackgroundColor}{gray}{.90}

\xdefinecolor{LinkColor}{rgb}{0,0,0.4} 

%%%-------------------------------------------------%%%
%%% Title header defaults %%%
%%%-------------------------------------------------%%%

\providecommand{\ospTitle}{Here comes the osp title}
\providecommand{\ospAuthors}{Author one\textsuperscript{1 2}, Author two\textsuperscript{2}, \ldots}
\providecommand{\ospAffiliations}{University of XY departement of Z\textsuperscript{1}, \ldots}
\providecommand{\ospKeywords}{Open Science, Git, R, Knitr, ggplot2, tikz}

%%%-------------------------------------------------%%%
%%% Define header and footer %%%
%%%-------------------------------------------------%%%

\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.3pt}
\fancyfoot[R]{\textbf{\textcolor{PageNumberingColor}{{\thepage}}}}
\fancyfoot[L]{\raisebox{-0.9ex}{\includegraphics[scale=0.15]{graphics/open-science-papers-logo-footer.png}} \textcolor{FootContentColor}{{\small Open-Science-Papers Journal \textcolor{LightGray}{$\circ$} Compiled on \today}}}
\makeatletter
\patchcmd{\footrule}{\hrule}{\color{FootRuleColor}\hrule}{}{}
\makeatother

%%%-------------------------------------------------%%%
%%% Control runin big letters %%%
%%%-------------------------------------------------%%%

\usepackage{lettrine}
\newcommand{\capital}[1]{\lettrine[nindent=0em, findent=0.2em, lines=2]{\textcolor{CapitalLetterColor}{#1}}}    

%%%-------------------------------------------------%%%
%%% List options %%%
%%%-------------------------------------------------%%%

\RequirePackage[neverdecrease]{paralist}

%% Overwrite the listing environments with the ones from paralist
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
\usetikzlibrary{spy,external,automata,patterns,shadows.blur,trees,mindmap,arrows,decorations.pathmorphing,backgrounds,positioning,fit,petri}
\pgfdeclarelayer{background}
\pgfdeclarelayer{foreground}
\pgfsetlayers{background,main,foreground}

%% Define tikz styles %%
\tikzstyle{pictureframe} = [rectangle, rounded corners, draw=gray!10, fill=white, blur shadow={shadow blur steps=5,shadow blur extra rounding=1.3pt}]
\tikzstyle{signbackground} = [rectangle, fill=gray!3, rounded corners, draw=gray, very thin]

\RequirePackage{subcaption} 
% usage:
%  \begin{figure}
%    \begin{subfigure}{Breite}
%      Bild
%      \caption{Text}
%    \end{subfigure}
%  \end{figure}

%%%-------------------------------------------------%%%
%%% Control floatings and captions %%%
%%%-------------------------------------------------%%%

%% Control float placement %%
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

\newcolumntype{R}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
% usage:
%  R{column width} for raggedright column in certain width
%  C{column width} for centered column in certain width

%% Aggregate cells column and row wise %%
\RequirePackage{multirow}
% usage:
%  Horizontal aggregation of table cells
%	 \multicolumn{count of columns}{alignment}{text}
%  Vertical aggregation of table cells  
%	 \multirow{count of rows}{width}{text}

%% Tables spanning multiple pages 
\RequirePackage{longtable}

%%%-------------------------------------------------%%%
%%% Multi column documents %%%
%%%-------------------------------------------------%%%

\RequirePackage{multicol}

%%%-------------------------------------------------%%%
%%% Bibliography options %%%
%%%-------------------------------------------------%%%

%% citation management %%
\RequirePackage[backend=biber, natbib=true, style=authoryear, bibstyle=authoryear, hyperref=true]{biblatex}

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

% Usage:
%  \prettyref{fig:my_figure_label}
%  \prettyref{Fig:my_figure_label}

%%%-------------------------------------------------%%%
%%% Options for code listings in your document %%%
%%%-------------------------------------------------%%%

\RequirePackage{listings}

\definecolor{solarized@base03}{HTML}{002B36}
\definecolor{solarized@base02}{HTML}{073642}
\definecolor{solarized@base01}{HTML}{586e75}
\definecolor{solarized@base00}{HTML}{657b83}
\definecolor{solarized@base0}{HTML}{839496}
\definecolor{solarized@base1}{HTML}{93a1a1}
\definecolor{solarized@base2}{HTML}{EEE8D5}
\definecolor{solarized@base3}{HTML}{FDF6E3}
\definecolor{solarized@yellow}{HTML}{B58900}
\definecolor{solarized@orange}{HTML}{CB4B16}
\definecolor{solarized@red}{HTML}{DC322F}
\definecolor{solarized@magenta}{HTML}{D33682}
\definecolor{solarized@violet}{HTML}{6C71C4}
\definecolor{solarized@blue}{HTML}{268BD2}
\definecolor{solarized@cyan}{HTML}{2AA198}
\definecolor{solarized@green}{HTML}{859900}
 
\lstset{%
upquote=true,
columns=fixed,
tabsize=2,
showstringspaces=false,
flexiblecolumns=true,
extendedchars=true,
breaklines=true,
numbers=left, 
backgroundcolor=\color{ListingBackgroundColor},
stepnumber=1,
numbersep=7pt,
xleftmargin=10pt,
% rulesepcolor=\color{solarized@base03},
% numberblanklines=true,
numberstyle=\tiny\color{solarized@base01},
basicstyle=\footnotesize\ttfamily,
keywordstyle=\color{solarized@green},
stringstyle=\color{solarized@cyan}\ttfamily,
identifierstyle=\color{solarized@blue},
commentstyle=\color{solarized@base01},
emphstyle=\color{solarized@red}
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

% Define Header %% 
\newcommand{\HeaderRule}{\color{HeaderRuleColor} \rule{\linewidth}{1.6pt}}

%% Defines the abstract %%
\RequirePackage{abstract}
\renewcommand{\abstractnamefont}{\color{AbstractSectionColor}\normalfont\sffamily\large\bfseries}
\renewcommand{\abstracttextfont}{\normalfont} 


%%%-------------------------------------------------%%%
%%% Typographical options of the headings %%%
%%%-------------------------------------------------%%%

\RequirePackage[noindentafter,calcwidth]{titlesec}  

%\titleformat{\chapter}
%{\normalfont\sffamily\huge\bfseries}{%\chaptertitlename\ 
%\thechapter}{20pt}{\Huge}

\titleformat{\section}
{\color{BibliographySectionColor}\normalfont\sffamily\large\bfseries}{\thesection}{1em}{}

\titleformat{\subsection}
{\color{SubsectionColor}\normalfont\sffamily\large\bfseries}{\thesubsection}{1em}{}

%\titleformat{\subsubsection}
%{\normalfont\sffamily\normalsize\bfseries}{\thesubsubsection}{1em}{}

\titleformat{\paragraph}[runin]
{\color{ParagraphColor}\normalfont\sffamily\normalsize\bfseries}{\theparagraph}{1em}{}

%\titleformat{\subparagraph}[runin]
%{\normalfont\sffamily\normalsize\bfseries}{\thesubparagraph}{1em}{}

%\titlespacing*{\chapter}
% {0pt}{50pt}{40pt}
%\titlespacing*{\section}
% {0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\section}
 {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}
\titlespacing*{\subsection}
 {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}
%\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\paragraph}
 {0pt}{3.25ex plus 1ex minus 0.2ex}{1em}
%\titlespacing*{\subparagraph} {\parindent}{3.25ex plus 1ex minus .2ex}{1em}


%%%-------------------------------------------------%%%
%%% Typographical fine-tuning %%%
%%%-------------------------------------------------%%%

%% No indent for new paragraph %%
\setlength{\parindent}{0em} 

%% Correction of white spaces %%
\RequirePackage{ellipsis}

%% To set right space after macros %%
\RequirePackage{xspace}

%% TeX typesetting parameters %%
\clubpenalty = 9999 % No "Schusterjungen"
\widowpenalty = 9999 % No "Hurenkinder"
\displaywidowpenalty = 9999
\tolerance = 200
\hbadness = 1414
\emergencystretch = 1.5em
\hfuzz = 0.3pt

%% Microtype for fine-tuning of typesetting %%
\RequirePackage[protrusion=true,%
expansion=true,%
babel=true,%
tracking=true,% 
spacing=false]{microtype}     

\DeclareMicrotypeSet*[tracking]{my}% 
       {font = */*/*/sc/*}% 
\SetTracking{encoding = *, shape = sc}{40}

%%%-------------------------------------------------%%%
%%% PDF Options %%%
%%%-------------------------------------------------%%%

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
  pdfauthor={Open-Science-Paper},
  pdfcreator={Open-Science-Paper},
  pdfsubject={Open-Science-Paper},
  pdfkeywords={LaTeX, Tikz, Knitr, Scientific paper, Open science}
  ]{hyperref}

% Usage:
%  \href{URL}{text} 
%  \url{URL}
%  \nolinkurl{URL}


%%%-------------------------------------------------%%%
%%% Do before the document starts %%%
%%%-------------------------------------------------%%%

%% Set typesetting area with last chosen options
\KOMAoptions{DIV=last}


