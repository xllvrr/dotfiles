.PS
# `Antennas.m4'
cct_init
s_init(Antennas)
sinclude(Circuit_macros.dim)

  define(`elen_',elen_*0.9)
  B: Here
  A: antenna
       s_box(T) below at A.T
       s_box(`\tt an`'tenna') at A.n above
  A: antenna(at A.T+(elen_,0),T)
       s_box(T) below at A.T
       s_box(`\tt (,T)') at A.n above
  A: antenna(at A.T+(elen_,0),,L)
       s_box(T1) below rjust at A.T1
       s_box(T2) below ljust at A.T2
       s_box(`\tt (,{,}L)') at A.n above
  A: antenna(at A.T+(elen_,0),T,L)
       s_box(T1) below rjust at A.T1
       s_box(T2) below ljust at A.T2
       s_box(`\tt (,T,L)') at A.n above
  A: antenna(at A.T+(elen_,0),,T)
       s_box(T) below at A.T
       s_box(`\tt (,{,}T)') at A.n above
  A: antenna(at A.T+(elen_,0),,S)
       s_box(T1) below rjust at A.T1
       s_box(T2) below ljust at A.T2
       s_box(`\tt (,{,}S)') at A.n above
  A: antenna(at A.T+(elen_,0),,D)
       s_box(T1) below rjust at A.T1
       s_box(T2) below ljust at A.T2
       s_box(`\tt (,{,}D)') at A.n above
  A: antenna(at A.T+(elen_,0),,P)
       s_box(T) below at A.T
       s_box(`\tt (,{,}P)') at A.n above
  A: antenna(at A.T+(elen_,0),,F)
       s_box(T) below at A.T
       s_box(`\tt (,{,}F)') at A.n above
.PE
