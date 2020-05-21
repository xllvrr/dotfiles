## Makefile to build TS1-encoded text companion fonts
## for Times, Helvetica and Symbol using the Adobe Euro Fonts

all: afms tex vfs

afms:
	cp _3______.afm zpeur.afm
	cp _3i_____.afm zpeuri.afm
	cp _3b_____.afm zpeub.afm 	
	cp _3bi____.afm zpeubi.afm
	cp _1______.afm zpeurs.afm 	
	cp _1i_____.afm zpeuris.afm
	cp _1b_____.afm zpeubs.afm 	
	cp _1bi____.afm zpeubis.afm
	cp _2______.afm zpeurt.afm 	
	cp _2i_____.afm zpeurit.afm
	cp _2b_____.afm zpeubt.afm 	
	cp _2bi____.afm zpeubit.afm		

tex:
	tex eurofont.tex

vfs:
	vptovf ptmr8c.vpl  ptmr8c.vf  ptmr8c.tfm
	vptovf ptmro8c.vpl ptmro8c.vf ptmro8c.tfm
	vptovf ptmri8c.vpl ptmri8c.vf ptmri8c.tfm
	vptovf ptmb8c.vpl  ptmb8c.vf  ptmb8c.tfm
	vptovf ptmbo8c.vpl ptmbo8c.vf ptmbo8c.tfm
	vptovf ptmbi8c.vpl ptmbi8c.vf ptmbi8c.tfm

	vptovf phvr8c.vpl  phvr8c.vf  phvr8c.tfm
	vptovf phvro8c.vpl phvro8c.vf phvro8c.tfm
	vptovf phvb8c.vpl  phvb8c.vf  phvb8c.tfm
	vptovf phvbo8c.vpl phvbo8c.vf phvbo8c.tfm

	vptovf pcrr8c.vpl  pcrr8c.vf  pcrr8c.tfm
	vptovf pcrro8c.vpl pcrro8c.vf pcrro8c.tfm
	vptovf pcrb8c.vpl  pcrb8c.vf  pcrb8c.tfm
	vptovf pcrbo8c.vpl pcrbo8c.vf pcrbo8c.tfm

clean:
	-rm *.mtx *.pl *.vpl *.log

realclean: clean
	-rm p*.tfm *.vf *.fd
