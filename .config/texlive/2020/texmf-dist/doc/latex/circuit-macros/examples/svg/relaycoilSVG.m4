.PS
# relaycoil.m4
cct_init

  spc = dimen_/3
{ relaycoil; S: "svg_tt(`relaycoil')" at last [].s+(0,-20bp__)
  { "svg_it(V1)" wid 15bp__ at last [].V1 rjust
    "svg_it(V2)" at last [].V2 ljust }
  K: relaycoil(NX) with .nw at last [].ne+(spc*4,0); "svg_tt((NX))" \
      at (last [],S)
  { thinlines_
    spline <- from K.A1 left 7bp__ then up 4bp__ left 4bp__
     "svg_it(A1)" rjust
    arrow <- from K.A2 left 10bp__; "svg_it(A2)" rjust
    spline <- from K.A3 left 7bp__ then down 4bp__ left 4bp__
     "svg_it(A3)" rjust
    spline <- from K.B1 right 7bp__ then up 4bp__ right 4bp__
     "svg_it(B1)" ljust
    arrow <- from K.B2 right 10bp__; "svg_it(B2)" ljust
    spline <- from K.B3 right 7bp__ then down 4bp__ right 4bp__
     "svg_it(B3)" ljust
    thicklines_
    }
  relaycoil(AXSR) with .nw at last [].ne+(spc*5,0); "svg_tt((AXSR))" \
    at (last [],S)
  { "svg_it(V1)" at last [].V1 rjust; "svg_it(V2)" at last [].V2 rjust }
  relaycoil(BXSR) with .nw at last [].ne+(spc*2,0); "svg_tt((BXSR))" \
    at (last [],S)
  { "svg_it(V1)" at last [].V1 ljust; "svg_it(V2)" at last [].V2 ljust }
  relaycoil(SR) with .nw at last [].ne+(spc*4,0); "svg_tt((SR))" at (last [],S)
  relaycoil(SO) with .nw at last [].ne+(spc,0); "svg_tt((SO))" at (last [],S)
  relaycoil(SOR) with .nw at last [].ne+(spc,0); "svg_tt((SOR))" at (last [],S)
  }
{
  move down_ 3/4; right_
  relaycoil(HS); S: "svg_tt((HS))" at last [].s+(0,-12bp__)
  relaycoil(NAC) with .nw at last [].ne+(spc,0); "svg_tt((NAC))" at (last [],S)
  relaycoil(AC) with .nw at last [].ne+(spc,0); "svg_tt((AC))" at (last [],S)
  relaycoil(ML) with .nw at last [].ne+(spc,0); "svg_tt((ML))" at (last [],S)
  relaycoil(PO) with .nw at last [].ne+(spc,0); "svg_tt((PO))" at (last [],S)
  relaycoil(RM) with .nw at last [].ne+(spc,0); "svg_tt((RM))" at (last [],S)
  relaycoil(RH) with .nw at last [].ne+(spc,0); "svg_tt((RH))" at (last [],S)
  relaycoil(TH) with .nw at last [].ne+(spc,0); "svg_tt((TH))" at (last [],S)
  relaycoil(EL) with .nw at last [].ne+(spc,0); "svg_tt((EL))" at (last [],S)
  }

.PE
