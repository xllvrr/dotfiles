.PS
# `Buffer.m4'
log_init

  bd = dimen_*3/4
  esep = dimen_*3
[
  B1: BUFFER_gate(,,bd,bd)
  thinlines_
  { arrow <- left 0.2 up 0.2 from B1.In1; "\sl In1" wid 18bp__ rjust
    move left 18bp__
   `"\tt bd = dimen\_*3/4" ljust "\tt BUFFER\_gate(,{,}bd,bd)"' ljust \
     at (last "".w,B1.s +(0,-25bp__))
    arrow <- up 0.2 from B1.NE; "\sl NE" rjust
    arrow <- up 0.15 right 0.15 from B1.Out; "\sl Out" above
    arrow <- down 0.2 from B1.SE; "\sl SE" rjust
    arrow <- right 0.3 down 0.2 from B1.C; "\sl C" ljust }
  thicklines_
  B2: BUFFER_gate(,N,bd,bd,NN) with .sw at B1.se+(esep,0)
  thinlines_
  { arrow <- left 0.2 up 0.2 from B2.In1; "\sl In1" rjust
    arrow <- right 0.2 up 0.2 from B2.N_NE1 ; "\sl N\_NE1" ljust ht 11bp__
    arrow <- right 0.15 up 0.15 from B2.N_NE2 ; "\sl N\_NE2" ljust
    arrow <- down 0.15 right 0.15 from B2.Out; "\sl Out" ljust
    `"\tt BUFFER\_gate(,N,bd,bd,NN)"' at B2.s+(0,-18bp__) }
  thicklines_

  B3: BUFFER_gen(ITNOC,bd,bd,PN,,N,LH_symbol at C) \
      with .sw at last [].se+(esep,0)
  { `"\tt BUFFER\_gen(ITNOC,bd,bd,PN,{,}N,"' ljust \
    `"\tt $\;\;$LH\_symbol at C)"' ljust at B3.s+(-60bp__,-30bp__) }
  thinlines_
  { arrow <- left 0.2 up 0.2 from B3.In1; "\sl In1" rjust
    arrow <- left 0.2 up 0.2 from B3.In2; "\sl In2" rjust
    arrow <- up 0.15 right 0.15 from B3.Out; "\sl Out" above
    arrow <- down 0.2 from B3.N_SE1; "\sl N\_SE1" rjust
    arrow <- right 0.3 down 0.2 from B3.C; "\sl C" ljust }
  thicklines_
]

  B4: BUFFER_gate(right_ elen_ from last [].sw+(0,-0.35),,bd,bd)
  { `"\tt BUFFER\_gate(right\_ elen\_,{,}bd,bd)"' ljust at B4.end }
  move to B4.start+(0,-dimen_)
  B6: BUFFER_gate(right_ elen_,N,bd,bd,,N,LH_symbol(I) at C)
   line down dimen_/4 from last [].N_SE1.s then left dimen_*2/3
  {`"\tt BUFFER\_gate(right\_ elen\_,N,bd,bd,{,}N,LH\_symbol(I) at C)"' ljust \
   `"\tt line down dimen\_/3 from last [].N\_SE1.s then left dimen\_*2/3"' \
    ljust at B6.end }

.PE
