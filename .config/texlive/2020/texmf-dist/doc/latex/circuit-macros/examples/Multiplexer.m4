.PS
# `Multiplexer.m4'
log_init

  ifmpost(`command "verbatimtex {\sf etex"',
  `ifpostscript(,
  `command "{\sf"')')

  right_

  Mux(4,M1)
  `"\tt Mux(4,M1)"' at last [].s below
  `"\sl In0"' at last [].In0.end rjust wid 14bp__
  `"\sl In1"' at last [].In1.end rjust
  `"\sl In2"' at last [].In2.end rjust
  `"\sl In3"' at last [].In3.end rjust
  `"\sl Out"' at last [].Out.end above
  `"\sl Sel"' at last [].Sel.end ljust above
  left_; Mux(4,,LNOE) with .c at last [].c+(0.9,0)
  `"\tt left\_; Mux(4,{,}LNOE)"' at last [].s +(0,-20bp__) ht 10bp__
  `"\sl In0"' at last [].In0.end above
  `"\sl NOE"' at last [].NOE.end +(4bp__,0) below
  `"\sl Out"' at last [].Out.end below
  `"\sl Sel"' at last [].Sel.end rjust below
  right_; Mux(4,,OEBN2) with .c at last [].c+(1.4,0)
  `"\tt Mux(4,{,}OEBN2)"' at last [].s below
  `"\sl Sel0"' at last [].Sel0.end rjust
  `"\sl Sel1"' at last [].Sel1.end ljust
  `"\sl In0"' at last [].In0.end rjust
  `"\sl In3"' at last [].In3.end rjust
  `"\sl OE"' at last [].OE.end rjust
   down_; Mux(8,,L3,,28*L_unit) with .c at last [].c+(1.7,0)
  `"\tt down\_; Mux(8,{,}L3,{,}28*L\_unit)"' at last [].s below
  `"\sl Sel0"' at last [].Sel0.end rjust
  `"\sl Sel2"' at last [].Sel2.end rjust below
  `"\sl In0"' at last [].In0.end rjust
  `"\sl In7"' at last [].In7.end ljust wid 14bp__

ifmpost(`command "verbatimtex } etex"',
`ifpostscript(,
`command "}"')')

.PE
