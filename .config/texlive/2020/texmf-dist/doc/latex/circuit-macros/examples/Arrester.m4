.PS
# Arrester.m4
cct_init

divert(-1)

divert(0)dnl

movewid = movewid/2
  M: arrester
     {"\tt arr{}ester()" at last [].s below}
  N: arrester(,D) with .A at M.end+(movewid,0)
     {"\strut\tt $\cdots$(,D)" at last [].s below}
  P: arrester(,LD) with .A at N.B+(movewid,0)
     {"\tt (,LD)" at last [].s below}
  move; H: arrester(,S)
     {"\tt (,S)" at last [].s below}
  move; Q: arrester(,E)
     {"\tt (,E)" at last [].s below}
  R: arrester(,ED) with .A at Q.end+(movewid,0) 
     {"\tt $\cdots$(,ED)" at last [].s below}
  thinlines_
  Loopover_(`X',
   `spline <- from X.A up 8bp__ then up 6bp__ right 4bp__; "\sl A" ljust
    spline <- from X.B up 8bp__ then up 6bp__ left 4bp__; "\sl B" rjust
    arrow <- from X.G right 12bp__ up 2bp__; "\sl G" ljust',N,R)

.PE
