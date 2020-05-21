.PS
# Orbits.m4
threeD_init
NeedDpicTools

  crad = 1.0
  g = 0.65

#                              `orbitpos(long,lat,rad,ang)'
define(`orbitpos',
 `rot3Dx((`$2')*dtor_,rot3Dz((`$1')*dtor_,rot3Dy(-(`$4')*dtor_,`$3',0,0)))')

define(`PO',`B.C+(project(orbitpos(orbitlong,orbitlat,orbitrad,`$1')))')

define vis { X: PO($1)
  if (distance(X,B.C)>crad) || \
    (dot3D(View3D,orbitpos(orbitlong,orbitlat,orbitrad,$1))>0) \
  then {$2 = 1} else {$2 = -1} }

#                              `orbit(long,lat,rad)'
define(`orbit',
 `[da = 3
  orbitlong = `$1'
  orbitlat = `$2'
  orbitrad = `$3'
  define(`decorated',`ifelse(`$4',,,`outlined `$4'')')
  arrow from PO(0) to PO(da*3) decorated
  n=0
  P[n]: PO(0)
  vis(0,v)
  for d=da to 360 by da do {
    vis(d,x)
    if  x*v < 0 then {
      findroot(vis,d-da,d,1e-6,x)
      n+=1; P[n]: PO(x)
      if v < 0 then { fitcurve(P,n,dashed decorated) } \
      else { fitcurve(P,n,decorated) }
      P[0]: P[n]
      n = 0; v = -v }
    n +=1; P[n]: PO(d)
    }
  if v < 0 then { fitcurve(P,n,dashed decorated) } \
  else { fitcurve(P,n,decorated) }
  ] with .c at B.C')

#                               ball(rad,highlight rad,highlight degrees)
define(`ball',`[
  lt = linethick bp__
  C: circle invis rad `$1' at (0,0)
  D: C+(Rect_(`$2',`$3'))
  rm = `$1'+distance(C,D)
  a = 1 # fade rate parameter
  for r=lt to rm by lt do {
    u = 1-(r/rm*(a*r/rm+(1-a)))
    if r < (1-g)*`$1' then { circle outlined rgbstring(u,u,u) rad r at D } \
    else { arc cw outlined rgbstring(u,u,u) from Cintersect(D,r,C,`$1') \
      to Cintersect(D,r,C,`$1',R) with .c at D
      }
    }
  circle rad C.rad at C
  ]')

  linethick = 0.8
  B: ball(crad,crad*g,110)

  azimuth = 0
  elevation = 0
  setview(azimuth,elevation)

  orbit(10, 30,crad*1.3,"red")
  orbit(10,-30,crad*1.3,"blue")
  orbit(10,-90,crad*1.3,"cyan")

.PE
