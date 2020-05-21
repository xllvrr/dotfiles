.PS
#MC.m4
cct_init(svg_font(Times,11bp__))
textoffset = 3bp__

MC:[
  dv = dimen_*0.6
  dh = dimen_*0.4
  backup = dimen_/6

  for i=1 to 3 do {{
    if i==2 then { Input: dot } else { line up (2-i)*dv }
    source(right_ dimen_,AC)
#   The pound sign has to be protected from m4
    llabel(,,sprintf("svg_it(v`'svg_sub(&``#''%g;,66%))",96+i))
    resistor(right_ dimen_ from Here-(backup/2,0))
    if i==1 then { llabel(,R`'svg_sub(i))}
    inductor(right_ dimen_ from Here-(backup,0),W)
    if i==1 then { llabel(,L`'svg_sub(i))}
    line right_ i*dh
    b_current(sprintf("svg_it(i`'svg_sub(&``#''%g;,66%))",96+i)); dot
    { line down (3-i)*dv; capacitor(down_ dimen_)
      if i==1 then { rlabel(,C`'svg_it(i)) }
      if i==2 then { dot } else { line right (2-i)*dh }}
    line right 3*dh; dot
    E: Here+((3-i)*dh+dimen_*2,(4-2*i)*dv)
    for j=1 to 3 do {{
      line up (6-j*3)*dv then right (3-i)*dh
      switch(right_ E.x-Here.x)
      llabel(,,sprintf("svg_it(S`'svg_sub(&``#''%g;&``#''%g;,66%))",96+i,64+j))
      if i==2 then { dot } else { line down (2-i)*dv }
      }}
    line from E right dh then down E.y-Here.y
    arrow right dimen_/2
    { sprintf("svg_it(i`'svg_sub(&`#'%g;,66%))",64+i) above }
    resistor(right_ dimen_ from Here-(arrowht/2,0))
    if i==1 then {llabel(,R`'svg_sub(o))}
    inductor(right_ dimen_ from Here-(backup,0),W)
    if i==1 then {llabel(,L`'svg_sub(o))}
    source(right_ dimen_,AC)
    llabel(sprintf("svg_it(v`'svg_sub(&``#''%g;,66%))",64+i))
    if i==2 then { Output: dot } else { line down (2-i)*dv }
    }}
]

Three: [
  dv = dimen_*0.6
  dh = dimen_
  define(`swfet',`mosfet(`$1',,dMEDSuBQPy)')
  define(`swpair',`[ up_
    BS: swfet(up_ dimen_); { "`$1'" at BS.D-(0,2bp__) rjust }
    L: line up_ 3*dimen_ from BS.D
    TS: swfet(up_ dimen_) with .S at Here; { "`$2'" at TS.S+(0,2bp__) rjust }
    T: TS.D
    B: BS.S
    C: L.c 
    ]')

  V1: gap(up_ 5*dimen_,1,A)
  { "svg_it(V)svg_sub(1)" wid 12bp__ at last arrow.c rjust }
  line right_  dh/2
  { C1: capacitor(down_ to (Here,V1.start)); llabel(svg_it(C)svg_sub(1)) }
  for_(1,3,1,`
    line right_ dh ifelse(m4x,1,,*5/4)
   {SP1`'m4x: swpair(svg_it(S`'svg_sub(1`'eval(m4x+3))),
     svg_it(S`'svg_sub(1`'m4x))) with .T at Here
    dot(at last [].C + (0,(2-m4x)*dh)) 
    line right_ (3-m4x)*dh*5/4
    inductor(right_ dimen_,L)
    {sprintf("svg_it(L`'svg_sub(1&`#'%g;,70%))",64+m4x) at last [].n+(0,8bp__)}
    line down_ (2-m4x)*dimen_*2/3
    pushdef(`dimen_',dimen_*1.2) inductor(right_ dimen_*3/4) popdef(`dimen_')
    line down_ (2-m4x)*dimen_/3
    M: move right_ dimen_/8
    line up_ (2-m4x)*dimen_/3
    pushdef(`dimen_',dimen_*1.2) inductor(right_ dimen_*3/4) popdef(`dimen_')
    line up_ (2-m4x)*dimen_*2/3
    inductor(right_ dimen_,L)
    {sprintf("svg_it(L`'svg_sub(2&`#'%g;,70%))",64+m4x) at last [].n+(0,8bp__)}
    line right_ dimen_/8+(m4x-1)*dh*5/4
    dot
    SP2`'m4x: swpair(svg_it(S`'svg_sub(2`'eval(m4x+3))),
     svg_it(S`'svg_sub(2`'m4x))) with .C at Here+(0,(m4x-2)*dh) }
  ')
  "svg_it(T)svg_sub(r)" at M.c+(0,dimen_*2/3)
  line from V1.start to SP13.B
  line from SP21.B to SP23.B+(dh*3/4,0)
  { C2: capacitor(up_ to (Here,V1.end)); llabel(,,svg_it(C`'svg_sub(2))) }
  line right_ dh/2
  gap(up_ 5*dimen_,1,A)
  { "svg_it(V`'svg_sub(2))" wid 12bp__ at last arrow.c ljust }
  line to SP21.T chop dotrad_ chop 0

] with .nw at MC.sw+(0,-0.2)

 command "</g>" # end font
.PE
