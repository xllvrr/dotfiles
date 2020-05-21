.PS
# ex05.m4
darrow_init

  fillval = 0.8              # environmental variable

  dx = boxht/5               # diagram parameters wrt scaled env variables
  circlerad = boxht*3/8
  extlen=4*dx
  indel = boxht/3

COb: box fill_ "CO"
   { line right textht*0.5 from COb+(0,textht*0.5) }
CO:box fill_ with .nw at last box.se+(dx,-dx) "CO"
CbOb: box fill_ with .nw at last box.se+(dx,-dx) "CO"
  { line right textht*1.0 with .c at CbOb+(-textht*0.1,textht*0.5) }
CbO: box fill_ with .nw at last box.se+(dx,-dx) "CO"
  { line left textht*0.5 from CbO+(-textht*0.2,textht*0.5) }

  dline(from CbO.s down_ dx,,t,,!-)
  dright
{Sum: circle invis at (CO,Here)}
  darrow(to Sum.e)

SW: (COb.w,Sum.s)+(-3*dx-extlen/2,-dx)
NE: (CbO.e,COb.n)+(dx,dx)
  right_; 
SB: shadebox(box wid NE.x-SW.x ht NE.y-SW.y with .sw at SW)

U: COb.w-(3*dx+extlen,0)
  {"svg_bf(u)" wid 0.1 rjust at U}
  dline(from U right_ extlen+dx,,t,,|-)
TU: dtee(R)
  {darrow(to COb.w,t)}
  dline(to (Here,CO),t,t)
{Dum: circle invis at (Here,Sum)}
  dtee(L)
  {darrow(to CO.w,t)}
{D: box "D" wid boxwid/2 ht boxwid/2 at 0.5<Here,Dum.n>}
  darrow(to D.n,t)
  darrow(from D.s to Dum.n,,,,,,!-)

  dline(up_ from CO.n to (CO,COb)-(0,indel),,t,,!-)
  dleft; darrow(to (COb.e,Here))

  dline(up_ from CbOb.n to (CbOb,COb),,t,,!-)
  dleft; darrow(to COb.e)

  dline(from CbO.n-(indel,0) up_ CbOb.y-CbO.n.y,,t,,!-)
  dleft; darrow(to CbOb.e)

  dline(up_ from CbO.n to (CbO,CO),,t,,!-)
  dleft
  dline(to (CbOb.w,Here)); darrow(to CO.e)

  dline(up_ from CbO.n+(indel,0) to (CbO,COb)+(indel,indel),,t,,!-)
  dleft; darrow(to (COb.e,Here))

  darrow(from CO.s to Sum.n,,,,,,!-)

  darrow(left_ from Sum.w to Dum.e)
  dline(from Dum.w to (SB.w-(0.1,0),Dum)); darrow(to (U,Here))
    {"svg_bf(y)" rjust}
  move left 0.23

  circle at Sum
  circle at Dum

.PE
