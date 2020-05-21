.PS
cct_init
#                           `opto([R|L][A|B])'
define(`opto',
`[{u = dimen_/2
 Q: bi_trans(up u*2,ifinstr(`$1',R,R),ifinstr(`$1',B,B)CBUdE)
 E: Q.E; C: Q.C; A:ifinstr(`$1',R,Q.e+(u*3/2,u),Q.w+(-u*3/2,u)); K: A-(0,u*2)
   ifinstr(`$1',B,line from Q.B to (Q.B,E); B: Here)
 D: diode(from A to K)
   arrow from D.c+(0,u/6) to Q.ifinstr(`$1',R,e,w)+(0,u/6) chop u/3 chop u/4
   arrow from last arrow.start-(0,u/3) to last arrow.end-(0,u/3)
 Enc: box rad u wid abs(C.x-A.x)+u*2 ht u*2 with .c at 0.5 between C and K
  `$2' }]')

Q1: opto
Q2: opto(type=B;orientation=Rightleft) with .w at Q1.e+(dimen_,0)

{"\sl C" at Q1.C above}
{"\sl C" at Q2.C above}
{"\sl A" at Q1.A above}
{"\sl A" at Q2.A above}
{"\sl E" at Q1.E below}
{"\sl E" at Q2.E below}
{"\sl K" at Q1.K below}
{"\sl K" at Q2.K below}
{"\sl B" at Q2.B below}

.PE

