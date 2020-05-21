.PS
# SQUIDSVG.m4
cct_init(svg_font(sans-serif,11bp__))

down_
S1: SQUID
  "J1" at S1.J1 above rjust wid 15bp__
  "J2" at S1.J2 above ljust

S2: SQUID(3,dimen_*1.5,-120) at S1.e+(elen_,0)
  "J1" at S2.J1 above rjust
  "J2" at S2.J2 below ljust
  "J3" at S2.J3 above ljust
  arcrad = S2.C.rad*0.7
  arc from S2.c+(Rect_(arcrad,-135)) to S2.c+(Rect_(arcrad,-45)) \
   with .c at S2.C ->

 command "</g>" # end font
.PE
