.PS
# `NPDT.m4'
cct_init(svg_font(sans-serif,11bp__))

  movewid = 1.0

  NPDT
  {move left 0.1 from last [].w}
  { "svg_it(R)" at last [].R.s below
    "svg_it(T)" at last [].T.s below
    "svg_it(L)" at last [].L.s below }
  { `"NPDT"' at last [].s +(0,-0.22) }

  up_; NPDT with .sw at last[].se+(0.5,0)
  { "svg_it(R)" wid 8pt__ at last [].R.e ljust
    "svg_it(T)" at last [].T.e ljust
    "svg_it(L)" at last [].L.e ljust }
  { `"up_; NPDT"' at last [].s +(0.1,-0.15) }
  right_

  NPDT(2) with .w at last [].e+(0.75,0)
  { for_(1,2,1,
     `"svg_it(R`'m4x)" at last [].R`'m4x.e ljust
      "svg_it(L`'m4x)" wid 11pt__ at last [].L`'m4x.w rjust') }
  { `"NPDT(2)"' at last [].s +(0,-0.15) }
  move

  NPDT(3,R)
  { for_(1,3,1,
     `"svg_it(R`'m4x)" at last [].R`'m4x.e ljust
      "svg_it(L`'m4x)" wid 11pt__ at last [].L`'m4x.w rjust') }
  { `"NPDT(3,R)"' at last [].s below }

  left_; NPDT(2,R) with .w at last [].e+(1.0,0)
  { for_(1,2,1,
     `"svg_it(R`'m4x)" at last [].R`'m4x.w rjust
      "svg_it(L`'m4x)" wid 11pt__ at last [].L`'m4x.e ljust') }
  { `"left_; NPDT(2,R)"' wid 90bp__ at last [].s +(0,-0.15) }

 command "</g>" # end font
.PE
