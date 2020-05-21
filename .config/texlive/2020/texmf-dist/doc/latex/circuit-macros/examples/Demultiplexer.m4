.PS
# `Demultiplexer.m4'
log_init

  ifmpost(`command "verbatimtex {\sf etex"',
  `ifpostscript(,
  `command "{\sf"')')

  right_

  Demux(4,DM1)
  `"\tt Demux(4,DM1)"' at last [].s below
  `"\sl Out0"' at last [].Out0.end +(6bp__,6bp__)
  `"\sl Out3"' at last [].Out3.end +(6bp__,-6bp__)
  `"\sl In"' at last [].In.end rjust wid 11bp__
  `"\sl Sel"' at last [].Sel.end ljust above
  left_; Demux(4,,LOE) with .c at last [].c+(1.2,0)
  `"\tt left\_; Demux(4,{,}LOE)"' at last [].s + (0,-20bp__) ht 10bp__
  `"\sl Sel"' at last [].Sel.end rjust
  `"\sl Out0"' at last [].Out0.end +(-6bp__,6bp__)
  `"\sl OE"' at last [].OE.end ljust
  `"\sl In"' at last [].In.end+(0,5bp__) ljust
  right_; Demux(4,,NOEBN2) with .c at last [].c+(1.2,0)
  `"\tt (4,{,}NOEBN2)"' at last [].s below
  `"\sl Sel0"' at last [].Sel0.end rjust
  `"\sl Sel1"' at last [].Sel1.end ljust
  `"\sl Out0"' at last [].Out0.end +(5bp__,6bp__)
  `"\sl Out3"' at last [].Out3.end +(5bp__,6bp__)
  `"\sl NOE"' at last [].NOE.end rjust
  `"\sl In"' at last [].In.end above
   down_; Demux(8,,L3,,28*L_unit) with .c at last [].c+(1.8,0)
  `"\tt down\_; Demux(8,{,}L3,{,}28*L\_unit)"' at last [].s+(0,-15bp__) \
    ht 10bp__ wid 170bp__
  `"\sl Sel0"' at last [].Sel0.end rjust
  `"\sl Sel2"' at last [].Sel2.end rjust below
  `"\sl Out0"' at last [].Out0.end rjust
  `"\sl Out7"' at last [].Out7.end ljust
  `"\sl In"' at last [].In.end rjust

ifmpost(`command "verbatimtex } etex"',
`ifpostscript(,
`command "}"')')

.PE
