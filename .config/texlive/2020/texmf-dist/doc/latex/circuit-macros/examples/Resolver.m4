.PS
# `Resolver.m4'
cct_init
s_init(tst)
sinclude(tst.dim)

iflatex(`latexcommand({\scriptsize\sf)')

[
linewid = linewid*1.25
define(`dotrad_',dotrad_/2)

  T1: transformer(down_ dimen_/2)
    line left from T1.P1; dot; move left 15bp__ "RH"
    line left from T1.P2; dot; "RL" rjust
   "Rotor ($r$)" at T1.TP rjust
    line right_ dimen_*3/4 from T1.S2
  C: Here
    phi = 35
    move right_ 0.1 from T1.S1; move from C to C+(Rect_(0.1,90+phi))
  Q: Intersect_(last move,2nd last move) 
  Lr: inductor(from Q to C)
  S1: line from T1.S1 to Q
  A: C+(Rect_(dimen_*0.9,90+phi))
  thinlines_
    line dashed from Q to A chop 2bp__ chop 0
   "Rotor shaft" at last line.end rjust "angle" rjust "" rjust
    line dashed from C up_ dimen_*0.9 chop 2bp__ chop 0
    arcd(C,dimen_*0.85,90,90+phi) ->
  thicklines_
    f_box($\phi$) at C+(Rect_(dimen_*0.85,90+phi/2))

    d = distance(T1.P1,T1.P2)
  Ls: inductor(up_ d from C+(d/2,0))
    line right_ from Ls.end
  D2: dot; "S2" ljust
    line from Ls.start to (D2,Ls.start); dot; "S4" ljust
   "$Kr\cos(\phi)$" at 0.5 between last "" and 2nd last ""
  Lq: inductor(right_ d at (Lr,(C+(0,-d/3))))
    line from Lq.end down_ d/4
  K: Here; corner; line to (D2,K); dot; "S3" ljust
    line from Lq.start down_ d*5/4
  L: Here; corner; line to (D2,L); dot; "S1" ljust
   "$Kr\sin(\phi)$" at 0.5 between last "" and 2nd last ""
]
"Resolver essentials" at last [].s below

iflatex(`latexcommand(})')
.PE 
