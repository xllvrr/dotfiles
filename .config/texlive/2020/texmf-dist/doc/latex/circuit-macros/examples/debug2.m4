% This is file debug2.m4
% Type the two (identical) command lines:
%   m4 pdf.m4 debug2.m4 | dpic -g > debug2.tex; pdflatex debug2
%   m4 pdf.m4 debug2.m4 | dpic -g > debug2.tex; pdflatex debug2
% Alternatively, type the two not-quite-identical lines:
%   m4 pstricks.m4 debug2.m4 | dpic -p > debug2.tex; latex debug2
%   m4 pstricks.m4 debug2.m4 | dpic -p > debug2.tex; latex debug2; dvips debug2
% In either case, the first command creates the file debug2.dim; the second
%  reads it to draw the correct bounding box.
%
% If m4 gives an error saying that it cannot find pdf.m4 then the M4PATH
%  environment variable has not been set to the directory containing
%  pgf.m4, pstricks.m4, and the other m4 libraries.  For example, I have
%  export M4PATH=.:~/lib:
%  in the file ~/.bash_aliases on my Ubuntu machine, and on my PC with cygwin
%  it is in .bashrc. (You will have to change ~/lib to suit.)
%
% If other errors occur, look at debug2.log for details.
%
% If boxdims.sty is not found, then either it has not been copied to
% where latex can find it or the latex filename database has not been
% updated correctly.  Instructions for the latter depend on the operating
% system and may involve commands texhash, mktexlsr, tlmgr, possibly preceded
% by sudo, or (for MiKTeX) clicking on the Refresh FNDB button.
% See Manual Installation, steps 3 and 4 (ignore 1 and 2) at
% https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages
%
% On my Ubuntu machine, boxdims.sty is in
% /usr/local/lib/localtexmf/tex/latex/local/
% and on my cygwin machine it is in
% /cygdrive/d/localtexmf/tex/latex/local/
% but you might choose something like ~/texmf/tex/latex/boxdims/
%
\documentclass{article}
\usepackage{boxdims}
\usepackage{ifpstricks(pstricks,tikz)}
\begin{document}
.PS
cct_init
sinclude(debug2.dim)
s_init(steinmetz)
[
  source(up_,AC); llabel(,s_box(`${}20$ V'),)
  inductor(up_,W); llabel(,s_box(`${}20$ mH'),)
  ]
showbox_
.PE
\end{document}
