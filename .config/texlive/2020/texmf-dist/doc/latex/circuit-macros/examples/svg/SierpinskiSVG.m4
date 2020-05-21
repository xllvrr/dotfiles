.PS
# Sierpinski.m4
gen_init
[
 define Sierpinski {
  if $1 > 0.04 then {
    d = $1/2-lh
    shade(1,line from $2+(d/2,d/2*s3+lw*2) right d/2 up d/2*s3 then left d*2 \
        then right d down d*s3 then right d/2 up d/2*s3 )
    Sierpinski($1/2,$2-($1/2,0))
    Sierpinski($1/2,$2+($1/2,0))
    Sierpinski($1/2,$2+(0,$1*s3/2))
    }
  }

  r = 3
  linethick = 0.2
  #linethick = 1/2 /(1pt__)
  lw = linethick pt__ /2
  s3 = sqrt(3)
  lh = lw*s3
  A: 3,3
  d = r/2-lh
  shade(0,line from A+(0,lw) right d then up d*s3 left d then down d*s3 left d\
    then right d )
  ifpstricks(`psset_(linecolor=white)')
  Sierpinski(r/2,A)

  ifpstricks(`psset_(linecolor=black)')
  thicklines_
  ]

# CayleyGraph.m4
[
define CayleyGraph {
  if $3 > 0 then {
    { line to Here+(cosd($2),sind($2))*($1)
      exec sprintf("CayleyGraph(%g,%g,%g);", ($1)/2, $2,    $3-1); }
    { line to Here+(cosd($2+90),sind($2+90))*($1)
      exec sprintf("CayleyGraph(%g,%g,%g);", ($1)/2, $2+90, $3-1); }
    { line to Here+(cosd($2-90),sind($2-90))*($1)
      exec sprintf("CayleyGraph(%g,%g,%g);", ($1)/2, $2-90, $3-1); }
    }
  }

  size = 2
  depth = 6
  for t=0 to 270 by 90 do {
    line from (0,0) to (cosd(t),sind(t))*size/2;
    { exec sprintf("CayleyGraph(%g,%g,%g);",size/4,t,depth); }
    }
  ] scaled 3/4 with .sw at last [].se+(-0.25,0)

.PE
