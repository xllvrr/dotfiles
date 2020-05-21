%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Project: langsci
%% Author: Language Science Press (http://langsci-press.org)
%% Date: 2020-03-17 11:11:11 UTC
%% Purpose: publishing boks with Language Science Press.
%% Languages: LaTeX, tikz, eps
%% Copyright 2012- Language Science Press
%% Licence: This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%% http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status maintained'.%%
%% The Current Maintainer of this work is Sebastian Nordhoff.
%%
%% This work consists of the files
%% - langscibook.cls: class file
%% - langsci-series.def: metadata for series
%% - bib style definitions langsci-unified.bbx, langsci-unified.cbx,
%% - files for the logos used in the textbook series Textbooks in Language Sciences:
%% tbls-alarm.pdf, tbls-book.eps, tbls-book.pdf, tbls-bulb.eps, tbls-bulbon.pdf,
%% tbls-bulb.pdf, tbls-code.pdf, tbls-explore.pdf, tbls-filter.pdf, tbls-glass2.pdf,
%% tbls-glass.eps, tbls-glass.pdf, tbls-law.eps, tbls-law.pdf, tbls-more.pdf,
%% tbls-pencil.pdf, tbls-people.pdf, tbls-plus.pdf, tbls-receipt.pdf,
%% tbls-refresh.pdf, tbls-report.pdf, tbls-r.pdf, tbls-test.pdf, tbls-tree.pdf,
%% tbls-book.eps tbls-bulb.eps tbls-glass.eps tbls-law.eps
%% - langsci-basic.sty for commands required by the standard template
%% - langsci-bidi.sty: bidirectional text
%% - langsci-forest-setup.sty: definitions for linguistic trees
%% - langsci-gb4e.sty and langsci-cgloss.sty: typeset linguistic examples
%% - langsci-lgr.sty: shortcuts for the Leipzig Glossing Rules
%% - langsci-linguex.sty: a version of linguex which does not break gb4e
%% - langsci-optional.sty: additional useful commands
%% - langsci-subparts.sty: adds an additional sectioning level between part and chapter
%% - langsci-tbls.sty: macros for the textbook series Textbooks in Language Sciences
%% - langsci-textipa.sty: provide some Unicode replacements for TIPA phonetic commands
%% - langsci-tikz.sty: provide some custom commands
%% - langsci-tobi.sty: provide commands for Tone and Break indices (ToBI)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Here you find files to produce books for Language Science Press

The main file is the file langscibook.cls. This defines the basic structure of the book. It makes reference to the following auxiliary files:

    langsci-series.def: metadata for series
    langsci-basic.sty for commands required by the standard template
    bib style definitions
    eps and pdf files for the logos used in the textbook series Textbooks in Language Sciences

The following optional packages are also provided, but have to be included manually if desired:

    langsci-optional.sty: additional useful commands
    langsci-gb4e.sty and langsci-cgloss.sty typeset linguistic examples
    langsci-linguex.sty: a version of linguex which does not break gb4e
    langsci-lgr.sty: the Leipzig glossing rule definitions
    langsci-forest-setup.sty: definitions for linguistic trees
    langsci-bidi.sty: bidirectional text
    langsci-tbls.sty: macros for the textbook series Textbooks in Language Sciences
    langsci-subparts.sty: adds an additional sectioning level between part and chapter


Documentation is found in the folder documentation/.

The folder examples/ contains sample projects for the three use cases monograph, edited volume, and paper in edited volume.

For more information, visit url{http://www.langsci-press.org}.
