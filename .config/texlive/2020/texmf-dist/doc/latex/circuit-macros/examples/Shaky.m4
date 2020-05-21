.PS
# Shaky.m4
gen_init
NeedDpicTools
divert(-1)
                               `An attempt to draw shaky hand-drawn lines'

                               `shakyline(linespec,type,s=shake,[shakevals])
                                Draw a line with a tremor
                                arg3: s=shake parameter (default 1)
                                arg4=normal(0,1) perturbations used if given'
define(`shakyline',
`rpoint_(ifelse(`$1',,`to rvec_(linewid,0)',`$1'))
 M4_start: last line.start
 M4_end: last line.end
 [ Start: M4_start
   End: M4_end
   llen = distance(Start,End)
   npts = round_(llen/linewid*4)
   setkey_($3,s,1)
   if "$4"=="" then { randn(d,npts-1,0,m4s*(llen/npts/8)) }\
   else { for i=1 to npts-1 do { d[i] = $4[i]*m4s*(llen/npts/8) }}
   P[0]: Start
   for i=1 to npts-1 do { P[i]: i/npts between Start and End + (vec_(0,d[i])) }
   P[npts]: End
   spline $2 from P[0] to P[1]
   for i=2 to npts do { continue to P[i] }
 ] with .Start at last line.start; move to last line.end')

                               `shakyarc(arcspec,type,s=shake,[shakevals])
                                Draw an arc with a tremor
                                arg3: s=shake parameter (default 1)
                                arg4=normal(0,1) perturbations used if given'
define(`shakyarc',
`arc invis $1
 M4_start: last arc.start
 M4_end: last arc.end
 M4_C: last arc.c
 [ Start: M4_start
   End: M4_end
   C: M4_C
   as = atan2(Start.y-C.y,Start.x-C.x)
   ae = atan2(End.y-C.y,End.x-C.x)
   ar = distance(Start,C)
   llen = abs(ar*(ae-as))
   npts = round_(llen/linewid*4)
   setkey_($3,s,1)
   if "$4"=="" then { randn(d,npts-1,0,m4s*(llen/npts/8)) }\
   else { for i=1 to npts-1 do { d[i] = $4[i]*m4s*(llen/npts/8) }}
   P[0]: Start
   for i=1 to npts-1 do { P[i]: C + (rect_(ar+d[i],as+i/npts*(ae-as))) }
   P[npts]: End
   spline $2 from P[0] to P[1]
   for i=2 to npts do { continue to P[i] }
 ] with .Start at last arc.start; move to last arc.end')

                               `shakyspline(points,type,s=shake,[shakevals])
                                Draw a spline with a tremor
                                arg3: s=shake parameter (default 1)
                                arg4=normal(0,1) perturbations used if given'
define(`shakyspline',
`rpoint_(ifelse(`$1',,`to rvec_(linewid,0)',`$1'))
 M4_start: last line.start
 M4_end: last line.end
 [ Start: M4_start
   End: M4_end
   llen = distance(Start,End)
   npts = round_(llen/linewid*4)
   setkey_($3,s,1)
   if "$4"=="" then { randn(d,npts-1,0,m4s*(llen/npts/8)) }\
   else { for i=1 to npts-1 do { d[i] = $4[i]*m4s*(llen/npts/8) }}
   P[0]: Start
   for i=1 to npts-1 do { P[i]: i/npts between Start and End + (vec_(0,d[i])) }
   P[npts]: End
   spline $2 from P[0] to P[1]
   for i=2 to npts do { continue to P[i] }
 ] with .Start at last line.start; move to last line.end')

                               `shakyfitcurve(V,n,linetype,
                                  m (default 0),s=val,[shakevals])
                                Like fitcurve but the control points
                                are perturbed
                                arg5: s=shake parameter (default 1)
                                arg6=normal(0,1) perturbations used if given'
define(`shakyfitcurve',`
 {[ m4fn = `$2'; m4fm = ifelse(`$4',,0,`$4')
  M4P_[0]: `$1'[m4fm]
   setkey_($5,s,1)
#  if "$6"=="" then { !!!!
#  else { for i=1 to npts-1 do { d[i] = $5[i]*m4s*(llen/npts/8) }}
  for i=m4fm+1 to m4fn-1 do { M4P_[i-m4fm]: `$1'[i]*(4/3) }
  M4P_[m4fn-m4fm]: `$1'[m4fn]
  n = m4fn-m4fm
                                # forward substitution
  M4P_[1]: M4P_[1]-M4P_[0]/6
  d[1] = 1
  for i = 2 to n-1 do {
    M4P_[i]: M4P_[i]-M4P_[i-1]/(d[i-1]*6)
    d[i] = 1-1/d[i-1]/36 }
                                # backward substitution
  for i= n-1 to 1 by -1 do {
    M4P_[i]: (M4P_[i]-M4P_[i+1]/6)/d[i] }
                                # draw using computed control points
    spline 0.55 `$3' from M4P_[0] to 11/32 between M4P_[0] and M4P_[1] \
       then to 5/32 between M4P_[1] and M4P_[2]
    for i=2 to n-2 do { continue to M4P_[i] }
    continue to 27/32 between M4P_[n-2] and M4P_[n-1] \
      then to 21/32 between M4P_[n-1] and M4P_[n] then to M4P_[n]
  ] with .M4P_[0] at `$1'[ifelse(`$4',,0,`$4')]} ')


divert(0)

[
 linethick = 2.5
 round(,,colored "gray")
 nl = 10
 for i=1 to nl do {
   shakyline(right 6/nl up 2*(2*pmod(i,2)-1),colored "gray",s=1)
   round(,,colored "gray") }
 ]

[
 linethick = 2.5
 na = 3
 arcrad = 1
 for i=1 to na do {
   shakyarc(,colored "gray",s=1)
   }
 ] with .nw at last [].sw +(0,-1)

[
 linethick = 2.5
 na = 3
 arcrad = 2
 for i=1 to na do {
   shakyarc(,colored "gray",s=1)
   }
 ] with .sw at last [].se +(1,0)

.PE
