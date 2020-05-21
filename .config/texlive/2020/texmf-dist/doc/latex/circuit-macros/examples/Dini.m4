.PS
# Dini.m4
# This diagram can be produced using, e.g.
# m4 pdf.m4 Dini.m4 | dpic -d > Dini.pdf

threeD_init
NeedDpicTools
scale = 1.5
[
  viewazimuth = 0                 # View angles in degrees
  viewelevation = 20
  setview(viewazimuth,viewelevation,0)

  a = 1.5
  b = 0.25

define(`Dini',
`a*cos(`$1')*sin(`$2'),dnl
 a*sin(`$1')*sin(`$2'),dnl
 (a*(cos(`$2')+loge(tan((`$2')/2))) + b*(`$1'))')

 umin = 0; umax = 4*pi_
 vmin = 0.2; vmax = 2.0
 ugrid = 80; vgrid = 20

 ur = umax-umin
 vr = vmax-vmin
`define cu {umin+($1)/ugrid*ur}'
`define cv {vmin+($1)/vgrid*vr}'

#                           Generate points and sort
 n = -1
 for iu=0 to ugrid do {
   for iv=0 to vgrid do {
     n +=1
     ciu[n] = cu(iu)
     civ[n] = cv(iv)
     d[n] = dot3D(View3D,Dini(ciu[n],civ[n]))
     ix[n] = n
     }
   }
 dpquicksort(d,0,n,ix)

#                           Draw the facets
 linethick = 0.4
 du = ur/ugrid/2
 dv = vr/vgrid/2
 for i=0 to n do {
   NE: project(Dini(ciu[ix[i]]+du,civ[ix[i]]+dv))
   SE: project(Dini(ciu[ix[i]]+du,civ[ix[i]]-dv))
   SW: project(Dini(ciu[ix[i]]-du,civ[ix[i]]-dv))
   NW: project(Dini(ciu[ix[i]]-du,civ[ix[i]]+dv))
   f = (-cos(ciu[ix[i]])+1)/2
   g = ( sin(ciu[ix[i]])+1)/2
   line from NE to SE then to SW then to NW then to NE \
     outlined rgbstring(f,g,0) shaded rgbstring(f,g,0)
#    outlined rgbstring(0,0.5,0) shaded rgbstring(f,g,0)
   }
]
# Icosahedron.m4
[
#threeD_init
#NeedDpicTools
                            # Computing facets is complicated, so list them.
                            # 60 vertices:
define(`m4x',-1)
 array2(v,m4inx,0, 0, 1.021)
 array2(v,m4inx,0.4035482, 0, 0.9378643)
 array2(v,m4inx,-0.2274644, 0.3333333, 0.9378643)
 array2(v,m4inx,-0.1471226, -0.375774, 0.9378643)
 array2(v,m4inx,0.579632, 0.3333333, 0.7715933)
 array2(v,m4inx,0.5058321, -0.375774, 0.8033483)
 array2(v,m4inx,-0.6020514, 0.2908927, 0.7715933)
 array2(v,m4inx,-0.05138057, 0.6666667, 0.7715933)
 array2(v,m4inx,0.1654988, -0.6080151, 0.8033483)
 array2(v,m4inx,-0.5217096, -0.4182147, 0.7715933)
 array2(v,m4inx,0.8579998, 0.2908927, 0.4708062)
 array2(v,m4inx,0.3521676, 0.6666667, 0.6884578)
 array2(v,m4inx,0.7841999, -0.4182147, 0.5025612)
 array2(v,m4inx,-0.657475, 0.5979962, 0.5025612)
 array2(v,m4inx,-0.749174, -0.08488134, 0.6884578)
 array2(v,m4inx,-0.3171418, 0.8302373, 0.5025612)
 array2(v,m4inx,0.1035333, -0.8826969, 0.5025612)
 array2(v,m4inx,-0.5836751, -0.6928964, 0.4708062)
 array2(v,m4inx,0.8025761, 0.5979962, 0.2017741)
 array2(v,m4inx,0.9602837, -0.08488134, 0.3362902)
 array2(v,m4inx,0.4899547, 0.8302373, 0.3362902)
 array2(v,m4inx,0.7222343, -0.6928964, 0.2017741)
 array2(v,m4inx,-0.8600213, 0.5293258, 0.1503935)
 array2(v,m4inx,-0.9517203, -0.1535518, 0.3362902)
 array2(v,m4inx,-0.1793548, 0.993808, 0.1503935)
 array2(v,m4inx,0.381901, -0.9251375, 0.2017741)
 array2(v,m4inx,-0.2710537, -0.9251375, 0.3362902)
 array2(v,m4inx,-0.8494363, -0.5293258, 0.2017741)
 array2(v,m4inx,0.8494363, 0.5293258, -0.2017741)
 array2(v,m4inx,1.007144, -0.1535518, -0.06725804)
 array2(v,m4inx,0.2241935, 0.993808, 0.06725804)
 array2(v,m4inx,0.8600213, -0.5293258, -0.1503935)
 array2(v,m4inx,-0.7222343, 0.6928964, -0.2017741)
 array2(v,m4inx,-1.007144, 0.1535518, 0.06725804)
 array2(v,m4inx,-0.381901, 0.9251375, -0.2017741)
 array2(v,m4inx,0.1793548, -0.993808, -0.1503935)
 array2(v,m4inx,-0.2241935, -0.993808, -0.06725804)
 array2(v,m4inx,-0.8025761, -0.5979962, -0.2017741)
 array2(v,m4inx,0.5836751, 0.6928964, -0.4708062)
 array2(v,m4inx,0.9517203, 0.1535518, -0.3362902)
 array2(v,m4inx,0.2710537, 0.9251375, -0.3362902)
 array2(v,m4inx,0.657475, -0.5979962, -0.5025612)
 array2(v,m4inx,-0.7841999, 0.4182147, -0.5025612)
 array2(v,m4inx,-0.9602837, 0.08488134, -0.3362902)
 array2(v,m4inx,-0.1035333, 0.8826969, -0.5025612)
 array2(v,m4inx,0.3171418, -0.8302373, -0.5025612)
 array2(v,m4inx,-0.4899547, -0.8302373, -0.3362902)
 array2(v,m4inx,-0.8579998, -0.2908927, -0.4708062)
 array2(v,m4inx,0.5217096, 0.4182147, -0.7715933)
 array2(v,m4inx,0.749174, 0.08488134, -0.6884578)
 array2(v,m4inx,0.6020514, -0.2908927, -0.7715933)
 array2(v,m4inx,-0.5058321, 0.375774, -0.8033483)
 array2(v,m4inx,-0.1654988, 0.6080151, -0.8033483)
 array2(v,m4inx,0.05138057, -0.6666667, -0.7715933)
 array2(v,m4inx,-0.3521676, -0.6666667, -0.6884578)
 array2(v,m4inx,-0.579632, -0.3333333, -0.7715933)
 array2(v,m4inx,0.1471226, 0.375774, -0.9378643)
 array2(v,m4inx,0.2274644, -0.3333333, -0.9378643)
 array2(v,m4inx,-0.4035482, 0, -0.9378643)
 array2(v,m4inx,0, 0, -1.021)

                            # 12 pentagons
undefine(`m4x')
array2(p,m4inx,0,3,8,5,1)
array2(p,m4inx,2,7,15,13,6)
array2(p,m4inx,4,10,18,20,11)
array2(p,m4inx,9,14,23,27,17)
array2(p,m4inx,12,21,31,29,19)
array2(p,m4inx,16,26,36,35,25)
array2(p,m4inx,22,32,42,43,33)
array2(p,m4inx,24,30,40,44,34)
array2(p,m4inx,28,39,49,48,38)
array2(p,m4inx,37,47,55,54,46)
array2(p,m4inx,41,45,53,57,50)
array2(p,m4inx,51,52,56,59,58)

                            # 20 hexagons
undefine(`m4x')
array2(h,m4inx,0,1,4,11,7,2)
array2(h,m4inx,0,2,6,14,9,3)
array2(h,m4inx,1,5,12,19,10,4)
array2(h,m4inx,3,9,17,26,16,8)
array2(h,m4inx,5,8,16,25,21,12)
array2(h,m4inx,6,13,22,33,23,14)
array2(h,m4inx,7,11,20,30,24,15)
array2(h,m4inx,10,19,29,39,28,18)
array2(h,m4inx,13,15,24,34,32,22)
array2(h,m4inx,17,27,37,46,36,26)
array2(h,m4inx,18,28,38,40,30,20)
array2(h,m4inx,21,25,35,45,41,31)
array2(h,m4inx,23,33,43,47,37,27)
array2(h,m4inx,29,31,41,50,49,39)
array2(h,m4inx,32,34,44,52,51,42)
array2(h,m4inx,35,36,46,54,53,45)
array2(h,m4inx,38,48,56,52,44,40)
array2(h,m4inx,42,51,58,55,47,43)
array2(h,m4inx,48,49,50,57,59,56)
array2(h,m4inx,53,54,55,58,59,57)

  viewazimuth = -10         # View angles in degrees
  viewelevation = 40
  setview(viewazimuth,viewelevation,0)

  n = 0                     # Find and draw the visible hexagons
  for i=1 to 20 do {        # The normal is the line to the center
    for_(1,3,1,`a[m4x] = (v[h[i,1],m4x] + v[h[i,4],m4x])/2')
    if dot3D(View3D,a[1],a[2],a[3]) >= 0 then { n +=1; ih[n] = i }
    }
  for i=1 to n do {
    for j=1 to 6 do { x[j]=h[ih[i],j] }
    line from project((v[x[1],1]),(v[x[1],2]),(v[x[1],3]))\
    for_(2,6,1,`to project((v[x[m4x],1]),(v[x[m4x],2]),(v[x[m4x],3]))\')\
    to project((v[x[1],1]),(v[x[1],2]),(v[x[1],3])) thick 0.2 fill_(0.95)
    }
  m = 0
  for i=1 to 12 do {        # Visible pentagons
    for_(1,3,1,`a[m4x] = 0; for j=1 to 5 do { a[m4x] += v[p[i,j],m4x] }')
    if dot3D(View3D,a[1]/5,a[2]/5,a[3]/5) >= 0 then { m +=1; ip[m] = i }
    }
  for i=1 to m do {
    for j=1 to 5 do { x[j]=p[ip[i],j] }
    line from project((v[x[1],1]),(v[x[1],2]),(v[x[1],3])) \
    for_(2,5,1,`to project((v[x[m4x],1]),(v[x[m4x],2]),(v[x[m4x],3]))\')\
    to project((v[x[1],1]),(v[x[1],2]),(v[x[1],3])) thick 0.2 fill_(0)
    }
] scaled 2.5 with .sw at last [].se+(1,0)
.PE
