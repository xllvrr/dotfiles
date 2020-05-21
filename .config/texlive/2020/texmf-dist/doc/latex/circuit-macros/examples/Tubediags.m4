.PS
# Tubediags.m4

cct_init
include(tubedefs.m4)

iflatex(`latexcommand({\sf)')

Overall:[

# Some base diagrams
[ Loopover_(`xv',`
  V_`'xv: m4xpand(B_`'xv) ifelse(m4Lx,1,,
    `with .Base at last [].Base+(dimen_*3,0)')
  "xv" at V_`'xv.Base.s+(0,-dimen_/3) below',
  2AG,2D,4BB,9K) ]

# Test circuit
[
Ld: dot
  battery(up dimen_,2)
  line right_ dimen_
Pot1: potentiometer(down_ dimen_*2,5) with .Start at Here
  line from Pot1.End left_ dimen_
  battery(up_ to Ld,2)
Tg: dot(at Pot1.T1)
  source(right_ dimen_ from Pot1.T1,"\scriptsize \si{\mu A}")
  line right_ dimen_/3
Tr: triode with .G1.w at Here
  line from Tr.K1.sw to (Tr.K1.sw,Pot1.End); dot
  { line down dimen_/2
B: dot }
  source(to (Tg,Here),"\scriptsize V"); corner; line to Tg
  line from Tr.P1.c to (Tr.P1.c,Pot1.Start)
  source(right_ elen_,"\scriptsize mA"); llabel(-,,+); rlabel(,I_b)
Tp: dot
  { source(down_ to (Here,B),"\scriptsize V"); llabel(+,,-); rlabel(,E_b); dot}
  line right_ dimen_/2 then down_ (Here.y-B.y)/2 then right_ dimen_/2
P2: potentiometer(down_ Tp.y-B.y,5,0.5,-dimen_/6) with .T1 at Here
  dot(at P2.End)
  line right_ dimen_ from P2.Start; corner
  battery(down_ dimen_*3/4,2,R)
T: Here
  battery(up_ dimen_*3/4 from (Here,B),2)
  line dashed up_ to T "B" ljust
  line from (T,B) left T.x-Ld.x+dimen_/2 then up Ld.y-B.y then to Ld
  ] with .nw at last [].sw + (0,-dimen_/2)

# Circuit of 25 W amplifier (adapted from F. Langford-Smith, "Radiotron
# Designer's Handbook," fourth edition, Harrison, NJ, Radio Corporation
# of America, 1952)

define(`OutputXformer',`[ pushdef(`dimen_',dimen_*1.5)
  S1: inductor(up_ dimen_*.4,L,3,M)
  { line right_ dimen_/4 from last [].e; S2T: dot(,,1)
    line from S1.end right_ S2T.x-S1.end.x; S21: dot(,,1)
    line from S1.start right_ S2T.x-S1.end.x; S22: dot(,,1) }
  move up_ dimen_/8
  S2: inductor(up_ dimen_*.4,L,3,M)
  { line right_ dimen_/4 from last [].e; S1T: dot(,,1)
    line from S2.end right_ S2T.x-S2.end.x; S11: dot(,,1)
    line from S2.start right_ S2T.x-S2.end.x; S12: dot(,,1) }
  line down_ dimen_/8 from M4Core1.start
  line down_ dimen_/8 from M4Core2.start
  P: inductor(down_ dimen_*0.6 with .c at 0.5 between S1.end and S2.start \
    -(dimen_*0.8,0),L,5,)
  P1: P.start
  P2: P.end
  PT: last [].w
  popdef(`dimen_')]')

define(`PowerXformer',`[ pushdef(`dimen_',dimen_*1.5)
  S3: inductor(up_ dimen_*.2,L,1,M)
  ST3: last [].e
  { line up_ dimen_/10 from M4Core1.end; line up_ dimen_/10 from M4Core2.end }
  S2: inductor(up_ dimen_*.2 from S3.end+(0,dimen_/10),L,1,M)
  { line up_ dimen_/10 from M4Core1.end; line up_ dimen_/10 from M4Core2.end }
  S1: inductor(up_ dimen_*.4 from S2.end+(0,dimen_/10),L,3,M)
  ST1: last [].e
  P: inductor(down_ dimen_*0.6 with .c at 0.5 between S1.end and S3.start \
    -(dimen_*0.8,0),L,5,)
  popdef(`dimen_')]')

[ Toprail: Here
#{"Toprail"}
  resistor(down_ dimen_); rlabel(,\SI{100}{\kilo{}})
V1P: dot
#{"V1P" rjust}
  line down_ dimen_*3/4
V1: triode(,W) with .P1 at Here
  {"6SL7" at V1.nw above }
  resistor(down_ dimen_*3/2 from V1.K1.sw); llabel(,2200)
Rail1: dot
#{"Rail1"}
  ground
  arrow left_ from V1.G1.w
RP: Here
  arrow <- right from (Here,Rail1) to Rail1
  dot(at last arrow)
  resistor(up_ 2nd last arrow.y-Here.y); llabel(,\SI{22}{\kilo{}}); dot
  { move left_ dimen_ }; "Pickup" at RP below
  capacitor(right_ dimen_ from V1P,C,R); llabel(,\SI{0.05}{\micro{}})
  resistor(down_ dimen_); rlabel(,\SI{470}{\kilo{}})
V1o: dot
#{ "V1o" at V1o rjust }
  resistor(down_ (Here.y-Rail1.y)/2); rlabel(,\SI{22}{\kilo{}})
  dot
  { capacitor(down_ Here.y-Rail1.y,C); rlabel(,\SI{0.01}{\micro{}}); dot }
  line right_ dimen_/2
R47: resistor(down_ to (Here,Rail1)); llabel(,,\SI{4.7}{\mega{}})
  line to Rail1

Pot1: potentiometer(down_ dimen_,,0.5,dimen_*2/3) \
  with .T1 at (V1o+(elen_+dimen_*2/3,0),V1.G1)
  { line from Pot1.Start left_ (Pot1.Start.x-V1o.x)/2
    continue to (Here,V1o) then to V1o }
  line from Pot1.End down_ dimen_/3
Rail2: dot
  ground
V2: triode(,E) with .G1.w at Pot1.T1; "6SL7" at V2.ne above
  resistor(from Rail2 right_ V2.K1.e.x-Rail2.x); rlabel(,\SI{22}{\kilo{}}); dot
  { capacitor(right_ dimen_,C,R); rlabel(,\SI{2}{\nano{}})
V2k: dot }
#{ "V2k" at V2k above }
  { line down_ to (Here,Rail1)
    variable(`resistor(right_ dimen_); rlabel(,\SI{1}{\mega{}});')
    line up_ to V2k }
  line to V2.K1.se

  line from Toprail to (R47,Toprail); dot
  { capacitor(down_ dimen_,C); rlabel(\SI{10}{\micro{}}); ground(,T) }
  R51k: resistor(right_ dimen_); rlabel(,\SI{51}{\kilo{}}); dot
  { capacitor(down_ dimen_,C); llabel(\SI{10}{\micro{}}); ground(,T) }
  dot(at (V2.P1.c,Here))
  resistor(down_ dimen_); llabel(,\SI{100}{\kilo{}})
V2p: dot
  line to V2.P1

V3: triode(,W) with .G1.w at (V2k+(dimen_,0),V2.G1)
  "$\;$6SL7" at V3.n below ljust
  resistor(from V3.K1.sw to (V3.K1.sw,Rail1)); llabel(,\SI{1.5}{\kilo{}}); dot; ground
  line left_ dimen_/2
  resistor(up_ to (Here,V3.G1)); llabel(2.2); rlabel(\hbox{M}); dot
  { line to V3.G1.w }
  line to (Here,V2p); capacitor(left_ to V2p,C,R); rlabel(,\SI{3}{\nano{}}) 

  dot(at (V3.P1.c,Toprail)); { line to R51k.end }
  resistor(down_ dimen_); llabel(,\SI{51}{\kilo{}})
V3p: dot
#{"V3p"}
  line down_ (Here.y-V3.n.y)/2
V3q: dot; { line to V3.P1.c }
  capacitor(left_ dimen_*2/3,C); rlabel(,\SI{0.1}{\micro{}})
  line to (V2k,Here)
  resistor(down_ to V2k); rlabel(0.1); llabel(\si{\mega{}})
#{"V2k" at V2k}

V4: triode(,E) with .G1.w at (V3.G1.e+(dimen_*2,0),V3.G1)
  "6SL7" at V4.n above rjust
  resistor(from V4.K1.se to (V4.K1.se,Rail1)); rlabel(,,\SI{1.5}{\kilo{}})
V4k: dot
#{"V4k"}
  line left dimen_*3/4
V4k1: dot
  { resistor(up_ V4.G1.y-Here.y); llabel(,,\SI{2.2}{\mega{}})
V4G: dot }
  line from V3p right_ dimen_
  variable(`resistor(down_ to (Here,V4.G1)); llabel(\SI{100}{\kilo{}})')
V3o: dot 
  capacitor(right_ to V4G,C); llabel(,\SI{3}{\nano{}}) 
  line to V4.G1.w
  resistor(left_ from V4k1 to (V3o,V4k)); rlabel(,\SI{51}{\kilo{}}); dot
  ground
  capacitor(down_ from V3o to Here,C); llabel(,,\SI{500}{\pico{}})
  
  line from V4.P1.c to (V4.P1.c,V3p);
  resistor(up_ dimen_); llabel(,\SI{51}{\kilo{}}); dot
  resistor(left_ to (V3p,Here)); llabel(,\SI{10}{\kilo{}})

V5: triode(,N) with .G1.w at V4.G1.e+(2.25*dimen_,0)
  "6SL7" at V5.n above rjust
V6: triode(,SR) with .G1.w at V5.G1.w-(0,dimen_*2.5)
  "6SL7" at (V6.w,V6.P1) below rjust

V4p: dot(at (V4.P1.c,V3p))
#{"V4p"}
  line right_ dimen_*2/3; capacitor(right_ dimen_,C); llabel(,\SI{3}{\pico{}})
  line down_ to (Here,V5.G1)
V5G: dot; { line to V5.G1.w }
#{"V5G"}
  resistor(down_ dimen_); rlabel(,\num{2.2}); llabel(,\si{\mega{}}); dot
  resistor(right_ to (V5.K1.sw,Here)); llabel(,\SI{1}{\kilo{}})
V5K: dot
#{"V5K"}
  line to V5.K1.sw
  line from V4k down_ V4k.y-V6.G1.y then right_ V5G.x-V4k.x - dimen_
  capacitor(right_ dimen_,C); rlabel(,\SI{3}{\pico{}})
V6G: dot; { line to V6.G1.w }
#{"V6G"}
  resistor(up_ dimen_); llabel(,2.2); rlabel(,\si{\mega{}}); dot
  resistor(right_ to (V6.K1.nw,Here)); llabel(,\SI{1}{\kilo{}})
V6K: dot
#{"V6K"}
  line to V6.K1.nw
  resistor(left_ dimen_*2/3 from (V6G,V6K));rlabel(,\SI{1}{\kilo{}}) dot; ground
  line to (Here,V5K); resistor(right_ dimen_*2/3); llabel(,\SI{1}{\kilo{}})

PV: dot(at (V4.e.x+dimen_/5,Toprail.y)) 
#{"PV"}
  line from V6.P1.c down_ V4p.y-V4.P1.c.y
Rail2: dot
#{"Rail2" below}
  line from PV to (PV,Rail2); corner
  { resistor(right_ to Rail2); llabel(,\SI{220}{\kilo{}}) }
  move up_ dimen_*2/3; dot; line left_ dimen_/2
V6sw: dot
#{"V6sw"}
  capacitor(down_ dimen_*2/3,C); rlabel(,\SI{10}{\micro{}}); ground(,T)

V5P: dot(at (V6.P1.c,V4p)); { line to V5.P1.c }
#{"V5P"}
  resistor(to (Here,Toprail)); rlabel(,\SI{220}{\kilo{}})
  line to (V4p,Here)

  V7: V_6L6G at (V3,Rail2+(0,-2*dimen_)); "6L6G" at V7.n above ljust
  V8: V_6L6G(,R) at V7+(0,-2*dimen_); "6L6G" at V8.s below ljust
  line right dimen_/4 from V7.G2.e; resistor(right_ dimen_); llabel(,100);
V9G: dot
#{"V9G"}
  line right dimen_/4 from V8.G2.e; resistor(right_ dimen_); llabel(,100);
  V9: V_6L6G(,,G2) with .G2.w at V9G+(dimen_/2,0); "6L6G" at V9.n above rjust
  V10: V_6L6G(,R,G2) at V9+(0,-2*dimen_); "6L6G" at V10.s below rjust
  line from V9G to V9.G2.w
  line from V10.G2.w left_ dimen_/2
L910: line from V9G to (V9G,V10.G2); dot
  line left_ dimen_/2 from V7.G1.w
V7G: dot
#{"V7G"}
  resistor(down_ to 0.5 between Here and (Here,V10.G1))
   rlabel(,\SI{220}{\kilo{}})
V7T: dot
#{"V7T"}
  { line left_ dimen_/3; corner; ground }
  line from V8.G1.w to (V7G,V8.G1); dot
  resistor(up_ to V7T); llabel(,\SI{220}{\kilo{}})

  line from V9.K1.sw to V10.K1.nw
  line from V7.K1.sw to V8.K1.nw
V7K: dot(at last line.c+(0,dimen_/8))
#{"V7K"}
  line left_ dimen_*2; dot
  { capacitor(down_ dimen_/2,C); llabel(,\SI{50}{\micro{}}); ground(,T) }
PP: potentiometer(left_ dimen_,,0.5,dimen_/2) with .Start at Here
  rlabel(,50\ \SI{10}{W})
  corner(,at PP.T1); line left_ dimen_ then up_ dimen_/4
  round(,tubethick)
  line thick tubethick up tubeplatelen/3 left tubeplatelen*2/9
  round(,tubethick)
  line thick tubethick down tubeplatelen/3 left tubeplatelen*2/9
  line down_ dimen_/4 then left_ dimen_ then up_ dimen_/4
  round(,tubethick)
  line thick tubethick up tubeplatelen/3 left tubeplatelen*2/9
  round(,tubethick)
  line thick tubethick down tubeplatelen/3 left tubeplatelen*2/9
  line down_ dimen_/4; ground
  "1st two 6SL7" at Here+(dimen_*3/4,dimen_/2) above

V9T: dot(at (L910,V7K)-(0,dimen_/4))
#{"V9T"}

  line right_ dimen_/2 from V9.G1.e; continue to (Here,V9.P1)+(0,dimen_*2/3)
  resistor(left_ to (V7G,Here)); llabel(,100)
V7nw: dot; { line to (Here,V7.G1) }
  line right_ dimen_/2 from V10.G1.e; continue to (Here,V10.P1)-(0,dimen_*2/3)
  resistor(left_ to (V7G,Here)); rlabel(,100)
V8sw: dot; { line to (Here,V8.G1) }

  line from V9.P1.c up_ dimen_
V9P: dot
  line from V10.P1.c down_ dimen_
V10P: dot
#{"V10P"}

  line from V7.P1.c up_ V9P.y-V7.P1.y then to V9P
  resistor(right_ to (V5.e+(dimen_/4,0),Here))
  rlabel(,\shortstack{\SI{100}{\kilo{}}\\ \SI{2}{W}})
Rt1: Here
  line to (Here,V6.e)+(0,dimen_/6); resistor(up_ dimen_)
  llabel(,\shortstack{\SI{100}{\kilo{}}\\ \SI{2}{W}})
  line to (Here,V5K) then to V5K
  line from V8.P1.c down_ V8.P1.y-V10P.y then to V10P
  resistor(right_ to (V6.e+(dimen_/2,0),Here))
  llabel(,\shortstack{\SI{100}{\kilo{}}\\ \SI{2}{W}})
  resistor(up_ dimen_*3/2)
  llabel(,\shortstack{\SI{100}{\kilo{}}\\ \SI{2}{W}})
  line to (Here,V6K) then to V6K
  
  line from V9T to (V9.e+(dimen_*3/4,0),V9T)
Xout: OutputXformer with .PT at Here
  line from Xout.P1 to (Xout.P1,V9P); dot
  line from Xout.P2 to (Xout.P1,V10P); dot
  line from Xout.PT left_ dimen_/4
XT: dot

  resistor(from V6sw left_ dimen_); rlabel(,\SI{10}{\kilo{}})
XP: dot
  { line down_ dimen_; continue to (XT,Here) then to XT }

  capacitor(right_ dimen_*5/4 from V5P,C); llabel(,\SI{0.1}{\micro{}})
  corner; line to (Here,Rail2)-(0,dimen_/2)
  continue to (V7nw,Here) then to V7nw
  line from V8sw down_ dimen_*5/8
  continue to (Rail2,Here) then to (Rail2,V9.n)
  capacitor(up_ dimen_/2,C,R); rlabel(,\SI{0.1}{\micro{}})
  line to Rail2

  line from XP left_ dimen_*2; dot
  { dot(at Here+(dimen_,0))
    { "290 V" at last [].n above }
R100: resistor(down_ dimen_*2/3)
    llabel(,\shortstack{\SI{100}{\kilo{}}\\ \SI{2}{W}}); dot; ground }
  { capacitor(down_ dimen_*2/3,C); llabel(,\SI{40}{\micro{}}); dot }
  reversed(`inductor',left_ dimen_,L,,M); rlabel(,\SI{4}{H}\; \SI{300}{\mA})
Filt: dot
  { capacitor(down_ dimen_*2/3,C); llabel(,\SI{40}{\micro{}})
    line to R100.end }

Pwr: [
  PXform: PowerXformer
    line left_ dimen_/4 from PXform.P.start; fuse(left_ dimen_/2,D)
  AC1: arrow left_ dimen_/2
  AC2: arrow from PXform.P.end to (AC1.end,PXform.P.end)
  "AC" at 0.5 between AC1.end and AC2.end ljust 
    dot(at PXform.ST3); line right_ dimen_/4; dot
    dot(at PXform.ST1); line right_ dimen_/4 then down_ dimen_*3/2; ground(,T)
  line from PXform.S2.end right_ dimen_*2.5 then up_ dimen_/4
  Rect2: V_5V4G with .F1.sw at Here; "5V4G" at Rect2.n+(0,dimen_/2)
  Rect1: V_5V4G with .e at Rect2.w-(dimen_/2,0); "5V4G" at Rect1.n+(0,dimen_/2)
  move to Rect1.F1.sw; line to (Here,PXform.S2.end); dot
  move to Rect1.F1.se; line to (Here,PXform.S2.start); dot
  move to Rect2.F1.se; line to (Here,PXform.S2.start)
PO: dot
  line from Rect1.P1 left_ dimen_/2; dot
  { line to (Here,PXform.S1.start) then to PXform.S1.start }
  line to (Here,Rect1.n)+(0,dimen_/8)
  continue to (Rect1.P2+(dimen_/2,0),Here)
  continue to (Here,Rect1.P2) then to Rect1.P2
  line from Rect2.P1 left_ dimen_/2 then up_ Rect2.ht/2+dimen_/4; dot
  { line to (Rect2.P2+(dimen_/2,0),Here)
    continue to (Here,Rect2.P2) then to Rect2.P2 }
  move to PXform.S1.end
  line right_ dimen_/8 then up last [].y - Here.y then to last [].w 
  arrow from PXform.S3.start right_ dimen_
  arrow from PXform.S3.end   right_ dimen_
  "\SI{5}{V}" at PXform.S2 + (dimen_*3/4,0)
  "\SI{6.3}{V}" at 0.5 between last arrow.end and 2nd last arrow.end ljust
  ] with .nw at (RP,Filt)+(0,dimen_/4)
  line from Pwr.PXform.S2.start to Pwr.PO + (dimen_*3/4,0); corner
  resistor(up_ to (Here,Filt)); rlabel(,\shortstack{V\\\hbox{adj}}); corner
  line to Filt

  ] with .nw at last [].sw+(0,-0.5)
#showbox_

]
#showbox_
#print last [].wid,last [].ht

iflatex(latexcommand(}))
.PE
