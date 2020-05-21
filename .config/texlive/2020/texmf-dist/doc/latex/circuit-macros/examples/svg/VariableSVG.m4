.PS
# `VariableSVG.m4'
cct_init

define(`elen_',dimen_); down_
[ { variable(`resistor',A) }; {"svg_tt(A)" at last line.end below}; move right
  { variable(`resistor',N) }; {"svg_tt(N)" at last line.end below}; move right
  { variable(`resistor',uN) }; {"svg_tt(uN)" at last line.end below}; move right
  { variable(`resistor',NN) }; {"svg_tt(uN)" at last line.end below}; move right
  { variable(`resistor',uNN) }; {"svg_tt(uNN)" at last line.end below}
  ]
[
  skp = 0.4
  hskip = linewid*0.5
  cskip = hskip
Orig: Here
  { move right cskip+elen_+hskip
    line invis right_ elen_ "svg_tt(C)"; move right_ hskip
    { move up_ 0.25 }
    line invis right_ elen_ "svg_tt(S)" }
  Loopover_(`char',
   `move down skp ifelse(char,A,*0.5)
    { line invis right_ cskip "svg_tt(char)"
      variable(`capacitor(,C)',char); move right_ hskip
      variable(`capacitor(,C)',char`'C); move right_ hskip
      variable(`capacitor(,C)',char`'S) }',
   A,P,L,N)
  ] with .w at last [].e+(0.4,0)
.PE
