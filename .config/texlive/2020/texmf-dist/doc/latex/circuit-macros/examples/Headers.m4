.PS
# Headers.m4
log_init

  Header
  {"\sl P1" at last [].P1 rjust
  `"\tt Header"' at last [].s+(0,-10pt__)
   "\sl P2" at last [].P2 rjust
   thinlines_
   arrow <- from last [].Block.ne-(0,0.1) up 0.15 right 0.15
   "\sl Block" ljust
   thicklines_ }

  Header(2,3,8mm__,10mm__) with .nw at last [].ne+(0.75,-0.05)
  {"\sl P1" at last [].P1 rjust
  `"\tt Header(2,3,8mm\_\_,10mm\_\_)"' at last [].s+(0,-10pt__)
   "\sl P2" at last [].P2 ljust
   "\sl P5" at last [].P5 rjust
   "\sl P6" at last [].P6 ljust}

  left_
  Header(2,4,,,fill_(0.9)) with .sw at last [].se+(0.75,0)
  {"\sl P1" at last [].P1 rjust_
  `"\tt left\_; Header(2,4,{,},fill\_(0.9))"' at last [].s+(0,-20pt__)
   "\sl P8" at last [].P8 ljust_}

  down_
  Header(2,8) with .nw at last [].ne+(0.75,0)
  {"\sl P1" at last [].P1 ljust
   "\sl P2" at last [].P2 ljust
  `"\tt down\_; Header(2,8)" ' at last [].s+(0,-10pt__)
   "\sl P15" at last [].P15 rjust
   "\sl P16" at last [].P16 rjust}
  {thinlines_
   arrow <- right 0.15 from last [].PinP1.e
   `"\sl PinP1"' ljust
   arrow <- right 0.15 from last [].PinP2.e
   `"\sl PinP2"' ljust
   thicklines_ }

.PE
