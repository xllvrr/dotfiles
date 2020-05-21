.PS
# `ABlogix.m4'
log_init

linewid = 0.4
 
#                             A more complex expression
  F: Autologix(And(Or(x3,x1,~x0),Nor(Or(x3,Not(x2),~x1,x0),
               And(x4,Or(x2,x1,~x0),Xor(x2,~x1)))))

  Loopover_(`v_', `"$v_$" at F.In`'v_ above', x0,x1,x2,x3,x4)
  "\sl Out" ljust at F.Out
  `"{\tt \shortstack[l]{Autologix(And(Or(x3,x1,\~{}x0),\\
     \quad Nor(Or(x3,Not(x2),\~{}x1,x0),And(x4,Or(x2,x1,\~{}x0),\
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
               And(x4,Or(x2,x1,~x0),Xor(x2,~x1)))),
        Eoff) \
    with .nw at F.sw+(0,-1.35)

  Loopover_(`v_', `"$v_$" at E.In`'v_ above ', x0,x1,x2,x3,x4)
  "\sl Out" ljust at E.Out
  "{\tt ...,Eoff)}" at E.s+(0,-10pt__)

#                             Inputs on the left with vert offset in L_units
define(`Foff',LRV;offset=17.25)
 D: Autologix(And(Or(x3,x1,~x0),Nor(Or(x3,Not(x2),~x1,x0),
               And(x4,Or(x2,x1,~x0),Xor(x2,~x1)))),
     Foff*L_unit) \
    with .sw at E.Out1+(0.2,-0.51)

  Loopover_(`v_', `"$v_$" wid 11pt__ at D.In`'v_ rjust ', x0,x1,x2,x3,x4)
  "\sl Out" ljust at D.Out
  "{\tt ...,Foff*L\_unit)}" at D.s+(0,-10pt__)


.PE
