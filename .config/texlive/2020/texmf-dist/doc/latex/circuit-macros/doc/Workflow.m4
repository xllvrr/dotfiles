.PS
# Workflow.m4
gen_init
command "{\small\sf"

boxwid = boxwid*0.8

B:[
define(`fbox',`box fill_(0.95)')
define(`lbx',`"\setbox0=\hbox{$1}\parbox{\wd0}{\raggedleft $2}" rjust')

  boxwid = 0.58
  boxht = 0.4
  linethick_(1.0)
  arrowwid = 0.05
  arrowht = 0.1
  fillval = 0.8
  hsep = 0.06
  vsep = 0.15

  arlen = 0.5*1.25

Tpic:     fbox "\LaTeX"
Pict2e:   fbox "\LaTeX" "pict2e" with .w at Tpic.e+(boxwid*3/4,0)
PDF: arrow <- up arlen from 0.5 between Tpic.n and Pict2e.n lbx(PDF,PDF\\ .pdf)
  "\tt -d" rjust above

  arrow <- up arlen from Pict2e.n lbx(\LaTeX,\LaTeX\\ .tex)
E: Here
  "\tt -e" rjust above

  arrow <- up arlen from Tpic.n lbx(tpic,tpic\\ .tex)

Psfrag: fbox "\LaTeX" "psfrag" with .w at Pict2e.e+(hsep,0)
  arrow <- up arlen from Psfrag.n lbx(Postscript,Postscript\\ psfrag\\ .eps)
  "\tt -f" rjust above
  boxstep = Psfrag.x-Pict2e.x
PGF: fbox "\LaTeX" "or" "PDFlatex" "tikz" ht 1.6*boxht \
  with .nw at Psfrag.ne+(hsep,0)
  arrow <- up arlen from PGF.n lbx(PGF,PGF\\ .tex)
  "\tt -g" rjust above
Mfpic: fbox "\LaTeX" "Mfpic" with .nw at PGF.ne+(hsep,0)
MetaFont: fbox "Metafont" with .n at Mfpic.s+(0,-vsep)
  arrow from Mfpic.s to MetaFont.n
  arrow from MetaFont.s down vsep/2 then right boxwid/2+hsep/2 \
    then up Mfpic.n.y-MetaFont.s.y+vsep*3/2 \
    then left hsep/2+boxwid/4 then down vsep
  arrow <- up arlen from Mfpic.n lbx(mfpic,mfpic\\ .tex)
  "\tt -m" rjust above
PSTricks: fbox "\LaTeX" "PSTricks" with .w at Mfpic.e+(hsep,0)
  arrow <- up arlen from PSTricks.n lbx(PSTricks,PSTricks\\ .tex)
  "\tt -p" rjust above

  arrow <- up vsep from (0.5<PSTricks,Mfpic>,E)
Dpic: fbox "dpic" with .s at Here

MetaPost: fbox "MetaPost" with .w at PSTricks.e+(boxwid*3/4,0)
  arrow <- up arlen from MetaPost.n lbx(Meta-,Meta-\\ Post\\ .mp)
  "\tt -s" rjust above
  arrow <- up arlen from 0.5 between PSTricks.n and MetaPost.n \
    lbx(Post-,Post-\\ script\\ .eps)
  "\tt -r" rjust above
MPLaTeX: fbox ht boxht + vsep/2 "\LaTeX" "or" "PDFlatex" \
  with .n at MetaPost.s+(0,-vsep)
  arrow from MetaPost.s to MPLaTeX.n

  arrow <- up arlen from MetaPost.n+(boxstep,0) lbx(SVG,SVG\\ .svg)
  "\tt -v" rjust above
Inkscape: fbox "Inkscape" "or" "HTML" with .n at last arrow.start
  arrow <- up arlen from Inkscape.n+(boxstep,0) lbx(Xfig,Xfig\\ .fig)
  "\tt -x" rjust above
Xfig: fbox "Xfig" with .n at last arrow.start

IsLaTeX: fbox ht boxht + vsep/2 "\LaTeX" "or" "PDFlatex" \
  with .n at Inkscape.s+(0,-vsep)
  arrow from Inkscape.s to IsLaTeX.n

  line from (PDF,E) to (Xfig,E)

Gpic: fbox "gpic -t" at (Tpic,Dpic)
  line down vsep from Gpic.s
M4: fbox "m4" at 0.5<Gpic,Dpic>
  arrow from M4.e to Dpic.w ".pic" above
  arrow from M4.w to Gpic.e ".pic" above
  arrow <- up vsep from 1/3<M4.nw,M4.ne>
    `"\setbox0=\hbox{Diagram source}\raisebox{-\dp0}{\box0}"' rjust
  arrow <- up vsep from 2/3<M4.nw,M4.ne>
    `"Macro libraries"' ljust
]

# print last [].wid
  
command "}%"
.PE
