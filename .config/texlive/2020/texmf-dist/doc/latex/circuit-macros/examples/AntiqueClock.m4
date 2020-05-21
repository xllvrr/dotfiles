.PS
# AntiqueClock.m4
gen_init
NeedDpicTools

# PSTricks or tikz only:
ifelse(ifpstricks(T)`'ifpgf(T),T,`

iflatex(`latexcommand({\sf)')

# https://tex.stackexchange.com/questions/236923/generate-analog-clock-with-numbered-face-add-seconds-roman-numerals

#                          `hms2deg(hr,min,sec)  hr:min:sec to degrees
#                           blank arg1: degrees for minute hand
#                           blank arg1 and arg2: degrees for second hand'
define(`hms2deg',`ifelse(`$1',,
 `ifelse(`$2',,
   `(90-pmod(ifelse(`$3',,0,`$3'),60)/60*360)',
   `(90-(pmod(`$2',60)/60 + pmod(ifelse(`$3',,0,`$3'),60)/60/60)*360)')',
 `(90-(pmod(`$1',12) + pmod(ifelse(`$2',,0,`$2'),60)/60 + dnl
     pmod(ifelse(`$3',,0,`$3'),60)/3600)/12*360)')')

#                          `SecondHand(length,hr,min,sec)'
define(`SecondHand',`[ shsf = (`$1')/3.2
  C: Here
  { L: rpoint_(to (Rect_(`$1',hms2deg(,,`$4')))) }
  line thick 8*shsf to rvec_(`$1',0)
  ]')

#                          `AntiqueMinuteHand(length,hr,min,sec)'
define(`AntiqueMinuteHand',`[ mhsf = (`$1')/2.84
  L: rpoint_(to (Rect_(`$1',hms2deg(,`$3',`$4'))))
  C: circle fill_(0) diam 0.47*mhsf at L.start
  move to C
  spline from rvec_(0,0.047*mhsf) \
   to rvec_(1.65*mhsf,0.11*mhsf) \
   then to rvec_(`$1',0.018*mhsf) \
   then to rvec_(`$1',-0.018*mhsf) \
   then to rvec_(1.65*mhsf,-0.11*mhsf) \
   then to rvec_(0,-0.047*mhsf) \
   shaded rgbstring(0,0,0)
  ]')

#                          `AntiqueHourHand(length,hr,min,sec)'
define(`AntiqueHourHand',`[ hhsf = (`$1')/2.2
  L: rpoint_(to (Rect_(`$1',hms2deg(`$2',`$3',`$4'))))
  C: circle fill_(0) diam 0.6*hhsf at L.start
  move to C
  v = 0.25*hhsf
  { line to rvec_(1.1*hhsf,0) thick 0.15/(1bp__)*hhsf }
  { C1: circle rad v at rvec_(1.25*hhsf,0) fill_(0) }
  d = `$1'-1.25*hhsf
  q = 1bp__*hhsf
  r1 = (d^2 + q^2 - v^2)/(v-q)/2
  h = r1+v
  shade(0,
    arc ccw from C1+vec_(d/h*v,(r1+q)/h*v) to \
      C1+vec_(d,q) rad r1 with .c at C1+vec_(d,r1+q)
    arc ccw  from C1+vec_(d,-q) to C1+vec_(d/h*v,-(r1+q)/h*v) rad r1 \
      with .c at C1+vec_(d,-r1-q))
   ]')

define(`AntiqueClock',`[    # h,m,s,diam
#                           Clock size parameters:
  hour = ifelse(`$1',,3,`$1')
  minute = ifelse(`$2',,41,`$2')
  second = ifelse(`$3',,51,`$3')
                            # outer radius
  ifelse(`$4',,`skale=0.5; r1=2',`r1=(`$4')/2; skale=r1/4')
  r2 = r1-0.5*skale
  r3 = r2-0.14*skale
  r4 = r3 - 0.35*skale
  r5 = r4 - 0.17*skale
  r6 = r5 - 0.63*skale
  r7 = r6 - 0.17*skale
  shadelinethick = 1.0

C: circle thick 0.2 rad r1

define shadeline {
  s = 1-($`'1)*2
  v = r*s
  h = sqrt(r^2-v^2)
  t = 1-abs(s)
  line from (vrot_(-h,v,cost,sint)) to (vrot_(h,v,cost,sint)) \
    thick shadelinethick outlined rgbstring(t,t,t)
  }

  r = r1                    # Bezel outer
  nlines = int(2*r/(shadelinethick pt__)*1.1)
  cost = cosd(10); sint = sind(10); 
  ShadeObject(shadeline,nlines, 0, 0,0,0, 0.5, 1,1,1, 1, 0,0,0 ) at C

  r = r2                    # Bezel inner
  nlines = int(2*r/(shadelinethick pt__)*1.1)
  cost = cosd(-10); sint = sind(-10); 
  ShadeObject(shadeline,nlines, 0, 0,0,0, 0.25, 0.8,0.8,0.8, 0.5, 1,1,1,
                             0.75, 0.8,0.8,0.8, 1, 0,0,0 ) at C

#                           Clock face
Face: circle thick 0 fill_(1) rad r3 at C
  circle rad r4 at C
  circle rad r5 at C
  circle rad r6 at C
  circle rad r7 at C

#                           Text rotation for PSTricks or TikZ
  define(`rottext',
   `ifpstricks(`\rput[c]{%g}(0,0)',`ifpgf(`\pgftext[rotate=%g]',%g)')')
#                           Outer numbers
  command sprintf("\font\outerfont=cmss12 at %4.2fin",r3-r4)
  for mn = -15 to 15 by 5 do { sprintf("rottext{\outerfont %g}",\
   -mn/60*360,pmod(mn,60)) at C+(Rect_((r3+r4)/2,90-mn/60*360)) }
  for mn = 20 to 40 by 5 do {  sprintf("rottext{\outerfont %g}",\
   180-mn/60*360,mn) at C+(Rect_((r3+r4)/2,90-mn/60*360)) }
#                           Outer tics
  for mn = 1 to 60 do { t = 90-mn/60*360
    line from C+(Rect_(r5,t)) to C+(Rect_(r4,t)) }

#                           Inner numbers
  command sprintf("\font\innerfont=cmss12 at %4.2fin",r5-r6)
  Loopover_(`mx',`t = (m4Lx-4)/12*360;
    sprintf("rottext{\scalebox{0.7}[1.0]{\innerfont mx}}",-t) \
      at C+(Rect_((r5+r6)/2,90-t))', IX,X,XI,XII,I,II,III)
  Loopover_(`mx',`t = (m4Lx+3)/12*360;
    sprintf("rottext{\scalebox{0.7}[1.0]{\innerfont mx}}",-t+180) \
      at C+(Rect_((r5+r6)/2,90-t))', IV,V,VI,VII,VIII)

#                           Inner tics
  for mn = 5 to 60 by 5 do { t = 90-mn/60*360
    line from C+(Rect_(r7,t)) to C+(Rect_(r6,t)) }

#                           Hands
  AntiqueHourHand(r6,hour,minute,second) with .C at C
  AntiqueMinuteHand(r5,hour,minute,second) with .C at C
  SecondHand((r3+r4)/2,hour,minute,second) with .C at C

#                           Center
  dot(at C,0.1/4*r1,1)
 ]')

  Clock1: AntiqueClock(,,,3)
# Clock2: AntiqueClock(4,50,07,2) at Clock1.e+(1.5,0)

  iflatex(`latexcommand(})')

',` "AntiqueClock.m4 requires pstricks or pgf" ')

.PE
