.PS
# MotorControl.m4
cct_init(svg_font(sans-serif,11bp__))

  trad = 2.5*dotrad_
define(`bigterminal',`circle rad trad')

  mrad = linewid*2/3
Motor: circle rad mrad "Motor"

  linethick = 2
  T2: Motor.n+(0,dimen_/2)

  for i=1 to 3 do {
    if i==2 then { line from Motor.n to T2 } \
    else { line from Motor right (i-2)*Motor.diam chop Motor.rad chop 0 \
      then up T2.y-Motor.y } 
    bigterminal
    cbreaker(up_ dimen_*3/4,,T)
    bigterminal
    line up_ dimen_
    bigterminal
    capacitor(up_ dimen_*1.2,,,dimen_/3,dimen_/6)
    { circle fill_(1) rad dotrad_*3/2  thick 0.8 \
       at 0.25 between last line.end and last line.start }
    if i==1 then { L1: last circle } \
    else { if i==2 then { L2: last circle }}
    bigterminal
    line up_ dimen_/4
    }
  linethick_(0.8)
  C2: circle rad mrad/3 at Motor.n+ (0,dimen_*2)
    line from C2.e right_ dimen_/3 then up C2.rad*1.5
    line to (L1.x-dimen_/2,Here.y)
  {S23: capacitor(up_ dimen_*2/3 from (L1.x-dimen_/2,Here.y),,,
    dimen_/3,dimen_/6); dot(,,1) }
    dot(,,1)
    line to (L1.x-dimen_*2,Here.y) chop dotrad_ chop 0 then up dimen_/3
  S1: [ bswitch(right_ dimen_/2) ] with .Bsw_T1.s at Here
  S2: [ bswitch(right_ dimen_/2,,C) ] at S1+(0,-dimen_)
    line right dimen_/6 down dimen_/6 from S1.Bsw_T2.se \
      then down S1.Bsw_T2.se.y-S2.Bsw_T2.ne.y-dimen_/3 \
      then to S2.Bsw_T2.ne
    box wid S1.wid+dimen_/2 ht S1.n.y-S2.s.y+dimen_/3 \
      at 0.5 between S1.s and S2.n
    line left dimen_/2 from S23.end chop dotrad_ chop 0; corner
    line to (Here,S1.Bsw_T2) then to S1.Bsw_T2.e
    line from S2.Bsw_T1.w left dimen_/2; corner
    line to (Here,L1) then to L1 chop 0 chop dotrad_

    dot(at 0.5 between L1 and L2,,1)
    { line to L2 chop dotrad_ }
   S45: variable(`capacitor(down_ dimen_*2/3 chop dotrad_ chop 0,,,
     dimen_/3,dimen_/6)',L,,dimen_/2); dot(,,1)
    line to (Here,C2) then to C2.w chop dotrad_ chop 0

 command "</g>" # end font
.PE
