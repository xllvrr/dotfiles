.PS
# `PconnSVG.m4'
cct_init(svg_font(sans-serif,11bp__))

P1: [ 
  C1: pconnex(,A)
   thinlines_
   arrow <- left 0.2 from C1.H.w; "svg_it(H)" wid 10bp__ rjust
   thicklines_
   `"pconnex(,A)"' at last [].s below
  C2: pconnex(,AF) with .w at C1.e+(0.3,0)
   thinlines_
   arrow <- right 0.2 up 0.1 from C2.H.e; "svg_it(H)" ljust
   N: box invis wid (C2.w.x-C1.e.x)/2 ht C1.N.ht \
    with .n at 0.5 between C1.ne and C2.nw "svg_it(N)"
   arrow from N.w to C1.N.e
   arrow from N.e to C2.N.w
   G: box invis wid N.wid ht N.ht with .n at (N,C1.N.s) "svg_it(G)"
   arrow from G.w to C1.G.e
   arrow from G.e to C2.G.w
   `"(,AF)"' at last [].s below
  C03: pconnex(,AC) with .w at C2.e+(0.25,0)
   `"(,AC)"' at last [].s below
  C3: pconnex(,ACF) with .w at last [].e+(0.2,0)
   `"(,ACF)"' at last [].s below

  C5: pconnex(U,D) with .w at last [].e+(0.25,0)
   `"(U,D)"' at last [].s below
  C6: pconnex(U,DF) with .w at last [].e+(0.25,0)
   `"(U,DF)"' at last [].s below
  C7: pconnex(U,J) with .w at last [].e+(0.25,0)
   `"(U,J)"' at last [].s below
  C8: pconnex(U,JF) with .w at last [].e+(0.25,0)
   `"(U,JF)"' wid 21bp__ at last [].s below
  ]

P2: [ 
  C9: pconnex(,G)
   `"(,G)"' at last [].s below
  C91: pconnex(,GF) with .w at last [].e+(0.2,0)
   `"(,GF)"' at last [].s below
  C92: pconnex(L,GF) with .w at last [].e+(0.2,0)
   `"(L,GF)"' at last [].s below
  C10: pconnex(,GC) with .w at last [].e + (0.2,0)
   `"(,GC)"' at last [].s below
  C12: pconnex(,GCF) with .w at last [].e + (0.2,0)
   `"(,GCF)"' at last [].s below
] with .nw at P1.C1.sw + (0,-0.35)

P3:[
  C4: pconnex(,P)
   `"(,P)"' at last [].s below
  C11: pconnex(,PF) with .w at last [].e+(0.2,0)
   `"(,PF)"' at C11.s below
] with .nw at P2.C9.sw + (0,-0.35)


 command "</g>" # end font
.PE
