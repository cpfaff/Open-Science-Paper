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

\ProvidesClass{open-science-paper}[2013/03/03 version 0.9.2 LaTeX class of the Open-Science-Paper]

\RequirePackage{xkeyval} 

\define@boolkey[KV]{open-science-paper}[osp@]{linenumbers}[false]{}
\define@boolkey[KV]{open-science-paper}[osp@]{color}[false]{}
\define@boolkey[KV]{open-science-paper}[osp@]{print}[false]{}
\define@boolkey[KV]{open-science-paper}[osp@]{gitinfo}[false]{}
\define@boolkey[KV]{open-science-paper}[osp@]{csvdata}[false]{}
\define@boolkey[KV]{open-science-paper}[osp@]{sectionnumbers}[false]{}
\define@boolkey[KV]{open-science-paper}[osp@]{autolayout}[false]{}
\define@boolkey[KV]{open-science-paper}[osp@]{twosidelayout}[false]{}
\define@boolkey[KV]{open-science-paper}[osp@]{reversepagelayout}[false]{}  
\define@boolkey[KV]{open-science-paper}[osp@]{resetdefaultclassoptions}[false]{}  
\define@boolkey[KV]{open-science-paper}[osp@]{parindent}[false]{}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{scrartcl}}

\presetkeys{open-science-paper}{%
   linenumbers=false, 
   color=false, 
   print=false, 
   gitinfo=false, 
   csvdata=false,
   sectionnumbers=false,
   autolayout=true,
   twosidelayout=false,
   reversepagelayout=false, 
   resetdefaultclassoptions=false, 
   parindent=false,
}{}

\ProcessOptionsX[KV]<open-science-paper>

\ifosp@resetdefaultclassoptions%
   \LoadClass{scrartcl}   
\else% 
   \ifosp@autolayout  
      \ifosp@twosidelayout%
         \LoadClass[11pt, headings=small, captions=tableheading, DIV=20, notitlepage, twoside, final]{scrartcl}   
      \else%
         \LoadClass[11pt, headings=small, captions=tableheading, DIV=20, notitlepage, oneside, final]{scrartcl}   
      \fi%
   \else%
      \ifosp@twosidelayout%
         \LoadClass[11pt, headings=small, captions=tableheading, notitlepage, twoside, final]{scrartcl}
      \else%
         \LoadClass[11pt, headings=small, captions=tableheading, notitlepage, oneside, final]{scrartcl}
      \fi%
      \RequirePackage{geometry}
   \fi% 
\fi%

%%%-------------------------------------------------%%%
%%% Input encodings fonts and symbols %%%
%%%-------------------------------------------------%%% 

%% input and font encoding %%
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{luainputenc}

%% Fonts and math symbols %%
\RequirePackage{libertine}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage[libertine]{newtxmath}
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
\RequirePackage{xifthen}  
\RequirePackage{ifluatex} 
\RequirePackage{datatool} 
% \RequirePackage{expl3}  
% \RequirePackage{xstring} 
\RequirePackage{suffix}

%%%-------------------------------------------------%%%
%%% Helpers (unify commands to use in style file) %%%
%%%-------------------------------------------------%%%

\newcommand{\ospSetLength}[2]{\setlength{#1}{#2}}
\newcommand{\ospSetColor}[2]{\colorlet{#1}{#2}} 
\newcommand{\ospDefineColor}[3]{\xdefinecolor{#1}{#2}{#3}}

\newcommand{\ospSetFont}[2]{
  \def#1{#2} 
}  

\newcommand{\ospSetContent}[2]{
  \def#1{#2} 
}  


% usage:

%%%-------------------------------------------------%%%
%%% Language adaption of the document %%%
%%%-------------------------------------------------%%%

\RequirePackage[ngerman, english]{babel} 
\RequirePackage[autostyle]{csquotes}  

% usage:
%  \enquote{} to put a text in the right quotes

%%%-------------------------------------------------%%%
%%% Lipsum %%%
%%%-------------------------------------------------%%%

\RequirePackage{lipsum}

% usage:

%%%-------------------------------------------------%%%
%%% Color options %%%
%%%-------------------------------------------------%%%

\ifosp@print%
   \RequirePackage[svgnames,cmyk]{xcolor}  
\else%
   \RequirePackage[svgnames,rgb]{xcolor} 
\fi%

\ifosp@color% 
   \colorlet{ospColorTitleRule}{LightGray}
   \colorlet{ospColorTitle}{DarkRed}
   \colorlet{ospColorAbstractHeader}{DarkGray}   
   \colorlet{ospColorSubsectionHeader}{DarkOrange}
   \colorlet{ospColorParagraphHeader}{DarkGray}
   \colorlet{ospColorSectionHeader}{DarkOrange}

   \colorlet{ospColorLettrine}{DarkGray}  

   \colorlet{ospColorLineNumbers}{DarkGray} 

   \colorlet{ospColorFooterTextSeparator}{DarkGray}
   \colorlet{ospColorFooterRule}{LightGray}
   \colorlet{ospColorFullLeftFooter}{DarkGray} 
   \colorlet{ospColorFullRightFooter}{DarkGray} 
   \colorlet{ospColorFooterPageNumber}{DarkGray}

   \xdefinecolor{ospColor@Links}{rgb}{0,0,0.4} 
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
\else%
   \colorlet{ospColorTitleRule}{black}
   \colorlet{ospColorTitle}{black} 

   \colorlet{ospColorAbstractHeader}{black}  
   \colorlet{ospColorSubsectionHeader}{black}
   \colorlet{ospColorParagraphHeader}{black}
   \colorlet{ospColorSectionHeader}{black}

   \colorlet{ospColorLettrine}{black}
   
   \colorlet{ospColorLineNumbers}{black} 
   
   \colorlet{ospColorFooterRule}{black}
   \colorlet{ospColorFullLeftFooter}{black}   
   \colorlet{ospColorFullRightFooter}{black} 
   \colorlet{ospColorFooterPageNumber}{black} 
   \colorlet{ospColorFooterTextSeparator}{black}

   \xdefinecolor{ospColor@Links}{rgb}{0,0,0.4} 
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
\fi%

%%%-------------------------------------------------%%%
%%% Include Git information %%%
%%%-------------------------------------------------%%%

\ifosp@gitinfo%
   \RequirePackage{gitinfo} 

   \newcommand{\ospGitUrl}{\tiny{\href{ospGitUrl}{https://github.com/cpfaff/Open-Science-Paper}}}
   \newcommand{\ospSetGitUrl}[1]{\def\ospGitUrl{#1}}

   \newcommand{\ospGitInfoLine}{{\tiny Version from commit by \gitAuthorEmail~on~\gitAuthorDate; Source on: \ospGitUrl}\par}
   \newcommand{\ospSetGitInfoLine}[1]{\def\ospGitInfo{#1}}
\else%
   \newcommand{\ospGitInfoLine}{}
   \newcommand{\ospSetGitInfoLine}[1]{\def\ospGitInfo{#1}}
\fi%

%%%-------------------------------------------------%%%
%%% Define header and footer %%%
%%%-------------------------------------------------%%%

\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}

%% Set the footer contents
\newcommand{\ospFooterTextLeftOfSeparator}{Open-Science-Papers} 
\newcommand{\ospSetFooterTextLeftOfSeparator}[1]{\def\ospFooterTextLeftOfSeparator{#1}}

\newcommand{\ospFooterTextRightOfSeparator}{Compiled on \today} 
\newcommand{\ospSetFooterTextRightOfSeparator}[1]{\def\ospFooterTextRightOfSeparator{#1}}

\newcommand{\ospFooterLogo}{\relax}
\newcommand{\ospSetFooterLogo}[1]{\gdef\ospFooterLogo{#1}}

\ifosp@color%
   \ospSetFooterLogo{\raisebox{-0.9ex}{\includegraphics[scale=0.15]{osp/graphics/open-science-papers-footer-logo-gray.pdf}}}
\else% 
   \ospSetFooterLogo{\raisebox{-0.9ex}{\includegraphics[scale=0.15]{osp/graphics/open-science-papers-footer-logo-black.pdf}}}
\fi%

\newcommand{\ospFooterTextSeparator}{\textcolor{ospColorFooterTextSeparator}{$\circ$}} 
\newcommand{\ospSetFooterTextSeparator}[1]{\gdef\ospFooterTextSeparator{#1}}

\newcommand{\ospFullLeftFooter}{\ospFooterLogo\xspace~ \textcolor{ospColorFullLeftFooter}{{\normalsize \ospFooterTextLeftOfSeparator\xspace \ospFooterTextSeparator\xspace \ospFooterTextRightOfSeparator}}} 
\newcommand{\ospSetFullLeftFooter}[1]{\gdef\ospFullLeftFooter{#1}}

%% Style the footer and header elements 
\newcommand{\ospFooterRuleColor}{ospColorFooterRule} 
\newcommand{\ospSetFooterRuleColor}[1]{\gdef\ospFooterRuleColor{#1}}

\newlength{\ospLengthHeaderRuleWidth} 
\setlength{\ospLengthHeaderRuleWidth}{0pt} 
\renewcommand{\headrulewidth}{\ospLengthHeaderRuleWidth}

\newlength{\ospLengthFooterRuleWidth} 
\setlength{\ospLengthFooterRuleWidth}{0.4pt} 
\renewcommand{\footrulewidth}{\ospLengthFooterRuleWidth} 

\patchcmd{\footrule}{\hrule}{\color{\ospFooterRuleColor}\hrule}{}{}

\newcommand{\ospFooterPageNumberingColor}{ospColorFooterPageNumber} 
\newcommand{\ospSetFooterPageNumberingColor}[1]{\gdef\ospFooterPageNumberingColor{#1}} 

\newcommand{\ospFooterPageNumberingStyle}{\normalsize\textbf} 
\newcommand{\ospSetFooterPageNumberingStyle}[1]{\gdef\ospFooterPageNumberingStyle{#1}} 

\newcommand{\ospFullRightFooter}{{\ospFooterPageNumberingStyle{\textcolor{\ospFooterPageNumberingColor}{{\thepage}}}}} 
\newcommand{\ospSetFullRightFooter}[1]{\gdef\ospFullRightFooter{#1}}

\ifosp@twosidelayout% 
   \ifosp@reversepagelayout%
      \fancyfoot[LO, RE]{\ospFullLeftFooter}
      \fancyfoot[RO, LE]{\ospFullRightFooter} 
   \else%
      \fancyfoot[RO, LE]{\ospFullLeftFooter}
      \fancyfoot[LO, RE]{\ospFullRightFooter} 
   \fi%
\else%
   \fancyfoot[L]{\ospFullLeftFooter}
   \fancyfoot[R]{\ospFullRightFooter} 
\fi%

%%%-------------------------------------------------%%%
%%% Control big starting letters (Lettrine) %%%
%%%-------------------------------------------------%%%

\usepackage{lettrine}

% set defaults
\setlength{\DefaultFindent}{0.2em}
\setlength{\DefaultNindent}{0.02em}

\newcommand{\ospSet@LettrineOptions}[1]{%
   \ifstrequal{#1}{A}{
      \setlength{\DefaultFindent}{-0.2em}
      \setlength{\DefaultNindent}{0.5em}
   }{\relax}

   \ifstrequal{#1}{T}{
      \setlength{\DefaultFindent}{0.27em}
      \setlength{\DefaultNindent}{0.02em}
   }{\relax}
   
}

\newcommand{\capital}[1]{%
   \ospSet@LettrineOptions{#1}
   \lettrine{\textcolor{ospColorLettrine}{#1}}
} 

%%%-------------------------------------------------%%%
%%% Enable linenumbers %%%
%%%-------------------------------------------------%%%

\ifosp@linenumbers%
   \RequirePackage[pagewise]{lineno}
   \RequirePackage{lineno}
   \setlength\linenumbersep{2pt}
   \renewcommand\linenumberfont{\normalfont\tiny\sffamily\color{ospColorLineNumbers}}
   \AtBeginDocument{\linenumbers} 
\else% 
   \RequirePackage[pagewise]{lineno}
\fi% 

%%%-------------------------------------------------%%%
%%% List options %%%
%%%-------------------------------------------------%%%

\RequirePackage[neverdecrease]{paralist}

% override item lists 
\let\itemize\compactitem%
\let\enditemize\endcompactitem%
\let\enumerate\compactenum%
\let\endenumerate\endcompactenum%
\let\description\compactdesc%
\let\enddescription\endcompactdesc%

\pltopsep=\medskipamount%
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
\ifosp@color
   % \tikzstyle{pictureframe} = [rectangle, rounded corners, draw=LightGray, fill=white, blur shadow={shadow blur steps=5, shadow blur extra rounding=1.3pt}] 
   \tikzstyle{pictureframe} = [rectangle, rounded corners, draw=LightGray, thick, fill=white] 
\else%
   \tikzstyle{pictureframe} = [rectangle, rounded corners, draw=black, fill=white]
\fi

\tikzstyle{signbackground} = [rectangle, fill=gray!3, rounded corners, draw=gray, very thin]

\RequirePackage{subcaption} 

% usage:

% \begin{figure}
  % \centering
  % \begin{subfigure}[b]{0.3\textwidth}
    % \centering
    % \includegraphics[width=\textwidth]{path/to/figure.png}
    % \caption{Picture A}
    % \label{fig:pica}
  % \end{subfigure}%
  % ~ %add desired spacing between images, e. g. ~, \quad, \qquad etc.
  % %(or a blank line to force the subfigure onto a new line)
  % \begin{subfigure}[b]{0.3\textwidth}
    % \centering
    % \includegraphics[width=\textwidth]{path/to/figure.png}
    % \caption{Picture B}
    % \label{fig:picb}
  % \end{subfigure}
  % ~ %add desired spacing between images, e. g. ~, \quad, \qquad etc.
  % %(or a blank line to force the subfigure onto a new line)
  % \begin{subfigure}[b]{0.3\textwidth}
    % \centering
    % \includegraphics[width=\textwidth]{path/to/figure.png}
    % \caption{Picture C}
    % \label{fig:picc}
  % \end{subfigure}
  % \caption{Pictures of animals}\label{fig:allfigs}
% \end{figure}


%%%-------------------------------------------------%%%
%%% Control floatings and captions %%%
%%%-------------------------------------------------%%%

%% Control float placement %%
\RequirePackage{float} 

\RequirePackage{placeins}

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

%% Tables spanning multiple pages %%
\RequirePackage{longtable}

%%%-------------------------------------------------%%%
%%% Multi column documents %%%
%%%-------------------------------------------------%%%

\RequirePackage{multicol}

\newlength{\ospLengthColumnSeparator} 
\setlength{\ospLengthColumnSeparator}{10pt} 
\AtBeginDocument{\setlength\columnsep{\ospLengthColumnSeparator{}}}

\newcommand{\ospColumnCount}{2} 
\newcommand{\ospSetColumnCount}[1]{\def\ospColumnCount{#1}} 

\newcommand{\ospColumnLayoutControlBegin}{
  \ifnum\ospColumnCount=1 
    \relax 
  \else 
    \begin{multicols}{\ospColumnCount{}}
  \fi
}

\newcommand{\ospColumnLayoutControlEnd}{
  \ifnum\ospColumnCount=1 
    \relax 
  \else 
    \end{multicols}
  \fi
}

% wrapper for the column layout in the root document
\newenvironment{ospColumLayout}{%
  \ospColumnLayoutControlBegin{}%
}{%
  \ospColumnLayoutControlEnd{}%
}


%%%-------------------------------------------------%%%
%%% Bibliography options %%%
%%%-------------------------------------------------%%%

%% citation management %%
\RequirePackage[backend = biber, bibstyle = authoryear, style = authoryear, natbib = true]{biblatex}
 
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
%%% Display LaTeX code and compiled output %%%
%%%-------------------------------------------------%%%

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
   upquote=true,%
   columns=fixed,%
   tabsize=2,%
   showstringspaces=false,%
   flexiblecolumns=true,%
   extendedchars=true,%
   breaklines=true,%
   numbers=left,% 
   backgroundcolor=\color{ospColor@ListingBackground},%
   stepnumber=1,%
   numbersep=7pt,%
   xleftmargin=10pt,%
   % rulesepcolor=\color{ospColor@ListingBase03},%
   % numberblanklines=true,%
   numberstyle=\tiny\color{ospColor@ListingBase01},%
   basicstyle=\footnotesize\ttfamily,%
   keywordstyle=\color{ospColor@ListingGreen},%
   stringstyle=\color{ospColor@ListingCyan}\ttfamily,%
   identifierstyle=\color{ospColor@ListingBlue},%
   commentstyle=\color{ospColor@ListingBase01},%
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

% For inline code listings (may be refined with a tikz frame)
\newcommand{\inlinecode}[1]{\colorbox{ospColorAtListingBackground}{\lstinline|#1|}}
% Usage: 
%       \inlinecode{a=a+b} 

%%%-------------------------------------------------%%%
%%% Definition of environments %%%
%%%-------------------------------------------------%%%

%% Title header defaults %%
\newcommand{\ospFontTitle}{\normalfont\sffamily\Huge\bfseries}  
% \newcommand{\ospSetFontTitle}[1]{\gdef\ospFontTitle{#1}} 

\newlength{\ospLengthOfTitleBeforeReduceFontSize} 
\setlength{\ospLengthOfTitleBeforeReduceFontSize}{0.6\textwidth} 

\newcommand{\ospTitle}{The open science paper title} 
\newcommand{\ospSetTitle}[1]{%
  \def\ospTitle{#1} 
  \newlength{\osp@LenghtTitle} 
  \settowidth{\osp@LenghtTitle}{#1}   

  \ifdim\osp@LenghtTitle>\ospLengthOfTitleBeforeReduceFontSize
    % \ospSetFontTitle{\normalfont\sffamily\LARGE\bfseries} 
    \ospSetFont{\ospFontTitle}{\normalfont\sffamily\LARGE\bfseries}
  \else 
    % \ospSetFontTitle{\normalfont\sffamily\Huge\bfseries}
    \ospSetFont{\ospFontTitle}{\normalfont\sffamily\Huge\bfseries}
  \fi 
} 

% wrapper for the header content in root file
\newenvironment{ospHeader}{
  \relax
}{
  \ospTitleRule
}

\newcommand{\ospAuthors}{Author one\textsuperscript{1,2,a}, Author two\textsuperscript{2}, \ldots} 
\newcommand{\ospSetAuthors}[1]{\def\ospAuthors{#1}}

\newcommand{\ospTitleKeywordContactName}{Corresponding:} 
\newcommand{\ospSetTitleKeywordContactName}[1]{\gdef\ospTitleKeywordContactName{#1}}  

\newcommand{\ospContacts}{foo@bar.com\textsuperscript{a}} 
\newcommand{\ospSetContacts}[1]{\def\ospContacts{#1}}

\newcommand{\ospAffiliations}{University of XY departement of Z\textsuperscript{1}, \ldots} 
\newcommand{\ospSetAffiliations}[1]{\def\ospAffiliations{#1}}

\newcommand{\ospKeywords}{Open Science, Git, R, Knitr, ggplot2, tikz}
\newcommand{\ospSetKeywords}[1]{\def\ospKeywords{#1}}

\newcommand{\ospTitleRule}{\textcolor{ospColorTitleRule}{\noindent\rule{\linewidth}{1.7pt}}}

\newcommand{\ospTitleLogo}{\includegraphics[scale=0.3]{osp/graphics/open-science-papers-title-header-logo.pdf}} 
\newcommand{\ospSetTitleLogo}[1]{\gdef\ospTitleLogo{#1}} 

\newcommand{\ospTitleKeywordAffiliationName}{Affiliation:} 
\newcommand{\ospSetTitleKeywordAffiliationName}[1]{\gdef\ospTitleKeywordAffiliationName{#1}} 

\newcommand{\ospTitleKeywordName}{Keywords:} 
\newcommand{\ospSetTitleKeywordName}[1]{\gdef\ospTitleKeywordName{#1}}  

\newcommand{\ospHeaderInfoFilePath}{osp/data/ospHeaderTable.csv} 
\newcommand{\ospSetHeaderInfoFilePath}[1]{\gdef\ospHeaderInfoFilePath{#1}}  

\newcommand{\ospFontAuthors}{\normalfont\sffamily\normalsize} 
% \newcommand{\ospSetFontAuthors}[1]{\gdef\ospFontAuthors{#1}} 
\ospSetFont{\ospFontAuthors}{\normalfont\sffamily\normalsize}

\newlength{\ospLengtTitleLogoColwidth} 
\setlength{\ospLengtTitleLogoColwidth}{0.23\textwidth} 

\newlength{\ospLengtTitleTitleColwidth} 
\setlength{\ospLengtTitleTitleColwidth}{0.55\textwidth} 

\newlength{\ospLengtTitleSpaceAbove}
\setlength{\ospLengtTitleSpaceAbove}{0.5\baselineskip} 

\newlength{\ospLengtTitleSpaceBelow} 
\setlength{\ospLengtTitleSpaceBelow}{0\baselineskip}  

\ifosp@csvdata
   \DTLloaddb{ospHeaderInfoFromTable}{\ospHeaderInfoFilePath}
   \DTLgetvalue{\ospTitleCsv}{ospHeaderInfoFromTable}{1}{\dtlcolumnindex{ospHeaderInfoFromTable}{ospTitle}}\par%
    \newcommand{\ospMakeTitle}{% 
      \ospTitleRule\par\vspace{\ospLengtTitleSpaceAbove}
         \begin{tabular}{p{\ospLengtTitleLogoColwidth}p{\ospLengtTitleTitleColwidth}}
            \begin{minipage}{0.25\textwidth}
               \ospTitleLogo%
            \end{minipage}&%
            \begin{minipage}{0.7\textwidth} 
               \vspace{\baselineskip}
                  {\color{ospColorTitle}{{\ospFontTitle\ospTitleCsv}}}\par%
                     \begin{normalsize}\textbf{%
                        \DTLsort{ospAuthorPriorityToAppear,ospAuthorFirstName}{ospHeaderInfoFromTable} 
                        \DTLforeach{ospHeaderInfoFromTable}{%
                           \firstName=ospAuthorFirstNameShort,% 
                           \lastName=ospAuthorLastName,%
                           \id=ospAuthorAffiliationIDs}{\ifdefempty{\firstName}{}{\DTLiflastrow{\firstName\xspace\lastName\textsuperscript{\id}}{\firstName\xspace\lastName\textsuperscript{\id},~}}}
                     }\end{normalsize}\par 
                  \begin{normalsize}\textbf{\ospTitleKeywordContactName}  
                     \DTLsort{ospAuthorEmailID}{ospHeaderInfoFromTable} 
                     \DTLforeach{ospHeaderInfoFromTable}{%
                        \email=ospAuthorEmail,%
                        \id=ospAuthorEmailID}{\ifdefempty{\email}{}{\DTLiflastrow{\href{mailto:\email}{\email}\textsuperscript{\id}}{\href{mailto:\email}{\email}\textsuperscript{\id},~}}}
                  \end{normalsize}\par%
                  \begin{normalsize}\textbf{\ospTitleKeywordAffiliationName}  
                     \DTLsort{ospAffiliationIDs}{ospHeaderInfoFromTable} 
                     \DTLforeach{ospHeaderInfoFromTable}{%
                        \affiliation=ospAffiliations,%
                        \id=ospAffiliationIDs}{\ifdefempty{\affiliation}{}{\DTLiflastrow{\affiliation\textsuperscript{\id}}{\affiliation\textsuperscript{\id},~}}}
                  \end{normalsize}\par%
                  \begin{normalsize}\textbf{\ospTitleKeywordName}% 
                     \DTLsort{ospKeywords}{ospHeaderInfoFromTable} 
                     \DTLforeach{ospHeaderInfoFromTable}{\keyword=ospKeywords}{\ifdefempty{\keyword}{}{\DTLiflastrow{\keyword}{\keyword,~}}} \end{normalsize}\par%
                  \ospGitInfoLine%
            \end{minipage}
         \end{tabular}\par\vspace{\ospLengtTitleSpaceBelow}
      }
\else%
   \newcommand{\ospMakeTitle}{%
      \ospTitleRule\par\vspace{\ospLengtTitleSpaceAbove}
         \begin{tabular}{p{\ospLengtTitleLogoColwidth}p{\ospLengtTitleTitleColwidth}}
            \begin{minipage}{0.25\textwidth}
               \ospTitleLogo%
            \end{minipage}&	
            \begin{minipage}{0.7\textwidth} 
               \vspace{\baselineskip}
                  {\color{ospColorTitle}{{\ospFontTitle\ospTitle}}}\par
                  \ifdefempty{\ospAuthors}{}{\begin{normalsize}\textbf{\ospAuthors}\end{normalsize}\par}
                  \ifdefempty{\ospContacts}{}{\begin{normalsize}\textbf{\ospTitleKeywordContactName} \ospContacts\end{normalsize}\par}
                  \ifdefempty{\ospAffiliations}{}{\begin{normalsize}\textbf{\ospTitleKeywordAffiliationName} \ospAffiliations\end{normalsize}\par}
                  \ifdefempty{\ospKeywords}{}{\begin{normalsize}\textbf{\ospTitleKeywordName} \ospKeywords\end{normalsize}\par}
                  \ospGitInfoLine%
            \end{minipage}
         \end{tabular}\par\vspace{\ospLengtTitleSpaceBelow}
      }
\fi% 

%% Defines the abstract %%
\RequirePackage{abstract}
\renewcommand{\abstractnamefont}{\color{ospColorAbstractHeader}\normalfont\sffamily\large\bfseries}

%Set the Environments for Textsizes etc
\newenvironment{smallpar}{\par\small}{\par}
\newenvironment{centerpar}{\par\center}{\par}
\newenvironment{hugepar}{\par\huge}{\par}

%% definitions for framed environments
\providecommand*{\placement}{}
\providecommand*{\envwidth}{}
\providecommand*{\mappath}{}
\providecommand*{\picturepath}{}
\providecommand*{\overlaytextname}{}
\providecommand*{\envlabel}{}
\providecommand*{\envcaption}{}

\define@key{ospFramedEnvOverlay}{placement}{\renewcommand*\placement{#1}}
\define@key{ospFramedEnvOverlay}{width}{\renewcommand*\envwidth{#1}}
\define@key{ospFramedEnvOverlay}{mappath}{\renewcommand*\mappath{#1}}
\define@key{ospFramedEnvOverlay}{picpath}{\renewcommand*\picturepath{#1}}
\define@key{ospFramedEnvOverlay}{overlaytext}{\renewcommand*\overlaytextname{#1}}
\define@key{ospFramedEnvOverlay}{label}{\renewcommand*\envlabel{#1}}

\presetkeys{ospFramedEnvOverlay}{placement=H, width=0.95\textwidth, label=fig:DefaultLabel}{}%

\providecommand{\ospFramedEnvOverlay}[2][]{
  \setkeys{ospFramedEnvOverlay}{#1}
  \begin{figure}[H]
    \centering
    \begin{tikzpicture}
      \node[pictureframe]{%
        \begin{minipage}{0.47\textwidth}%
          \begin{centerpar}
            \begin{overpic}[keepaspectratio, keepaspectratio, trim=1.2cm 5.2cm 1.2cm 5.2cm, clip, width=\textwidth]{\mappath}
              \ifdefempty{\picturepath}{ 
                \ifdefempty{\overlaytextname}{  
                  \relax
                }{
                  \put(0,0){\begin{tikzpicture}\node[signbackground]{\begin{minipage}{2.5cm}\begin{center} 
                    \emph{\overlaytextname}\end{center}\end{minipage}};\end{tikzpicture}}  
                  }
                }{
                  \put(0,0){\begin{tikzpicture}\node[signbackground]{\begin{minipage}{2.5cm}\begin{center} 
                    \includegraphics[trim=0cm 0cm 0cm 0cm, clip, width=1cm]{\picturepath} \emph{\overlaytextname}\end{center}\end{minipage}};\end{tikzpicture}}  
                  }
                \end{overpic}
              \end{centerpar}
            \end{minipage}
          };
        \end{tikzpicture}
        \captionbelow{#2}
        \label{\envlabel}
      \end{figure}
    }

\WithSuffix\providecommand\ospFramedEnvOverlay*[2][]{
  \setkeys{ospFramedEnvOverlay}{#1}
  \begin{figure*}
    \centering
    \begin{tikzpicture}
      \node[pictureframe]{%
        \begin{minipage}{\textwidth}%
          \begin{centerpar}
            \begin{overpic}[keepaspectratio, keepaspectratio, trim=1.2cm 5.2cm 1.2cm 5.2cm, clip, width=\textwidth]{\mappath}
              \ifdefempty{\picturepath}{ 
                \ifdefempty{\overlaytextname}{  
                  \relax
                }{
                  \put(0,0){\begin{tikzpicture}\node[signbackground]{\begin{minipage}{2.5cm}\begin{center} 
                    \emph{\overlaytextname}\end{center}\end{minipage}};\end{tikzpicture}}  
                 }
                }{
                  \put(0,0){\begin{tikzpicture}\node[signbackground]{\begin{minipage}{2.5cm}\begin{center} 
                    \includegraphics[trim=0cm 0cm 0cm 0cm, clip, width=1cm]{\picturepath} \emph{\overlaytextname}\end{center}\end{minipage}};\end{tikzpicture}}  
                 }
                \end{overpic}
              \end{centerpar}
            \end{minipage}
          };
        \end{tikzpicture}
        \captionbelow{#2}
        \label{\envlabel}
      \end{figure*}
    }

% \ospFramedEnvOverlay*[% 
	% mappath=osp/graphics/MapPelargoniumSidoides.pdf,% 
	% picpath=osp/graphics/Pelargoniumsidoides.png,%
	% overlaytext=Pelargonium sidoides,%
	% label=fig:KaplandPelargonie]{%  
	% Distribution of Pelargonium sidoides. Die maps was created from data
	% available via Global Biodiversity Information Facility database.  The
	% distribution is restricted to regions in Lesotho and South Africa.
	% (Rot).}  

% \ospFramedEnvOverlay[% 
	% mappath=osp/graphics/MapPelargoniumSidoides.pdf,%
	% label=fig:KaplandPelargonie]{%   
	% Distribution of Pelargonium sidoides. Die maps was created from data
	% available via Global Biodiversity Information Facility database.  The
	% distribution is restricted to regions in Lesotho and South Africa.
	% (Rot).}  

\define@key{ospFramedEnv}{placement}{\renewcommand*\placement{#1}}
\define@key{ospFramedEnv}{label}{\renewcommand*\envlabel{#1}}
\define@key{ospFramedEnv}{caption}{\renewcommand*\envcaption{#1}}
\presetkeys{ospFramedEnv}{placement = H, label = nolabel, caption = fillme}{}%

\providecommand\ospFramedEnv[3][]{
\setkeys{ospFramedEnv}{#1}
  \begin{figure}[H]
    \centering
    \begin{tikzpicture}
      \node[pictureframe]{%
        % \begin{minipage}{0.47\textwidth}
        \begin{minipage}{0.97\columnwidth}
          \begin{center} 
            #2
          \end{center}
        \end{minipage}
      };
    \end{tikzpicture}
    \captionbelow{#3}
    \label{\envlabel}
  \end{figure}
} 

% \RequirePackage{environ} 
% \RequirePackage{newenviron} 

% \NewEnviron{ospFramedEn}[1][]{%
% \setkeys{ospFramedEnv}{#1}
  % \begin{figure}[H]
    % \centering
    % \begin{tikzpicture}
      % \node[pictureframe]{%
        % \begin{minipage}{0.97\columnwidth}
          % \begin{center}  
            % \BODY
          % \end{center}
        % \end{minipage}
      % };
    % \end{tikzpicture}
    % \captionbelow{\envcaption}
    % \label{\envlabel}
  % \end{figure}
% }

% \NewEnviron{ospFramedEn*}[1][]{%
% \setkeys{ospFramedEnv}{#1}
  % \begin{figure*}[\placement]
    % \centering
    % \begin{tikzpicture}
      % \node[pictureframe]{%
        % \begin{minipage}{0.98\textwidth} 
          % \centering
            % \BODY
        % \end{minipage}
      % };
    % \end{tikzpicture}
    % \captionbelow{\envcaption}
    % \label{\envlabel}
  % \end{figure*}
% }

% \newenviron{ospFramedEnv*}[1][]{%
% \setkeys{ospFramedEnv}{#1}
  % \begin{figure}[H]
    % \centering
    % \begin{tikzpicture}
      % \node[pictureframe]{%
        % \begin{minipage}{0.97\columnwidth}
          % \begin{center}  
            % \ospFramedEnvNbody
          % \end{center}
        % \end{minipage}
      % };
    % \end{tikzpicture}
    % \captionbelow{\envcaption}
    % \label{\envlabel}
  % \end{figure}
% }

\WithSuffix\providecommand\ospFramedEnv*[3][]{%
\setkeys{ospFramedEnv}{#1}
  \begin{figure*}[\placement]
    \centering
    \begin{tikzpicture}
      \node[pictureframe]{%
        \begin{minipage}{0.98\textwidth}
          \begin{center} 
            #2
          \end{center}
        \end{minipage}
      };
    \end{tikzpicture}
    \captionbelow{#3}
    \label{\envlabel}
  \end{figure*}
} 

% Usage: 

% \ospFramedEnv[label=type:name]{%
  % % Content here
% }{Caption here}

% Example usage:  

% \ospFramedEnv*[label=fig:distmatwo]{   
% <<distmap_two, fig.width=10, fig.height=5, echo=FALSE, message=FALSE>>=   
  % osp_distmap(species=c('Accipiter erythronemius', 'Junco hyemalis', 'Aix sponsa'))
% @  
% }{Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean
  % commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis
  % dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec,
  % pellentesque eu, pretium quis, sem.}

\define@key{ospTableEnv}{placement}{\renewcommand*\placement{#1}}
\define@key{ospTableEnv}{label}{\renewcommand*\envlabel{#1}}
\presetkeys{ospTableEnv}{placement = H, label = nolabel}{}%

\providecommand\ospTableEnv[3][]{
\setkeys{ospTableEnv}{#1}
\begin{table}[H]
% Label tab:test_plot_two 
  \centering
  \label{\envlabel}
  \caption{#3}
  {\small  
    #2
  }
\end{table} 
} 

\WithSuffix\providecommand\ospTableEnv*[3][]{
\setkeys{ospTableEnv}{#1}
\begin{table*}
% Label tab:test_plot_two 
  \centering
  \label{\envlabel}
  \caption{#3}
  {\small  
    #2
  }
\end{table*} 
} 

% \lstnewenvironment{\ospCodeEnv}{\noindent\minipage{\columnwidth}}{\endminipage} 

\lstnewenvironment{ospCodeEnv}[1][]{
  \lstset{#1}
}{
  \relax
} 

% usage: 

% \begin{ospCodeEnv}[options]
  % a + b = c
% \end{ospCodeEnv}

% example usage: 

% \begin{ospCodeEnv}[language = Ruby, label = code:testlabel]
  % a + b = c
% \end{ospCodeEnv}


%%%-------------------------------------------------%%%
%%% Typographical options of the headings %%%
%%%-------------------------------------------------%%%

\RequirePackage[noindentafter,calcwidth]{titlesec}  

\ifosp@sectionnumbers%
   \titleformat{\section}
   {\color{ospColorSectionHeader}\normalfont\sffamily\Large\bfseries}{\thesection}{0.5em}{}
   \titlespacing*{\section}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

   \AtBeginDocument{\renewcommand*{\refname}{\vspace*{-\baselineskip}}}

   \titleformat{\subsection}
   {\color{ospColorSubsectionHeader}\normalfont\sffamily\large\bfseries}{\thesubsection}{0.5em}{}
   \titlespacing*{\subsection}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

   \titleformat{\subsubsection}[runin]
   {\color{ospColorSubsectionHeader}\normalfont\sffamily\normalsize\bfseries}{\thesubsubsection}{0.5em}{}
   \titlespacing*{\subsubsection}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

   \titleformat{\paragraph}[runin]
   {\color{ospColorParagraphHeader}\normalfont\sffamily\normalsize\bfseries}{\theparagraph}{0.5em}{}
   \titlespacing*{\paragraph}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1em}
\else% 
   \titleformat{\section}
   {\color{ospColorSectionHeader}\normalfont\sffamily\Large\bfseries}{}{0em}{}
   \titlespacing*{\section}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

   \AtBeginDocument{\renewcommand*{\refname}{\vspace*{-\baselineskip}}}

   \titleformat{\subsection}
   {\color{ospColorSubsectionHeader}\normalfont\sffamily\large\bfseries}{}{0em}{}
   \titlespacing*{\subsection}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

   \titleformat{\subsubsection}[runin]
   {\color{ospColorSubsectionHeader}\normalfont\sffamily\normalsize\bfseries}{}{0em}{}
   \titlespacing*{\subsection}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}

   \titleformat{\paragraph}[runin]
   {\color{ospColorParagraphHeader}\normalfont\sffamily\normalsize\bfseries}{}{0em}{}
   \titlespacing*{\paragraph}
    {0pt}{3.25ex plus 1ex minus 0.2ex}{1em}
\fi%

% Note: This are the defaults
% \titleformat{\chapter}[display]
% {\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\Huge} 

% \titleformat{\section} 
% {\normalfont\Large\bfseries}{\thesection}{1em}{} 

% \titleformat{\subsection}
% {\normalfont\large\bfseries}{\thesubsection}{1em}{} 

% \titleformat{\subsubsection}
% {\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{} 

% \titleformat{\paragraph}[runin]
% {\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
% \titleformat{\subparagraph}[runin]
% {\normalfont\normalsize\bfseries}{\thesubparagraph}{1em}{}
% \titlespacing*{\chapter} {0pt}{50pt}{40pt}
% \titlespacing*{\section} {0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
% \titlespacing*{\subsection} {0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
% \titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
% \titlespacing*{\paragraph} {0pt}{3.25ex plus 1ex minus .2ex}{1em}
% \titlespacing*{\subparagraph} {\parindent}{3.25ex plus 1ex minus .2ex}{1em}

% try to get a nice appendix section for graphics and tables 
\newenvironment{ospAppendix}{
\titleformat{\section}
  {\FloatBarrier\color{ospColorSectionHeader}\normalfont\sffamily\large\bfseries}{\thesection}{0.5em}{}
\titlespacing*{\section}
  {0pt}{3.25ex plus 1ex minus 0.2ex}{1.5ex plus 0.2ex}   

  \newpage 
  \appendix  
}{\relax}
 
%%%-------------------------------------------------%%%
%%% Typographical fine-tuning %%%
%%%-------------------------------------------------%%%

%% No indent for new paragraph %% 
\ifosp@parindent%
   \setlength{\parindent}{1em} 
\else%
   \setlength{\parindent}{0em} 
\fi% 

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

\ifluatex% 
   \RequirePackage[protrusion=true,%
   expansion=true,%
   babel=true,%
   spacing=false]{microtype}     
\else%
   %% Microtype for fine-tuning of typesetting %%
   \RequirePackage[protrusion=true,%
   expansion=true,%
   babel=true,%
   tracking=true,% 
   spacing=false]{microtype}     

   \DeclareMicrotypeSet*[tracking]{my}% 
          {font = */*/*/sc/*}% 
   \SetTracking{encoding = *, shape = sc}{40}
\fi 

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

%% Set typesetting area with last chosen options %%
\ifosp@autolayout%
   \AtBeginDocument{\KOMAoptions{DIV=last}}
\else% 
   \relax
\fi% 

\ifosp@reversepagelayout%
   \AtBeginDocument{
      \let\tmp\evensidemargin%
      \let\evensidemargin\oddsidemargin%
      \let\oddsidemargin\tmp%
      \reversemarginpar%
   }
\else% 
   \relax
\fi%
