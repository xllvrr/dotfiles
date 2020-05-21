.PS
# ThreeSVG.m4: three-phase oscillator
cct_init(svg_font(sans-serif,11bp__))

define(`section',`[ I: Here
  resistor(right elen_*0.75); llabel(,R/2)
T: dot
  line down dimen_/2 then right_ dimen_/4
  Amp: opamp(,,,,,{
    rgbfill(0.9*255,0.6*255,0.1*255,line to N then to E then to S then to Here)
    "-" at In1 ljust
    "+" at In2 ljust }
    ) with .In1 at Here 
  line left dimen_/4 from Amp.In2 then down dimen_/4; G: ground(,,)
  resistor(from T to (Amp.Out,T)); llabel(,R)
O: dot
  { arrow up dimen_*0.5 then right dimen_/4 up dimen_/4
    "`$1'" above }
  line to Amp.Out
  dot(at T+(dimen_/4,0)); line up dimen_*0.6
  capacitor(right_ Amp.Out.x-Here.x-dimen_/4,C); llabel(,2C)
  line to (Here,T); dot
  ]')

A: section(svg_symbol(0&`#'176;))
B: section(svg_symbol(120&`#'176;)) with .I at A.O
C: section(svg_symbol(-120&`#'176;)) with .I at B.O
  move right 22pt__ from C.O

  ground(at (A.I,A.G)+(dimen_/3,0),,)
P:potentiometer(down_ dimen_/2,,0.75,dimen_/2) with .End at Here
  line from P.Start to (A.I,P.Start); dot
  resistor(up_ dimen_*0.75 from P.T1)
  line to A.T

  dot(at B.Amp.Out+(dimen_/3,0)); { "svg_it(V`'svg_sub(c))" at last [].n above }
  resistor(down_ dimen_*0.75)
  { dot; line right (C.T.x-Here.x)/2
    reversed(`diode',up_ dimen_)
    line to C.T }
  resistor(down_ dimen_*0.75)
  dot
  line from C.O right dimen_/4 then down C.O.y-Here.y then to (A.I,Here) \
    then to A.I

 command "</g>" # end font
.PE
