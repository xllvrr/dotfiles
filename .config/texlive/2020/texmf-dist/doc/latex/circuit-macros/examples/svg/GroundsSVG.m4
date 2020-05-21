.PS
# `GroundsSVG.m4'
cct_init(svg_font(sans-serif,11bp__))

sep = 0.65
Ground: ground
   move right sep
GT: ground(,T)
   move right sep
GF: ground(,,F)
sep = 0.55
   move right sep
GE: ground(,,E)
   move right sep

B: Here+(0,-0.5)
D: B+(0,11bp__)
 { "`ground'" wid 36bp__ at (Ground,B)
   "`ground'(,T)" at (GT,B)+(0,11bp__)
   "(,,F)" at (GF,B)
   "(,,E)" at (GE,D)}


GS: ground(,,S)
   move right sep
GS90: [ground(,,S,90) ] with .n at Here
   move right sep from GS90.n
GQ: ground(,,Q)
   move right sep
GL: ground(,,L)
   move right sep
GP: ground(,,P)
   move right sep
GPA: ground(,T,PA)

C: Here+(0,-0.5)
E: C+(0,11bp__)
   "(,,S)" at (GS,C)
   "(,,S,90)" at (GS90,E)
   "(,,Q)" at (GQ,C)
   "(,,L)" at (GL,E)
   "(,,P)" at (GP,C)
   "(,T,PA)" wid 32bp__ at (GPA,E)

 command "</g>" # end font
.PE
