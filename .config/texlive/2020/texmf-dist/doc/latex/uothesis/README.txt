----------------------------------------------------------------
uothesis --- Support for University of Oregon Graduate School requirements
for the formatting of doctoral dissertations and and masters theses
E-mail: mander13@uoregon.edu
Released under the LaTeX Project Public License v1.3c or later
See http://www.latex-project.org/lppl.txt
----------------------------------------------------------------

The uothesis bundle provides a LaTeX class file and documentation for the class
file.  The class file generates documents that are suitable for submission to the
Graduate School and conform with the style requirements for dissertations and theses
as laid out in the Fall 2010 UO graduate school student manual.

The basic format for this dtx and the associcated files are shamelessly mooched from
the achemso package dtx and ins files.  My thanks to their authors for the excellent
examples.

Installation
------------

The package is supplied in dtx format.  To
unpack the dtx, running 'tex uothesis.dtx' will extract
the package whereas 'latex uothesis.dtx will extract it and also
typeset the documentation.

Typesetting the documentation requires a number of packages in
addition to those needed to use the package. This is mainly
because of the number of demonstration items included in the
text. To compile the documentation without error, you will
need the packages:
 - array
 - booktabs
 - hypdoc
 - listings
 - lmodern
 - mathpazo
 - microtype
