# Open-Science-Paper

This repository contains a LaTeX document which can be forked to use in
collaborative scientific paper writing with github. The layout is close to
common paper formats which helps to prepare figures and tables for publication.
The document combines the LaTeX typesetting capabilities with the power of R for
statistic programming by using the Knitr package (http://yihui.name/knitr/).
This combination has the advantage to enable a better reproducibility of your
research offering executable documents to others. Open-Science-Paper comes with
some examples for typical things to typeset like tables and plots spanning
one or two of the columns of the paper and a makefile helps you compiling the
document to get a PDF file.

## Prerequisites

To get started with this document a working installation of LaTeX and R is
required. Depending on your LaTeX distribution and the type of installation
(full/subset), packages required for the document might have to be installed
additionally. You can have a look into the class file to see which packages are
required for the document, or have a look into the wiki where the class file is
documented with examples. Rather than installing the packages manually I would
recommend you to use a LaTeX distribution with a package manager (e.g MiKTeX,
TeX Live). For example MiKTeX can install packages automatically if they are
required from a document.

In R you have to install the Knitr package which is documented here:
https://github.com/yihui/knitr. To use the knit command directly from the
console you have to ensure the directory you installed the Knitr package
to is contained in your systems path. For Unix like systems you could add
some code to your ~.bashrc or the configuration file of the console you
use in your home directory (see code below). For other systems you may
find helpful informations about adding a direcoty to the system path under
http://www.java.com/en/download/help/path.xml.

```
PATH=$PATH:/path/to/your/R_libs/knitr/bin 
```

If you don't like to add a directory to your path variable, you could also
change the makefile to use a command like the following to knit the .Rnw
document.

```
Rscript -e "library(knitr); knit('open_science_paper.Rnw')"
```

To use the makefile you need to install GNU make
(http://www.gnu.org/software/make/) if not already available on your system. If
you use an Ubuntu or other Linux distribution it should be installed already
by default. If it is not available you can use your systems package manager to
intall it for example on Debian based systems with.

```
sudo apt-get install make 
```

On Windows you can install GNU make by installing the minimalitic GNU for
windows (http://www.mingw.org/). The commands provided by the makefile are
documented in the github wiki of this repository.

## Use the repository

The usage of this document with GitHub for collaborative writing is easy and
requires only some small steps. Get a GitHub account and turn it into an
organization account under your account settings. You can now fork the document
to get your own copy of the Open-Science-Paper. After that you can checkout your
copy to a local repository and start writing and invite other researchers for
collaboration.

## Self promotion

Do you like the Open-Science-Paper repository? You are welcome to follow me on
github and twitter (http://twitter.com/sabsirro).
