.PS
# `SourcesSVG.m4'
cct_init(svg_font(sans-serif,11bp__))
textwid = 0.7
movewid = 2pt__
moveht = 0.275
define(`NL',`; move down $1; right_')
{
   {source     ; move ; "`source'" ljust} NL
   {source(,I) ; move ; "`source(,I)'" ljust} NL
   {source(,i) ; move ; "`source(,i)'" ljust} NL
   {source(,V) ; move ; "`source(,V)'" ljust} NL
   {source(,v) ; move ; "`source(,v)'" ljust} NL
   {source(,AC); move ; "`source(,AC)'" ljust} NL
   {source(,X) ; move ; "`source(,X)'" ljust} NL
   {source(,F) ; move ; "`source(,F)'" ljust} NL
   {source(,G) ; move ; "`source(,G)'" ljust} NL
   {source(,Q) ; move ; "`source(,Q)'" ljust} NL(0.3)
   {proximity ; move ;  "`proximity" ljust "= consource(,P)'" ljust}
}
   move right_ 2.0
{
   {source(,,0.4) ; move ;  "`source(,,0.4)'" ljust} NL(0.35)
   {source(,P) ; move ; "`source(,P)'" ljust} NL
   {source(,U) ; move ; "`source(,U)'" ljust} NL
   {source(,H) ; move ; "`source(,H)'" ljust} NL
   {source(,R) ; move ; "`source(,R)'" ljust} NL
   {source(,S) ; move ; "`source(,S)'" ljust} NL
   {source(,T) ; move ; "`source(,T)'" ljust} NL
   {source(,L) ; move ; "`source(,L)'" ljust} NL
   {source(,B) ; move ; "`source(,B)'" ljust} NL
   {nullator   ; move ; "`nullator'" ljust} NL(moveht*0.8)
   {norator    ; move ; "`norator'" ljust}
}
   move right_ 2.0
   {source(,N) ; move ; "`source(,N)'" ljust} NL
   {source(,"svg_micro(A)"); move; "`source(,\"svg_micro(A)\")'" \
    wid 1.7 at Here ljust}NL(0.31)
   {consource     ; move ;  "`consource'" ljust }    NL(0.32)
   {consource(,I) ; move ;  "`consource(,I)'" ljust} NL(0.32)
   {consource(,i) ; move ;  "`consource(,i)'" ljust} NL(0.32)
   {consource(,V) ; move ;  "`consource(,V)'" ljust} NL(0.32)
   {consource(,v) ; move ;  "`consource(,v)'" ljust} NL(0.3)
   {battery       ; move ;  "`battery'" ljust}       NL
   {battery(,3,R) ; move ;  "`battery(,3,R)'" ljust}

 command "</g>" # end font
.PE
