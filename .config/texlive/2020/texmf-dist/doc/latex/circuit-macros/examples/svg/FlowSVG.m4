divert(-1)
  FlowchartDefs.m4
                                `Some experimental flow-chart macros.  
                                In the following, every subchart is in
                                [] brackets, with .N, .S, .E and .W
                                internally defined.  Follow this convention
                                if you create compound constructs.

                                Generally, the first argument is one
                                or more strings; the second adjusts
                                the size, and the third can be used
                                to add color, dashed lines, labels,
                                or other embellishements.  Default is
                                grey fill if arg3 is blank.

                                These macros have been renamed from earlier
                                versions because of slight differences of
                                arguments.'

define(`FlowchartDefs_')

                                `Default sizes:'
define(`fboxwid',linewid*2)
define(`fboxht',linewid*0.75)
define(`farrowht',linewid*0.5)

                                `Fbox( "text", wid expr ht expr,
                                attributes ) The basic task box: arg1 may
                                be 1 or more label strings. Attributes
                                include box line and fill specs.
                                To adjust the box size to the size of
                                the typeset text, see the \boxdims macro
                                in the manual. Example:
                                Fbox("svg_it(x svg_symbol(&`#'60;) 1)",,
                                     shaded rgbstring(0.46,0.53,0.63))'
define(`Fbox',`[ boxwid = fboxwid; boxht = fboxht
 Box: box `$2' ifelse(`$3',,`fill_(fillval)',`$3') `$1'
  N: Box.n; S:Box.s; E:Box.e; W: Box.w
 `$4']')

                                `If-then
                                Ftest( "text", wid expr ht expr, attributes )'
define(`Ftest',`[boxwid = fboxwid*0.8; boxht = fboxht*1.4
 Box: box ifelse(`$2',,,`$2') invis
 N: Box.n; S: Box.s; E: Box.e; W: Box.w 
 line from 0.5 between last box.n and last box.e \
  to last box.e then to last box.s then to last box.w then to last box.n \
  then to 0.5 between last box.n and last box.e \
  ifelse(`$3',,`fill_(fillval)',`$3')
  ifelse(`$1',,,`$1' at Box)
 `$4']')

                                `case statement
             Fcase(wid expr ht expr,
                   "Test string 1",task, ...,
                   "Test string n",task)'
             `arg1 adjusts the size of the tests
              A task is a flow subchart with internal names .E and .S defined
              The test blocks are labeled Test1, Test2, ... and the tasks are
              labeled Task1, Task2, ...  '
define(`Fcase',`[ down; S: Here; sx = S.x
  Fcaseloop_(1,$@)
  ifelse(`$2',,`E:S; W:S; N:S',
   `E:(sx+linewid/2,Task1.E.y); W:Test1.W; N:Test1.N')
  Fcasearrow_(1,$@)
  arrow from E to (E,S) then to S ]')

  define(`Fcaseloop_',`ifelse(`$3',,,
   `Test`$1': Ftest(`$3',`$2') with .N at S
    Task`$1': `$4' with .nw at Test`$1'.E+(linewid/2,min(Test`$1'.ht,fboxht)/2)
      arrow right linewid/4 from Test`$1'.E \
        then down Test`$1'.E.y-Task`$1'.W.y then to Task`$1'.W
    S: (Test`$1'.S.x,min(Test`$1'.S.y,Task`$1'.S.y)-linewid/3)
      ifelse(`$5',,`line',`arrow') from Test`$1'.S to S
      sx = max(sx,Task`$1'.E.x)
      Fcaseloop_(incr($1),`$2',shift(shift(shift(shift($@)))))')')
  define(`Fcasearrow_',`ifelse(`$3',,,
   `arrow from Task`$1'.E to (E,Task`$1'.E)
    Fcasearrow_(incr($1),`$2',shift(shift(shift(shift($@)))))')')
  
                                `while statement with explicit test
                   Fwhiledo("test text", wid x ht y, attributes, task spec )
                   The task structure is given label Task '
define(`Fwhiledo',`[ down
  Test: Ftest(`$1',`$2',`$3')
    arrow right linewid/2 from Test.E
  Task: `$4' with .W at Here
  E: Task.E; W: Test.w; S: Test.S
    arrow up max(linewid/4,Test.n.y-Task.n.y+arrowht*1.5) \
      from Task.N then left Task.x-Test.x
  N: Here
    arrow to Test.n
 `$5']')

                                `repeat statement with explicit test
                         Frepeatuntil("test",wid x ht y,attributes, task spec )
                         The task structure is given label Task '
define(`Frepeatuntil',`[ N: Here
  Task: ifelse(`$4',,Here,`$4' with .N at N)
  W: Task.W
    arrow down linewid/3
  Test: Ftest(`$1',`$2',`$3')
  E: Task.E+(linewid/2+max(0,Test.e.x-Task.e.x),0)
    arrow from Test.e to (E,Test) then to E then to Task.E
  S: Test.S
 `$5']')

                                `if-then-else
                Fifthenelse( "test", wid x ht y, attributes,
                              left tasks, right tasks)
                The left task structure is given label Ltask and the right
                task structure is given label Rtask '
define(`Fifthenelse',`[ Test: Ftest(`$1',`$2',`$3')
  N: Test.N
  Ltask: ifelse(`$4',,`Test.S; W:Test.W; LS:Ltask',
      `$4 with .ne at ((Test.W.x+Test.x)/2,Test.S.y)
    W: Ltask.W; LS:Ltask.S
    arrow from Test.W to (Ltask.N,Test.W) then to Ltask.N')
  Rtask: ifelse(`$5',,`Test.S; E:Test.E; RS:Rtask',
      `$5 with .nw at ((Test.E.x+Test.x)/2,Test.S.y)
    E: Rtask.E; RS: Rtask.S
    arrow from Test.E to (Rtask.N,Test.E) then to Rtask.N')
  S: (Test.x,min(LS.y,RS.y)-linewid/3)
    arrow from LS to (LS,S)
    arrow from RS to (RS,S)
    line to (LS,Here)
  `$6']')

divert(0)dnl
.PS
# Here is a test file exercising the above definitions
gen_init(svg_font(sans-serif,11bp__,2.5bp__))

# Could use xcolor with option dvipsnames but define color here for portability
define(`Thistle',`rgbstring(0.85,0.75,0.85)')dnl
define(`RubineRed',`rgbstring(0.81,0,0.35)')dnl
define(`YellowGreen',`rgbstring(0.68,1,0.18)')dnl
define(`SeaGreen',`rgbstring(0.13,0.70,0.67)')dnl
define(`Goldenrod',`rgbstring(0.85,0.65,0.13)')dnl

# Accented characters
define(`svg_ccedilla',`svg_symbol(&`#'231;)')dnl
define(`svg_atilde',`svg_symbol(&`#'227;)')dnl

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

   "svg_it(.N)" at Case.N rjust above
   "svg_it(.S)" at Case.S rjust below
   "svg_it(.E)" at Case.E ljust
   "svg_it(.W)" at Case.W rjust
   "svg_it(Case statement)" below at Case.s+(0,-0.2)
   move to Case.nw+(-12bp__,10bp__)

Whiledo: Fwhiledo("svg_it(i svg_lt n)",,,Fbox("Task"),
   "T" above ljust at Test.E) \
  with .nw at Case.ne+(0.25,0)

  "svg_it(.N)" at Whiledo.N rjust
  "svg_it(.S)" at Whiledo.S rjust below
  "svg_it(.E)" at Whiledo.E ljust
  "svg_it(.W)" at Whiledo.W rjust
  "svg_it(While-do)" below at Whiledo.s+(0,-0.2)

Repeatuntil: Frepeatuntil("svg_it(n svg_geq 5)",,,Fbox("Task"),
   "T" at Test.E above ljust) with .nw at Whiledo.sw + (0.25,-1)

  "svg_it(.N)" at Repeatuntil.N rjust above
  "svg_it(.S)" at Repeatuntil.S rjust below
  "svg_it(.E)" at Repeatuntil.E ljust
  "svg_it(.W)" at Repeatuntil.W rjust
  "svg_it(Repeat-until)" below at Repeatuntil.s+(0,-0.2)

Ifthenelse: Fifthenelse("svg_it(A`'svg_lt`'B)",,,
     Fbox("False"),
     Fbox("True",ht fboxht*1.2 wid fboxwid)dnl
     ) with .nw at Repeatuntil.sw +(0.5,-0.5)

  "svg_it(.N)" at Ifthenelse.N rjust above;
  "svg_it(.S)" at Ifthenelse.S below rjust
  "svg_it(.E)" at Ifthenelse.E ljust
  "svg_it(.W)" at Ifthenelse.W rjust
  "svg_it(If-then-else)" at Ifthenelse.s+(0,-0.3) \
  "svg_it((the True and False tasks are optional))"

# Compound statement:
[ right 
  ellipse shaded YellowGreen "Start"
  arrow right linewid/2

  Fbox("First task") with .W at Here
  arrow down linewid/2 from last [].S

  Fifthenelse("Test 1",,,
    Frepeatuntil("svg_it(i svg_geq 5)",,shaded Goldenrod,Fbox("Task")),
    Fifthenelse("svg_it(A svg_lt B)",,shaded Goldenrod,
      Fbox("Left"),
      Fbox("Right"),
    "T" at Test.E above ljust),
    "T" at Test.E above ljust) with .N at Here

  A: arrow down 0.25 from last [].S ] with .nw at Case.sw + (-12bp__,-0.7)

  "svg_it(Compound statement)" below at last [].A.end

Example: [ fillvalue = 0.8; awid = linewid/2; right_
  Start: ellipse wid boxwid/2 ht boxwid/3 shaded "green"
  arrow right_ awid
  B1: Fbox("Planejamento")
  B2: Fbox("Execu`'svg_ccedilla`'svg_atilde`'o") \
   with .W at B1.E+(awid*3,0)
  B3: Fbox("Sele`'svg_ccedilla`'svg_atilde`'o") \
   with .W at B2.E+(awid*3,0)
  LT: Ftest("Avalia`'svg_ccedilla`'svg_atilde`'o do" "Planejamento",
    wid fboxwid*1.5 ht fboxht*2.0,
    shaded YellowGreen,
    "Correto" at Box.e above ljust;
    "Incompleto" at Box.w above rjust) with .S at 0.5 between B1.ne and B2.nw
  arrow from B1.E to (LT.S,B1.E) then to LT.S
  arrow from LT.W to (B1.N,LT.W) then to B1.N
  arrow from LT.E to (B2.N,LT.E) then to B2.N
  RT: Ftest("Avalia`'svg_ccedilla`'svg_atilde`'o da" \
    "Execu`'svg_ccedilla`'svg_atilde`'o",
    wid fboxwid*1.5 ht fboxht*2.0,
    shaded YellowGreen,
    "Correto" at Box.e below ljust;
    "Incompleto" at Box.w below rjust) with .N at 0.5 between B2.se and B3.sw
  arrow from B2.E to (RT.N,B2.E) then to RT.N
  arrow from RT.W to (B2.S,RT.W) then to B2.S
  arrow from RT.E to (B3.S,RT.E) then to B3.S
  B4: Fbox("Extra`'svg_ccedilla`'svg_atilde`'o") \
   with .S at B3.N+(0,awid)
  arrow from B3.N to B4.S
  arrow right_ awid from B4.E
  B5: Fbox("Conclus`'svg_atilde`'o")
  ellipse wid boxwid/2 ht boxwid/3 shaded "red" at (B5.S,Start)
  arrow down_ awid from B5.S to last ellipse.n
] with .nw at last [].sw+(0,-fboxht)

 command "</g>" # end font
.PE
