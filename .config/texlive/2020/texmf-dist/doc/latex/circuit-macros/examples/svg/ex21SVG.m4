.PS
# ex21SVG.m4
log_init(svg_font(sans-serif,11bp__))

dy = 0.2
ddy = 1.8*dy
textht = textht*0.9

D: FlipFlop(D)
  line right 5bp__ at last [] . 1nd last ""+(-7bp__,4bp__)
T: FlipFlop(T) with .Chip.sw at last [].se + (0.4,0)
  line right 5bp__ at last [] . 1nd last ""+(-7bp__,4bp__)
RS: FlipFlop(RS) with .Chip.sw at last [].se + (0.4,0)
  line right 5bp__ at last [] . 1nd last ""+(-7bp__,4bp__)
JK: FlipFlop(JK) with .Chip.sw at last [].se + (0.4,0)
  line right 5bp__ at last [] . 2nd last ""+(-7bp__,4bp__)
  `"FlipFlop(JK)"' at JK.s below
  `"FlipFlop(RS)"' at (RS.s,JK.s) below
  `"FlipFlop(T)"' at (T.s,JK.s) below
  `"FlipFlop(D)"' at (D.s,JK.s) below

# Test 3: synchronous 3-bit counter
define(`counterFF',``$1':FlipFlop(JK) `$2'
  line right 5bp__ at last [] . 2nd last ""+(-7bp__,4bp__)
  "`$1'" at `$1'.Chip.sw-(3bp__,0) below ljust
  "1" at `$1'.PinCLR.end above
  "1" at `$1'.PinPR.end below')
   
[
right_
  counterFF(FF0)
  counterFF(FF1,with .Chip at FF0.Chip+(-28*L_unit,0))
  counterFF(FF2,with .Chip at FF1.Chip+(-28*L_unit,0))
  "1" at FF0.PinJ.end rjust
  "1" at FF0.PinK.end rjust
Dc: FF2.Chip.sw+(-9*L_unit,-7.5*L_unit)
Bot: Dc+(0,-3*L_unit)

left_
GAnd: AND_gate at FF1.Chip.nw+(4*L_unit,12*L_unit)
right_

   line from FF2.PinCK.end left 3*L_unit
   line to (Here,Dc); dot
   line from FF1.PinCK.end left 3*L_unit
   line to (Here,Dc); dot
   line from FF0.PinCK.end left 3*L_unit
   line to (Here,Dc) then to Dc
   "svg_it(D`'svg_sub(C))" rjust

   line from FF2.PinK.end to FF2.PinJ.end; dot
   line to (Here,GAnd.Out) then to GAnd.Out

   line from FF1.PinK.end to FF1.PinJ.end; dot
   line to (Here,FF1.PinCLR.end+(0,3*L_unit))
   line to (GAnd.In2+(6*L_unit,0),Here) then to GAnd.In2+(6*L_unit,0); dot

   line from FF0.PinQ.end right 0.1; dot
   line from GAnd.In2 to (Here,GAnd.In2) then to (Here,Bot)
   "svg_it(D`'svg_sub(00))" below

   line right 0.1 from FF1.PinQ.end; dot
   line from GAnd.In1 to (Here,GAnd.In1) then to (Here,Bot)
   "svg_it(D`'svg_sub(01))" below

   line right 0.1 from FF2.PinQ.end
   line to (Here,Bot); "svg_it(D`'svg_sub(02))" below
  ] with .n at 0.5<2nd[].s,3rd[].s> - (0,0.4)

 command "</g>" # end font
.PE
