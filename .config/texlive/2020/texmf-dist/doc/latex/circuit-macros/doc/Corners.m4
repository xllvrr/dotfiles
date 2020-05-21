.PS
# `Corners.m4'
cct_init
s_init(Corners)
sinclude(Circuit_macros.dim)

linethick = 4
[
  [ [ line up 0.2
    line from Here+(0.2,0) left 0.2 ]
    s_box(`\tt\shortstack[l]{line up 0.2\\ line right 0.2}') \
      with .n at last [].s +(0,-0.1)
    ]
  
  [ [ line up 0.2 then right 0.2 ]
    s_box(`\tt\shortstack[l]{line up 0.2 \bsl\\ \enskip then right 0.2}') \
      with .n at last [].s +(0,-0.1)
    ] with .nw at last [].ne+(0.25,0)
  
  [ [ line up 0.2 
    line right 0.2 chop -hlth chop 0 ]
    s_box(`\tt\shortstack[l]{%
      line up 0.2\\ line right 0.2 \bsl\\ \enskip chop `-hlth' chop 0}') \
      with .n at last [].s +(0,-0.1)
    ] with .nw at last [].ne+(0.25,0)

  [ [ line up 0.2
    round
    line right 0.2 ]
    s_box(`\tt\shortstack[l]{%
      line up 0.2\\`\smash{round}\vphantom{r}'\\ line right 0.2}') \
      with .n at last [].s +(0,-0.1)
    ] with .nw at last [].ne+(0.25,0)
  ]

[
  [ [ line up 0.15 left 0.15
    corner
    line up 0.1 right 0.1 ]
    s_box(`\tt\shortstack[l]{%
      line up 0.15 left 0.15\\`corner'\\ line up 0.1 right 0.1}') \
      with .n at last [].s +(0,-0.1)
    ]
  
  [ [ A: Here
    corner(,at A)
    s_box(`\sl A') at A below ]
    s_box(`\tt c`'orner(,at A)') with .n at last [].s +(0,-0.1)
    ] with .nw at last [].ne+(0.2,0)
  
  [ [ L: line right 0.2 down 0.3 outlined "lightgray"
    M: line up 0.2 right 0.1 outlined "lightgray"
    s_box(\sl L) at L.c+(-0.1,-0.05)
    s_box(\sl M) at M.c+( 0.13,0)
    Mitre_(L,M,5 bp__) ]
    s_box(`\tt Mitre\_(L,M,5 bp\_\_)') with .n at last [].s +(0,-0.1)
    ] with .nw at last [].ne+(0.2,0)

  [ [ A: (0,0)
    B: (0.3,0.2)
    C: (0.5,0.1)
      line outlined "lightgray" from A to B
      line outlined "lightgray" from C to B
    s_box(\sl A) at A rjust
    s_box(\sl B) at B+(0,2pt__) above
    s_box(\sl C) at C ljust
    mitre_(A,B,C) ]
    s_box(\tt mitre\_(A,B,C)) with .n at last [].s +(0,-0.1)
    ] with .nw at last [].ne+(0.2,0)

  ] with .nw at last [].sw+(0,-0.1)

.PE
