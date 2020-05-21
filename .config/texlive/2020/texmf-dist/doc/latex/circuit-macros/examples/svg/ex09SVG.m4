.PS
# ex09.m4
# Illustrating the arguments of the `dimension_' and `arcdimension_' macros.
gen_init(svg_font(sans-serif,10bp__,3bp__))
scale = 25

define(`spacer',`
[
linethick_(1.0)

  WC: circle diameter 4.22 at 0,0
  EC: circle same at 30.15,0
  NC: circle diameter 2.36 at 13.28, 10.92/2
  SC: circle same at 13.28,-10.92/2

  C: 0.5<WC,EC>           # spacer centre
  h = 27.26               # spacer height
  s = 4.22/2              # small arc radius
  r = h/2*0.80            # large arc radius
  Cr: C+(0,h/2-r)         # upper arc centre
  e = s                   # small arc centre offset from small circle
  Cs: EC+(e,0)            # right arc centre

#   Tangent points Tr and Ts to circles at Cr and Cs
  dx = Cr.x-Cs.x; dy = Cr.y-Cs.y; dsq = dx*dx+dy*dy
  Tr: (r*(r-s)/dsq)<Cr,Cs> + (vscal_(r*sqrt(dsq-(r-s)^2)/dsq,dy,-dx))
  Ts: (s/r)<Cr,Tr>-(dx,dy)

  line from Tr to Ts
  arc cw to (Ts.x,-Ts.y) with .c at Cs
E: last arc.e
  line to (Tr.x,-Tr.y)
  arc cw to (C.x-(Here.x-C.x),Here.y) with .c at (Cr.x,-Cr.y)
S: last arc.s
  line to (Cs.x-Ts.x-s,Cs.y-Ts.y)
  arc cw to (Here.x,-Here.y) with .c at (-e,0)
W: last arc.w
  line to (C.x-(Tr.x-C.x),Tr.y)
  arc cw to Tr with .c at Cr
N: last arc.n

thinlines_
  dimension_(from S+(2,0) to N+(2,0),-(E.x-C.x+4),27.76, 5)
  dimension_(from SC.n+(0,2) left SC.x-WC.x,  (SC.n.y-S.y+3), 13.28, 10)
  dimension_(from WC.n+(0,2) right EC.x-WC.x,-(WC.n.y-S.y+7), 30.15, 10)
  dimension_(from W+(0,-1.5) to E+(0,-1.5),  -(C.y-S.y+8), 41.28, 10)
  dimension_(from SC.e+(2,0) up NC.y-SC.y, (SC.e.x-W.x+8),"10.92" wid 10, 5)

  arrow <- from EC left 6 up 16 chop EC.rad chop 0
  line left 4 "4.22 (2) PL" above
  arrow <- from NC up last line.y-NC.y+7/8 left 8 chop NC.rad chop 0
  {"2.36" above}
  arrow to SC chop 0 chop SC.rad

] ')

define(`sk',`scale*0.7')

define(`bdot',
 `dot(`$1',,0.5)
  "svg_it($2)" $1 $3 ')

  thinlines_

  move right 0.8

# Upper left diagram
 spacer

# Lower left diagram
[ define(`lwid',`29bp__')
A: bdot(at (0,0),A,below)
B: bdot(at (2*sk,0),B,below)
Ctr: 0.5 between A and B
  move up 1*sk from A
L: move left 0.85*sk from A

  linethick_(1)
  dimension_(from A to B,0.5*sk,svg_it(label),lwid,0.1*sk)
  "`dimension_(from A to B,0.5,label,29bp__,0.1)'" wid 70 \
    with .w at (L.end.x+2,A.y-10)
  move down_ 4 from last ""

  thinlines_
  arrow from A to B chop 0.05*sk "svg_it(linespec)" below
  dimension_(up_ 0.5*sk from A,0.2*sk,"svg_it(offset)" rjust,,,->)
  dimension_(up_ 0.1*sk from B,-0.2*sk,"    svg_it(tic offset)" ljust)
  dimension_(up_ 0.1*sk from B+(0,0.5*sk),-0.2*sk,
   "    svg_it(tic offset)" ljust)
  dimension_(from Ctr+(-lwid/2,0.5*sk) right lwid,0.2*sk,
    "svg_it(blank width)" above)
] with .nw at last [].sw+(0,-0.4*sk)
#showbox_

# Upper right diagram
[ A: bdot(at (0,0),A, above rjust)
  B: bdot(at (2*sk,0),B, above ljust)
  C: bdot(at (0,-1.5*sk),C, above rjust)
  D: bdot(at (2*sk,-1.5*sk),D, above ljust)

T: C+(-1*sk,-0.5*sk)
T: C+(-0.45*sk,-0.5*sk)
  dimension_(from A to B,0.3*sk,svg_it(AB),20bp__)
  dimension_(from C to B chop dotrad_,,svg_it(X),16bp__)
  dimension_(from C to A,0.3*sk,svg_it(CA),14bp__,,->)
  dimension_(from D to B,-0.3*sk,"svg_it(DB)" ljust)
  dimension_(from C to D chop dotrad_,,svg_it(T`'svg_sub(15)),15bp__)
  arcdimension_(from C to D with .c at 0.5 between A and B,12bp__,
    svg_it(C) to svg_it(D),34bp__)
Q: C+(-9,-15)

`define' leftparagraph { [ baselineskip = textht*1.5; { move right $1 }
   for i = 2 to $+ do {
     move to Here+(0,-baselineskip)
     exec sprintf("{ `\"$%g \"' wid 4.5*scale ljust }; ",i) } ] }

leftparagraph(1.7*scale; baselineskip = 1.5*textht,
  `dimension_(from A to B,0.3,AB,20bp__)',
  `dimension_(from C to B,,X,16bp__)',
  `dimension_(from C to A,0.3,CA,14bp__,,->)',
  `dimension_(from D to B,-0.3,"DB" ljust)',
  `dimension_(from C to D chop dotrad_,,T`'svg_sub(15),15bp__)',
  `arcdimension_'svg_symbol(&`#'40;)`from C to D with .c at 0.5 \
     between A and B'svg_comma`12bp__'svg_comma,
   svg_ensp `C to D'svg_comma`34bp__'svg_symbol(&`#'41;)
  ) with .nw at Q

] with .nw at 1st [].ne+(1.7*sk,0)

 command "</g>" # end font
.PE
