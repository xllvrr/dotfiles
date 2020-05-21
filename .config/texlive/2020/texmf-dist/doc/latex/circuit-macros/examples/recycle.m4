.PS
# recycle.m4
gen_init
NeedDpicTools
[
#                                    Gradient fill and clipping are simply
#                                    done with PStricks or Tikz but the other
#                                    postprocessors don't all have this
#                                    facility so the following calculates
#                                    shading boundaries and lines.

define ShadePoint { testexpr(i, $1<f1, $1<f2, $1<f3 )
  Px: $1 between P0 and Pz
  S: move from Px to Px+Up
  case(i+1,
    M4L: LCintersect(S,T1,stripwd/2) 
    M4R: ($1-f2)/(1-f2) between P9 and P8
    ,
    M4L: $1/f1 between P0 and P4
    M4R: $1/f1 between P0 and P3
    ,
    M4L: Intersect_(S,M57)
    M4R: LCintersect(S,P1,stripwd/2) 
    ,
    M4L: Intersect_(S,M57)
    M4R: ($1-f2)/(1-f2) between P9 and P8
    )
  line outlined rgbstring($2,$3,$4) from M4L to M4R
  }

define ShadeTail { testexpr(i, $1<g1, $1<g2, $1<g3 )
  Px: $1 between T4 and Qz
  S: move from Px to Px+AcrossTail
  case(i+1,
    M4L: LCintersect(S,T1,stripwd/2,R)
    M4R: LCintersect(S,T1,stripwd/2)
    ,
    M4L: $1/g1 between T5 and T6
    M4R: $1/g1 between T3 and T2
    ,
    M4L: LCintersect(S,T1,stripwd/2,R)
    M4R: $1/g2 between T3 and P6
    ,
    M4L: LCintersect(S,T1,stripwd/2,R)
    M4R: ($1-g2)/(g3-g2) between P6 and P7 
    )
  line outlined rgbstring($2,$3,$4) from M4L to M4R
  }

#                                   `recycle(width)'
define(`recycle',`[ Origin: Here
  space = 2*linethick pt__
  stripwd = ($1-space)/3.765544
  for angle=0 to 240 by 120 do {
    Right: (dprot(angle*dtor_,stripwd,0))
    Up: (dprot(angle*dtor_,0,stripwd/2))
    P0: Here+Right*space/stripwd
    Axis: move from P0 to P0+Right*3/4; P1: Here
    P2: P1-Up
    P3: 1.5 between P1 and P2
    P4: P1 + (P1-P3)
    P5: P1 + Up
    P6: P5+Right/sqrt(3)/2
    P7: P6+(P6-P5)
    T1: 2 between P1 and P6
    P8: T1+(dprot((angle-30)*dtor_,stripwd/2,0))
    P9: P1+(P8-T1)
    T2: T1+(dprot((angle+210)*dtor_,stripwd/2,0))
    AcrossTail: T1-T2
    T3: P6+(dprot((angle+120)*dtor_,stripwd,0))
    T4: T3+AcrossTail
    T5: 2 between T3 and T4
    T6: 2 between T2 and T1
    V: move from P8 to P8-Up; Pz: Intersect_(Axis,V)
    t = distance(P0,Pz)
    f1 = distance(P1,P0) / t
    V: move from P9 to P9+Up; R: Intersect_(Axis,V); f2 = distance(P0,R) / t
    V: move from P7 to P7-Up; R: Intersect_(Axis,V); f3 = distance(P0,R) / t
    n = int(t/lthick*1.5)
    M57: move from P5 to P7 
    ShadeObject( ShadePoint,n,
      0,1,1,1,
      1,0.5,0.5,0.5) with .Origin at Origin
    point
    J: move from T4 to T1; Qz: LCintersect(J,T1,stripwd/2,R)
    u=distance(T4,Qz)
    g1 = distance(T1,T4) / u
    g2 = stripwd / u
    V: move from P7 to P7+AcrossTail; R: Intersect_(V,J)
    g3 = distance(R,T4) / u
    m = int(u/lthick*1.5)
    ShadeObject(ShadeTail,m,
      0,1,1,1,
      1,0.5,0.5,0.5) with .Origin at Origin
    tail
#   { for i=0 to 9 do { exec sprintf("{\"P%g\" at P%g}",i,i) } }
#   { for i=1 to 6 do { exec sprintf("{\"T%g\" at T%g}",i,i) } }
    move to T4
    }
 ]')
define(`tail',`line from P7 to P6 then to T3 then to T5 then to T6
  arc cw to P7 with .c at T1')

define(`point',`line from P2 to P3 then to P0 then to P4 then to P5 then to P7
  arc ccw to P8 with .c at T1
  line to P9
  arc cw to P2 with .c at P1')

recycle(2)
]
[
# yinyang.m4
ifdpic(`
circlerad = 0.5
shade(0,
A: arc ccw rad circlerad*2 to Here+(4*circlerad,0)
  )
B: circle colored "white" with .c at 1/4<A.w,A.e>
  arc cw rad circlerad from B.e to B.w with .c at B.c
  circle colored "black" with .c at 3/4<A.w,A.e>
  circle rad circlerad*2 with .c at A.c
  circle rad circlerad/3 fill_(0) at 0.5<A.w,A.c>
  circle rad circlerad/3 fill_(1) at 0.5<A.c,A.e>
',`
box wid 1 ht 0.75 "Yinyang.m4" "requires" "dpic"
')
] with .w at last [].e+(0.2,0)
.PE
