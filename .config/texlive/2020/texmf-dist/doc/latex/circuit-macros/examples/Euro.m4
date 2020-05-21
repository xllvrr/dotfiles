% Euro symbol; process this file as follows:
% m4 Euro.m4 > Euro.pic; dpic -p Euro.pic > Euro.tex ; latex Euro; dvips Euro
\documentclass{article}
\usepackage{pstricks}
\usepackage{boxdims,xcolor}
\pagestyle{empty}
\thispagestyle{empty}
\begin{document}
\noindent\vspace{2ex}
.PS
include(pstricks.m4)
gen_init
divert(-1)
                               `euro_simple([height])
                                Basic euro symbol with round outer boundary
                                default height=10pt'
define(`euro_simple',
`[ linethick = 0
  orad = ifelse(`$1',,`5bp__',(`$1')/2)
  u = orad/6
  irad = orad - u
 C: (0,0)
 D: C+(Rect_(irad,40))
 CD: move from C+(0,-orad) to D
 DK: move from D down u
 Ubot: move from C+(0,u/2) right u
 Utop: move from Ubot.start+(0,u) right u
 Ltop: move from C+(0,-u/2) right u
 Lbot: move from Ltop.start+(0,-u) right u
 L_edge: C-(7.5*u,0)
 Start: (C,Utop)
  slope = (CD.end.y-CD.start.y)/(CD.end.x-CD.start.x)
shade(0,
  line from Start to Intersect_(Utop,CD) \
         then to Intersect_(Ubot,CD) \
         then to LCintersect(Ubot,C,irad)
  arc to LCintersect(Ltop,C,irad) with .c at C
  line to Intersect_(Ltop,CD) \
         then to Intersect_(Lbot,CD) \
         then to LCintersect(Lbot,C,irad)
  arc to (D,C)-(0,D.y-C.y) with .c at C
  line to LCintersect(DK,C,orad,R)
  arc cw to LCintersect(Lbot,C,orad) with .c at C
  line to (L_edge,Here) \
    then right u/slope up u \
    then to LCintersect(Ltop,C,orad)
  arc cw to LCintersect(Ubot,C,orad) with .c at C
  line to (L_edge,Here)  \
    then right u/slope up u \
    then to LCintersect(Utop,C,orad)
  arc cw to LCintersect(CD,C,orad,R) with .c at C
  line to D
  arc to LCintersect(Utop,C,irad) with .c at C
  line to Start
 ) ]')

                               `euro_symbol([ht=val; aspect=val; slant=degrees])
                                Euro symbol with variable aspect ratio and slant
                                defaults: ht=10pt, aspect=1, slant=0
                                e.g., euro_symbol(ht=14pt__; aspect=1.2)'

define(`euro_symbol',`[
 setkey_(`$1',ht,10pt__) setkey_(`$1',aspect,1) setkey_(`$1',slant,0)
 linethick = 0
 orad = m4ht/2
 u = orad/6
 irad = orad - u
 if m4aspect==0 then { squeeze = 1 } else { squeeze = 1/m4aspect }
 slant = sind(m4slant)
 C: (0,0)
 D: C+(Rect_(irad,40))
 CD: move from C+(0,-orad) to D
 DK: move from D down u
 Ubot: move from C+(0,u/2) right u
 Utop: move from Ubot.start+(0,u) right u
 Ltop: move from C+(0,-u/2) right u
 Lbot: move from Ltop.start+(0,-u) right u
 L_edge: C-(7.5*u,0)
 Start: (C,Utop)
 slope = (CD.end.y-CD.start.y)/(CD.end.x-CD.start.x)

shade(0,
  S: LCintersect(Ubot,C,irad)
  line from euro_tr(Start) to euro_tr(Intersect_(Utop,CD)) \
         then to euro_tr(Intersect_(Ubot,CD)) \
         then to euro_tr(S)
  euro_arc(S,LCintersect(Ltop,C,irad),irad)
  S: LCintersect(Lbot,C,irad)
  line to euro_tr(Intersect_(Ltop,CD)) \
         then to euro_tr(Intersect_(Lbot,CD)) \
         then to euro_tr(S)
  euro_arc(S,((D,C)-(0,D.y-C.y)),irad)
  S: LCintersect(DK,C,orad,R)
  line to euro_tr(S)
  euro_arc(S,LCintersect(Lbot,C,orad),orad,cw)
  S: LCintersect(Ltop,C,orad)
  E: LCintersect(Lbot,C,orad)
  line to euro_tr((L_edge,E)) \
    then to euro_tr((L_edge,E)+(u/slope,u)) \
    then to euro_tr(S)
  E: LCintersect(Ubot,C,orad)
  euro_arc(S,E,orad,cw)
  S: LCintersect(Utop,C,orad)
  line to euro_tr((L_edge,E)) \
    then to euro_tr((L_edge,E)+(u/slope,u)) \
    then to euro_tr(S)
  euro_arc(S,LCintersect(CD,C,orad,R),orad,cw)
  line to euro_tr(D)
  euro_arc(D,LCintersect(Utop,C,irad),irad)
  line to euro_tr(Start)
) ]')

                               `aspect ratio and slant transformation'
define(`euro_tr',`((`$1').x*squeeze+(`$1').y*slant,(`$1').y)')
                               `transformed arc, centre C'
define(`euro_arc',
`M4X: `$1'; as = atan2(M4X.y-C.y,M4X.x-C.x)
 M4X: `$2'; ae = atan2(M4X.y-C.y,M4X.x-C.x)
 ifelse(`$4',cw,`if ae > as then { ae -= twopi_ }',
  `if ae < as then { ae += twopi_ }')
 ax = ae-as
 n = max(5,ceiling_(abs(ax)/(10*dtor_)))
 for i=0 to n do { P[i]: euro_tr((rect_(`$3',as+i/n*ax))) }
 fitcurve(P,n)
 move to P[n] ')

divert(0)dnl

euro_simple
move
euro_symbol(slant=15)
move
euro_simple(72bp__)
move
euro_symbol(ht=72bp__*2; aspect=1.0; slant=15)

.PE
\end{document}
