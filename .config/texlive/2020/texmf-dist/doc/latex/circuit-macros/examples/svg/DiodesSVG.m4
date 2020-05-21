.PS
# `Diodes.m4'
cct_init(svg_font(sans-serif,11bp__))
movewid = 2pt__
{  {diode ; move ; "`diode'" ljust}
   move down 0.2; right_
   {diode(,S) ; move ; "`diode(,S)'" ljust}
   move down 0.2; right_
   {diode(,V) ; move ; "`diode(,V)'" ljust}
   move down 0.2; right_
   {diode(,v) ; move ; "`diode(,v)'" ljust}
   move down 0.2; right_
   {diode(,w) ; move ; "`diode(,w)'" ljust}
   move down 0.2; right_
   {diode(,B) ; move ; "`diode(,B)'" ljust}
   move down 0.2; right_
   {diode(,G) ; move ; "`diode(,G)'" ljust}
   }

   move right_ 2.0
{  
   {diode(,K) ; move ; "`diode(,K)'" ljust}
   move down 0.2; right_
   {diode(,ZK) ; move ; "`diode(,ZK)'" ljust}
   move down 0.2; right_
   {diode(,CR) ; move ; "`diode(,CR)'" ljust}
   move down 0.2; right_
   {diode(,L) ; move ; "`diode(,L)'" ljust}
   move down 0.2; right_
   {diode(,F) ; move ; "`diode(,F)'" ljust}
   move down 0.2; right_
   {diode(,Sh) ; move ; "`diode(,Sh)'" ljust}
   move down 0.2; right_
   {diode(,D) ; move ; "`diode(,D)'" ljust}
   }

   move right_ 2.0
{  {diode(,Z,RE) ; move ; "`diode(,Z,RE)'" ljust; move right 1.5}
   move down 0.25; right_
   {diode(,T) ; move ; "`diode(,T)'" ljust}
   move down 0.30; right_
   {diode(,P) ; move ; "`diode(,P)'" ljust}
   move down 0.30; right_
   {diode(,LE) ; move ; "`diode(,LE)'" ljust}
   move down 0.15; right_
   {diode(,LER) ; move ; "`diode(,LER)'" ljust}
   }

 command "</g>" # end font
.PE
