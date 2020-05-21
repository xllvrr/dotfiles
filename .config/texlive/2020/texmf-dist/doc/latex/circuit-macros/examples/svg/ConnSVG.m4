.PS
# `ConnSVG.m4'
cct_init(svg_font(sans-serif,10.5bp__))

T:[
 S1: tstrip(U)
  thinlines_
  arrow <- left 0.15 from S1.L1; "L1" rjust
  arrow <- left 0.15 from S1.L4; "L4" wid 0.2 rjust
  "..." at (0.5 between last "" and 2nd last "")+(-0.15,0.02)
  arrow <- right 0.25 from S1.R1; "R1" ljust
  arrow <- right 0.25 from S1.R4; "R4" ljust
  "..." at (0.5 between last "" and 2nd last "")+(0.15,0.02)
  arrow <- right 0.15 up 0.10 from S1.T1; "T1" ljust
  arrow <- right 0.15 up 0.10 from S1.T4; "T4" ljust
  "..." at (0.5 between last "" and 2nd last "")+(0.15,0.02)
  thicklines_
  CS1: "`tstrip(U)'" at S1.s+(0,-0.15)
 S2: tstrip(R,5,DO;wid=1.0;ht=0.25) with .sw at S1.se+(0.7,0.15)
  thinlines_
  arrow <- up 0.2 right 0.1 from S2.T1; "T1" above 
  arrow <- up 0.2 right 0.1 from S2.T5; "T5" above 
  "..." at 0.5 between last "" and 2nd last "" above
 CS2: `"tstrip(R,5,"' ljust \
      `"  DO;wid=1.0;ht=0.25)"' ljust at S2.sw+(-0.1,-0.2)
]

C: [
  C1: ccoax
    `"ccoax "' at C1.s below
    thinlines_
    arrow <- up 0.1 right 0.1 from C1.C.ne; "C" ljust
    arrow <- down 0.05 right 0.1 from C1.S.e; "S" wid 0.1 ljust
    thicklines_
  C2: ccoax(at C1+(0,0.3),F)
    `"ccoax(,F)"' wid 0.65 at C2.ne ljust 
  ] with .C1.sw at T.S2.se+(0.6,0.0)

Y: [
  tconn(,O)
  {`"tconn(,O)"' at last line.c+(0,-0.2) wid 43 pt__ }
  move to Here+(0.3,0)
  P1: tconn(,>)
  {`"(,&#x3E;)"' at last line.c+(0,-0.2)}
  move to P1.end+(0.3,0)
  tconn(,>>)
  {`"(,&#x3E;&#x3E;)"' at last line.c+(0,-0.2)}
  move to P1.start+(0,linewid)
  P3: tconn(,<)
  {`"tconn(,&#x3C;)"' at last line.c+(0,-0.2)}
  move to P3.end+(0.3,0)
  tconn(,<<)
  {`"(,&#x3C;&#x3C;)"' at last line.c+(0,-0.2)}

] with .sw at (C.e.x-0.3,T.s.y)

B: [
  tbox(V`'svg_sub(1))
  { `"tbox'(V`'svg_sub(1))" wid 47bp__ with .nw at last [].sw+(0,-4bp__) }
  tbox(V`'svg_sub(2),,,<) with .sw at last [].se+(0.75,0)
  { `"tbox'(V`'svg_sub(2)`,,,&#x3C;)"' at last [].s below }
  tbox(V`'svg_sub(3),,,<>) with .sw at last [].se+(0.75,0)
  { `"tbox'(V`'svg_sub(3)`,,,&#x3C;&#x3E;)"' at last [].s below }
] with .nw at T.sw+(0,-0.2)

 command "</g>" # end font
.PE
