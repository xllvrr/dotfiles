.PS
# `Conn.m4'
cct_init

T:[
 ifelse(ifmpost(T)`'ifpostscript(T),,`command "{\sf"')
 S1: tstrip(U)
  thinlines_
  arrow <- left 0.15 from S1.L1; "L1" rjust
  arrow <- left 0.15 from S1.L4; "L4" wid 0.2 rjust
  "$\vdots$" at (0.5 between last "" and 2nd last "")+(-0.15,0.02)
  arrow <- right 0.25 from S1.R1; "R1" ljust
  arrow <- right 0.25 from S1.R4; "R4" ljust
  "$\vdots$" at (0.5 between last "" and 2nd last "")+(0.15,0.02)
  arrow <- right 0.15 up 0.10 from S1.T1; "T1" ljust
  arrow <- right 0.15 up 0.10 from S1.T4; "T4" ht 11 pt__ ljust
  "$\vdots$" at (0.5 between last "" and 2nd last "")+(0.15,0.02)
  thicklines_
  CS1: "`\tt tstrip(U)'" at S1.s+(0,-0.15)
 S2: tstrip(R,5,DO;wid=1.0;ht=0.25) with .sw at S1.se+(0.8,0.15)
  thinlines_
  arrow <- up 0.2 right 0.1 from S2.T1; "T1" above 
  arrow <- up 0.2 right 0.1 from S2.T5; "T5" above 
  "$\cdots$" at 0.5 between last "" and 2nd last "" above
 CS2: `"\tt tstrip(R,5,"' ht 0.1 ljust \
      `"\tt $\;\;$DO;wid=1.0;ht=0.25)"' ljust at S2.sw+(-0.1,-0.2)
  ifelse(ifmpost(T)`'ifpostscript(T),,`command "}"')
]

C: [
  C1: ccoax
    `"\tt ccoax\vphantom{(}"' ht 11 pt__ at C1.s below
    thinlines_
    arrow <- up 0.1 right 0.1 from C1.C.ne; "C" ljust
    arrow <- down 0.05 right 0.1 from C1.S.e; "S" wid 0.1 ht 11pt__ ljust
    thicklines_
  C2: ccoax(at C1+(0,0.3),F)
    `"\tt ccoax(,F)"' ht 11 pt__ wid 0.65 at C2.ne ljust 
  ] with .C1.sw at T.S2.se+(0.6,0.0)

Y: [
  tconn(,O)
  {`"\tt tconn(,O)"' at last line.c+(0,-0.2) wid 43 pt__ }
  move to Here+(0.3,0)
  P1: tconn(,>)
  {`"\tt (,>)"' at last line.c+(0,-0.2)}
  move to P1.end+(0.3,0)
  tconn(,>>)
  {`"\tt (,>{}>)"' at last line.c+(0,-0.2)}
  move to P1.start+(0,linewid)
  P3: tconn(,<)
  {`"\tt tconn(,<)"' at last line.c+(0,-0.2)}
  move to P3.end+(0.3,0)
  tconn(,<<)
  {`"\tt (,<{}<)"' at last line.c+(0,-0.2)}

] with .sw at (C.e.x-0.4,T.s.y)

B: [
  tbox(V_2)
  { `"\tt tbox(V\_2)"' at last [].sw below ljust }
  tbox(V_1,,,<) with .sw at last [].se+(0.75,0)
  { `"\tt tbox(V\_1,{,},<)"' at last [].s below }
  tbox(V_1,,,<>) with .sw at last [].se+(0.75,0)
  { `"\tt tbox(V\_1,{,},<>)"' at last [].s below }
] with .nw at T.sw+(0,-0.2)


.PE
