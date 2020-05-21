.PS
# `Jack.m4'
cct_init

P: [
  P1: plug
    "\sl A" wid 0.1 at P1.A rjust
    "\sl B" at P1.B rjust
    "\sl TB" at P1.TB ljust above
    "\sl TA" at P1.TA ljust below
  P2: plug(,R) with .B at P1.A+(0.85,0)
    "\sl A" wid 0.1 at P2.A rjust
    "\sl B" at P2.B rjust
# P3: plug(L) with .A at P2.A+(1,0)
#   "\sl A" wid 0.1 at P3.A ljust
#   "\sl B" at P3.B ljust
  P4: plug(,3) with .A at P2.B+(0.85,0)
    "\sl A" at P4.A rjust
    "\sl B" at P4.B rjust
    "\sl C" at P4.C rjust
  P5: plug(L,3R) with .A at P4.A+(1,0)
    "\sl A" wid 0.1 at P5.A ljust
    "\sl B" at P5.B ljust
    "\sl C" at P5.C ljust
  `"\tt plug"' below at P1.s+(0,-0.1)
  `"\tt plug(,R)"' below at P2.s+(0,-0.1)
# `"\tt plug(L)"' below at P3.s+(0,-0.1)
  `"\tt plug(,3)"' below at P4.s+(-0.1,-0.1)
  `"\tt plug(L,3R)"' below at P5.s+(0.1,-0.1)
]

L: [ right_
 J1: jack
   thinlines_
   "\sl L" wid 0.1 rjust at J1.L
   arrow <- right 0.1 from J1.F; "\sl F" ljust
   arrow <- down 0.1 from J1.G then left 0.1 ; "\sl G" rjust
   thicklines_
 J2:[K2: jack(,LMBS) #with .F at J1.F+(1.2,0)
   thinlines_
   "\sl L" rjust at K2.L
   arrow <- from K2.LM left 0.25; "\sl LM" wid 0.18 rjust
   arrow <- from K2.LB left 0.25; "\sl LB" rjust
   "\sl S" rjust at K2.S
   thicklines_ ] with .K2.F at J1.F+(1.2,0)
 J3: jack(L,RLS) with .F at J2.K2.F+(0.4,0)
   thinlines_
   "\sl L" ljust at J3.L
   "\sl S" ljust at J3.S
   thicklines_
 J4: jack(L,RLBLMLMS) with .F at J3.F+(1.1,0)
   thinlines_
   "\sl L1" ljust at J4.L1
   arrow <- right 0.3 from J4.LM1; "\sl LM1" ljust
   "\sl L2" ljust at J4.L2
   arrow <- right 0.3 from J4.LM2; "\sl LM2" wid 0.2 ht 11pt__ ljust
   "\sl S" ljust at J4.S
   "\sl L" ljust at J4.L
   arrow <- right 0.2 from J4.LB ; "\sl LB" ljust
   right_
 J5: jack(,RSBSMLB) with .F at J4.F+(1.95,0)
   thinlines_
   "\sl L" rjust at J5.L
   "\sl S" rjust at J5.S
   "\sl S1" rjust at J5.S1
   arrow <- left 0.3 from J5.SM1; "\sl SM1" rjust
   spline 0.5 <- left 0.25 then left 0.1 down 0.05 from J5.LB; "\sl LB" rjust
   spline 0.5 <- left 0.25 then left 0.1 up   0.05 from J5.SB; "\sl SB" rjust
   thicklines_

  `"\tt jack"' ht 0.15 below at J1.s+(0,-0.15)
  `"\tt jack(,LMBS)"' below at (J2,last "")
  `"\tt ..(L,RLS)"' below at (J3,last "")
  `"\tt ..(L,RLBLMLMS)"' below at (J4,last "")
  `"\tt ..(,RSBSMLB)"' below at (J5,last "")
] with .nw at P.sw #+ (0,0.1)

.PE
