.PS
# ex18.m4
cct_init(svg_font(Times,11bp__))

[
   "svg_it(v`'svg_sub(i))" wid 0.1 rjust; dot
   resistor(right_ dimen_) ; llabel(,svg_it(R`'svg_sub(i)))
T: dot
   line right_ linewid/4
A: opamp with .In1 at Here

   line from A.In2 to (T,A.In2)
   resistor(down_ dimen_) ; rlabel(,svg_it(R`'svg_sub(g)))
   ground(,T)

   line right_ dimen_ from A.Out
   diode(up_ dimen_); dot
   {line right_ linewid/2; dot; "svg_it(v`'svg_sub(o))" wid 0.2 ljust }
   resistor(left_ to (A.Out,Here)) ; rlabel(,svg_it(R`'svg_sub(o))); dot
   { diode(down_ to A.Out); dot }
   line to (T,Here) then to T
  ]
[
# ex19.m4
define(`dimen_',dimen_*1.25)

B: battery(up_ dimen_*2/3); rlabel(,V)
   move down dimen_/4
   resistor(up_ dimen_); rlabel(,R,)
   {move up textht*1.5 }
   inductor(right_ elen_); b_current(i); rlabel(,L)
   { capacitor(down_ to (Here,B.start)); rlabel(,C); llabel(+,v,-) }
   line right_ dimen_
   diode(down_ to (Here,B.start),T); b_current(h(v))
   { move right 0.3}
   line to B.start
  ] with .nw at last [].ne+(20bp__,0)

 command "</g>" # end font
.PE
