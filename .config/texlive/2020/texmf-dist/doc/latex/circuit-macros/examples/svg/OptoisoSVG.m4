.PS
# OptoisoSVG.m4
cct_init(svg_font(sans-serif,11bp__,3bp__))
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
 `{"svg_it(C)" ht 0.1 at last [].C above
   "svg_it(E)" at last [].E below
   ifinstr(`$1',B,`"svg_it(B)" at last [].B below')
   "svg_it(A)" at last [].A above
   "svg_it(K)" at last [].K below}')

Q: optoiso;      optlabels;    move
     {`"optoiso"' at last [].s+(0,-0.22)}
   optoiso(Rightorientation);  optlabels;  move
     {`"optoiso(R)"' at last [].s+(0,-0.22)}
   optoiso(B);  optlabels(B);  move
     {`"optoiso(B)"' at last [].s+(0,-0.22)}
   optoiso(RB); optlabels(B)
     {`"optoiso(RB)"' at last [].s+(0,-0.22)}

R: optoiso(C) with .nw at Q.sw+(0.33,-0.75); move 1
{"svg_it(1)" at R.Pin1 rjust; "svg_it(2)" at R.Pin2 rjust
 "svg_it(3)" wid 0.3 at R.Pin3 rjust}
{"svg_it(4)" at R.Pin4 ljust; "svg_it(5)" at R.Pin5 ljust
 "svg_it(6)" at R.Pin6 ljust }
{`"optoiso(C)"' at R.s below }
S: optoiso(RC)
{"svg_it(1)" at S.Pin1 ljust; "svg_it(2)" at S.Pin2 ljust
 "svg_it(3)" at S.Pin3 ljust }
{"svg_it(4)" at S.Pin4 rjust; "svg_it(5)" at S.Pin5 rjust
 "svg_it(6)" wid 0.3 at S.Pin6 rjust }
{`"optoiso(RC)"' at S.s below }

 command "</g>" # end font
.PE
