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

%% Provide class otions 
\newif\if@color
\DeclareOption{color}{\@colortrue}
\DeclareOption{nocolor}{\@colorfalse}

\ExecuteOptions{% 
   % colored as default
   color,
} 

%% process options
\ProcessOptions*\relax

\providecommand{\ifcolor}[2]{\if@color#1\else#2\fi}

\LoadClassWithOptions{scrartcl}

%%%-------------------------------------------------%%%
%%% Input encodings fonts and symbols %%%
%%%-------------------------------------------------%%% 

%% input and font encoding %%
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

%% Fonts and math symbols %%
\RequirePackage{libertine}
\RequirePackage{amsmath}
\RequirePackage[libertine]{newtxmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb} 
\RequirePackage{textcomp}

%%%-------------------------------------------------%%%
%%% Patch some LaTeX shortcommings %%%
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

\RequirePackage[svgnames,cmyk]{xcolor} 

\xdefinecolor{ospColor@Links}{rgb}{0,0,0.4} 

\ifcolor{%
   \colorlet{ospColor@TitleRule}{LightGray}
   \colorlet{ospColor@Title}{DarkRed}
   
   \colorlet{ospColor@AbstractHeader}{DarkGray}   
   \colorlet{ospColor@SubsectionHeader}{DarkOrange}
   \colorlet{ospColor@ParagraphHeader}{DarkGray}
   \colorlet{ospColor@SectionHeader}{DarkOrange}
   
   \colorlet{ospColor@Lettrine}{DarkGray} 
   
   \colorlet{ospColor@FooterTextSeparator}{DarkGray}
   \colorlet{ospColor@FooterRule}{LightGray}
   \colorlet{ospColor@FullLeftFooter}{DarkGray} 
   \colorlet{ospColor@FullRightFooter}{DarkGray} 
   \colorlet{ospColor@FooterPageNumbering}{DarkGray}

   \xdefinecolor{ospColor@ListingBackground}{gray}{.90} 
   \xdefinecolor{ospColor@ListingBase00}{HTML}{657b83}
   \xdefinecolor{ospColor@ListingBase01}{HTML}{586e75}
   \xdefinecolor{ospColor@ListingBase02}{HTML}{073642}
   \xdefinecolor{ospColor@ListingBase03}{HTML}{002B36}
   \xdefinecolor{ospColor@ListingBase0}{HTML}{839496}
   \xdefinecolor{ospColor@ListingBase1}{HTML}{93a1a1}
   \xdefinecolor{ospColor@ListingBase2}{HTML}{EEE8D5}
   \xdefinecolor{ospColor@ListingBase3}{HTML}{FDF6E3}
   \xdefinecolor{ospColor@ListingYellow}{HTML}{B58900}
   \xdefinecolor{ospColor@ListingOrange}{HTML}{CB4B16}
   \xdefinecolor{ospColor@ListingRed}{HTML}{DC322F}
   \xdefinecolor{ospColor@ListingMagenta}{HTML}{D33682}
   \xdefinecolor{ospColor@ListingViolet}{HTML}{6C71C4}
   \xdefinecolor{ospColor@ListingBlue}{HTML}{268BD2}
   \xdefinecolor{ospColor@ListingCyan}{HTML}{2AA198}
   \xdefinecolor{ospColor@ListingGreen}{HTML}{859900}
}{% 
   \colorlet{ospColor@TitleRule}{black}
   \colorlet{ospColor@Title}{black} 

   \colorlet{ospColor@AbstractHeader}{black}  
   \colorlet{ospColor@SubsectionHeader}{black}
   \colorlet{ospColor@ParagraphHeader}{black}
   \colorlet{ospColor@SectionHeader}{black}

   \colorlet{ospColor@Lettrine}{black}
   
   \colorlet{ospColor@FooterRule}{black}
   \colorlet{ospColor@FullLeftFooter}{black}   
   \colorlet{ospColor@FullRightFooter}{black} 
   \colorlet{ospColor@FooterPageNumbering}{black} 
   \colorlet{ospColor@FooterTextSeparator}{black}

   \xdefinecolor{ospColor@ListingBackground}{gray}{.90} 
   \colorlet{ospColor@ListingBase00}{black}
   \colorlet{ospColor@ListingBase01}{black}
   \colorlet{ospColor@ListingBase02}{black}
   \colorlet{ospColor@ListingBase03}{black}
   \colorlet{ospColor@ListingBase0}{black}
   \colorlet{ospColor@ListingBase1}{black}
   \colorlet{ospColor@ListingBase2}{black}
   \colorlet{ospColor@ListingBase3}{black}
   \colorlet{ospColor@ListingYellow}{black}
   \colorlet{ospColor@ListingOrange}{black}
   \colorlet{ospColor@ListingRed}{black}
   \colorlet{ospColor@ListingMagenta}{black}
   \colorlet{ospColor@ListingViolet}{black}
   \colorlet{ospColor@ListingBlue}{black}
   \colorlet{ospColor@ListingCyan}{black}
   \colorlet{ospColor@ListingGreen}{black}
}

%%%-------------------------------------------------%%%
%%% Title header defaults %%%
%%%-------------------------------------------------%%%

\providecommand{\ospTitle}{The open science paper title} 
\providecommand{\ospSetTitle}[1]{\def\ospTitle{#1}}

\providecommand{\ospAuthors}{Author one\textsuperscript{1 2}, Author two\textsuperscript{2}, \ldots} 
\providecommand{\ospSetAuthors}[1]{\def\ospAuthors{#1}}

\providecommand{\ospAffiliations}{University of XY departement of Z\textsuperscript{1}, \ldots} 
\providecommand{\ospSetAffiliations}[1]{\def\ospAffiliations{#1}}

\providecommand{\ospKeywords}{Open Science, Git, R, Knitr, ggplot2, tikz}
\providecommand{\ospSetKeywords}[1]{\def\ospKeywords{#1}}

%%%-------------------------------------------------%%%
%%% Define header and footer %%%
%%%-------------------------------------------------%%%

\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}

%% Set the footer contents
\providecommand{\ospFooterTextLeftOfSeparator}{Open-Science-Papers} 
\providecommand{\ospSetFooterTextLeftOfSeparator}[1]{\def\ospFooterTextLeftOfSeparator{#1}}

\providecommand{\ospFooterTextRightOfSeparator}{Compiled on \today} 
\providecommand{\ospSetFooterTextRightOfSeparator}[1]{\def\ospFooterTextRightOfSeparator{#1}}

\providecommand{\ospFooterLogo}{\relax}
\providecommand{\ospSetFooterLogo}[1]{\gdef\ospFooterLogo{#1}}

\ifcolor{%
   \ospSetFooterLogo{\raisebox{-0.9ex}{\includegraphics[scale=0.15]{graphics/open-science-papers-logo-footer.png}}}
}{% 
   \ospSetFooterLogo{\raisebox{-0.9ex}{\includegraphics[scale=0.15]{graphics/open-science-papers-logo-footer-black.png}}}
}

\providecommand{\ospFooterTextSeparator}{\textcolor{ospColor@FooterTextSeparator}{$\circ$}} 
\providecommand{\ospSetFooterTextSeparator}[1]{\gdef\ospFooterTextSeparator{#1}}

\providecommand{\ospFullLeftFooter}{\ospFooterLogo\xspace~ \textcolor{ospColor@FullLeftFooter}{{\normalsize \ospFooterTextLeftOfSeparator\xspace \ospFooterTextSeparator\xspace \ospFooterTextRightOfSeparator}}} 
\providecommand{\ospSetFullLeftFooter}[1]{\gdef\ospFullLeftFooter{#1}}

%% Style the footer and header elements 
\providecommand{\ospFooterRuleColor}{ospColor@FooterRule} 
\providecommand{\ospSetFooterRuleColor}[1]{\gdef\ospFooterRuleColor{#1}}

\newlength{\ospLengthHeaderRuleWidth} 
\setlength{\ospLengthHeaderRuleWidth}{0pt} 
\renewcommand{\headrulewidth}{\ospLengthHeaderRuleWidth}

\newlength{\ospLengthFooterRuleWidth} 
\setlength{\ospLengthFooterRuleWidth}{0.4pt} 
\renewcommand{\footrulewidth}{\ospLengthFooterRuleWidth} 

\patchcmd{\footrule}{\hrule}{\color{\ospFooterRuleColor}\hrule}{}{}

\providecommand{\ospFooterPageNumberingColor}{ospColor@FooterPageNumbering} 
\providecommand{\ospSetFooterPageNumberingColor}[1]{\gdef\ospFooterPageNumberingColor{#1}} 

\providecommand{\ospFooterPageNumberingStyle}{\normalsize\textbf} 
\providecommand{\ospSetFooterPageNumberingStyle}[1]{\gdef\ospFooterPageNumberingStyle{#1}} 

\providecommand{\ospFullRightFooter}{{\ospFooterPageNumberingStyle{\textcolor{\ospFooterPageNumberingColor}{{\thepage}}}}} 
\providecommand{\ospSetFullRightFooter}[1]{\gdef\ospFullRightFooter{#1}}

\fancyfoot[L]{\ospFullLeftFooter}
\fancyfoot[R]{\ospFullRightFooter} 

%%%-------------------------------------------------%%%
%%% Control big starting letters (Lettrine) %%%
%%%-------------------------------------------------%%%

\usepackage{lettrine}
\newcommand{\capital}[1]{\lettrine[nindent=0em, findent=0.2em, lines=2]{\textcolor{ospColor@Lettrine}{#1}}}    

%%%-------------------------------------------------%%%
%%% List options %%%
%%%-------------------------------------------------%%%

\RequirePackage[neverdecrease]{paralist}

% override item lists 
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
%%% Graphic options %%%
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
\ifcolor{%
   % \tikzstyle{pictureframe} = [rectangle, rounded corners, draw=LightGray, fill=white, blur shadow={shadow blur steps=5, shadow blur extra rounding=1.3pt}] 
   \tikzstyle{pictureframe} = [rectangle, rounded corners, draw=LightGray, thick, fill=white] 
}{%
   \tikzstyle{pictureframe} = [rectangle, rounded corners, draw=black, fill=white]
}

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
 
\lstset{%
upquote=true,
columns=fixed,
tabsize=2,
showstringspaces=false,
flexiblecolumns=true,
extendedchars=true,
breaklines=true,
numbers=left, 
backgroundcolor=\color{ospColor@ListingBackground},
stepnumber=1,
numbersep=7pt,
xleftmargin=10pt,
% rulesepcolor=\color{ospColor@ListingBase03},
% numberblanklines=true,
numberstyle=\tiny\color{ospColor@ListingBase01},
basicstyle=\footnotesize\ttfamily,
keywordstyle=\color{ospColor@ListingGreen},
stringstyle=\color{ospColor@ListingCyan}\ttfamily,
identifierstyle=\color{ospColor@ListingBlue},
commentstyle=\color{ospColor@ListingBase01},
emphstyle=\color{ospColor@ListingRed}
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
\providecommand{\ospTitleRule}{\textcolor{ospColor@TitleRule}{\noindent\rule{\linewidth}{1.7pt}}}

\providecommand{\ospMakeTitle}{%
{\ospTitleRule}\\[0.01\baselineskip] 
\begin{tabular}{p{0.23\textwidth}p{0.55\textwidth}}
\begin{minipage}{0.25\textwidth}
   \includegraphics[scale=0.3]{graphics/open-science-papers-logo-frameless.png} 
\end{minipage}&	
\begin{minipage}{0.7\textwidth} 
\vspace{\baselineskip}
{\color{ospColor@Title}{{\normalfont\sffamily\Huge\bfseries \ospTitle }}} \hfill\\[\baselineskip]
   \begin{normalsize}\textbf{\ospAuthors}\end{normalsize}\hfill\\
   \begin{normalsize}\textbf{Affiliation:} \ospAffiliations\end{normalsize}\hfill\\
   \begin{normalsize}\textbf{Keywords:} \ospKeywords\end{normalsize}\hfill\\[.5\baselineskip]
\end{minipage}\\
\end{tabular}\\[0.01\baselineskip]
}

%% Defines the abstract %%
\RequirePackage{abstract}
\renewcommand{\abstractnamefont}{\color{ospColor@AbstractHeader}\normalfont\sffamily\large\bfseries}
\renewcommand{\abstracttextfont}{\normalfont} 


%%%-------------------------------------------------%%%
%%% Typographical options of the headings %%%
%%%-------------------------------------------------%%%

\RequirePackage[noindentafter,calcwidth]{titlesec}  

%\titleformat{\chapter}
%{\normalfont\sffamily\huge\bfseries}{%\chaptertitlename\ 
%\thechapter}{20pt}{\Huge}

\titleformat{\section}
{\color{ospColor@SectionHeader}\normalfont\sffamily\large\bfseries}{\thesection}{1em}{}

\titleformat{\subsection}
{\color{ospColor@SubsectionHeader}\normalfont\sffamily\large\bfseries}{\thesubsection}{1em}{}

%\titleformat{\subsubsection}
%{\normalfont\sffamily\normalsize\bfseries}{\thesubsubsection}{1em}{}

\titleformat{\paragraph}[runin]
{\color{ospColor@ParagraphHeader}\normalfont\sffamily\normalsize\bfseries}{\theparagraph}{1em}{}

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
  linkcolor=ospColor@Links,
  citecolor=ospColor@Links,%
  filecolor=ospColor@Links,%
  menucolor=ospColor@Links,%	
  urlcolor=ospColor@Links,%
  breaklinks=true,%
  raiselinks=true,%
  pdfauthor={Open-Science-Paper},%
  pdfcreator={Open-Science-Paper},%
  pdfsubject={Open-Science-Paper},%
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
