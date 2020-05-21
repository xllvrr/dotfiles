.PS
cct_init
linewid = linewid*6/6.2435
command "{\sf"
#                               `Point_(degrees)
#                                hybrid_PI_BJT([L][M])
#                                L=left orientation; M=mirror'
define(`hybrid_PI_BJT',
`[                              # Size (and direction) parameters:
   hunit = ifinstr(`$1',M,-)dimen_
   vunit = ifinstr(`$1',L,-)dimen_*3/2
   hp_ang = rp_ang              # Save the reference direction

 Rpi: resistor(to rvec_(0,-vunit)); point_(hp_ang)    # Restore direction
 DotG: dot(at rvec_(hunit*5/4,0))
 Gm: consource(to rvec_(0,vunit),I,R); point_(hp_ang) # Restore direction
   dot(at rvec_(hunit*3/4,0))
 Ro: resistor(to rvec_(0,-vunit)); point_(hp_ang)     # Restore direction
   line from Rpi.start to Rpi.start+vec_(-hunit/2,0) chop -lthick/2 chop 0
 Base: dot(,,1)
   line from Gm.end to Ro.start+vec_(hunit/2,0) chop -lthick/2 chop 0
 Collector: dot(,,1)
   line from Rpi.end to Ro.end chop -lthick/2
 DotE: dot(at 0.5 between Rpi.end and DotG)
   line to rvec_(0,-vunit/2)
 Emitter: dot(,,1)
                                # Labels
 `"$\mathrm{r_\pi}$"' at Rpi.c+vec_(hunit/4,0)
 `"$ + $"' at Rpi.c+vec_(-hunit/6, vunit/4)
 `"$ - $"' at Rpi.c+vec_(-hunit/6,-vunit/4)
 `"$\mathrm{v_\pi}$"' at Rpi.c+vec_(-hunit/4,0)
 `"$\mathrm{g_m}$$\mathrm{v_\pi}$"' at Gm.c+vec_(-hunit*3/8,-vunit/4)
 `"$\mathrm{r_o}$"' at Ro.c+vec_(hunit/4,0)
 `$2' ] ')

[
Q: hybrid_PI_BJT
  "Base" at Q.Base +(0.15,0.1)
  "Emitter" ht 0.1 wid 0.5 at Q.Emitter.w rjust
  "Collector" ht 0.1 at Q.Collector +(-0.2,0.1)
 `"hybrid\_PI\_BJT"' ht 0.1 at Q.s+(0,-0.2)
  hybrid_PI_BJT(M) with .Collector at last [].Collector+(0.15,0)
 `"hybrid\_PI\_BJT(M)"' ht 0.1 at last [].s+(0,-0.2)
  hybrid_PI_BJT(LM) with .w at last [].e
 `"hybrid\_PI\_BJT(LM)"' ht 0.1 at last [].s+(0,-0.2)
Point_(45)
  hybrid_PI_BJT with .Emitter at last [].Base+(elen_*1.75,0.1)
 `"\shortstack[l]{Point\_(45)\\ hybrid\_PI\_BJT}"' \
    ht 0.25 at last [].s+(0.2,-0.2)
]
#print last [].wid
 
command "}%"
.PE
