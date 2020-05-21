.PS
# OpAmpFilter.m4
cct_init
command "{\small\sf"

divert(-1)
divert(0)dnl

  define(`SpecOpAmp',`$1: [ right_
    lwtmp = linewid; linewid = 1*scale
  H: opamp
    "$2" at H.In1 below rjust
    "$3" at H.In2 below rjust
    "$4" at H.E below ljust
    "V${-}$" at H.E1 below
    line up_ dimen_/3 from H.E1 "4" rjust; dot(,,1) 
    "$\hbox{V}_{\hbox{CC}}$" above rjust at last [].n
    "V${+}$" at H.E2 above
    line down_ dimen_/3 from H.E2 "11" ljust; dot(,,1)
    "${-}\hbox{V}_{\hbox{CC}}$" below ljust at last [].s
    linewid = lwtmp
    ifelse($1,U1,,`line left_ jog from H.In2 then down_ jog/2; zground ')
    "$1" at H.S below ljust
  In1: H.In1; In2: H.In2; Out: H.Out
  D: dot(at Out)
  V: circle diam 12bp__ "V" at Out+(dimen_/3,dimen_/3)
    "V$_{\hbox{\scriptsize $5}}$" at V.n above
    open_arrow(from V to D chop last circle.rad chop dotrad_) ] ')
  define(`zground',`ground(`$1',,S); "0" at Here+(dimen_/6,-dimen_/2)')

    cscale = 3/2 
    linewid = linewid*cscale
    jog = dimen_*0.3
    vstep = dimen_*5/4
    SpecOpAmp(U1,2,3,1,hp)
  R1: resistor(right_ elen_*3/4 from U1.Out); llabel(,"R1"); rlabel(,"1`\,'k")
    dot; line right_ jog 
    SpecOpAmp(U2,5,6,7,bp) with .In1 at Here
  R2: resistor(right_ elen_*3/4 from U2.Out); llabel(,"R2"); rlabel(,"1`\,'k")
    dot; line right_ jog 
    SpecOpAmp(U3,9,10,8,lp) with .In1 at Here
    SpecOpAmp(U4,13,12,14,n) with .Out at U3.Out+(0,-dimen_*3.0)
    line up vstep from U4.Out
  Rf: resistor(left_); rlabel(,R_f); llabel(,"1`\,'k")
    line to (U4.In1,Here)-(jog,0) then to U4.In1-(jog,0); dot
    line from U3.Out down_ vstep then left_ jog
  RL: resistor; rlabel(,RL); llabel(,"100")
    line to (U4.In1-(2*jog,0),Here) then to U4.In1-(2*jog,0); dot
    line from U1.Out to (U1.Out,Here); right_
  R42: resistor(to U4.In1); llabel(,"R42"); rlabel(,"1`\,'k")
    line from U2.Out down_ vstep
  R41: resistor(left_ to (U1.In2-(jog,0),Here))
    llabel(,"2.2`\,'k"); rlabel(,"R41")
    line to (Here,U1.In2); dot; { line to U1.In2 }
    line left_ jog; dot
    { resistor(down_ elen_); rlabel(,"R0" rjust "10`\,'k"); zground }
  R3: resistor(left_ dimen_); rlabel(,"R3","in"); llabel(,"1`\,'k")
    source(down_ elen_,AC); llabel("V$_{\hbox{\scriptsize in}\;}$"); zground
    line up_ vstep from U1.Out
  R5: resistor(left_ to (U1.In1-(jog,0),Here)); rlabel(,"R6\enskip 10`\,'k")
    dot
    line from U1.In1 left_ jog then to Here+(0,dimen_/2)
    resistor(right_ to (U3.Out,Here)); llabel(,"R5"); rlabel(,"1`\,'k")
    line to U3.Out; dot(at Here+(0,vstep))
    capacitor(left_ to (U3.In1-(jog,0),Here)); rlabel(,"C2\enskip 100`\,'n")
    line to (Here,U3.In1)
    line from U2.Out up_ vstep
    capacitor(left_ to (U2.In1-(jog,0),Here)); rlabel(,"C1\enskip 100`\,'n")
    line to (Here,U2.In1)

command "}%"
.PE
