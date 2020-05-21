.PS
# `NPDT.m4'
cct_init
  linewid = linewid*1.2
  movewid = 1.0

  NPDT
  {  `"\sl R" at last [].R.s below
       "\sl T" at last [].T.s below
       "\sl L" at last [].L.s below' }
  { `"\tt NPDT"' at last [].s +(0,-0.22) }
  up_; NPDT with .L at last[].R+(0.75,0)
   {  `"\sl R"' wid 8pt__ at last [].R.e ljust
       "\sl T" at last [].T.e ljust
       "\sl L" at last [].L.e ljust }
  { `"\tt up\_; NPDT\strut"' at last [].s +(0.1,-0.15) }
  right_
  NPDT(2) with .L1 at last [].L+(0.75,0)
  { for_(1,2,1,
     `"\sl R`'m4x" at last [].R`'m4x.e ljust
      "\sl L`'m4x" wid 11pt__ at last [].L`'m4x.w rjust') }
  { `"\tt NPDT(2)\strut"' at last [].s +(0,-0.15) }
  move
  NPDT(3,R) with .L3 at last [].R1+(0.75,0)
  { for_(1,3,1,
     `"\sl R`'m4x" at last [].R`'m4x.e ljust
      "\sl L`'m4x" wid 11pt__ at last [].L`'m4x.w rjust') }
  { `"\tt NPDT(3,R)\strut"' at last [].s below }
  left_; NPDT(2,R) with .R1 at last [].R3+(0.75,0)
  { for_(1,2,1,
     `"\sl R`'m4x" at last [].R`'m4x.w rjust
      "\sl L`'m4x" wid 11pt__ at last [].L`'m4x.e ljust') }
  { `"\tt left\_; NPDT(2,R)\strut"' at last [].s +(0,-0.15) }

.PE
