#!/bin/bash

MASTER='plipsum'

# commands to compile the `plipsum' package.
#
# 1 - the tex format
notangle -R$MASTER.tex $MASTER.nw | ./stripc > $MASTER.tex
#
# 2 - the example file.
notangle -Rpliptest.tex $MASTER.nw | ./stripc > pliptest.tex
#
# 3 - the printable documentation.
noweave -index -filter "elide paragraphs" $MASTER.nw > $MASTER-doc.tex
pdflatex $MASTER-doc.tex
pdflatex $MASTER-doc.tex
pdflatex $MASTER-doc.tex

# elimina i files non piu' necessari
rm -v $MASTER-doc.aux
rm -v $MASTER-doc.log
rm -v $MASTER-doc.tex
rm -v $MASTER-doc.toc


# istruzioni per la installazione e saluti.
echo " *************************************************************"
echo "   To finish the installation you have to move the following"
echo "   files into a directory searched by TeX:"
echo ""
echo "       plipsum.tex"
echo ""
echo "   A good place to put it is:"
echo ""
echo "       ~/texmf/tex/plain/plipsum"
echo ""
echo ""
echo "   There exists two separate files"
echo ""
echo "     plipsum-doc.pdf"
echo "     pliptest.tex"
echo ""
echo "   containing the user documentation. A good place to put"
echo "   them is ~/texmf/doc/plain/plipsum."
echo ""
echo ""
echo "   The source files"
echo ""
echo "     plipsum.nw"
echo "     compile.sh"
echo ""
echo "   can be put into ~/texmf/source/plain/plipsum"
echo ""
echo ""
echo "   ======================================================"
echo "   Don't forget to run the command '$ texhash ~/texmf' !"
echo "   ======================================================"
echo ""
echo ""
echo "   Happy TeXing!"
echo " *************************************************************"

# fine

