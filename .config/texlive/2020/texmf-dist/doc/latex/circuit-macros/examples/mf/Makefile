# Type "make" or "make testfont.ps"
# To test an individual diagram, type "make DOC=file clean file.ps"

LIBDIR = $$HOME/lib
M4MACROS = mfpic.m4

M4 = m4 -I $(LIBDIR)
M4 = m4

# Use ljfive (which is 600dpi) because 1200dpi produces mf errors on some figs
MODE = ljfive
MF = MFINPUTS=.: mf "\mode:=$(MODE); scrollmode;"
DOC = test
LATEX = TEXFORMATS=.: TEXFONTS=.: latex
TR = tr '\075' '\134'

PIC=dpic
#PIC=/cygdrive/d/Dwight/dpic/build/p2c/ftp/dpic
#PIC=/cygdrive/d/Dwight/dpic/bison/dpic

testfont.ps:

font.dvi: font.m4
	$(M4) $(M4MACROS) font.m4 > font.pic
	$(PIC) -m font.pic > font.tex
	-$(LATEX) font
	cat cct.mf | tr -d '\015' > xxx; mv xxx cct.mf
	-$(MF) "input cct" < /dev/null
	gftopk cct.*gf `ls cct.*gf | sed 's/gf$$/pk/'`
	cp -p cct.*pk cct.pk

testfont.ps: font.dvi
	(echo 'cct'; echo '=table'; echo '=end') | $(TR) | \
      (TEXFORMATS=.: TEXFONTS=.: tex testfont)
	dvips -D600 testfont -o

# For testing individual diagrams:
$(DOC).ps: $(DOC).pk
	$(LATEX) $(DOC)
	TEXPKS=.: dvips -Z -P$(MODE) $(DOC)

$(DOC).pk: $(DOC).tex
	-$(LATEX) $(DOC)
	-$(MF) "input $(DOC)-mfpic" < /dev/null
	gftopk $(DOC)-mfpic.*gf `ls $(DOC)-mfpic.*gf | sed 's/gf$$/pk/'`

$(DOC).tex: $(DOC).m4
	sed -n -e "s/cct/$(DOC)-mfpic/" -e '1,/opengraphs/p' font.m4 > $(DOC).tex
	$(M4) $(M4MACROS) $(DOC).m4 | $(PIC) -m >> $(DOC).tex
	echo '=closegraphsfile=end{document}' | $(TR)  >> $(DOC).tex

clobber: clean
	rm -f *.tfm cct.mf

clean:
	rm -f *.tex *pk *mfpic*
	rm -f *.log *.dvi *.ps *.aux *gf
	rm -f core log xxx *.pic font.tex testfont*
