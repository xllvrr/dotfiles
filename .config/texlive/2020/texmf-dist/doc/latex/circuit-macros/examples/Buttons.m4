.PS
# Buttons.m4
gen_init
NeedDpicTools

divert(-1)
#################################################################

                               `RoundButton(diameter,hue,linedensity)
                                hue 0=red, 60=yellow, 120=green ...'
define(`RoundButton',`[
#                               Colors and radius:
  hue = ifelse(`$2',,60,`$2')
  crad = ifelse(`$1',,circlerad,(`$1')/2)
  linedensity = ifelse(`$3',,150/scale,`$3')  # default 150 lines per inch
  hsvtorgb(hue,   1,  1, r1,g1,b1)
  hsvtorgb(hue-5, 1,0.9, r2,g2,b2)
  hsvtorgb(hue-10,1,0.5, r3,g3,b3)
#                               Shaded main disk
  define RBbackground {
    circle rad crad*($`'1) thick lthk at C outlined rgbstring($`'2,$`'3,$`'4)
    }
  C: circle invis rad crad at (0,0)
  nsteps = round_(crad*linedensity)
  lthk = crad/nsteps/(1bp__)
  ShadeObject(RBbackground,nsteps,
    0,   r1,g1,b1,
    0.2, r1,g1,b1,
    0.8, r2,g2,b2,
    1,   r3,g3,b3) at C
#                               Highlight disk with arc shading
  rad1 = crad*3/4
  C1: C.n-(0,rad1+0.02*crad)
  C2: C1+(0,2*rad1)
  lthk = 2*rad1/nsteps/(1bp__)
  define RBoverlay {
    radx = rad1 + ($`'1)*2*rad1
    if $`'1 < 1 then {
      arc cw rad radx thick lthk outlined rgbstring($`'2,$`'3,$`'4) \
        from Cintersect(C2,radx,C1,rad1) \
          to Cintersect(C2,radx,C1,rad1,R) \
        with .c at C2
      } }
  nsteps = round_(rad1*2*linedensity)
  ShadeObject(RBoverlay,nsteps,
    0,   1, 1, 1,
    0.1, 1, 1, 1,
    0.33,(r1+r2)/2,(g1+g2)/2,(b1+b2)/2,
    0.67,r1,g1,b1,
    1,  (r1+r2)/2,(g1+g2)/2,(b1+b2)/2) with .c at C1
  `$4']')

#################################################################

                               `BoxButton(wid,height,hue,linedensity)
                                hue 0=red, 60=yellow, 120=green ...'
define(`BoxButton',`[
#                               Size and Color
  boxw = ifelse(`$1',,boxwid*4/3,`$1')
  boxh = ifelse(`$2',,boxw/4,`$2')
  hue = ifelse(`$3',,180,`$3')
  hsvtorgb(hue,   1,  1, r1,g1,b1)
  hsvtorgb(hue-5, 1,0.9, r2,g2,b2)
  hsvtorgb(hue-10,1,0.5, r3,g3,b3)
#                               Peripheral shading
  linedensity = ifelse(`$4',,150/scale,`$4')
  nsteps=10
  define BxBshadow {
    box ht boxh wid boxw rad boxh/2 \
      outlined rgbstring($`'2,$`'3,$`'4) at (0,($`'1)*4*linethick bp__)
    }
  Q: ShadeObject(BxBshadow,nsteps,
    0, 1,1,1,
    1, r3,g3,b3)
#                               Shaded body
  lthk = boxh/nsteps/(1bp__)
  define BxBshade {
    v = boxh*(1-($`'1))
    h = (boxw-boxh)/2+sqrt((boxh/2)^2-(v-boxh/2)^2)
    line from (-h,v) to (h,v) thick lthk outlined rgbstring($`'2,$`'3,$`'4)
    }
  nsteps = boxh*linedensity
  C: ShadeObject(BxBshade,nsteps,
    0,   r1, g1, b1,
    0.45,r2, g2, b2,
    1,   r3, g3, b3) with .n at Q.n
#                               Shaded highlight
  bh = boxh*0.4
  bw = boxw*4/4.5
  define BxBhighlight {
    v = bh*(1-($`'1)); h = (bw-bh)/2+sqrt((bh/2)^2-(v-bh/2)^2)
    line from (-h,v) to (h,v) thick lthk outlined rgbstring($`'2,$`'3,$`'4)
    }
  nsteps = bh*linedensity
  ShadeObject(BxBhighlight,nsteps,
    0,1,1,1,
    8/nsteps,1,1,1,
    1, r2,g2,b2) with .n at Q.n+(0,-boxh/20)
  `$5']')

#################################################################
divert(0)dnl

for x=0 to 5 do {
  B: RoundButton(0.6,x*60) at (x,0)
  "Button" sprintf("%g",x+1) at B }

[ for i=0 to 2 do {
    BoxButton(1.5,,180+120*i) at (i*2,0)
    "Button" at last [].C
    }
 ] with .nw at 1st [].sw+(0,-0.5)

.PE
