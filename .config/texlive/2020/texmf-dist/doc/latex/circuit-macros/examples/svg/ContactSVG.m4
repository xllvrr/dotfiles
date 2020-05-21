.PS
# ContactSVG
cct_init
svg_font(sans-serif,11bp__)

movw = 0.45
{
 contact
 {S:"svg_tt(`contact')" at last [].s+(0,-0.15)
  "svg_it(`P')" rjust at last [].P.w
  "svg_it(`O')" ljust at last [].O
  "svg_it(`C')" ljust at last [].C }
 move right_ movw; contact(R)
 {"svg_tt(`(R)')" at (last [].s,S)
  "svg_it(`P')" rjust at last [].P.w
  "svg_it(`O')" ljust at last [].O
  "svg_it(`C')" ljust at last [].C }
 move right_ movw; contact(O); {"svg_tt(`(O)')" at (last [],S)}
 move right_ movw; contact(C); {"svg_tt(`(C)')" at (last [],S)}

 move right_ movw; contact(P)
 {S: "svg_tt(`(P)')" at last [].s+(0,-0.15)
  "svg_it(`P')" rjust at last [].P.w
  "svg_it(`O')" ljust at last [].O
  "svg_it(`C')" ljust at last [].C }
 move right_ movw; contact(PR)
 {S: "svg_tt(`(PR)')" at last [].s+(0,-0.15)
  "svg_it(`P')" rjust at last [].P.w
  "svg_it(`O')" ljust at last [].O
  "svg_it(`C')" ljust at last [].C }
 move right_ movw; contact(PO); {"svg_tt(`(PO)')" at (last [],S)}
 {"svg_it(`O')" ljust at last [].O
  "svg_it(`C')" ljust at last [].C }
 move right_ movw; contact(PC); {"svg_tt(`(PC)')" at (last [],S)}
}

move down 0.75; right_ ; {
 contact(I); {S: "svg_tt(`(I)')" at last [].s+(0,-12bp__)
  "svg_it(`P')" rjust at last [].P.w
  "svg_it(`O')" ljust at last [].O.e
  "svg_it(`C')" ljust at last [].C.e }
 move right_ movw; contact(RI)
 {"svg_tt(`(RI)')" at (last [],S)
  "svg_it(`P')" rjust at last [].P.w
  "svg_it(`O')" ljust at last [].O.e
  "svg_it(`C')" ljust at last [].C.e }
 move right_ movw; contact(OI); {"svg_tt(`(OI)')" at (last [],S)}
 move right_ movw; contact(CI); {"svg_tt(`(CI)')" at (last [],S)}

 move right_ movw; contact(PI); {"svg_tt(`(PI)')" at (last [],S) }
 {"svg_it(`O')" ljust at last [].O.e
  "svg_it(`C')" ljust at last [].C.e }
 move right_ movw; contact(PIO); {"svg_tt(`(PIO)')" at (last [],S) }
 move right_ movw; contact(PIC); {"svg_tt(`(PIC)')" at (last [],S) }
}

movewid = movw
  move down 0.65; right_; {
  K: contact(T)
  {S: "svg_tt(`(T)')" at last [].s+(0,-0.15)
   thinlines_ 
   spline <- right 0.09 then up 0.05 right 0.05 from K.C; "svg_it(`C')"
   spline <- right 0.09 then down 0.05 right 0.05 from K.O; "svg_it(`O')"
   thicklines_ }
   move; K: contact(RT)
  {"svg_tt(`(RT)')" at (last [],S)
   thinlines_ 
   spline <- right 0.09 then up 0.05 right 0.05 from K.O; "svg_it(`O')"
   spline <- right 0.09 then down 0.05 right 0.05 from K.C; "svg_it(`C')"
   thicklines_ }
   move; contact(OT); {S: "svg_tt(`(OT)')" at (last [],S) }
   move; contact(CT); {S: "svg_tt(`(CT)')" at (last [],S) }
   move; contact(PT); {S: "svg_tt(`(PT)')" at (last [],S) }
   move; contact(PTO); {S: "svg_tt(`(PTO)')" at (last [],S) }
   move; contact(PTC); {S: "svg_tt(`(PTC)')" at (last [],S) }
}

  move down 0.65; right_; {
  K: contact(U)
  {S: "svg_tt(`(U)')" at last [].s+(0,-0.15)
   thinlines_ 
   spline <- right 0.09 then up 0.05 right 0.05 from K.C; "svg_it(`C')"
   spline <- right 0.09 then down 0.05 right 0.05 from K.O; "svg_it(`O')"
   thicklines_ }
   move; K: contact(RU)
  {"svg_tt(`(RU)')" at (last [],S)
   thinlines_ 
   spline <- right 0.09 then up 0.05 right 0.05 from K.O; "svg_it(`O')"
   spline <- right 0.09 then down 0.05 right 0.05 from K.C; "svg_it(`C')"
   thicklines_ }
   move; K: contact(OU); {S: "svg_tt(`(OU)')" at (last [],S)
    "svg_it(`O')" ljust at K.O.e }
   move; K: contact(CU); {S: "svg_tt(`(CU)')" at (last [],S)
    "svg_it(`C')" ljust at K.C.e }
   move; contact(PU); {S: "svg_tt(`(PU)')" at (last [],S) }
   move; contact(PUO); {S: "svg_tt(`(PUO)')" at (last [],S) }
   move; contact(PUC); {S: "svg_tt(`(PUC)')" at (last [],S) }
}

  command "</g>" # end font
.PE
