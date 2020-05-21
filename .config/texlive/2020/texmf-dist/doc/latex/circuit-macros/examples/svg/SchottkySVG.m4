% SchottkySVG.m4
.PS
# 4-input positive NAND: the Schottky option for transistors (TI TTL data book)
cct_init(svg_font(sans-serif,11bp__,1bp__))

 tic = dimen_/4
 rlen = dimen_*3/4

E1: dot; line up_ tic
Q1: bi_trans(,,dEBCBUS) with .E at Here; line left tic from Q1.B; B1: Here
 resistor(up_ rlen from Q1.C); llabel(,3 k`'svg_ohm); B2: dot; line right_ tic
Q2: bi_trans(up_ dimen_,,dEBCBUS) with .B at Here
 line from Q2.E to (Q2.E,E1); dot
Gnd: "GND" ljust at Here+(dimen_/2,0)
 dot(at Q2.C)
 { line to (Gnd,Here); "Y" wid 0.3 ljust } 
 line to (Q1.C,Here); dot
 resistor(up_ rlen); llabel(,4 k`'svg_ohm); B4: dot; line right_ tic; up_
Q4: bi_tr with .B at Here
 line from Q4.E to Q2.C
 line up_ tic from B4
Q5: bi_trans(,,dEBCBUS) with .E at Here; line left_ tic from Q5.B; B5: dot
 line from Q5.C to (Q4.C,Q5.C); dot
 { line to Q4.C }
 resistor(up_ rlen); llabel(,120 svg_ohm); dot
Vcc: "Vcc" ljust at (Gnd,Here)
 dot(at (B5,Vcc))
 resistor(to (Here,Q5.C)); llabel(,8 k`'svg_ohm)
 diode(from (B4,Q2.C) to (B5,Q2.C),Z)
 line to (Here,Q5.C)
 diode(from B4 to (Here,B4),Z); dot
 line left_ tic; up_
Q3: bi_trans(,,dEBCBUS) with .C at Here; line left_ tic from Q3.B; B3: Here
 line from Q3.E to (Q3.E,B2); dot
 dot(at (B1,Here)); resistor(down_ to (Here,Q1.C)); rlabel(,1.5 k`'svg_ohm)
 line to B1
 resistor(down_ from B3 to (B3,B2)); rlabel(,12 k`'svg_ohm); line to B2
 line from Vcc to (B3,Vcc); resistor(down_ to (Here,Q5.C))
 rlabel(,20 k`'svg_ohm)
 line to B3
 ground(at (Q3.C,Gnd),,F); dot

 for_(0,3,1,
  `dot(at (B3+(0,tic*m4x)))
   line left_ tic*m4x; diode(left_ dimen_,Z); dot
   {line down_ dimen_; reversed(`diode',down_ dimen_,Z); line to (Here,Gnd) \
    ifelse(m4x,3,`then to Gnd',`; dot') }
   line left_ tic*eval(4-m4x)
   "ifelse(m4x,3,D,m4x,2,C,m4x,1,B,m4x,0,A)" wid 0.15 rjust
   ')

 command "</g>" # end font
.PE

