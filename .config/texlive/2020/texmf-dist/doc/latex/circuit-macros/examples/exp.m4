.PS
# exp.m4
threeD_init
NeedDpicTools

# Graduated shading is probably best done using the built-in functions
# of PSTricks or the somewhat equivalent tikz capabilities. Other
# postprocessors do not have the same functionality so the following
# demonstrates how it can be done in the pic language with m4 macros.
# See the macro `PhadedPolygon' in libgen.m4

# Projected box object:
[
g = 1.2
define(`axlen',1.2*g)
define(`O3',`0,0,0')
define(`X0',`axlen,0,0')
define(`Y0',`0,axlen,0')
define(`Z0',`0,0,axlen')

# diagram viewing angle
dazim = 54
delev = 15
setview(dazim,delev)

# projection azimuth, elevation
pazim = 20*dtor_
pelev = 35*dtor_
arad = 0.6*g

# object displacement
define(`D3',`0.3*g,0.6*g,0.9*g')

# fixed coordinate frame
O: project(O3)
X: project(X0)
Y: project(Y0)
 Fector(X0,Z0) with .Origin at O ; "$x_0$" at X rjust
 Fector(Y0,Z0) with .Origin at O ; "$y_0$" at Y ljust below
 Fector(Z0,Y0) with .Origin at O ; "`$z_0$'" at project(Z0) above

define(`R01',`rot3Dz(pazim,rot3Dy(-pelev,$1,$2,$3))')
define(`R10',`rot3Dy(pelev,rot3Dz(-pazim,$1,$2,$3))')

thinlines_ ; psset_(linecolor=gray)
  line from O to project(rot3Dz(pazim,axlen,0,0))
psset_(linecolor=black)
  arc -> ccw from project(arad,0,0) to project(rot3Dz(pazim,arad,0,0)) rad arad
    "$\theta$" below
  up_
  arc -> cw from project(rot3Dz(pazim,arad,0,0)) \
    to project(R01(arad,0,0)) rad arad
    "$\phi$" rjust at project(rot3Dz(pazim,rot3Dy(-pelev/2,arad,0,0)))
  arc -> from project(0,arad,0) to project(R01(0,arad,0)) rad arad
    "$\theta$" above
  right_
  arc -> cw from project(0,0,arad/2) to project(R01(0,0,arad/2)) rad arad/2
    "$\phi$" ljust at Here+(-1pt__,-3pt__)

 Fector(R01(X0),R01(Z0)) with .Origin at O ;
    "$x_1$" above rjust at project(R01(X0))
 Fector(R01(Y0),R01(Z0)) with .Origin at O ;
    "$y_1$" ljust at project(R01(Y0))
 Fector(R01(Z0),R01(Y0)) with .Origin at O ;
    "$z_1$" above at project(R01(Z0))
thicklines_

# box object dimension
b = 0.6*g
d = 0.4*g
h = 0.20*g

# box object corners
define(`B0',`D3')
define(`B1',`sum3D(D3,d,0,0)') PB1: project(B1)
define(`B2',`sum3D(D3,d,b,0)') PB2: project(B2)
define(`B3',`sum3D(D3,0,b,0)') PB3: project(B3)
define(`B4',`sum3D(D3,0,0,h)') PB4: project(B4)
define(`B5',`sum3D(D3,d,0,h)') PB5: project(B5)
define(`B6',`sum3D(D3,d,b,h)') PB6: project(B6)
define(`B7',`sum3D(D3,0,b,h)') PB7: project(B7)

# projected corners
P0:project(R01(0,dcosine3D(2,R10(B0)),dcosine3D(3,R10(B0))))
P1:project(R01(0,dcosine3D(2,R10(B1)),dcosine3D(3,R10(B1))))
P2:project(R01(0,dcosine3D(2,R10(B2)),dcosine3D(3,R10(B2))))
P3:project(R01(0,dcosine3D(2,R10(B3)),dcosine3D(3,R10(B3))))
P4:project(R01(0,dcosine3D(2,R10(B4)),dcosine3D(3,R10(B4))))
P5:project(R01(0,dcosine3D(2,R10(B5)),dcosine3D(3,R10(B5))))
P6:project(R01(0,dcosine3D(2,R10(B6)),dcosine3D(3,R10(B6))))
P7:project(R01(0,dcosine3D(2,R10(B7)),dcosine3D(3,R10(B7))))
thinlines_
  line from PB1 to P1
  line from PB2 to P2
  line from PB7 to P7
  line from PB4 to P4
thicklines_

# draw the object
  ifdpic(`line invis fill_(1) from PB4 to PB7 to PB6 to PB5
    line from PB4 to PB7; line to PB6; line to PB5 ; line to PB4
    line invis fill_(0.5) from PB5 to PB6 to PB2 to PB1
    line from PB5 to PB6; line to PB2; line to PB1 ; line to PB5
    line invis fill_(0.85) from PB6 to PB7 to PB3 to PB2
    line from PB6 to PB7; line to PB3; line to PB2 ; line to PB6',
   `gshade(1,PB4,PB7,PB6,PB5,PB4,PB7)
    gshade(0.5,PB5,PB6,PB2,PB1,PB5,PB6)
    gshade(0.85,PB6,PB7,PB3,PB2,PB6,PB7)')
  line from PB4 to PB5 to PB1 to PB2 to PB3 to PB7 to PB4
  line from PB5 to PB6 to PB7
  line from PB6 to PB2

  arrow from O to PB1 chop linethick pt__; "$X$" rjust

  line from P4 to P5 to P1 to P2 to P3 to P7 to P4
  line from P5 to P6 to P7
  line from P6 to P2
  line dashed from P4 to P0 to P3
  line dashed from P0 to P1
  ]

# Globe:
[
                               # Set small text size
  iflatex(`textoffset = 1bp__; ifpsfrag(`textht = 9.5bp__',
          `latexcommand({\small)') ')

  azimuth = 15                     # View angles in degrees
  elevation = 35
  setview(azimuth,elevation)

  rectwid = 3.5                    # Basic dimensions
  rectht = 2.4
  alpha = rectht/3

#                                   # Rectangle
  NW: project(-rectht/2,-rectwid*0.25,0)
  SW: project( rectht/2,-rectwid*0.25,0)
  SE: project( rectht/2, rectwid*0.75,0)
  NE: project(-rectht/2, rectwid*0.75,0)

  ShadedPolygon(NW:NE:SE:SW,,-90,
    0,0.25,0.25,0.25,
    1,1,1,1) with .Start at NW

  define(`C3D',`0,0,alpha')        # Centre of the sphere
  C: project(C3D)

#                                   # Shaded sphere using PSTricks or tikz:
#                                   # this is black magic but PSTricks
#                                   # seems to give more control
#  ifpstricks(
#   `Highlight: \
#      project(sum3D(C3D,rot3Dz(-15*dtor_,rot3Dy(-60*dtor_,alpha,0,0))))
#    command "\pscustom[fillstyle=gradient,gradmidpoint=0.0,%"
#    command sprintf("gradbegin=gray,gradend=white,gradlines=%g,%%",alpha*200)
#    command "GradientCircle=true,GradientScale=1.5,%"
#    command sprintf("GradientPos={(%g,%g)}]{",Highlight.x,Highlight.y)
#     circle rad alpha at C
#     command "}%"',
#
#  `ifpgf(                          # A little too dark with tikz-pgf, maybe:
#   `command sprintf(\
#      "\dpicdraw[ball color=white](%g,%g) circle (%gin)\dpicstop",\
#       C.x,C.y,alpha/2.54)',
#
#   `circle rad alpha at C fill_(1) ')')

                                   # Shaded sphere with pic shading:
  shadedball(alpha) at C

  S: 0,0                           # The sphere bottom touch point
  "$S$" at S+(0,-2pt__) rjust
  "$\alpha$" at 0.5<S,C> ljust

  define(`N3D',`0,0,2*alpha')      # North pole
  N: project(N3D)
  "$N$" at N+(0,3pt__) ljust

  phi = 65*dtor_
  define(`Phat3D',`rot3Dz(phi,alpha*3,0,0)')
  Phat: "$\hat{P}$" at project(Phat3D) ljust

  X: project(rectht/2*0.8,0,0)
  Y: project(0,rectwid/2*0.8,0)

`define' linevis { # ratio         # Visibility function for lines fom S to Tmp
  Tlv: $1 between S and Tmp
  $2 = distance(Tlv,C)-alpha }

`define' invisline { # name        # Draw dashed invisible part of line in
  Tmp: $1                          # the plane
  findroot(linevis, 0, 1, 1e-8, x)
  line dashed from S to x between S and Tmp chop 0 chop 0.05 }

thinlines_                         # axes
  invisline(X)
  arrow to X chop 0.05 chop 0; "$x$" below
  invisline(Y)
  arrow to Y chop 0.05 chop 0; "$y$" ljust
  line dashed from S to N chop 0 chop 0.05
  arrow up alpha*0.5 chop 0.05 chop 0 ; "$z$" above
  invisline(Phat)
  line to Phat chop 0.05 chop 0
  arc ccw -> rad alpha from project(alpha/2,0,0) to \
                  project(rot3Dz(phi,alpha/2,0,0))
  "$\phi$" below at 0.5 between last arc.start and last arc.end

                                   # vector (ratio along (N to Phat))
define(`ray',`sum3D(N3D,sprod3D($1,diff3D(Phat3D,N3D)))')
`define' rayvis { # ratio
  $2 = length3D(diff3D(ray($1),C3D))-alpha }

  findroot(rayvis, 1e-3, 1, 1e-8, p)  # Find P
  P: "$P$" at project(ray(p)) ljust above

thicklines_
  line dashed from N to P chop 0 chop 0.05
  line to Phat chop 0.05 chop 0

define(`meridian',`rot3Dz(phi,rot3Dy(-($1),alpha,0,0))')
`define' meridianvis { # angle     # Visibility function on the meridian
  $2 = dot3D(meridian($1),View3D) }

thinlines_                         # Draw the meridian
  findroot(meridianvis, 0, pi_, 1e-8, y)
  n = 0
  for ang = y-pi_ to y by pi_/20 do {
    Q[n]: project(sum3D(C3D,meridian(ang))); n+=1 }
  fitcurve(Q,n-1)
  n = 0
  for ang = y to y+pi_ by pi_/20 do {
    Q[n]: project(sum3D(C3D,meridian(ang))); n+=1 }
  fitcurve(Q,n-1,dashed)

define(`equator',`rot3Dz($1,alpha,0,0)')
`define' equatorvis { # angle      # Visibility function on the equator
  $2 = dot3D(View3D,equator($1)) }

  findroot(equatorvis, 0, pi_, 1e-8, y)
  n = 0
  for ang = y-pi_ to y by pi_/20 do {
    Q[n]: project(sum3D(C3D,equator(ang))); n+=1 }
  fitcurve(Q,n-1)
  n = 0
  for ang = y to y+pi_ by pi_/20 do {
    Q[n]: project(sum3D(C3D,equator(ang))); n+=1 }
  fitcurve(Q,n-1,dashed)

  line dashed from C to P          # beta
  line dashed from C to project(sum3D(C3D,equator(phi)))
  arc ccw -> from 0.6 along_(last line) to 0.6 between C and P
  "$\beta$" ljust at last arc.e+(0,2pt__)

  iflatex(ifpsfrag(,`latexcommand(})'))
  ] with .w at last [].e+(0.5,0)

.PE
