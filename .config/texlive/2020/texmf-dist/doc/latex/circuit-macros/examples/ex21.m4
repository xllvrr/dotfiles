.PS
# ex21.m4
log_init
  iflatex(`textoffset = 1bp__; ifpsfrag(,`latexcommand({\sf)') ')

dy = 0.2
ddy = 1.8*dy

D: FlipFlop(D)
  `"\tt FlipFlop(D)"' at last [].s+(0,-ddy) above
T: FlipFlop( T) with .Chip.sw at last [].se + (0.4,0)
  `"\tt FlipFlop(T)"' at last [].s+(0,-ddy) above
RS: FlipFlop(RS) with .Chip.sw at last [].se + (0.4,0)
  `"\tt FlipFlop(RS)"' at last [].s+(0,-ddy) above
JK: FlipFlop(JK) with .Chip.sw at last [].se + (0.4,0)
  `"\tt FlipFlop(JK)"' at last [].s+(0,-dy) above

# Test 3: synchronous 3-bit counter
define(`counterFF',``$1':FlipFlop(JK) `$2'
  "\sf\scriptsize `$1'" at `$1'.Chip.sw below ljust
  "\sf\scriptsize $`'1$" at `$1'.PinCLR.end above
  "\sf\scriptsize $`'1$" at `$1'.PinPR.end below')
   
[
right_
  counterFF(FF0)
  counterFF(FF1,with .Chip at FF0.Chip+(-28*L_unit,0))
  counterFF(FF2,with .Chip at FF1.Chip+(-28*L_unit,0))
  "\sf\scriptsize $1$sp_" at FF0.PinJ.end rjust
  "\sf\scriptsize $1$sp_" at FF0.PinK.end rjust
Dc: FF2.Chip.sw+(-9*L_unit,-7*L_unit)
Bot: Dc+(0,-3*L_unit)

left_
AndG: AND_gate at FF1.Chip.nw+(4*L_unit,12*L_unit)
right_

   line from FF2.PinCK.end left 3*L_unit
   line to (Here,Dc); dot
   line from FF1.PinCK.end left 3*L_unit
   line to (Here,Dc); dot
   line from FF0.PinCK.end left 3*L_unit
   line to (Here,Dc) then to Dc
   "\sf\scriptsize $D_C$ sp_" rjust

   line from FF2.PinK.end to FF2.PinJ.end; dot
   line to (Here,AndG.Out) then to AndG.Out

   line from FF1.PinK.end to FF1.PinJ.end; dot
   line to (Here,FF1.PinCLR.end+(0,3*L_unit))
   line to (AndG.In2+(6*L_unit,0),Here) then to AndG.In2+(6*L_unit,0); dot

   line from FF0.PinQ.end right 0.1; dot
   line from AndG.In2 to (Here,AndG.In2) then to (Here,Bot); "$D_{00}$" below

   line right 0.1 from FF1.PinQ.end; dot
   line from AndG.In1 to (Here,AndG.In1) then to (Here,Bot); "$D_{01}$" below

   line right 0.1 from FF2.PinQ.end
   line to (Here,Bot); "$D_{02}$" below
  ] with .n at 0.5<2nd[].s,3rd[].s> - (0,0.4)

  iflatex(ifpsfrag(,`latexcommand(})'))
.PE
