.PS
# `Autologix.m4'
log_init

A: [
F: Autologix(
    And(Or(x3,x1,~x0),Nor(Or(x3,Not(x2),~x1,x0),
                          And(Or(x2,x1,~x0),Xor(x2,~x1))));
    ~x0;
    And(~x0,Nand(~x1,x3))@ with .nw at 2nd last [].sw+(0,-dimen_*2/3);
    Not(x1))
  for_(1,4,1,`"\sl Out`'m4x" at F.Out`'m4x ljust')
  Loopover_(`v_', `"\sl In$v_$" at F.In`'v_ above ',x0,x1,x3)
# for_(1,3,1,`"\sl In`'m4x=" at F.In`'m4x+(0,10pt__) above')
  "\sl In$x2$" at F.Inx2 +(-10pt__,0) above
# "\sl In4=" at F.In4+(-10pt__,10pt__) above
  for_(1,3,1,`"\sl In`'m4x" at F.In`'m4x')
  "\sl In17" at F.In17
G: Autologix(
    And(Or(x3,x1,~x0),Nor(Or(x3,Not(x2),~x1,x0),
                          And(Or(x2,x1,~x0),Xor(x2,~x1))));
    ~x0;
    And(~x0,Nand(~x1,x3))@ with .nw at 2nd last [].sw+(0,-dimen_*2/3);
    Not(x1),
    N) with .Out1 at F.Out1+(6*dimen_,0)
  for_(1,4,1,`"\sl Out`'m4x" at G.Out`'m4x ljust')
  "\sl In1" at G.In1 rjust
  "\sl In2" at G.In2 rjust
  "\sl In`'m4nargs" at G.In`'m4nargs rjust
  "\tt\ldots ,N)" wid 0.25 at (G.Out2,G.Out4) rjust
]

S: `"\def\tld{\char126}\shortstack[l]{\tt Autologix(\\\tt 
   \tt\quad{}And(Or(x3,x1,\tld{}x0),Nor(Or(x3,Not(x2),\tld{}x1,x0),
                         And(Or(x2,x1,\tld{}x0),Xor(x2,\tld{}x1))));\\
   \tt\quad{}\tld{}x0;\\
   \tt\quad{}And(\tld{}x0,Nand(\tld{}x1,x3))@
     with .nw at 2nd last [].sw+(0,-dimen\_*2/3);\\
   \tt\quad{}Not(x1))}"' \
     ht 58pt__ wid 520pt__ with .nw at A.sw+(0,-15pt__) 

B: [
F: #utologix(
    And(Or(x3,x1,~x0),Nor(Or(x3,Not(x2),~x1,x0),
                          And(Or(x2,x1,~x0),Xor(x2,~x1))));
    ~x0;
    And(~x0,Nand(~x1,x3))@ with .ne at 2nd last [].se+(0,-dimen_*2/3);
    Not(x1),
    M)
  for_(1,4,1,`"\sl Out`'m4x" at F.Out`'m4x rjust')
  Loopover_(`v_', `"\sl In$v_$" at F.In`'v_ above ',x0,x1,x3)
  "\sl In$x2$" at F.Inx2 +(10pt__,0) above
 `"\tt\ldots @ with .ne at 2nd last [].se+(0,-dimen\_*2/3);Not(x1),M)"'\
  wid 200pt__ at F.s below
] with .n at S.s+(0,-0.1)

.PE
