.PS
# Planes.m4
threeD_init
NeedDpicTools

# This 3D diagram is like many others: define the facets, use the normal vectors
# to determine visibility, sort and plot the facets from back to front.

define(`mark',`"`$1'" at `$1'')

#                           size parameters
  a = 3/2
  b = 0.4
  d =  1
#                           Define intersecting lines in the plane
  A0: -a,-b
  A1:  a,-b
  B0: Rot_(A0,120)
  B1: Rot_(A1,120)
  C0: Rot_(A0,240)
  C1: Rot_(A1,240)

#                           intersections
define(`lintersect',`intersect_(`$1'0,`$1'1,`$2'0,`$2'1)')
  AB: lintersect(A,B)
  BC: lintersect(B,C)
  CA: lintersect(C,A)

#                           Store a point as x[i], y[i], z[i]
define(`mkxyz',`
  x[$1] = $2
  y[$1] = $3
  z[$1] = $4')
#                           Recover point coordinates
define(`xyz',`x[$1], y[$1], z[$1]')

#                           Facets are rectangles here; store 3 corners
define(`mkfacet',`
  mkxyz((`$1')*3,   0,`$2'.x,`$2'.y)
  mkxyz((`$1')*3+1, 0,`$3'.x,`$3'.y)
  mkxyz((`$1')*3+2,-d,`$3'.x,`$3'.y)
')
#                           Define the facets
  mkfacet(1,A0,CA) mkfacet(2,CA,A0)
  mkfacet(3,CA,AB) mkfacet(4,AB,CA)
  mkfacet(5,AB,A1) mkfacet(6,A1,AB)

  mkfacet(7,B0,AB) mkfacet(8,AB,B0)
  mkfacet(9,AB,BC) mkfacet(10,BC,AB)
  mkfacet(11,BC,B1) mkfacet(12,B1,BC)

  mkfacet(13,C0,BC) mkfacet(14,BC,C0)
  mkfacet(15,BC,CA) mkfacet(16,CA,BC)
  mkfacet(17,CA,C1) mkfacet(18,C1,CA)
  nfacets = 18

#                           View angles azimuth, elevation, rotation (degrees)
  setview( 10, 30, 5)

ifelse(1,1,`
#                                   # create array of visible facets and sort
  n = 0
  for i=1 to nfacets do {
    mkxyz(-1,
      cross3D(diff3D(xyz(i*3+1),xyz(i*3)),diff3D(xyz(i*3+2),xyz(i*3+1))))
    dx = dot3D(xyz(-1),View3D)
    if dx > 0 then {
      dy[i] = dx/length3D(xyz(-1))
      n +=1
      d[n] = dot3D(sum3D(xyz(i*3),xyz(i*3+2)),View3D)/2
      ix[n] = i
      }
    }
  dpquicksort(d,1,n,ix)

#print sprintf("n=%g",n); for i=1 to n do { print i,ix[i] }

#                           Recover the 4th corner and draw
define(`drawfacet',`
  NW_facet: project(xyz(($1)*3))
  NE_facet: project(xyz(($1)*3+1))
  SE_facet: project(xyz(($1)*3+2))
  SW_facet: project(x[($1)*3+2],y[($1)*3],z[($1)*3])
  shd = 1-($2)^4
  line from SW_facet to SE_facet then to NE_facet \
    then to NW_facet then to SW_facet shaded rgbstring(shd,shd,shd)
# sprintf("%g",$1) at 0.5 between SW_facet and NE_facet
#   Loopover_(`x',`mark(x);',SW_facet,SE_facet,NE_facet,NW_facet)
  ')

#                                   # draw facets, shading with view cosines
  for i=1 to n do { drawfacet(ix[i],dy[ix[i]]) }
')

.PE
