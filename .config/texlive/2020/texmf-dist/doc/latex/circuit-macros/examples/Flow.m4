.PS
# Flow.m4
gen_init
ifdef(`FlowchartDefs_',,`include(FlowchartDefs.m4)')

# Could use xcolor with option dvipsnames but define color here for portability:
define(`Thistle',`rgbstring(0.85,0.75,0.85)')dnl
define(`RubineRed',`rgbstring(0.81,0,0.35)')dnl
define(`YellowGreen',`rgbstring(0.68,1,0.18)')dnl
define(`SeaGreen',`rgbstring(0.13,0.70,0.67)')dnl
define(`Goldenrod',`rgbstring(0.85,0.65,0.13)')dnl

  linethick_(1.0)
  arrowwid = 0.05
  arrowht = 0.1
  fillval = 0.8
  down

Case: Fcase(,
  "Test 1",[Fbox("Task 1",, shaded Thistle); W:last [].W; N:last [].N
            arrow down linewid/3 from last [].S
            Fbox("Task 1.5",, shaded Thistle) with .N at Here
            E:last [].E; S:last [].S],
  "Test 2",Fbox("Task 2" "is bigger", wid fboxwid*1.2 ht fboxht*3/2, \
                shaded SeaGreen),
  "Test 3",Fbox("Task 3",, shaded RubineRed)dnl
  )

   "\sl .N" at Case.N rjust above; "\sl .S" at Case.S rjust below
   "\sl .E" at Case.E ljust; "\sl .W" at Case.W rjust
   "\sl Case statement" below at Case.s+(0,-0.2)
   move to Case.nw+(-12bp__,10bp__)

Whiledo: Fwhiledo("$i < n$",,,Fbox("Task"),"T" above ljust at Test.E) \
  with .nw at Case.ne+(0.25,0)

  "\sl .N" at Whiledo.N rjust; "\sl .S" at Whiledo.S rjust below
  "\sl .E" at Whiledo.E ljust; "\sl .W" at Whiledo.W rjust
  "\sl While-do" below at Whiledo.s+(0,-0.2)

Repeatuntil: Frepeatuntil("$n \geq 5$",,,Fbox("Task"),
   "T" at Test.E above ljust) with .nw at Whiledo.sw + (0.25,-1)

  "\sl .N" at Repeatuntil.N rjust above; "\sl .S" at Repeatuntil.S rjust below
  "\sl .E" at Repeatuntil.E ljust; "\sl .W" at Repeatuntil.W rjust
  "\sl Repeat-until" below at Repeatuntil.s+(0,-0.2)

Ifthenelse: Fifthenelse("$A<B$",,,
     Fbox("False"),
     Fbox("True",ht fboxht*1.2 wid fboxwid)dnl
     ) with .nw at Repeatuntil.sw +(0.5,-0.5)

  "\sl .N" at Ifthenelse.N rjust above; "\sl .S" at Ifthenelse.S below rjust
  "\sl .E" at Ifthenelse.E ljust; "\sl .W" at Ifthenelse.W rjust
  "\sl If-then-else" below at Ifthenelse.s+(0,-0.3) \
  "\sl (the True and False tasks are optional)"

# Compound statement:
[ right 
  ellipse shaded YellowGreen "Start"
  arrow right linewid/2

  Fbox("First task") with .W at Here
  arrow down linewid/2 from last [].S

  Fifthenelse("Test 1",,,
    Frepeatuntil("$i \geq 5$",,shaded Goldenrod,Fbox("Task")),
    Fifthenelse("$A < B$",,shaded Goldenrod,
      Fbox("Left"),
      Fbox("Right"),
    "T" at Test.E above ljust),
    "T" at Test.E above ljust) with .N at Here

  A: arrow down 0.25 from last [].S ] with .nw at Case.sw + (-12bp__,-0.7)

  "\sl Compound statement" below at last [].A.end

Example: [ fillvalue = 0.8; awid = linewid/2; right_
  Start: ellipse wid boxwid/2 ht boxwid/3 shaded "green"
  arrow right_ awid
  B1: Fbox("Planejamento")
  B2: Fbox(`"Execu\c{c}\~ao"') with .W at B1.E+(awid*3,0)
  B3: Fbox(`"Sele\c{c}\~ao"') with .W at B2.E+(awid*3,0)
  LT: Ftest(`"Avalia\c{c}\~ao do" "Planejamento"',
    wid fboxwid*1.5 ht fboxht*2.0,
    shaded YellowGreen,
    "Correto" at Box.e above ljust;
    "Incompleto" at Box.w above rjust) with .S at 0.5 between B1.ne and B2.nw
  arrow from B1.E to (LT.S,B1.E) then to LT.S
  arrow from LT.W to (B1.N,LT.W) then to B1.N
  arrow from LT.E to (B2.N,LT.E) then to B2.N
  RT: Ftest(`"Avalia\c{c}\~ao da" "Execu\c{c}\~ao"',
    wid fboxwid*1.5 ht fboxht*2.0,
    shaded YellowGreen,
    "Correto" at Box.e below ljust;
    "Incompleto" at Box.w below rjust) with .N at 0.5 between B2.se and B3.sw
  arrow from B2.E to (RT.N,B2.E) then to RT.N
  arrow from RT.W to (B2.S,RT.W) then to B2.S
  arrow from RT.E to (B3.S,RT.E) then to B3.S
  B4: Fbox(`"Extra\c{c}\~ao"') with .S at B3.N+(0,awid)
  arrow from B3.N to B4.S
  arrow right_ awid from B4.E
  B5: Fbox(`"Conclus\~ao"')
  ellipse wid boxwid/2 ht boxwid/3 shaded "red" at (B5.S,Start)
  arrow down_ awid from B5.S to last ellipse.n
] with .nw at last [].sw+(0,-fboxht)

.PE
