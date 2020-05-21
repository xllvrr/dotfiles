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
  lt = linethick bp__
  crad = 1.0
  C: circle rad crad
  g = 0.65
  D: C+(Rect_(crad*g,110))
  rm = crad+distance(C,D)
  for r=lt to rm by 2*lt do {
    if r < (1-g)*crad then { circle rad r at D thick r/rm*linethick } \
      else { arc cw from Cintersect(D,r,C,crad) \
       to Cintersect(D,r,C,crad,R) with .c at D thick r/rm*linethick }
    }
  linethick = 1.5
  lt = linethick bp__
  C: circle invis rad crad with .w at C.e+(0.1,0)
  D: C+(Rect_(crad*g,110))
  rm = crad+distance(C,D)
  for r=lt to rm by lt do {
    u = (1-r/rm)*255
    if r < (1-g)*crad then { rgbdraw(u,u,u,circle rad r at D) } \
    else { rgbdraw(u,u,u,arc cw from Cintersect(D,r,C,crad) \
      to Cintersect(D,r,C,crad,R) with .c at D) }
    }
  circle rad C.rad at C
  ] with .w at last [].e+(0.1,0)

.PE
