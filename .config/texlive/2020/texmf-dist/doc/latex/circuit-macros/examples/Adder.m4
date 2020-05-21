.PS
# Adder.m4
log_init

del = linewid/4

[                           # full adder using gates
 A: dot; {"\sf A" rjust}; line right
 Xor1: XOR_gate with .In1 at Here
  dy = Xor1.In1.y-Xor1.In2.y
 B: dot(at (A,Xor1.In2)); {"\sf B" rjust}; line to Xor1.In2
  line from Xor1.Out right 2*del+dy
 Xor2: XOR_gate with .In1 at Here

 Co: Autologix(Or(And(X1,X2),And(A,B)),N) with .nw at Xor2.sw+(-del,-del/2)
  line from Co.In1 to (Co.In1,Xor2.In2) then to Xor2.In2
  dot(at (Xor1.Out+(del,0))); line to (Here,Co.In2) then to Co.In2
  dot(at (Xor1.In1-(del,0))); line to (Here,Co.In3) then to Co.In3
  dot(at (Xor1.In2-(del+dy,0))); line to (Here,Co.In4) then to Co.In4
  line right del from Co.Out1; dot; {"\sf Co" ljust }
  dot(at (Here,Xor2.Out)); {"\sf S" ljust}; line to Xor2.Out
 Ci: dot(at (B,(0.5 between Xor2.s and Co.n))); line to (Co.In1,Here); dot
  "\sf Ci" rjust at Ci
 ]

[                           # truth table
  griddim = linewid*0.4
  define(`row',`T: (0,-(`$1')*griddim*0.8)
   Loopover_(`v',`"\sf v" at T; T: T+(griddim,0)', shift($@))')

  [row(0,A,B,Ci,Co,S)]
  line thick 2 color "gray" right 4.5*griddim \
    with .c at last [].c+(0,-griddim/2)

  [row(1,0,0,0,0,0)
   row(2,0,0,1,0,1)
   row(3,0,1,0,0,1)
   row(4,0,1,1,1,0)
   row(5,1,0,0,0,1)
   row(6,0,1,1,0,0)
   row(7,1,1,0,1,0)
   row(8,1,1,1,1,1) ] with .n at last [].c+(0,-griddim)

 ] with .nw at 1st [].ne+(linewid,0)

[                           # cascade of n-bit adders
define(`nbitadder',
`FlipFlopX(wid 2*linewid fill_(0.9),
  $n$-\sf\scriptsize bit" "\sf\scriptsize adder,
   :, I:;I:;;;I:;I:, I:, O:;;;O: ) `$3'
 `"\ldots"' at last [].Chip.n + (0,arrowht)
 `"\ldots"' at last [].Chip.s - (0,arrowht)
 ifelse(`$1',,,
 `"$\;\;x_{$1}$" at last [].N6.end above
  "$`s_'{$1}$" at last [].S4.end below
  "$y_{$1}\;\;$" at last [].N5.end above')
 ifelse(`$2',,,
 `"$\quad{}x_{$2}$" at last [].N2.end above
  "$y_{$2}\quad\;\;$" at last [].N1.end above
  "$`s_'{$2}$" at last [].S1.end below ') 
 ')

P: nbitadder(0,n{-}1)
  {"$c_o$" at P.E1.end ljust }
  {"$c_n$" at P.W1.end above }
Q: nbitadder(n,2n{-}1, with .E1.end at P.W1.end)
  arrow left arrowht from Q.W1.end ht arrowht*4/5 wid arrowwid*5/4
  { "\ldots" at Here+(-10pt__,0) }
R: nbitadder(,kn{-}1, with .E1.end at Here-(20bp__,0))
  arrow left arrowht from R.W1.end ht arrowht*4/5 wid arrowwid*5/4
  {"$c_{kn}$" rjust } 

 ] with .nw at 1st [].sw+(0,-0.5)

.PE
