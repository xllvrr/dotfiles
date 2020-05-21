.PS
# Csource.m4
cct_init

                               # Set small text size
  iflatex(`textoffset = 1bp__; ifpsfrag(`textht = 9bp__',
          `latexcommand({\scriptsize)') ')

  linewid = 0.4                # Reduce element sizes

define(`npair',`[define(`m4lr',ifelse(`$1',,ljust,rjust))
  J: mosfet(down_ dimen_,ifelse(`$1',,R,L),uHSDF,E)
     "$Q_{$2}$" ljust "`2N5464'" ljust at J.nw+(-4pt__,9pt__)
  G: J.G
     line ifelse(`$1',,right,left) dimen_/4 from J.D
  Q: bi_tr(up_ dimen_,ifelse(`$1',,L,R),,E) with .B at Here
     ifelse(`$1',,r,l)label(,"$Q_{`$3'}$" m4lr "2N4239")
  E: Q.E
  S: dot(at (Q.C,J.S))
     line from J.S to S then to Q.C ]')

define(`ppair',`[define(`m4lr',ifelse(`$1',,ljust,rjust))
  J: mosfet(down_ dimen_,ifelse(`$1',,R,L),dHSDF,E)
     "$Q_{$2}$" ljust "`2N3819'" ljust at J.sw+(0,-8pt__)
  G: J.G
     line ifelse(`$1',,right,left) dimen_/4 from J.S
  Q: bi_tr(down_ dimen_,ifelse(`$1',,R,L),P,E) with .B at Here
     ifelse(`$1',,l,r)label(,"$Q_{`$3'}$" m4lr "2N4236")
  E: Q.E
  S: dot(at (Q.C,J.D))
     line from J.D to S then to Q.C ]')

  R2: resistor(down_ dimen_)
    llabel(,"$R_2$" ljust "\num{150}")
    dot
  Q13: bi_tr(down_ dimen_,,P,E) with .E at Here
    rlabel(,"$Q_{13}$" rjust "2N4236")
    line down 3.1*elen_ from Q13.C
  Q14: bi_tr(up_ dimen_,R,,E) with .C at Here 
    llabel(,"$Q_{14}$" rjust "2N4239")
    dot(at Q14.E)
  { line left_ dimen_*1.3 then up_ dimen_
  R1: potentiometer(up_ dimen_) with .Start at Here
    rlabel(,"$R_1$" ljust "\SI{20}{\kilo{}}")
    { ground(at R1.T1) }
    line from R1.End to (R1.End,Q13.E) then to Q13.E }
  { dot(at Q13.C+(0,-elen_))
    line to (R1.R,Here)+(-dimen_/2,0)
    { arrowline(right_ dimen_/2); llabel(,i_1) }
  V1: gap(down_ dimen_,1); rlabel(+,V_1,-) 
    line down_ dimen_/4 chop dotrad_ chop 0; ground(,T) }
  R3: resistor(down_ dimen_)
    llabel(,"$R_3$" ljust "\num{150}")
    dot(at Q13.C+(0,-2*elen_))
    line right_ dimen_/2
  A1: opamp with .In2 at Here;  "A$_1$" at A1.C
    "Nexus" ljust "`SQ-10A'" ljust at A1.sw+(0,-10pt__) below
    line left_ dimen_/4 from A1.In1 then up_ dimen_/2 then right dimen_
    dot
  { resistor(up_ elen_)
    llabel(,"$R_{14}$" rjust "\SI{19}{\kilo{}}")
    line to (Here,Q13.E) then to Q13.E }
    line to (A1.Out,Here)
    dot
  { line to A1.Out
    dot
    resistor(down_ to (Here,Q14.E))
    llabel(,"$R_{13}$" ljust "\SI{91}{\kilo{}}")
    line to Q14.E }
  R6: resistor(right_ dimen_)
    clabel(,"$R_6$" "\vphantom{x}" "\SI{15}{\kilo{}}")
    dot
    line to (Here,A1.In1) then right_ dimen_/4
  A2: opamp with .In1 at Here; "A$_2$" at A2.C
    "Nexus" ljust "`SQ-10A'" ljust at A2.sw+(0,-10pt__) below
    line left_ dimen_/4 from A2.In2
    ground

    dot(at A2.Out)
  DP1: npair(,3,4) with .E at (A2.Out,Q14.B)+(elen_*1.25,0)
    line from A2.Out to (A2.Out,DP1.G) then to DP1.G
    line from DP1.E to (DP1.E,R3.bottom); dot
  D4: reversed(`diode',up_ dimen_/2 from DP1.S)
  D3: reversed(`diode',up_ dimen_/2 from Here+(0,-dimen_/7))
    llabel(,"`OMC-V'" rjust "$D_3$" rjust "$D_4$")
  DP2: ppair(,1,2) with .E at (DP1.E,Q13.B)
  D1: diode(down_ dimen_/2 from DP2.S)
  D2: diode(down_ dimen_/2 from Here+(0,dimen_/6))
    { "$D_1$" rjust "$D_2$" rjust "`OMC-V'" rjust at last [].nw }
    dot(at (Here,A2))
    line to D2.bottom
    line from DP2.G to (A2.Out,DP2.G) then to A2.Out
    line from DP2.E to (DP2.E,R2.top); dot

  T: dot(at (DP1.E,A2)+(dimen_,0))
  DP3: npair(,7,8) with .G at (Here,DP1.G)+(dimen_/4,0)
    dot(at DP3.E)
    line to Q14.B
  DP4: ppair(,5,6) with .G at (DP3.G,DP2.G)
    dot(at DP4.E)
    line to Q13.B
    line from DP3.G to (T,DP3.G) then to (T,DP4.G) then to DP4.G
  R11: resistor(down_ dimen_ from DP4.S)
    rlabel(,"$R_{11}$" rjust "\num{20}")
  D5: diode(up_ from DP3.S to (DP3.S,A2),Z)
    llabel(,"$D_5$" rjust "1N4729$_{\strut}$")
    line to R11.end
  C4: capacitor(right_ dimen_*1.3 from DP3.S,C)
    llabel(,C_4); rlabel(,\SI{0.68}{\micro\farad})
  C3: capacitor(right_ dimen_*1.3 from DP4.S,C)
    llabel(,C_3); rlabel(,\SI{0.68}{\micro\farad})
    dot
    dot(at (Here,R6))
  C2: reversed(`capacitor',left_ dimen_*1.3,C)
    rlabel(,C_2); llabel(,\SI{0.1}{\micro\farad})
    line to R6.end

  R5: resistor(up_ from R6.end to (R6.end,Q13.B))
    rlabel(,"$R_5$" ljust "\SI{100}{\kilo{}}")
    dot(at R5.top-(0,dimen_/2))
    line left_ dimen_/2
    capacitor(down_ dimen_,C)
    rlabel(,"$C_1$" rjust "\SI{1}{\micro\farad}")
    ground(,T)

    line from DP4.E to (DP4.E,R2.bottom)
    resistor(up_ to (Here,R2.top))
    rlabel(,"$R_9$" ljust "\num{910}")
    dot
    resistor(down_ from DP3.E to (DP3.E,R3.bottom))
    llabel(,"$R_{10}$" ljust "\num{910}")
    dot

    line from R5.top to (R5,Q13.E)
    resistor(right_ elen_)
    clabel(,"$R_4$" "\vphantom{x}" "\SI{100}{\kilo{}}")
    line to (C4.end,Here) then to C4.end
    
  DP5: npair(L,11,10) with .E at (C4.end,DP1.E)+(elen_*0.8,0)
    line from DP5.E to (DP5.E,R3.bottom); dot
    line from R3.bottom to Here+(dimen_/2,0)
    dot(,,1)
    `"$-E_{CC}$"' ljust at last [].e
  D6: diode(up_ from DP5.S to (DP5.S,A2),Z)
    llabel(,"$D_6$" rjust "1N4728")
  DP6: ppair(L,12,9) with .E at (DP5.E,DP2.E)
    line from DP6.E to (DP6.E,R2.top); dot
    line from R2.top to Here+(dimen_/2,0)
    dot(,,1)
    `"$+E_{CC}$"' ljust at last [].e
    resistor(down_ from DP6.S to (DP6.S,C2))
    rlabel(,"$R_{12}$" rjust "\num{20}")
    dot
  { line to C2.e }
    line to D6.end

  Vr: dot(at (DP6.G,V1.top)+(dimen_/4,0))
    line from DP6.G to (Vr,DP6.G) then to (Vr,DP5.G) then to DP5.G
    reversed(`arrowline',right_ dimen_/2 from Vr); llabel(,i_2)
  V2: gap(down_ dimen_,1); llabel(+,V_2,-)
    line down_ dimen_/4 chop dotrad_ chop 0; ground(,T)

    dot(at (Vr,T))
    resistor(left_ to (DP6.E,Here))
    clabel("$R_{15}$" "" "\num{200}" ljust)
    line to (DP1.E,Here)
    dot

  iflatex(ifpsfrag(,`latexcommand(})'))
.PE
