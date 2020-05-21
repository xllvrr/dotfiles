.PS
threeD_init s_init(Views) sinclude(tst.dim)
#
# Chuck.m4
#
divert(-1)
                               `Dimensioning for diagrams
                                dimension_(linespec,vert offset,
                                      label,blank width,tic offset,<-|->,R)'
define(`dimension_',`rpoint_(`$1') ; {
  define(`m4h',`(rp_len ifelse((`$4'),(),,`-($4)'))')dnl
  ifelse((`$2'),(),,`if (`$2') != 0 then {
     {move to rvec_(0,     ifelse(`$5',,`sign($2)*3.6bp__',`$5'))
       line to rvec_(0,`$2')}
     {move to rvec_(rp_len,ifelse(`$5',,`sign($2)*3.6bp__',`$5'))
       line to rvec_(0,`$2')}
     move to rvec_(0,`$2') }')
  if m4h > 2*arrowht then {
      { line ifelse(`$6',,<-,index($6,<),0,<-) to rvec_(m4h/2,0)
        ifelse((`$4'),(),,`move to rvec_(($4),0)')
        line ifelse(`$6',,->,eval(index($6,>)>0),1,->) to rvec_(m4h/2,0) }
    } else {
      { arrow from rvec_(-arrowht*1.5,0) to Here
        arrow from rvec_(rp_len+arrowht*1.5,0) to rvec_(rp_len,0) }
    }
  define(`m4txt',`ifelse(`$7',,
   `ifelse(index(`$3',"),0,`$3',"`$3'")',
   `ifdef(`pstricks_',`sprintf("\rput{%g}(0,0){`$3'}",rp_ang*rtod_)',`"$3"')')')
  ifelse(`$3',,,`m4txt at rvec_(rp_len/2,0)')
  }')

define(`rottxt',
 `ifdef(`pstricks_',`sprintf("\rput{%g}(0,0){`$2'}",`$1')')')
                               `rotate(angle,at pos, objects at origin)'
define(`rotate',
 `ifdef(`pstricks_',`M4tmp: "" ifelse(`$2',,Here,`$2')
  sprintf("\rput{%g}(%g,%g){`$3'}",`$1',M4tmp.x/scale,M4tmp.y/scale)')')
                             `r_box(angle,pos,string)'
define(`crl',`int(`($1)'/scale*1000000)/1000000')
define(`r_box',
 `ifdef(`pstricks_',`M4tmp: ifelse(`$2',,Here,`$2')
  command sprintf("\rput{%g}(%g,%g){",`$1',crl(M4tmp.x),crl(M4tmp.y))
  w_box(`$3') at Orig
 command "}%"')')
                             `r_dimen(linespec,offset,label,tic offset,<->,pos)'
define(`r_dimen',
 `M4tmp: dimension_(`$1',`$2',,,`$4',`$5')
  r_box(rp_ang*rtod_,ifelse(`$6',,M4tmp+vec_(0,`$2'),`$6'),`$3')')

                             `ctrline(linespec,len)'
define(`cdashl',0.1*scale)
define(`cgapl',0.03*scale)
define(`ctrline',`rpoint_(ifelse(`$1',,`to rvec_(linewid,0)',`$1'))
  define(`m4h',ifelse(`$2',,1*scale,`$2'))dnl
  m4n = int(rp_len/2/(m4h))*2+1
  for i=1 to m4n do {
    line to rvec_(rp_len/m4n/2-cdashl/2-cgapl,0)
    move to rvec_(cgapl,0); line to rvec_(cdashl,0); move to rvec_(cgapl,0)
    line thick dimensionth to rvec_(rp_len/m4n/2-cdashl/2-cgapl,0) } ')

                             `ctrarcr(pos,radius,startang,endang,len)'
define(`ctrarcr',`dnl
  define(`m5h',ifelse(`$5',,1*scale,`$5'))dnl
  rp_len = abs((`$2')*(`$4'-(`$3')))
  m5n = int(rp_len/2/(m5h))*2+1
  m5a = (rp_len/m5n/2-cdashl/2-cgapl)/(`$2')
  m5s = cdashl/(`$2')
  m5sa = `$3'
  for m4irr=1 to m5n do {
    arc from `$1'+(rect_(`$2',m5sa)) to `$1'+(rect_(`$2',m5sa+m5a)) \
      with .c at `$1'
    m5sa = m5sa+m5a+cgapl/(`$2')
    arc from `$1'+(rect_(`$2',m5sa)) to `$1'+(rect_(`$2',m5sa+m5s)) \
      with .c at `$1'
    m5sa = m5sa+m5s+cgapl/(`$2')
    arc from `$1'+(rect_(`$2',m5sa)) to `$1'+(rect_(`$2',m5sa+m5a)) \
      with .c at `$1'
    m5sa = m5sa+m5a
    } ')

divert(0)dnl

scale = 25.4*2
tic = 3.6bp__

command "{\sf"
#psset_(linecolor=white)
#command "\color{white}"

#include(Lettering.m4)
#Letter_init

define(`visible',`linethick_(visibleth)')
define(`hidden',`linethick_(hiddenth)')
define(`dimension',`linethick_(dimensionth)
  arrowwid = 1.5*arrowwid; arrowht = 1.5*arrowht; ')

d1 = 230
d2 = 204
d3 = 140

  visibleth = 1.2
  dimensionth = 0.4
  hiddenth = dimensionth

Orig: Here
visible
  D3: circle diam d3 at Orig
  D2: circle diam d2 at Orig

  rr = d1/2
  r = 40
  h = 110/2
  thet = asin((h+r)/(rr+r))
  X1: rect_(rr,thet)
  P1: rect_(rr+r,thet)

dimension
  cross(at (P1.x,-P1.y))
  cross(at (-P1.x,P1.y))

# Top outer visible line
visible
# arc ccw from (-P1.x,h) to (-X1.x,X1.y) rad r with .c at (-P1.x,P1.y)
  arcs = atan2(P1.x-X1.x,P1.y-X1.y) 
  n = 0
  nn = 8
  for i = 0 to nn do {P[n]:(-P1.x,P1.y)+(rect_(r,-twopi_/4+i/nn*arcs)); n=n+1}
  for i = 1 to nn do {P[n]:Orig+(rect_(rr,pi_-thet-i/nn/2*(pi_-2*thet))); n=n+1}
  n = n-1
  for i = 1 to n do { P[n+i]:(-P[n-i].x,P[n-i].y) }
  fitcurve(P,2*n)
# top arc
# arc cw to X1 rad rr with .c at Orig
# arc ccw from X1 to (P1.x,h) rad 4 with .c at P1
# right end
  line from (P1.x,h) to (305/2,h) then to (305/2,32/2) then left 40-3
  arc ccw rad 3
  line down 32-2*3
  arc ccw rad 3
dimension {
  r_dimen(up 32 with .c at (305/2-5,0),0,32)
  arrow <- up 8 right 8 then right 4 from last arc.sw
  "3$\,$R" ljust
  r_dimen(up h*2 at (305/2,0),-10,110)
}; visible
  line right 40-3 then to (305/2,-h) then to (P1.x,-h) 
# arc ccw to (X1.x,-X1.y) rad r with .c at P1.x,-P1.y
# bottom arc
  for i = 0 to 2*n do { P[i]: (-P[2*n-i].x,-P[i].y) }
  fitcurve(P,2*n)
# arc cw to (-X1.x,-X1.y) rad rr with .c at Orig
# arc ccw to (-P1.x,-h) rad r with .c at (-P1.x,-P1.y)
# left end
  line from (-P1.x,-h) to (-305/2,-h) then to (-305/2,-25/2) then right 25
  down; arc ccw rad 3
  line right 40-25-2*3
  arc ccw rad 3
  line up 25
  {R: line invis down 10 at (2nd last line,last line) }
  arc ccw rad 3
  line left 40-25-2*3
  arc ccw rad 3
  line to (-305/2,25/2) then to (-305/2,h) then to (-P1.x,h)

dimension
# centre
  ctrline(right 305-30 with .c at Orig,60)
  ctrline(up d1+10 with .c at Orig,)

  {BX: box invis ht 25+2*3 wid 40-25 rad 3 with .w at (-305/2+25,0)}
  Q: line invis from BX.n to BX.s; R: line invis from BX.se up 10 left 10
  X: Intersect_(Q,R)
  line <-> from BX.se to X then to (X.x,-X.y) then to BX.nw
  r_box(90,BX,`3$\,$R')

# Drill centres
  D[1]: 35,sqrt(85^2-35^2)
  D[2]: -D[1].x,D[1].y
  D[3]: -D[1].x,-D[1].y
  D[4]: D[1].x,-D[1].y
  ctrline(from D[3] to D[1] chop 15)
  ctrline(to rvec_(2*15,0))
  ctrline(from D[3]+vec_(-15,0) to D[3]+vec_(15,0))
  ctrline(from D[2] to D[4] chop 15)
  ctrline(to rvec_(2*15,0))
  ctrline(from D[2]+vec_(-15,0) to D[2]+vec_(15,0))
visible
  for i=1 to 4 do {
    circle diam 16 at D[i]
    for j = 0 to 7 do { arcr(D[i],23/2,j/8*twopi_,(j+3/4)/8*twopi_) ccw }
    }

hidden
  for s=-1 to 1 by 2 do {
  line dashed from (-305/2,s*h) to (305/2,s*h)
  line dashed from (-305/2,s*30.6) to (305/2,s*30.6)
  line dashed from (-305/2,s*21.1) to (305/2,s*21.1)
  line dashed from (-305/2+25+2,s*21.1) to (305/2,s*21.1)
  line dashed  dashwid/2 from (-305/2+25,s*25/2) down -s*(40/2-25/2-2);
  if s<0 then { arc dashed dashwid/4 ccw rad 2 } else { up; arc dashed dashwid/4 cw rad 2 }
  line dashed to ((305/2,0),Here)
  for k = -1 to 1 by 2 do {
    move to (k*305/2,s*(30.6+10))
    { dashline(from Here+(0,s*9.5/2) right -k*16,,dashwid/2)
      dashline(right -k*9.5/2/2 up -s*9.5/2,,dashwid/3)
      dashline(left -k*9.5/2/2 up -s*9.5/2,,dashwid/3)
      dashline(left -k*16,,dashwid/2)
      dashline(from Here+(-k*16,0) up s*9.5,,dashwid/2.5) }
    { dashline(from Here+(0,s*11/2) right -k*36.5,,dashwid/2)
      dashline(right -k*11/2/2 up -s*11/2,,dashwid/3)
      dashline(left -k*11/2/2 up -s*11/2,,dashwid/3)
      dashline(left -k*36.5,,dashwid/2)
      dashline(from Here+(-k*36.5,0) up s*11,,dashwid/2.5) }
    { dashline(from Here+(0,s*13/2) right -k*32,,dashwid/2)
      dashline(down s*13,,dashwid/2)
      dashline(left -k*32,,dashwid/2) }
    ctrline(right -k*20 chop -3 chop 0); ctrline(right -k*20 chop 0 chop -3)
    }
  }

dimension
# bottom
  dimension_(from (-305/2,-h) to (305/2,-h),-(rr*1.1-h),"305",20pt__)
# outer radii
  r_dimen(from (-P1.x,P1.y) down 40*cosd(30) right 40*sind(30),0,40,,->)
  r_dimen(from (P1.x,-P1.y)+(Rect_(40,120)) \
   down 40*cosd(30) right 40*sind(30),0,40,,<-)
# main diameter
  r_dimen(from (Rect_(rr,180+50)) to (Rect_(rr,50)),,230,,,(Rect_(50,50)))
# inner circles
  r_dimen(from (Rect_(d2/2,180+25)) to (Rect_(d2/2,25)),,204,,,(Rect_(25,25)))
  r_dimen(from (Rect_(d3/2,180-12)) to (Rect_(d3/2,-12)),,140,,,(Rect_(25,-12)))
  
# bolt hole placement diameter
  r_dimen(from Orig to (Rect_(85,-43)),,`85$\,$R',,->,(Rect_(20,-43)))
# left slot
  r_dimen(from (-305/2+6,-25/2) up 25,0,25)
  r_dimen(from (-305/2,-26) right 40,0,40)
  line from last line.end to (last line.end.x,BX.s.y) chop -tic chop 0
  r_dimen(from (-305/2,26) right 25,0,25)
  line from last line.end to (last line.end.x,BX.n.y) chop -tic chop 0
# right slot
  r_dimen(from (305/2-40,-32/2-10) right 40,0,40)
  line from (305/2-40,-32/2) down 10+tic
# drill-holes
  for i=1 to 4 do {
    ctrarcr(Orig,85,atan2(D[i].y,D[i].x)-10*dtor_,atan2(D[i].y,D[i].x)+10*dtor_)
    }
  ctrarcr(Orig,85,atan2(D[4].y,D[4].x)+10*dtor_,atan2(D[4].y,D[4].x)+25*dtor_)
  ctrline(up 30 at D[3])
  ctrline(up 30 at D[4])
  r_dimen(from D[3]+(0,-14) right 35,0,35)
  r_dimen(from (0,D[3].y-14) right 35,0,35)

# arrow <- down 30 left 30 from D[3] chop 16/2 chop 0 then left 5
# "16 DRILL 23 CBORE" rjust "4 HOLES" rjust

  arrow <- from (-305/2,30.6+10+2) up 5 left 5 then up 13
  s_box(SEE (A)) with .sw at Here+(-5pt__,2pt__)

command "}%"
.PE
