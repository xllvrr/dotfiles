base=randomlist
default: package doc doc-fr test test-fr # package ou class
final: package doc-final doc-fr-final test test-fr

package: $(base).sty
$(base).sty: $(base).ins $(base).dtx
	tex '\nonstopmode \input $(base).ins'

class: $(base).cls
$(base).cls: $(base).ins $(base).dtx
	tex '\nonstopmode \input $(base).ins'

doc:
	latex '\nonstopmode \input $(base).dtx'
	dvips $(base)
	ps2pdf $(base).ps $(base).pdf
	rm $(base).dvi $(base).ps

doc-final:
	latex '\nonstopmode \input $(base).dtx'
	latex '\nonstopmode \input $(base).dtx'
	makeindex -s gind.ist -o $(base).ind $(base).idx
	makeindex -s gglo.ist -o $(base).gls $(base).glo
	latex '\nonstopmode \input $(base).dtx'
	dvips $(base)
	ps2pdf $(base).ps $(base).pdf
	rm $(base).dvi $(base).ps

doc-fr: $(base)-doc-fr.pdf
$(base)-doc-fr.pdf: $(base)-doc-fr.tex
	latex '\nonstopmode \input $(base)-doc-fr'
	dvips $(base)-doc-fr
	ps2pdf $(base)-doc-fr.ps $(base)-doc-fr.pdf
	rm $(base)-doc-fr.dvi $(base)-doc-fr.ps

doc-fr-final:
	latex '\nonstopmode \input $(base)-doc-fr'
	latex '\nonstopmode \input $(base)-doc-fr'
	makeindex -s gind.ist -o $(base)-doc-fr.ind $(base)-doc-fr.idx
	latex '\nonstopmode \input $(base)-doc-fr'
	dvips $(base)-doc-fr
	ps2pdf $(base)-doc-fr.ps $(base)-doc-fr.pdf
	rm $(base)-doc-fr.dvi $(base)-doc-fr.ps

test: randomlist.tex test.tex testtex.tex
	pdflatex '\nonstopmode \input test.tex'
	etex '\nonstopmode \input testtex.tex'
	pdftex '\nonstopmode \input testtex.tex'

test-fr: randomlist.tex test-fr.tex
	pdflatex '\nonstopmode \input test-fr.tex'

clean:
	rm -rf *~ *.aux *.dvi *.ps *.glo *.gls *.idx *.ilg *.ind *.log *.out *.tmp *.toc

zip:
	cd .. ; zip $(base).zip randomlist/$(base).dtx randomlist/$(base).ins randomlist/$(base).pdf randomlist/$(base).tex randomlist/$(base).sty randomlist/README.txt randomlist/Makefile randomlist/comets.dat randomlist/pupils.dat randomlist/pythagoras.dat randomlist/test.tex randomlist/test.pdf randomlist/test-fr.tex randomlist/test-fr.pdf randomlist/testtex.tex randomlist/testtex.pdf; mv $(base).zip randomlist/
