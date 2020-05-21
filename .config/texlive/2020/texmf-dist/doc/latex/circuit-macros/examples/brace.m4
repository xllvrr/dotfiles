.PS
# brace.m4
gen_init
NeedDpicTools

divert(-1)
                               `brace(linespec,depth,arm thickness,attributes)
                                Curly brace along linespec
                                default depth is linewid/5
                                attributes = eg
                                  thick 0.4 outlined "string" shaded "string"
                                  (default black)'
define(`brace',`rpoint_(ifelse(`$1',,`to rvec_(linewid,0)',`$1'))
  M4brS: last line.start; M4brE: last line.end
  [ brdepth = ifelse(`$2',,linewid/5,`$2')
    brthick = ifelse(`$3',,brdepth/6,`$3')
    define(`m4braceattribs',
     `ifelse(`$4',,`thick 0.4 shaded rgbstring(0,0,0)',`$4')')dnl
    tension = 0.55
    halfwid = distance(M4brS,M4brE)
    smallrad = brdepth-brthick
    bigrad = brdepth+brthick
    for sgn=1 to -1 by -2 do {
      S: rvec_(sgn*halfwid/2,0)
      A: S+vec_(0,smallrad/2)
      B: vec_(0,smallrad/2)
      T: vec_(0,brdepth)
      C: vec_(0,bigrad/2)
      D: vec_(sgn*halfwid/2,bigrad/2)
      {spline tension m4braceattribs \
        from S to tension between S and A \
        then to tension between A-vec_(sgn*bigrad/2,0) and A \
        then to A-vec_(sgn*bigrad/2,0) \
        then to B+vec_(sgn*bigrad/2,0) \
        then to tension between B+vec_(sgn*bigrad/2,0) and B \
        then to tension between T and B \
        then to T \
        then to tension between T and C \
        then to tension between C+vec_(sgn*bigrad/2,0) and C \
        then to C+vec_(sgn*bigrad/2,0) \
        then to D-vec_(sgn*bigrad/2,0) \
        then to tension between D-vec_(sgn*bigrad/2,0) and D \
        then to tension between S and D \
        then to S }
      }
    E: (0,0)
] with .E at 0.5 between M4brS and M4brE')
divert(0)dnl

  del = 0.2
  maxht = 2
  minht = 0.3
  n = 16
  hmax = 360
R1: [
  for i=0 to n-1 do {
    x = i/n
    y = minht*(1-x)+maxht*x
    hsvtorgb(x*hmax,1,1,r,g,b)
    brace(from (-i*del,-y/2) up y,,,thick 0.4 \
      shaded rgbstring(r,g,b))
    brace(from ((i+1)*del,y/2) down y,,,thick 0.4 \
      outlined rgbstring(r,g,b) \
      shaded rgbstring(r,g,b))
    }
  ]
R2: [
  for i=0 to n-1 do {
    x = i/n
    y = minht*(1-x)+maxht*x
    hsvtorgb(x*hmax,1,1,r,g,b)
    brace(from (-i*del,-y/2) up y,5bp__+x*20bp__,2bp__+x*13bp__,thick 0.4 \
      shaded rgbstring(r,g,b))
    brace(from ((i+1)*del,y/2) down y,5bp__+x*20bp__,2bp__+x*13bp__,thick 0.4 \
      outlined rgbstring(r,g,b) \
      shaded rgbstring(r,g,b))
    }
  ] with .n at R1.s+(0,-0.2)

.PE
