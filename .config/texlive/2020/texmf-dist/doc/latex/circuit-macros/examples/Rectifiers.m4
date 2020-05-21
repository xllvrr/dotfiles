.PS
# Rectifiers.m4
cct_init

  tmax = 3.5
  period = tmax/1.75
  eamp = 0.5
  omega = twopi_/period
  ed = eamp/6
  r = 0.95

#                           For DC voltages
  ted = asin(ed/eamp)/twopi_*period
  npts = 40; sum = 0
  for i=0 to npts do {
    t = ted+(period/2-2*ted)*i/npts
    sum += (eamp*cos(omega*t-pi_/2) - ed)*r }

define(`Sine',`Cosine(eamp,omega,`$1',-pi_/2)')
define(`axis',`line thick 0.4 right tmax chop -tmax*0.04 chop 0')

Threephase: [ linethick_(1)
  Ai: axis ; "$N_o$" ljust
  EOrig: Ai.start+(tmax*0.04,0)
  E1: sinusoid(eamp,omega,-pi_/2,-ted,tmax) with .Origin at EOrig
  E2: sinusoid(eamp,omega,-pi_/2-twopi_/3,-ted,tmax) with .Origin at EOrig
  E3: sinusoid(eamp,omega,-pi_/2+twopi_/3,-ted,tmax) with .Origin at EOrig
  "$e_1$" at EOrig+(period/3,eamp*0.8) ljust above
  "$e_2$" at EOrig+(2*period/3,eamp*0.8) ljust above
  "$e_3$" at EOrig+(period,eamp*0.8) ljust above

  Ad: axis with .end at Ai.end+(0,-eamp*2.1); "$N_o$" ljust
  DOrig: Ad.start+(tmax*0.04,0)
  Id: axis with .end at Ad.end+(0,-eamp*1.2); "${}0$" ljust
  IOrig: Id.start+(tmax*0.04,0)

  for i=1 to 11 by 2 do {
    tl = max(0,period/2-i*period/6)
    tr = min(period/2,tmax-(i*period/6-period/2))
    sinusoid(eamp,omega,-pi_/2,tl,tr,thick 0.4 dashed) \
      with .Origin at DOrig+(i*period/6-period/2,0)
    tl = max(period/12,-(i*period/6-period/2+period/12) )
    tr = period/2-period/12
    S1: sinusoid(eamp*r,omega,-pi_/2,tl,tr) \
      with .Origin at DOrig+(i*period/6-period/2,0)+(0,-ed*r); round(at S1.End)
    S2: sinusoid(eamp*r,omega,-pi_/2,tl,tr) \
      with .Origin at IOrig+(i*period/6-period/2,0)+(0,-ed*r); round(at S2.End)
    }
  "$e_1$" at DOrig+(period/3,eamp*0.8) ljust above
  "$e_2$" at DOrig+(2*period/3,eamp*0.8) ljust above
  "$e_3$" at DOrig+(period,eamp*0.8) ljust above

  "$e_L$" at DOrig+(period/4,eamp*0.8) below
  "$i_L$" at IOrig+(period/6,eamp*0.6) rjust above

  vEd = r*eamp*cos(pi_/12)/(5*pi_/12) - r*ed
  VEd: axis with .end at Ad.end+(0,vEd); "$E_D$" ljust
  IEd: axis with .end at Id.end+(0,vEd); "$I_D$" ljust
  ]

Cct3:[ 
  No: dot; "$N_o$" at last [].s below rjust
  E2: No+(Rect_(dimen_,60))
  E3: No+(Rect_(dimen_,-60))
  E1: No+(-dimen_,0)
  inductor(from No to E2,W); round; "$e_2$" ljust
  inductor(from No to E3,W); round; "$e_3$" ljust
  inductor(from E1 to No,W); round(at E1); "$e_1$" at E1 above
  D3: diode(down_ from E3); b_current(i_3,rjust); llabel(,,D_3)
  line from E1 to (E1.x,D3.start.y+dimen_/3) then right_ (E3.x-E1.x)/2 \
    then down_ dimen_/3
  D1: diode(down_); b_current(i_1,rjust); llabel(,,D_1); dot
  line from E2 left_ E2.x-E1.x+dimen_/3 then down_ E2.y-E3.y \
    then to 2 between D3.start and D1.start; corner
  D2: diode(down_); b_current(i_2,rjust); llabel(,,D_2)
  { line from D2.end to D3.end }
  arrowline(from D1.end down_ elen_/2); rlabel(,i_L)
  resistor(right_ elen_); rlabel(+,e_L,-); llabel(,R)
  line to (Here,No) then to No
  ] with .e at Threephase.w-(0.5,0)

Fullwave: [
  linethick_(1)
  Ai: axis ; "$N_o$" ljust
  EOrig: Ai.start+(tmax*0.05,0)
  E1: sinusoid(eamp,omega,-pi_/2,-ted,tmax) with .Origin at EOrig
  "$e_1$" at EOrig+(period/3,eamp*0.8) ljust above
  E2: sinusoid(eamp,omega, pi_/2,-ted,tmax) with .Origin at EOrig
  "$e_2$" at EOrig+(period*5/6,eamp*0.8) ljust above

  Ad: axis with .end at Ai.end+(0,-eamp*2.1); "$N_o$" ljust
  DOrig: Ad.start+(tmax*0.05,0)
  Id: axis with .end at Ad.end+(0,-eamp*1.2); "${}0$" ljust
  IOrig: Id.start+(tmax*0.05,0)

  for i=0 to 3 do {
    if i<3 then { tf = period/2 } else { tf = Ad.end.x-(DOrig.x+3*period/2) }
    sinusoid(eamp,omega,-pi_/2,0,tf,thick 0.4 dashed) \
      with .Origin at DOrig+(i*period/2,0)
    line from DOrig+(i*period/2-ted,0) right 2*ted
    line from IOrig+(i*period/2-ted,0) right 2*ted
    if i<3 then {tf = period/2-ted } else {tf = Ad.end.x-(DOrig.x+3*period/2) }
    Ed: sinusoid(eamp*r,omega,-pi_/2,ted,tf) \
      with .Origin at DOrig+(i*period/2,-ed*r)
    Ed: sinusoid(eamp*r,omega,-pi_/2,ted,tf) \
      with .Origin at IOrig+(i*period/2,-ed*r)
    }
  "$e_1$" at DOrig+(period/6,eamp*0.9) rjust above
  "$e_2$" at DOrig+(period/6+period/2,eamp*0.9) rjust above
  "$e_L$" at DOrig+(period/4,eamp*0.8) below
  "$i_L$" at IOrig+(period/6,eamp*0.6) rjust above

  vEd = sum/(period/2/(period/2-2*ted)*npts)
  VEd: axis with .end at Ad.end+(0,vEd); "$E_D$" ljust
  IEd: axis with .end at Id.end+(0,vEd); "$I_D$" ljust
  ] with .sw at Threephase.nw+(0,0.5)

Cct2:[ 
  T: transformer(right_ elen_,R,8,AW,8)
  line up elen_/2 from T.P1
  gap(right_ elen_)
  { sinusoid(0.08,omega*8,-pi_/2,0,twopi_/(omega*8)) with .c at last [] }
  line to T.P2
  line from T.S1 to (T.P1,T.S1) then down elen_/2
  D1: diode(down_ elen_*3/4); rlabel(,D_1)
  line from T.S2 to (T.P2,T.S2) then to (T.P2,D1.start)
  D2: diode(down_ elen_*3/4); rlabel(,D_2)
  corner; line to D1.end; corner
  dot(at 0.5 between D1.end and D2.end)
  arrowline(down elen_/2); rlabel(,i_L)
  resistor(right_ elen_); rlabel(+,e_L,-); llabel(,R)
  line to (Here,T.TS)-(0,elen_/2) then left Here.x-T.TS.x then to T.TS
  {"$N_o$" at T.TS-(0,elen_/2) below }
  thinlines_
  move to T.TS-(0,0.1)
  { arrow to (T.P1,Here) chop 0.05 "$e_1$" below }
  { arrow to (T.P2,Here) chop 0.05 "$e_2$" below }
  linethick_(1)
  ] at (Cct3,Fullwave)

Halfwave: [
  linethick = 1
  Ai: axis ; "$N_o$" ljust
  EOrig: Ai.start+(tmax*0.05,0)
  Ei: sinusoid(eamp,omega,-pi_/2,0,tmax) with .Origin at EOrig
  "$e_i$" at EOrig+(period/3,eamp*0.8) ljust above

  Ad: axis with .end at Ai.end+(0,-eamp*1.75); "$N_o$" ljust
  DOrig: Ad.start+(tmax*0.05,0)
  sinusoid(eamp,omega,-pi_/2,0,period/2,thick 0.4 dashed) with .Origin at DOrig
  sinusoid(eamp,omega,-pi_/2,0,period/2,thick 0.4 dashed) \
    with .Origin at DOrig+(period,0)
  "$e_i$" at DOrig+(period/5,eamp*0.9) rjust above
  
  line from Ad.start to DOrig+(ted,0)
  Ed: sinusoid(eamp*r,omega,-pi_/2,ted,period/2-ted) \
    with .Origin at DOrig+(0,-ed*r)
  "$e_L$" at DOrig+(period/3,eamp*0.6) below
  line from Ed.End right period/2+2*ted
  Ed2: sinusoid(eamp*r,omega,-pi_/2,ted,period/2-ted) \
    with .Origin at DOrig+(period,-ed*r)
  line from Ed2.End to Ad.end

  vEd = sum/(period/(period/2-2*ted)*npts)
  VEd: axis with .end at Ad.end+(0,vEd); "$E_D$" ljust above

  Id: axis with .end at Ad.end+(0,-eamp*1.0); "${}0$" ljust
  IOrig: Id.start+(tmax*0.05,0)
  line from Id.start to IOrig+(ted,0)
  Sd: sinusoid(eamp*r,omega,-pi_/2,ted,period/2-ted) \
    with .Origin at IOrig+(0,-ed*r)
  "$i_L$" at IOrig+(period/3,eamp*0.7) above
  line from Sd.End right period/2+2*ted
  Sd2: sinusoid(eamp*r,omega,-pi_/2,ted,period/2-ted) \
    with .Origin at IOrig+(period,-ed*r)
  line from Sd2.End to Id.end
  IEd: axis with .end at Id.end+(0,vEd); "$I_D$" ljust above
  ] with .sw at Fullwave.nw+(0,0.5)

Cct1:[ diode(down_ elen_); b_current(i_L,rjust,O,E); rlabel(D)
  resistor(right_ elen_); rlabel(+,e_L,-); llabel(,R)
  line up elen_
  { "$N_o$" ljust below }
  gap(left_ elen_); rlabel(-,e_i,+)
  ] at (Cct3,Halfwave)



.PE
