.PS
# Composite.m4
log_init

divert(-1)

divert(0)dnl

  command "{\tt"
[
  K1: KelvinR
  { "`KelvinR'" at last [].C +(0,-0.25)
    "\sl T1" at K1.T1 above
    "\sl T2" at K1.T2 above
    arrow <- up 0.1 left 0.1 from last [].Start ; `"\sl Start"' above
    arrow <- up 0.1 right 0.1 from last [].End ; `"\sl End"' above }
  K2: KelvinR(,R) with .Start at K1.End+(0.25,0.1)
  { "`KelvinR(,R)'" at last [].C +(0,-0.25)
    "\sl T1" at K2.T1 rjust
    "\sl T2" at K2.T2 ljust }
]

[
  FTcap
  { thinlines_
   `"FTcap"' at last [].s +(0,-0.2)
    arrow <- up 0.1 left 0.1 from last [].Start ; `"\sl Start"' above
    arrow <- up 0.1 right 0.1 from last [].End ; `"\sl End"' above
    arrow <- up 0.15 left 0.1 from last [].T1 ; `"\sl T1"' rjust
    arrow <- right 0.1 from last [].T2 ; `"\sl T2"' ljust
    thicklines_ } 
  FTcap(B) with .w at last [].e+(0.65,0)
  { thinlines_
   `"FTcap(B)"' at last [].s +(0,-0.2)
    arrow <- up 0.1 left 0.1 from last [].Start ; `"\sl Start"' above
    arrow <- up 0.1 right 0.1 from last [].End ; `"\sl End"' above
    arrow <- up 0.15 left 0.1 from last [].T1 ; `"\sl T1"' rjust
    arrow <- left 0.1 from last [].T2 ; `"\sl T2"' rjust
    thicklines_ } 
  FTcap(C) with .w at last [].e+(0.65,0)
  { thinlines_
   `"FTcap(C)"' at last [].s +(0,-0.2)
    arrow <- up 0.1 left 0.1 from last [].Start ; `"\sl Start"' above
    arrow <- up 0.1 right 0.1 from last [].End ; `"\sl End"' above
    arrow <- left 0.1 from last [].T ; `"\sl T"' rjust
    thicklines_ } 
  FTcap(D) with .w at last [].e+(0.65,0)
  { thinlines_
   `"FTcap(D)"' at last [].s +(0,-0.2)
    arrow <- up 0.1 left 0.1 from last [].Start ; `"\sl Start"' above
    arrow <- up 0.1 right 0.1 from last [].End ; `"\sl End"' above
    arrow <- left 0.1 from last [].T ; `"\sl T"' rjust
    thicklines_ } 

] with .sw at last [].se+(0.1,0)

  command "}"
.PE
