.PS
# `Jack.m4'
cct_init(svg_font(sans-serif,11bp__))

P: [
  P1: plug
    "A" wid 0.1 at P1.A rjust
    "B" at P1.B rjust
    "TB" at P1.TB ljust above
    "TA" at P1.TA ljust below
  P2: plug(,R) with .B at P1.A+(0.85,0)
    "A" wid 0.1 at P2.A rjust
    "B" at P2.B rjust
  P3: plug(,3) with .A at P2.B+(0.85,0)
    "A" at P3.A rjust
    "B" at P3.B rjust
    "C" at P3.C rjust
  P4: plug(L,3R) with .A at P3.A+(1,0)
    "A" wid 0.1 at P4.A ljust
    "B" at P4.B ljust
    "C" at P4.C ljust
  `"plug"' below at P1.s+(0,-0.1)
  `"plug(,R)"' below at P2.s+(0,-0.1)
  `"plug(,3)"' below at P3.s+(-0.1,-0.1)
  `"plug(L,3R)"' below at P4.s+(0.1,-0.1)
]

L: [
 J1: jack
   thinlines_
   "L" wid 0.1 rjust at J1.L
   arrow <- right 0.1 from J1.F; "F" ljust
   arrow <- down 0.1 from J1.G then left 0.1 ; "G" rjust
   thicklines_
 J2: jack(,LMBS) with .F at J1.F+(1.2,0)
   thinlines_
   "L" rjust at J2.L
   arrow <- from J2.LM left 0.25; "LM" rjust
   arrow <- from J2.LB left 0.25; "LB" rjust
   "S" rjust at J2.S
   thicklines_
 J3: jack(L,RLS) with .F at J2.F+(0.4,0)
   thinlines_
   "L" ljust at J3.L
   "S" ljust at J3.S
   thicklines_
 J4: jack(L,RLBLMLMS) with .F at J3.F+(1,0)
   thinlines_
   "L1" ljust at J4.L1
   arrow <- right 0.3 from J4.LM1; "LM1" ljust
   "L2" ljust at J4.L2
#  arrow <- right 0.3 from J4.LM2; "LM2" ht 11pt__ ljust
   arrow <- right 0.3 from J4.LM2; "LM2" ljust
   "S" ljust at J4.S
   "L" ljust at J4.L
   arrow <- right 0.2 from J4.LB ; "LB" ljust
 J5: jack(,RSBSMLB) with .F at J4.F+(1.95,0)
   thinlines_
   "L" rjust at J5.L
   "S" rjust at J5.S
   "S1" rjust at J5.S1
   arrow <- left 0.3 from J5.SM1; "SM1" rjust
   arrow <- left 0.25 then left 0.1 down 0.05 from J5.LB; "LB" rjust
   arrow <- left 0.25 then left 0.1 up   0.05 from J5.SB; "SB" rjust
   thicklines_

  `"jack"' below at J1.s+(0,-0.15)
  `"jack(,LMBS)"' at (J2,last "")
  `"..(L,RLS)"' at (J3,last "")
  `"..(L,RLBLMLMS)"' at (J4,last "")
  `"..(,RSBSMLB)"' wid 72bp__ at (J5,last "")
] with .nw at P.sw + (0,0.1)

 command "</g>" # end font
.PE
