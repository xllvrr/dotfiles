ZAP=	cmex10.mtx cmex9.mtx cmr10.mtx cmmi10.mtx cmsy10.mtx \
	psyr.mtx psyr.pl \
	ptmr8a.mtx ptmr8a.pl ptmr8r.mtx ptmr8r.pl \
	ptmri8a.mtx ptmri8a.pl ptmri8r.mtx ptmri8r.pl \
	pzcmi8a.mtx pzcmi8a.pl pzcmi8r.mtx pzcmi8r.pl \
	zpsycmrv.vpl zptmcmr.vpl zptmcmrm.vpl zpzccmry.vpl \
	fontptcm.log

all:	tex vfs

tex:	
	tex fontptcm

vfs:
	vptovf zpsycmrv.vpl zpsycmrv.vf zpsycmrv.tfm 
	vptovf zptmcmr.vpl zptmcmr.vf zptmcmr.tfm  
	vptovf zptmcmrm.vpl zptmcmrm.vf zptmcmrm.tfm 
	vptovf zpzccmry.vpl zpzccmry.vf zpzccmry.tfm  

clean:
	-rm $(ZAP) *.log

realclean: clean
	-rm p*tfm z*.tfm *.vf *.fd
