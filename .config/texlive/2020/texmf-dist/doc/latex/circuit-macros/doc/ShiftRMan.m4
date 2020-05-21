.PS
# ShiftR.m4
log_init

  iflatex(`textoffset = 1bp__; ifpsfrag(,`latexcommand({\sf)') ')

define(`lg_plen',3)

define(`customFF',`FlipFlopX(wid 10*L_unit ht FF_ht*L_unit,,
    :S;NE:CK;:R, N:PR, :Q;;ifelse(`$1',1,:lg_bartxt(Q)), N:CLR) ')

  F0: customFF(1)

  BUFFER_gate(,N) with .Out at F0.W1.end
    line left 2*L_unit from last [].In1
  T: dot
    reversed(`NOT_gate',left 10*L_unit)
  Serial: "\scriptsize\shortstack[r]{SERIAL\\ INPUT}" rjust
    line from T to (T,F0.W3) then to F0.W3.end

  NCLR: NOT_gate(right T.x-Serial.x from (Serial,F0.S1.end),N)
    "$\overline{\hbox{\scriptsize CLEAR}}$" at NCLR.start rjust 

  CLK: NOT_gate(right T.x-Serial.x from NCLR.start+(0,-BUF_ht*3/2*L_unit))
    "\scriptsize CLOCK" at CLK.start rjust

for_(1,4,1,`
  F`'m4x: customFF(eval(m4x!=4)) with .W3.end at F`'eval(m4x-1).E3.end
  ')

  "\scriptsize OUTPUT" at F4.E1.end ljust
  line from NCLR.end to F4.S1.end

  down_
for_(0,4,1,`
  line from F`'m4x.W2.end down F0.W2.y-CLK.y
  ifelse(eval(m4x!=4),1,`dot',`line to CLK.end')
  N`'m4x: NAND_gate with .Out at F`'m4x.N1.end 
    line up 2*L_unit from N`'m4x.In2
    { line up 6*L_unit from N`'m4x.In1
      "\scriptsize PR`'eval(4-m4x)" rjust }
    ifelse(eval(m4x!=4),1,
     `dot; dot(at F`'m4x.S1.end)',
     `line to (Serial,Here)
      "\scriptsize\shortstack[r]{PRESET\\ ENABLE}" wid 0.4 rjust ')
  ')

  iflatex(ifpsfrag(,`latexcommand(})'))
.PE
