.PS
# Optoiso.m4
cct_init
movewid = 0.25

#                           `optoiso([L|R][A|B|C])'
define(`optoiso',`ifinstr(`$1',C,
`[{ u = dimen_
    hd = u/5
 Q: bi_tr(up hd*4,ifinstr(`$1',R,R))
  line from Q.E ifinstr(`$1',R,left,right)(hd+u/3); Pin4: dot(,,1)
  line from Q.C to (Pin4,Q.C);                      Pin5: dot(,,1)
 T: (Q.B,Pin5)+(0,4*hd)
  line from Q.B to T then to (Pin5,T);              Pin6: dot(,,1)
 D: diode(from Pin6 +(ifinstr(`$1',R,+,-)(u/3+hd*8),0) down hd*4)
  line from D.start ifinstr(`$1',R,right,left) (hd*2+u/3); Pin1: dot(,,1)
  line from D.end to (Pin1,D.end);                         Pin2: dot(,,1)
  line from (D.end,Pin4) to (Pin1,Pin4) chop hd chop 0;    Pin3: dot(,,1)
 B: box wid hd*10 ht hd*10 with .c at 0.5 between Pin4 and Pin1
   arrow from B.c+(ifinstr(`$1',R,,-)hd*1.5,hd*1.5) to B.c chop 0 chop -0.7*hd
 F: (ifinstr(`$1',R,,-)hd*0.5,-hd*0.5)
   arrow from last arrow.start+(F.x,F.y) to last arrow.end+(F.x,F.y)
  `$2' }]',
`[{u = dimen_/2
 Q: bi_trans(up u*2,ifinstr(`$1',R,R),ifinstr(`$1',B,B)CBUdE)
 E: Q.E; C: Q.C; A:ifinstr(`$1',R,Q.e+(u*3/2,u),Q.w+(-u*3/2,u)); K: A-(0,u*2)
   ifinstr(`$1',B,line from Q.B to (Q.B,E); B: Here)
 D: diode(from A to K)
   arrow from D.c+(0,u/6) to Q.ifinstr(`$1',R,e,w)+(0,u/6) chop u/3 chop u/4
   arrow from last arrow.start-(0,u/3) to last arrow.end-(0,u/3)
 Enc: box rad u wid abs(C.x-A.x)+u*2 ht u*2 with .c at 0.5 between C and K
  `$2' }]')')

define(`optlabels',
 `{"\sl C" ht 0.1 at last [].C above
   "\sl E" at last [].E below
   ifinstr(`$1',B,`"\sl B" at last [].B below')
   "\sl A" at last [].A above
   "\sl K" at last [].K below}')

Q: optoiso;      optlabels;    move
     {`"\tt optoiso"' at last [].s+(0,-0.22)}
   optoiso(Rightorientation);  optlabels;  move
     {`"\tt optoiso(R)"' at last [].s+(0,-0.22)}
   optoiso(B);  optlabels(B);  move
     {`"\tt optoiso(B)"' at last [].s+(0,-0.22)}
   optoiso(RB); optlabels(B)
     {`"\tt optoiso(RB)"' at last [].s+(0,-0.22)}

R: optoiso(C) with .nw at Q.sw+(0.33,-0.75); move 1
{"\sl 1" at R.Pin1 rjust; "\sl 2" at R.Pin2 rjust
 "\sl 3" wid 0.3 at R.Pin3 rjust}
{"\sl 4" at R.Pin4 ljust; "\sl 5" at R.Pin5 ljust
 "\sl 6" at R.Pin6 ljust }
{`"\tt optoiso(C)"' at R.s below }
S: optoiso(RC)
{"\sl 1" at S.Pin1 ljust; "\sl 2" at S.Pin2 ljust
 "\sl 3" at S.Pin3 ljust }
{"\sl 4" at S.Pin4 rjust; "\sl 5" at S.Pin5 rjust
 "\sl 6" wid 0.3 at S.Pin6 rjust }
{`"\tt optoiso(RC)"' at S.s below }

.PE
