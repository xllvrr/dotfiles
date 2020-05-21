.PS
#`Mixer.m4
# Showing VMOS mosfet and custom transformer'
cct_init
ifdpic(`
define(`sftxt',`{\sf `$1'}')

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
T1: Xform21; "sftxt(T1)" at T1.n above rjust
  dot(at T1.L3.start+(0,4bp__))
  dot(at T1.L1.end+(4bp__,0))
  dot(at T1.L2.end+(4bp__,0))
  line from T1.L3.start left_ dimen_*2/3
RF: dot(,,1); "sftxt(RF)" at RF.w rjust
  line from T1.L3.end left_ del; corner; ground(,,F)

  line down_ del/2 from T1.L1.start then right_ del
  reversed(`capacitor',right_ dimen_,C); llabel(,\SI{0.1}{\micro{}}\hbox{\sf F})
BT: dot(at Here)
  line up_ del/2 from T1.L2.end then right del
  reversed(`capacitor',right_ dimen_,C); llabel(,\SI{0.1}{\micro{}}\hbox{\sf F})
  t = dimen_*7/8
  line to (BT.x+4*t,Here.y)
TT: dot
  line right_ dimen_+del/2; setdir_(U)
Q1: mosfet(,,dMESDQuB,E) with .G at Here
  { "sftxt(Q1)" at Q1.Env.ne above ljust }
  ground(at Q1.S,,F)
  line right_ del*3/2 from Q1.D then down_ Q1.D.y-T1.L2.end.y
T2: Xform21 with .L1.start at (Here,T1.L2.end); "sftxt(T2)" at T2.n above ljust
  dot(at T2.L1.start+(-4bp__,0))
  dot(at T2.L3.end+(0,4bp__))
  line from T2.L3.end right_ dimen_*2/3
IF: dot(,,1); "sftxt(IF)" at IF.e ljust
  setdir_(U)
Q2: mosfet(,,dMESDQuB,E) at (Q1,T2.s-(0,elen_-del))
  { "sftxt(Q2)" at Q2.Env.ne above ljust }
  line from Q2.D to (T2.L2.end,Q2.D) then to T2.L2.end
  line from Q2.G left_ del/2 then up_ BT.y-Q2.G.y then to BT

  line right_ del from T1.T then down_ T1.T.y-BT.y+del
  corner; left_
  capacitor(to (T1.L3.end-(del,0),Here),C)
  rlabel(,\SI{0.1}{\micro{}}\hbox{\sf F}\hskip20pt)
LOD: dot
  { line to (RF,Here); dot(,,1)
    move left_ 4bp__;  "sftxt(local)" rjust "sftxt(oscillator)" rjust
    move left 40bp__ }
  line from T2.T left_ to (Q1.S,T2.T)
T2T: dot
  { capacitor(down_ to (Here,BT),C); rlabel(,\SI{0.1}{\micro{}}\hbox{\sf F})
  ground(,T,F) }
  { line from T2.L3.start right_ del; corner; ground(,,F) }
Vt: dot(at (0.5 between BT and TT,Q1.Env.nw),,1)
  { "sftxt($+$V$_{\hbox{\scriptsize CC}}$)" at last [].e ljust }
  line to (Here,T2T) chop dotrad_ chop 0; dot
  { line to (Here,BT); Cv: capacitor(down_ 3/2*dimen_,C)
    llabel(\SI{10}{\micro{}}\hbox{\sf F}); G: dot; ground(,,F) }

  for s=-1 to 1 by 2 do {{
    line right s*t; corner
    resistor(down_ to (Here,BT))
    if s<0 then { llabel(,\SI{5}{\kilo\ohm}) } \
           else { rlabel(,\SI{5}{\kilo\ohm})
                  { dot(at last line.start); line to (TT,Here)
                    resistor(right_ to (T2T,Here))
                    llabel(,\SI{10}{\ohm}) } }
    P: potentiometer(down_ Cv.len,,0.5,s*t ) with .Start at Here
    if s<0 then { "sftxt(1\`,'\si{\kilo\ohm})" at P. 1st [].ne ljust } \
           else { "sftxt(1\`,'\si{\kilo\ohm})" at P. 1st [].sw rjust }
    dot(at P.End)
    dot(at P.T1)
    { L: inductor(up_ to (Here,BT),L);
      if s<0 then { "sftxt(100\`,'\si{\micro{}}H)" at last [].sw rjust } \
             else { line to TT
                    "sftxt(100\`,'\si{\micro{}}H)" \
                       at last [].ne ljust below } }
    capacitor(down_ to (Here,G),C)
    if s<0 then { rlabel(,\SI{0.1}{\micro{}}\hbox{\sf F}) } \
           else { llabel(,\SI{0.1}{\micro{}}\hbox{\sf F}) }
    dot }}

  resistor(down_ from LOD to (LOD,G)); llabel(,\SI{51}{\ohm}); corner
  line to (Q2.S,Here) then to Q2.S

',
`box wid 2*boxwid "Mixer cct" "requires dpic"')
.PE
