.PS
# `Alogix.m4'
log_init
 
#                             A modest expression in default form
A: Autologix(
    Nand(And(Or(A,C),Or(B,~C),Or(~A,B,C)),Ck);
    Nand(~A,B)@with .n at last [].s+(0,-2bp__))
    move left 10bp__ from A.InCk
    "\sl Out1" at A.Out1 ljust
    "\sl Out2" at A.Out2 ljust
    Loopover_(`v_', `"$v_$" at A.In`'v_ above ', A,B,C,Ck)
 `"\shortstack[l]{
  \tt Autologix( \\ \tt \quad
     Nand(And(Or(A,C),Or(B,\~{}C),Or(\~{}A,B,C)),Ck);\\ \tt \quad
     Nand(\~{}A,B))@with .n at last [].s+(0,-2bp\_\_))}"'\
     wid 288bp__ ht 32bp__ with .nw at A.sw+(0,-0.10)

#                             Draw a tree of gates only.  The ~ has been
#                             replaced by NOT gates.
B: Autologix(Or(And(B,Not(C)),And(Not(A),B,C)),N) \
  with .sw at A.e+(1.3,-0.5)
  "{\sl Out}" at B.Out above ljust
  `"\shortstack[l]{\tt B: Autologix( \\ \tt \
     Or(And(B,Not(C)),And(Not(A),B,C)),N)}"' \
    wid 242pt__ ht 20pt__ at B.s+(0,-0.2)
  for_(1,4,1,`"{\sf\small\sl B.In`'m4x}" at B.In`'m4x rjust')
  "{\sf\small\sl B.In5}" at B.In5+(0,-1.5bp__) rjust

#                             Here is how to include an arbitrary circuit
#                             that is not one of the standard gates.
#                             First, define the circuit with a name ending
#                             in _gate.  Make sure its inputs are on the left
#                             and named In1, In2, ... and the output Out
#                             is on the right.
define(`SR_gate',`[
  S: NOR_gate
  R: NOR_gate at S+(0,-L_unit*(AND_ht+4))
     w = (S.Out.x-R.In1.x)/3
     v = 2*L_unit
     line right_ dimen_/2 from S.Out
  Out: Here
     TR: R.In1-(v,0)
     line from S.Out+(v,0) down w*3/2 then left S.Out.x-TR.x+v down w \
        then to TR then to R.In1
     TS: S.In2-(v,0);
     line from R.Out right v then up w*3/2 then left R.Out.x-TS.x+v up w \
        then to TS then to S.In2
  In1: S.In1
  In2: R.In2 ]')
#                             Now define the function by which the circuit
#                             will be invoked:
define(`SRff',`_AutoGate(SR,$@)')

#                             You are done.  Here is an example:
G: [ 
  F: Autologix(SRff(And(x,y),Nand(x,y)),LRV)

  "$x$" at F.Inx rjust
  "$y$" at F.Iny rjust
  "\sl Out" at F.Out ljust
  ] with .sw at A.n+(0.5,-0.25)
  `"{\tt Autologix(SRff(And(x,y),Nand(x,y)),LRV)}"' wid 253pt__ ht 7pt__ \
    with .w at last [].sw+(0,-10pt__)

undefine(`extras')
#efine(`extras')

ifdef(`extras',`
  Q1: Autologix(Nor(Nor(A,And(B,C)),Nand(Not(B),D))) \
    with .nw at A.sw+(0,-61bp__)
  Loopover_(`x',`"\sf x" at last [].In`'x above',A,B,C,D)

  `"\shortstack[l]{%
    \tt Q1: Autologix(Nor(Nor(A,And(B,C)),Nand(Not(B),D)),<options>)\\
    \tt Loopover\_(`x',`\"\sf x\" at last [].In`'x above',A,B,C,D)}"' \
      wid 350bp__ ht 20bp__ with .nw at Q1.sw+(0,-10pt__)

  Q2: Autologix(Nor(Nor(A,And(B,~C)),Nand(Not(B),D)),V) \
   with .nw at last "".sw+(0,-14bp__)
  Loopover_(`x',`"\sf x" at last [].In`'x above',A,B,C,D)
  "\sf V" at last [].se above rjust

  Q3: Autologix(Nor(Nor(A,And(B,C)),Nand(Not(B),D)),R) \
   with .nw at last [].sw+(0,-0.2)
  Loopover_(`x',`"\sf x" at last [].In`'x above',A,B,C,D)
  "\sf R" at last [].se above rjust

  Q4: Autologix(Nor(Nor(A,And(B,C)),Nand(Not(B),D)),RV) \
   with .nw at last [].sw+(0,-0.2)
  Loopover_(`x',`"\sf x" at last [].In`'x above',A,B,C,D)
  "\sf RV" at last [].se above rjust

  Autologix(Nor(Nor(A,And(B,C)),Nand(Not(B),D)),LRV) \
   with .Out at Q4.Out+(3.5,0)
  Loopover_(`x',`"\sf x" at last [].In`'x rjust',A,B,C,D)
  "\sf LRV" at last [].se above rjust

  Autologix(Nor(Nor(A,And(B,C)),Nand(Not(B),D)),LR;offset=-L_unit*1.5) \
   with .Out at Q3.Out+(3.5,0)
  Loopover_(`x',`"\sf x" at last [].In`'x rjust',A,B,C,D)
  "\sf LR" at last [].se above rjust

  Autologix(Nor(Nor(A,And(B,~C)),Nand(Not(B),D)),LV;offset=L_unit*2) \
   with .Out at Q2.Out+(3.5,0)
  Loopover_(`x',`"\sf x" at last [].In`'x rjust',A,B,C,D)
  "\sf LV" at last [].se above rjust

  Autologix(Nor(Nor(A,And(B,C)),Nand(Not(B),D)),L) \
   with .Out at Q1.Out+(3.5,0)
  Loopover_(`x',`"\sf x" at last [].In`'x rjust',A,B,C,D)
  "\sf L" at last [].se above rjust
')

.PE
