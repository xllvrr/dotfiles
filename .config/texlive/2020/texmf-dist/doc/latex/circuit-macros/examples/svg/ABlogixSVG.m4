.PS
# `ABlogixSVG.m4'
  log_init(svg_font(sans-serif,10.5bp__))
  linewid = 0.4
 
#                             A more complex expression
  F: Autologix(And(Or(x3,x1,~x0),Nor(Or(x3,Not(x2),~x1,x0),
               And(x4,Or(x2,x1,~x0),Xor(x2,~x1)))))

  Loopover_(`v_', `"svg_it(v_)" wid 11bp__ at F.In`'v_ above', x0,x1,x2,x3,x4)
  "svg_it(Out)" ljust at F.Out
  "svg_tt(`Autologix(And(Or(x3,x1,~x0),')" \
      wid 201bp__ with .w at F.sw+(0,-0.25)
  "svg_tt(`Nor(Or(x3,Not(x2),~x1,x0),And(x4,Or(x2,x1,~x0),')" \
      wid 343bp__ with .w at last "".w+(65bp__,-16bp__)
  "svg_tt(`Xor(x2,~x1)))))')" \
      wid 105bp__ with .w at last "".w+(0,-16bp__)
#                             Inputs on the left with vert offset in L_units
define(`Doff',LV;offset=25)
  G: Autologix(And(Or(x3,x1,~x0),Nor(Or(x3,Not(x2),~x1,x0),
               And(x4,Or(x2,x1,~x0),Xor(x2,~x1)))),
     Doff*L_unit) \
     with .sw at F.Out+(0.2,-0.7)

  Loopover_(`v_', `"svg_it(v_)" wid 11pt__ at G.In`'v_ rjust ', x0,x1,x2,x3,x4)
  "svg_it(Out)" wid 22bp__ ljust at G.Out
  "svg_tt(`...,'Doff*L`'_unit))" at G.s+(0,-10pt__)

#                             A more complex expression
define(`Eoff',R)
 E: Autologix(And(Or(x3,x1,~x0),Nor(Or(x3,Not(x2),~x1,x0),
               And(x4,Or(x2,x1,~x0),Xor(x2,~x1)))),
        Eoff) \
    with .nw at F.sw+(0,-1.5)

  Loopover_(`v_', `"svg_it(v_)" wid 11bp__ at E.In`'v_ above ', x0,x1,x2,x3,x4)
  "svg_it(Out)" ljust at E.Out
  "svg_tt(...`,'Eoff))" at E.s+(0,-10pt__)

#                             Inputs on the left with vert offset in L_units
define(`Foff',LRV;offset=17)
 D: Autologix(And(Or(x3,x1,~x0),Nor(Or(x3,Not(x2),~x1,x0),
               And(x4,Or(x2,x1,~x0),Xor(x2,~x1)))),
     Foff*L_unit) \
    with .sw at E.Out1+(0.2,-0.5)

  Loopover_(`v_', `"svg_it(v_)" wid 11pt__ at D.In`'v_ rjust ', x0,x1,x2,x3,x4)
  "svg_it(Out)" ljust at D.Out
  "svg_tt(...`,'Foff*L`'_unit))" at D.s+(0,-10pt__)


  command "</g>" # end font
.PE
