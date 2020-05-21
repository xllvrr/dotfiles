.PS
# RelaySVG
cct_init
svg_font(sans-serif,10bp__)

skip = 1.1

R1:relay
 {"svg_it(V1)" wid 0.16 rjust at last [].V1
  "svg_it(V2)" ljust at last [].V2
  "svg_it(P1)" rjust at last [].P1-(dotrad_,0)
  "svg_it(O1)" ljust at last [].O1
  "svg_it(C1)" ljust at last [].C1 }
 S: "svg_tt(`relay')" at last [].s+(0,-0.2)

R5:relay(2,CTh) with .sw at last [].sw+(skip,0)
 { for_(1,2,1,`
    "svg_it(P`'m4x)" rjust at last [].P`'m4x-(dotrad_,0)
    "svg_it(C`'m4x)" ljust at last [].C`'m4x ') }
 "svg_tt((2,CTh))" at (last [],S)

R4:relay(2,O) with .sw at last [].sw+(skip,0)
 {for_(1,2,1,`
    "svg_it(P1)" rjust at last [].P1-(dotrad_,0)
    "svg_it(O`'m4x)" ljust at last [].O`'m4x ')}
 "svg_tt((2,O))" at (last [],S)

R3:relay(2,PIAX) with .sw at last [].sw+(skip,0)
 {"svg_it(V1)" rjust at last [].V1
  "svg_it(V2)" rjust at last [].V2
  for_(1,2,1,`
    "svg_it(P`'m4x)" rjust at last [].P`'m4x-(dotrad_,0)
    "svg_it(O`'m4x)" ljust at last [].O`'m4x+(dotrad_,0)
    "svg_it(C`'m4x)" ljust at last [].C`'m4x+(dotrad_,-2pt__) ') }
 "svg_tt((2,PIAX))" at (last [],S)

R2:relay(2,R) with .sw at last [].sw+(skip,0)
 {"svg_it(V1)" rjust at last [].V1
  "svg_it(V2)" wid 0.2 ljust at last [].V2
  for_(1,2,1,`
    "svg_it(P`'m4x)" rjust at last [].P`'m4x-(dotrad_,0)
    "svg_it(O`'m4x)" ljust at last [].O`'m4x 
    "svg_it(C`'m4x)" ljust at last [].C`'m4x ') }
 "svg_tt(`relay(2,R)')" at (last [],S)

  command "</g>)" # end font
.PE
