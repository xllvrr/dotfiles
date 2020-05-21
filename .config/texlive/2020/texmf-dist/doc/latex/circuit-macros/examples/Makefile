# Examples Makefile
#
# Type "make" to generate examples.pdf containing many examples.
# Type "make clean; make examples.ps" to invoke latex intead of pdflatex.
# Type "make <diag>.ps" to make a postscript file from <diag>.m4
#  It may be necessary to type "make clean" before this or any of the following:
# Type "make <diag>.eps" to make an .eps file from <diag>.m4
#   The following require ImageMagick convert:
# Type "make <diag>.png" to make a .png file from <diag>.m4
# Type "make <diag>.tif" to make a .tif file from <diag>.m4
# Type "make <diag>.svg" to make a .svg file from <diag>.m4
#       See also: the svg subdirectory for generating svg directly.
#
# To test the file test.m4, type "make tst" if boxdims is used, otherwise
# type "make tst1".  In either case the file tst.ps is created.
#
# To debug a single diagram in a directory other than this examples
# directory, copy this makefile and tst.tex to where you want to work,
# redefine LIBDIR (below) appropriately, and type "make <diag>.xxx"
# where xxx is one of ps, eps, png, or pdf

#########################################################################

# Circuit_macro directory, change this if necessary:
# LIBDIR = $$HOME/lib
LIBDIR = ..

# The dpic processor:
PIC = dpic -p
#PIC = $$HOME/dpic/build/p2c/ftp/dpic -p
#PIC = $$HOME/dpic/dev/p2c/ftp/dpic -p
#PIC = $$HOME/dpic/bison/dpic -p
#PIC = $$HOME/dpic/bdev/dpic -p

CONFIGFILE = pstricks.m4

# Testing the mingw version of dpic:
#PIC = $$HOME/dpic/bison/distsrc/Windows/dpic -p
#CUSTOM=windows.m4

# Uncomment for gpic.  Use gpic or pic as applicable on your machine:
# PIC = gpic -t
# PIC = pic -t
# CONFIGFILE = gpic.m4

# Convert options
EPSOPTS =
PNGOPTS = -quiet -density 400 -scale 25% -alpha Remove

# M4 = m4 -B32000
# M4 = m4 -I $(LIBDIR)
# If environment variable M4PATH has been set to the installation directory:
M4 = m4

#########################################################################

DOC = examples
PICS = \
  ABlogix.tex Adder.tex Alogix.tex AmpTable.tex Antennas.tex \
  AntiqueClock.tex Audio.tex Bip.tex Btree.tex Buttons.tex Byte.tex \
  CanLogic.tex CctTable.tex Conn.tex Connectors.tex \
  Contacts.tex Contact.tex control.tex Counting.tex Crossbar.tex Crow.tex \
  csc.tex Csource.tex Decoder.tex \
  Demultiplexer.tex diamond.tex Dini.tex Diodes.tex Drive.tex Emarrows.tex \
  ex00.tex ex01.tex ex02.tex ex03.tex ex04.tex ex05.tex ex06.tex ex08.tex \
  ex09.tex ex10.tex ex11.tex ex12.tex ex15.tex ex16.tex ex17.tex ex18.tex \
  ex21.tex exp.tex fet.tex Flow.tex Fuses.tex GrayCode.tex graysurf.tex \
  Grounds.tex Headers.tex Heathkit.tex I2L.tex Incleps.tex Jack.tex \
  lcct.tex Logic.tex Loglog.tex MC.tex Mixer.tex MotorControl.tex \
  Multiplexer.tex NLG.tex NPDT.tex Nport.tex Opamp.tex Optoiso.tex \
  Pconn.tex PushPull.tex pwrsupply.tex Quantum.tex quick.tex random.tex \
  Rectifiers.tex recycle.tex relaycoil.tex Relay.tex rose.tex Rotbox.tex \
  Schottky.tex sfg.tex shapes.tex ShiftR.tex Sierpinski.tex Sixpole.tex \
  Sources.tex SQUID.tex Switches.tex \
  Tgate.tex Three.tex thyristor.tex Timer.tex \
  TTLnand.tex Ttree.tex Tubediags.tex ujt.tex Variable.tex Windings.tex \
  worm.tex Xform.tex XOR.tex

# Files that have to be processed twice:
BOXDIMS = ex09.tex Crow.tex Incleps.tex Loglog.tex Opamp.tex random.tex \
 Ttree.tex Windings.tex
BOXPICS = ex09.pic Crow.pic Incleps.pic Loglog.pic Opamp.pic random.pic \
 Ttree.pic Windings.pic

DVIPSOPTS = -Ppdf -G0 -t letter
DVIPSOPTS = -G0 -t letter
M4LIBS = $(CONFIGFILE) $(CUSTOM)
DIMFILE = $(DOC).dim
BS = tr '|' '\134'

# Might be needed (change latex commands to $(LTX) )
# LTX = latex --shell-escape

.SUFFIXES: .ps .dvi .tex .m4 .pic .eps .png .pdf .svg .tif .gif
.dvi.ps:
	dvips $(DVIPSOPTS) $* -o $*.ps
	chmod 644 $*.ps
.m4.tex:
	@if test -n "$(DIMFILE)" ; then touch $(DIMFILE) ; fi ; touch F_$*.dim
	$(M4) $(M4LIBS) $(DIMFILE) F_$*.dim $*.m4 | sed -e '/^ *$$/d' \
      | $(PIC) > $*.tex
#	$(M4) $(M4LIBS) $(DIMFILE) F_$*.dim $*.m4 | sed -e '/^ *$$/d' > $*.pic
#	$(PIC) $*.pic > $*.tex
#	grep Production dpic.log >> newp.txt
.m4.pic:
	@if test -n "$(DIMFILE)" ; then touch $(DIMFILE) ; fi
	$(M4) $(M4LIBS) $(DIMFILE) $*.m4 > $*.pic
.m4.dvi:
	make $*.tex
	printf "|documentclass[11pt]{article}\n\
|usepackage{times,pstricks,boxdims,graphicx,pst-grad,pst-slpe}\n\
|usepackage{siunitx}\n\
|setlength{|textwidth}{28cm}|setlength{|textheight}{28cm}\n\
|setlength{|oddsidemargin}{0pt}|setlength{|evensidemargin}{0pt}\n\
|setlength{|hoffset}{-1cm}\n\
|pagestyle{empty}|thispagestyle{empty}\n\
|newbox|graph\n\
|begin{document}\n\
|noindent|input{"$*".tex}\n\
|end{document}\n" | $(BS) > F_$*.tex
	latex F_$*
	touch F_$*.dim $(DIMFILE) ; rm -f $*.tex $*.pic ; make $*.tex 
	latex F_$*
	touch F_$*.dim $(DIMFILE) ; rm -f $*.tex $*.pic ; make $*.tex 
	latex F_$*
.m4.eps:
	make $*.dvi
	dvips F_$* -T128cm,28cm -o $*.ps
#	dvips -Ppdf F_$* -T128cm,28cm -o $*.ps
# Recent changes to PSTricks(?) have clashed with the use of TeXtoEPS
#  so use ps2epsi
	ps2epsi $*.ps $*.epsi
	sed -e '/%%Pages:/d' -e '/BeginPreview/,$$d' $*.epsi \
     | tr '\015' '\012' > $*.eps
	sed -e '1,/EndPreview/d' $*.epsi >> $*.eps
.m4.ps:
	make $*.tex && mv $*.tex test.tex; latex tst
	rm -f test.tex $*.pic
	if test -f tst.dim ; then cp tst.dim F_$*.dim ; fi
	make $*.tex && mv $*.tex test.tex; latex tst
	dvips $(DVIPSOPTS) tst -o $*.ps
	chmod 644 $*.ps
.m4.svg:
	make $*.eps
	convert $(EPSOPTS) $*.eps $*.svg
.m4.png:
	make $*.eps
	convert $(PNGOPTS) $*.eps $*.png
	@if test -f $*.png.0 ; then mv $*.png.0 $*.png ; fi
.m4.gif:
	make $*.ps
	convert $(GIFOPTS) $*.ps $*.gif
#	@if test -f $*.png.0 ; then mv $*.png.0 $*.png ; fi
.m4.tif:
	make $*.eps
	convert $(EPSOPTS) $*.eps $*.tif
	@if test -f $*.tif.0 ; then mv $*.tif.0 $*.tif ; fi
.m4.pdf:
	touch F_$*.dim
	$(M4) pgf.m4 F_$*.dim $*.m4 > $*.pic
	$(PIC) -g $*.pic > test.tex
	sed -e '/^\\usepackage.*graphicx/s/^.*$$/\\usepackage{tikz}/' \
     -e '/pstricks/d' tst.tex > F_$*.tex
	pdflatex F_$*
	$(M4) pgf.m4 F_$*.dim $*.m4 > $*.pic
	$(PIC) -g $*.pic > test.tex
	pdflatex F_$*
	mv F_$*.pdf $*.pdf

#########################################################################

$(DOC).pdf: clean pdfmode $(DOC).frp
	touch $(DOC).dim
	rm -f $(BOXDIMS) $(BOXPICS)
	make PIC="$(PIC) -g" CONFIGFILE=pgf.m4 DIMFILE=$(DOC).dim pics
	pdflatex $(DOC)
	rm -f $(BOXDIMS) $(BOXPICS)
	make PIC="$(PIC) -g" CONFIGFILE=pgf.m4 DIMFILE=$(DOC).dim pics
	pdflatex $(DOC)
	optpdf $(DOC).pdf

pics: $(PICS)
	touch pics

$(DOC).ps: psmode $(DOC).dvi

psmode:
	printf "|usepackage{pstricks,pst-grad}\n" | $(BS) > mode.tex

pdfmode:
	printf "|usepackage{tikz}\n" | $(BS) > mode.tex

$(DOC).dvi: $(DOC).frs
	touch $(DOC).dim
	for file in $(BOXDIMS) ; do rm -f $$file.tex $$file.pic ; done
	make PIC="$(PIC)" CONFIGFILE=pstricks.m4 DIMFILE=$(DOC).dim pics
	latex $(DOC)
	for file in $(BOXDIMS) ; do rm -f $$file.tex $$file.pic ; done
	make PIC="$(PIC)" CONFIGFILE=pstricks.m4 DIMFILE=$(DOC).dim pics
	latex $(DOC)

$(DOC).frs: $(DOC).tex files.tex header.tex psmode
	make PIC="$(PIC) -p" CONFIGFILE=pstricks.m4 DIMFILE=$(DOC).dim pics
	cp $(LIBDIR)/doc/Version.tex .
	latex $(DOC)
	rm -f $(DOC).dvi
	touch $(DOC).frs

$(DOC).frp: $(DOC).tex files.tex header.tex pdfmode
	make PIC="$(PIC) -g" CONFIGFILE=pgf.m4 DIMFILE=$(DOC).dim pics
	cp $(LIBDIR)/doc/Version.tex .
	pdflatex $(DOC)
	rm -f $(DOC).pdf
	touch $(DOC).frp

tst:
	make test.tex; latex tst; rm -f test.tex test.pic
	make DIMFILE=tst.dim test.tex; latex tst
	dvips $(DVIPSOPTS) tst -o tst.ps

tst1: test.tex tst.tex
	latex tst
	dvips $(DVIPSOPTS) tst -o tst.ps

gtst:
	touch test.m4; make PIC="gpic -t" CONFIGFILE="" tst

gtst1:
	touch test.m4; make PIC="gpic -t" CONFIGFILE="" tst1

echopics:
	@echo $(PICS)

clobber:	clean
	rm -f *.ps
	-@for dir in mf mpost pdflatex xfig psfrag svg dev test; \
      do (if test -d $$dir ; then cd $$dir; make clobber; fi) ; done
	rm -f *.warn
	rm -f examples.pdf
	rm -rf index.html html basenames *.png* dist zips htmlfiles svgfiles
	rm -rf $(TMP)/Cir* $(ECETMP)/Cir* $(ECEDIR)
	if test -f Incl.pdf ; then \
      mv Incl.pdf Incl.pdx; rm -f *.pdf; mv Incl.pdx Incl.pdf ; fi
	for file in `ls *.tex` ; do \
      nm=`echo $$file | sed -e "s/\(.*\)\.tex/\1/"` ; \
      if test -s $$nm.m4 ; then rm -f $$nm.pic $$nm.tex ; fi ; done
	@if test -f distmakefile ; then make -f distmakefile clobber ; fi

clean:
	@printf "\n examples clean:\n"
	rm -f core boxdims.tar.gz pics
	rm -f *.dvi *.aux *.log *.toc *.blg *.eps *.tif *.epsi eps *-mfpic*
	rm -f fig*.tex $(PICS) *.roff *.int *.pic gpic.m4 test.tex xxx* *.fig
	rm -f *.dim *.bak *.frs *.frp $(RPICS) rotate.ps tst.ps *.bbl *-pics.ps
	rm -f *.tfm *[0-9]pk *.png *.1 *.gif
	rm -f F_* Version.tex *stackdump *.ico
	rm -rf distfile distfile.tar.gz mode.tex
	@printf "\n"
	@if test -f distmakefile ; then make -f distmakefile clean ; fi
