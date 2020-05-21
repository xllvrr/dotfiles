# Makefile for the fontname document.

# For make install.
prefix = /usr/local
infodir = $(prefix)/info
datadir = $(prefix)/share
texmf = $(datadir)/texmf
fontnamedir = $(texmf)/fontname
psheaderdir = $(texmf)/dvips

INSTALL = install -c
INSTALL_DATA = $(INSTALL) -m 664

MAKEINFO = /usr/local/gnu/bin/makeinfo
MAKEINFO_FLAGS = --no-split
TEXI2DVI = texi2dvi
TEXI2PDF = texi2dvi --pdf
TEXI2HTML = $(MAKEINFO) --html
#TEXI2HTML = texi2html
#TEXI2HTML_FLAGS = -split_chapter -menu

SHELL = /bin/sh

doc = fontname

default doc all: $(doc).info $(doc)/index.html $(doc).html $(doc).dvi $(doc).pdf

dvi $(doc).dvi: $(doc).texi *.map *.enc
	$(TEXI2DVI) $(doc).texi

info $(doc).info: $(doc).texi *.map *.enc
	$(MAKEINFO) $(MAKEINFO_FLAGS) $<

$(doc).html: $(doc).texi *.map *.enc
	$(TEXI2HTML) --no-split $(doc).texi 

$(doc)/index.html: $(doc).texi *.map *.enc
	$(TEXI2HTML) -o html $(doc).texi 

pdf $(doc).pdf: $(doc).texi *.map *.enc
	$(TEXI2PDF) $(doc).texi 
	for f in $(doc).??; do test -s $$f || rm $$f; done; rm -f $(doc).log

install: info
	$(SHELL) mkdirchain $(fontnamedir) $(psheaderdir) $(infodir)
	for m in *.map; do $(INSTALL_DATA) $$m $(fontnamedir)/$$m; done
	for e in *.enc; do $(INSTALL_DATA) $$e $(psheaderdir)/$$e; done
	for i in $(doc).info*; do $(INSTALL_DATA) $$i $(infodir)/$$i; done

# Prevent GNU make 3 from overflowing arg limit on system V.
.NOEXPORT:

distdir = $(fontname)/fontname
toplevel = $(addprefix ../, \
             ChangeLog Makefile NEWS README *.enc *.texi *.map *.aka)

dist: $(doc).info check distclean
	-grep '	' *.map # check for tabs
	rm -rf $(distdir)
	mkdir -p $(distdir)
	cd $(distdir) && ln -s $(toplevel) .
	cd $(distdir) && ln -s $(txinfo)/doc/texinfo.tex $(HOME)/bin/mkdirchain .
# Have to add version number and date before making the Info file.
	(cd $(distdir) && \
         add-version $(version) $(doc).texi; \
         add-date $(doc).texi; \
         fix-checksum $(doc).texi; \
 	 $(MAKE) doc distclean; \
	 ln -s fontname_toc.html index.html; \
	 mv $(doc).texi $(doc)-$(version).texi; \
	 ln -s $(doc)-$(version).texi $(doc).texi)
	cd $(distdir)/..; basedir=$(notdir $(distdir)); \
	  GZIP=-9 tar chzf $$basedir.tar.gz $$basedir
#	rm -rf $(distdir)

mostlyclean clean:
	rm -f $(doc).?? *.log #*.dvi

distclean: clean
	for f in $(doc).??s; do test -s $$f || rm -f $$f; done

extraclean: distclean
	rm -f *~ \#* patch* *.orig *.rej *.bak *.ckp core a.out

maintainer-clean realclean: distclean
	rm -f *.info* $(doc).???

old-check:
	rm -rf testhier
	mkdir testhier
	for s in `sed '/^%/d' supplier.map | awk '{print $$2}'`; do \
	  mkdir testhier/$$s; done
	for t in `sed '/^%/d' typeface.map | awk '{print $$2}'`; do \
	  mkdir testhier/unknown/$$t; done
	find testhier | doschk
	rm -rf testhier

check:
	grep -vh "^@" `ls -1 *.map | egrep -v '(softkey.*|texfonts).map'` | sort | uniq -dw 9
	-grep '	' *.map *.texi *.enc
