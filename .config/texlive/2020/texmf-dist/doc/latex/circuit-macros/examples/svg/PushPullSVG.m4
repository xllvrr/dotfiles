.PS
# `PushPullSVG.m4'
cct_init(svg_font(sans-serif,10bp__,1bp__))

linewid = 1.2*linewid

# Transformer as for Mixer.m4
define(`Xform21',
 `[ L1: inductor(to rvec_(dimen_*0.5,0),,,M)
    Core1E: M4Core1.end; Core2E: M4Core2.end
    D: (0.5 between M4Core1 and M4Core2) - L1
    T: line to rvec_(dimen_/3,0); { dot(at T.c) }
    L2: inductor(to rvec_(L1.len,0),,,M)
    line from M4Core1.start to Core1E
    line from M4Core2.start to Core2E
    L3: inductor(to rvec_(-L1.len,0) with .c at T+(D.x*2,D.y*2),) ]')

  del = dimen_/3
  up_
  T1: Xform21
  line left_ del from T1.L3.end; corner; ground(,,F)
  line left_ 2*del from T1.L3.start
  In: dot(,,1); { "RF" wid 12bp__ at In.n above }
  up_
  Q1: mosfet(,,dBSDFQM1,E) with .G0 at T1.T+(2*dimen_+del/2,dimen_)
  { "3N200" at last [].n above }
  line from T1.L2.end to (T1.L2.end,Q1.G0) then to Q1.G0
  Q2: mosfet(,,dBSDFQM1,E) with .G0 at (Q1.G0.x,T1.T.y-dimen_)
  { "3N200" at last [].n above }
  line from T1.L1.start to (T1.L1.start,Q2.G0) then to Q2.G0

  resistor(right_ dimen_ from T1.T); llabel(,330`'svg_ohm); Tx:dot
  { line right_ del*3/2; corner; ground(,,F) }
  dot(at (Tx,Q1.G0))
  capacitor(down_ to Tx,C); llabel(5.6pF)
  dot(at (Tx,Q2.G0))
  capacitor(up_ to Tx,C); rlabel(5.6pF)

  for_(1,2,1,
   `dot(at Q`'m4x.S+(dimen_+del/2,0))
    { resistor(down_ dimen_); G1:Here; 
      { "120" at last [].w rjust "svg_ohm" rjust }
      dot; ground(,,F) }
    line from Q`'m4x.S to (Here.x+dimen_*3/4,Q`'m4x.S.y); corner
    capacitor(down_ to (Here,G1),C)
    { "1000" at last [].w rjust "pF" rjust }
    corner
    line left_ 2*dimen_*3/4; corner
    TG: dot(at (Here,Q`'m4x.S))
    capacitor(down_ to (Here,G1),C); rlabel(,0.01 svg_micro(F))
    ')

  R: dot(at (Here.x+dimen_*2,(Q1.D.y+Q2.D.y)/2))
  dot(at (R,Q1.D)); capacitor(down_ to R,C); llabel(20pF)
  dot(at (R,Q2.D)); capacitor(up_ to R,C); llabel(20pF)
  line right_ del*3/2 from R then down_ R.y-(Q1.S.y-dimen_); ground(,,F)

  Vc: dot(at (R+(dimen_,0),Q1.ne),,1); { "+Vc" rjust at Vc.w }
  dot(at (Vc,R))
  inductor(right_ dimen_,); llabel(,1 svg_micro(H))
  down_
  T2: Xform21 with .T at Here
  arrow from T2.L2 to T2.L3 chop -dimen_/4
  line right_ del from T2.L3.start; corner
  capacitor(down_ dimen_,C); llabel(1000 pF); ground(,T,F)
  line right_ 2*del from T2.L3.end
  Out: dot(,,1); { "IF" wid 12bp__ at Out.n above }; move right_ 0.3

  line from T2.L1.start to (T2.L1,Q1.D) then to Q1.D
  line from T2.L2.end to (T2.L2.end,Q2.D) then to Q2.D

  line from Vc to (Vc,Q2.S) chop dotrad_/2 chop 0; dot
  { line right_ del*2; corner
    capacitor(down_ dimen_,C); llabel(,1000 pF); ground(,,F) }
  reversed(`inductor',down_ dimen_,); rlabel(,1 svg_micro(H))
  line down_ dimen_/2

  TL: dot(at (Q1.G1.x-del/2,Here.y))
  up_
  Q3: bi_tr(,R,,E) with .C at (TG.x,TL.y-dimen_*2/3)
  resistor(right_ from TL to (Q3.C,TL)); llabel(,82 k`'svg_ohm)
  line to (Vc,Here); dot
  resistor(down_ to (Here,Q3.B)); rlabel(,8.2 k`'svg_ohm); dot
  dot(at Q3.B+(del,0))
  line up_ (TL.y+Q3.C.y)/2 - Here.y+del/4 then left_ Here.x-TL.x
  reversed(`capacitor',left_ dimen_,C); llabel(,1500 pF)
  Osc: dot(,,1); { "Osc" above at Osc.n }

  line from Q3.B to (Vc,Q3.B)
  line from Q3.C to (Q3.C,TL); dot
  dot(at Q3.C+(0,del/2))
  capacitor(left_ to (TL,Here),C); llabel(,1500 pF); dot
  line down_ del/2 from Q3.E; dot
  { resistor(down_ dimen_*3/4); rlabel(,820`'svg_ohm)
    G: Here; ground(,T,F) }
  line right_ dimen_; corner
  capacitor(down_ to (Here,G),C); llabel(,1000 pF)
  ground(,T,F)
  ground(at (TL,G),T,F)
  resistor(up_ dimen_); llabel(,12 k`'svg_ohm)
  line to (Here,Q1.G1) then to Q1.G1
  line from Q2.G1 to (TL,Q2.G1); dot

  ground(at (Vc,G),T,F)
  resistor(up_ dimen_); rlabel(,5.6 k`'svg_ohm); line to (Here,Q3.B)

 command "</g>" # end font
.PE
