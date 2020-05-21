.PS
# `Blogix.m4'
log_init

linewid = 0.4
 
#                             A more complex expression
  F: Autologix(And(Or(x3,x1,~x0),Nor(Or(x3,Not(x2),~x1,x0),
               And(x4,Or(x2,x1,~x0),Xor(x2,~x1)))))

  Loopover_(`v_', `"$v_$" at F.In`'v_ above', x0,x1,x2,x3,x4)
  "\sl Out" ljust at F.Out
  `"{\tt \shortstack[l]{Autologix(And(Or(x3,x1,\~{}x0),\\
     \quad Nor(Or(x3,Not(x2),\~{}x1,x0),And(x4,Or(x2,x1,\~{}x0),%\
           Xor(x2,\~{}x1)))))}}"' wid 440pt__ ht 20pt__ \
      with .w at F.sw+(0,-0.25)
#                             Inputs on the left with vert offset in L_units
define(`Doff',LV;offset=25)
  G: Autologix(And(Or(x3,x1,~x0),Nor(Or(x3,Not(x2),~x1,x0),
               And(x4,Or(x2,x1,~x0),Xor(x2,~x1)))),
     Doff*L_unit) \
     with .sw at F.Out+(0.2,-0.7)

  Loopover_(`v_', `"$v_$" wid 11pt__ at G.In`'v_ rjust ', x0,x1,x2,x3,x4)
  "\sl Out" ljust at G.Out
  "{\tt ...,Doff*L\_unit)}" at G.s+(0,-10pt__)

#                             A more complex expression
define(`Eoff',R)
 E: Autologix(And(Or(x3,x1,~x0),Nor(Or(x3,Not(x2),~x1,x0),
               And(x4,Or(x2,x1,~x0),Xor(x2,~x1))));
             And(~x0,Nand(~x1,x3)),
        Eoff) \
    with .nw at F.sw+(0,-1.5)

  Loopover_(`v_', `"$v_$" at E.In`'v_ above ', x0,x1,x2,x3,x4)
  "\sl Out1" ljust at E.Out1
  "\sl Out2" ljust at E.Out2
  "{\tt ...,Eoff)}" at E.s+(0,-10pt__)

#                             Inputs on the left with vert offset in L_units
define(`Foff',LRV;offset=17)
 D: Autologix(And(Or(x3,x1,~x0),Nor(Or(x3,Not(x2),~x1,x0),
               And(x4,Or(x2,x1,~x0),Xor(x2,~x1)))),
     Foff*L_unit) \
    with .sw at E.Out1+(0.2,-0.5)

  Loopover_(`v_', `"$v_$" wid 11pt__ at D.In`'v_ rjust ', x0,x1,x2,x3,x4)
  "\sl Out" ljust at D.Out
  "{\tt ...,Foff)}" at D.s+(0,-10pt__)

#                             Here's how to include an arbitrary circuit
#                             that isn't one of the standard gates.
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
#                             will be invoked, with a preceding _:
define(`SRff',`_AutoGate(SR,$@)')

#                             You're done.  Here is an example:
  F: Autologix(Or(y,SRff(And(x,y),Nand(x,y)))) \
    with .nw at 2nd last [].sw+(0,-0.5)

  "\sl Out" at F.Out ljust
  "$x$" at F.Inx above
  "$y$" at F.Iny above
  `"{\tt Autologix(Or(y,SRff(And(x,y),Nand(x,y))))}"' wid 267pt__ ht 7pt__ \
    with .w at last [].sw+(0,-10pt__)

.PE
