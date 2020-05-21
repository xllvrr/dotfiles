# The distribution directory
LIBDIR = $$HOME/lib

# DPIC = $$HOME/dpic/test/dpic
DPIC = dpic

# M4 = m4 -B16000
M4 = m4 -I $(LIBDIR)

LIB = xfiglib
M4MACROS = xfig.m4

.SUFFIXES: .m4 .pic .fig
.m4.fig:
	$(M4) $(M4MACROS) $*.m4 > $*.pic
	$(DPIC) -x $*.pic > $*.fig

$(LIB).fig: $(LIB).m4

clobber: clean
	rm -f *.fig

clean:
	rm -f *.pic
