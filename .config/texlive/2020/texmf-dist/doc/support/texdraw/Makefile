# Makefile for texdraw.texi

# $Id: Makefile 2.2 2019/04/18 TeXdraw-v2r3 $

doc = texdraw

pdf $(doc).pdf: $(doc).ps
	ps2pdf $(doc).ps $(doc).pdf

ps $(doc).ps: $(doc).texi Makefile
	env TEXINPUTS=..: texi2dvi --ps $(doc).texi

info $(doc).info: $(doc).texi
	makeinfo $(doc).texi

mostlyclean:
	rm -f $(doc).ps? $(doc).p1?
	rm -f $(doc).cp $(doc).cps $(doc).fn $(doc).fns
	rm -f $(doc).aux $(doc).log $(doc).toc $(doc).dvi

clean:
	rm -f $(doc).?? $(doc).???
