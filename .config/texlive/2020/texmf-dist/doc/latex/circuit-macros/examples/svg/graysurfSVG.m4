.PS
# graysurfSVG.m4
threeD_init
NeedDpicTools

Overall: [
[]
Surface:[
#                                  This just draws the facets back to front

  setview(20,30)
  dimen = 1.5
  
  xmax = 2*dimen
  ymax = 1.5*dimen
  zmax = 1*dimen
  
  define(`fn',
  `expe(-(`$1')/tt)*cos((`$2')/xmax*1.75*twopi_)*cos((`$1')/ymax*twopi_)')
  
  nx = 24; dx = xmax/nx
  ny = 30; dy = ymax/ny
  tt = 1.5
  fnmax = fn(0,0,0)
  
  Orig: (0,0)
  linethick_(1.2)
  arrow from Orig to 1.2 <Orig,(project(xmax,0,0))> ; "svg_it(x)" wid 0.08 below
  arrow from Orig to 1.2 <Orig,(project(0,ymax,0))> ; "svg_it(y)" ljust
  arrow from Orig to 1.2 <Orig,(project(0,0,zmax))> ; "svg_it(z)" rjust
  
  linethick_(0)
  for i = 0 to nx-1 do {
    x = xmax*i/nx
    for j = 0 to ny-1 do {
      y = ymax*j/ny
      fnxy = fn(x,y)
      shade((fnmax+fnxy)/fnmax/2,
        line from (project(x,y,fnxy)) to (project(x,(y+dy),`fn(x,(y+dy))'))\
          then to (project((x+dx),(y+dy),`fn((x+dx),(y+dy))'))\
          then to (project((x+dx),y,`fn((x+dx),y)'))\
          then to (project(x,y,fnxy))
        ) } }
] with .w at last [].e+(-0.2,0)

Torus: [
#                                  Calculate all the facet centres but draw
#                                  only a subset of them after sorting

  viewazimuth = 20                 # Set view angles in degrees
  viewelevation = 30

  setview(viewazimuth,viewelevation,0)

  sfactor = 0.7
  tradius = 2*sfactor
  sradius = 0.75*sfactor

define(`torus',`rot3Dz((`$1')*dtor_,
  sum3D(tradius,0,0,rot3Dy((`$2')*dtor_,sradius,0,0)))')

define(`tvisible',`dot3D(view3D1,view3D2,view3D3,
  rot3Dz((`$1')*dtor_,rot3Dy((`$2')*dtor_,1,0,0)))')

Orig: (0,0)
X: arrow from Orig to (project(tradius+sradius*4,0,0)); "x" rjust
Y: arrow from Orig to (project(0,tradius+sradius*2,0)); "y" below wid 4bp__

  dt = 10                          # major angle degrees per facet
  ds = 10                          # minor angle degrees per facet

                                   # create the arrays and sort
  n = 0 
  for t = dt to 360+dt/2 by dt do {
    for s=ds/2 to 360.1 by ds do { 
      if tvisible(t,s) >= 0 then {
      n +=1
      t[n] = t
      s[n] = s
      d[n] = dot3D(torus(t,s),view3D1,view3D2,view3D3) # view distance
      ix[n] = n
      } } }
#prval(n)
  dpquicksort(d,1,n,ix)

                                   # draw the facets
thinlines_
  for i = 1 to n do {
    tc = t[ix[i]]; sc = s[ix[i]]
    SE: (project(torus(tc+dt/2,sc-ds/2)))
    SW: (project(torus(tc-dt/2,sc-ds/2)))
    NW: (project(torus(tc-dt/2,sc+ds/2)))
    NE: (project(torus(tc+dt/2,sc+ds/2)))
    f = ((dcosine3D(3,torus(tc,sc))/sradius+1)/2)^2
    g = min(f,0.9)
    setrgb(g,g,g)
#   line fill f ifpdf( invis ) \
#     from SE to SW then to NW then to NE then to SE
    shade(f,
    line invis fill f from SE to SW then to NW then to NE then to SE )

    resetrgb
  }

thicklines_
  arrow from Orig to (project(0,0,tradius*1.4)); "z" above
  dashline(from Orig to (project(torus(0,0))),,,,G)
  arrow to X.end
  dashline(from Orig to (project(torus(90,0))),,,,G)
  arrow to Y.end

] with .sw at last [].se+(0.2,0)

Hat: [
#                                  Sort as for the torus but draw edges too

  azimuth = 25                     # View angles in degrees
  elevation = 20
  setview(azimuth,elevation)
                                   # the 3D object: `hat(t,y)'
  define(`hat',`cosd($1)*($2),sind($1)*($2),(($2)^2-1)^2') 
  define(`gradient',`(-4*($2)*(($2)^2-1)*cosd(`$1')),
                     (-4*($2)*(($2)^2-1)*sind(`$1')),1')
  define edge {$2=dot3D(View3D,gradient($1,y))}
  define(`hatvis',
   `(($2 > 0.6) || (dot3D(View3D,gradient($1,$2)) > 0))')

                                   # grid parameters
  dang = 09
  maxy = 1.25
  dy = 0.05

Orig: (0,0)
X: arrow from Orig to (project(maxy*1.2,0,0)); "x" rjust
Y: arrow from Orig to (project(0,maxy*1.2,0)); "y" ljust
Xv: (project(1,0,0))
Yv: (project(0,1,0))
Zv: (project(0,0,1))
                                   # create the arrays and sort
  n = 0 
  for t = dang/2 to 360.1 by dang do {
    for y=dy/2 to maxy by dy do {
      if hatvis(t,y) then {
      n +=1
      t[n] = t
      y[n] = y
      d[n] = dot3D(hat(t,y),View3D) #distance toward the front
      ix[n] = n
      } } } 
#prval(n)
  dpquicksort(d,1,n,ix)
                                   # draw the facets
  ellipse wid maxy*2 ht maxy*2*sind(elevation) \
    with .c at (project(0,0,(maxy^2-1)^2)+linethick bp__/2)
thinlines_
  for i = 1 to n do {
    tc = t[ix[i]]; yc = y[ix[i]]
    SE: (project(hat(tc+dang/2,yc-dy/2)))
    SW: (project(hat(tc-dang/2,yc-dy/2)))
    NW: (project(hat(tc-dang/2,yc+dy/2)))
    NE: (project(hat(tc+dang/2,yc+dy/2)))
    f = abs(yc^2-1)
    line invis fill f from SE to SW then to NW then to NE then to SE
  }

                                   # Outline where the surface goes invisible
mm = int(maxy/dy)
nr = -1
for i=1 to mm do { y = i/(mm+3)
  findroot(edge,(azimuth+2),(azimuth+180-2),1e-8,t)
  nr +=1
  R[mm+nr]: (project(hat(t,y)))
  R[mm-1-nr]: (-R[mm+nr].x,R[mm+nr].y)
  }
fitcurve(R,mm*2-1)

                                   # Z axis
thicklines_
Z: arrow from Zv to (project(0,0,1.2)); "z" ljust
  line dashed from Orig to Zv chop 0 chop dashwid/2
  line dashed from Orig to Xv
  line dashed from Orig to Yv

                                   # Partial rim
ellipsearc(maxy*2,maxy*2*sind(elevation),-pi_*1.4,pi_/3) \
  with .C at (project(0,0,(maxy^2-1)^2)+linethick bp__/2)
] scaled 1.25 with .s at 2nd [].ne+(0,-0.75)
] scaled 0.85

.PE
