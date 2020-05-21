
To test out a single diagram, copy it into test.m4 and type 'make tst'.
The file is processed through m4 and dpic -f to make test.eps containing
psfrag embedded labels.  This file is read by tstpsfrag.tex using the
\includegraphics command.

Note that the configuration file to be read initially by m4 is psfrag.m4.
