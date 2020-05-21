.PS
# ex15.m4
gen_init

[
n = 10; r = 1
for i = 1 to n-1 do {
   for j = i+1 to n do {
      line from rect_(r,i*twopi_/n) to rect_(r,j*twopi_/n)
      }
   }
  ]
[
  linethick = 2.5
  crad = 1.0
  C: circle rad crad
  g = 0.65
  D: C+(Rect_(crad*g,110))
  rm = crad+distance(C,D)
  for r=lthick to rm by 2*lthick do {
    if r < (1-g)*crad then { circle rad r at D thick r/rm*linethick } \
    else { arc cw from Cintersect(D,r,C,crad) \
      to Cintersect(D,r,C,crad,R) with .c at D thick r/rm*linethick }
    }

  linethick = 1.5
  C: circle invis rad crad with .w at C.e+(0.1,0)
  D: C+(Rect_(crad*g,110))
  a = 1 # fade rate parameter
  for r=lthick to rm by lthick do {
    u = 1-(r/rm*(a*r/rm+(1-a)))
    if r < (1-g)*crad then { circle outlined rgbstring(u,u,u) rad r at D } \
    else { arc cw outlined rgbstring(u,u,u) from Cintersect(D,r,C,crad) \
      thick linethick*1.5 to Cintersect(D,r,C,crad,R) with .c at D
      }
    }
  circle rad C.rad at C
  ] with .w at last [].e+(0.1,0)

.PE
