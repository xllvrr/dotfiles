.PS
cct_init(svg_font(Helvetica,7pt__))
# HeathkitSVG.m4
#                               Landscape
maxpswid = 11
maxpsht = 8.5

#                               llabel and rlabel without math mode
define(`Llabel',`llabel(
 ifelse(`$1',,,`m4lstring(`$1',"`$1'")'),
 ifelse(`$2',,,`m4lstring(`$2',"`$2'")'),
 ifelse(`$3',,,`m4lstring(`$3',"`$3'")'))')
define(`Rlabel',`rlabel(
 ifelse(`$1',,,`m4lstring(`$1',"`$1'")'),
 ifelse(`$2',,,`m4lstring(`$2',"`$2'")'),
 ifelse(`$3',,,`m4lstring(`$3',"`$3'")'))')

#                               Grid parameters
  picwid = 8.5
  picht = 6
  g = 1/12

#                               Element scaling
  linewid = 8*g
define(`dimen_',dimen_*4/5)
#                               Default sizes
  boxwid = 2*g
  boxht = 2*g
  arrowht = arrowht*2/3

#                               Grid
  linethick_(0.4)
  for i=0 to picwid/g do { line color "lightgray" up picht from (i*g,0) }
  for i=0 to picwid/g by 10 do { sprintf("%g",i) at (i*g,0) below }
  for i=0 to picht/g do { line color "lightgray" right picwid from (0,i*g) }
  for i=0 to picht/g by 10 do { sprintf("%g",i) at (0, i*g) rjust }
  move left 2*g from (0,0)
  linethick_(0.8)

  spline outlined "white" shaded "white" \
    from (0,picht+g) down g then down picht/5 then right picwid/5
  for i=1 to 4 do { continue down picht/5 then right picwid/5 }
  continue right 2*g then up 2*g
  continue up picht-2*g then up g then left g

#                               Place the bottom inductor on the grid
  I1: inductor(down_ 13*g from (80,22)*g,,13,,g)
  I2: inductor(down_ 10*g from I1.start+(0,21*g),,10,,g)
  I3: inductor(down_ 10*g from I2.start+(0,12)*g,,10,M,g)
    line from M4Core1.end to (M4Core1,I1.end)
    line from M4Core2.end to (M4Core2,I1.end)
  Scrn: 2 between M4Core1.start and M4Core2.start
    line dashed from Scrn to (Scrn,I1.end)
    ground
  I4: inductor(up_ 5*g from (Scrn.x+M4Core1.x-I2.x,I2.start.y-2*g),,5,,g)
  I5: inductor(up_ 5*g from (I4,I2.end+(0,g)),,5,,g)

#                               Circuit board
  Board: box dashed thick 2 wid 58*g ht 55*g with .se at I1.end+(-7,-2)*g
  P: box invis wid 12*g ht 4*g with .s at Board.sw+(26*g,0) \
    "POWER SUPPLY" "CIRCUIT BOARD"
  line dashed thick 2 from P.sw to P.nw; line dashed thick 2 to P.ne
  line dashed thick 2 to P.se

define Pad { P`$1': box fill_(1) "$1" }
#                               Board connections on the right
  Pad(1) at (Board.e,I1.end)
    line from P1.e to I1.end "RED" above
  Pad(2) at (Board.e,I1.start)
    line from P2.e to I1.start "RED" above
  Pad(3) at (Board.e,I2.end)
    GRN1: line left 4*g from I2.start "GRN" above ; ground
    GRN2: line from P3.e to I2.end "GRN" above
    spline <-> from GRN2.end+(-g,0) up 2.5*g right 0.5*g then up 5*g left g \
      then up 2.5*g right 0.5*g
    box invis fill_(1) wid 3*g ht g "6 VAC" at I2-(2*g,0)
  Pad(4) at P3-(0,3)*g
    line right_ 3*g from P4.e "BRN" above
    arrow down_ 2*g ht arrowht*2/3
    "TO DIAL" "LAMPS" at Here+(0,-g)
  Pad(5) at (Board.e,I3.end)
    line from P5.e to I3.end "BLU" above
  Pad(7) at (Board.e,I3.start)
    line from P7.e to I3.start "BLU" above
  Pad(6) at 0.5 between P5 and P7
    line from P6.e to I3 "BLU-YEL" above

#                               Power wiring, plug, switch
define(`socket',`[
  Outer: box wid dimen_*2/3 ht dimen_/2*3/4
  L: box wid dimen_/16 ht dimen_/4 at Outer-(dimen_/6,0)
  R: box wid dimen_/16 ht dimen_/4 at Outer+(dimen_/6,0)
  line from Outer.w to L.w
  line from Outer.e to R.e
  ] ')

  BLK: line from I4.end to (int(I4.end.x/g+8)*g,I4.end.y) "BLK" below ; dot
    b = lin_leng(BLK)
  BLKYEL: line from I4.start right_ b "BLK-YEL" above ; dot
  BLKGRN: line from I5.end right_ b "BLK-GRN" below ; dot
  BLKRED: line from I5.start right_ b "BLK-RED" above ; dot
    line right_ g; PL: dot
    line from BLKYEL.end right g then to Here+(0,-g)
    fuse(down_ 3*g,D)
    {"3 A FUSE" "SLOW BLOW" at last line+(-5*g,0) }
    line to (Here.x,int(Here.y/g)*g-g); dot
  Sckt1: socket at Here+(5,0)*g
    line from Sckt1.w to (PL,Sckt1); A: dot; "A" rjust
    line from Sckt1.e right_ lin_leng(last line); B: dot; "B" ljust
  Sckt2: socket at (Sckt1,P1+(0,6)*g)
    line from Sckt2.w to (A,Sckt2); dot
    line from Sckt2.e to (B,Sckt2); dot
  Sckt3: socket at (Sckt1,P1+(0,2)*g)
    line from Sckt3.w to (A,Sckt3); dot
    line from Sckt3.e to (B,Sckt3); dot

define(`plug',`[ w = dimen_*2/3; q = 0.25*w
  F: line right_ w
    arc cw from F.start to F.end with .c at F
  T1: F+(-q,w/2+g/2)
  T2: F+( q,w/2+g/2)
    line from T1 to (T1,F)-(0,2*g)
    line from T2 to (T2,F)-(0,2*g) ]')

  PP: plug with .F at Sckt3+(0,-8)*g
    {"120 VAC" ljust "50/60 Hz" ljust at PP.e }

define(`pwrswitch',`[ right; circlerad = 1.75*g/2
  C1: circle "1"
  C4: circle "4"
  C2: circle "2" with .n at C1.s+(0,-C1.diam/2)
  C5: circle "5"
  C3: circle "3" with .n at C2.s+(0,-C1.diam/2)
  C6: circle "6"
  hatchbox(wid g ht C2.n.y-C3.s.y,0.05) with .w at 0.5 between C5.e and C6.e
  ]')

  Psw: pwrswitch with .C4.e at Sckt1+(0,-4*g)
    "POWER" at Psw.w+(-2*g,0) rjust
    arrow up Psw.ht/2 at Psw.e+(1.5*g,0)
    "ON" above; "OFF" at last arrow.start below
    line from Psw.C1.w to (A,Psw.C1) then to A
    line from Psw.C2.w to (A,Psw.C2); continue to (Here,PP.T1) then to PP.T1
    line from PP.T2 to (B,PP.T2) then to (B,I4.end) then to I4.end
    line from BLKGRN.end to (B,BLKGRN); dot

#                               Bottom connections
  Pad(25) at Board.se+(-3,0)*g
  R516: resistor(down_ 6*g from P25.s)
    {"R516" "22" at last line+(-2*g,0)} ; ground(,T)
    dot(at P25.s+(0,-g)); line right_ 5*g
    reversed(`source',down_ 4*g,B)
    {"#49" ljust "HI" ljust "TEMP" ljust at last line+(2*g,0) }
    line to (P25,Here); dot
    t = linethick; linethick_(0.4)
    arrow <- from P25.s+(0,-g/2) right_ 2*g up_ g/4; "BRN" ljust; linethick_(t)

  Pad(24) at P25+(-4,0)*g
    line from P24.s to (P24,R516.end); ground(,T)
  Pad(23) at Board.sw+(12*g,0)
    line from P23.s to (P23,R516.end); ground(,T)

  Pad(22) at Board.sw+(0,3)*g
  R514: resistor(right_ 8*g from P22.e); Llabel(,R514); Rlabel(,680 K)
    dot; { ground }
    line to (P23,Here) then to P23.n

#                               Diode bridge
  BE: dot(at (P24,I1))
    d1h = lin_leng(I1)/2
    diode(left_ d1h up_ d1h); Rlabel(,,D508)
  BN: dot
    diode(left_ d1h down_ d1h); Rlabel(D506)
  BW: dot
    diode(from BE left_ d1h down_ d1h); Llabel(,,D509)
  BS: dot
    diode(left_ d1h up_ d1h); Llabel(D507)
    capacitor(down_ from BN to BS,C); Llabel(C507,,.22)
    line from BE to P24.n
    line from BN to P2.w
    line from BS to P1.w
    spline <-> from (BE.x+2*g,BS.y) \
      up d1h/2 right g/2 then up d1h left g then up d1h/2 right g/2
    box invis fill_(1) ht 2*g wid 2*g "57" "VAC" at last spline

#                               Left board connections
  Pad(21) at (Board.w,BW); line from P21.e to BW
  Pad(19) at P21+(0,-3*g)
  Pad(20) at P21+(0, 3*g)

#                               Transistor with circles
define(`hbi_tr',`[ linewid = linewid*4/4.16
  Q: bi_tr(`$1',`$2',`$3',E)
  E: circle rad m4_xyU at 5/4 between Q.A1 and Q.E "E"
  B: circle rad m4_xyU at 5/4 between Q.A1 and Q.B "B"
  C: circle rad m4_xyU at 5/4 between Q.A1 and Q.C "C"
  ]')

#                               Interior circuits
  line from P6.w left 2*g; ground
  line from P5.w left 4*g; dot
  { C504: capacitor(down_ 4*g,C); Llabel(C504,,.22); ground(,T) }
  D504: diode(left_ 5*g); Rlabel(,D504); dot
  { C505: capacitor(down_ to (Here,C504.end),C+L)
    Rlabel(C505,100,75 V); ground(,T) }
  line right_ to (Here,P7); dot
  { D503: reversed(`diode',to (D504.start,Here)); Llabel(,D503); line to P7.w }
  d3 = lin_leng(I3)
  spline <-> from C504.start+(g/2,0) \
    up d3/4 right g/4 then up d3*2/4 left g/2 then up d3/4 right g/4
  box invis fill_(1) ht g wid 4*g "100 VAC" at last spline+(-g,0)

  down_
  Q503: hbi_tr(,R,P) with .E at (C505,P3)
    line from Q503.C.e to (P25,Q503.C) then to P25.n
    line from Q503.B.s to (Q503.B.x,Q503.E.y-4*g)
  R513: resistor(down_ 5*g)
    {"R513" ljust "1500" ljust at last [].e}; ground(,T)
    line from P19.e to (BW-(2*g,0),P19) then up Q503.E.y-P19.y+2*g
  R511: resistor(right_ 5*g); Llabel(,R511); Rlabel(,470);
    line to (Q503.E,Here) then to Q503.E.n
    line from P20.e to (BW,P20) then up R513.end.y-P20.y
    resistor(up_ lin_leng(R513))
    {"R512" ljust "5600" ljust "1 W" ljust at last [].e}
    line to (Here,Q503.B) then to Q503.B.w
    "Q503" "S2091 HI TEMP" "CONTROL" at Q503.E+(1.5,4)*g
  D505: reversed(`diode',right_ from Q503.E.e to (C504,Q503.E)); Llabel(,D505)
    line to P3.w

  line from P4.w left_ 2*g then up P3.y-P4.y; dot
  line from D503.end to (R513,D503); dot
  { Pad(8) at (Here,Board.n) }
  { line to P8.s }
  R505: resistor(down_ to (Here,P6)); Llabel(,"R505" ljust "12 K"); dot
  { C503: capacitor(down_ to (Here,C505.end),C+L)
    Rlabel(C503,100,70 V); ground(,T) }
  right_
  Q502: hbi_tr(,R) with .B at (R511.start,Here)
    line from Q502.C.e to R505.start
    line from Q502.B.e to R505.end
  R504: resistor(down_ from Q502.B.s to (Q502.B,C505.end))
    {"R504" ljust "51 K" ljust at last [].e}; ground(,T)
    "Q502" "TA7311" "REGULATOR" "CONTROL" at Q502.C+(-1,3)*g

  Pad(9) at (Q502.E,Board.n)
    line from Q502.E.n to P9.s
  Pad(10) at (Q502.B-(9,0)*g,Board.n)
  R502: resistor(left_ from Q502.E.w to (P10,Q502.E))
    Rlabel(,R502); Llabel(,150); dot

  Pad(11) at (Board.w,Q502.E)
  Pad(14) at P11+(0,2.5)*g
  Pad(12) at P11+(0,-2.5)*g
  Pad(13) at P12+(0,-2.5)*g
    line right 2*g from P13.e then up P11.y-P13.y; dot
    line from P12.e to (Here,P12); dot
  Pad(15) at P13+(0,-3)*g

  right_
  Q501: hbi_tr(,R) with .B at P9.n+(0,2*g)
    line from Q501.B.s to P9.n
    line from Q501.C.e to (P8,Q501.C) then to P8.n
    line from Q501.E.w to (P10,Q501.E) then to P10.n
    "Q501" "2N3055" "REGULATOR" at Q501.n+(0,2)*g
    line from P14.e to (P10,P14); dot

  Pad(17) at (Board.w,R511)
  Pad(16) at P17+(0,3*g)
  Pad(18) at P17+(0,-3*g)
    line right 2*g from P18.e then up P17.y-P18.y; dot

  right_
  Q504: hbi_tr(,R) with .C at (P10,P17)
    line from P17.e to Q504.E.w
    line from Q504.B.s to (Q504.B,R513.start)
  R508:resistor(down_ to (Here,R513.end))
   {"R508" ljust "680" ljust at last [].e}; ground(,T)
    dot(at (P10,P15))
    { line to P10.s }
    { resistor(down_ 5*g); {"225" ljust "10 W" ljust "5 %" ljust at last [].e}
    line to Q504.C.n }
  R503:resistor(left_ 10*g); Rlabel(,R503); Llabel(,290 10 W 5%); dot
    line to (Here,Q504.B)
    resistor(right_ to Q504.B.w); Llabel(,R507); Rlabel(,100)
    line from P15.e to R503.end
    "Q504" "40409" "REGULATOR" at Q504.C+(3.5,3)*g
    resistor(left_ from R502.end to (R503.end,P11))
    Rlabel(,R501); Llabel(,390 5W 5%); line to P11.e

    resistor(right_ from P16.e to (R514.end,P16)); Llabel(,R506); Rlabel(,82)
    line down P16.y-P17.y; dot

    dot(at (R514.end,P11))
  C501: capacitor(down_ 6*g,C+)
    Llabel(C501); {"100" ljust "30 V" ljust at last [].s +(0,-g)}
    ground(,T)
    dot(at (Here.x+4*g,P11.y))
  ZD501: reversed(`diode',down_ lin_leng(C501),Z); Llabel(ZD501); ground(,T)

    dot(at (R514.end,P15))
  C502: capacitor(down_ 6*g,C+)
    Llabel(C502); {"100" ljust "30 V" ljust at last [].s +(0,-g)}
    ground(,T)
    dot(at (Here.x+4*g,P15.y))
  ZD502: reversed(`diode',down_ lin_leng(C502),Z); Llabel(ZD502); ground(,T)

    line from (C502,P17) to (C502,R508.start+(0,g))
  C506: capacitor(down_ to (Here,R508.end),C+)
    Llabel(C506); {"100" ljust "30 V" ljust at last [].s +(0,-g)}
    ground(,T)

#                               Left-side boxes
  boxwid = 10*g
  boxht = 5*g
  line left 3*g from P22.w "GRY" above
  line left 3*g from P19.w "VIOL" above
  box with .e at (Here,0.5 between P19 and P22) "TO SIGNAL" "METER CIRCUIT"

  line left 8*g from P21.w "RED TO C508" above
  line left 8*g from P20.w "VIOL" above

  line left 3*g from P17.w "RED" above
  line left 3*g from P18.w; {"WHT-" ljust "RED" ljust at Here+(0,g) }
  box with .e at (Here,0.5 between P17 and P18) "12.7 V SOURCE" "TO MULTIPLEX"

  line left 3*g from P16.w "WHT" above
  box with .se at Here+(0,-g) "12 V SOURCE" "TO FM TUNER" "SOURCE SWITCH"

  line left 3*g from P15.w "ORG" above
  box ht 3*g with .e at Here "15 V SOURCE" "TO FM TUNER"

  line left 3*g from P13.w "BLU" above
  line left 3*g from P12.w; {"WHT-" ljust "RED" ljust at Here+(0,g) }
  line left 3*g from P11.w "RED" above
  box ht 6*g with .e at (Here,P12) "27 V SOURCE" "TO CONTROL" "PREAMP AND" \
   "PWR AMPLIFIER"

  line left 3*g from P14.w
   {"WHT-" ljust "GRY-" ljust "GRN" ljust at Here+(0,1.5*g) }
  box with .se at Here+(0,-g) "50 V SOURCE" "TO PHONO" "PREAMP"

 command "</g>" # end font
.PE
