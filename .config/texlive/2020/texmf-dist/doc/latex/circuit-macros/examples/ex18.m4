.PS
# ex18.m4
cct_init

[
   "$v_i$" rjust; dot
   resistor(right_ dimen_) ; llabel(,R_i)
T: dot
   line right_ linewid/4
A: opamp with .In1 at Here

   line from A.In2 to (T,A.In2)
   resistor(down_ dimen_) ; rlabel(,R_g)
   ground(,T)

   line right_ dimen_ from A.Out
   diode(up_ dimen_); dot
   {line right_ linewid/2; dot; "$v_o$" ljust }
   resistor(left_ to (A.Out,Here)) ; rlabel(,R_o); dot
   { diode(down_ to A.Out); dot }
   line to (T,Here) then to T
]

[
define(`dimen_',dimen_*1.25)

B: battery(up_ dimen_*2/3); rlabel(,V^o)
   move down dimen_/4
   resistor(up_ dimen_); rlabel(,R,)
   inductor(right_ elen_); b_current(i\mathstrut); rlabel(,L)
   { capacitor(down_ to (Here,B.start)); rlabel(,C); llabel(+,v,-) }
   line right_ dimen_
   diode(down_ to (Here,B.start),T); b_current(h(v))
   line to B.start
] with .nw at last [].ne+(20bp__,0)

.PE
