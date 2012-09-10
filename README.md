# Open-Science-Paper

This repository contains a LaTeX document with a two column layout which
can be used for collaborative paper writing. The layout is close to
common paper formats which helps to prepare the figures and tables for
publication. The document combines the LaTeX typesetting capabilities with
the power of the statistic programming language R using the Knitr package
(http://yihui.name/knitr/). This combination has the advantage to enable better
reproducibility of your research offering executable documents to others.

## Prerequisites

To get started with this document a working installation of LaTeX and R is
required. Depending on your LaTeX distribution and the type of installation
(full/subset), packages required for the document might have to be installed
additionally. Some LaTeX distributions (e.g MiKTeX, TeX Live) offer package
managers which help you with this task (MiKTeX can install packages
automatically if they are required from a document).

In R you have to install the Knitr package which is documented here:
https://github.com/yihui/knitr. To use the knit command directly from the
console as it is defined in the documents makefile you have to ensure
that the directory of knitr is in you systems path. For Unix like systems
you could add some code to your ~.bashrc or the configuration of the
shell you are using. For other systems you may find helpful informations
about path changes here http://www.java.com/en/download/help/path.xml.

```
PATH=$PATH:/path/to/your/R_libs/knitr/bin 
```

Or if you dont like to add a path, you could also redefine the makefile to use a
command like the following to knit the .Rnw document.

```
Rscript -e "library(knitr); knit('open_science_paper.Rnw')"
```

## Usage

The usage of this document with github for collaborative writing is easy and
requires only some small steps. Get a GitHub account and turn it into an
organization account under your account settings. You can now fork the document
to get your own copy of the Open-Science-Paper. After that you can checkout your
copy to a local repository and start writing and invite other researchers for
collaboration.
