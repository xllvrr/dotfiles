.PS
# HeadersSVG.m4
log_init(svg_font(sans-serif,10bp__))

  Header
  {"svg_it(P1)" wid 15bp__ at last [].P1 rjust
  `"Header"' wid 45bp__ at last [].s+(0,-10pt__)
   "svg_it(P2)" at last [].P2 rjust
   thinlines_
   arrow <- from last [].Block.ne-(0,0.1) up 0.15 right 0.15
   "svg_it(Block)" ljust
   thicklines_ }

  Header(2,3,8mm__,10mm__) with .nw at last [].ne+(0.75,-0.05)
  {"svg_it(P1)" at last [].P1 rjust
  "`Header(2,3,8mm__,10mm__)'" at last [].s+(0,-10pt__)
   "svg_it(P2)" at last [].P2 ljust
   "svg_it(P5)" at last [].P5 rjust
   "svg_it(P6)" at last [].P6 ljust}

  left_
  Header(2,4,,,fill_(0.9)) with .sw at last [].se+(0.75,0)
  {"svg_it(P1)" at last [].P1 rjust_
   "`left_; Header(2,4,,,fill_(0.9))'" at last [].s+(0,-23pt__)
   "svg_it(P8)" at last [].P8 ljust_}

  down_
  Header(2,8) with .nw at last [].ne+(0.75,0)
  {"svg_it(P1)" at last [].P1 ljust
   "svg_it(P2)" at last [].P2 ljust
   "`down_; Header'(2,8)" at last [].s+(0,-10pt__)
   "svg_it(P15)" at last [].P15 rjust
   "svg_it(P16)" at last [].P16 rjust}
  {thinlines_
   arrow <- right 0.15 from last [].PinP1.e ; {move right 0.45}
   "svg_it(PinP1)" ljust
   arrow <- right 0.15 from last [].PinP2.e
   "svg_it(PinP2)" ljust
   thicklines_ }

 command "</g>" # end font
.PE
