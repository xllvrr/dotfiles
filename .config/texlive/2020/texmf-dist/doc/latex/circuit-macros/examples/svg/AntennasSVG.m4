.PS
# `Antennas.m4'
cct_init(svg_font(sans-serif,11bp__))
  textoffset = 3bp__

  define(`elen_',elen_*0.9)
  B: Here
  A: antenna
       "T" below at A.T
       "`antenna'" wid 0.6 at A.n above
  A: antenna(at A.T+(elen_,0),T)
       "T" below at A.T
       "`(,T)'" at A.n above
  A: antenna(at A.T+(elen_,0),,L)
       "T1" below rjust at A.T1
       "T2" below ljust at A.T2
       "`(,,L)'" at A.n above
  A: antenna(at A.T+(elen_,0),T,L)
       "T1" below rjust at A.T1
       "T2" below ljust at A.T2
       "`(,T,L)'" at A.n above
  A: antenna(at A.T+(elen_,0),,T)
       "T" below at A.T
       "`(,,T)'" at A.n above
  A: antenna(at A.T+(elen_,0),,S)
       "T1" below rjust at A.T1
       "T2" below ljust at A.T2
       "`(,,S)'" at A.n above
  A: antenna(at A.T+(elen_,0),,D)
       "T1" below rjust at A.T1
       "T2" below ljust at A.T2
       "`(,,D)'" at A.n above
  A: antenna(at A.T+(elen_,0),,P)
       "T" below at A.T
       "`(,,P)'" at A.n above
  A: antenna(at A.T+(elen_,0),,F)
       "T" below at A.T
       "`(,,F)'" at A.n above
 command "</g>" # end font
.PE
