.PS
# CrullerSVG.m4
threeD_init
NeedDpicTools
scale = 2.54

define(`lobe',`(sind(6*(`$1'))+4)/5*2.25')

  viewazimuth = 20                 # Set view angles in degrees
  viewelevation = 30
  setview(viewazimuth,viewelevation,0)

  dt = 3                           # major angle degrees per facet
  ds = 10                          # minor angle degrees per facet

  tradius = 6
define(`cruller',`rot3Dz((`$1')*dtor_,
  sum3D(0,tradius,0,0,Rect_(lobe(`$2'+2*(`$1')),`$2')))')

define(`tvisible',`dot3D(View3D,
  cross3D(diff3D(cruller(`$1'+dt/2,`$2'),cruller(`$1',`$2')),
          diff3D(cruller(`$1',`$2'+ds/2),cruller(`$1',`$2'))))')

                                   # create the arrays and sort
  n = 0 
  for t = dt to 360+dt/2 by dt do {
    for s=ds/2 to 360.1 by ds do { 
      if tvisible(t,s) > -0.01 then {
        n +=1
        t[n] = t
        s[n] = s
        d[n] = dot3D(cruller(t,s),view3D1,view3D2,view3D3) # view distance
        ix[n] = n
        }
      } }
# prval(n)
  dpquicksort(d,1,n,ix)

                                   # Background
Bne: (9,6)
Bsw: (-9,-6)
B: 0.5 between Bne and Bsw
iflatex(`line fill_(0.75) \
  from (Bsw,Bne) to Bsw then to (Bne,Bsw) then to Bne then to (Bsw,Bne)',
 `ShadedPolygon((Bsw,Bne):Bsw:(Bne,Bsw):Bne,,-30,
    0,1,1,1,
   .5,.1,.4,0,
    1,0,0,0) at B')
                                   # draw the facets
thinlines_
[
  rgbtohsv(0.6,0.4,0,h,s,v)
  for i = 1 to n do {
    tc = t[ix[i]]; sc = s[ix[i]]
    SE: (project(cruller(tc+dt/2,sc-ds/2)))
    SW: (project(cruller(tc-dt/2,sc-ds/2)))
    NW: (project(cruller(tc-dt/2,sc+ds/2)))
    NE: (project(cruller(tc+dt/2,sc+ds/2)))
    f = ((dcosine3D(3,cruller(tc,sc))/2.25+1)/2)^2
    hsvtorgb(h,(1-f)*s,1,r,g,b)
    line outlined rgbstring(r,g,b) shaded rgbstring(r,g,b) ifpdf( invis ) \
      from SE to SW then to NW then to NE then to SE }
  ] at B

thicklines_

.PE
