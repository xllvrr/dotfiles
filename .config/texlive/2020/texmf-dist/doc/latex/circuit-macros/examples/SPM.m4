.PS
# `SPM.m4 Salient-pole machine'
gen_init

  outerrad = 1
  medrad = 11/16
  windings = 6
  polewid = 3/8
  twid = (outerrad-medrad)/3
  srad = twid/4
  halfline = ifgpic(0,linethick/2 pt__)

  C: circle rad outerrad at 0,0
  line from Rect_(outerrad,180+60) to (C.w,C.s) then down polewid/2 \
    then right 2*outerrad then up polewid/2 then to Rect_(outerrad,-60)

  line from C+(medrad,-twid/2) right twid then up twid then left twid \
    chop -halfline
  E: Here+(halfline,0)
  for i = 1 to windings*2 do {
    Point_(i*360/(windings*2))
    arc ccw from E to C+vec_(medrad,-twid/2) with .c at C
    E: rvec_(0,twid)
    line to rvec_(twid,0) then to rvec_(twid,twid) then to E chop -halfline
    }
  move to C
  for i = 0 to 3 do {{
    Point_(i*90)
    for_(-1,1,2,
     `{ line from rvec_(polewid/2,m4x*polewid/2) \
               to rvec_(medrad*2/3,m4x*polewid/2) \
          then to rvec_(medrad*2/3,m4x*(polewid/2+polewid/5)) \
            chop -halfline chop 0
        { move to rvec_(0,-(m4x*polewid/5))
          line from rvec_(-twid/2,m4x*twid/4) to rvec_(-twid/4,m4x*twid/4) \
            then to rvec_(-twid/4,m4x*twid*3/4) \
            then to rvec_(-twid*7/4,m4x*twid*3/4) \
            then to rvec_(-twid*7/4,m4x*twid/4) \
            then to rvec_(-twid/2,m4x*twid/4) }
        T: rvec_(srad,0)
        arc ifelse(m4x,-1,c)cw to (1+srad/distance(T,C))<C,T> with .c at T
        }')
    arc cw from last arc.end to 2nd last arc.end with .c at C
    }}

  t = distance(C,last arc.s)
  "\sf N" at C+(0, t) below
  "\sf N" at C+(0,-t) above
  "\sf S" at C+(-t,0) ljust
  "\sf S" at C+( t,0) rjust

  for i = 0 to windings/2-1 do {
    for j = 1 to 2 do { sprintf("$\char%g_%g$",97+i,j) \
        at Rect_(outerrad-twid,180*(2-j)-i*360/windings) }
    for j = 1 to 2 do { sprintf("$\char%g_%g'$",97+i,j) \
        at Rect_(outerrad-twid,180*(2-j)-90-i*360/windings) }
    }
    
.PE
