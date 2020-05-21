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
                                Fbox("$x < 1$",,
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
