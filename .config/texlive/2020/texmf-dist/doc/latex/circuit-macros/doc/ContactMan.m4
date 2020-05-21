.PS
# Contact
cct_init

movw = 0.45
{
 contact
 {S:`"\tt contact"' at last [].s+(0,-0.15)
  "\sl P" rjust at last [].P.w
  "\sl O" ljust at last [].O
  "\sl C" ljust at last [].C }
 move right_ movw; contact(R)
 {`"\tt (R)"' at (last [].s,S)
  "\sl P" rjust at last [].P.w
  "\sl O" ljust at last [].O
  "\sl C" ljust at last [].C }
 move right_ movw; contact(O); {`"\tt (O)"' at (last [],S)}
 move right_ movw; contact(C); {`"\tt (C)"' at (last [],S)}

 move right_ movw; contact(P)
 {S: `"\tt (P)"' at last [].s+(0,-0.15)
  "\sl P" rjust at last [].P.w
  "\sl O" ljust at last [].O
  "\sl C" ljust at last [].C }
 move right_ movw; contact(PR)
 {S: `"\tt (PR)"' at last [].s+(0,-0.15)
  "\sl P" rjust at last [].P.w
  "\sl O" ljust at last [].O
  "\sl C" ljust at last [].C }
 move right_ movw; contact(PO); {`"\tt (PO)"' at (last [],S)}
 {"\sl O" ljust at last [].O
  "\sl C" ljust at last [].C }
 move right_ movw; contact(PC); {`"\tt (PC)"' at (last [],S)}
}

move down 0.75; right_ ; {
 contact(I); {`S: "\tt (I)"' at last [].s+(0,-12bp__)
  "\sl P" rjust at last [].P.w
  "\sl O" ljust at last [].O.e
  "\sl C" ljust at last [].C.e }
 move right_ movw; contact(RI)
 {`"\tt (RI)"' at (last [],S)
  "\sl P" rjust at last [].P.w
  "\sl O" ljust at last [].O.e
  "\sl C" ljust at last [].C.e }
 move right_ movw; contact(OI); {`"\tt (OI)"' at (last [],S)}
 move right_ movw; contact(CI); {`"\tt (CI)"' at (last [],S)}

 move right_ movw; contact(PI); {`"\tt (PI)"' at (last [],S) }
 {"\sl O" ljust at last [].O.e
  "\sl C" ljust at last [].C.e }
 move right_ movw; contact(PIO); {`"\tt (PIO)"' at (last [],S) }
 move right_ movw; contact(PIC); {`"\tt (PIC)"' at (last [],S) }
}

movewid = movw
  move down 0.65; right_; {
  K: contact(T)
  {S: `"\tt (T)"' at last [].s+(0,-0.15)
   thinlines_ 
   spline <- right 0.09 then up 0.05 right 0.05 from K.C; "$\;\;$\sl C"
   spline <- right 0.09 then down 0.05 right 0.05 from K.O; "$\;\;$\sl O"
   thicklines_ }
   move; K: contact(RT)
  {`"\tt (RT)"' at (last [],S)
   thinlines_ 
   spline <- right 0.09 then up 0.05 right 0.05 from K.O; "$\;\;$\sl O"
   spline <- right 0.09 then down 0.05 right 0.05 from K.C; "$\;\;$\sl C"
   thicklines_ }
   move; contact(OT); {S: `"\tt (OT)"' at (last [],S) }
   move; contact(CT); {S: `"\tt (CT)"' at (last [],S) }
   move; contact(PT); {S: `"\tt (PT)"' at (last [],S) }
   move; contact(PTO); {S: `"\tt (PTO)"' at (last [],S) }
   move; contact(PTC); {S: `"\tt (PTC)"' at (last [],S) }
}

  move down 0.65; right_; {
  K: contact(U)
  {S: `"\tt (U)"' at last [].s+(0,-0.15)
   thinlines_ 
   spline <- right 0.09 then up 0.05 right 0.05 from K.C; "$\;\;$\sl C"
   spline <- right 0.09 then down 0.05 right 0.05 from K.O; "$\;\;$\sl O"
   thicklines_ }
   move; K: contact(RU)
  {`"\tt (RU)"' at (last [],S)
   thinlines_ 
   spline <- right 0.09 then up 0.05 right 0.05 from K.O; "$\;\;$\sl O"
   spline <- right 0.09 then down 0.05 right 0.05 from K.C; "$\;\;$\sl C"
   thicklines_ }
   move; K: contact(OU); {S: `"\tt (OU)"' at (last [],S)
    "\sl O" ljust at K.O.e }
   move; K: contact(CU); {S: `"\tt (CU)"' at (last [],S)
    "\sl C" ljust at K.C.e }
   move; contact(PU); {S: `"\tt (PU)"' at (last [],S) }
   move; contact(PUO); {S: `"\tt (PUO)"' at (last [],S) }
   move; contact(PUC); {S: `"\tt (PUC)"' at (last [],S) }
}
.PE
