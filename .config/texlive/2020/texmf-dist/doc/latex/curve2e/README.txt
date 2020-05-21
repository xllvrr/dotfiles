%%
%% This is file `README.txt',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% curve2e.dtx  (with options: `readme')
%% 
%%   Copyright (C)  2005--2020 Claudio Beccari  all rights reserved.
%%   License information appended
%% 
File README.txt for package curve2e
        [2020-05-03 v.2.2.8 Extension package for pict2e]
The package bundle curve2e is composed of the following files

curve2e.dtx
curve2e-manual.tex

The derived files are

curve2e.sty
curve2e-v161.sty
curve2e.pdf
curve2e-manual.pdf
README.txt

Compile curve2e.dtx and curve2e-manual.tex two or three times until
all labels and citation keys are completely resolved.

Move curve2e.dtx and curve2e-manual.tex to ROOT/source/latex/curve2e/
Move curve2e.pdf and curve2e-manual.pdf to ROOT/doc/latex/curve2e/
Move curve2e.sty and curve2e-v161.sty   to ROOT/tex/latex/curve2e/
Move README.txt                         to ROOT/doc/latex/curve2e/

curve2e.dtx is the documented TeX source file of the derived files
curve2e.sty, curve2e-v161.sty and README.txt.

You get curve2e.sty, curve2e.pdf, curve2e-v161.sty, and README.txt
by running pdflatex on curve2e.dtx.

The curve2e-manual files contains the user manual; in
this way the long preliminary descriptive part has been transferred to
a shorter dedicated file, and the “normal” user should have enough
information to use the package. Th curve2e.pdf file, extracted from
the .dtx one, contains the code documentation and is intended for the
developers, or for the curious advanced users. For what concerns
curve2e-v161.sty is a previous version of this package; see below why
the older version might become necessary to the end user.

README.txt, this file, contains general information.
This bundle contains also package curve2e-v161.sty, a roll-back
version needed in certain rare cases.

Curve2e.sty is an extension of the package pict2e.sty which extends the
standard picture LaTeX environment according to what Leslie Lamport
specified in the second edition of his LaTeX manual (1994).

This further extension curve2e.sty to pict2e.sty allows to draw lines
and vectorsith any non integer slope parameters, to draw dashed and dotted
lines of any slope, to draw arcs and curved vectors, to draw curves where
just the interpolating nodes are specified together with the slopes at
such nodes; closed paths of any shape can be filled with color; all
coordinates are treated as ordered pairs, i.e. 'complex numbers';
coordinates may be expressed also in polar form. Coordinates may be
specified with macros, so that editing any drawing is rendered much
simpler: any point specified with a macro is modified only once in
its macro definition.
Some of these features have been incorporated in the 2009 version of
pict2e; therefore this package avoids any modification to the original
pict2e commands. In any case the version of curve2e is compatible with
later versions of pict2e; see below.

Curve2e now accepts polar coordinates in addition to the usual cartesian
ones; several macros have been upgraded; a new macro for tracing cubic
Bezier splines with their control nodes specified in polar form is
available. The same applies to quadratic Bezier splines. The multiput
command has been completely modified in a backwards compatible way; the
new version allows to manipulate the increment components in a configurable
way. A new xmultiput command has been defined that is more configurable
than the original one; both commands multiput and xmultiput are backwards
compatible with the original picture environment definition.

Curve2e solves a conflict with package eso-pic.

This version of curve2e is almost fully compatible with pict2e dated
2014/01/12 version 0.2z and later.

If you specify

\usepackage[<pict2e options>]{curve2e}

the package pict2e is automatically invoked with the specified options.

The -almost fully compatible- phrase is necessary to explain that this
version of curve2e uses some `functions' of the LaTeX3 language that were
made available to the LaTeX developers by mid October 2018. Should the user
have an older or a basic/incomplete installation of the TeX system,
such L3 functions might not be available. This is why this
package checks the presence of the developer interface; in case
such interface is not available it rolls back to the previous version
renamed curve2e-v161.sty, which is part of this bundle; this roll-back
file name must not be modified in any way. The compatibility mentioned
above implies that the user macros remain the same, but their
implementation requires the L3 interface. Some macros and environments
rely totally on the xfp package functionalities, but legacy documents
source files should compile correctly.

The package has the LPPL status of maintained.

According to the LPPL licence, you are entitled to modify this package,
as long as you fulfil the few conditions set forth by the Licence.

Nevertheless this package is an extension to the standard LaTeX
pict2e (2014) package. Therefore any change must be controlled on the
parent package pict2e, so as to avoid redefining or interfering with
what is already contained in that package.

If you prefer sending me your modifications, as long as I will maintain
this package, I will possibly include every (documented) suggestion or
modification into this package and, of course, I will acknowledge your
contribution.

Claudio Beccari

claudio dot beccari at gmail dot com

%% 
%% Distributable under the LaTeX Project Public License,
%% version 1.3c or higher (your choice). The latest version of
%% this license is at: http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained"
%% 
%% This work consists of file curve2e.dtx, and the derived files
%% curve2e.sty and curve2e.pdf, plus the auxiliary derived files
%% README.txt and curve2e-v161.sty.
%% 
%%
%% End of file `README.txt'.
