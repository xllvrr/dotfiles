
--------:| ----------------------------------------------------------------
schemata:| Generic package to aid construction of topical categories
  Author:| Charles P. Schaum
  E-mail:| charles dot schaum@comcast.net
 License:| Released under the LaTeX Project Public License v1.3c or later
     See:| http://www.latex-project.org/lppl.txt

Short description:
The schemata package helps the creation of topical outlines that illustrate the breakdown of concepts and categories in academic texts from the late medieval to early modern periods.

Files     Distribution

README        This file
schemata.pdf  Documentation
schematest.tex  Test file for Plain TeX or Eplain
schemata.png  Image file used for the manual

Makefile      Automates building with GNU make 3.81
schemata.dtx  Documented LaTeX file containing both code and documentation

Installation

Download the package from

https://www.ctan.org/tex-archive/macros/generic/schemata

Unpack schemata.zip in an appropriate directory.

If you have a make utility compatible with GNU make, either in
GNU/Linux, a BSD variant, OSX, or Cygwin in Windows you can type

make inst

to install the package into your $TEXMFHOME tree or

make install

to install the package into your $TEXMFLOCAL tree for all users.
The latter requires sudo privileges.

Other useful targets include:

(release process)

make release The default target, same as just ``make''.

make clean Removes all intermediate files. Left are
the files listed above plus schemata.sty.

make distclean Leave only schemata.dtx, schematest.tex,
schemata.png, and Makefile.

make zip Generate a zip file ready for distribution.

(testing process)

make testing Release files, plus compiles schematest.tex.

It is not necessary, however, to use GNU make. One can generate
the package files manually. Since the files schemata.ins and README.txt
are contained in the .dtx file itself, the first step is to generate
the installer driver schemata.ins, plus the file README.txt, which will
also trigger the extraction of schemata.sty and produce the first pass of
the package documentation schemata.pdf:

pdflatex -shell-escape -recorder -interaction=batchmode schemata.dtx

Next one adds a table of contents and all cross-references, this also
should finalize page numbers for glossary and index input files:

pdflatex --recorder --interaction=nonstopmode schemata.dtx

The next commands generate the glossary/index output files:

makeindex -q -s gglo.ist -o schemata.gls schemata.glo
makeindex -q -s gind.ist -o schemata.ind schemata.idx

The final two commands integrate the glossary (changes) and index:

pdflatex --recorder --interaction=nonstopmode schemata.dtx
pdflatex --recorder --interaction=nonstopmode schemata.dtx

Now one can either keep README.txt or rename it to README, e.g.:

mv README.txt README

Normally one creates the following directories for a user:

$TEXMFHOME/source/generic/schemata dtx file, schemata.png
$TEXMFHOME/doc/generic/schemata pdf file, README, schematest.tex,

and creates the following directories for the local site:

$TEXMFLOCAL/source/generic/schemata dtx file, schemata.png
$TEXMFLOCAL/doc/generic/schemata pdf file, README, schematest.tex,

The above environment variables often are /usr/local/texlive/texmf-local for
$TEXMFLOCAL and ~/texmf for $TEXMFHOME.

The make process normally renames the README.txt file created from the
dtx file to just README by using mv (move / rename utility in the *nix
userland). Windows distributions of TeX and LaTeX often keep the txt file
because of using file extensions instead of ``magic numbers'' to identify
files.

Run mktexlsr with the appropriate level of permissions to complete the
install.

This packages works with LaTeX and Plain TeX.

License

This material is subject to the LaTeX Project Public License:
http://www.ctan.org/tex-archive/help/Catalogue/licenses.lppl.html

Happy TeXing!
