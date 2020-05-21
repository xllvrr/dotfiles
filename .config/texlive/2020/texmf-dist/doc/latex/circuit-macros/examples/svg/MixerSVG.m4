.PS
#`MixerSVG.m4
# Showing VMOS mosfet and custom transformer'
cct_init(svg_font(sans-serif,10.5bp__,1bp__))

define(`dimen_',0.6)
define(`elen_',0.75)

define(`Xform21',
 `[ L1: inductor(to rvec_(dimen_*0.5,0),L,,M)
    Core1E: M4Core1.end; Core2E: M4Core2.end
    D: (0.5 between M4Core1 and M4Core2) - L1
    T: line to rvec_(dimen_/3,0); { dot(at T.c) }
    L2: inductor(to rvec_(L1.len,0),L,,M)
    line from M4Core1.start to Core1E
    line from M4Core2.start to Core2E
    L3: inductor(to rvec_(-L1.len,0) with .c at T+(D.x*2,D.y*2),L) ]')

  del = dimen_/3
  setdir_(U)
T1: Xform21; "T1" at T1.n above rjust
  dot(at T1.L3.start+(0,4bp__))
  dot(at T1.L1.end+(4bp__,0))
  dot(at T1.L2.end+(4bp__,0))
  line from T1.L3.start left_ dimen_*2/3
RF: dot(,,1); "RF" at RF.w rjust
  line from T1.L3.end left_ del; corner; ground(,,F)

  line down_ del/2 from T1.L1.start then right_ del
  reversed(`capacitor',right_ dimen_,C); llabel(,0.1 svg_micro`'F)
BT: dot(at Here)
  line up_ del/2 from T1.L2.end then right del
  reversed(`capacitor',right_ dimen_,C); llabel(,0.1 svg_micro`'F)
  t = dimen_*7/8
  line to (BT.x+4*t,Here.y)
TT: dot
  line right_ dimen_+del/2; setdir_(U)
Q1: mosfet(,,dMESDQuB,E) with .G at Here
  { "Q1" at Q1.Env.ne above ljust }
  ground(at Q1.S,,F)
  line right_ del*3/2 from Q1.D then down_ Q1.D.y-T1.L2.end.y
T2: Xform21 with .L1.start at (Here,T1.L2.end); "T2" at T2.n above ljust
  dot(at T2.L1.start+(-4bp__,0))
  dot(at T2.L3.end+(0,4bp__))
  line from T2.L3.end right_ dimen_*2/3
IF: dot(,,1); "IF" wid 12bp__ at IF.e ljust
  setdir_(U)
Q2: mosfet(,,dMESDQuB,E) at (Q1,T2.s-(0,elen_-del))
  { "Q2" at Q2.Env.ne above ljust }
  line from Q2.D to (T2.L2.end,Q2.D) then to T2.L2.end
  line from Q2.G left_ del/2 then up_ BT.y-Q2.G.y then to BT

  line right_ del from T1.T then down_ T1.T.y-BT.y+del*3/2
  corner; left_
  capacitor(to (T1.L3.end-(del,0),Here),C)
  rlabel(,0.1 svg_micro`'F          )
LOD: dot
  { line to (RF,Here)
    dot(,,1); move left_ 4bp__; "local" rjust "oscillator" rjust;
    move left 50bp__ }
  line from T2.T left_ to (Q1.S,T2.T)
T2T: dot
  { capacitor(down_ to (Here,BT),C); rlabel(,0.1 svg_micro`'F)
  ground(,T,F) }
  { line from T2.L3.start right_ del; corner; ground(,,F) }
Vt: dot(at (0.5 between BT and TT,Q1.Env.nw),,1)
  { "+V`'svg_sub(CC)" at last [].e ljust }
  line to (Here,T2T); dot
  { line to (Here,BT); Cv: capacitor(down_ 3/2*dimen_,C)
    llabel(10 svg_micro`'F); G: dot; ground(,,F) }

  for s=-1 to 1 by 2 do {{
    line right s*t; corner
    resistor(down_ to (Here,BT))
    if s<0 then { llabel(,5 k`'svg_ohm) } \
           else { rlabel(,5 k`'svg_ohm)
                  { dot(at last line.start); line to (TT,Here)
                    resistor(right_ to (T2T,Here))
                    llabel(,10 svg_ohm) } }
    P: potentiometer(down_ Cv.len,,0.5,s*t ) with .Start at Here
    if s<0 then { "1 k`'svg_ohm" at P. 1st [].ne ljust } \
           else { "1 k`'svg_ohm" at P. 1st [].sw rjust }
    dot(at P.End)
    dot(at P.T1)
    { L: inductor(up_ to (Here,BT),L);
      if s<0 then { "100 svg_micro`'H" at last [].sw rjust } \
             else { line to TT
                    "100 svg_micro`'H" at last [].ne ljust below } }
    capacitor(down_ to (Here,G),C)
    if s<0 then { rlabel(,0.1 svg_micro`'F) } \
           else { llabel(,0.1 svg_micro`'F) }
    dot }}

  resistor(down_ from LOD to (LOD,G)); llabel(,51 svg_ohm); corner
  line to (Q2.S,Here) then to Q2.S

 command "</g>" # end font
.PE
