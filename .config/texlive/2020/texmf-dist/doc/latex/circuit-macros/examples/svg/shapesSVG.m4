.PS
# shapes.m4
threeD_init

divert(-1)
# shapes.m4
# 3D structures with complex surfaces and hidden lines are the domain of more
# sophisticated software packages, but basic shapes can be drawn with pic.
#threeD_init

#####################################################

                           `cylinder3D(xdispl,ydispl,zdispl,diameter,
                              [colored "color"])'
define(`cylinder3D',`[ Start: (0,0)
 xdispl = `$1'; ydispl = `$2'; zdispl = `$3'
 diamc = ifelse(`$4',,(lenc/2),`$4') ; radc = diamc/2
 define(`M4CL',`xdispl,ydispl,zdispl')dnl
 lenc = length3D(M4CL)
 cs = dot3D(View3D,M4CL)/lenc
 End: (project(M4CL))
 az = atan2(ydispl,xdispl)
 ae = atan2(zdispl,sqrt(xdispl^2+ydispl^2))
 CL: line invis from Start to End; C: CL.c
 nls = int(twopi_*radc/lthick)
 define(`M4PP',`rot3Dz(az,rot3Dy(-ae,rot3Dx(-i/nls*twopi_,0,0,radc)))')dnl
 for i=0 to nls-1 do { if dot3D(View3D,M4PP) > 0 then {
   P: (project(M4PP))
   ql = sqrta(dot3D(Light3D,M4PP)/radc)
   line from P to End+P outlined rgbstring(ql,ql,ql) `$5' } }
 Perp: (vperp(CL,radc))
 if cs > 0 then { T: End; B: Start } else { T: Start; B: End }
 rpoint_(from Start to Perp)
 css = sqrta(cs)
 Top: rotellipse(diamc,diamc*cs,
   thick linethick/3 shaded rgbstring(css,css,css)) with .c at T
 W: line thick linethick/3 from T+Perp to B+Perp
 Bot: ellipsearc(diamc,diamc*cs,pi_,twopi_,rp_ang,cw,
   thick linethick/3) with .C at B
 E: line thick linethick/3 from B-Perp to T-Perp
 rpoint_(from Start to End)
`$6']')

                           `cone3D(xdispl,ydispl,zdispl,diameter,
                              [colored "color"])'
define(`cone3D',`[ Start: (0,0)
 xdispl = `$1'; ydispl = `$2'; zdispl = `$3'
 define(`M4CL',`xdispl,ydispl,zdispl')dnl
 lenc = length3D(M4CL)
 diamc = ifelse(`$4',,(lenc/2),`$4') ; radc = diamc/2
 End: (project(M4CL))
 cs = dot3D(View3D,M4CL)/lenc
 az = atan2(ydispl,xdispl)
 ae = atan2(zdispl,sqrt(xdispl^2+ydispl^2))
 CL: line invis from Start to End; C: CL.c
 nls = int(twopi_*radc/lthick)
 lt = sqrt(radc^2+lenc^2)
 b = 0
 for i=0 to nls-1 do { if dot3D(View3D,
   rot3Dz(az,rot3Dy(-ae,rot3Dx(-i/nls*twopi_,radc,0,lenc)))) > 0 then {
     ql = sqrta(dot3D(Light3D,
       rot3Dz(az,rot3Dy(-ae,rot3Dx(-i/nls*twopi_,radc,0,lenc))))/lt)
     P: (project(rot3Dz(az,rot3Dy(-ae,rot3Dx(-i/nls*twopi_,0,0,radc)))))
     line from P to End outlined rgbstring(ql,ql,ql) `$5'
     if !b then { WB: P; b = 1 } 
     } else { if b then { BW: P; b = 0 } } }
 if vlength(CL.x,CL.y) != 0 then { Perp: (vperp(CL,radc,R)) } else { Perp: (radc,0) } 
 if cs >= 0 then { T: End; B: Start } else {T: Start; B: End }
 rpoint_(from Start to Perp)
 pout = (vlength(End.x,End.y) > abs(radc*cs))
 if cs < 0 then { css = sqrta(cs)
   if pout then { line thick linethick/3 from BW to End then to WB }
   Bot: rotellipse(diamc,diamc*cs,thick linethick/3 \
     ifelse(`$5',,`shaded rgbstring(css,css,css)',`$5')) with .c at T } \
 else { if pout then {
   line thick linethick/3 from BW to End then to WB
   a = acos((WB.x*Perp.x+WB.y*Perp.y)/radc^2)
   Bot: ellipsearc(diamc,diamc*cs,a,pi_-a,rp_ang,cw, thick linethick/3) \
     with .C at B } \
 else {
   Bot: rotellipse(diamc,diamc*cs,thick linethick/3) with .c at B } }
 rpoint_(from Start to End)
`$6']')
                               `Arrow3D(xdispl,ydispl,zdispl,
                                        diam,arrowwid,arrowht)'
define(`Arrow3D',`[ diam_Ar = ifelse(`$4',,linewid/10,`$4')
 wid_Ar = ifelse(`$5',,diam_Ar*2,`$5')
 ht_Ar = ifelse(`$6',,wid_Ar*2,`$6')
 x_Ar = ifelse(`$1',,1,`$1')
 y_Ar = ifelse(`$2',,1,`$2')
 z_Ar = ifelse(`$3',,1,`$3')
 define(`M4Arrow3D',`x_Ar,y_Ar,z_Ar')dnl
 len_Ar = length3D(M4Arrow3D)
 len_Shaft = len_Ar - ht_Ar
 cs_Ar = dot3D(View3D,M4Arrow3D)
 if cs_Ar >= 0 then {
   Shaft: cylinder3D(sprod3D(len_Shaft/len_Ar,M4Arrow3D),diam_Ar)
   Head: cone3D(sprod3D(ht_Ar/len_Ar,M4Arrow3D),wid_Ar) \
     with .Start at Shaft.End } \
 else {
   Head: cone3D(sprod3D(ht_Ar/len_Ar,M4Arrow3D),wid_Ar)
   Shaft: cylinder3D(sprod3D(len_Shaft/len_Ar,M4Arrow3D),diam_Ar) \
     with .End at Head.Start }
 Start: Shaft.Start; End: Head.End
 `$7']')

define(`f2xyz3D',``$1'x = `$2'
`$1'y = `$3'
`$1'z = `$4' ')

                           `prism3D(xdispl,ydispl,zdispl,wid,ht,rotation (rad))'
define(`prism3D',`[ Start: (0,0)
 xdispl = ifelse(`$1',,linewid,`$1')
 ydispl = ifelse(`$2',,linewid,`$2')
 zdispl = ifelse(`$3',,linewid,`$3')
 widp = ifelse(`$4',,(linewid/5),`$4')
 htp = ifelse(`$5',,(linewid/10),`$5')
 rotp = ifelse(`$6',,0,`$6')
 End: (project(xdispl,ydispl,zdispl)); C: 0.5 between Start and End
 lenp = length3D(xdispl,ydispl,zdispl)
 az = atan2(ydispl,xdispl); ae = atan2(zdispl,sqrt(xdispl^2+ydispl^2))
 wp2 = widp/2; hp2 = htp/2
#                           corners
 f2xyz3D(nwB,rot3Dz(az,rot3Dy(-ae,rot3Dx(rotp,   0,-wp2, hp2))))
 f2xyz3D(swB,rot3Dz(az,rot3Dy(-ae,rot3Dx(rotp,   0,-wp2,-hp2))))
 f2xyz3D(seB,rot3Dz(az,rot3Dy(-ae,rot3Dx(rotp,   0, wp2,-hp2))))
 f2xyz3D(neB,rot3Dz(az,rot3Dy(-ae,rot3Dx(rotp,   0, wp2, hp2))))
 f2xyz3D(nwF,rot3Dz(az,rot3Dy(-ae,rot3Dx(rotp,lenp,-wp2, hp2))))
 f2xyz3D(swF,rot3Dz(az,rot3Dy(-ae,rot3Dx(rotp,lenp,-wp2,-hp2))))
 f2xyz3D(seF,rot3Dz(az,rot3Dy(-ae,rot3Dx(rotp,lenp, wp2,-hp2))))
 f2xyz3D(neF,rot3Dz(az,rot3Dy(-ae,rot3Dx(rotp,lenp, wp2, hp2))))
#                           facets
 M4Facet3D(neF,nwF,swF,seF)
 M4Facet3D(neB,seB,swB,nwB)
 M4Facet3D(neF,seF,seB,neB)
 M4Facet3D(neF,neB,nwB,nwF)
 M4Facet3D(seF,swF,swB,seB)
 M4Facet3D(nwF,nwB,swB,swF)
`$7']')

define(`M4Facet3D',`
define(`PFacet',`cross3D(diff3D(`$2'x,`$2'y,`$2'z,`$1'x,`$1'y,`$1'z),
                         diff3D(`$3'x,`$3'y,`$3'z,`$2'x,`$2'y,`$2'z))')
  if dot3D(View3D,PFacet) > 0 then {
    fFacet = sqrta(dot3D(Light3D,PFacet)/length3D(PFacet))
    P1: (project(`$1'x,`$1'y,`$1'z))
    P2: (project(`$2'x,`$2'y,`$2'z))
    P3: (project(`$3'x,`$3'y,`$3'z))
    P4: (project(`$4'x,`$4'y,`$4'z))
    line fill_(fFacet) invis from P1 to P2 then to P3 then to P4 then to P1
    line from P1 to P2; round
    line to P3; round
    line to P4; round
    line to P1; round } ')

#####################################################
divert(0)dnl

azimuth = 60
elev = 10
setview(azimuth,elev)
[ Orig: (0,0)
 setlight
 Arrow3D(1,0,0) with .Start at Orig; move left 12bp__ from last [].End "x"
 Arrow3D(0,1,0) with .Start at Orig; "y" ljust at last [].End
 Arrow3D(0,0,1.2) with .Start at Orig; "z" above at last [].End
 setlight(0,0,0)
 cylinder3D(1,1,1,0.6) with .Start at (project(0.5,0.5,0.5))
]
 Ball: shadedball(0.5) with .nw at last [].ne+(-0.25,0)
[
 setview(45,10)
 setlight(40,70)
 n = 9; len = 1.5; thmin = m4azim+pi_/2*0.8; thmax = thmin+twopi_
 for i=0 to n do {
  r = i/n*(thmax-thmin)+thmin
  prism3D(rot3Dz(r,rot3Dy(pi_/4,len,0,0)),0.2,0.1) \
    with .Start at (project(rot3Dz(r,rot3Dy(pi_/4,len*0.5,0,0)))) }
] with .nw at last [].ne
[
 setlight(0,0)
 movewid = 0.1
 len = 1.5; ni = 5; nj = 5
 for i=1 to ni-1 do {
  {for j = 0 to nj by 2 do {
    setview(0,i/ni*180-90,j/nj*90)
    cylinder3D(0,0,len*(j+1)/(nj+1),0.4)
    if j < nj then {move right} } }
 if i < ni then {move down 0.85; right_} } #else { move down movewid } }
] with .nw at 1st [].sw+(0,-0.1)
[
 setlight(0,0)
 len = 1.5; ni = 4; nj = 6
 for i=1 to ni do {
  {for j = 0 to nj by 2 do {
    setview(0,i/ni*180-90,j/nj*90)
    cone3D(0,0,len*(j+1)/(nj+1),0.4)
    if i==2 && j==(nj-2) then { move up_ 0.2 right_ -0.4 } \
    else { if j < nj then {move right_ 0.1}} } }
 if i < ni then {move down_ 0.75; right_} }
] with .nw at last [].ne+(0.2,0)
.PE
