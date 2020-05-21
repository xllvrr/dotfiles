NAME  = schemata
ENGINE = pdflatex
SHELL = bash
PWD   = $(shell pwd)
VERS  = $(shell ltxfileinfo -v $(NAME).dtx|sed -e 's/^v//')
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
UTREE = $(shell kpsewhich --var-value TEXMFHOME)
release:    $(NAME).pdf
testing:    $(NAME).pdf schematest.pdf
schematest.pdf    : schematest.tex
	pdftex schematest >/dev/null
$(NAME).pdf : $(NAME).dtx
	$(ENGINE) -shell-escape -recorder -interaction=batchmode $(NAME).dtx >/dev/null
	$(ENGINE) --recorder --interaction=nonstopmode $(NAME).dtx > /dev/null
	if [ -f $(NAME).glo ]; then makeindex -q -s gglo.ist -o $(NAME).gls $(NAME).glo; fi
	if [ -f $(NAME).idx ]; then makeindex -q -s gind.ist -o $(NAME).ind $(NAME).idx; fi
	$(ENGINE) --recorder --interaction=nonstopmode $(NAME).dtx > /dev/null
	$(ENGINE) --recorder --interaction=nonstopmode $(NAME).dtx > /dev/null
	test -e README.txt && mv README.txt README || exit 0
clean:
	rm -f $(NAME).{aux,fls,glo,gls,hd,idx,ilg,ind,ins,log,out,toc} README.txt
	rm -f schematest.{aux,fls,glo,gls,hd,idx,ilg,ind,ins,log,out,toc}
distclean: clean
	rm -f $(NAME).{dvi,pdf,sty,synctex.gz} README
	rm -f schematest.{dvi,pdf,sty,synctex.gz}
inst: release
	mkdir -p $(UTREE)/{tex,source,doc}/generic/$(NAME)
	cp $(NAME).dtx $(UTREE)/source/generic/$(NAME)
	cp $(NAME).png $(UTREE)/source/generic/$(NAME)
	cp Makefile $(UTREE)/source/generic/$(NAME)
	cp $(NAME).sty $(UTREE)/tex/generic/$(NAME)
	cp $(NAME).pdf $(UTREE)/doc/generic/$(NAME)
	cp schematest.tex $(UTREE)/doc/generic/$(NAME)
	cp README $(UTREE)/doc/generic/$(NAME)
install: release
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	sudo cp $(NAME).dtx $(LOCAL)/source/generic/$(NAME)
	sudo cp $(NAME).png $(LOCAL)/source/generic/$(NAME)
	sudo cp Makefile $(LOCAL)/source/generic/$(NAME)
	sudo cp $(NAME).sty $(LOCAL)/tex/generic/$(NAME)
	sudo cp $(NAME).pdf $(LOCAL)/doc/generic/$(NAME)
	sudo cp schematest.tex $(LOCAL)/doc/generic/$(NAME)
	sudo cp README $(LOCAL)/doc/generic/$(NAME)
zip: release
	ln -sf . $(NAME)
	zip -Drq $(PWD)/$(NAME)-$(VERS).zip\
      $(NAME)/{README,schematest.tex,Makefile,$(NAME).{pdf,dtx,png}}
	rm $(NAME)

