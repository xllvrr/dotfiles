.PS
# QuantumSVG.m4
gen_init

  boxht = 0.35
  boxwid = boxht
  define(`dotrad_',boxht/5)

define(`Bus',`line right_ 10*boxwid `$1'
  circle diam boxht `$2' at last line.start
  box fill_(1) "H" at last line.start+(boxwid*3/2,0)
  box fill_(1) "H" at last line.end-(boxwid*2.5,0) ')

define(`Meter',`[ Box: box wid boxwid*3/2 fill_(1)
  r = Box.wid/3
  C: 0.3 between Box.s and Box.n
  arc cw from C+(-r,0) to C+(r,0) with .c at C
  arrow from C+(-r/4,0) to C+(0.9*r,0.9*r) ]')

X: Bus(,shaded rgbstring(0.5,0.5,1) "X")
A1: Bus(from X.start+(0,-boxht*3/2), shaded "red" "A")
A2: Bus(from 2 between X.start and A1.start, shaded "red" "A")
  dot(at X.start+(3*boxwid,0))
  line to (Here,A2); dot
  circle rad dotrad_ at A1.start+(4*boxwid,0)
  line from last circle.s to (last circle,X); dot
  Meter with .e at X.end
  box wid boxwid*1.2 ht boxht*1.2 fill_(1) at A2.end-(4.5*boxwid,0) \
   "svg_it(R)svg_sub(svg_psi)svg_sup(svg_pi/2,,,-1.2ex)"

.PE
