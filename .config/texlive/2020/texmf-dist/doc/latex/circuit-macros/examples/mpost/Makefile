# Makefile for the mpost subdirectory
# To test a new file, copy it into test.m4 and type "make tst" or "make tst1"

M4 = m4 mpost.m4
# If the M4PATH environment variable has not been set to include the
# installation directory then change $$HOME/lib to point to the directory,
# and uncomment the following:

# M4 = m4 -I $$HOME/lib mpost.m4

#---------------------------------------------

MKDIM=pwd | sed -e 's%^%=boxdimfile{%' -e 's%/cygdrive/\(.\)/%\1:/%' \
       -e 's%$$%/$(DIMFILE)}%'

# Comment out the following line to produce absolute addresses for .dim files.
MKDIM=printf '=boxdimfile{$(DIMFILE)}\n'

#---------------------------------------------

DOC = examplesmpost
FIGS = Adder.1 Alogix.1 ABlogix.1 Antennas.1 AmpTable.1 Audio.1 \
  AntiqueClock.1 \
  Bip.1 Btree.1 Byte.1 Buttons.1 \
  Connectors.1 Contact.1 Contacts.1 \
  Counting.1 Crossbar.1 Crow.1 Csource.1 CanLogic.1 CctTable.1 Conn.1 \
  Decoder.1 Demultiplexer.1 Dini.1 Diodes.1 Drive.1 \
  Emarrows.1 Flow.1 Fuses.1 \
  GrayCode.1 Grounds.1 Headers.1 Heathkit.1 I2L.1 Inclpdf.1 Jack.1 \
  Logic.1 Loglog.1 MC.1 Mixer.1 MotorControl.1 Multiplexer.1 \
  NLG.1 NPDT.1 Nport.1 \
  Opamp.1 Optoiso.1 Pconn.1 PushPull.1 Quantum.1 \
  Rectifiers.1 Relay.1 relaycoil.1 Rotbox.1 \
  Schottky.1 Sierpinski.1 ShiftR.1 Sixpole.1 Sources.1 SQUID.1 Switches.1 \
  Tgate.1 Three.1 Timer.1 TTLnand.1 Ttree.1 Tubediags.1 \
  Variable.1 Windings.1 Xform.1 \
  control.1 csc.1 diamond.1 ex00.1 ex01.1 ex02.1 \
  ex03.1 ex04.1 ex05.1 ex06.1 ex08.1 ex09.1 ex10.1 \
  ex11.1 ex12.1 ex15.1 ex16.1 ex17.1 ex18.1 ex21.1 exp.1 \
  fet.1 graysurf.1 lcct.1 pwrsupply.1 quick.1 \
  random.1 recycle.1 rose.1 shapes.1 thyristor.1 sfg.1 ujt.1 worm.1 XOR.1

BOXDIMS = ex09 Crow Inclpdf Loglog Opamp Ttree Windings

# It is advisable to do `make clean' between test examples.
#---------------------------------------------

DPIC = dpic
# DPIC = $$HOME/dpic/test/dpic

MPOST = mpost --tex=latex

TR = | tr '=' '\134'

LATEX = latex
DVIPS = dvips

DIMFILE = tmp.dim

.SUFFIXES: .mp .dvi .ps .m4 .1
.dvi.ps:
	$(DVIPS) $* -o
.tex.dvi:
	$(LATEX) $*
.m4.mp:
	$(M4) $*.m4 | $(DPIC) -s > $*.mp
#	$(M4) $*.m4 $*.pic
#	$(DPIC) -s $*.pic > $*.mp
.m4.1:
	@touch $(DIMFILE) $(DOC).dim
	$(M4) $(DIMFILE) $(DOC).dim $*.m4 > $(DOC).pic
	@(printf 'verbatimtex\n' ;\
     printf '=documentclass[11pt]{article}\n' ;\
     printf '=usepackage{times,boxdims,graphicx}\n' ;\
     printf '=usepackage{siunitx}\n' ;\
    $(MKDIM) ;\
     printf '=begin{document} etex\n' ) $(TR) > $*.mp
#	$(M4) $(DIMFILE) $(DOC).dim $*.m4 | $(DPIC) -s >> $*.mp
	dpic -s $(DOC).pic >> $*.mp
	@printf 'end\n' >> $*.mp
	$(MPOST) $*.mp

$(DOC).ps: $(DOC).dvi
	$(DVIPS) $(DOC) -o

EXL = exlinks
$(DOC).dvi: $(DOC).tex
	-if test "$(DOC)" = "examplesmpost" ; then make exlinks dims; fi
	make $(FIGS)
	$(LATEX) $(DOC)
	-if test -n "$(BOXDIMS)" ; then rm -f dims; \
       for box in $(BOXDIMS) ; do rm -f $$box.1; done; \
       make BOXDIMS="$(BOXDIMS)" dims; $(LATEX) $(DOC); fi

dims:
	-if test -n "$(BOXDIMS)" ; then for box in $(BOXDIMS) ; do \
        make $$box.1; rm -f $$box.1; make $$box.1; done; fi
	touch dims

figs: $(EXL) $(FIGS)

exlinks:
	@echo ""
	@echo 'Ignore "cannot create ... exists" warnings.'
	-@if test ! -f ex11.m4 ; then \
     ls ../*.m4 | sed -e 's/^/ln -s /' -e '/test.m4/d' | sh;\
     fi
	-@if test ! -f AmpTable.m4 ; then \
     ls ../../doc/*.m4 ../*.bb ../*.gz | sed -e 's/^/ln -s /' | sh;\
     fi
	-if test -n "$(EXL)" ; then touch $(EXL) ; fi

clobber: clean

tst:
	rm -f tst.ps tst.dvi test.1 test.mp
	make EXL="" DPIC="$(DPIC)" CONFIGFILE="$(CONFIGFILE)" DOC=tstmpost \
     FIGS=test.1 BOXDIMS=test
	rm -f *.frs

tst1: test.1 tstmpost.tex
	latex tstmpost
	dvips tstmpost

clean:
	rm -f stamp-* $(FIGS) *.pic
	-if /usr/bin/test -f exlinks ; then \
     ls -l *.m4 *.bb *.gz | grep '\->' | \
       sed -e 's/^.* \([^ ][^ ]*\) ->.*$$/rm -f \1/' | sh; fi
	rm -f Incl.eps.bb Incl.eps.gz
	rm -f *.log *.dvi *.ps test.pdf *.aux *.mp *.[0-9] *.[0-9][0-9] *.mpx *.dim
	rm -f core log mpxerr* *links figs.* *.dim dims F_test.*
	rm -f man[0-9]*.pic man[0-9]*.m4 figs.m4 test.1 test.mp test.pic test.tex
	-if test -n "$(BOXDIMS)" ; then for box in $(BOXDIMS) ; do \
      rm -f F_$$box.tex $$box.tex ; done; fi
