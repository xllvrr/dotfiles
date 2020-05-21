ZAP=	cmex10.mtx cmr10.mtx cmmi10.mtx cmsy10.mtx \
	rsfs10.mtx psyr.mtx psyr.pl psyro.mtx psyro.pl \
	ptmr8a.mtx ptmr8a.pl ptmr8r.mtx ptmr8r.pl \
	ptmri8a.mtx ptmri8a.pl ptmri8r.mtx ptmri8r.pl \
	zptmcm7t.vpl zptmcm7m.vpl zptmcm7y.vpl zptmcm7v.vpl \
	fontptcmx.log

all:	tex vfs

tex:	
	tex fontptcmx

vfs:
	vptovf zptmcm7t.vpl zptmcm7t.vf zptmcm7t.tfm
	vptovf zptmcm7m.vpl zptmcm7m.vf zptmcm7m.tfm
	vptovf zptmcm7y.vpl zptmcm7y.vf zptmcm7y.tfm
	vptovf zptmcm7v.vpl zptmcm7v.vf zptmcm7v.tfm

clean:
	-rm $(ZAP) *.log

realclean: clean
	-rm p*tfm z*.tfm *.vf *.fd
