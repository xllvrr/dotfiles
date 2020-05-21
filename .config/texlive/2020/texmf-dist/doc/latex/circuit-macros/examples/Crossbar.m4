.PS
# Crossbar
gen_init
  circlerad = 0.12
  boxwid = 0.18
  boxht = 0.18
  rathick = 1.5
  rawd = rathick*4 bp__
  raht = rawd*2
  boxdist = boxwid*1.8

define bcoord {($2,-($1))*boxdist}
define redarrow { arrow ht raht wid rawd thick rathick color "red" }

define cbx {
  thinlines_
  n = $+ - 1
  for i=0 to n do {
    line color "blue" from bcoord(i,0) to bcoord(i,n)
    line color "blue" from bcoord(0,i) to bcoord(n,i)
    C[i]: circle invis at bcoord(i,-1.5)
    }
  for i=0 to n do {
    exec sprintf("col = $%g",i+1)
    redarrow from C[i].e right 1.25*boxwid
    redarrow from C[i].w+(-boxwid,0) right raht
    for j=0 to n do {
      B: box outlined "blue" shaded "yellow" at bcoord(i,j)
      if j==col then {
        line color "blue" from B.s to B.e
        line thick rathick color "red" from C[i].e to B.w \
          then to B.n then to (B.x,C[0].y+(2+j*2/3)*boxht)
          continue to (C[j].x-(2+j*2/3)*boxht,Here.y)
          continue to (Here,C[j]) then to C[j].w
        } \
      else {
        line color "blue" from B.n to B.s
        line color "blue" from B.w to B.e
        }
      }
    } 
  thicklines_
  for i=0 to n do {
    circle thick 1.5 outlined "blue" shaded "yellow" at C[i] \
      sprintf("iflatex(\large)%g",i)
    }
  }

ifdpic(`
  cbx(3,6,0,5,2,7,1,4)

',`box wid 1 ht 0.75 "Crossbar.m4" "requires" "dpic"')
.PE
