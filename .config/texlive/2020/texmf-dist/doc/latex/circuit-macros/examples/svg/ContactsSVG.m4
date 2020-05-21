.PS
# ContactsSVG.m4
cct_init
svg_font(sans-serif,10bp__)

 space = 0.75
 KS:contacts(2)
 {"svg_tt(`contacts(2)')" wid 1 at KS.s +(0,-12bp__)
  for_(1,2,1,
  `"svg_it(P`'m4x)" rjust at last [].P`'m4x-(dotrad_,0)
    "svg_it(O`'m4x)" ljust at last [].O`'m4x+(dotrad_,0)
    "svg_it(C`'m4x)" ljust at last [].C`'m4x+(dotrad_,0) ') }

 KS:contacts(2,I) with .sw at last [].se+(space,0)
 {"svg_tt(`(2,I)')" at KS.s +(0,-12bp__)
  for_(1,2,1,
  `"svg_it(P`'m4x)" rjust at last [].P`'m4x-(dotrad_,0)
    "svg_it(O`'m4x)" ljust at last [].O`'m4x+(dotrad_,0)
    "svg_it(C`'m4x)" ljust at last [].C`'m4x+(dotrad_,0) ') }

 KS:contacts(2,IO) with .sw at last [].se+(space,0)
 {"svg_tt(`(2,IO)')" at KS.s +(0,-12bp__)
  for_(1,2,1,
  `"svg_it(P`'m4x)" rjust at last [].P`'m4x-(dotrad_,0)
    "svg_it(O`'m4x)" ljust at last [].O`'m4x+(dotrad_,0) ') }

 KS:contacts(2,PICD) with .sw at last [].se+(space,0)
 {"svg_tt(`(2,PICD)')" at KS.s +(0,-12bp__)
  for_(1,2,1,
  `"svg_it(P`'m4x)" rjust at last [].P`'m4x-(dotrad_,0)
    "svg_it(O`'m4x)" ljust at last [].O`'m4x+(dotrad_,0)
    "svg_it(C`'m4x)" ljust at last [].C`'m4x+(dotrad_,0) ') }

 KS:contacts(2,PTCD) with .sw at last [].se+(space,0)
 {"svg_tt(`(2,PTCD)')" at KS.s +(0,-12bp__)
  for_(1,2,1,
  `"svg_it(P`'m4x)" rjust at last [].P`'m4x-(dotrad_,0)
    "svg_it(O`'m4x)" ljust at last [].O`'m4x+(dotrad_,0)
    "svg_it(C`'m4x)" ljust at last [].C`'m4x+(dotrad_,0) ') }

 KS:contacts(2,PUCD) with .sw at last [].se+(space,0)
 {"svg_tt(`(2,PUCD)')" at KS.s +(0,-12bp__)
  for_(1,2,1,
  `"svg_it(P`'m4x)" rjust at last [].P`'m4x-(dotrad_,0)
    "svg_it(O`'m4x)" ljust at last [].O`'m4x+(dotrad_,0)
    "svg_it(C`'m4x)" ljust at last [].C`'m4x+(dotrad_,0) ') }

  command "</g>" # end font
.PE
