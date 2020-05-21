divert(-1)
# tubedefs.m4
# macros for the Tubediags.m4 file

# Size parameters
define(`tubediam',`dimen_')
define(`tubethick',`2')
define(`tubepindiam',`tubediam*3/8')
define(`tubeplatelen',`tubediam/2')
define(`tubegridlen',`tubediam*7/12')
define(`tubcathlen',`tubeplatelen-tubethick bp__')
define(`tubedotthick',`1.2')
define(`tubedotdiam',`tubediam/6')
define(`tgap',`tubediam*3/20')

# Generic tubes
                            `triode(diam,R[N|S|E|W])
                              R=tubeplate at bottom
                              N,S,E,W=half circle'
define(`triode',`[ ifelse(`$1',,,`pushdef(`tubediam',`$1')')
  drawEnv(`$2')
  G1: tubegrid(right tubegridlen at Env)
  ifinstr(`$2',R,
   `K1: tubecathode(,`$2') with .s at G1+(0,tgap)
    P1: tubeplate(at G1+(0,-tgap))',
   `K1: tubecathode(,`$2') with .n at G1+(0,-tgap)
    P1: tubeplate(at G1+(0,tgap))')
  `$3' ifelse(`$1',,,`popdef(`tubediam')')] ')

                            `tetrode(diam,R[N|S|E|W])
                              R=tubeplate at bottom
                              N,S,E,W=half circle'
define(`tetrode',`[ ifelse(`$1',,,`pushdef(`tubediam',`$1')')
  drawEnv(`$2')
  ifinstr(`$2',R,
   `G1: tubegrid(right tubegridlen at Env+(0,tgap/2))
    G2: tubegrid(right tubegridlen at G1-(0,tgap))
    P1: tubeplate(at G2-(0,tgap))
    K1: tubecathode(,`$2') with .s at G1+(0,tgap)',
   `G1: tubegrid(right tubegridlen at Env-(0,tgap/2))
    G2: tubegrid(right tubegridlen at G1+(0,tgap))
    P1: tubeplate(at G2+(0,tgap))
    K1: tubecathode(,`$2') with .n at G1+(0,-tgap)')
  `$3' ifelse(`$1',,,`popdef(`tubediam')')] ')

                            `pentode(diam,R[N|S|E|W])
                              R=tubeplate at bottom
                              N,S,E,W=half circle'
define(`pentode',`[ ifelse(`$1',,,`pushdef(`tubediam',`$1')')
  drawEnv(`$2') pushdef(`tgap',`tubediam/8')
  ifinstr(`$2',R,
   `G2: tubegrid(right tubegridlen at Env-(0,tgap/4))
    G3: tubegrid(right tubegridlen at G2-(0,tgap))
    P1: tubeplate(at G3-(0,tgap))
    G1: tubegrid(right tubegridlen at G2+(0,tgap))
    K1: tubecathode(,`$2') with .s at G1+(0,tgap)',
   `G2: tubegrid(right tubegridlen at Env+(0,tgap/4))
    G3: tubegrid(right tubegridlen at G2+(0,tgap))
    P1: tubeplate(at G3+(0,tgap))
    G1: tubegrid(right tubegridlen at G2-(0,tgap))
    K1: tubecathode(,`$2') with .n at G1-(0,tgap)') popdef(`tgap')
  `$3' ifelse(`$1',,,`popdef(`tubediam')')] ')

# utilities
define(`drawEnv',
 `thktmp = linethick; linethick_(tubethick)
  Env: circle invis diam tubediam
  ifinstr(`$1',N,
   `line from Env.w down tubediam*3/2/8
    line from Env.e down tubediam*3/2/8
    arc from Env.e to Env.w',
  `$1',S,
   `line from Env.w up tubediam*3/2/8
    line from Env.e up tubediam*3/2/8
    arc from Env.w to Env.e',
  `$1',E,
   `line from Env.n left tubediam*3/2/8
    line from Env.s left tubediam*3/2/8
    arc from Env.s to Env.n',
  `$1',W,
   `line from Env.n right tubediam*3/2/8
    line from Env.s right tubediam*3/2/8
    arc from Env.n to Env.s',
   `circle diam tubediam') with .c at Env
  linethick_(thktmp) ')

define(`tubedot',`dot(ifelse(`$1',,`at Here',`$1'),tubedotdiam/2,1,thick tubedotthick)')

define(`pin',`circle diam tubepindiam `$1'')

define(`Base_pins',`define(`pincount',`ifelse(`$2',,8,`$2')')dnl
  define(`pinpattern',`ifelse(`$1',,8,`$1')')dnl
  define(`pininit',`ifelse(`$3',,-90,`$3')')dnl
  for_(1,pincount,1,
   `pinang = pininit+360/(2*pinpattern)-m4x*360/pinpattern
    Pin`'m4x: pin(at \
      Base+(Rect_(Base.rad+tubepindiam/2+tubethick/2bp__,pinang)) \
      ifsvg("svg_small(m4x)","\small m4x"))
    {PinT`'m4x: Base+(Rect_(Base.rad+tubethick/2bp__,pinang))} ')
  ')

# structural elements
                            `tubeplate(attributes,length)'
define(`tubeplate',`line thick tubethick right ifelse(`$2',,tubeplatelen,`$2') `$1'')

define(`thinthick',0.4)dnl
define(`thinline',`line thick thinthick')dnl

define(`tubeTab',`[
  ang = ifelse(`$1',,90,`$1')
  ca = cosd(ang); sa = sind(ang)
  tabht = tubepindiam/2
  tabwd = tabht*5/6
  T0: Here
  T1: T0+(vrot_(0,tabwd/2,ca,sa))
  T2: T0+(vrot_(tabht,tabwd/2,ca,sa))
  T3: T0+(vrot_(tabht,-tabwd/2,ca,sa))
  T4: T0+(vrot_(0,-tabwd/2,ca,sa))
  line from T1 to T2 then to T3 then to T4 fill_(ifelse(`$2',,1,`$2'))
  ] with .T0 at Base+(Rect_(tubediam*3/2/2+tubethick/2bp__,ifelse(`$1',,90,`$1')))
 ') 

define(`tubegrid',`dashline(ifelse(`$1',,`right tubegridlen',`$1'),
  thick tubethick,(tubegridlen*7/8/3),(tubegridlen/8/2))')

                            `tubecathode(length,R)'
define(`tubecathode',`[
  box invis wid ifelse(`$1',,tubcathlen,`$1') ht tubeplatelen/6
  ifinstr(`$2',R,
   `line thick tubethick from last box.nw to last box.sw \
      then to last box.se then to last box.ne',
   `line thick tubethick from last box.sw to last box.nw \
      then to last box.ne then to last box.se ')
  `$3'] ')

                            `tubefilament(length,R)'
define(`tubefilament',`[ define(`filalen',`ifelse(`$1',,`tubeplatelen/3',`$1')')dnl
  round(,tubethick) define(`filn',`ifinstr(`$2',R,-)')
  line thick tubethick up filn`'tubeplatelen/3 right tubeplatelen*2/9; round(,tubethick)
  line thick tubethick down filn`'tubeplatelen/3 right tubeplatelen*2/9
  round(,tubethick)
  `$3'] ')

# specific base examples, bottom view
define(`B_2AG',`[ ifelse(`$1',,,`pushdef(`tubediam',`$1')')
  Base: circle thick tubethick diam tubediam*3/2
  Base_pins(8,7)
  Dk1: tubedot(at Base+(0,-tubedotdiam*5/6))
  P1: tubeplate(at Base+(0,tubedotdiam/3))
  thinline from PinT1 to Dk1 chop 0 chop tubedotdiam/2
  thinline from P1 to Base.n
  tubeTab(90)
  `$2' ifelse(`$1',,,`popdef(`tubediam')') ]')

define(`B_2D',`[ ifelse(`$1',,,`pushdef(`tubediam',`$1')')
  Base: circle thick tubethick diam tubediam*3/2
  Base_pins(4,4)
  G1: tubegrid(right tubegridlen at Base)
  F1: tubefilament with .n at G1+(0,-tgap)
  P1: tubeplate(at G1+(0,tgap))
  thtmp = linethick; linethick = thinthick
  T1: tubeTab(105)
  T2: tubeTab(75)
  line from PinT1 to F1.sw
  line from PinT4 to F1.se
  line from G1.start left tubediam*3/2/8 then to T1.T0
  line from P1 up tubediam*3/2/8 then to T2.T0
  linethick = thtmp
  `$2' ifelse(`$1',,,`popdef(`tubediam')') ] ')

define(`B_4BB',`[ ifelse(`$1',,,`pushdef(`tubediam',`$1')')
  Base: circle thick tubethick diam tubediam*3/2
  Base_pins(8,8)
  K1: tubecathode with .n at Base-(0,tgap/2)
  F1: tubefilament with .n at K1.s
  G1: tubegrid(right tubegridlen at K1.n+(0,tgap))
  P1: tubeplate(at G1+(0,tgap))
  pushdef(`hoprad_',`dimen_/16') thtmp = linethick; linethick_(thinthick)
  T1: tubeTab(135)
  T2: tubeTab(-45)
  T3: tubeTab(-90,0)
  line from PinT2 to F1.sw
  L7: line from PinT7 to F1.se
  line up tgap from P1 then to T1.T0
  move to K1.se
  crossover(to (Here,PinT8),,L7)
  line right tgap from G1.end; corner
  crossover(to (Here,T2.T1),,L7); line to T2.T0
  popdef(`hoprad_') linethick_(thtmp)
  `$2' ifelse(`$1',,,`popdef(`tubediam')') ] ')

define(`B_9K',`[ ifelse(`$1',,,`pushdef(`tubediam',`$1')')
  Base: circle thick tubethick diam tubediam*3/2
  Base_pins(10,9,-90-360/20)
  G1: tubegrid(right tubegridlen at Base-(0,tgap/2))
  K1: tubecathode with .n at G1+(0,-tgap)
  F1: tubefilament with .n at K1.s
  G2: tubegrid(right tubegridlen at G1+(0,tgap))
  G3: tubegrid(right tubegridlen at G2+(0,tgap))
  P1: tubeplate(at G3+(0,tgap))
  pushdef(`hoprad_',`dimen_/16') thtmp = linethick; linethick_(thinthick)
  L3: line from G3.start to PinT3
  M6: move from G2.end to (PinT6,G2.end)
  line from M6.start to M6.end then to PinT6
  L7: line from K1.se right tubediam*3/2/5
  L71: line to PinT7
  line up tgap from P1 then left tubeplatelen/2
  { M1: move left tgap down tgap
    M21: move up tgap from PinT1 }
  line to Intersect_(M1,M21)
  crossover(to PinT1,R,L3)
  L8: line right tgap from G1.e
  crossover(to PinT8,,L71)
  line from F1.se to (K1.e+(tgap*3/4,0),F1)
  corner(thinthick)
  crossover(to P1.e+(tgap*3/4,tgap/2),R,L7,L8)
  line to PinT5
  line up tgap*3/2 from PinT9 then to PinT8
  line from F1.sw to (K1.w-(tgap*3/4,0),F1)
  crossover(up P1.y-tgap/2-Here.y,,L3)
  crossover(to PinT4,,M1)
  popdef(`hoprad_') linethick_(thtmp)
  `$2' ifelse(`$1',,,`popdef(`tubediam')') ] ')

# specific tubes
                            `V_6L6G(diam,R[N|S|E|W],G1|G2)
                              R=plate at bottom
                              N,S,E,W=half circle'
define(`V_6L6G',`[ ifelse(`$1',,,`pushdef(`tubediam',`$1')')
  drawEnv(`$2') pushdef(`tgap',`tubediam/8')
  ifinstr(`$2',R,
   `G2: tubegrid(right tubegridlen at Env-(0,tgap/4))
    G3: dashline(right tubegridlen at G2-(0,tgap),thick tubethick,
          (tubegridlen*3/10),(tubegridlen*4/10))
    P1: tubeplate(at G3-(0,tgap))
    G1: tubegrid(right tubegridlen at G2+(0,tgap))
    K1: tubecathode(,`$2') with .s at G1+(0,tgap)
    line from K1.nw down tgap/2 left tgap
    crossover(to (Here,G3),R,ifelse(`$3',,G1,`$3')); corner; line to G3.w ',
   `G2: tubegrid(right tubegridlen at Env+(0,tgap/4))
    G3: dashline(right tubegridlen at G2+(0,tgap),thick tubethick,
          (tubegridlen*3/10),(tubegridlen*4/10))
    P1: tubeplate(at G3+(0,tgap))
    G1: tubegrid(right tubegridlen at G2-(0,tgap))
    K1: tubecathode(,`$2') with .n at G1-(0,tgap)
    line from K1.sw up tgap/2 left tgap
    crossover(to (Here,G3),,ifelse(`$3',,G1,`$3')); corner; line to G3.w ')
    popdef(`tgap') `$4' ifelse(`$1',,,`popdef(`tubediam')')] ')

                            `5U4G rectifier(diam,R)'
define(`V_5V4G',`[ ifelse(`$1',,,`pushdef(`tubediam',`$1')')
  drawEnv(`$2')
  P1: line thick tubethick up tubediam/3 with .c at Env-(tubediam/6,0)
  P2: line thick tubethick up tubediam/3 with .c at Env+(tubediam/6,0)
  ifinstr(`$2',R,
   `F1: tubefilament(,R) with .n at Env.n-(0,tubediam/20) ',
   `F1: tubefilament with .s at Env.s+(0,tubediam/20) ')
  `$3'] ')

divert(0)dnl
