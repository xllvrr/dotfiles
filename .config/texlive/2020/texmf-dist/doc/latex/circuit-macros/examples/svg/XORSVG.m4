.PS
# `XORSVG.m4'
# Realizations of the XOR function
log_init
scale = 2.54

define(`gatelineth',1.6) # gate line thickness
define(`lineth',0.8)     # connection thickness

define(`labels',`
 "svg_it(A)" at last [].InA above wid 0.25
 "svg_it(B)" at last [].InB above wid 0.25
 "svg_it(A) O`'svg_sup(+,100,0,-1.4ex) svg_it(B)" at last [].Out ljust wid 1.2
#"svg_it(A) svg_font(Latin,,,"O")`'svg_sup(+,100,0,-1.4ex) svg_it(B)" at last [].Out ljust
')

#                           single gate
  XOR: Autologix(Xor(A,B))
  labels

#                           canonical form
  Autologix(Or(And(A,Not(B)),And(Not(A),B))) \
    with .nw at last [].sw+(0,-1)
  labels

#                           mixed gates
  Autologix(And(Nand(A,B),Or(A,B))) \
    with .nw at last [].nw+(8,0)
  labels

#                           nand realization
  Autologix(Nand(Nand(Nand(A,A),B),Nand(Nand(B,B),A))) \
    with .nw at 2nd last [].sw+(0,-1)
  labels

#                           nor realization
  Autologix(Nor(Nor(Nor(A,A),Nor(B,B)),Nor(A,B))) \
    with .nw at last [].nw+(8,0)
  labels

# These functions contain topologies in common so write a macro
define(`customAB',
   `S: Autologix(N`$1'(N`$1'(A,B1),N`$1'(B1,B)),N) with .Out at Here
    line thick lineth from S.In2 to S.In3; InAB: dot(at last line.c)
    line thick lineth from InAB left 2*L_unit
    TN: Autologix(N`$1'(A,B)) with .Out at Here
    line thick lineth from TN.InA up 3*L_unit; InA: Here
    line thick lineth from TN.InB up 3*L_unit; InB: Here
    line thick lineth from S.In4 to (InB,S.In4) then to (InB,TN.In2); dot
    line thick lineth from S.In1 to (InA,S.In1); dot')

  [ customAB(and)
    Out: S.Out
    ] with .nw at 2nd last [].sw+(0,-1)
  labels

  [ linethick = gatelineth
    H: NOR_gate(2); linethick = lineth
    L:dot(at H.w-(2*L_unit,0))
    line from H.In1 to (L,H.In1) then to (L,H.In2) then to H.In2
    line from L left 2*L_unit
    customAB(or)
    Out: H.Out
   ] with .nw at last [].nw+(8,0)
  labels

.PE
