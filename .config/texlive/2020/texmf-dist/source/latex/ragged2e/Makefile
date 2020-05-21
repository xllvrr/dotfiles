doc: ragged2e.pdf ragged2e.dvi
ragged2e.dvi: ragged2e.pdf
	latex ragged2e.drv

ragged2e.pdf:	ragged2e.dtx ragged2e.drv ragged2e.sty
	pdflatex -draftmode ragged2e.drv
	pdflatex -draftmode ragged2e.drv
	makeindex -s gind.ist -t ragged2e.ind.ilg ragged2e ragged2e.idx
	makeindex -s gglo.ist -t ragged2e.gls.ilg -o ragged2e.gls ragged2e ragged2e.glo
	pdflatex ragged2e.drv

ragged2e.drv ragged2e.sty:	ragged2e.dtx ragged2e.ins
	latex ragged2e.ins

ragged2e.zip:	ragged2e.dtx ragged2e.pdf ragged2e.ins
	$(eval RELEASEDIR := $(shell mktemp -d))
	@cp -a ragged2e.dtx ragged2e.pdf ragged2e.ins $(RELEASEDIR)
	@cp .git/gitHeadInfo.gin $(RELEASEDIR)/gitHeadLocal.gin
	@sed -i 's/usepackage{gitinfo2}/usepackage[release]{gitinfo2}/g' $(RELEASEDIR)/ragged2e.dtx
	@zip --junk-paths ragged2e.zip $(RELEASEDIR)/ragged2e.dtx $(RELEASEDIR)/ragged2e.pdf $(RELEASEDIR)/ragged2e.ins $(RELEASEDIR)/gitHeadLocal.gin
	@rm -rf $(RELEASEDIR)

.PHONY:	clean clobber

clean: 
	rm -f *.aux *.toc *.glo *.gls *.hd *.idx *.ilg *.ind *.log

clobber:	clean
	rm -f *.dvi *.pdf *.sty *.drv *.zip

# vim:noexpandtab
